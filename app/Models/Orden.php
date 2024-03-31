<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Orden extends Model
{
    use HasFactory;
    protected $table='orden';
    protected $primaryKey='id';
    protected $fillable=['NoConsumo', 'estado'];
    protected $guarded=[];
    public $timestamps=false;

    /*
    CREATE TABLE orden (
        id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
        NoConsumo int NOT NULL,
        estado enum('En preparacion','Cancelada','Entregada') DEFAULT 'En preparacion'
    );
    */
}