<?php

namespace App\Http\Controllers;

use App\Models\Productos;
use App\Models\Categoria;
use Illuminate\Http\Request;

class ProductosControlador extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $productos=Productos::all();
        $categoria=Categoria::all();
        return view('productos.index',compact('productos','categoria'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $productos=new Productos;
        $productos->nombre=$request->input('nombre');
        $productos->precio=$request->input('precio');
        $productos->ID_Categoria=$request->input('ID_Categoria');
        $productos->save();
        return redirect()->back()->with('success', 'Categoria creado correctamente.');
    }

    /**
     * Display the specified resource.
     */
    public function show(Productos $productos)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $productos=Productos::find($id);
        $productos->nombre=$request->input('nombre');
        $productos->precio=$request->input('precio');
        $productos->ID_Categoria=$request->input('ID_Categoria');
        $productos->update();
        return redirect()->back()->with('success', 'Categoria creado correctamente.');
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $productos=Productos::find($id);
        $productos->delete();
        return redirect()->back()->with('success', 'Categoria creado correctamente.');
    }
}
