<?php

namespace App\Http\Livewire\Ventas;

use Livewire\Component;


use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use DataTables;
use Auth;
use Validator;
use PDF;
use Luecano\NumeroALetras\NumeroALetras;

use App\Models\ModelFactura;
use App\Models\ModelCAI;
use App\Models\ModelRecibirBodega;
use App\Models\ModelVentaProducto;
use App\Models\ModelLogTranslados;
use App\Models\ModelParametro;
use App\Models\ModelLista;
use App\Models\ModelCliente;
use App\Models\logCredito;
use App\Models\User;

class FacturacionCorporativa extends Component
{
    public $arrayProductos = [];
    public $arrayLogs = [];

    public function render()
    {
        return view('livewire.ventas.facturacion-corporativa');
    }

    public function listarClientes(Request $request)
    {
        try {


                $listaClientes = DB::SELECT("
                select 
                    id,
                    nombre as text
                from cliente
                    where estado_cliente_id = 1
                    and tipo_cliente_id=1                           
                    and  (id LIKE '%" . $request->search . "%' or nombre Like '%" . $request->search . "%') limit 15
                        ");
/*

            if (Auth::user()->rol_id == 1) {
                $listaClientes = DB::SELECT("
                select 
                    id,
                    nombre as text
                from cliente
                    where estado_cliente_id = 1
                    and tipo_cliente_id=1                           
                    and  (id LIKE '%" . $request->search . "%' or nombre Like '%" . $request->search . "%') limit 15
                        ");
            } else {
                $listaClientes = DB::SELECT("
                select 
                    id,
                    nombre as text
                from cliente
                    where estado_cliente_id = 1
                    and tipo_cliente_id=1
                    and vendedor =" . Auth::user()->id . "             
                    and  (id LIKE '%" . $request->search . "%' or nombre Like '%" . $request->search . "%') limit 15
                        ");
            }

*/

            return response()->json([
                "results" => $listaClientes,
            ], 200);
        } catch (QueryException $e) {
            return response()->json([
                'message' => 'Ha ocurrido un error',
                'error' => $e
            ], 402);
        }
    }

    public function datosCliente(Request $request)
    {
        try {

            $datos = DB::SELECTONE("select id,nombre, rtn, dias_credito from cliente where id = " . $request->id);

            return response()->json([
                "datos" => $datos
            ], 200);
        } catch (QueryException $e) {
            return response()->json([
                'message' => 'Ha ocurrido un error',
                'error' => $e
            ], 402);
        }
    }


    public function tipoPagoVenta()
    {
        try {

            $tipos = DB::SELECT("select id, descripcion from tipo_pago_venta");
            $numeroVenta = DB::selectOne("select concat(YEAR(NOW()),'-',count(id)+1)  as 'numero' from factura");

            return response()->json([
                "tipos" => $tipos,
                "numeroVenta" => $numeroVenta
            ], 200);
        } catch (QueryException $e) {
            return response()->json([
                'message' => 'Ha ocurrido un error',
                'error' => $e
            ], 402);
        }
    }

    public function listarBodegas(Request $request)
    {
        try {

            $results = DB::SELECT("
        select 
            A.seccion_id as id,
            D.id as 'idBodega',
            CONCAT(D.nombre,'',REPLACE(B.descripcion,'Seccion','')) as 'bodegaSeccion',                        
            concat(D.nombre,' - ', REPLACE(B.descripcion,'Seccion',''),' - cantidad ',sum(A.cantidad_disponible)) as 'text'
        from recibido_bodega A
            inner join seccion B
            on A.seccion_id = B.id
            inner join segmento C
            on B.segmento_id = C.id
            inner join bodega D
            on C.bodega_id = D.id
        where  A.cantidad_disponible <> 0 and producto_id = " . $request->idProducto . "   
        and (D.nombre LIKE '%" . $request->search . "%' or B.descripcion LIKE '%" . $request->search . "%')
        group by A.seccion_id       
            ");

            return response()->json([
                "results" => $results
            ], 200);
        } catch (QueryException $e) {
            return response()->json([
                'message' => 'Ha ocurrido un error',
                'error' => $e
            ], 402);
        }
    }

    public function productoBodega(Request $request)
    {
        try {


            $listaProductos = DB::SELECT("
         select 
            B.id,
            concat('cod ',B.id,' - ',B.nombre,' - ','cantidad ',sum(A.cantidad_disponible)) as text
         from
            recibido_bodega A
            inner join producto B
            on A.producto_id = B.id
            inner join seccion
            on A.seccion_id = seccion.id
            inner join segmento
            on seccion.segmento_id = segmento.id
            inner join bodega
            on segmento.bodega_id = bodega.id
         where 
         A.cantidad_disponible <> 0 and
         (B.nombre LIKE '%" . $request->search . "%' or B.id LIKE '%" . $request->search . "%')
         group by A.producto_id
         limit 15
         ");

            return response()->json([
                "results" => $listaProductos
            ], 200);
        } catch (QueryException $e) {
            return response()->json([
                'message' => 'Ha ocurrido un error',
                'error' => $e
            ]);
        }
    }


    public function obtenerImagenes(Request $request)
    {
        try {
            $imagenes = DB::SELECT("
        
        select
            @i := @i + 1 as contador,
            id,
            url_img
        from 
            img_producto
            cross join (select @i := 0) r
            where producto_id = " . $request['id'] . "

        ");

            return response()->json([
                "imagenes" => $imagenes,
            ], 200);
        } catch (QueryException $e) {
            return response()->json([
                'message' => 'Ha ocurrido un error al listar las imagenes.',
                'errorTh' => $e,
            ], 402);
        }
    }

    public function obtenerDatosProducto(Request $request)
    {

        try {

            // $secciones = DB::SELECT("
            // select 
            //     B.id,
            //     B.descripcion,
            //     D.nombre
            // from recibido_bodega A
            //     inner join seccion B
            //     on A.seccion_id = B.id
            //     inner join segmento C
            //     on B.segmento_id = C.id
            //     inner join bodega D
            //     on C.bodega_id = D.id
            // where producto_id = ".$request->idProducto." and D.id =".$request->idBodega."
            // group by B.id
            // ");

            $unidades = DB::SELECT(
                "
            select 
                A.unidad_venta as id,
                CONCAT(B.nombre,'-',A.unidad_venta) as nombre ,
                A.unidad_venta_defecto as 'valor_defecto',
                A.id as idUnidadVenta
            from unidad_medida_venta A
            inner join unidad_medida B
            on A.unidad_medida_id = B.id
            where A.estado_id = 1 and A.producto_id = " . $request->idProducto
            );

            $producto = DB::SELECTONE("
            select
            id,
            concat(nombre,' - ',codigo_barra) as nombre,
            isv,
            FORMAT(ultimo_costo_compra,2) as ultimo_costo_compra,
            FORMAT(precio_base,2) as precio_base
            from producto where id = " . $request['idProducto'] . "
            ");


            return response()->json([
                "producto" => $producto,

                "unidades" => $unidades
            ], 200);
        } catch (QueryException $e) {
            return response()->json([
                'message' => 'Ha ocurrido un error al obtener los datos del producto.',
                'error' => $e,
            ], 402);
        }
    }

    public function guardarVenta(Request $request)
    {
        try {

            $validator = Validator::make($request->all(), [

                'fecha_vencimiento' => 'required',                
                'subTotalGeneral' => 'required',
                'isvGeneral' => 'required',
                'totalGeneral' => 'required',
                'arregloIdInputs' => 'required',
                'numeroInputs' => 'required',
                'seleccionarCliente' => 'required',
                'nombre_cliente_ventas' => 'required',
                'tipoPagoVenta' => 'required',    
                'restriccion' => 'required',
                'vendedor'=>'required'



            ]);

             //dd($request->all());

            if ($validator->fails()) {
                return response()->json([
                    'icon' => 'error',
                    'title' => 'error',
                    'text' => 'Por favor, verificar que todos los campos esten completados.',
                    'mensaje' => 'Ha ocurrido un error al crear la compra.',
                    'errors' => $validator->errors()
                ], 401);
            }
            //

            if ($request->restriccion == 1) {
                $facturaVencida = $this->comprobarFacturaVencida($request->seleccionarCliente);

                if ($facturaVencida) {
                    return response()->json([
                        'icon' => 'warning',
                        'title' => 'Advertencia!',
                        'text' => 'El cliente ' . $request->nombre_cliente_ventas . ', cuenta con facturas vencidas. Por el momento no se puede emitir factura a este cliente.',

                    ], 401);
                }
                
            }

            if($request->tipoPagoVenta == 2){
                $comprobarCredito = $this->comprobarCreditoCliente($request->seleccionarCliente,$request->totalGeneral);

                if ($comprobarCredito) {
                    return response()->json([
                        'icon' => 'warning',
                        'title' => 'Advertencia!',
                        'text' => 'El cliente ' . $request->nombre_cliente_ventas . ', no cuenta con crédito suficiente . Por el momento no se puede emitir factura a este cliente.',

                    ], 401);
                }
            }

            //dd($request->all());
            $arrayInputs = [];
            $arrayInputs = $request->arregloIdInputs;
            //$arrayProductosVentas = [];
            $numeroSecuencia = null;
            $mensaje = "";
            $flag = false;
            // $turno = null;
            $factura = null;

            //comprobar existencia de producto en bodega
            for ($j = 0; $j < count($arrayInputs); $j++) {

                $keyIdSeccion = "idSeccion" . $arrayInputs[$j];
                $keyIdProducto = "idProducto" . $arrayInputs[$j];
                $keyRestaInventario = "restaInventario" . $arrayInputs[$j];
                $keyNombre = "nombre" . $arrayInputs[$j];
                $keyBodega = "bodega" . $arrayInputs[$j];

                $resultado = DB::selectONE("select 
            if(sum(cantidad_disponible) is null,0,sum(cantidad_disponible)) as cantidad_disponoble
            from recibido_bodega
            where cantidad_disponible <> 0
            and producto_id = " . $request->$keyIdProducto . "
            and seccion_id = " . $request->$keyIdSeccion);

                if ($request->$keyRestaInventario > $resultado->cantidad_disponoble) {
                    $mensaje = $mensaje . "Unidades insuficientes para el producto: <b>" . $request->$keyNombre . "</b> en la bodega con sección :<b>" . $request->$keyBodega . "</b><br><br>";
                    $flag = true;
                }
            }

            if ($flag) {
                return response()->json([
                    'icon' => "warning",
                    'text' =>  '<p class="text-left">' . $mensaje . '</p>',
                    'title' => 'Advertencia!',
                    'idFactura' => 0,

                ], 200);
            }

            $flagEstado = DB::SELECTONE("select estado_encendido from parametro where id = 1");
           
            if ($flagEstado->estado_encendido == 1) {
                $estado = 1;
            } else {
                $estado = 2;
            }







            DB::beginTransaction();




            if ($estado == 1) 
            {
                //presenta

                $cai = DB::SELECTONE("select
                id,
                numero_inicial,
                numero_final,
                cantidad_otorgada,
                numero_actual
                from cai 
                where tipo_documento_fiscal_id = 1 and estado_id = 1");

                if($cai->numero_actual > $cai->cantidad_otorgada){

                    return response()->json([
                        "title" => "Advertencia",
                        "icon" => "warning",
                        "text" => "La factura no puede proceder, debido que ha alcanzadado el número maximo de facturacion otorgado 1.",
                    ], 401);

                }




            

                $numeroSecuencia = $cai->numero_actual;
                $arrayCai = explode('-',$cai->numero_final);          
                $cuartoSegmentoCAI = sprintf("%'.08d", $numeroSecuencia);
                $numeroCAI = $arrayCai[0].'-'.$arrayCai[1].'-'.$arrayCai[2].'-'.$cuartoSegmentoCAI; 
                    // dd($cai->cantidad_otorgada);



                $montoComision = $request->totalGeneral*0.5;

                if($request->tipoPagoVenta==1){
                    $diasCredito = 0;
                }else{
                    $dias = DB::SELECTONE("select dias_credito from cliente where id = ".$request->seleccionarCliente);
                    $diasCredito = $dias->dias_credito;
                }

                $numeroVenta = DB::selectOne("select concat(YEAR(NOW()),'-',count(id)+1)  as 'numero' from factura");
                
                $factura = new ModelFactura;    
                $factura->numero_factura = $numeroVenta->numero;       
                $factura->cai=$numeroCAI; 
                $factura->numero_secuencia_cai=$numeroSecuencia;
                $factura->nombre_cliente = $request->nombre_cliente_ventas;
                $factura->rtn=$request->rtn_ventas;
                $factura->sub_total=$request->subTotalGeneral;
                $factura->isv=$request->isvGeneral;
                $factura->total=$request->totalGeneral;
                $factura->credito=$request->totalGeneral;
                $factura->fecha_emision=$request->fecha_emision;
                $factura->fecha_vencimiento=$request->fecha_vencimiento;                    
                $factura->tipo_pago_id=$request->tipoPagoVenta;
                $factura->dias_credito=$diasCredito;
                $factura->cai_id=$cai->id;
                $factura->estado_venta_id=1;
                $factura->cliente_id=$request->seleccionarCliente;
                $factura->vendedor=$request->vendedor;
                $factura->monto_comision=$montoComision;
                $factura->tipo_venta_id=2;// estatal
                $factura->estado_factura_id=1; // se presenta     
                $factura->users_id = Auth::user()->id;              
                $factura->comision_estado_pagado=0;
                $factura->pendiente_cobro=$request->totalGeneral;
                $factura->estado_editar = 1;              
                $factura->codigo_autorizacion_id = $request->codigo_autorizacion;
                $factura->save();

                $caiUpdated =  ModelCAI::find($cai->id);
                $caiUpdated->numero_actual=$numeroSecuencia+1;
                $caiUpdated->cantidad_no_utilizada=$cai->cantidad_otorgada - $numeroSecuencia;
                $caiUpdated->save();


            } else {
                // alterna
                $lista = DB::SELECT("select id, numero from listado where eliminado = 0");
                $espera = DB::SELECT("select id from enumeracion where eliminado = 0");

                if (!empty($lista)) {

                    $factura = $this->metodoLista($request);
                } else if (!empty($espera)) {

                    $factura = $this->enumerar($request);
                } else {

                    $factura = $this->alternar($request);
                }
            }



            for ($i = 0; $i < count($arrayInputs); $i++) {

                $keyRestaInventario = "restaInventario" . $arrayInputs[$i];

                $keyIdSeccion = "idSeccion" . $arrayInputs[$i];
                $keyIdProducto = "idProducto" . $arrayInputs[$i];
                $keyIdUnidadVenta = "idUnidadVenta" . $arrayInputs[$i];
                $keyPrecio = "precio" . $arrayInputs[$i];
                $keyCantidad = "cantidad" . $arrayInputs[$i];
                $keySubTotal = "subTotal" . $arrayInputs[$i];
                $keyIsv = "isvProducto" . $arrayInputs[$i];
                $keyTotal = "total" . $arrayInputs[$i];
                $keyISV = "isv" . $arrayInputs[$i];
                $keyunidad = 'unidad' . $arrayInputs[$i];

                $restaInventario = $request->$keyRestaInventario;
                $idSeccion = $request->$keyIdSeccion;
                $idProducto = $request->$keyIdProducto;
                $idUnidadVenta = $request->$keyIdUnidadVenta;
                $ivsProducto = $request->$keyISV;
                $unidad = $request->$keyunidad;

                $precio = $request->$keyPrecio;
                $cantidad = $request->$keyCantidad;
                $subTotal = $request->$keySubTotal;
                $isv = $request->$keyIsv;
                $total = $request->$keyTotal;

                //dd($factura);

                $this->restarUnidadesInventario($restaInventario, $idProducto, $idSeccion, $factura->id, $idUnidadVenta, $precio, $cantidad, $subTotal, $isv, $total, $ivsProducto, $unidad);
            };

            if($request->tipoPagoVenta==2 ){//si el tipo de pago es credito
                $this->restarCreditoCliente($request->seleccionarCliente,$request->totalGeneral,$factura->id);
            }

            

            // dd($this->arrayProductos);
            ModelVentaProducto::insert($this->arrayProductos);
            ModelLogTranslados::insert($this->arrayLogs);


            $numeroVenta = DB::selectOne("select concat(YEAR(NOW()),'-',count(id)+1)  as 'numero' from factura");
            DB::commit();

            return response()->json([
                'icon' => "success",
                'text' => '
                <div class="d-flex justify-content-between">
                    <a href="/factura/cooporativo/' . $factura->id . '" target="_blank" class="btn btn-sm btn-success"><i class="fa-solid fa-file-invoice"></i> Imprimir Factura</a>
                    <a href="/venta/cobro/' . $factura->id . '" target="_blank" class="btn btn-sm btn-warning"><i class="fa-solid fa-coins"></i> Realizar Pago</a>
                    <a href="/detalle/venta/' . $factura->id . '" target="_blank" class="btn btn-sm btn-primary"><i class="fa-solid fa-magnifying-glass"></i> Detalle de Factura</a>
                </div>',
                'title' => 'Exito!',
                'idFactura' => $factura->id,
                'numeroVenta' => $numeroVenta->numero

            ], 200);
        } catch (QueryException $e) {
            DB::rollback();

            return response()->json([
                'error' => $e,
                'icon' => "error",
                'text' => 'Ha ocurrido un error.',
                'title' => 'Error!',
                'idFactura' => $factura->id,
            ], 402);
        }
    }

    public function alternar($request)
    {


        try {
            $numeroSecuencia = 0;
            $numeroSecuenciaUpdated = 0;

            $turno = DB::SELECTONE("select turno from parametro where id =1");

            if ($turno->turno == 1) {
                $turnoActualizar = 2;

                $cai = DB::SELECTONE("select
                                id,
                                numero_inicial,
                                numero_final,
                                cantidad_otorgada,
                                numero_actual as 'numero_actual'
                                from cai 
                                where tipo_documento_fiscal_id = 1 and estado_id = 1");
            } else {

                $turnoActualizar = 1;

                $cai = DB::SELECTONE("select
                                id,
                                numero_inicial,
                                numero_final,
                                cantidad_otorgada,
                                serie as 'numero_actual'
                                from cai 
                                where tipo_documento_fiscal_id = 1 and estado_id = 1");
            }

            $estado = $turno->turno;

            $arrayCai = explode('-', $cai->numero_final);
            $cuartoSegmentoCAI = sprintf("%'.08d", $cai->numero_actual);
            $numeroCAI = $arrayCai[0] . '-' . $arrayCai[1] . '-' . $arrayCai[2] . '-' . $cuartoSegmentoCAI;

            $duplicado = DB::SELECTONE("select count(id) as contador from factura where estado_venta_id=1 and cai_id=" . $cai->id . " and cai='" . $numeroCAI . "'");

            // if($duplicado->contador>=1){

            //     $numeroSecuencia = $numeroSecuencia + $cai->numero_actual + 1;
            //     $numeroSecuenciaUpdated = $cai->numero_actual+2; 

            // }

            $existencia = DB::SELECTONE(
                "select 
                            id 
                            from factura
                            where  estado_venta_id=1 and cliente_id=" . $request->seleccionarCliente . " and cai_id=" . $cai->id . " and numero_secuencia_cai=" . $cai->numero_actual .
                    " and UPPER(REPLACE(nombre_cliente,' ','')) = UPPER(REPLACE('" . $request->nombre_cliente_ventas . "',' ',''))"
            );

            // if(!empty($existencia)){
            //     //existe
            //     $numeroSecuencia = $cai->numero_actual+1;
            //     $numeroSecuenciaUpdated = $cai->numero_actual+2;                                

            // }else{
            //     //no existe
            //     $numeroSecuencia = $cai->numero_actual;
            //     $numeroSecuenciaUpdated = $cai->numero_actual+1;

            // }

            if ($duplicado->contador >= 2 || !empty($existencia)) {
                $numeroSecuencia =  $this->comprobacionRecursiva($request, $cai, $cai->numero_actual, $estado);
                $numeroSecuenciaUpdated = $numeroSecuencia + 1;
            } else {
                $numeroSecuencia = $cai->numero_actual;
                $numeroSecuenciaUpdated = $cai->numero_actual + 1;
            }

            $arrayNumeroFinal = explode('-', $cai->numero_final);
            $numero_final= (string)((int)($arrayNumeroFinal[3]));
            
            if ($numeroSecuencia > $numero_final) {

                return response()->json([
                    "title" => "Advertencia",
                    "icon" => "warning",
                    "text" => "La factura no puede proceder, debido que ha alcanzadado el número maximo de facturacion otorgado 2.",
                ], 401);
            }

            // if ($numeroSecuencia > $cai->numero_actual) {
            //     $this->guardarEnumeracion($cai->numero_actual, $cai, $estado);
            // }

            $arrayCai = explode('-', $cai->numero_final);
            $cuartoSegmentoCAI = sprintf("%'.08d", $numeroSecuencia);
            $numeroCAI = $arrayCai[0] . '-' . $arrayCai[1] . '-' . $arrayCai[2] . '-' . $cuartoSegmentoCAI;
            // dd($cai->cantidad_otorgada);
            $montoComision = $request->totalGeneral * 0.5;

            

            if ($request->tipoPagoVenta == 1) {
                $diasCredito = 0;
            } else {
                $dias = DB::SELECTONE("select dias_credito from cliente where id = " . $request->seleccionarCliente);
                $diasCredito = $dias->dias_credito;
            }

            $numeroVenta = DB::selectOne("select concat(YEAR(NOW()),'-',count(id)+1)  as 'numero' from factura");
            $factura = new ModelFactura;
            $factura->numero_factura = $numeroVenta->numero;
            $factura->cai = $numeroCAI;
            $factura->numero_secuencia_cai = $numeroSecuencia;
            $factura->nombre_cliente = $request->nombre_cliente_ventas;
            $factura->rtn = $request->rtn_ventas;
            $factura->sub_total = $request->subTotalGeneral;
            $factura->isv = $request->isvGeneral;
            $factura->total = $request->totalGeneral;
            $factura->credito = $request->totalGeneral;
            $factura->fecha_emision = $request->fecha_emision;
            $factura->fecha_vencimiento = $request->fecha_vencimiento;
            $factura->tipo_pago_id = $request->tipoPagoVenta;
            $factura->dias_credito = $diasCredito;
            $factura->cai_id = $cai->id;
            $factura->estado_venta_id = 1;
            $factura->cliente_id = $request->seleccionarCliente;
            $factura->vendedor = $request->vendedor;
            $factura->monto_comision = $montoComision;
            $factura->tipo_venta_id = 1; //coorporativo;
            $factura->estado_factura_id = $estado; // se presenta    
            $factura->users_id = Auth::user()->id;
            $factura->comision_estado_pagado = 0;
            $factura->pendiente_cobro = $request->totalGeneral;
            $factura->estado_editar = 1;
            $factura->codigo_autorizacion_id = $request->codigo_autorizacion;
            $factura->save();

            if ($turno->turno == 1) {
                $caiUpdated =  ModelCAI::find($cai->id);
                $caiUpdated->numero_actual = $numeroSecuenciaUpdated;
                $caiUpdated->save();
            } else {
                $caiUpdated =  ModelCAI::find($cai->id);
                $caiUpdated->serie = $numeroSecuenciaUpdated;
                $caiUpdated->save();
            }


            // if(empty($existencia)){
            //     $caiUpdated =  ModelCAI::find($cai->id);
            //     $caiUpdated->serie=$numeroSecuencia;
            //     //$caiUpdated->cantidad_no_utilizada=$cai->cantidad_otorgada - 1;
            //     $caiUpdated->save();
            // }else{
            //     $caiUpdated =  ModelCAI::find($cai->id);
            //     $caiUpdated->serie=$numeroSecuencia+1;
            // // $caiUpdated->cantidad_no_utilizada=$cai->cantidad_otorgada - 1;
            //     $caiUpdated->save();
            // }

            $parametro = ModelParametro::find('1');
            $parametro->turno = $turnoActualizar;
            $parametro->save();

            return $factura;
        } catch (QueryException $e) {
            DB::rollback();
            return response()->json([
                'message' => 'Ha ocurrido un error, meotodo alternar',
                'error' => $e
            ], 402);
        }
    }



    public function metodoLista($request)
    {
        try {

            //dd("lista");
            $numeroSecuencia = null;
            $cai = DB::SELECTONE("select * from listado where eliminado = 0 order by secuencia ASC limit 1");

            $comprobarDuplicados = DB::SELECTONE("select count(id) as contador from factura where estado_venta_id=1 and cai ='" . $cai->numero . "'");


            if ($comprobarDuplicados->contador >= 2) {
                // DB::delete("DELETE FROM listado WHERE id = ".$cai->id);
                DB::update("UPDATE listado SET eliminado =  1 WHERE id = " . $cai->id);

                return $this->alternar($request); 

                // return response()->json([
                //     "icon" => "error",
                //     "title" => "Error!",
                //     "text" => "Por favor intentar facturar a otro cliente en este momento."
                // ], 402);
            }

            $existencia = DB::SELECTONE("
                select 
                id 
                from factura
                where estado_factura_id=2  and  estado_venta_id=1 and cliente_id=" . $request->seleccionarCliente . " and cai_id=" . $cai->cai_id . " and numero_secuencia_cai=" . $cai->secuencia .
                " and UPPER(REPLACE(nombre_cliente,' ','')) = UPPER(REPLACE('" . $request->nombre_cliente_ventas . "',' ',''))
                ");




            if (!empty($existencia)) {
                return $this->alternar($request); 


                // return response()->json([
                //     "icon" => "error",
                //     "title" => "Error!",
                //     "text" => "Por favor intentar facturar a otro cliente en este momento."
                // ], 402);
            } else {
                $numeroSecuencia = $cai->secuencia;
            }

            if ($numeroSecuencia > $cai->cantidad_otorgada) {

                return response()->json([
                    "title" => "Advertencia",
                    "icon" => "warning",
                    "text" => "La factura no puede proceder, debido que ha alcanzadado el número maximo de facturacion otorgado 3.",
                ], 402);
            }


            $arrayCai = explode('-', $cai->numero_final);
            $cuartoSegmentoCAI = sprintf("%'.08d", $numeroSecuencia);
            $numeroCAI = $arrayCai[0] . '-' . $arrayCai[1] . '-' . $arrayCai[2] . '-' . $cuartoSegmentoCAI;
            // dd($cai->cantidad_otorgada);
            $montoComision = $request->totalGeneral * 0.5;

            if ($request->tipoPagoVenta == 1) {
                $diasCredito = 0;
            } else {
                $dias = DB::SELECTONE("select dias_credito from cliente where id = " . $request->seleccionarCliente);
                $diasCredito = $dias->dias_credito;
            }

            $numeroVenta = DB::selectOne("select concat(YEAR(NOW()),'-',count(id)+1)  as 'numero' from factura");
            $factura = new ModelFactura;
            $factura->numero_factura = $numeroVenta->numero;
            $factura->cai = $numeroCAI;
            $factura->numero_secuencia_cai = $numeroSecuencia;
            $factura->nombre_cliente = $request->nombre_cliente_ventas;
            $factura->rtn = $request->rtn_ventas;
            $factura->sub_total = $request->subTotalGeneral;
            $factura->isv = $request->isvGeneral;
            $factura->total = $request->totalGeneral;
            $factura->credito = $request->totalGeneral;
            $factura->fecha_emision = $request->fecha_emision;
            $factura->fecha_vencimiento = $request->fecha_vencimiento;
            $factura->tipo_pago_id = $request->tipoPagoVenta;
            $factura->dias_credito = $diasCredito;
            $factura->cai_id = $cai->cai_id;
            $factura->estado_venta_id = 1;
            $factura->cliente_id = $request->seleccionarCliente;
            $factura->vendedor = $request->vendedor;
            $factura->monto_comision = $montoComision;
            $factura->tipo_venta_id = 1; //coorporativo;
            $factura->estado_factura_id = 2; // se presenta   
            $factura->users_id = Auth::user()->id;
            $factura->comision_estado_pagado = 0;
            $factura->pendiente_cobro = $request->totalGeneral;
            $factura->estado_editar = 1;
            $factura->codigo_autorizacion_id = $request->codigo_autorizacion;
            $factura->save();



            // if(!empty($existencia)){
            //     $caiUpdated =  ModelCAI::find($cai->cai_id);
            //     $caiUpdated->serie = $numeroSecuencia;
            //     //$caiUpdated->cantidad_no_utilizada=$cai->cantidad_otorgada - 1;
            //     $caiUpdated->save();
            // }else{
            //     $caiUpdated =  ModelCAI::find($cai->cai_id);
            //     $caiUpdated->serie = $numeroSecuencia+1;
            // // $caiUpdated->cantidad_no_utilizada=$cai->cantidad_otorgada - 1;
            //     $caiUpdated->save();
            // }

            //DB::delete("DELETE FROM listado WHERE id = ".$cai->id);
            //DB::update("UPDATE cai SET serie = serie + 1 WHERE id =".$cai->cai_id);
            DB::update("UPDATE listado SET eliminado =  1 WHERE id = " . $cai->id);




            return $factura;
        } catch (QueryException $e) {
            DB::rollback();

            return response()->json([
                'error' => $e,
                'icon' => "error",
                'text' => 'Ha ocurrido un error. Metodo Lista',
                'title' => 'Error!',
            ], 402);
        }
    }

    public function restarUnidadesInventario($unidadesRestarInv, $idProducto, $idSeccion, $idFactura, $idUnidadVenta, $precio, $cantidad, $subTotal, $isv, $total, $ivsProducto, $unidad)
    {
        try {

            $precioUnidad = $subTotal / $unidadesRestarInv;

            $unidadesRestar = $unidadesRestarInv;
            $registroResta = 0;
            while (!($unidadesRestar <= 0)) {

                $unidadesDisponibles = DB::SELECTONE("
                        select 
                            id,
                            cantidad_disponible
                        from recibido_bodega
                            where seccion_id = " . $idSeccion . " and 
                            producto_id = " . $idProducto . " and 
                            cantidad_disponible <>0
                            order by created_at asc
                        limit 1
                        ");


                if ($unidadesDisponibles->cantidad_disponible == $unidadesRestar) {

                    $diferencia = $unidadesDisponibles->cantidad_disponible - $unidadesRestar;
                    $lote = ModelRecibirBodega::find($unidadesDisponibles->id);
                    $lote->cantidad_disponible = $diferencia;
                    $lote->save();

                    $registroResta = $unidadesRestar;
                    $unidadesRestar = $diferencia;

                    $subTotalSecccionado = round(($precioUnidad * $registroResta), 2);
                    $isvSecccionado = round(($subTotalSecccionado * ($ivsProducto / 100)), 2);
                    $totalSecccionado = round(($isvSecccionado + $subTotalSecccionado), 2);

                    $cantidadSeccion = $registroResta / $unidad;
                } else if ($unidadesDisponibles->cantidad_disponible > $unidadesRestar) {

                    $diferencia = $unidadesDisponibles->cantidad_disponible - $unidadesRestar;


                    $lote = ModelRecibirBodega::find($unidadesDisponibles->id);
                    $lote->cantidad_disponible = $diferencia;
                    $lote->save();

                    $registroResta = $unidadesRestar;
                    $unidadesRestar = 0;

                    $subTotalSecccionado = round(($precioUnidad * $registroResta), 2);
                    $isvSecccionado = round(($subTotalSecccionado * ($ivsProducto / 100)), 2);
                    $totalSecccionado = round(($isvSecccionado + $subTotalSecccionado), 2);

                    $cantidadSeccion = $registroResta / $unidad;
                } else if ($unidadesDisponibles->cantidad_disponible < $unidadesRestar) {

                    $diferencia = $unidadesRestar - $unidadesDisponibles->cantidad_disponible;
                    $lote = ModelRecibirBodega::find($unidadesDisponibles->id);
                    $lote->cantidad_disponible = 0;
                    $lote->save();

                    $registroResta = $unidadesDisponibles->cantidad_disponible;
                    $unidadesRestar = $diferencia;

                    $subTotalSecccionado = round(($precioUnidad * $registroResta), 2);
                    $isvSecccionado = round(($subTotalSecccionado * ($ivsProducto / 100)), 2);
                    $totalSecccionado = round(($isvSecccionado + $subTotalSecccionado), 2);

                    $cantidadSeccion = $registroResta / $unidad;
                };


                array_push($this->arrayProductos, [
                    "factura_id" => $idFactura,
                    "producto_id" => $idProducto,
                    "lote" => $unidadesDisponibles->id,
                    "seccion_id" => $idSeccion,
                    "numero_unidades_resta_inventario" => $registroResta,
                    "sub_total" => $subTotal,
                    "isv" => $isv,
                    "total" => $total,
                    "resta_inventario_total" => $unidadesRestarInv,
                    "unidad_medida_venta_id" => $idUnidadVenta,
                    "precio_unidad" => $precio,
                    "cantidad" => $cantidad,
                    "cantidad_s" => $cantidadSeccion,
                    "cantidad_sin_entregar" => $cantidad,
                    "sub_total_s" => $subTotalSecccionado,
                    "isv_s" => $isvSecccionado,
                    "total_s" => $totalSecccionado,
                    "created_at" => now(),
                    "updated_at" => now(),
                ]);

                array_push($this->arrayLogs, [
                    "origen" => $unidadesDisponibles->id,
                    "factura_id" => $idFactura,
                    "cantidad" => $registroResta,
                    "unidad_medida_venta_id"=>$idUnidadVenta,
                    "users_id" => Auth::user()->id,
                    "descripcion" => "Venta de producto",
                    "created_at" => now(),
                    "updated_at" => now(),
                ]);
            };

            //dd($arrarVentasProducto);   
            //ModelVentaProducto::created($arrarVentasProducto);  
            //ModelVentaProducto::insert($arrarVentasProducto);  
            //DB::table('venta_has_producto')->insert($arrarVentasProducto); 


            return;
        } catch (QueryException $e) {
            DB::rollback();

            return response()->json([
                'error' => $e,
                'icon' => "error",
                'text' => 'Ha ocurrido un error.',
                'title' => 'Error!',
                'idFactura' => $idFactura,
            ], 402);
        }
    }

    public function imprimirFacturaCoorporativa($idFactura)
    {

        $cai = DB::SELECTONE("
        select 
        A.cai as numero_factura,
        A.numero_factura as numero,
        A.estado_factura_id as estado_factura,
        A.estado_venta_id,
        B.cai,
        DATE_FORMAT(B.fecha_limite_emision,'%d/%m/%Y' ) as fecha_limite_emision,
        B.numero_inicial,
        B.numero_final,
        C.descripcion,       
        DATE_FORMAT(A.fecha_emision,'%d/%m/%Y' ) as  fecha_emision,
        TIME(A.created_at) as hora,        
        DATE_FORMAT(A.fecha_vencimiento,'%d/%m/%Y' ) as fecha_vencimiento,
        name,
        D.id as factura
    
       from factura A
       inner join cai B
       on A.cai_id = B.id
       inner join tipo_pago_venta C
       on A.tipo_pago_id = C.id
       inner join users
       on A.vendedor = users.id
       inner join estado_factura D
       on A.estado_factura_id = D.id
       where A.id = ".$idFactura);

       $cliente = DB::SELECTONE("
       select        
        factura.nombre_cliente as nombre,
        cliente.direccion,
        cliente.correo,
        factura.fecha_emision,
        factura.fecha_vencimiento,
        TIME(factura.created_at) as hora,
        cliente.telefono_empresa,
        cliente.rtn
        from factura
        inner join cliente
        on factura.cliente_id = cliente.id
        where factura.id = ".$idFactura);

       $importes = DB::SELECTONE("
       select
        total,
        isv,
        sub_total
        from factura
        where id = ".$idFactura);
   

        $importesConCentavos= DB::SELECTONE("        
            select
            FORMAT(total,2) as total,
            FORMAT(isv,2) as isv,
            FORMAT(sub_total,2) as sub_total
            from factura where factura.id = ".$idFactura);
        

       $productos = DB::SELECT("
       select 
            B.producto_id as codigo,
            concat(C.nombre) as descripcion,
            UPPER(J.nombre) as medida,
            H.nombre as bodega,
            F.descripcion as seccion,
            FORMAT(B.sub_total/B.cantidad,2) as precio,
            FORMAT(sum(B.cantidad_s),2) as cantidad,
            FORMAT(sum(B.sub_total_s),2) as importe

        from factura A
        inner join venta_has_producto B
        on A.id = B.factura_id
        inner join producto C
        on B.producto_id = C.id
        inner join unidad_medida_venta D
        on B.unidad_medida_venta_id = D.id
        inner join unidad_medida J
        on J.id = D.unidad_medida_id
        inner join recibido_bodega E
        on B.lote = E.id
        inner join seccion F
        on E.seccion_id = F.id
        inner join segmento G
        on F.segmento_id = G.id
        inner join bodega H
        on G.bodega_id = H.id
        where A.id=".$idFactura."
        group by codigo, descripcion, medida, bodega, seccion, precio");

        $ordenCompra = DB::SELECTONE("
        select
        B.numero_orden
        from factura A
        inner join numero_orden_compra B
        on A.numero_orden_compra_id = B.id
        where A.id =".$idFactura);

        if(empty($ordenCompra->numero_orden)){
            $ordenCompra=["numero_orden"=>""];
        }else{
            $ordenCompra=["numero_orden"=>$ordenCompra->numero_orden];
        }


        if( fmod($importes->total, 1) == 0.0 ){
            $flagCentavos = false;
          
        }else{
            $flagCentavos = true;
        }

        $formatter = new NumeroALetras();
        $formatter->apocope = true;
        $numeroLetras = $formatter->toMoney($importes->total, 2, 'LEMPIRAS', 'CENTAVOS');

        $pdf = PDF::loadView('/pdf/factura', compact('cai', 'cliente','importes','productos','numeroLetras','importesConCentavos','flagCentavos','ordenCompra'))->setPaper('letter');
       
        return $pdf->stream("factura_numero" . $cai->numero_factura.".pdf");

       
    }

    public function guardarEnumeracion($numeroSecuencia, $cai, $estado)
    {

        $arrayCai = explode('-', $cai->numero_final);
        $cuartoSegmentoCAI = sprintf("%'.08d", $numeroSecuencia);
        $numeroCAI = $arrayCai[0] . '-' . $arrayCai[1] . '-' . $arrayCai[2] . '-' . $cuartoSegmentoCAI;


        DB::INSERT("INSERT INTO enumeracion(
            numero, secuencia, numero_inicial, numero_final, cantidad_otorgada, cai_id, estado, created_at, updated_at, eliminado) VALUES 
           ('" . $numeroCAI . "','" . $numeroSecuencia . "','" . $cai->numero_inicial . "','" . $cai->numero_final . "','" . $cai->cantidad_otorgada . "','" . $cai->id . "'," . $estado . ",'" . NOW() . "','" . NOW() . "',0)");

        return;
    }

    public function enumerar($request)
    {
        try {


            $listado = DB::SELECTONE("
            select
            id,
            numero,
            secuencia,
            numero_inicial,
            numero_final,
            cantidad_otorgada,
            cai_id,
            estado
            from enumeracion          
            where eliminado = 0  
            order by secuencia asc
            limit 1");



            //comprobar si esta dos veces
            $duplicado = DB::SELECTONE("select count(id) as contador from factura where estado_venta_id=1 and cai_id=" . $listado->cai_id . " and cai='" . $listado->numero . "'");



            $existencia = DB::SELECTONE(
                "
            select 
            count(id) as contador
            from factura
            where estado_venta_id=1 and cliente_id=" . $request->seleccionarCliente . " and cai_id=" . $listado->cai_id . " and numero_secuencia_cai=" . $listado->secuencia .
                    " and UPPER(REPLACE(nombre_cliente,' ','')) = UPPER(REPLACE('" . $request->nombre_cliente_ventas . "',' ',''))"
            );



            // 
            if ( $duplicado->contador >= 2) {
                DB::update("UPDATE enumeracion SET eliminado =  1 WHERE id = " . $listado->id);
                return $this->alternar($request); 
            }

            if(!empty($existencia->contador >=2)){
                DB::update("UPDATE enumeracion SET eliminado =  1 WHERE id = " . $listado->id);
                return $this->alternar($request);
            }
         
            if($existencia->contador != 0){
                return $this->alternar($request);
            }

            $arrayCai = explode('-', $listado->numero_final);
            $cuartoSegmentoCAI = sprintf("%'.08d", $listado->secuencia);
            $numeroCAI = $arrayCai[0] . '-' . $arrayCai[1] . '-' . $arrayCai[2] . '-' . $cuartoSegmentoCAI;
            // dd($cai->cantidad_otorgada);
            $montoComision = $request->totalGeneral * 0.5;

            if ($request->tipoPagoVenta == 1) {
                $diasCredito = 0;
            } else {
                $dias = DB::SELECTONE("select dias_credito from cliente where id = " . $request->seleccionarCliente);
                $diasCredito = $dias->dias_credito;
            }

            $numeroVenta = DB::selectOne("select concat(YEAR(NOW()),'-',count(id)+1)  as 'numero' from factura");
            $factura = new ModelFactura;
            $factura->numero_factura = $numeroVenta->numero;
            $factura->cai = $numeroCAI;
            $factura->numero_secuencia_cai = $listado->secuencia;
            $factura->nombre_cliente = $request->nombre_cliente_ventas;
            $factura->rtn = $request->rtn_ventas;
            $factura->sub_total = $request->subTotalGeneral;
            $factura->isv = $request->isvGeneral;
            $factura->total = $request->totalGeneral;
            $factura->credito = $request->totalGeneral;
            $factura->fecha_emision = $request->fecha_emision;
            $factura->fecha_vencimiento = $request->fecha_vencimiento;
            $factura->tipo_pago_id = $request->tipoPagoVenta;
            $factura->dias_credito =  $diasCredito;
            $factura->cai_id = $listado->cai_id;
            $factura->estado_venta_id = 1;
            $factura->cliente_id = $request->seleccionarCliente;
            $factura->vendedor = $request->vendedor;
            $factura->monto_comision = $montoComision;
            $factura->tipo_venta_id = 1; //coorporativo;
            $factura->estado_factura_id = $listado->estado; // se presenta
            $factura->users_id = Auth::user()->id;
            $factura->comision_estado_pagado = 0;
            $factura->pendiente_cobro = $request->totalGeneral;
            $factura->estado_editar = 1;
            $factura->codigo_autorizacion_id = $request->codigo_autorizacion;
            $factura->save();


            //DB::delete("DELETE FROM enumeracion WHERE id = ".$listado->id);
            DB::update("UPDATE enumeracion SET eliminado =  1 WHERE id = " . $listado->id);


            return $factura;
        } catch (QueryException $e) {
            return response()->json([
                'message' => 'Ha ocurrido un error',
                'error' => $e
            ], 402);
        }
    }

    public function comprobacionRecursiva($request, $cai, $numeroActual, $estado)
    {

        $arrayCai = explode('-', $cai->numero_final);
        $cuartoSegmentoCAI = sprintf("%'.08d", $numeroActual);
        $numeroCAI = $arrayCai[0] . '-' . $arrayCai[1] . '-' . $arrayCai[2] . '-' . $cuartoSegmentoCAI;

        $duplicado = DB::SELECTONE("select count(id) as contador from factura where estado_venta_id=1 and cai_id=" . $cai->id . " and cai='" . $numeroCAI . "'");

        // if($duplicado->contador>=1){

        //     $numeroSecuencia = $numeroSecuencia + $cai->numero_actual + 1;
        //     $numeroSecuenciaUpdated = $cai->numero_actual+2; 

        // }

        $existencia = DB::SELECTONE(
            "
            select 
            id 
            from factura
            where  estado_venta_id=1 and cliente_id=" . $request->seleccionarCliente . " and cai_id=" . $cai->id . " and numero_secuencia_cai=" . $numeroActual .
                " and UPPER(REPLACE(nombre_cliente,' ','')) = UPPER(REPLACE('" . $request->nombre_cliente_ventas . "',' ',''))"
        );



        if ($duplicado->contador >= 2) {
            $numeroActual = $numeroActual + 1;
            return $this->comprobacionRecursiva($request, $cai, $numeroActual, $estado);
        } else if (!empty($existencia)) {

            $this->guardarEnumeracion($numeroActual, $cai, $estado);
            $numeroActual = $numeroActual + 1;
            return $this->comprobacionRecursiva($request, $cai, $numeroActual, $estado);
        } else {
            return $numeroActual;
        }
    }

    public function comprobarCreditoCliente($idCliente,$totalFactura)
    {



        $credito = DB::SELECTONE(
        "
        select credito from cliente where  id = " . $idCliente
        );

        if ($totalFactura > $credito->credito) {
            return true;
        }

        return false;
    }

    public function comprobarFacturaVencida($idCliente){
        $facturasVencidas = DB::SELECT(
            "
        select
        id
        from factura 
        where   pendiente_cobro >0 and fecha_vencimiento < curdate() and tipo_pago_id = 2 and cliente_id=" . $idCliente
        );

        if (!empty($facturasVencidas)) {
            return true;
        }

        return false;
    }



    public function restarCreditoCliente($idCliente,$totalFactura, $idFactura){

        $cliente = ModelCliente::find($idCliente);
        $resta = $cliente->credito - $totalFactura;
        $cliente->credito = $resta;
        $cliente->save();

        $logCredito = new logCredito;
        $logCredito->descripcion = 'Reducción  de credito por factura.';
        $logCredito->monto = $totalFactura;
        $logCredito->factura_id=$idFactura;
        $logCredito->cliente_id=$idCliente;
        $logCredito->users_id = Auth::user()->id;
        $logCredito->save();
        
        return true;
    }

    public function listadoVendedores(){
        
        //$rolId = Auth::user()->rol_id;
        //$idUser = Auth::user()->id;


        $listadoVendedores = DB::SELECT("select id, name as text from users where rol_id = 2  ");
       
        /*
        if($rolId==3 or $rolId==1 ){
            $listadoVendedores = DB::SELECT("select id, name as text from users where rol_id = 2 ");
        }else{
            $listadoVendedores = DB::SELECT("select id, name as text from users where id = ".$idUser);
        }

        */
       
        return response()->json([
            'results'=>$listadoVendedores,
        ],200);
        
       
    }

}
