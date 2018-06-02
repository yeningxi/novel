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

//Route::get('/', function () {
//    return view('welcome');
//});



Auth::routes();

Route::group(['middleware' => ['auth']], function () {

    Route::get('/home', 'HomeController@index')->name('home');

//首页公告
    Route::get('/','Index\IndexController@index');

    Route::get('/notification','Notification\NotificationController@notification');
    Route::get('/noticomment/{notice}','Notification\NotificationController@noticomment')->where('notice','\d+');
    Route::get('/notification/{notice}/edit','Notification\NotificationController@notifiedit');
    Route::post('/notification/{notice}/edit','Notification\NotificationController@notifieditstore');

    Route::get('/notification/{notice}/delete','Notification\NotificationController@notifidelete');
//    Route::get('/noticomment','Notification\NotificationController@noticomment');

    Route::get('notifiadd','Notification\NotificationController@notifiadd');
    Route::post('notifiadd','Notification\NotificationController@notifistore');

//  数据中心
    Route::get('datacentre/{channel}','Channel\ChannelController@index');
});
