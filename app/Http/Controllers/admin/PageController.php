<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Page;

class PageController extends Controller
{
    public function index(Request $request) { 
        $pages = Page::latest();
        //Pagination demo
        if(!empty($request->get('keyword'))){
            $pages = $pages->where('name','like','%'.$request->get('keyword').'%');
        }
        $pages = $pages->paginate(3);
        
        return view('admin.pages.list', compact('pages'));
    }

    public function create(){
        return view('admin.pages.create');
    }

    public function store(Request $request){
        //validate data
        $validator = Validator::make($request->all(),[
            'name'=>'required',
            'slug'=>'required|unique:pages',
        ]);

        if ($validator->passes()) {

            $page = new Page();
            $page->name = $request->name;
            $page->slug = $request->slug;
            $page->content = $request->content;
            $page->save();
            
            session()->flash('success', 'Page added successfully');

            return response()->json([
                'status' => true,
                'message' => 'Page added successfully'
            ]);

        } else{
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }
    }

    public function edit(Request $request,$pageId){
        $page = Page::find($pageId);
        if(empty($page))
        {
            session()->flash('error', 'Page Not found');
            return redirect()->route('pages.index');
        } 
        return view('admin.pages.edit', compact('page'));
    }

    public function update(Request $request, $pageId){
        $page = Page::find($pageId);
        if(empty($page))
        {
            session()->flash('error', 'Page Not found');
            return response()->json([
                'status' => true,
                'message' => 'Page Not found'
            ]);
        } 
          //validate data
          $validator = Validator::make($request->all(),[
            'name'=>'required',
            'slug'=>'required|unique:pages,slug,' . $page->id . 'id',
        ]);

        if ($validator->passes()) {

            $page->name = $request->name;
            $page->slug = $request->slug;
            $page->content = $request->content;
            $page->save();
            
            session()->flash('success', 'Page Updated successfully');

            return response()->json([
                'status' => true,
                'message' => 'Page added successfully'
            ]);

        } else{
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }
    }

    public function destroy($pageId){
        $page = Page::find($pageId);
        if(empty($page))
        {
            session()->flash('error', 'Page not found');
            return response()->json([
                'status' => true,
                'message' => 'Page not found'
            ]);
        } 
        
        $page->delete();

       session()->flash('success', 'Page deleted successfully');

        return response()->json([
            'status' => true,
            'message' => 'Page deleted successfully'
        ]);

    }

    


}
