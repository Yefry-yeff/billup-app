<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ModelLogTranslados extends Model
{
    use HasFactory;
    protected $table = 'log_translado';
    protected $primaryKey = 'id';
    protected $fillable = [
        'id',
        'origen',
        'destino',
        'cantidad',
        'users_id'

    ];
}
