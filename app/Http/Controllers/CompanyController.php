<?php

namespace App\Http\Controllers;

use App\Models\Company;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class CompanyController extends Controller
{
    public function index(){
        $companies = Company::all();
        return view('admin.company.index',compact('companies'));
    }

    public function create(){
        return view('admin.company.create');
    }

    public function store(Request $request){
        $request->validate([
            'name' => 'required',
        ]); 
        Company::create([
         'name' => $request->name,
         'slug'=>Str::slug($request->name),
        ]);
        return redirect('admin/company')->with('message','company Added');
    }

    public function destroy(int $company_id){
        Company::findOrFail($company_id)->delete();
        return redirect('admin/company')->with('message','Company Deleted with all employees');
    }

}
