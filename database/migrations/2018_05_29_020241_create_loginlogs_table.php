<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateLoginlogsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('loginlogs', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('uid',false,true)->default(0);
            $table->string('ip',15)->default('0.0.0.0');
            $table->string('ipaddr',50)->default('中国');
            $table->integer('login_time',false,true)->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('loginlogs');
    }
}
