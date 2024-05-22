<?php

namespace App\Http\Controllers;

use App\Models\Company;
use App\Models\Employee;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class EpmloyeeController extends Controller
{
    public function index(){
        $employees = Employee::all();
        return view('admin.employee.index', compact('employees'));
    }

    public function create(){
        $companies = Company::all();
        return view('admin.employee.create', compact('companies'));
    }

    public function store(Request $request){
        $request->validate([
            'company_id' => 'required',
            'name' => 'required',
            'cnic' => 'required|numeric',
            'phone' => 'required|numeric',
        ]);
        $company = Company::findOrFail($request->company_id);

        $employee = new Employee;
        $employee->name = $request->name;
        $employee->cnic = $request->cnic;
        $employee->slug = Str::slug($request->name);
        $employee->phone = $request->phone;

        $company->employees()->save($employee);

        return redirect('admin/employees')->with('message','Employee Added');
    }

    public function edit(int $employee){
        $companies = Company::all();
        $employee = Employee::findOrFail($employee);
        return view('admin.employee.edit',compact('companies','employee'));
    }

    public function update(Request $request ,$employee_id) {
        $request->validate([
            'company_id' => 'required',
            'name' => 'required',
            'cnic' => 'required|numeric',
            'phone' => 'required|numeric',
        ]);
        
        $company = Company::findOrFail($request->company_id);

        $company->employees()->where('id',$employee_id)->update([
            'name' => $request->name,
            'cnic' => $request->cnic,
            'slug'=>Str::slug($request->name),
            'phone' => $request->phone,
        ]);

        return redirect('admin/employees')->with('message','Employee Updated');

    }

    public function destroy(int $employee_id){
        Employee::findOrFail($employee_id)->delete();
        return redirect('admin/employees')->with('message','Employee Deleted SUCCESSFULL');
    }
}
