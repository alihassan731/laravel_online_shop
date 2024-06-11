<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ProductImage;
use Intervention\Image\ImageManager; //it get from intervention image website
use Intervention\Image\Drivers\Gd\Driver; //it get from intervention image website
use Illuminate\Support\Facades\File;

class ProductImageController extends Controller
{
    public function update(Request $request){

        $image = $request->image;
        $ext = $image->getClientOriginalExtension();
        $sourcePath = $image->getPathName();

        $productImage = new ProductImage();
        $productImage->product_id= $request->product_id;
        $productImage->image = 'NULL';
        $productImage->save();
        
        $imageName = $request->product_id.'-'.$productImage->id.'-'.time().'.'.$ext;
        $productImage->image = $imageName;
        $productImage->save();

        $manager = new ImageManager(new Driver());
        $destPath = public_path().'/uploads/product/large/'.$imageName;
        
        $image = $manager->read($sourcePath);;
        $image->resize(1400,1200); //scale is the method of intervension Image version 3
         $image->save($destPath);

        $destPath = public_path().'/uploads/product/small/'.$imageName;
        $image = $manager->read($sourcePath);;
        $image->resize(250,250); //sca
        $image->save($destPath);

        return response()->json([
            'status' => true,
            'image_id' => $productImage->id,
            'ImagePath' => asset('uploads/product/small/'.$productImage->image),
            'message' => 'Image upload successfully'
        ]);
    }

    public function destroy(Request $request){
        $productImage = ProductImage::find($request->id);

        if(empty($productImage)){
            return response()->json([
                'status' => false,
                'message' => 'Image not Found'
            ]);
        }

        // Delete Image From Folders 
        File::delete(public_path('uploads/product/large/'.$productImage->image));
        File::delete(public_path('uploads/product/small/'.$productImage->image));

        $productImage->delete();

        return response()->json([
            'status' => true,
            'message' => 'Image Deleted successfully'
        ]);

    }
}
