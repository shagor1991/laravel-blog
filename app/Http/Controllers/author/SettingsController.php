<?php

namespace App\Http\Controllers\author;

use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Hash;

class SettingsController extends Controller
{
    public function index(){
        $user= User::find(Auth::id());
        return view('author.settings.index', compact('user'));
    }

    public function update_profile(Request $request){

        
        $request->validate([
            'name' => 'required',
            'email' => 'required',
            'image' => 'mimes:jpeg,png,jpg'
        ]);
        
        $image= $request->file('image');

        $slug= str_slug($request->name);
        $user= User::find(Auth::id());



        if(isset($image)){
            
            $currentDate= Carbon::now()->toDateString();
            $imagename= $slug.'-'.$currentDate.'-'.uniqid().'.'.$image->getClientOriginalExtension();
            
            if(!Storage::disk('public')->exists('profile')){
                Storage::disk('public')->makeDirectory('profile');
            }

            // Delete old profile image
            if(Storage::disk('public')->exists('profile/'.$user->image)){
                Storage::disk('public')->delete('profile/'.$user->image);
            }
            

            $profile_image= Image::make($image)->resize('500','500')->save($image->getClientOriginalExtension());
            Storage::disk('public')->put('profile/'.$imagename, $profile_image);


        }else{
            
            $imagename= $user->image;
        }

        $user->name= $request->name;
        $user->email= $request->email;
        $user->image= $imagename;
        $user->about= $request->about;
        $user->save();
        
        return redirect('author/settings')->with('success','Profile data updated!');

    }

    public function update_password(Request $request){
        $request->validate([
            'old_password' => 'required',
            'password' => 'required|confirmed',
            'password_confirmation' => 'required'
        ]);

        $user=User::find(Auth::id());
        
        if(Hash::check($request->old_password, $user->password)){
            if(!Hash::check($request->password, $user->password)){
                $user->password= Hash::make($request->password);
                $user->save();
                Auth::logout();
                
                Toastr()->success('Password Changed');
                return redirect()->back();
            }else{
                
                Toastr()->success('New Password and Old password should not be same!!');
                return redirect()->back();
            }

        }else{
           
            Toastr()->success('Current password is not correct');
            return redirect()->back();
        }



    }
}
