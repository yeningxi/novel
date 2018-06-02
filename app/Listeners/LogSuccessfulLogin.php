<?php

namespace App\Listeners;

use Illuminate\Auth\Events\Login;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class LogSuccessfulLogin
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  Login  $event
     * @return void
     */
    public function handle(Login $event)
    {
        //
        $ipaddr = file_get_contents('http://ip.taobao.com/service/getIpInfo.php?ip='.$_SERVER['REMOTE_ADDR']);
        $ipaddr = json_decode($ipaddr,true);
        DB::table('loginlogs')->insert(['uid'=>Auth::id(),'ip'=>$_SERVER['REMOTE_ADDR'],'ipaddr'=>$ipaddr['data']['country'].$ipaddr['data']['region'].$ipaddr['data']['city'],'login_time'=>time()]);
    }
}
