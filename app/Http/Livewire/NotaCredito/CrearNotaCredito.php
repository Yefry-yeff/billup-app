<?php

namespace App\Http\Livewire\NotaCredito;


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
class CrearNotaCredito extends Component
{
    public function render()
    {
        return view('livewire.nota-credito.crear-nota-credito');
    }

    public function obtenerClientes(Request $request){

        $clientes = DB::SELECT("select id, concat(id,'-',nombre) as text from cliente where (nombre like '%".$request->search."%') or (id like '%".$request->search."%') limit 15");

        return response()->json([
            "results"=>$clientes,
        ],200);

    }

    public function obtenerFactura(Request $request){

        $clientes = DB::SELECT("select id, cai as text from factura where estado_venta_id = 1 and cliente_id = ".$request->idCliente." and cai like '%".$request->search."%' limit 15");

        return response()->json([
            "results"=>$clientes,
        ],200);

    }

    public function obtenerDetalleFactura(Request $request){

        $datosFactura = DB::SELECTONE("
        select 
        factura.id,
        fecha_emision,
        B.descripcion as tipoPago,
        C.descripcion as tipoFactura,
        D.id as idCliente,
        D.rtn,
        D.nombre as nombreCliente,
        E.name vendedor,
        (select name from users where id = factura.users_id) as facturador,
        factura.created_at as fechaRegistro,
        sub_total,
        total,
        isv

        from factura
        inner join tipo_pago_venta B
        on factura.tipo_pago_id = B.id
        inner join tipo_venta C
        on factura.tipo_venta_id = C.id
        inner join cliente D
        on factura.cliente_id = D.id
        inner join users E
        on factura.vendedor = E.id
        where factura.id = ".$request->idFactura
        );

        return response()->json([
            'datosFactura'=>$datosFactura
        ],200);

    }

    public function obtenerProductos(Request $request){

        $productos = DB::SELECT("
        select 
        B.factura_id,
        B.producto_id,
        C.nombre,
        concat(F.nombre,' - ',D.descripcion ) as bodega,
        B.precio_unidad,
        B.cantidad,
        H.nombre as unidad_medida,
        B.sub_total,
        B.isv,
        B.total 
        from factura A
        inner join venta_has_producto B
        on A.id = B.factura_id
        inner join producto C
        on C.id = B.producto_id
        inner join seccion D
        on D.id = B.seccion_id
        inner join segmento E
        on E.id = D.segmento_id
        inner join bodega F
        on F.id = E.bodega_id
        inner join unidad_medida_venta G
        on G.id = B.unidad_medida_venta_id
        inner join unidad_medida H
        on H.id = G.unidad_medida_id
        where A.id =".$request->idFactura
        );

        return Datatables::of($productos)
        ->addColumn('opciones', function ($producto) {


                return

                '<div class="text-center">
                    <button  onclick="infoProducto('.$producto->factura_id.','.$producto->producto_id.')" class="btn btn-warning " >Devolución</button>
                  
                </div>';
            
        })

        ->rawColumns(['opciones'])
        ->make(true);

    }

    public function datosProducto(Request $request){
       try {

        $datos = DB::SELECTONE("
        select 
            B.factura_id,
            B.producto_id,
            
            C.nombre as producto,
            concat(F.nombre,' - ',D.descripcion ) as bodega,
            
            F.id as bodegaId,
            F.nombre as nombreBodega,
            E.id as segmentoId,
            E.descripcion as segmento,
            D.id as seccionId,
            D.descripcion as seccion,
        
            B.precio_unidad,
            B.cantidad,
            H.nombre as unidad_medida,
            B.unidad_medida_venta_id as idUnidadVenta       
       
        from factura A
        inner join venta_has_producto B
        on A.id = B.factura_id
        inner join producto C
        on C.id = B.producto_id
        inner join seccion D
        on D.id = B.seccion_id
        inner join segmento E
        on E.id = D.segmento_id
        inner join bodega F
        on F.id = E.bodega_id
        inner join unidad_medida_venta G
        on G.id = B.unidad_medida_venta_id
        inner join unidad_medida H
        on H.id = G.unidad_medida_id
        where B.producto_id = ".$request->idProducto." and A.id =".$request->idFactura);

        $unidadVenta = DB::SELECTONE("select unidad_venta from unidad_medida_venta where producto_id = ".$request->idProducto." and unidad_venta_defecto = 1");

        $cantidadMax =  $datos->cantidad/ $unidadVenta->unidad_venta;




       return response()->json([
        'datos' => $datos,
        'cantidadMax'=>$cantidadMax

       ],200);
       } catch (QueryException $e) {
       return response()->json([
        'icon' => 'error',
        'text' => 'Ha ocurrido un error.',
        'title' => 'Error',
        'message' => 'Ha ocurrido un error', 
        'error' => $e,
       ],402);
       }
    }
}
