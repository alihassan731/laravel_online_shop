@extends('layouts.app')
@section('content')
<div class="container mt-3">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h2>Edit Employee
                            <a href="{{ url('admin/employees')}}" class="btn btn-primary float-end">Back</a>
                        </h2>
                    </div>
                    <div class="card-body">
                        <form action="{{ url('admin/employees/'.$employee->id)}}" method="POST">
                            @csrf
                            @method("PUT")
                            <div class="mb-3">
                                <label>Select Company</label>
                                <select name="company_id" class="form-control">
                                    @foreach($companies as $item)
                                        <option value="{{$item->id}}" {{ $employee->company->id == $item->id ?'selected':''}}>
                                            {{$item->name}}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                            @if($errors->has('company_id'))
                            <span class="text-danger">{{ $errors->first('company_id')}}</span>
                            @endif
                            <div class="mb-3">
                                <label>Employee Name</label>
                                <input type="text" class="form-control" name="name" value="{{$employee->name}}">
                            </div>
                            @if($errors->has('name'))
                            <span class="text-danger">{{ $errors->first('name')}}</span>
                            @endif
                            <div class="mb-3">
                                <label>Employee CNIC</label>
                                <input type="text" class="form-control" value="{{$employee->cnic}}" name="cnic">
                            </div>
                            @if($errors->has('cnic'))
                            <span class="text-danger">{{ $errors->first('cnic')}}</span>
                            @endif
                            <div class="mb-3">
                                <label>Employee Phone_no</label>
                                <input type="text" class="form-control" value="{{$employee->phone}}" name="phone">
                            </div>
                            @if($errors->has('phone'))
                            <span class="text-danger">{{ $errors->first('phone')}}</span>
                            @endif
                            <div class="mb-3">
                                <button type="submit" class="btn btn-primary">Update</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection