<?php

namespace App\Http\Controllers\admin;

use App\Post;
use App\Category;
use App\Tag;
use App\User;
use App\Notifications\AuthorPostApproved;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Carbon;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Auth;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $posts= Post::latest()->get();

        return view('admin.post.index', compact('posts'));
    }


    public function pending(){
        $posts= Post::where('is_approved',0)->get();
        return view('admin.post.pending', compact('posts'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories= Category::all();
        $tags= Tag::all();
        return view('admin.post.create', compact('categories', 'tags'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required',
            'image' => 'required',
            'categories' => 'required',
            'tags' => 'required',
            'body' => 'required'
        ]);

        $image= $request->file('image');

        $slug= str_slug($request->title);

        if(isset($image)){
            $today= Carbon::now()->toDateString();
            $imagename= $slug.'-'.$today.'-'.uniqid().'.'.$image->getClientOriginalExtension();

            if(!Storage::disk('public')->exists('post')){
                Storage::disk('public')->makeDirectory('post');
            }

            $postimage=Image::make($image)->resize(1600,1066)->save($image->getClientOriginalExtension());

            Storage::disk('public')->put('post/'.$imagename, $postimage);


        }else{
            $imagename='default.png';
        }

        $post           = new Post;
        $post->user_id  = Auth::id();
        $post->title    = $request->title;
        $post->slug     = $slug;
        $post->image    = $imagename;
        $post->body     = $request->body;
        $post->status   = $request->status;
        $post->is_approved= 1;
        $post->save();

        $post->categories()->attach($request->categories);
        $post->tags()->attach($request->tags);

        return redirect('admin/post')->with('success','Post created successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function show(Post $post)
    {
        return view('admin.post.show', compact('post'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function edit(Post $post)
    {
        $categories= Category::all();
        $tags= Tag::all();
        return view('admin.post.edit', compact('post','categories', 'tags'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Post $post)
    {

        $request->validate([
            'title' => 'required',
            'image' => 'image',
            'categories' => 'required',
            'tags' => 'required',
            'body' => 'required'
        ]);

        $image= $request->file('image');

        $slug= str_slug($request->title);


        if(isset($image)){

            $today= Carbon::now()->toDateString();
            $imagename= $slug.'-'.$today.'-'.uniqid().'.'.$image->getClientOriginalExtension();

            if(!Storage::disk('public')->exists('post')){
                Storage::disk('public')->makeDirectory('post');
            }

            // Delete old image


            if(Storage::disk('public')->exists('post/'.$post->image)){
                Storage::disk('public')->delete('post/'.$post->image);
            }

            $postimage=Image::make($image)->resize(1600,1066)->save($image->getClientOriginalExtension());

            Storage::disk('public')->put('post/'.$imagename, $postimage);


        }else{
            $imagename=$post->image;
        }

        
        $post->user_id  = Auth::id();
        $post->title    = $request->title;
        $post->slug     = $slug;
        $post->image    = $imagename;
        $post->body     = $request->body;
        $post->status   = $request->status;
        $post->is_approved= 1;
        $post->save();

        $post->categories()->sync($request->categories);
        $post->tags()->sync($request->tags);

        return redirect('admin/post')->with('success','Post updated successfully!');
    }

    public function approval($id){
        $post= Post::find($id);

        if($post->is_approved ==1){
            $post->is_approved=0;
            $post->save();            
            return redirect()->back()->with('success','The Post has been disapproved!');
        }else{
            $post->is_approved=1;
            $post->save();
            $post->user->notify(new AuthorPostApproved($post));
            return redirect()->back()->with('success','The Post has been approved!');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function destroy(Post $post)
    {
        if(Storage::disk('public')->exists('post/'.$post->image)){
            Storage::disk('public')->delete('post/'.$post->image);
        }

        $post->categories()->detach();
        $post->tags()->detach();

        $post->delete();

        return redirect('admin/post')->with('success','Post deleted successfully!');
    }
}
