<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\TempImage;
use Intervention\Image\ImageManager; //it get from intervention image website
use Intervention\Image\Drivers\Gd\Driver; //it get from intervention image website

class TempImagesController extends Controller
{
    public function create(Request $request){
        $image = $request->image;

        if(!empty($image)){
            $ext = $image->getClientOriginalExtension();
            $newName = time().'.'.$ext;

            $tempImages = new TempImage();
            $tempImages->name = $newName;
            $tempImages->save();

            $image->move(public_path().'/temp',$newName);

            // Generate Thumbnail 
            $manager = new ImageManager(new Driver());
            $sourcePath = public_path().'/temp/'.$newName;
            $destPath = public_path().'/temp/thumb/'.$newName;

            $image = $manager->read($sourcePath);;
            $image->scale(300, 275); //scale is the method of intervension Image version 3
            $image->save($destPath);
            return response()->json([
                'status' => true,
                'image_id' => $tempImages->id,
                'ImagePath' => asset('/temp/thumb/'. $newName),
                'message' => 'Image upload successfully'
            ]);
        }
    }
}
