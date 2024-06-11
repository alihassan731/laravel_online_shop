<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Wishlist extends Model
{
    use HasFactory;

     // Define the fillable properties for the Wishlist model
    public $fillable = ['user_id', 'product_id'];
    
   // The fillable property is an array that specifies which fields in the model can be mass-assigned
   // Mass-assignment is the process of assigning values to multiple fields in a model at once
   // By defining the fillable property, we restrict mass-assignment to only the specified fields
   // This helps prevent security vulnerabilities such as mass-assignment attacks

   public function product(){
    return $this->belongsTo(Product::class);  // A wishlist belongs to a single Product (one-to-many relationship)
   }
}
