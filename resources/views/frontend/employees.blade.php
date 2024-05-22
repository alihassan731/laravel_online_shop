@extends('layouts.app')
@section('content')
    <div class="container mt-3">
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h4>COMPANY : {{ $company->name}}</h4>  
                    </div>
                    <div class="card-body">
                        <h5>Employees Detail:</h5>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>NAME</th>
                                    <th>CNIC</th>
                                    <th>PHONE_NO</th>
                                </tr>
                            </thead>
                            <tbody> 
                            @if(count($company->employees)>0)
                            @foreach($company->employees as $employee)
                                <tr>
                                    <td>{{ $employee->name }}</td>
                                    <td>{{ $employee->cnic }}</td>
                                    <td>{{ $employee->phone }}</td>
                                </tr>
                            @endforeach
                            @else
                             No Employee
                            @endif
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection