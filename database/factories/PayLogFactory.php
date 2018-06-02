<?php

use Faker\Generator as Faker;

$factory->define(App\PayLog::class, function (Faker $faker) {
    return [
        'uid'=>$faker->randomDigitNotNull(10),
        'bookid'=>$faker->randomDigitNotNull(10),
        'money'=>$faker->randomElement(array(30,50,90,365)),
        'is_pay'=>$faker->randomElement(array(0,1)),
        'create_time'=>$faker->numberBetween(time()-3600*24*10,time()),
        'channelid'=>$faker->randomDigitNotNull(10)

    ];
});
