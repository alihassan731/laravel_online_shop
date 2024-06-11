<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Brand;


class BrandController extends Controller
{
    public function index(Request $request){
        $brand = Brand::latest('id');
        //Pagination demo
        if(!empty($request->get('keyword'))){
            $brand = $brand->where('name','like','%'.$request->get('keyword').'%');
        }
        $brand = $brand->paginate(3);
        return view('admin.brands.list', compact('brand'));
    }

    public function create(){
        return view('admin.brands.create');
    }

    public function store(Request $request){
        //validate data
        $validator = Validator::make($request->all(),[
            'name'=>'required',
            'slug'=>'required|unique:brands',
        ]);

        if ($validator->passes()) {

            $brand = new Brand();
            $brand->name = $request->name;
            $brand->slug = $request->slug;
            $brand->status = $request->status;
            $brand->save();

            return response()->json([
                    'status' => true,
                    'message' => 'Brand added successfully'
                ]);
        } else{
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }
    }

    public function edit(Request $request,$Id){
        $brand = Brand::find($Id);
        if(empty($brand))
        {
            $request->session()->flash('error', 'Record not found');
            return redirect()->route('brands.index');
        } 
        $data['brand'] = $brand;
        return view('admin.brands.edit', $data);
    }

    public function update(Request $request,$Id){
      
        $brand = Brand::find($Id);
        if(empty($brand))
        {
            $request->session()->flash('error', 'Record not found');
            return response()->json([
                'status' => false,
                'notFound' => true
            ]);
            
        } 

         //validate data
         $validator = Validator::make($request->all(),[
            'name'=>'required',
            'slug' => 'required|unique:brands,slug,' . $brand->id . 'id',
        ]);

        if ($validator->passes()) {

            $brand->name = $request->name;
            $brand->slug = $request->slug;
            $brand->status = $request->status;
            $brand->save();

            $request->session()->flash('success', 'Brand updated successfully');
            return response()->json([
                    'status' => true,
                    'message' => 'Brand added successfully'
                ]);
        } else{
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }

    }

    public function destroy(Request $request,$Id){
        $brand = Brand::find($Id);
        if(empty($brand))
        {
            
            $request->session()->flash('error', 'Brand not found');
            return response()->json([
                'status' => false,
                'notFound' => true
            ]);
        } 
        
        
        $brand->delete();

        $request->session()->flash('success', 'Brand deleted successfully');

        return response()->json([
            'status' => true,
            'message' => 'Brand deleted successfully'
        ]);
    }


}
