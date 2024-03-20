<?php

namespace App\Http\Controllers;

use App\Models\Insumos;
use Illuminate\Http\Request;
use App\Models\UnidadMedidas;
use App\Models\InsumosCompras;
use App\Models\Compras;
use Carbon\Carbon; // Asegúrate de importar la clase Carbon


class InsumosComprasControlador extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $insumosCompras=InsumosCompras::all();
        $insumos=Insumos::all();
        $unidadMedidas=UnidadMedidas::all();
        return view('insumoscompras.index',compact('insumosCompras','insumos','unidadMedidas'));
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
        $compra = new Compras;
        $compra->fecha = Carbon::now();
        $compra->save();

        $insumosCompras = new InsumosCompras;
        $insumosCompras->cantidad = $request->input('cantidad');
        $insumosCompras->ID_Insumo = $request->input('ID_Insumo');
        $insumosCompras->ID_UnidadMedida = $request->input('ID_UnidadMedida');
        $insumosCompras->ID_Compra = $compra->id;

        if ($request->filled('costoT') && $request->filled('cantidad')) {
            $costoTotal = $request->input('costoT');
            $cantidad = $request->input('cantidad');
            $costoUnitario = $costoTotal / $cantidad;
            $insumosCompras->costo = $costoUnitario;
        } else {
            $insumosCompras->costo = $request->input('costo');
        }

        $insumosCompras->save();

        // Deshabilitar el insumo comprado
        $insumoComprado = Insumos::find($request->input('ID_Insumo'));
        $insumoComprado->estado = 'Deshabilitado'; 
        $insumoComprado->save();

        return redirect()->back();
    }

    /**
     * Display the specified resource.
     */
    public function show(InsumosCompras $insumosCompras)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $insumosCompras = InsumosCompras::find($id);
    $insumosCompras->cantidad = $request->input('cantidad');
    $insumosCompras->ID_Insumo = $request->input('ID_Insumo');
    $insumosCompras->ID_UnidadMedida = $request->input('ID_UnidadMedida');
    $insumosCompras->fecha = $request->input('fecha');
    
    // Verificar si se proporcionó el costo total y la cantidad para calcular el costo unitario
    if ($request->filled('costoT') && $request->filled('cantidad')) {
        $costoTotal = $request->input('costoT');
        $cantidad = $request->input('cantidad');
        $costoUnitario = $costoTotal / $cantidad;
        $insumosCompras->costo = $costoUnitario;
    } else {
        // Si no se proporcionó el costo total, intenta obtener el costo unitario directamente
        $insumosCompras->costo = $request->input('costo');
    }

    $insumosCompras->update();
    return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $insumosCompras=InsumosCompras::find($id);
        $insumosCompras->delete();
        return redirect()->back();
    }

    public function habilitarDeshabilitar($id)
{
    $insumoCompra = InsumosCompras::find($id);
    $insumoCompra->Insumos->estado = ($insumoCompra->Insumos->estado == 'Habilitado') ? 'Deshabilitado' : 'Habilitado';
    $insumoCompra->Insumos->save();

    return redirect()->back();
}
}
