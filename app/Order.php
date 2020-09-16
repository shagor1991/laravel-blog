<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    public function restaurant(){
        return $this->hasOne('App\Restaurant');
    }

    public function policy(){
        return $this->hasOne('App\Policy');
    }

    public function user(){
        return $this->hasOne('App\User');
    }

    public function order_products(){
        return $this->hasMany('App\Order_Product');
    }

}
