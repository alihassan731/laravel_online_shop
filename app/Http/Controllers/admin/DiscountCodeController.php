<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Carbon;
use App\Models\DiscountCoupon;

class DiscountCodeController extends Controller
{
    public function index(Request $request){
        $discountCoupons = DiscountCoupon::latest();
        //Pagination demo
        if(!empty($request->get('keyword'))){
            $discountCoupons = $discountCoupons->where('name','like','%'.$request->get('keyword').'%');
            $discountCoupons = $discountCoupons->orWhere('code','like','%'.$request->get('keyword').'%');
        }
        $discountCoupons = $discountCoupons->paginate(3);
        return view('admin.coupon.list', compact('discountCoupons'));
    }

    public function create(){
        return view('admin.coupon.create');
    }

    public function store(Request $request){
        $validator = Validator::make($request->all(),[
            'code' => 'required',
            'type' => 'required',
            'discount_amount' => 'required|numeric',
            'status' => 'required',
        ]);

        if($validator->passes()){
            // Starting data must be greater than current date...
            if(!empty($request->starts_at)){
                $now = Carbon::now(); //it is created an object of current date time .
                $startsAt = Carbon::createFromFormat('Y-m-d H:i:s', $request->starts_at);

                if($startsAt->lte($now) == true){ // lte() is the php function which checks whether a value is less than or equal to another value. 
                    return response()->json([
                        'status' => false,
                        'errors' => ['starts_at' => 'Start datetime cannot be less than current datetime'],//Here is created custon error!.
                    ]);

                }
            }
            //Expire date must be greater than starting date...
            if(!empty($request->starts_at) && !empty($request->expires_at)){
                $expiresAt = Carbon::createFromFormat('Y-m-d H:i:s', $request->expires_at); //it is created an object of current date time .
                $startsAt = Carbon::createFromFormat('Y-m-d H:i:s', $request->starts_at);

                if($expiresAt->gt($startsAt) == false){ // gt() method used for greater than .
                    return response()->json([
                        'status' => false,
                        'errors' => ['expires_at' => 'Expire datetime must be greater than start datetime'],//Here is created custon error!.
                    ]);

                }
            }



            $discountCode = new DiscountCoupon();
            $discountCode->code = $request->code;
            $discountCode->name = $request->name;
            $discountCode->description = $request->description;
            $discountCode->max_uses = $request->max_uses;
            $discountCode->max_uses_user = $request->max_uses_user;
            $discountCode->type	 = $request->type;
            $discountCode->discount_amount = $request->discount_amount;
            $discountCode->min_amount = $request->min_amount;
            $discountCode->status = $request->status;
            $discountCode->starts_at = $request->starts_at;
            $discountCode->expires_at = $request->expires_at;
            $discountCode->save();

            $message = 'Discount coupon added successfully';
            session()->flash('success', $message);
            return response()->json([
                'status' => true,
                'message' => $message,
            ]);


        } else{
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ]);
        }
    }

    public function edit(Request $request, $id){
        $coupon = DiscountCoupon::find($id);
        if($coupon == null){
            session()->flash('error','Record not Found');
            return redirect()->route('coupons.index');
        }
        
        // echo $coupon->status;
        $data['coupon'] = $coupon;

        return view ('admin.coupon.edit', $data);
    }

    public function update(Request $request, $id){
        $discountCode = DiscountCoupon::find( $id );
        if($discountCode == null){
            session()->flash('error','Record not Found');
            return response()->json([
                'status' => true,
            ]);
        }
        $validator = Validator::make($request->all(),[
            'code' => 'required',
            'type' => 'required',
            'discount_amount' => 'required|numeric',
            'status' => 'required',
        ]);

        if($validator->passes()){
            
            //Expire date must be greater than starting date...
            if(!empty($request->starts_at) && !empty($request->expires_at)){
                $expiresAt = Carbon::createFromFormat('Y-m-d H:i:s', $request->expires_at); //it is created an object of current date time .
                $startsAt = Carbon::createFromFormat('Y-m-d H:i:s', $request->starts_at);

                if($expiresAt->gt($startsAt) == false){ // gt() method used for greater than .
                    return response()->json([
                        'status' => false,
                        'errors' => ['expires_at' => 'Expire datetime must be greater than start datetime'],//Here is created custon error!.
                    ]);

                }
            }

            $discountCode->code = $request->code;
            $discountCode->name = $request->name;
            $discountCode->description = $request->description;
            $discountCode->max_uses = $request->max_uses;
            $discountCode->max_uses_user = $request->max_uses_user;
            $discountCode->type	 = $request->type;
            $discountCode->discount_amount = $request->discount_amount;
            $discountCode->min_amount = $request->min_amount;
            $discountCode->status = $request->status;
            $discountCode->starts_at = $request->starts_at;
            $discountCode->expires_at = $request->expires_at;
            $discountCode->save();

            $message = 'Discount coupon updated successfully';
            session()->flash('success', $message);
            return response()->json([
                'status' => true,
                'message' => $message,
            ]);


        } else{
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ]);
        }
    }

    public function destroy(Request $request, $id){
        $discountCode = DiscountCoupon::find( $id );
        if($discountCode == null){
            session()->flash('error','Record not Found');
            return response()->json([
                'status' => true,
            ]);
        }

        $discountCode->delete();
        session()->flash('success','Discount Coupon Deleted Successfully.');
        return response()->json([
            'status' => true,
        ]);
    }
}
