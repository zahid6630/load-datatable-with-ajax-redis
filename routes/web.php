<?php

use Illuminate\Support\Facades\Route;
use App\Models\Users;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
	
    return view('auth.login');
});

Route::get('/login-page-info', function () {

	$info = Users::find(1);
    $data['organization_name'] = $info['organization_name'];

    return Response::json($data);
});

// artisan command
Route::get('/clear', function() {
	$exitCode = Artisan::call('view:clear');
	$exitCode = Artisan::call('route:clear');
    $exitCode = Artisan::call('cache:clear');
    $exitCode = Artisan::call('view:cache');
    $exitCode = Artisan::call('config:cache');

    return 'Clear and Config All';
});


Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
