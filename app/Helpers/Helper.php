<?php
//Models

use App\Models\Users;

function userDetails()
{
    $user_id    = Auth::user()->id;
    $user       = Users::find(1);

    return $user;
}
