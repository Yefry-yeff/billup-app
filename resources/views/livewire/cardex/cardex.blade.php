<div>
    <div class="row wrapper border-bottom white-bg page-heading d-flex align-items-center">
        <div class="col-lg-12 col-xl-12 col-md-12 col-sm-12">
            <h2>Usuarios</h2>

            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="index.html">Lista</a>
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
                                <label for="seleccionarBodega" class="col-form-label focus-label">Seleccionar Bodega:<span class="text-danger">*</span></label>
                                <select id="bodega" name="bodega" class="form-group form-control" style=""
                                    data-parsley-required onchange="obtenerIdBodega()">
                                    <option value="" selected disabled>--Seleccionar una Bodega--</option>
                                </select>
                            </div>

                            <div class="col-6 col-sm-6 col-md-6">
                                <label for="seleccionarProducto" class="col-form-label focus-label">Seleccionar Producto:<span class="text-danger">*</span></label>
                                <select id="producto" name="producto" class="form-group form-control" style=""
                                    data-parsley-required >
                                    <option value="" selected disabled>--Seleccionar una Producto--</option>
                                </select>
                            </div>

                        </div>
                        <button class="btn btn-primary" onclick="cargaCardex()"><i class="fa-solid fa-paper-plane text-white"></i> Solicitar</button>
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
                            <table id="tbl_cardex" class="table table-striped table-bordered table-hover">
                                <thead class="">
                                    <tr>
                                        <th>Fecha de gestion</th>
                                        <th>Producto</th>
                                        <th>Codigo de producto</th>
                                        <th>Factura</th>
                                        <th>Ajuste</th>
                                        <th>Compra</th>
                                        <th>Descripcion</th>
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




</div>
@push('scripts')

<script>


    cargarBodegas();

    function cargarBodegas(){
        $('#bodega').select2({
            ajax: {
                url: '/cardex/listar/bodega',
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


    }

    function obtenerIdBodega() {

        var idBodega = document.getElementById('bodega').value;
        obtenerProductos();
    }

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

    function cargaCardex(){

        $("#tbl_cardex").dataTable().fnDestroy();

        var idBodega = document.getElementById('bodega');
        var idProducto = document.getElementById('producto');
        console.log(idBodega.options[idBodega.selectedIndex].text, idProducto.options[idProducto.selectedIndex].text);
        $('#tbl_cardex').DataTable({
            "order": [0, 'asc'],
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
</script>

@endpush
