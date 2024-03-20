@extends('layouts.homeEmpleado')

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
            <a href="{{ url('homeEmpleado') }}"><i class="fa fa-home"></i> Inicio</a>
            <a href="{{ url('homeInventario') }}"><i class="fa fa-list-alt"></i> Inventario</a>
            <a href="{{ url('homeVentas') }}"><i class="fa fa-dollar"></i> Ventas</a>
        </div>
    </div>

    <div class="col-md-12 d-flex justify-content-center mx-auto">
      

        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <div class="card-image"> <img src="{{ asset('imagenes/inventario.jpg') }}" alt="SECCION DE INVENTARIO" class="img-fluid" style="margin: 1rem;">
                    </div>
                    <h5 class="card-title">SECCIÓN DE INVENTARIO</h5>
                    <p class="card-text">Administra tu inventario.</p>
                    <a href="{{url('homeInventario')}}" class="btn btn-primary">Ir a Inventario :D</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <div class="card-image"> <img src="{{ asset('imagenes/ventas.jpg') }}" alt="SECCION DE VENTAS" class="img-fluid" style="margin: 1rem;">
                    </div>
                    <h5 class="card-title">SECCIÓN DE VENTAS</h5>
                    <p class="card-text">Administra tus ventas.</p>
                    <a href="{{url('homeVentas')}}" class="btn btn-primary">Ir a ventas :D</a>
                </div>
            </div>
        </div>
    </div>
</div>



@endsection
