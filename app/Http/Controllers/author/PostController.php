<?php

namespace App\Http\Controllers\author;

use App\Post;
use App\User;
use App\Category;
use App\Tag;
use App\Notifications\NewAuthorPost;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Carbon;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Notification;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $posts= Auth::user()->posts()->latest()->get();
        return view('author.post.index', compact('posts'));
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
        return view('author.post.create', compact('categories', 'tags'));
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
        $post->is_approved= 0;
        $post->save();

        $post->categories()->attach($request->categories);
        $post->tags()->attach($request->tags);

        $users= User::where('role_id',1)->get();
        Notification::send($users, new NewAuthorPost($post));

        return redirect('author/post')->with('success','Post created successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function show(Post $post)
    {
        if(Auth::id() != $post->user_id){            
            return redirect()->back()->with('success','Access Denied!!');
        }
        return view('author.post.show', compact('post'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function edit(Post $post)
    {
        if(Auth::id() != $post->user_id){            
            return redirect()->back()->with('success','Access Denied!!');
        }
        $categories= Category::all();
        $tags= Tag::all();
        return view('author.post.edit', compact('post','categories', 'tags'));
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
        $post->is_approved= 0;
        $post->save();

        $post->categories()->sync($request->categories);
        $post->tags()->sync($request->tags);

        return redirect('author/post')->with('success','Post updated successfully!');
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
