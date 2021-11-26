<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Users extends Model
{
    protected $table = "users";

    public function branch()
    {
        return $this->belongsTo('App\Models\Branches','branch_id');
    }
}
