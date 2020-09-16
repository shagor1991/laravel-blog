<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Role;
use App\User;
use App\Post;
use App\Category;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        // $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $categories= Category::all();
        $posts= Post::latest()->take(6)->get();
        return view('welcome',compact('categories','posts'));
    }

    public function user(){
        // $user= User::find(2)->role;

        return $user= Auth::user()->role->name;

        // echo "<pre>";
        // print_r($user);
    }

    public function role(){
        $role= Role::find(1)->users;

        echo "<pre>";
        print_r($role);
    }
}
