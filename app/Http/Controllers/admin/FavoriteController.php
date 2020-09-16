<?php

namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Post;

class FavoriteController extends Controller
{
    public function index(){
        $posts= Auth::user()->favorite_posts;
        return view('admin.favorite.index',compact('posts'));
    }

    public function show(Post $post){
        return view('admin.favorite.show',compact('post'));
    }

    public function remove($post){
        Auth::user()->favorite_posts()->detach($post);
        Toastr()->success('Post successfully removed from your favorite list.','Success');
        return redirect()->back();
    }
}
