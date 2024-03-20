@extends('layouts/homeInventario')


@section('content')
<!-- Agrega las referencias a Bootstrap y jQuery antes de cerrar el cuerpo del documento -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="{{ asset('js/menuSecciones.js') }}"></script>

<div class="row">
    <!-- Botón de la hamburguesa -->
    <button class="navbar-toggler-sec" type="button" data-toggle="collapse" data-target="#menuPrincipal-sec" aria-controls="menuPrincipal-sec" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon">&#9776;</span>
    </button>

    <!-- Menú hamburguesa -->
    <div class="col-md-auto">
        <div class="card menu-card-sec" id="menuPrincipal-sec">
            <a href="javascript:void()" onclick="closeMenu()"></a>
            <a href="{{ url('homeInventario') }}"><i class="fa fa-list-alt"></i> Inventario</a>
            <a href="{{ url('homeVentas') }}"><i class="fa fa-dollar"></i> Ventas</a>
        </div>
    </div>
    <div class="col-md-8">

    <br><br>
    <h3>AGREGA NUEVAS COMPRAS DE TUS INSUMOS</h3>
    <br>
        
        <!-- Boton para regresar -->
        <a href="{{url('homeMenu')}}">
                <img class="img-atras" src="{{ asset('imagenes/atras.png') }}">
            </a>

        <!-- Boton para agregar -->
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#create">
        ADMINISTRAR INVENTARIO
        </button>
        
        <br><br>


        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">COMPRA DE INSUMO</th>
                        <th scope="col">FECHA DE CADUCIDAD</th>
                        <th scope="col">ACCIONES</th>
                    </tr>
                </thead>
                <tbody>
                @foreach($inventario as $inventario)
                    <tr>
                        <td> {{$inventario->id}} </td>
                        <td> {{$inventario->insumosCompras->id}} </td>
                        <td> {{$inventario->fechaCaducidad}} </td>
                        <td>
                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#edit{{$inventario->id}}">
                            EDITAR
                        </button>
                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#delete{{$inventario->id}}">
                            ELIMINAR   
                        </button>
        
                        </td>
                    </tr>

                    @include('inventario.info')

                    @endforeach
                </tbody>
            </table>
        </div>

        @include('inventario.create')
</div>

</div>

@endsection