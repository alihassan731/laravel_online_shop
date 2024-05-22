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
                        <h2>Companies Details
                            <a href="{{ url('admin/company/create')}}" class="btn btn-primary float-end">Add
                            Company</a>
                        </h2>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody> 
                                @foreach($companies as $item)
                                <tr>
                                    <td>{{$item->id}}</td>
                                    <td>{{$item->name}}</td>
                                    <td>
                                        <a href="{{ url('admin/company/'.$item->id.'/delete')}}" class="btn btn-danger btn-sm">Delete</a>
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