<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Yoeunes\Toastr\Facades\Toastr;

class FavoriteController extends Controller
{
    public function add($post){
        $isFavorite= Auth::user()->favorite_posts()->where('post_id',$post)->count();
        
        if($isFavorite==0){
            Auth::user()->favorite_posts()->attach($post);
            Toastr()->success('Post successfully added to your favorite list.','Success');
            return redirect()->back();
        }else{
            Auth::user()->favorite_posts()->detach($post);
            Toastr()->success('Post successfully removed from your favorite list.','Success');
            return redirect()->back();
        }
    }
    
}
