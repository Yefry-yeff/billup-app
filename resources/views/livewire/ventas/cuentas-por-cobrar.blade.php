<div>
    <div class="row wrapper border-bottom white-bg page-heading d-flex align-items-center">
        <div class="col-lg-12 col-xl-12 col-md-12 col-sm-12">
            <h2>Cuentas por Cobrar</h2>

            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="index.html">Listar</a>
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


                            <div class="col-6 col-sm-6 col-md-6 ">
                                <label for="cliente" class="col-form-label focus-label">Seleccionar Cliente:<span class="text-danger">*</span></label>
                                <select id="cliente" name="cliente" class="form-group form-control" style=""
                                    data-parsley-required >
                                    <option value="" selected disabled>--Seleccionar un Cliente--</option>
                                </select>
                            </div>
<!--
                            <div class="col-6 col-sm-6 col-md-6">
                                <label for="producto" class="col-form-label focus-label">Seleccionar Producto:<span class="text-danger">*</span></label>
                                <select id="producto" name="producto" class="form-group form-control" style=""
                                    data-parsley-required >
                                    <option value="" selected disabled>--Seleccionar una Producto--</option>
                                </select>
                            </div>
-->
                        </div>
                        <button class="btn btn-primary" onclick="listarCuentasPorCobrar()"><i class="fa-solid fa-paper-plane text-white"></i> Solicitar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox ">
                    <div class="ibox-content">
                        <div class="table-responsive">
                            <table id="tbl_cuentas_por_cobrar" class="table table-striped table-bordered table-hover">
                                <thead class="">
                                    <tr>
                                        <th>Cliente</th>
                                        <th>Numero Factura</th>
                                        <th>Fecha Emision</th>
                                        <th>Fecha Vencimiento</th>
                                        <th>Cargo</th>
                                        <th>Credito</th>
                                        <th>Saldo</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

        <div style="margin-top: 1.5rem; margin: 0 40%; width: 20%" id="cuentas_excel">
            <a href="/ventas/cuentas_por_cobrar/excel_cuentas" class="btn-seconary"><i class="fa fa-plus"></i> Exportar Excel Cuentas Por Cobrar</a>
        </div>


    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox ">
                    <div class="ibox-content">
                        <div class="table-responsive">
                            <table id="tbl_cuentas_por_cobrar_intereses" class="table table-striped table-bordered table-hover">
                                <thead class="">
                                    <tr>
                                        <th>Fecha de gesti��n</th>
                                        <th>Producto</th>
                                        <th>C��digo de producto</th>
                                        <th>Factura</th>
                                        <th>Ajuste</th>
                                        <th>Compra</th>
                                        <th>Descripci��n</th>
                                        <th>Origen</th>
                                        <th>Destino</th>
                                        <th>Cantidad</th>
                                        <th>Usuario</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

        <div style="margin-top: 1.5rem; margin: 0 40%; width: 20%" id="cuentas_excel_intereses">
            <a href="/ventas/cuentas_por_cobrar/excel_intereses" class="btn-seconary"><i class="fa fa-plus"></i>Excel Cuentas Por Cobrar Intereses</a>
        </div>


</div>
@push('scripts')

<script>


        $('#cliente').select2({
            ajax: {
                url: '/ventas/cuentas_por_cobrar/clientes',
                data: function(params) {
                    var query = {
                        search: params.term,
                        type: 'public',
                        page: params.page || 1
                    }

                    
                    return query;
                }
            }
        });

        /*

        $('#producto').select2({
            ajax: {
                url: '/ventas/cuentas_por_cobrar/productos',
                data: function(params) {
                    var query = {
                        search: params.term,
                        type: 'public',
                        page: params.page || 1
                    }

                    
                    return query;
                }
            }
        });

        */
    

    function listarCuentasPorCobrar() {

        $('#tbl_cuentas_por_cobrar').DataTable({
                    "order": [0, 'desc'],
                    "language": {
                        "url": "//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json"
                    },
                    pageLength: 10,
                    responsive: true,
                    dom: '<"html5buttons"B>lTfgitp',
                    buttons: [{
                            extend: 'copy'
                        },
                        {
                            extend: 'csv'
                        },
                        {
                            extend: 'excel',
                            title: 'ExampleFile'
                        },
                        {
                            extend: 'pdf',
                            title: 'ExampleFile'
                        },

                        {
                            extend: 'print',
                            customize: function(win) {
                                $(win.document.body).addClass('white-bg');
                                $(win.document.body).css('font-size', '10px');

                                $(win.document.body).find('table')
                                    .addClass('compact')
                                    .css('font-size', 'inherit');
                            }
                        }
                    ],
                    "ajax": "/ventas/cuentas_por_cobrar/listar",
                    "columns": [{
                            data: 'cliente'
                        },
                        {
                            data: 'documento'
                        },
                        {
                            data: 'fecha_emision'
                        },                        
                        {
                            data: 'fecha_vencimiento'
                        },
                        {
                            data: 'cargo'
                        },
                        {
                            data: 'credito'
                        },
                        {
                            data: 'saldo'
                        }

                    ]


                });
    }

    /*
    function obtenerProductos(){
        var idBodega = document.getElementById('bodega').value;
        $('#producto').select2({
            ajax: {
                url: '/cardex/listar/productos',
                data: function(params) {
                    var query = {
                        search: params.term,
                        idBodega:idBodega,
                        type: 'public',
                        page: params.page || 1
                    }

                    // Query parameters will be ?search=[term]&type=public
                    return query;
                }
            }
        });
    }
    */

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    /*
    function cargaCardex(){

        $("#tbl_cardex").dataTable().fnDestroy();

        var idBodega = document.getElementById('bodega');
        var idProducto = document.getElementById('producto');
        console.log(idBodega.options[idBodega.selectedIndex].text, idProducto.options[idProducto.selectedIndex].text);
        $('#tbl_cardex').DataTable({
            "order": [0, 'desc'],
            "paging": false,
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json"
            },
            pageLength: 10,
            responsive: true,
            dom: '<"html5buttons"B>lTfgitp',
            buttons: [{
                    extend: 'copy'
                },
                {
                    extend: 'csv'
                },
                {
                    extend: 'excel',
                    title: 'Cardex'
                },
                {
                    extend: 'pdf',
                    title: 'Cardex'
                },

                {
                    extend: 'print',
                    title: '',
                    customize: function(win) {
                        $(win.document.body).addClass('white-bg');
                        $(win.document.body).css('font-size', '10px');

                        $(win.document.body).find('table')
                            .addClass('compact')
                            .css('font-size', 'inherit');
                    }
                }
            ],
            "ajax": "/listado/cardex/"+idBodega.value+"/"+idProducto.value,
            "columns": [
                {
                    data: 'fechaIngreso'
                },
                {
                    data: 'producto'
                },
                {
                    data: 'codigoProducto'
                },
                {
                    data: 'doc_factura'
                },
                {
                    data: 'doc_ajuste'
                },
                {
                    data: 'detalleCompra'
                },
                {
                    data: 'descripcion'
                },
                {
                    data: 'origen'
                },
                {
                    data: 'destino'
                },
                {
                    data: 'cantidad'
                },
                {
                    data: 'usuario'
                },
            ]


        });
    }
    */
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
</script>

@endpush