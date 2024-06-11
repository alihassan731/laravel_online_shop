<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    // the below function will return the orderItems from order_items table 
    public function items(){
        return $this->hasMany(OrderItem::class);
    }
}
