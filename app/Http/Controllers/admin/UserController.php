<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;



class UserController extends Controller
{
    public function index(Request $request){
        $users = User::where('role', 1)->latest();
        // $users = $users->get(); if we use paginate then then we not user this get().
        //Pagination demo
        if(!empty($request->get('keyword'))){
            $users = $users->where('name','like','%'.$request->get('keyword').'%');
            $users = $users->orWhere('email','like','%'.$request->get('keyword').'%');
        }
        $users = $users->paginate(3);
        
        return view('admin.users.list',compact('users'));
    }

    public function create(Request $request) { 

        return view('admin.users.create');
    }

    public function store(Request $request){
        //validate data
        $validator = Validator::make($request->all(),[
            'name'=>'required',
            'email'=>'required|email|unique:users',
            'password' => 'required|min:5',
            'phone' => 'required',
        ]);

        if ($validator->passes()) {

            $user = new User();
            $user->name = $request->name;
            $user->email = $request->email;
            $user->password = Hash::make($request->password);
            $user->phone = $request->phone;
            $user->status = $request->status;
            $user->save();
            
            $request->session()->flash('success', 'User added successfully');

            return response()->json([
                'status' => true,
                'message' => 'User added successfully'
            ]);

        } else{
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }
    }

    public function edit(Request $request,$userId){
        $user = User::find($userId);
        if(empty($user))
        {
            session()->flash('error', 'User not Found');
            return redirect()->route('users.index');
        } 
        return view('admin.users.edit', compact('user'));
    }

    public function update(Request $request, $userId){

        $user = User::find($userId);
        if(empty($user))
        {
            session()->flash('error', 'User not Found');
            return response()->json([
                'status' => true,
                'message' => 'User not Found'
            ]);

        } 
        //validate data
        $validator = Validator::make($request->all(),[
            'name'=>'required',
            'email'=>'required|email|unique:users,email,'.$userId.'id',
            
            'phone' => 'required',
        ]);

        if ($validator->passes()) {

            $user->name = $request->name;
            $user->email = $request->email;

            if($request->password != ''){
                $user->password = Hash::make($request->password);
            }
    
            $user->phone = $request->phone;
            $user->status = $request->status;
            $user->save();
            
            $request->session()->flash('success', 'User updated successfully');

            return response()->json([
                'status' => true,
                'message' => 'User updated successfully'
            ]);

        } else{
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }
    }

    public function destroy($userId){
        $user = User::find($userId);
        if(empty($user))
        {
            session()->flash('error', 'User not found');
            return response()->json([
                'status' => true,
                'message' => 'User not found'
            ]);
        } 

        $user->delete();

        session()->flash('success', 'User deleted successfully');

        return response()->json([
            'status' => true,
            'message' => 'User deleted successfully'
        ]);
    }
}
