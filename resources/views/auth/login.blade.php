@extends('layouts.app')
@section('content')

<div class="container mt-5">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card form-holder">
                <div class="card-body">
                    <h1>Login</h1>
                    @if (Session::has('error'))
                    <p class="text-danger">{{Session::get('error')}}</p>
                    @endif
                    @if (Session::has('success'))
                    <p class="text-success">{{Session::get('success')}}</p>
                    @endif

                    <form action="{{ route('login') }}" method="post">
                        @csrf
                        @method('post')
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" name="email" class="form-control" id="email" placeholder="Email" />
                            @if ($errors->has('email'))
                            <p class="text-danger">{{ $errors->first('email') }}</p>
                            @endif
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" name="password" class="form-control" id="password" placeholder="Password" />
                            @if ($errors->has('password'))
                            <p class="text-danger">{{ $errors->first('password') }}</p>
                            @endif
                        </div>

                        <div class="row">
                            <div class="col-8 text-start">
                                <a href="#" class="btn btn-link">Forgot Password</a>
                            </div>
                            <div class="col-4 text-end">
                                <input type="submit" class="btn btn-primary" value="Login" />
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection