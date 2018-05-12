<?php

namespace App\Http\Controllers\Notification;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class NotificationController extends Controller
{
    //公告列表
    public function notification(){
        return view('notification/notification');
    }
    //公告评论列表
    public function noticomment(){
        return view('notification/noticomment');
    }
}
