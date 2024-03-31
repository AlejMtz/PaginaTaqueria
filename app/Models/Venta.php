<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Venta extends Model
{
    use HasFactory;

    protected $table='venta';
    protected $primaryKey='id';
    protected $fillable=['NoConsumo','precioVenta', 'fecha'];
    protected $guarded=[];
    public $timestamps=false;
    /*
    CREATE TABLE venta (
        id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
        NoConsumo int NOT NULL,
        precioVenta float(10,2) NOT NULL,
        fecha datetime NOT NULL
    );
    */
}
