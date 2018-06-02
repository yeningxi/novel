<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateNoticesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('notices', function (Blueprint $table) {
            $table->increments('id');
            $table->string('title',50)->default('');
            $table->string('intro',200)->default('');
            $table->text('content');
            $table->integer('admin_user_id',false,true)->default(0);
            $table->integer('sortnum',false,true)->default(0);
            $table->index('title');
            $table->index('admin_user_id');
            $table->index('sortnum');
            $table->integer('created_time',false,true);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('notices');
    }
}
