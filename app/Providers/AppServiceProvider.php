<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

//Models
use App\Models\Users;
use DB;
use View;
use Auth;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {   
    }
}
