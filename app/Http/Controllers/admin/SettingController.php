<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;

class SettingController extends Controller
{
    public function showChangePasswordForm(){
        return view('admin.change-password');
    }

    public function processChangePasswordForm(Request $request){

        $validator = Validator::make($request->all(), [
            'old_password' => 'required',
            'new_password' => 'required|min:5',
            'confirm_password' => 'required|same:new_password',
        ]);

        $id = Auth::guard('admin')->user()->id;
        $admin = User::where('id', $id)->first();
        
        if ($validator->passes()) {

            if(!Hash::check($request->old_password , $admin->password)){
                session()->flash('error', 'Your old password is incorrect, Please try again!'); 
                return response()->json([
                        'status' => true,
                ]);
            }
            
            User::where('id',$id)
              ->update(['password'=> Hash::make($request->new_password)]);


            $request->session()->flash('success', 'You have changed password successfully');

            return response()->json([
                'status' => true,
            ]);

        } else{
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }
    }

}
