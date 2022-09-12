<div>
    @push('styles')
        <style>


            
        </style>
    @endpush

    <div class="row wrapper border-bottom white-bg page-heading d-flex align-items-center">
        <div class="col-lg-8 col-xl-10 col-md-8 col-sm-8">
            <h2>Pagos de Compra</h2>

            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a >Listado</a>
                </li>
                <li class="breadcrumb-item">
                    <a>Registo</a>
                </li>

            </ol>
        </div>

        <div class="col-lg-4 col-xl-2 col-md-4 col-sm-4">
            <div style="margin-top: 1.5rem">
                <a href="#" class="btn add-btn btn-primary" data-toggle="modal" data-target="#modal_registro_pagos"><i
                        class="fa fa-plus"></i> Registrar Pago de factura</a>
            </div>
        </div>
    </div>

    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox ">
                    <div class="ibox-content">
                        <div class="d-flex justify-content-between my-2">
                            <h3>Debito: <span id="debitoCompra" class="text-danger"></span></h3>
                            <h3>Total de compra: <span id="totalComra" class="text-info"></span></h3>
                            <h3>Retencion del 1%: <span id="retencion" class="text-warning "></span></h3>

                        </div>
                        <hr>
                        <div class="table-responsive">
                            <table id="tbl_listar_pagos" class="table table-striped table-bordered table-hover">
                                <thead class="">
                                    <tr>
                                        <th>N° de Pago</th>
                                        <th>Codigo</th>
                                        <th>N° Factura</th>
                                        <th>N° Compra</th>
                                        <th>Monto</th>
                                        <th>Fecha de Pago</th>
                                        <th>Registrado por:</th>
                                        <th>Registrado en sistema:</th>
                                        <th>Evidencia</th>
                                        <th>Eliminar Pago</th>                                          
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>

                        </div>
                        <a id="btn_print_retencion" class="btn btn-w-m btn-success d-none" href="/compra/retencion/documento/{{$id}}" target="_blank"><i class="fa-solid fa-print "></i> Imprimir Documento De Retención</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

        <!---MODAL PARA REGISTRAR PAGOS----->
        <div id="modal_registro_pagos" class="modal custom-modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered ">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title text-success">Registro de Pagos</h5>
                        </h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="form_registro_pago" name="form_registro_pago" data-parsley-validate>

                            <input type="hidden" id="compraId" name="compraId">
                     
                            <div class="row" >
                                
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                                    <label class="col-form-label focus-label">Numero de Factura:<span class="text-danger">*</span></label>
                                    <input class="form-control" required type="text"  id="numero_factura" name="numero_factura" readonly 
                                      value="{{$datosCompra->numero_factura}}"  data-parsley-required>
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                                    <label for="numero_compra" class="col-form-label focus-label">Numero de Compra:<span class="text-danger">*</span></label>
                                    <input class="form-control" required type="text"  id="numero_compra" name="numero_compra" readonly
                                        data-parsley-required value="{{$datosCompra->numero_compra}}">
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                                    <label for="proveedor" class="col-form-label focus-label">Proveedor:<span class="text-danger">*</span></label>
                                    <input class="form-control" required type="text"  id="proveedor" name="proveedor" readonly
                                        data-parsley-required value="{{$datosCompra->nombre}}">
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                                    <label for="monto" class="col-form-label focus-label">Monto a pagar:<span class="text-danger">*</span></label>
                                    <input class="form-control" required type="number" step="any" id="monto" name="monto" min="0"
                                        data-parsley-required>
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 mt-3">
                                    <label for="fecha_pago" class="col-form-label focus-label">Fecha que se realizo el pago:<span class="text-danger">*</span></label>
                                    <input class="form-control" required type="date" id="fecha_pago" name="fecha_pago"
                                        data-parsley-required>
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 mt-3">
                                    <label for="img_pago" class="col-form-label focus-label">Documento de Pago:<span class="text-danger">*</span></label>
                                    <input class="form-control" required  id="img_pago" name="img_pago" type="file" accept="image/png, image/jpeg, image/jpg, application/pdf"
                                        data-parsley-required>
                                </div>
                            </div>
                        </form>
                        <button id="btn_registro_pago" class="btn btn-sm btn-primary float-left mt-4"
                            form="form_registro_pago" >
                            <strong>Registrar Pago
                                </strong>
                               
                            </button>
                    </div>
    
                </div>
            </div>
        </div>
   
    @push('scripts')

    
    <script>
        var idCompra = {{$id}};
        var retencionEstado = 0;//cero no aplica retencion , 1 aplica retencion

        //window.onload=datosCompra;
        

        $(document).ready(
            function() {

            datosCompra();    
          
            $('#tbl_listar_pagos').DataTable({
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json"
                },
                pageLength: 10,
                responsive: true,
                "ajax": "/producto/compra/pagos/lista/"+idCompra,
                "columns": [
                                {
                                    data: 'contador'
                                },
                                {
                                    data: 'id'
                                },
                                {
                                    data: 'numero_factura'
                                },
                                {
                                    data: 'numero_orden'
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
                                {
                                    data:'documento'
                                },
                                {
                                    data: 'opciones'
                                },
                    
                            ]


            });              
        
        }
       
        );
    

        $(document).on('submit', '#form_registro_pago', function(event) {
        event.preventDefault();
        retencionComprobar();
        });



        function registrarPago(){

            document.getElementById('btn_registro_pago').disabled = true;
            

            document.getElementById("compraId").value=idCompra;
            var data = new FormData($('#form_registro_pago').get(0));
            data.append('retencionEstado',retencionEstado);

            axios.post('/producto/compra/pagos/registro', data)
            .then( response =>{

                let data = response.data;

                if(data.icon == "success"){
                    document.getElementById('form_registro_pago').reset();
                   
                   $('#form_registro_pago').parsley().reset();
                   $('#modal_registro_pagos').modal('hide')  
   
                   Swal.fire({
                   icon: data.icon,
                   title: data.title,
                   text: data.text,
                   })
   
                   datosCompra();
                   $('#tbl_listar_pagos').DataTable().ajax.reload();  
                   document.getElementById('btn_registro_pago').disabled = false;
                }

                Swal.fire({
                   icon: data.icon,
                   title: data.title,
                   text: data.text,
                   })

                   document.getElementById('form_registro_pago').reset();
                   
                   $('#form_registro_pago').parsley().reset();
                   $('#modal_registro_pagos').modal('hide')  
                   document.getElementById('btn_registro_pago').disabled = false;
                   return;

   

            })
            .catch( err =>{
                document.getElementById('btn_registro_pago').disabled = false;
                Swal.fire({
                icon: 'error',
                title: 'Error!',
                text: 'Ha ocurrido un error al guardar el registro de pago!',
                })

                console.log(err);

            })
            

        }

        function datosCompra(){
            axios.post('/producto/compra/pagos/datos',{idCompra:idCompra})
            .then( response =>{

                let data = response.data.compra;

            document.getElementById("debitoCompra").innerHTML = new Intl.NumberFormat('en-IN', { style: 'currency', currency: 'Lps' }).format(data.debito); 
            document.getElementById("totalComra").innerHTML = new Intl.NumberFormat('en-IN', { style: 'currency', currency: 'Lps' }).format(data.total);
            document.getElementById("retencion").innerHTML = new Intl.NumberFormat('en-IN', { style: 'currency', currency: 'Lps' }).format(data.monto_retencion);

            if(data.numero_secuencia_retencion){
               let btn= document.getElementById('btn_print_retencion');
               btn.classList.remove("d-none");
            }

            })
            .catch( err=>{

                Swal.fire({
                icon: 'error',
                title: 'Error!',
                text: 'Ha ocurrido un error al obtener los datos de compra!',
                })

                console.log(err);


            })
        }

        function confirmarEliminarPago(idPago){

            Swal.fire({
            title: '¿Esta seguro de eliminar este registro de pago?',
            text:'Si elimina este registro de pago, el mismo será restado a los abonos de la deuda.',
            showDenyButton: false,
            showCancelButton: true,
            confirmButtonText: 'Si, eliminar',
            
            cancelButtonText: `Cancelar`,
            }).then((result) => {
            /* Read more about isConfirmed, isDenied below */
            if (result.isConfirmed) {
                eliminarPago(idPago);
            } 
            })

        }

        function eliminarPago(idPago){

            axios.post('/producto/compra/pagos/eliminar', {idPago:idPago})
            .then( response =>{

                Swal.fire({
                icon: 'success',
                title: 'Exito!',
                text: 'El registro ha sido eliminado con exito!',
                })

                datosCompra();
                   $('#tbl_listar_pagos').DataTable().ajax.reload();  

            })
            .catch(err=>{
                Swal.fire({
                icon: 'error',
                title: 'Error!',
                text: 'Ha ocurrido un error a eliminar el registro!',
                });

                console.log(err);

            })

        }

        function retencionComprobar(){
            $('#modal_registro_pagos').modal('hide');

            axios.post("/producto/compra/pagos/comprobar",{idCompra:idCompra})
            .then( response =>{

                let data = response.data.numero_pagos;

                
                if(data.numero_pagos == 0){
                    Swal.fire({
                            title: "Retencion del 1%",
                            text: "¿Desea aplicar retención del 1% a esta compra?",
                            showDenyButton: true,
                            showCancelButton: true,
                            confirmButtonText: 'Aplicar',
                            denyButtonText: `No aplicar`,
                            cancelButtonText: 'Cancelar',
                        }).then((result) => {
                            /* Read more about isConfirmed, isDenied below */
                            if (result.isConfirmed) {
                                Swal.fire('La retencion sera aplicada a esta compra!', '', 'success')
                                retencionEstado = 1;
                                this.registrarPago(); 
                              
                            } else if (result.isDenied) {
                                Swal.fire('¡No se aplicara retencion a esta compra!', '', 'info')
                                retencionEstado = 0;
                                this.registrarPago();                               
                            }
                        })

                }else{
                    this.registrarPago();
                }

            })
            .catch( err =>{

                console.log(err);

            })


        }

    </script>
    @endpush
</div>
