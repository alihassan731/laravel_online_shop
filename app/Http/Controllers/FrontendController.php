<?php

namespace App\Http\Controllers;

use App\Models\Company;
use Illuminate\Http\Request;

class FrontendController extends Controller
{
    public function index(){
        $companies = Company::all();
        return view('frontend.companies',compact('companies'));
    }

    public function company($company_slug){
        $company = Company::where('slug',$company_slug)->first();
        return view('frontend.employees',compact('company'));
    }
}
