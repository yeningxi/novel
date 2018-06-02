<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Notice extends Model
{
    //
    protected $fillable = [
        'title','sortnum','intro','content','created_time','admin_user_id'
    ];
    public $timestamps = false;
}
