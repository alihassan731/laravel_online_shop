@extends('layouts.app')
@section('content')
<div class="container mt-3">
        <div class="row">
            <div class="col-md-12">
                @if(session('message'))
                <div class="alert alert-success">{{ session('message') }}</div>
                @endif
                <div class="card">
                    <div class="card-header">
                        <h2>Employees Details
                            <a href="{{ url('admin/employees/create')}}" class="btn btn-primary float-end">Add
                            Employee</a>
                        </h2>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Company</th>
                                    <th>Name</th>
                                    <th>CNIC</th>
                                    <th>Phone_no</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody> 
                                @foreach($employees as $item)
                                <tr>
                                    <td>{{$item->id}}</td>
                                    <td>{{$item->company->name}}</td>
                                    <td>{{$item->name}}</td>
                                    <td>{{$item->cnic}}</td>
                                    <td>{{$item->phone}}</td>
                                    <td>
                                        <a href="{{ url('admin/employees/'.$item->id.'/edit')}}" class="btn btn-success">Edit</a>
                                        <a href="{{ url('admin/employees/'.$item->id.'/delete')}}" class="btn btn-danger">Delete</a>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection