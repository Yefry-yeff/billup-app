<?php

namespace App\Http\Livewire\Cotizaciones;

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

use App\Models\ModelCotizacion;
use App\Models\ModelCotizacionProducto;

class Cotizacion extends Component

{

    public $tipoCotizacion;

    public function mount($id)
    {

        $this->tipoCotizacion = $id;
    }

    public function render()
    {
        $tipoCotizacion = $this->tipoCotizacion;
        return view('livewire.cotizaciones.cotizacion', compact('tipoCotizacion'));
    }


    public function listarClientes(Request $request)
    {
        try {
          
            
           $tipoCotizacion = $request->tipoCotizacion;          

            if($tipoCotizacion==1){
                $listaClientes = $this->clientesCorporativo($request);
            }elseif ($tipoCotizacion==2){
                $listaClientes = $this->clientesEstatal($request);
            }else{
                $listaClientes = $this->clientesExonerados($request);
            }

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

    public function clientesCorporativo($request)
    {

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

        return $listaClientes;
    }


    public function clientesEstatal($request)
    {

        if (Auth::user()->rol_id == 1) {
            $listaClientes = DB::SELECT("
                    select 
                        id,
                        nombre as text
                    from cliente
                        where estado_cliente_id = 1
                        and tipo_cliente_id=2                               
                        and  (id LIKE '%" . $request->search . "%' or nombre Like '%" . $request->search . "%') limit 15
                            ");
        } else {
            $listaClientes = DB::SELECT("
                    select 
                        id,
                        nombre as text
                    from cliente
                        where estado_cliente_id = 1
                        and tipo_cliente_id=2
                        and vendedor =" . Auth::user()->id . "             
                        and  (id LIKE '%" . $request->search . "%' or nombre Like '%" . $request->search . "%') limit 15
                            ");
        }

        return $listaClientes;
    }

    public function clientesExonerados($request)
    {


        if (Auth::user()->rol_id == 1) {
            $listaClientes = DB::SELECT("
                    select 
                        id,
                        nombre as text
                    from cliente
                        where estado_cliente_id = 1
                        and id<>1                                     
                        and  (id LIKE '%" . $request->search . "%' or nombre Like '%" . $request->search . "%') limit 15
                            ");
        } else {
            $listaClientes = DB::SELECT("
                    select 
                        id,
                        nombre as text
                    from cliente
                        where estado_cliente_id = 1
                        and id<>1
                        and vendedor =" . Auth::user()->id . "             
                        and  (id LIKE '%" . $request->search . "%' or nombre Like '%" . $request->search . "%') limit 15
                            ");
        }
        return $listaClientes;
    }

    public function guardarCotizacion(Request $request){
       try {

        $arrayInputs = [];
        $arrayInputs = $request->arregloIdInputs;
        $arrayProductos = [];

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
            'bodega' => 'required',
            'seleccionarProducto' => 'required',



        ]);

        // dd($request->all());

        if ($validator->fails()) {
            return response()->json([
                'icon' => 'error',
                'title' => 'error',
                'text' => 'Por favor, verificar que todos los campos esten completados.',
                'mensaje' => 'Ha ocurrido un error al crear la compra.',
                'errors' => $validator->errors()
            ], 401);
        }

        DB::beginTransaction();

       $cotizacion = new ModelCotizacion();
       $cotizacion->nombre_cliente = $request->nombre_cliente_ventas;
       $cotizacion->RTN = $request->rtn_ventas;
       $cotizacion->fecha_emision = $request->fecha_emision;
       $cotizacion->fecha_vencimiento = $request->fecha_vencimiento;
       $cotizacion->sub_total = $request->subTotalGeneral;
       $cotizacion->isv= $request->isvGeneral;
       $cotizacion->total = $request->totalGeneral;
       $cotizacion->cliente_id = $request->seleccionarCliente;
       $cotizacion->tipo_venta_id = $request->tipo_venta_id;
       $cotizacion->users_id = Auth::user()->id;
       $cotizacion->arregloIdInputs = json_encode($request->arregloIdInputs);
       $cotizacion->numeroInputs = $request->numeroInputs;
       $cotizacion->save();


       
       for ($i = 0; $i < count($arrayInputs); $i++) {

        $keyRestaInventario = "restaInventario" . $arrayInputs[$i];
        $keyIdSeccion = "idSeccion" . $arrayInputs[$i];
        $keyIdProducto = "idProducto" . $arrayInputs[$i];
        $keyIdUnidadVenta = "idUnidadVenta" . $arrayInputs[$i];
        $keyPrecio = "precio" . $arrayInputs[$i];
        $keyCantidad = "cantidad" . $arrayInputs[$i];
        $keySubTotal = "subTotal" . $arrayInputs[$i];
        $keyIsvPagar = "isvProducto" . $arrayInputs[$i];
        $keyTotal = "total" . $arrayInputs[$i];
        $keyIsvAsigando = "isv" . $arrayInputs[$i];
        $keyunidad = 'unidad' . $arrayInputs[$i];
        $keyidBodega = 'idBodega'.$arrayInputs[$i];
     
        $keyNombreProducto = 'nombre'.$arrayInputs[$i];
        $keyBodegaNombre = 'bodega'.$arrayInputs[$i];
    
  

        $restaInventario = $request->$keyRestaInventario;
        $idSeccion = $request->$keyIdSeccion;
        $idProducto = $request->$keyIdProducto;
        $idUnidadVenta = $request->$keyIdUnidadVenta;
        $isvProductoPagar = $request->$keyIsvPagar;
        //$unidad = $request->$keyunidad;
        $precio = $request->$keyPrecio;
        $cantidad = $request->$keyCantidad;
        $subTotal = $request->$keySubTotal;
       
        $total = $request->$keyTotal;
        $idBodega = $request->$keyidBodega;
        $ivsProductoAsignado = $request->$keyIsvAsigando;
        $nombreProducto = $request->$keyNombreProducto;
        $nombreBodega = $request->$keyBodegaNombre;


        array_push($arrayProductos,[
           'cotizacion_id'=> $cotizacion->id,
           'producto_id'=> $idProducto,
           'nombre_producto'=>$nombreProducto,
           'nombre_bodega'=> $nombreBodega,
           'precio_unidad'=>$precio,
           'cantidad'=>$cantidad,
           'sub_total'=>$subTotal,
           'isv'=> $isvProductoPagar,
           'total'=> $total,
           'Bodega_id'=>$idBodega,
           'seccion_id'=>$idSeccion,
           'resta_inventario'=>$restaInventario,
           'isv_producto'=>$ivsProductoAsignado,
           'unidad_medida_venta_id'=>$idUnidadVenta,
           'created_at'=>now(),
           'updated_at'=>now()

        ]);
       
    };

        ModelCotizacionProducto::insert($arrayProductos);




       DB::commit();
       return response()->json([
        'icon'=>'success',
        'text'=>'Cotización guardada con éxito.',
        'title'=>'Exito!'
       ],200);

       } catch (QueryException $e) {
       DB::rollback();
       return response()->json([
        'icon'=>'error',
        'text'=>'Ha ocurrido un error al guardar la cotización.',
        'title'=>'Error!',
        'message' => $e, 
        'error' => $e
       ],402);
       }
    }

    public function imprimirCotizacion($idFactura)
    {

        $datos = DB::SELECTONE("
        select 
        concat(YEAR(NOW()),'-',A.id) as codigo,
        B.nombre,
        B.direccion,
        B.correo,
        B.telefono_empresa,
        A.fecha_emision,
        time(A.created_at) as hora,
        A.fecha_vencimiento,
        B.rtn,
        users.name
        
        from cotizacion A
        inner join cliente B
        on A.cliente_id = B.id
        inner join users
        ON users.id = A.users_id
        where A.id =".$idFactura);

        $productos = DB::SELECT("
            select
            C.id as codigo,
            C.nombre,
            C.descripcion,
            FORMAT(B.precio_unidad,2) as precio,
            FORMAT(B.cantidad,2) as cantidad,
            FORMAT(B.sub_total,2) as importe,
            J.nombre as medida

            from cotizacion A
            inner join cotizacion_has_producto B
            on A.id=B.cotizacion_id
            inner join producto C
            on B.producto_id = C.id
            inner join unidad_medida_venta D
            on B.unidad_medida_venta_id = D.id
            inner join unidad_medida J
            on J.id = D.unidad_medida_id
            where A.id = ".$idFactura
        );

        $importes = DB::SELECTONE("
        select 
        sub_total,
        isv,
        total
        from cotizacion where id = ".$idFactura
        );

        $importesDecimales = DB::SELECTONE("
        select 
        FORMAT(sub_total,2) as sub_total,
        FORMAT(isv,2) as isv,
        FORMAT(total,2) as total
        from cotizacion where id = ".$idFactura
        );

        if( fmod($importes->total, 1) == 0.0 ){
            $flagCentavos = false;
          
        }else{
            $flagCentavos = true;
        }

        $formatter = new NumeroALetras();
        $formatter->apocope = true;
        $numeroLetras = $formatter->toMoney($importes->total, 2, 'LEMPIRAS', 'CENTAVOS');

        $pdf = PDF::loadView('/pdf/cotizacion',compact('datos','productos','importes','importesDecimales','flagCentavos','numeroLetras'))->setPaper('letter');
       
        return $pdf->stream("factura_numero.pdf");


    }

    public function imprimirProforma($idFactura)
    {

        $datos = DB::SELECTONE("
        select 
        concat(YEAR(NOW()),'-',A.id) as codigo,
        B.nombre,
        B.direccion,
        B.correo,
        B.telefono_empresa,
        A.fecha_emision,
        time(A.created_at) as hora,
        A.fecha_vencimiento,
        B.rtn,
        users.name
        
        from cotizacion A
        inner join cliente B
        on A.cliente_id = B.id
        inner join users
        ON users.id = A.users_id
        where A.id =".$idFactura);

        $productos = DB::SELECT("
            select
            C.id as codigo,
            C.nombre,
            C.descripcion,
            H.nombre as bodega,
            F.descripcion as seccion,
            J.nombre as medida,
            FORMAT(B.precio_unidad,2) as precio,
            FORMAT(B.cantidad,2) as cantidad,
            FORMAT(B.sub_total,2) as importe    
            from cotizacion A
            inner join cotizacion_has_producto B
            inner join producto C
            on B.producto_id = C.id
            inner join unidad_medida_venta D
            on B.unidad_medida_venta_id = D.id
            inner join unidad_medida J
            on J.id = D.unidad_medida_id
            inner join seccion F
            on B.seccion_id = F.id
            inner join segmento G
            on F.segmento_id = G.id
            inner join bodega H
            on G.bodega_id = H.id       
            where A.id = ".$idFactura
        );

        $importes = DB::SELECTONE("
        select 
        sub_total,
        isv,
        total
        from cotizacion where id = ".$idFactura
        );

        $importesDecimales = DB::SELECTONE("
        select 
        FORMAT(sub_total,2) as sub_total,
        FORMAT(isv,2) as isv,
        FORMAT(total,2) as total
        from cotizacion where id = ".$idFactura
        );

        if( fmod($importes->total, 1) == 0.0 ){
            $flagCentavos = false;
          
        }else{
            $flagCentavos = true;
        }

        $formatter = new NumeroALetras();
        $formatter->apocope = true;
        $numeroLetras = $formatter->toMoney($importes->total, 2, 'LEMPIRAS', 'CENTAVOS');
        $pdf = PDF::loadView('/pdf/proforma',compact('datos','productos','importes','importesDecimales','flagCentavos','numeroLetras'))->setPaper('letter');
       
        return $pdf->stream("Proforma N.".$datos->codigo.".pdf");

   
    }
}

