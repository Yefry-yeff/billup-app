<div>
    <div class="row wrapper border-bottom white-bg page-heading d-flex align-items-center">
        <div class="col-lg-12 col-xl-12 col-md-12 col-sm-12">
            <h2>Registrar Devolución de Producto</h2>

            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a>Nota de crédito</a>
                </li>


            </ol>
        </div>

    </div>

    <div class="wrapper wrapper-content animated fadeInRight pb-0">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox ">
                    <div class="ibox-content">
                        <div class="row">
                            <div class="col-12 col-sm-12 col-md-6">
                                <label for="cliente" class="col-form-label focus-label">Seleccionar
                                    Cliente:</label>
                                <select id="cliente" name="cliente" class="form-group form-control" style=""
                                    onchange="obtenerFacturasDeCliente()" data-parsley-required>
                                    <option value="" selected disabled>--Seleccionar Cliente--</option>
                                </select>
                            </div>
                            <div class="col-12 col-sm-12 col-md-6">
                                <label for="factura" class="col-form-label focus-label">Seleccionar
                                    Factura:</label>
                                <select  id="factura" name="factura" class="form-group form-control" style=""
                                    data-parsley-required onchange="limpiarTablas()">
                                    <option value="" selected disabled>--Seleccionar una Factura--</option>
                                </select>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-12">
                                <button onclick="datosFactura()" class="btn btn-primary"><i
                                        class="fa-solid fa-paper-plane text-white"></i> Solicitar Factura</button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="wrapper wrapper-content animated fadeInRight pb-0">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox ">

                    <div class="ibox-content">
                        <h3>Detalle de Factura</h3>

                        <form id="selec_nota_form" name="selec_nota_form" data-parsley-validate>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-3">

                                    <div class="form-group">
                                        <label for="codigo_factura">Código de factura:</label>
                                        <input type="text" name="codigo_factura" id="codigo_factura"
                                            class="form-control" readonly required>
                                    </div>

                                </div>

                                <div class="col-12 col-sm-12 col-md-3">

                                    <div class="form-group">
                                        <label for="fecha">Fecha de emisión: </label>
                                        <input type="date" name="fecha" id="fecha" class="form-control"
                                            readonly required>
                                    </div>

                                </div>

                                <div class="col-12 col-sm-12 col-md-3">

                                    <div class="form-group">
                                        <label for="tipo_pago">Tipo de factura:</label>
                                        <input type="text" name="tipo_pago" id="tipo_pago" class="form-control"
                                            readonly required>
                                    </div>

                                </div>

                                <div class="col-12 col-sm-12 col-md-3">

                                    <div class="form-group">
                                        <label for="tipo_venta">Tipo de venta:</label>
                                        <input type="text" name="tipo_venta" id="tipo_venta" class="form-control"
                                            readonly required>
                                    </div>

                                </div>

                            </div>

                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-4">

                                    <div class="form-group">
                                        <label for="codigo_cliente">Código de cliente:</label>
                                        <input type="text" name="codigo_cliente" id="codigo_cliente"
                                            class="form-control" readonly required>
                                    </div>

                                </div>

                                <div class="col-12 col-sm-12 col-md-4">

                                    <div class="form-group">
                                        <label for="rtn">RTN:</label>
                                        <input type="text" name="rtn" id="rtn" class="form-control"
                                            readonly required>
                                    </div>

                                </div>

                                <div class="col-12 col-sm-12 col-md-4">

                                    <div class="form-group">
                                        <label for="nombre_cliente">Nombre de cliente:</label>
                                        <input type="text" name="nombre_cliente" id="nombre_cliente"
                                            class="form-control" readonly required>
                                    </div>

                                </div>



                            </div>

                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-4">

                                    <div class="form-group">
                                        <label for="vendedor">Vendido por:</label>
                                        <input type="text" name="vendedor" id="vendedor" class="form-control"
                                            readonly required>
                                    </div>

                                </div>

                                <div class="col-12 col-sm-12 col-md-4">

                                    <div class="form-group">
                                        <label for="facturado">Facturado por:</label>
                                        <input type="text" name="facturado" id="facturado" class="form-control"
                                            readonly required>
                                    </div>

                                </div>

                                <div class="col-12 col-sm-12 col-md-4">

                                    <div class="form-group">
                                        <label for="fecha_registro">Registado en sistema:</label>
                                        <input type="text" name="fecha_registro" id="fecha_registro"
                                            class="form-control" readonly required>
                                    </div>

                                </div>



                            </div>
                        </form>

                        <div class="table-responsive">
                            <table id="tbl_productos" class="table table-striped table-bordered table-hover">
                                <thead class="">
                                    <tr>
                                        <th>Producto</th>
                                        <th>Bodega</th>
                                        <th>Precio Unidad en Lps</th>
                                        <th>Cantidad</th>
                                        <th>Unidad de medida</th>
                                        <th>Sub total</th>
                                        <th>ISV</th>
                                        <th>Total</th>
                                        <th>Opciones</th>
    
    
    
                                    </tr>
                                </thead>
                                <tbody>
    
                                </tbody>
                            </table>
                        </div>



                        <br>
                        <div class="row">

                            <div class="form-group col-12 col-sm-12 col-md-2 col-lg-1 col-xl-1">
                                <label class="col-form-label" for="subTotalGeneral">Sub Total L.<span
                                        class="text-danger">*</span></label>
                            </div>

                            <div class="form-group col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
                                <input type="number" step="any" placeholder="Sub total " id="subTotalGeneral"
                                    name="subTotalGeneral" class="form-control" min="0" data-parsley-required
                                    autocomplete="off" readonly>
                            </div>
                        </div>

                        <div class="row">

                            <div class="form-group col-12 col-sm-12 col-md-2 col-lg-1 col-xl-1">
                                <label class="col-form-label" for="isvGeneral">ISV L.<span
                                        class="text-danger">*</span></label>
                            </div>

                            <div class="form-group col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
                                <input type="number" step="any" placeholder="ISV " id="isvGeneral"
                                    name="isvGeneral" class="form-control" min="0" data-parsley-required
                                    autocomplete="off" readonly>
                            </div>
                        </div>

                        <div class="row">

                            <div class="form-group col-12 col-sm-12 col-md-2 col-lg-1 col-xl-1">
                                <label class="col-form-label" for="totalGeneral">Total L.<span
                                        class="text-danger">*</span></label>
                            </div>

                            <div class="form-group col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
                                <input type="number" step="any" placeholder="Total  " id="totalGeneral"
                                    name="totalGeneral" class="form-control" min="0" data-parsley-required
                                    autocomplete="off" readonly>
                            </div>
                        </div>






                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="wrapper wrapper-content animated fadeInRight pb-0">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox ">

                    <div class="ibox-content">
                        <h3>Listado de Productos en Nota de Crédito</h3>



                        <table id="tbl_productos" class="table table-striped table-bordered table-hover">
                            <thead class="">
                                <tr>
                                    <th>Producto</th>
                                    <th>Bodega</th>
                                    <th>Precio Unidad en Lps</th>
                                    <th>Cantidad</th>
                                    <th>Unidad de medida</th>
                                    <th>Sub total</th>
                                    <th>ISV</th>
                                    <th>Total</th>
                                    <th>Opciones</th>




                                </tr>
                            </thead>
                            <tbody>
                                <tr id="1">
                                    <td>Body content 1</td>
                                    <td>Body content 2</td>
                                    <td>Body content 1</td>
                                    <td>Body content 2</td>
                                    <td>Body content 1</td>
                                    <td>Body content 2</td>
                                    <td>Body content 1</td>
                                    <td>Body content 2</td>
                                    <td><button class="btn btn-danger">Eliminar</button></td>
                                </tr>
                            </tbody>
                        </table>

                        <br>
                        <div class="row">

                            <div class="form-group col-12 col-sm-12 col-md-2 col-lg-1 col-xl-1">
                                <label class="col-form-label" for="subTotalGeneral">Sub Total L.<span
                                        class="text-danger">*</span></label>
                            </div>

                            <div class="form-group col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
                                <input type="number" step="any" placeholder="Sub total " id="subTotalGeneral"
                                    name="subTotalGeneral" class="form-control" min="0" data-parsley-required
                                    autocomplete="off" readonly>
                            </div>
                        </div>

                        <div class="row">

                            <div class="form-group col-12 col-sm-12 col-md-2 col-lg-1 col-xl-1">
                                <label class="col-form-label" for="isvGeneral">ISV L.<span
                                        class="text-danger">*</span></label>
                            </div>

                            <div class="form-group col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
                                <input type="number" step="any" placeholder="ISV " id="isvGeneral"
                                    name="isvGeneral" class="form-control" min="0" data-parsley-required
                                    autocomplete="off" readonly>
                            </div>
                        </div>

                        <div class="row">

                            <div class="form-group col-12 col-sm-12 col-md-2 col-lg-1 col-xl-1">
                                <label class="col-form-label" for="totalGeneral">Total L.<span
                                        class="text-danger">*</span></label>
                            </div>

                            <div class="form-group col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
                                <input type="number" step="any" placeholder="Total  " id="totalGeneral"
                                    name="totalGeneral" class="form-control" min="0" data-parsley-required
                                    autocomplete="off" readonly>
                            </div>
                        </div>

                        <br>

                        <button class="btn btn-success">Cerrar Nota de Credito</button>
                        <button type="button" class="btn btn-primary" data-toggle="modal"
                            data-target="#modal_devolver_producto">
                            Launch demo modal
                        </button>







                    </div>
                </div>
            </div>
        </div>
        <!-- Button trigger modal -->

        <!-- Modal -->
        <div class="modal fade" id="modal_devolver_producto" tabindex="-1" role="dialog"
            aria-labelledby="modal_devolver_producto" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered  modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="" id="">Datos de Producto</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="form_producto_devolver" name="form_producto_devolver" data-parsley-validate>
                            <input type="hidden" id="idFactura" name="idFactura" value="0">
                            <input type="hidden" id="idProducto" name="idProducto" value="0">
                            <input type="hidden" id="idMedidaVenta" name="idMedidaVenta" value="0">
                            <div class="row">

                                <div class="col-12 col-md-6">
                                    <label for="nombre" class="col-form-label focus-label">Nombre de producto:<span
                                            class="text-danger">*</span></label>
                                    <input class="form-control" required type="text" id="nombre"
                                        name="nombre" data-parsley-required readonly>
                                </div>
                                <div class="col-12 col-md-6">
                                    <label for="unidad" class="col-form-label focus-label">Unidad de Medida:<span
                                            class="text-danger">*</span></label>
                                    <input class="form-control" required type="text" id="unidad"
                                        name="unidad" data-parsley-required readonly>
                                </div>


                            </div>

                            <div class="row">

                                <div class="col-12 col-md-6">
                                    <label for="precio" class="col-form-label focus-label">Precio de producto:<span
                                            class="text-danger">*</span></label>
                                    <input class="form-control" required type="number" step="any" id="precio"
                                        name="precio" data-parsley-required readonly>
                                </div>
                                <div class="col-12 col-md-6">
                                    <label for="cantidad" class="col-form-label focus-label">Cantidad a devolver:<span
                                            class="text-danger">*</span></label>
                                    <input class="form-control" required type="number"  id="cantidad"
                                        name="cantidad" data-parsley-required>
                                </div>


                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <label for="bodega" class="col-form-label focus-label">Bodega de destino <span class="text-danger">*</span></label>
                                    <select class="form-control m-b" name="bodega" id="bodega" required
                                        data-parsley-required >
                                        <option value="" selected disabled>---Seleccione una bodega de destino---</option>

                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12">
                                    <label for="segmento" class="col-form-label focus-label">Segmento de destino <span class="text-danger">*</span></label>
                                    <select class="form-control m-b" name="segmento" id="segmento" required
                                        data-parsley-required >
                                        <option value="" selected disabled>---Seleccione una segmento de destino---</option>

                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12">
                                    <label for="seccion" class="col-form-label focus-label">Sección de destino  <span class="text-danger">*</span></label>
                                    <select class="form-control m-b" name="seccion" id="seccion" required
                                        data-parsley-required >
                                        <option value="" selected disabled>---Seleccione una sección de destino---</option>

                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary">Agregar a Nota de Credito</button>
                    </div>
                </div>
            </div>
        </div>


    </div>


    @push('scripts')
        <script>
            $('#cliente').select2({
                ajax: {
                    url: '/nota/credito/clientes',
                    data: function(params) {
                        var query = {
                            search: params.term,
                            type: 'public',
                            page: params.page || 1
                        }

                        // Query parameters will be ?search=[term]&type=public
                        return query;
                    }

                }
            });

            function obtenerFacturasDeCliente() {
                document.getElementById('factura').innerHTML =
                    ' <option value="" selected disabled>--Seleccionar una factura--</option>';
                
                   this.limpiarTablas(); 

                let idCliente = document.getElementById('cliente').value

                $('#factura').select2({
                    ajax: {
                        url: '/nota/credito/facturas',
                        data: function(params) {
                            var query = {
                                idCliente: idCliente,
                                search: params.term,
                                type: 'public',
                                page: params.page || 1
                            }

                            // Query parameters will be ?search=[term]&type=public
                            return query;
                        }

                    }
                });
            }

            function datosFactura() {
                let idFactura = document.getElementById('factura').value;


                axios.post('/nota/credito/datos/factura', {
                        idFactura: idFactura
                    })
                    .then(response => {

                        let data = response.data.datosFactura;

                        document.getElementById('codigo_factura').value = data.id;
                        document.getElementById('fecha').value = data.fecha_emision;
                        document.getElementById('tipo_pago').value = data.tipoPago;


                        document.getElementById('tipo_venta').value = data.tipoFactura;
                        document.getElementById('codigo_cliente').value = data.idCliente;
                        document.getElementById('rtn').value = data.rtn;

                        document.getElementById('nombre_cliente').value = data.nombreCliente;
                        document.getElementById('vendedor').value = data.vendedor;
                        document.getElementById('facturado').value = data.facturador;
                        document.getElementById('fecha_registro').value = data.fechaRegistro;

                        document.getElementById('subTotalGeneral').value = data.sub_total;
                        document.getElementById('isvGeneral').value = data.isv;
                        document.getElementById('totalGeneral').value = data.total;



                    })

                $('#tbl_productos').DataTable().clear().destroy();
                this.obtenerProductos(idFactura);
            }

            function obtenerProductos(idFactura) {

                //let table = $('#tbl_productos').DataTable();                
                //table.destroy();



                $('#tbl_productos').DataTable({

                    "language": {
                        "url": "//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json"
                    },
                    pageLength: 10,
                    responsive: true,
                    'ajax': {
                        'url': "/nota/credito/obtener/productos",
                        'data': {
                            'idFactura': idFactura,
                            "_token": "{{ csrf_token() }}"
                        },
                        'type': 'post'
                    },
                    "columns": [{
                            data: 'nombre'
                        },
                        {
                            data: 'bodega'
                        },
                        {
                            data: 'precio_unidad'
                        },
                        {
                            data: 'cantidad'
                        },
                        {
                            data: 'unidad_medida'
                        },
                        {
                            data: 'sub_total'
                        },
                        {
                            data: 'isv'
                        },
                        {
                            data: 'total'
                        },
                        {
                            data: 'opciones'
                        },


                    ]


                });
            }

            function limpiarTablas(){
                $('#tbl_productos').DataTable().clear().destroy();
            }
            
            function infoProducto(facturaId, productoId){

                axios.post('/nota/credito/datos/producto',{idFactura:facturaId, idProducto:productoId})
                .then( response=>{

                    let data = response.data.datos;
                    let cantidadMax = response.data.cantidadMax;

                    document.getElementById('nombre').value=data.producto;
                    document.getElementById('idFactura').value=data.factura_id;
                    document.getElementById('idProducto').value=data.producto_id;
                    document.getElementById('idMedidaVenta').value=data.idUnidadVenta;
                    document.getElementById('unidad').value=data.unidad_medida;
                    document.getElementById('precio').value=data.precio_unidad;

                    document.getElementById('cantidad').max = cantidadMax;
                    document.getElementById('cantidad').min = 1;

                    let htmlBodega =`<option value="${data.bodegaId}" selected="" disabled="">${data.nombreBodega}</option>`;
                    let htmlSegmento = `<option value="${data.segmentoId}" selected="" disabled="">${data.segmento}</option>`;
                    let htmlSeccion = `<option value="${data.seccionId}" selected="" disabled="">${data.seccion}</option>`;

                    document.getElementById('bodega').innerHTML=htmlBodega;
                    document.getElementById('segmento').innerHTML=htmlSegmento;
                    document.getElementById('seccion').innerHTML=htmlSeccion;

                    $('#modal_devolver_producto').modal('show');


                })
                .catch( err=>{
                    console.log(err);
                    let data = err.response.data;
                        Swal.fire({
                            icon: data.icon,
                            title: data.title,
                            text: data.text,
                        })
                })

            }
        </script>
    @endpush

</div>
