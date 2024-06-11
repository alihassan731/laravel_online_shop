<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\SubCategory;
use Illuminate\Support\Facades\Validator;

class SubCategoryController extends Controller
{

    public function index(Request $request){
        $subCategories = SubCategory::select('sub_categories.*','categories.name as categoryName')
                            ->latest('sub_categories.id')
                            ->leftJoin('categories','categories.id','sub_categories.category_id');
        //Pagination demo
        if(!empty($request->get('keyword'))){
            $subCategories = $subCategories->where('sub_categories.name','like','%'.$request->get('keyword').'%');
            $subCategories = $subCategories->orWhere('categories.name','like','%'.$request->get('keyword').'%');
        }
        $subCategories = $subCategories->paginate(3);
        return view('admin.sub_category.list', compact('subCategories'));
    }

    public function create(){
        $categories = Category::orderBy('name','ASC')->get();
        // same like as compact 
        $data['categories'] = $categories;
        return view('admin.sub_category.create',$data);
    }

    public function store(Request $request){
        //validate data
        $validator = Validator::make($request->all(),[
            'name'=>'required',
            'slug'=>'required|unique:sub_categories',
            'category'=>'required',
            'status' => 'required'
        ]);

        if ($validator->passes()) {
            $subCategory = new SubCategory();
            $subCategory->name = $request->name;
            $subCategory->slug = $request->slug;
            $subCategory->status = $request->status;
            $subCategory->showHome = $request->showHome;
            $subCategory->category_id = $request->category;
            $subCategory->save();

            $request->session()->flash('success', 'Sub Category added successfully');

            return response()->json([
                'status' => true,
                'message' => 'Sub Category added successfully'
            ]);
        
        } else{
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }
    }

    public function edit(Request $request,$subcategoryId){
        
        $SubCategory = SubCategory::find($subcategoryId);
        if(empty($SubCategory))
        {
            $request->session()->flash('error', 'Record not found');
            return redirect()->route('sub-categories.index');
        } 
        // return view('admin.category.edit', compact('category'));
        $categories = Category::orderBy('name','ASC')->get();
        // same like as compact 
        $data['categories'] = $categories;
        $data['SubCategory'] = $SubCategory;
        return view('admin.sub_category.edit',$data);
    }

    public function update(Request $request,$subcategoryId){
        $subCategory = SubCategory::find($subcategoryId);
        if(empty($subCategory))
        {
            $request->session()->flash('error', 'Record not found');
            return response()->json([
                'status' => false,
                'notFound' => true,
                'message' => 'Record not found'
            ]);
        } 
        //validate data
        $validator = Validator::make($request->all(),[
            'name'=>'required',
            // 'slug'=>'required|unique:sub_categories',
            'slug' => 'required|unique:sub_categories,slug,' . $subCategory->id . 'id',
            'category'=>'required',
            'status' => 'required'
        ]);

        if ($validator->passes()) {
            $subCategory->name = $request->name;
            $subCategory->slug = $request->slug;
            $subCategory->status = $request->status;
            $subCategory->showHome = $request->showHome;
            $subCategory->category_id = $request->category;
            $subCategory->save();

            $request->session()->flash('success', 'Sub Category updated successfully');

            return response()->json([
                'status' => true,
                'message' => 'Sub Category updated successfully'
            ]);
        
        } else{
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }
    }

    public function destroy(Request $request,$subcategoryId){
        $subCategory = SubCategory::find($subcategoryId);
        if(empty($subCategory))
        {
            // return redirect()->route('categories.index');
            $request->session()->flash('error', 'Sub Category not found');
            return response()->json([
                'status' => fasle,
                'notFound' =>true
            ]);
        } 
        
        // File::delete(public_path().'/uploads/category/thumb/'.$category->image);
        // File::delete(public_path().'/uploads/category/'.$category->image);
        $subCategory->delete();

        $request->session()->flash('success', 'Sub Category deleted successfully');

        return response()->json([
            'status' => true,
            'message' => 'Sub Category deleted successfully'
        ]);
    }
}
