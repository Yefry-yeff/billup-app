<div>
    @push('styles')
    @endpush

    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-8 col-xl-10 col-md-8 col-sm-8">
            <h2>Listado De Facturas </h2>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active">
                    <a>Estatal</a>
                </li>

                <li class="breadcrumb-item">
                    <a>Detalle de factura</a>
                </li>
                <li class="breadcrumb-item">
                    <a>Entregas Programadas</a>
                </li>
            </ol>
        </div>
    </div>

    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox ">
                    <div class="ibox-content">
                        <div class="table-responsive">
                            <table id="tbl_listar_compras" class="table table-striped table-bordered table-hover">
                                <thead class="">
                                    <tr>
                                        <th>Codigo Interno</th>
                                        <th>N° Factura</th>
                                       
                                        <th>Fecha de Emision</th>
                                        <th>Cliente</th>
                                        <th>Tipo de Pago</th>
                                        <th>Fecha de Vencimiento</th>
                                        <th>Sub Total Lps.</th>
                                        <th>ISV en Lps.</th>
                                        <th>Total en Lps.</th>
                                        <th>Esto de Cobro</th>
                                        <th>Vendedor</th>
                                        <th>Opciones</th>
                                        
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

    @push('scripts')
        <script>
            $(document).ready(function() {
            $('#tbl_listar_compras').DataTable({
                "order": [0, 'desc'],
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json"
                },
                
                pageLength: 10,
                responsive: true,
              

                "ajax": "/lista/facturas/estatal",
                "columns": [
                    {
                        data: 'id'
                    },
                    {
                        data: 'numero_factura'
                    },
                    
                    {
                        data: 'fecha_emision'
                    },
                    {
                        data: 'nombre'
                    },
                    {
                        data: 'descripcion'
                    },
                    {
                        data: 'fecha_vencimiento'
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
                        data: 'estado_cobro'
                    },
                    {
                        data: 'creado_por'
                    },
   
                    {
                        data: 'opciones'
                    }
  
                ]


            });
            })

            function anularVentaConfirmar(idFactura){
             
             Swal.fire({
             title: '¿Está seguro de anular esta factura?',
             
          
   // --------------^-- define html element with id
             html: '<p>Una vez que ha sido anulada la factura el producto registrado en la misma sera devuelto al inventario.</p> <textarea rows="4" placeholder="Es obligatorio describir el motivo." required id="comentario"     class="form-group form-control" data-parsley-required></textarea>',
             showDenyButton: false,
             showCancelButton: false,
             showDenyButton:true,
             confirmButtonText: 'Si, Anular Factura',            
             denyButtonText: `Cancelar`,
             confirmButtonColor:'#19A689',
             denyButtonColor:'#676A6C',
             }).then((result) => {
            
                 let motivo = document.getElementById("comentario").value
 
             if (result.isConfirmed && motivo ) {
 
                
                 anularVenta(idFactura,motivo);
 
             }else if(result.isDenied){
                 Swal.close()
             }else{
                 Swal.close()
             }
             })
         }
 
         function anularVenta(idFactura,motivo){
 
             axios.post("/factura/corporativo/anular", {'idFactura':idFactura,'motivo':motivo})
             .then( response =>{
 
 
                 let data = response.data;
                 Swal.fire({
                             icon: data.icon,
                             title: data.title,
                             html: data.text,
                         });
                         $('#tbl_listar_compras').DataTable().ajax.reload();        
 
             })
             .catch( err => {
 
                 Swal.fire({
                             icon: 'error',
                             title: 'Error!',
                             text: 'Ha ocurrido un error al anular la compra.',
                         })
 
             })
 
         }
        </script>
    @endpush
</div>

