<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\SubCategory;
use App\Models\Brand;
use App\Models\Product;
use App\Models\ProductRating;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;


class ShopController extends Controller
{
    public function index(Request $request, $categorySlug = null, $subCategorySlug = null){
        $categorySelected = '';
        $subCategorySelected = '';
        $brandsArray = [];
              
        $categories = Category::orderBy('name','ASC')->with('sub_category')->where('status',1)->get();
        $brands = Brand::orderBy('name','ASC')->where('status',1)->get();
        

        // Apply filtes Here 
        // $products = Product::orderBy('id','DESC')->where('status',1)->get();
        $products = Product::where('status',1);

        if(!empty($categorySlug)){
            $category = Category::where('slug',$categorySlug)->first();
            $products->where('category_id',$category->id);
            $categorySelected = $category->id;
        }

        if(!empty($subCategorySlug)){
            $subCategory = SubCategory::where('slug',$subCategorySlug)->first();
            $products->where('sub_category_id',$subCategory->id);
            $subCategorySelected = $subCategory->id;
        }
        
        if(!empty($request->get('brand'))){
            $brandsArray = explode(',',$request->get('brand'));  
            $products = $products->whereIn('brand_id',$brandsArray);
        }

        
        if($request->get('price_max') != '' && $request->get('price_min') != '' ){
            if($request->get('price_max') == 1000){
                $products = $products->whereBetween('price',[intval($request->get('price_min')), 1000000]);
            } else{
                $products = $products->whereBetween('price',[intval($request->get('price_min')),intval($request->get('price_max'))]);
            }
        }
        // for search Product using title 
        if(!empty($request->get('search'))){
            $products = $products->where('title','like','%'.$request->get('search').'%');
        }

        if($request->get('sort')){
            if($request->get('sort') == 'latest'){
                $products = $products->orderBy('id','DESC');
            } elseif($request->get('sort') == 'price_asc'){
                $products = $products->orderBy('price','ASC');
            } else{
                $products = $products->orderBy('price','DESC');
            }

        } else{
            $products = $products->orderBy('id','DESC');
        }

      
        $products = $products->paginate(6);

        $data['categories'] = $categories;
        $data['brands'] = $brands;
        $data['products'] = $products;
        $data['categorySelected'] = $categorySelected;
        $data['subCategorySelected'] = $subCategorySelected;
        $data['brandsArray'] = $brandsArray;
        $data['priceMax'] = (intval($request->get('price_max')) == 0) ? 1000 : $request->get('price_max') ;        
        $data['priceMin'] = intval($request->get('price_min'));  
        $data['sort'] = intval($request->get('sort'));  
        
        return view('front.shop', $data);
    }

    public function product($slug){
        $product = Product::where('slug',$slug)
                    ->withCount('product_ratings')
                    ->withSum('product_ratings','rating')
                    ->with(['product_images','product_ratings'])->first();
        // dd($product);
        
        
        if($product == null){
            abort(404);
        }

        // Fetch related products 
        $relatedProducts = [];
        if($product->related_products != ''){
            $productArray = explode(',',$product->related_products);
            $relatedProducts = Product::whereIn('id',$productArray)->with('product_images')->where('status',1)->get(); //whereIn is used for multiple ids in array format
        }

        // Calculate average rating =========
        // "product_ratings_count" => 1
        // "product_ratings_sum_rating" => 4.0
        $avgRating = '0.00';
        $avgRatingPercent = 0;
        if($product->product_ratings_count){
            $avgRating = number_format(($product->product_ratings_sum_rating/$product->product_ratings_count),2);
            $avgRatingPercent = ($avgRating*100)/5;
        }
        
        $data['avgRating'] = $avgRating;
        $data['avgRatingPercent'] = $avgRatingPercent;
        $data['product'] = $product;
        $data['relatedProducts'] = $relatedProducts;
        return view('front.product', $data);
    }

    public function saveRating(Request $request, $productId) {
        $validator = Validator::make($request->all(), [
            'name' => 'required|min:5',
            'email' => 'required|email',
            'rating' => 'required',
            'comment' => 'required|min:10',
        ]);

        if ($validator->fails()) {
         
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }

        $count = ProductRating::where('email', $request->email)->count();
        if($count > 0) {
            $request->session()->flash('error', 'You already reted this product!');

            return response()->json([
                'status' => true,
            ]);
        }

        $productRating = new ProductRating;
        $productRating->product_id = $productId;
        $productRating->username = $request->name;
        $productRating->email = $request->email;
        $productRating->comment = $request->comment;
        $productRating->rating = $request->rating;
        $productRating->status = 0;
        $productRating->save();
        
        $request->session()->flash('success', 'Thank you for your rating!');

        return response()->json([
            'status' => true,
            'message'=> "Thank you for your rating!"
        ]);

    }
}
