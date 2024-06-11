<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use App\Models\Order;
use App\Models\Product;
use App\Models\TempImage;
use App\Models\User;
use  Carbon\Carbon;


class HomeController extends Controller
{
    public function index(){
      
        $totalOrders = Order::where('status','!=','cancelled')->count();
        $totalProducts = Product::count();
        $totalCustomers = User::where('role', 1)->count();
        $totalRevenue = Order::where('status','!=','cancelled')->sum('grand_total');
        // This month revenue 
        $startOfMonth= Carbon::now()->startOfMonth()->format('Y-m-d');
        $current= Carbon::now()->format('Y-m-d');
        $thisMonthRevenue = Order::whereDate('created_at','>=', $startOfMonth)
                                ->whereDate('created_at','<=', $current)
                                ->sum('grand_total');

        // Last Month Revenue 
        $startLastMonth = Carbon::now()->subMonth()->startOfMonth()->format('Y-m-d');
        $endLastMonth = Carbon::now()->subMonth()->endOfMonth()->format('Y-m-d');

        $lastMonthRevenue = Order::whereDate('created_at','>=', $startLastMonth)
                                ->whereDate('created_at','<=', $endLastMonth)
                                ->sum('grand_total');
        // Last 30  days Revenue 
        $LastThirtyDaysDate = Carbon::now()->subDays(30)->format('Y-m-d');
        $LastThirtyDays = Order::whereDate('created_at','>=', $LastThirtyDaysDate)
                                ->whereDate('created_at','<=', $current)
                                ->sum('grand_total');

        $lastMonthName = Carbon::now()->subMonth()->startOfMonth()->format('M');
             
        // Delete Temp Images here 
        $dayBeforeToday = Carbon::now()->subDays(1)->format('Y-m-d H:i:s');
        $tempImages = TempImage::where( 'created_at' , '<=' ,$dayBeforeToday )->get();
        
        foreach( $tempImages as $tempImage ){
            
           $path = public_path('/temp/'. $tempImage->name);
           $thumbPath = public_path('/temp/thumb/'. $tempImage->name);
            // Delete from temp folder 
            if(File::exists($path)) {
                File::delete($path);
            }

           // Delete from temp/thumb folder 
            if(File::exists($thumbPath)) {
                File::delete($thumbPath);
            }

            TempImage::where('id', $tempImage->id)->delete();

        }
  
        return view('admin.dashboard',[
            'totalOrders' => $totalOrders,
            'totalProducts' => $totalProducts,
            'totalCustomers' => $totalCustomers,
            'totalRevenue' => $totalRevenue,
            'thisMonthRevenue' => $thisMonthRevenue,
            'lastMonthRevenue' => $lastMonthRevenue,
            'LastThirtyDays' => $LastThirtyDays,
            'lastMonthName' => $lastMonthName,
        ]);
        // $admin = Auth::guard('admin')->user();
        // echo 'Welcome'. $admin->name .'<a href="' .route('admin.logout').'">Logout</a>';
    }

    public function logout(){
        Auth::guard('admin')->logout();
        return redirect()->route('admin.login');
    }
}
