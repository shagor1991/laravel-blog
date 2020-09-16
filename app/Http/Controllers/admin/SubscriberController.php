<?php

namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Subscriber;

class SubscriberController extends Controller
{
    public function index(){
    	$subscribers= Subscriber::latest()->get();
    	return view('admin.subscriber.index',compact('subscribers'));
    }

    public function destroy($id){
    	$subscriber=Subscriber::find($id);
    	$subscriber->delete();

    	return redirect()->back()->with('success','Subscriber has been removed!');
    }
}
