<?php

namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Category;

use Illuminate\Support\Carbon;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Storage;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories= Category::latest()->get();

        return view('admin.category.index',compact('categories'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.category.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        echo "<pre>";
        print_r($request->file('cimage'));
        exit;
        $request->validate([
            'name' => 'required',
            'cimage' => 'required|mimes:jpeg,png,jpg'
        ]);

        // echo "<pre>";
        $image= $request->file('cimage');

        $slug= str_slug($request->name);
        if(isset($image)){

            $currenDate= Carbon::now()->toDateString();
            $imagename= $slug.'-'.$currenDate.'-'.uniqid().'.'.$image->getClientOriginalExtension();

            if(!Storage::disk('public')->exists('category')){
                Storage::disk('public')->makeDirectory('category');
            }

            $category= Image::make($image)->resize('1600','479')->save($image->getClientOriginalExtension());
            Storage::disk('public')->put('category/'.$imagename, $category);

            if(!Storage::disk('public')->exists('category/slider')){
                Storage::disk('public')->makeDirectory('category/slider');
            }

            $slider= Image::make($image)->resize('500','333')->save($image->getClientOriginalExtension());
            Storage::disk('public')->put('category/slider/'.$imagename, $slider);

        }else{
            $imagename='default.png';
        }
        
        $category= new Category;
        $category->name= $request->name;
        $category->slug= $slug;
        $category->image= $imagename;
        $category->save();

        return redirect('admin/category')->with('success','Category saved successfully!');

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $category= Category::find($id);        

        return view('admin.category.edit', compact('category'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required',
            'image' => 'mimes:jpeg,png,jpg'
        ]);

        $image= $request->file('cimage');
        $slug= str_slug($request->name);

        $category= Category::find($id);

        if(isset(($image))){


            $currenDate= Carbon::now()->toDateString();
            $imagename= $slug.'-'.$currenDate.'-'.uniqid().'.'.$image->getClientOriginalExtension();

            // checking:is category directory exists

            if(!Storage::disk('public')->exists('category')){
                Storage::disk('public')->makeDirectory('category');
            }

            // Delete old file
            if(Storage::disk('public')->exists('category/'.$category->image)){
                Storage::disk('public')->delete('category/'.$category->image);
            }

            // save new image file
            $categoryimage= Image::make($image)->resize('1600','479')->save($image->getClientOriginalExtension());
            Storage::disk('public')->put('category/'.$imagename, $categoryimage);

            
            // checking:is category slider directory exists
            if(!Storage::disk('public')->exists('category/slider')){
                Storage::disk('public')->makeDirectory('category/slider');
            }

            // Delete old file
            if(Storage::disk('public')->exists('category/slider/'.$category->image)){
                Storage::disk('public')->delete('category/slider/'.$category->image);
            }

            // save new image file
            $categoryimage= Image::make($image)->resize('500','333')->save($image->getClientOriginalExtension());
            Storage::disk('public')->put('category/slider/'.$imagename, $categoryimage);


        }else{
            $imagename= $category->image;
        }

        $category->name= $request->name;
        $category->slug= $slug;
        $category->image= $imagename;
        $category->save();

        return redirect('admin/category')->with('success','Category updated successfully!');


    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $category= Category::find($id);

        if(Storage::disk('public')->exists('category/'.$category->image)){
            Storage::disk('public')->delete('category/'.$category->image);
        }

        if(Storage::disk('public')->exists('category/slider/'.$category->image)){
            Storage::disk('public')->delete('category/slider/'.$category->image);
        }

        $category->delete();

        return redirect('admin/category')->with('success','Category deleted!');
    }
}
