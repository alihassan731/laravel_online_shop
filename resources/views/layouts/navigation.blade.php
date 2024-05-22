    @if (Route::has('login'))
    
        <nav class="navbar bg-light">
            <div class="container-fluid">
                @auth
                    <a href="/" class="navbar-brand ml-5"><h4>COMPANY</h4></a>
                    <a href="{{ url('admin/company') }}" class="btn btn-primary ms-auto me-1 btn-sm" >Company CRUD</a>
                    <a href="{{ url('admin/employees') }}" class="btn btn-success btn-sm me-1">Employee CRUD</a>
                    <a href="{{ route('logout') }}" class="btn btn-outline-danger btn-sm">Logout</a>
                @else
                    <a href="/" class="navbar-brand ml-5"><h4>COMPANY</h4></a>
                    <a href="{{ route('login') }}" class="btn btn-outline-success ms-auto me-2 btn-sm">Log in</a>

                    @if (Route::has('register'))
                        <a href="{{ route('register') }}" class="btn btn-outline-success btn-sm">Register</a>
                    @endif
                @endauth
                </div>
        </nav>
    @endif