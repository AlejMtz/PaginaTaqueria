<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrdenProductos extends Model
{
    use HasFactory;
    protected $table='ordenproductos';
    protected $primaryKey='id';
    protected $fillable=['cantidad', 'detalleAdicional','ID_Orden','ID_Producto'];
    protected $guarded=[];
    public $timestamps=false;

    public function Orden(){
        return $this->hasMany(Orden::class, 'ID_Orden', 'id');
    }
    public function Producto(){
        return $this->belongsTo(Productos::class, 'ID_Producto','id');
    }

    /*
    CREATE TABLE ordenproductos (
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
        cantidad float(10,2) NOT NULL,
        detalleAdicional varchar(100) NOT NULL,
        ID_Orden int NOT NULL,
        ID_Producto int NOT NULL,
        FOREIGN KEY(ID_Orden) REFERENCES orden(id),
        FOREIGN KEY(ID_Producto) REFERENCES productos(id)
    );
    */
}
