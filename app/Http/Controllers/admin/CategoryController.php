<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\File;
use App\Models\Category;
use App\Models\TempImage;
use Intervention\Image\ImageManager;
use Intervention\Image\Drivers\Gd\Driver;


class CategoryController extends Controller
{
    public function index(Request $request){
        $categories = Category::latest();
        //Pagination demo
        if(!empty($request->get('keyword'))){
            $categories = $categories->where('name','like','%'.$request->get('keyword').'%');
        }
        $categories = $categories->paginate(3);
        return view('admin.category.list', compact('categories'));
    }

    public function create(){
        return view('admin.category.create');
    }

    public function store(Request $request){
        //validate data
        $validator = Validator::make($request->all(),[
            'name'=>'required',
            'slug'=>'required|unique:categories',
        ]);

        if ($validator->passes()) {

            $category = new Category();
            $category->name = $request->name;
            $category->slug = $request->slug;
            $category->status = $request->status;
            $category->showHome = $request->showHome;
            $category->save();

            // Save Image Here 
            if(!empty($request->image_id)){
                $tempImage = TempImage::find($request->image_id);
                $extArray = explode('.',$tempImage->name);
                $ext = last($extArray);

                $newImageName = $category->id.'.'.$ext;
                $sPath = public_path().'/temp/'.$tempImage->name;
                $dPath = public_path().'/uploads/category/'.$newImageName;
                File::copy($sPath,$dPath);

                // Generate image Thumnails  for Intervension Image website version 3.
                $manager = new ImageManager(new Driver());
                $img = $manager->read($sPath);
                $img = $img->resize(450, 600);
                $dPath = public_path().'/uploads/category/thumb/'.$newImageName;
                $img->save($dPath);

                // Generate image Thumnails for Intervension version 2x.
                // $dPath = public_path().'/uploads/category/thumb/'.$newImageName;
                // $img = Image::make($sPath);
                // $img->resize(450, 600);
                // $img->save($dPath);

                $category->image = $newImageName;
                $category->save();
            }
            
            $request->session()->flash('success', 'Category added successfully');

            return response()->json([
                'status' => true,
                'message' => 'Category added successfully'
            ]);

        } else{
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }
    }

    public function edit(Request $request,$categoryId){
        $category = Category::find($categoryId);
        if(empty($category))
        {
            return redirect()->route('categories.index');
        } 
        return view('admin.category.edit', compact('category'));
    }
    
    public function update(Request $request,$categoryId){
       
        $category = Category::find($categoryId);
        if(empty($category))
        {
            $request->session()->flash('error', 'Category not found');
            return response()->json([
                'status' => false,
                'notFound' => true,
                'message' => 'Category not found'
            ]);
        } 

        
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'slug' => 'required|unique:categories,slug,' . $category->id . 'id',
        ]);
        

        if ($validator->passes()) {

            $category->name = $request->name;
            $category->slug = $request->slug;
            $category->status = $request->status;
            $category->showHome = $request->showHome;
            $category->save();

            $oldImage = $category->image;

            // Save Image Here 
            if(!empty($request->image_id)){
                $tempImage = TempImage::find($request->image_id);
                $extArray = explode('.',$tempImage->name);
                $ext = last($extArray);

                $newImageName = $category->id.'-'.time().'.'.$ext;
                $sPath = public_path().'/temp/'.$tempImage->name;
                $dPath = public_path().'/uploads/category/'.$newImageName;
                File::copy($sPath,$dPath);

                // Generate image Thumnails  for Intervension version 3.
                $manager = new ImageManager(new Driver());
                $img = $manager->read($sPath);
                $img = $img->resize(450, 600);
                $dPath = public_path().'/uploads/category/thumb/'.$newImageName;
                $img->save($dPath);

                $category->image = $newImageName;
                $category->save();

                //Old Images delete here
                File::delete(public_path().'/uploads/category/thumb/'.$oldImage);
                File::delete(public_path().'/uploads/category/'.$oldImage);


            }
    
                $request->session()->flash('success', 'Category updated successfully');

                return response()->json([
                    'status' => true,
                    'message' => 'Category updated successfully'
                ]);

            } else{
                return response()->json([
                    'status' => false,
                    'errors' => $validator->errors()
                ]);
            }
    }

    public function destroy(Request $request,$categoryId){
        $category = Category::find($categoryId);
        if(empty($category))
        {
            // return redirect()->route('categories.index');
            $request->session()->flash('error', 'Category not found');
            return response()->json([
                'status' => true,
                'message' => 'Category deleted successfully'
            ]);
        } 
        
        File::delete(public_path().'/uploads/category/thumb/'.$category->image);
        File::delete(public_path().'/uploads/category/'.$category->image);
        $category->delete();

        $request->session()->flash('success', 'Category deleted successfully');

        return response()->json([
            'status' => true,
            'message' => 'Category deleted successfully'
        ]);
    }
}