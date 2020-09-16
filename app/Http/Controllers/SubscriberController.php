<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Subscriber;

class SubscriberController extends Controller
{
    public function store(Request $request){
    	$request->validate([
    		'email'	=>'required|email|unique:subscribers'
    	]);

    	$subscriber= new Subscriber;
    	$subscriber->email= $request->email;
		$subscriber->save();
		Toastr()->success('You have been subscribed!');
    	return redirect()->back()->with('success','You have been subscribed!');
    }
}
