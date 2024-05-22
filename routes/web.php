<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/
Route::get('/', [App\Http\Controllers\FrontendController::class,'index']);

Route::group(['middleware'=>'guest'],function(){
    Route::get('login',[AuthController::class,'index'])->name('login');
    Route::post('login',[AuthController::class,'login'])->name('login');
    Route::get('register',[AuthController::class,'register_view'])->name('register');
    Route::post('register',[AuthController::class,'register'])->name('register');
});

Route::group(['middleware'=>'auth'],function(){
    Route::get('home',[AuthController::class,'home'])->name('home');
    Route::get('logout',[AuthController::class,'logout'])->name('logout'); 
    Route::get('{company_slug}', [App\Http\Controllers\FrontendController::class,'company']);
});

Route::prefix('admin')->group(function () {
    //For Company crud
    Route::get('company', 'App\Http\Controllers\CompanyController@index');
    Route::get('company/create', 'App\Http\Controllers\CompanyController@create');
    Route::post('company', 'App\Http\Controllers\CompanyController@store');
    Route::get('company/{company_id}/delete', 'App\Http\Controllers\CompanyController@destroy');

    //For Employee crud
    Route::get('employees', 'App\Http\Controllers\EpmloyeeController@index');
    Route::get('employees/create', 'App\Http\Controllers\EpmloyeeController@create');
    Route::post('employees', 'App\Http\Controllers\EpmloyeeController@store');
    Route::get('employees/{employee}/edit', 'App\Http\Controllers\EpmloyeeController@edit');
    Route::put('employees/{employee}', 'App\Http\Controllers\EpmloyeeController@update');
    Route::get('employees/{employee_id}/delete', 'App\Http\Controllers\EpmloyeeController@destroy');

});