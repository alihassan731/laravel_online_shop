<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\SubCategory;
use App\Models\Product;
use App\Models\Brand;
use App\Models\ProductImage;
use App\Models\ProductRating;
use App\Models\TempImage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Intervention\Image\ImageManager; //it get from intervention image website
use Intervention\Image\Drivers\Gd\Driver; //it get from intervention image website
use Illuminate\Support\Facades\File;

class ProductController extends Controller
{
    public function index(Request $request){
        $products = Product::latest('id')->with('product_images');
        if(!empty($request->get('keyword'))){
            $products = $products->where('title','like','%'.$request->get('keyword').'%');
        }
        $products = $products->paginate();
        // dd($products);
        $data['products'] = $products;
        return view('admin.products.list', $data);
    }
    
    public function create(){
        $data = [];
        $categories = Category::orderBy('name','ASC')->get();
        $brands = Brand::orderBy('name','ASC')->get();
        $data['categories'] = $categories;
        $data['brands'] = $brands;
        return view('admin.products.create', $data);
    }

    public function store(Request $request){
        // dd($request->image_array);
        // exit();
        // dd($request->status);
        // exit();
        
       $rules = [
            'title' => 'required',
            'slug' => 'required|unique:products',
            'price' => 'required|numeric',
            'sku' => 'required|unique:products',
            'track_qty' => 'required|in:Yes,No',
            'category' => 'required|numeric',
            'is_featured' => 'required|in:Yes,No',
       ];

       if(!empty($request->track_qty) && $request->track_qty == 'Yes'){
        $rules['qty'] = 'required|numeric';  //for add more in the above reles array
       }
        $validator =Validator::make($request->all(), $rules);

        if($validator->passes()){
            $product = new Product;
            $product->title = $request->title;
            $product->slug = $request->slug;
            $product->description = $request->description;
            $product->price = $request->price;
            $product->compare_price = $request->compare_price;
            $product->sku = $request->sku;
            $product->barcode = $request->barcode;
            $product->track_qty = $request->track_qty;
            $product->qty = $request->qty;
            $product->status = $request->status;
            $product->category_id = $request->category;
            $product->sub_category_id = $request->sub_category;
            $product->brand_id = $request->brand;
            $product->is_featured = $request->is_featured;
            $product->shipping_return = $request->shipping_return;
            $product->short_description = $request->short_description;
            $product->related_products = (!empty($request->related_products)) ? implode(',',$request->related_products) : '';
            
            $product->save();

            //Save Gallery Pics
            if(!empty($request->image_array)){
                foreach($request->image_array as $temp_image_id){

                    $tempImageInfo = TempImage::find($temp_image_id);
                    $extArray = explode('.',$tempImageInfo->name);
                    $ext = last($extArray);

                    $productImage = new ProductImage();
                    $productImage->product_id= $product->id;
                    $productImage->image = 'NULL';
                    $productImage->save();

                    $imageName = $product->id.'-'.$productImage->id.'-'.time().'.'.$ext;
                    $productImage->image = $imageName;
                    $productImage->save();

                    $manager = new ImageManager(new Driver());
                    $sourcePath = public_path().'/temp/'.$tempImageInfo->name;
                    $destPath = public_path().'/uploads/product/large/'.$imageName;
        
                    $image = $manager->read($sourcePath);;
                    $image->resize(1400,1200); //scale is the method of intervension Image version 3
                    $image->save($destPath);

                    $destPath = public_path().'/uploads/product/small/'.$imageName;
                    $image = $manager->read($sourcePath);;
                    $image->resize(250,250); //scale is the method of intervension Image version 3
                    $image->save($destPath);

                }   
            }
        
            $request->session()->flash('success', 'Product added successfully');
            return response()->json([
                'status' => true,
                'message' => "Product added Successfully",
            ]);
        } else{
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ]);
        }
    }

    public function edit($id, Request $request){
        $product = Product::find($id);
        if(empty($product)){
            return redirect()->route('products.index')->with('error','Record Not Found');
        }
        // Fetch images 
        $productImages= ProductImage::where('product_id',$product->id)->get();
        // Fetch related products 
        $relatedProducts = [];
        if($product->related_products != ''){
            $productArray = explode(',',$product->related_products);
            $relatedProducts = Product::whereIn('id',$productArray)->get();
        }


        $subCategories = SubCategory::where('category_id',$product->category_id)->get();
        $data = [];
        $categories = Category::orderBy('name','ASC')->get();
        $brands = Brand::orderBy('name','ASC')->get();
        $data['subCategories'] =  $subCategories;
        $data['product'] =  $product;
        $data['categories'] = $categories;
        $data['brands'] = $brands;
        $data['productImages'] = $productImages;
        $data['relatedProducts'] = $relatedProducts;
        
        return view('admin.products.edit', $data);

    }

    public function update($id,Request $request){
        
        $product = Product::find($id);

       $rules = [
            'title' => 'required',
            'slug' => 'required|unique:products,slug,' . $product->id . 'id',
            'price' => 'required|numeric',
            'sku' => 'required|unique:products,sku,' . $product->id . 'id',
            'track_qty' => 'required|in:Yes,No',
            'category' => 'required|numeric',
            'is_featured' => 'required|in:Yes,No',
       ];

       if(!empty($request->track_qty) && $request->track_qty == 'Yes'){
        $rules['qty'] = 'required|numeric';  //for add more in the above reles array
       }
        $validator =Validator::make($request->all(), $rules);

        if($validator->passes()){
         
            $product->title = $request->title;
            $product->slug = $request->slug;
            $product->description = $request->description;
            $product->price = $request->price;
            $product->compare_price = $request->compare_price;
            $product->sku = $request->sku;
            $product->barcode = $request->barcode;
            $product->track_qty = $request->track_qty;
            $product->qty = $request->qty;
            $product->status = $request->status;
            $product->category_id = $request->category;
            $product->sub_category_id = $request->sub_category;
            $product->brand_id = $request->brand;
            $product->is_featured = $request->is_featured;
            $product->shipping_return = $request->shipping_return;
            $product->short_description = $request->short_description;
            $product->related_products = (!empty($request->related_products)) ? implode(',',$request->related_products) : '';
            $product->save();

        
            $request->session()->flash('success', 'Product Updated successfully');
            return response()->json([
                'status' => true,
                'message' => "Product Updated Successfully",
            ]);
        } else{
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ]);
        }
    }

    public function destroy($id, Request $request){

        $product = Product::find($id);
        if(empty($product)){
            $request->session()->flash('error', 'Product not Found');
            return response()->json([
                'status' => false,
                'notFound' => true
            ]);
        }

        $productImages = ProductImage::where('product_id',$id)->get();
        if(!empty($productImages)){
           foreach ($productImages as  $productImage) {
            File::delete(public_path('uploads/product/large/'.$productImage->image));
            File::delete(public_path('uploads/product/small/'.$productImage->image)); 
           }
           ProductImage::where('product_id',$id)->delete();
        }

        $product->delete(); 
        $request->session()->flash('success', 'Product Deleted successfully');
        return response()->json([
            'status' => true,
            'message' => "Product Deleted Successfully",
        ]);

    }

    public function getProducts(Request $request){
        $tempProduct = [];
        if($request->term != ""){
            $products = Product::where('title','like','%'.$request->term.'%')->get();
            
            if($products != null){
                foreach($products as $product){
                    $tempProduct[] = array('id' => $product->id, 'text' => $product->title);
                }
            }
        }

        // print_r($tempProduct);
        return response()->json([
            'tags' => $tempProduct,
            'status' => true,
        ]);
    }

    public function productRatings(Request $request){

        $ratings = ProductRating::select('product_ratings.*','products.title as productTitle')->orderBy('product_ratings.created_at','DESC');
        $ratings = $ratings->leftJoin('products','products.id', 'product_ratings.product_id');

        if(!empty($request->get('keyword'))){
            $ratings = $ratings->where('products.title','like','%'.$request->get('keyword').'%');
            $ratings = $ratings->orWhere('product_ratings.username','like','%'.$request->get('keyword').'%');
        }

        $ratings = $ratings->paginate(3);
        return  view('admin.products.ratings', [
            'ratings' => $ratings,
        ]);
    }

    public function changeRatingStatus(Request $request){

       $changeStatus = ProductRating::find($request->id);
       if($changeStatus == null){
        session()->flash('error', 'No Rating Found!');
        return response()->json([
            'message' => 'No Rating Found!',
            'status' => false,
        ]);
       }

       $changeStatus->status = $request->status;
       $changeStatus->save();
       session()->flash('success', 'Status Changed Successfully!');
        return response()->json([
            'message' => 'Status Changed Successfully!',
            'status' => true,
        ]);
    }
    
}
