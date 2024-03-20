<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class EmpleadoControlador extends Controller
{
    public function index()
    {
        return view('../empleado.index');
    }
}
