<?php

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

Route::prefix('customers')->group(function() {
    Route::get('/', 'CustomersController@index')->name('customers_index');
    Route::get('/load-customer-datatable', 'CustomersController@loadCustomerDatatable');
    Route::post('/import-product-list', 'CustomersController@importProductList')->name('products_import_product_list');
});
