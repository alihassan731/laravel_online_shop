@extends('layouts.app')
@section('content')
<div class="container mt-3">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h2>Add Company
                            <a href="{{ url('admin/company')}}" class="btn btn-primary float-end">Back</a>
                        </h2>
                    </div>
                    <div class="card-body">
                        <form action="{{ url('admin/company')}}" method="POST">
                            @csrf
                            <div class="mb-3">
                                <label>Company Name</label>
                                <input type="text" class="form-control" name="name" value="{{old('name')}}">
                            </div>
                            @if($errors->has('name'))
                            <span class="text-danger">{{ $errors->first('name')}}</span>
                            @endif
                            <div class="mb-3">
                                <button type="submit" class="btn btn-primary">Save</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection