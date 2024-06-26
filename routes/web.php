<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MenuControlador;
use App\Http\Controllers\VentaControlador;
use App\Http\Controllers\ComprasControlador;
use App\Http\Controllers\InsumosControlador;
use App\Http\Controllers\MenuPubControlador;
use App\Http\Controllers\PublicoControlador;
use App\Http\Controllers\EmpleadoControlador;
use App\Http\Controllers\CategoriaControlador;
use App\Http\Controllers\ProductosControlador;
use App\Http\Controllers\UbicacionControlador;
use App\Http\Controllers\InventarioControlador;
use App\Http\Controllers\InventarioInsumoControlador;
use App\Http\Controllers\UnidadMedidasControlador;
use App\Http\Controllers\InsumosComprasControlador;
use App\Http\Controllers\MostrarInsumosControlador;
use App\Http\Controllers\ProductosVentasControlador;
use App\Http\Controllers\InsumosProductosControlador;
use App\Http\Controllers\OrdenControlador;







/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


Route::resource('home', InsumosControlador::class);
Route::resource('homeInsumosCompras', InsumosComprasControlador::class);
Route::resource('homeCategorias', CategoriaControlador::class);
Route::resource('homeProductos', ProductosControlador::class);
Route::get('/mostrarInsumos/{id}', [ProductosControlador::class, 'mostrarInsumosForm'])->name('mostrarInsumosForm');
Route::resource('homeProductosVentas', ProductosVentasControlador::class);
Route::resource('homeInventario', InventarioControlador::class);
Route::resource('inventarioInsumo',InventarioInsumoControlador::class);
Route::resource('homeInsumosProductos', InsumosProductosControlador::class);
Route::resource('homeProductos', ProductosControlador::class);
Route::resource('homeMenu', MenuControlador::class);
Route::resource('homePublico', PublicoControlador::class);
Route::resource('homeMenuPub', MenuPubControlador::class);
Route::resource('homeUbicacion', UbicacionControlador::class);
Route::resource('homeUnidadMedidas', UnidadMedidasControlador::class);
Route::resource('homeVenta', VentaControlador::class);

Route::resource('homeOrden', OrdenControlador::class);
Route::get('homeOrdenControlPanel', [OrdenControlador::class, 'mostrarVista'])->name('orden.mostrar');
Route::post('homeOrdenCancelar', [OrdenControlador::class, 'cancelarOrden'])->name('homeOrden.cancelar');
Route::post('homeOrdenCobrarSeparado', [OrdenControlador::class, 'cobrarPorSeparado'])->name('homeOrden.cobrarPorSeparado');
Route::post('homeOrdenCobrarMesa', [OrdenControlador::class, 'cobrarMesa'])->name('homeOrden.cobrarMesa');

Route::post('/insumosproductos/store', [InsumosProductosControlador::class, 'store'])->name('insumosproductos.store');
Route::delete('/insumosproductos/{id}', [InsumosProductosControlador::class, 'destroy'])->name('insumosproductos.destroy');
Route::put('/editarInsumos/{id}', [InsumosProductosControlador::class, 'editarInsumos'])->name('editarInsumos');
Route::resource('homeEmpleado', EmpleadoControlador::class);
Route::post('/habilitar-deshabilitar/{id}', [InsumosComprasControlador::class,'habilitarDeshabilitar'])->name('habilitarDeshabilitar');

Route::post('/homeInventario/inventarioInicial', [InventarioControlador::class, 'inventarioInicial'])->name('homeInventario.inventarioInicial');
Route::get('/homeInventario/totalComprasInsumo/{fecha}/{ID_Insumo}', [InventarioControlador::class, 'totalComprasInsumo'])->name('homeInventario.totalComprasInsumo');



