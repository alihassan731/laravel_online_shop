@extends('layouts.app')
@section('content')
<div class="container mt-3">
        <div class="row">
            @foreach($companies as $company)
            <div class="col-md-4">
                <a class="text-decoration-none" href="{{ url($company->slug)}}">
                    <div class="card">
                        <div class="card-header">
                        <h4>Company : {{$company->name}}</h4>
                        </div>
                        <div class="card-body">
                            <h6>EMPLOYEES:</h6>
                            @if(count($company->employees)>0)
                            <ul>
                                @foreach($company->employees as $employee)
                                <li>{{ $employee->name }}</li>
                                @endforeach
                            </ul>
                            @else
                                No Employee
                            @endif
                        </div>
                    </div>
                </a>
            </div>
            @endforeach
        </div>
    </div>
@endsection