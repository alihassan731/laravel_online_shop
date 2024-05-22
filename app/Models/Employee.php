<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    use HasFactory;
    protected $table = 'employees';
    protected $fillable = [
        'company_id',
        'name',
        'cnic',
        'slug',
        'phone',
    ];

    public function company(){
        return $this->belongsTo(Company::class, 'company_id','id');
    }
}
