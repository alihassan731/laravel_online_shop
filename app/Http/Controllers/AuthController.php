<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use App\Models\Order;
use App\Models\Country;
use App\Models\OrderItem;
use App\Models\CustomerAddress;
use App\Mail\ResetPasswordEmail;
use App\Models\Wishlist;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Mail;

class AuthController extends Controller
{
    public function login(){
        return view('front.account.login');
    }

    public function register(){
        return view('front.account.register');
    }
    
    public function processRegister(Request  $request){
        $validator = Validator::make($request->all(),[
            'name' => 'required|min:3',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:5|confirmed'
        ]);

        if  ($validator -> passes()){

            $user = new User;
            $user->name= $request->name;
            $user->email= $request->email;
            $user->phone= $request->phone;
            $user->password= Hash::make($request->password);
            $user->save();

            session()->flash('success','You have been registered successfully.');


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

    public function authenticate(Request $request){
        $validator = Validator::make($request->all(),[
            'email' => 'required|email',
            'password' => 'required'
        ]);

        if  ($validator -> passes()){
            if(Auth::attempt(['email'=>$request->email,'password'=>$request->password], $request->get('remember'))){

                if(session()->has('url.intended')){
                    return redirect(session()->get('url.intended'));
                }

                return redirect()->route('account.profile');
            } else{
                // session()->flash('error','Either Email/Password is incurrect.');
                return redirect()->route('account.login')
                    ->withInput($request->only('email'))
                    ->with('error','Either Email/Password is incorrect.');
            }
        } else{
            return redirect()->route('account.login')
            ->withErrors($validator)
            ->withInput($request->only('email'));
        }
    }

    public function profile(){
        $data = [];
        $userId = Auth::user()->id;
        $countries = Country::orderBy('name', 'ASC')->get();
        $data['countries'] = $countries;

        $user = User::where('id', $userId)->first();
        $data['user'] = $user;

        $address = CustomerAddress::where('user_id',$userId)->first();
        $data['address'] = $address;

        return view('front.account.profile', $data);
    }

    public function updateProfile(Request $request){
         $userId = Auth::user()->id;
        $validator = Validator::make($request->all(),[
            'name' => 'required|min:3',
            'email' => 'required|email|unique:users,email,'.$userId.',id',
            'phone' => 'required',
        ]);
        if  ($validator -> passes()){
            $user = User::find($userId);
            $user->name= $request->name;
            $user->email= $request->email;
            $user->phone= $request->phone;
            $user->save();

            session()->flash('success','Profile updated successfully.');
            return response()->json([
                'status' => true,
                'message' => 'Profile updated successfully'
            ]);

        } else{
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }
    }

    public function updateAddress(Request $request){
        $userId = Auth::user()->id;

        $validator = Validator::make( $request->all(), [
            'first_name' => 'required|min:5',
            'last_name' => 'required',
            'email' => 'required|email',
            'country_id' => 'required',
            'address' => 'required|min:20',
            'city' => 'required',
            'state' => 'required',
            'zip' => 'required',
            'mobile' => 'required',
        ]);
       
       if  ($validator -> passes()){
        //    $user = User::find($userId);
        //    $user->name= $request->name;
        //    $user->email= $request->email;
        //    $user->phone= $request->phone;
        //    $user->save();

        CustomerAddress::updateOrCreate(
            ['user_id' => $userId],
            [
                'user_id' => $userId,
                'first_name' => $request->first_name,
                'last_name' => $request->last_name,
                'email' => $request->email,
                'mobile' => $request->mobile,
                'country_id' => $request->country_id,
                'address' => $request->address,
                'apartment' => $request->apartment,
                'city' => $request->city,
                'state' => $request->state,
                'zip' => $request->zip,
            ]
        );

           session()->flash('success','Address updated successfully.');
           return response()->json([
               'status' => true,
               'message' => 'Address updated successfully'
           ]);

       } else{
           return response()->json([
               'status' => false,
               'errors' => $validator->errors()
           ]);
       }
   }
    
    public function logout(){
        Auth::logout();
        return redirect()->route('account.login')->with('success','You successfully logged out!');
    }

    public function orders(){
        $data = [];
        $user = Auth::user();
        $orders = Order::where('user_id',$user->id)->orderBy('created_at','DESC')->get();
        $data['orders'] = $orders;
        return view('front.account.order',$data);
    }

    public function onderDetail($id){
        $data = [];
        $user = Auth::user();
        $order = Order::where('user_id',$user->id)->where('id',$id)->first();
        $data['order'] = $order;

        $orderItems = OrderItem::where('order_id',$id)->get();
        $data['orderItems'] = $orderItems;

        $orderItemsCount = OrderItem::where('order_id',$id)->count();
        $data['orderItemsCount'] = $orderItemsCount;
        
        return view('front.account.order-detail',$data);
    }

    public function wishlist(){
        $wishlists = Wishlist::where( 'user_id' , Auth::user()->id)->with('product')->latest()->get() ;
        $data = [];
        $data['wishlists'] = $wishlists;
        return view('front.account.wishlist',$data);
    }

    public function removeProdcutFromWishlist(Request $request){
        $wishlist = Wishlist::where('user_id', Auth::user()->id)->where('product_id', $request->id)->first();

        if($wishlist == null){
            session()->flash('error', 'Product already removed');
             return response()->json([
                'status' => true,
             ]);
        } else{
            Wishlist::where('user_id', Auth::user()->id)->where('product_id', $request->id)->delete();
            session()->flash('success', 'Product removed from wishlist successfully');
             return response()->json([
                'status' => true,
             ]);
        }
    }

    public function showChangePasswordForm(){
        return view('front.account.change-password');
    }

    public function changePassword(Request $request){

        $validator = Validator::make($request->all(), [
            'old_password' => 'required',
            'new_password' => 'required|min:5',
            'confirm_password' => 'required|same:new_password',
        ]);

        if ($validator->passes()) {
            $user = User::select('id','password')->where('id', Auth::user()->id)->first();
            if(!Hash::check($request->old_password , $user->password)){
                session()->flash('error', 'Your old password is incorrect, Please try again!'); 
                return response()->json([
                        'status' => true,
                ]);
            }
            
            User::where('id',$user->id)
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

    // For show the forget  password form
    public function forgetPassword(){
        return  view('front.account.forget-password');
    }

    public function processForgetPassword(Request $request){
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:users,email', 
        ]);
        if ($validator->fails()) {
            return redirect()->route('account.forgetPassword')->withInput()->withErrors($validator);
        }

        $token = Str::random(60);

        \DB::table('password_reset_tokens')->where('email', $request->email)->delete();

        \DB::table('password_reset_tokens')->insert([
            'email' => $request->email,
            'token' => $token,
            'created_at' => now(),
        ]);

        $user = User::where('email',$request->email)->first();

        $formData = [
            'token' => $token,
            'user' => $user,
            'mailSubject' => 'You have requested to reset your password'
        ];

        // Send email here 
        Mail::to($request->email)->send(new ResetPasswordEmail($formData));
        return redirect()->route('account.forgetPassword')->with('success','Please check your email to reset your password');
    }

    public function resetPassword($token){
        $tokenExit = \DB::table('password_reset_tokens')->where('token', $token)->first();
        if($tokenExit == null){
            return redirect()->route('account.forgetPassword')->with('error','Invalid Request');
        }
        return  view('front.account.reset-password',[
            'token' => $token
        ]);
    }

    public function processResetPassword(Request $request){
        $token =  $request->token;
        $tokenExit = \DB::table('password_reset_tokens')->where('token', $token)->first();
        if($tokenExit == null){
            return redirect()->route('account.forgetPassword')->with('error','Invalid Request');
        }

        $user = User::where('email', $tokenExit->email)->first();

        $validator = Validator::make($request->all(), [
            'new_password' => 'required|min:5', 
            'confirm_password' => 'required|same:new_password', 
        ]);
        if ($validator->fails()) {
            return redirect()->route('account.resetPassword',$token)->withErrors($validator);
        }

       User::where('id', $user->id)->update([
            'password' => Hash::make($request->new_password)
       ]);

       \DB::table('password_reset_tokens')->where('email', $user->email)->delete();

        return redirect()->route('account.login')->with('success','You have successfully  reset your password.');
    }
}
