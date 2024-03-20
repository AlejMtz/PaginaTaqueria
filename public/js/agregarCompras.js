$(document).ready(function () {
    var contadorCampos = 1; // Inicializa el contador de campos

    // Función para agregar un nuevo campo de compra
    function agregarCampoCompra() {
        var nuevoCampo = `
            <div class="mb-3">
                <label for="ID_Insumo_${contadorCampos}" class="form-label">Insumo:</label>
                <select name="ID_Insumo[]" id="ID_Insumo_${contadorCampos}" class="form-control">
                    @foreach($insumos as $insumo)
                        <option value="{{ $insumo->id }}">{{ $insumo->nombre }}</option>
                    @endforeach
                </select>
            </div>
            
            <div class="mb-3">
                <label for="cantidad_${contadorCampos}" class="form-label">Cantidad:</label>
                <input type="number" class="form-control cantidad" name="cantidad[]" id="cantidad_${contadorCampos}" aria-describedby="helpId" placeholder=""/>
            </div>

            <div class="mb-3">
                <label for="ID_UnidadMedida_${contadorCampos}" class="form-label">Unidad de Medida:</label>
                <select name="ID_UnidadMedida[]" id="ID_UnidadMedida_${contadorCampos}" class="form-control">
                    @foreach($unidadMedidas as $unidadMedida)
                        <option value="{{ $unidadMedida->id }}">{{ $unidadMedida->nombre }}</option>
                    @endforeach
                </select>
            </div>

            <div class="mb-3">
                <label for="costoUnitario_${contadorCampos}" class="form-label">Costo Unitario:</label>
                <input type="number" step="0.01" class="form-control costoUnitario" name="costo[]" id="costoUnitario_${contadorCampos}" aria-describedby="helpId" placeholder=""/>
            </div>

            <div class="mb-3">
                <label for="costoTotal_${contadorCampos}" class="form-label">Costo Total:</label>
                <input type="number" step="0.01" class="form-control costoTotal" name="costoT[]" id="costoTotal_${contadorCampos}" aria-describedby="helpId" placeholder=""/>
            </div>
        `;

        $(".camposCompraDinamicos").append(nuevoCampo); // Agrega el nuevo campo al contenedor
        contadorCampos++; // Incrementa el contador de campos
    }

    // Función para eliminar el último campo de compra
    function eliminarCampoCompra() {
        var camposCompra = $(".camposCompraDinamicos").children();
        if (camposCompra.length > 1) {
            camposCompra.last().remove(); // Elimina el último campo de compra
            contadorCampos--; // Decrementa el contador de campos
        }
    }

    // Evento al hacer clic en el botón "Agregar Insumo"
    $(document).on("click", ".agregarCampoCompra", function () {
        agregarCampoCompra();
    });

    // Evento al hacer clic en el botón "Eliminar Insumo"
    $(document).on("click", ".eliminarCampoCompra", function () {
        eliminarCampoCompra();
    });

    // Evento al cambiar la cantidad o el costo unitario para calcular el costo total
    $(document).on("change", ".cantidad, .costoUnitario", function () {
        var campoActual = $(this).closest(".mb-3");
        var cantidad = campoActual.find(".cantidad").val();
        var costoUnitario = campoActual.find(".costoUnitario").val();
        var costoTotal = cantidad * costoUnitario;
        campoActual.find(".costoTotal").val(costoTotal.toFixed(2));
    });
});
