<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

//Models
use App\Models\Users;
use DB;
use Auth;
use Response;
use Carbon\Carbon;
use Artisan;

class HomeController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        if (Auth()->user()->status == 1)
        {
            return view('home');
        }
        else
        {
            return back();
        }
    }
}
