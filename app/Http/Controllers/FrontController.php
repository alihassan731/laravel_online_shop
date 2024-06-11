<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Wishlist;
use Illuminate\Support\Facades\Validator;
use App\Models\Page;
use App\Models\User;
use App\Mail\ContactEmail;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

class FrontController extends Controller
{
    public function index(){

        $products = Product::where('is_featured','Yes')
                    ->orderBy('id','DESC')
                    ->where('status','1')
                    ->take(8)->get();
        $data['featuredProducts'] = $products;

        $latestProducts = Product::orderBy('id','DESC')
                          ->where('status','1')
                          ->take(8)->get();
        $data['latestProducts'] = $latestProducts;
        return view('front.home',$data);
    }

    public function addToWishlist(Request  $request){

        if(Auth::check() == false){
            session(['url.intended' => url()->previous()]); //save the url for redirect after login
            return response()->json([
                'status' => false,
            ]);
        }
                
        $product = Product::where('id',$request->id)->first();
        if($product == null){
            return response()->json([
                'status' => true,
                'message' => '<div class="alert alert-danger">Product not Found</div>',
            ]);
        }

        // the below function  is used to check whether this product has already added in wishlist or not and the first [] get the conditions and the second get content that will run 
        Wishlist::updateOrCreate(
            [
                'user_id' => Auth::user()->id,
                'product_id' => $request->id,
            ],
            [
                'user_id' => Auth::user()->id,
                'product_id' => $request->id,
            ]
        );

        // $wishlist = new Wishlist();
        // $wishlist->user_id = Auth::user()->id;
        // $wishlist->product_id = $request->id;
        // $wishlist->save();

        return response()->json([
            'status' => true,
            'message' => '<div class="alert alert-success"><strong>"'.$product->title.'"</strong> Product added in wishlist Successfully</div>',
        ]);
    }

    public function page($slug){
        $page = Page::where('slug',$slug)->first();
        if ($page==null) { // if there is no such category in DB
            abort(404); // show 404 error page
        }
        return  view('front.page',compact('page'));
    }

    public function sendContactEmail(Request $request){

        $validator = Validator::make($request->all(),[
            'name'=>'required',
            'email'=>'required|email',
            'subject'=>'required|min:10',
        ]);

        if ($validator->passes()) {

            $mailData = [
                'name' => $request->name,
                'email' => $request->email,
                'subject' => $request->subject,
                'message' => $request->message,
                'mail_subject' => 'You have received a contact email',
            ];

            $admin = User::where('id',1)->first();

            Mail::to($admin->email)->send(new ContactEmail($mailData));

            session()->flash('success', 'Thanks for contacting us, we will get back to you soon.');

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

