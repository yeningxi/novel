<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PayLog extends Model
{
    //
    protected $table = 'pay_log';

    public $timestamps = false;

    protected $guarded = [];
}
