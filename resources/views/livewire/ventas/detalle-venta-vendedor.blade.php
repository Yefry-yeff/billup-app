
<div>
    @push('styles')
    <style>
        .text-success-custom{
            color: #18A689!important;
        }
    </style>
    @endpush

    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-8 col-xl-10 col-md-8 col-sm-8">
            <h2>Detalle de Venta</h2>
            <ol class="breadcrumb"> 
                <li class="breadcrumb-item">
                    <a>Detalle de Venta</a>
                </li>
            </ol>
        </div>
    </div>

    <div class="row mt-2">
        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
            <div class="wrapper wrapper-content animated fadeInRight">
    
    
                <div class="ibox mb-0">
                    <div class="ibox-title">
                        <h3 class="text-success"><i class="fa-solid fa-list-check "></i> Informacion de venta</h3>
                    </div>
                    <div class="ibox-content"
                        style="height: 18.5rem;  display: flex; flex-direction: column; justify-content: space-between;">
                        <div>
                            <p class=" mb-2"> <strong> <i class="fa-solid fa-caret-right"></i> Codigo: 
                                </strong> {{$detalleVenta->id}} </p>
                            <p class="mt-2 mb-2"> <strong> <i class="fa-solid fa-caret-right"></i> Número de factura: 
                                </strong> {{$detalleVenta->numero_factura}}  </p>

                            <p class="mt-2 mb-2"> <strong> <i class="fa-solid fa-caret-right"></i> Cliente: 
                            </strong> {{$detalleVenta->nombre_cliente}} </p>
                            <p class="mt-2 mb-2"> <strong> <i class="fa-solid fa-caret-right"></i> RTN: 
                            </strong> {{$detalleVenta->rtn}} </p>
                            <p class="mt-2 mb-2"> <strong> <i class="fa-solid fa-caret-right"></i> Fecha de emisión:</strong> {{$detalleVenta->fecha_emision}} 
                                </p>
                            <p class="mt-2 mb-2"> <strong> <i class="fa-solid fa-caret-right"></i> Fecha de vencimiento:</strong> {{$detalleVenta->fecha_vencimiento}}</p>
                            <p class="mt-2 mb-2"> <strong> <i class="fa-solid fa-caret-right"></i> Estado de Factura: </strong> {{$detalleVenta->estado_venta}}</p>
                            <p class="mt-2 mb-2"> <strong> <i class="fa-solid fa-caret-right"></i> Venta realizada por: </strong> {{$detalleVenta->name}}</p> 
                            <p class="mt-2 mb-2"> <strong> <i class="fa-solid fa-caret-right"></i> Venta Facturada por: </strong> {{$nombre->name}}</p> 
                            <p class="mt-2 "> <strong> <i class="fa-solid fa-caret-right"></i> Fecha de registro: </strong> {{$detalleVenta->created_at}}</p>
                        </div>
    
                    </div>
                </div>
    
    
            </div>
        </div>
    
    

        <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
            <div class="wrapper wrapper-content animated fadeInRight">
    
    
                <div class="ibox mb-0">
                    <div class="ibox-title">
                        <h3 class="text-success"><i class="fa-solid fa-sack-dollar"></i> Importes</h3>
    
                    </div>
                    <div class="ibox-content "
                        style="height: 18.5rem; display: flex; flex-direction: column; justify-content: space-between;  ">
                        <p class="mt-2 mb-2 d-block"> <strong> <i class="fa-solid fa-caret-right"></i> Tipo de pago </strong> {{$detalleVenta->tipo_pago}}  </p>
                        <p class="mt-2 mb-2 d-block"> <strong> <i class="fa-solid fa-caret-right"></i> Tipo de cliente: </strong> {{$detalleVenta->tipo_venta}} </p>                       
                        <p class="mt-2 mb-2 d-block"> <strong> <i class="fa-solid fa-caret-right"></i> Comision del vendedor: </strong> {{$detalleVenta->monto_comision}} Lps.</p>  
                        <p class="mt-2 mb-2 d-block"> <strong> <i class="fa-solid fa-caret-right"></i> Sub total: </strong> {{$detalleVenta->sub_total}} Lps.</p>  
                        <p class="mt-2 mb-2 d-block"> <strong> <i class="fa-solid fa-caret-right"></i> ISV: </strong> {{$detalleVenta->isv}} Lps.</p>  
                        <p class="mt-2 mb-2 d-block"> <strong> <i class="fa-solid fa-caret-right"></i> Total: </strong> {{$detalleVenta->total}} Lps.</p>  

    
    
                    </div>
                </div>
    
    
            </div>
        </div>
    </div>

    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox ">
                    <div class="ibox-title">
                        <h3 class="text-success"><i class="fa-solid fa-rectangle-list"></i> Lista de compra </h3>
                    </div>
                    <div class="ibox-content">

                        <div class="table-responsive">
                            <table id="tbl_lista_venta" class="table table-striped table-bordered table-hover">
                                <thead class="">
                                    <tr>
                                       
                                        <th>ID Producto</th>
                                        <th>Nombre</th>
                                        <th>Unidad</th>
                                        <th>Precio Lps</th>
                                        <th>Cantidad</th>
                                        <th>Unidades Vendidas</th>
                                        <th>Sub total Lps</th>
                                        <th>ISV Lps</th>
                                        <th>Total Lps</th>
                                        
                                        

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

    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox ">
                    <div class="ibox-title">
                        <h3 class="text-success"><i class="fa-solid fa-location-dot"></i> Ubicaciones En Bodega</h3>
                    </div>
                    <div class="ibox-content">

                        <div class="table-responsive">
                            <table id="tbl_ubicacion_producto" class="table table-striped table-bordered table-hover">
                                <thead class="">
                                    <tr>
                                        <th>N° Factura</th>
                                        <th>Cod. Producto</th>
                                        <th>Nombre</th>
                                        <th>Marca</th>
                                        <th>Descripción </th>
                                        <th>Unidad</th>
                                        <th>Cantidad</th>
                                        <th>Dirección</th>
                                        <th>Bodega</th>
                                       
                                        <th>Sección</th>
                                        
                                        

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
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox ">
                    <div class="ibox-title">
                        <h3 class="text-success"><i class="fa-solid fa-cash-register"></i> Cobros Efectuados</h3>
                    </div>
                    <div class="ibox-content">

                        <div class="table-responsive">
                            <table id="tbl_pagos_venta_lista" class="table table-striped table-bordered table-hover">
                                <thead class="">
                                    <tr>
                                        <th>N°</th>
                                        <th>N° Factura</th>                                        
                                        <th>Monto Lps.</th>
                                        <th>Fecha</th>
                                        <th>Registrado por:</th>
                                        <th>Registrado en sistema:</th>                                      
                                       
                                    </tr>
                                </thead>  
                                <tbody>                                   
    
                                </tbody>
                            </table>
    
                        </div>

                        <div class="d-flex d-flex justify-content-between mt-4" >
                            <div >
                                <h3>Pendiente de Pago: <span class="text-danger"> {{$pendientePago}} Lps.</span> </h3>

                            </div>
                            <div >
                                <h3>Total Pagado: <span class="text-success"> {{$montoPagado->monto}} Lps.</span></h3>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    @push('scripts')

    <script>
        var idFactura = {{$detalleVenta->id}} ;
        var caiGlobal = {{$detalleVenta->cai}} 
        
        $(document).ready(function() {

                $('#tbl_lista_venta').DataTable({                
                    "language": {
                        "url": "//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json"
                    },
                    pageLength: 10,
                    responsive: true,          
                    "ajax": "/lista/productos/factura/"+idFactura,
                    "columns": [     
   
                        {
                            data: 'idProducto'
                        },
                        {
                            data: 'nombre'
                        },                    
          
                        {
                            data: 'unidad'
                        },
                        {
                            data: 'precio_unidad'
                        },
                        {
                            data: 'cantidad'
                        },
                        {
                            data: 'unidades_vendidas'
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
    
                    ]


                });


                $('#tbl_ubicacion_producto').DataTable({                
                    "language": {
                        "url": "//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json"
                    },
                    pageLength: 10,
                    responsive: true,
                    dom: '<"html5buttons"B>lTfgitp',
                    buttons: [

                    {
                        extend: 'copy'
                    },
                    {
                        extend: 'csv'
                    },
                    {
                        extend: 'excel',
                        title: 'Orden de Salida'
                    },
                    {
                        extend: 'pdf',
                        title: 'Orden de Salida'
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
                    "ajax": "/lista/ubicacion/producto/"+idFactura,
                    "columns": [  
                        {
                            data: 'numero_factura'
                        },       
                        {
                            data: 'idProducto'
                        },
                        {
                            data: 'producto'
                        },                    
          
                        {
                            data: 'marca'
                        },
                        {
                            data: 'descripcion'
                        },
                        {
                            data: 'unidad_venta'
                        },
                        {
                            data: 'cantidad_venta'
                        },
                        {
                            data: 'direccion'
                        },
                        {
                            data: 'bodega'
                        },

    
                        {
                            data: 'seccion'
                        },
    
                    ]


                });

                $('#tbl_pagos_venta_lista').DataTable({                
                    "language": {
                        "url": "//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json"
                    },
                    pageLength: 10,
                    responsive: true,          
                    "ajax": "/lista/pagos/venta/"+idFactura,
                    "columns": [  
                        {
                            data: 'contador'
                        },
                        {
                            data: 'numero_factura'
                        },                 
                        {
                            data: 'monto'
                        },
       
                        {
                            data: 'fecha'
                        },
                        {
                            data: 'name'
                        },
                        {
                            data: 'created_at'
                        },
                       
    
                    ]


                });

            })
    </script>

    @endpush
</div>

