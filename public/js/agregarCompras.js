$(document).ready(function () {
    var contadorCampos = 1;

    // Función para agregar un nuevo campo de compra
    function agregarCampoCompra(modalBody) {
        var insumos = modalBody.data('insumos');
        var unidadMedidas = modalBody.data('unidadmedidas');

        var nuevoCampo = `
            <div class="card mb-3">
                <div class="card-body">
                    <div class="mb-3">
                        <label for="ID_Insumo_${contadorCampos}" class="form-label">Insumo:</label>
                        <select name="ID_Insumo[]" id="ID_Insumo_${contadorCampos}" class="form-control">
                            ${insumos.map(insumo => `<option value="${insumo.id}">${insumo.nombre}</option>`).join('')}
                        </select>
                    </div>
                    
                    <div class="mb-3">
                        <label for="cantidad_${contadorCampos}" class="form-label">Cantidad:</label>
                        <input type="number" class="form-control cantidad" name="cantidad[]" id="cantidad_${contadorCampos}" aria-describedby="helpId" placeholder=""/>
                    </div>

                    <div class="mb-3">
                        <label for="ID_UnidadMedida_${contadorCampos}" class="form-label">Unidad de Medida:</label>
                        <select name="ID_UnidadMedida[]" id="ID_UnidadMedida_${contadorCampos}" class="form-control">
                            ${unidadMedidas.map(unidadMedida => `<option value="${unidadMedida.id}">${unidadMedida.nombre}</option>`).join('')}
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
                </div>
            </div>
        `;

        modalBody.find(".camposCompraDinamicos").append(nuevoCampo);
        contadorCampos++; // Incrementa el contador
    }

    // Evento al hacer clic en el botón "Agregar Insumo"
    $(".agregarCampoCompra").on("click", function () {
        var modalBody = $("#create").find(".modal-body");
        agregarCampo(modalBody);
    });
});
