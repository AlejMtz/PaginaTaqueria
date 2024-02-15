<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MenuControlador;
use App\Http\Controllers\PublicoControlador;
use App\Http\Controllers\MenuPubControlador;
use App\Http\Controllers\UbicacionControlador;
use App\Http\Controllers\InsumosControlador;
use App\Http\Controllers\CategoriaControlador;
use App\Http\Controllers\VentasControlador;
use App\Http\Controllers\ComprasControlador;
use App\Http\Controllers\ProductosControlador;
use App\Http\Controllers\ProductosVentasControlador;
use App\Http\Controllers\InsumosProductosControlador;





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
Route::resource('homeCategorias', CategoriaControlador::class);
Route::resource('homeVentas', VentasControlador::class);
Route::resource('homeCompras', ComprasControlador::class);
Route::resource('homeProductos', ProductosControlador::class);
Route::resource('homeProductosVentas', ProductosVentasControlador::class);
Route::resource('homeInsumosProductos', InsumosProductosControlador::class);
Route::resource('homeMenu', MenuControlador::class);
Route::resource('homePublico', PublicoControlador::class);
Route::resource('homeMenuPub', MenuPubControlador::class);
Route::resource('homeUbicacion', UbicacionControlador::class);
