<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;
use Illuminate\Support\Facades\Session;

class PostController extends Controller
{
    public function index(){
        $posts= Post::latest()->paginate(6);
        return view("posts",compact('posts'));
    }
    public function details($slug){

        $post= Post::where('slug',$slug)->first();
        $randomposts= Post::all()->random(3);

        $blogKey= 'blog_'.$post->id;  
        if(!Session::has($blogKey)){
            $post->increment('view_count');
        }
        return view('post_details', compact('post','randomposts'));
    }
}
