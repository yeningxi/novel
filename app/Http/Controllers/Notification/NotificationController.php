<?php

namespace App\Http\Controllers\Notification;

use App\Notice;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redis;

class NotificationController extends Controller
{
    //公告列表
    public function notification(){


        $notices = Notice::orderBy('sortnum','desc')->get();
        $login_info = DB::table('loginlogs')->where('uid',Auth::id())->orderBy('login_time','desc')->take(2)->get();
        return view('notification/notification',compact('notices','login_info'));
    }
    //公告评论列表
    public function noticomment(Notice $notice){

        return view('notification/noticomment',compact('notice'));
    }

    //添加公告
    public function notifiadd(){
        return view('notification/notifiadd');
    }

    public function notifistore(Request $request){
        $this->validate($request,[
            'title'=>'required|max:50|min:2',
            'content'=>'required|string|min:10'
        ]);
        $admin_user_id = Auth::id();
        $created_time = time();
        $data = array_merge($request->post(),compact('admin_user_id','created_time'));
        $res = Notice::create($data);
        return redirect('notification');
    }

    public function notifiedit(Notice $notice){

        return view('notification/notifiedit',compact('notice'));
    }

    public function notifieditstore(Notice $notice){

        $this->validate(request(),[
            'title'=>'required|max:50|min:2',
            'content'=>'required|string|min:10'
        ]);

        $data = request(['title','intro','sortnum','content']);
        $notice->where('id',$notice->id)->update($data);
        return redirect('notification');
    }
    public function notifidelete(Notice $notice){
        $notice->delete();
        return redirect('/notification');
    }

}
