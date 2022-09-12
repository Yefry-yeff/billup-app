<?php

namespace App\Http\Livewire\Inventario;

use Livewire\Component;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;

use Auth;
use DataTables;
use Validator;
use Illuminate\Support\Facades\File;
use PDF;
use Luecano\NumeroALetras\NumeroALetras;


use App\Models\ModelAjuste;
use App\Models\ModelTipoAjuste;
use App\Models\ModelLogTranslados;
use App\Models\ModelRecibirBodega;

class Ajustes extends Component

{
    public function render()
    {
        return view('livewire.inventario.ajustes');
    }

    public function listarBodegas(Request $request){
        try {
 
         $listaBodegas = DB::SELECT("
             select id ,nombre as 'text' from bodega  where nombre like '%".$request->search."%' or id like '%".$request->search."%' limit 15
         ");

         
 
 
 
        return response()->json([
            "results" => $listaBodegas
 
        ],200);
        } catch (QueryException $e) {
        return response()->json([
            'message' => 'Ha ocurrido un error', 
            'error' => $e
        ],402);
        }
     }

     public function listarProductos(Request $request){
        try {

            //dd($request->all());
 
         $listaProductos = DB::select("
         select 
         B.id,
         CONCAT(B.id,' - ',B.nombre) as text            
         from recibido_bodega A
         inner join producto B
         on A.producto_id = B.id
         inner join seccion
         on A.seccion_id = seccion.id
         inner join segmento
         on seccion.segmento_id = segmento.id
         inner join bodega
         on segmento.bodega_id = bodega.id
         where bodega.id=".$request->bodegaId." and (B.nombre like '%".$request->search."%' or B.id like '%".$request->search."%') limit 15
         ");
 
        return response()->json([
            "results" => $listaProductos
        ]);
        } catch (QueryException $e) {
        return response()->json([
            'message' => 'Ha ocurrido un error', 
            'error' => $e
        ]);
        }
     }

     public function obtenerTiposAjuste(){

       
        $tiposAjuste = DB::select("select id, nombre as text from tipo_ajuste order by nombre asc");
        $usuarios = DB::SELECT("select id, name from users order by name asc");
        
        return response()->json([
            "results" => $tiposAjuste,
            "usuarios"=>$usuarios
        ]);
     }

     public function datosProducto(Request $request){
       try {

        $producto = DB::SELECTONE("select id, nombre, precio_base from producto where id=".$request->id);

        $unidadesMedida = DB::SELECT("
        select
        B.id,
        B.unidad_venta,
        B.unidad_venta_defecto,
        CONCAT(C.nombre,'-',B.unidad_venta) as nombre
        from producto A
        inner join unidad_medida_venta B
        on A.id = B.producto_id
        inner join unidad_medida C
        on B.unidad_medida_id = C.id
        where A.id = ".$request->id);

       return response()->json([
        'unidadesMedida'=>$unidadesMedida,
        'producto'=>$producto,
       ],200);
       } catch (QueryException $e) {
       return response()->json([
        'icon' => 'error',
        'text' => 'Ha ocurrido un error al obtener los datos de producto',
        'title' => 'Error!',
        'message' => 'Ha ocurrido un error', 
        'error' => $e,
       ],402);
       }
     }

     public function listarProducto(Request $request){
       try {

        $listaProductos = DB::SELECT("
    
        select 
            A.id as 'idRecibido',
            B.id as 'idProducto',
            B.nombre,            
            C.nombre as 'simbolo',
            compra.numero_factura,
            compra.id as cod_compra,
            A.cantidad_disponible,
            bodega.nombre as bodega,
            seccion.id as 'idSeccion',
            seccion.descripcion,
            A.created_at
        from recibido_bodega A
            inner join producto B
            on A.producto_id = B.id
            inner join seccion
            on A.seccion_id = seccion.id
            inner join segmento
            on seccion.segmento_id = segmento.id
            inner join bodega
            on segmento.bodega_id = bodega.id
            inner join unidad_medida C
            on B.unidad_medida_compra_id = C.id
            inner join compra
            on A.compra_id = compra.id
            where A.cantidad_disponible <> 0 and compra.estado_compra_id = 1 and bodega.id = ".$request->idBodega." and A.producto_id = ".$request->idProducto
        );

        return Datatables::of($listaProductos)
        ->addColumn('opciones', function ($producto) {

            return

            '<div class="text-center">
                <button class="btn btn-warning" onclick="datosProducto('.$producto->idProducto.','.$producto->idRecibido.','.$producto->cantidad_disponible.')">
                    Realizar Ajuste
                </button>
               
            </div>';
        })

        ->rawColumns(['opciones',])
        ->make(true);

     

       } catch (QueryException $e) {
       return response()->json([
        'icon' => '',
        'text' => '',
        'title' => '',
        'message' => 'Ha ocurrido un error', 
        'error' => $e,
       ],402);
       }
     }

     public function realizarAjuste(Request $request){
       try {


        $lote = ModelRecibirBodega::find($request->idRecibido);

        if($request->aritmetica==1){
            $operacion = $lote->cantidad_disponible + $request->cantidad;
            $ajusteTipoAritmetica = "Ajuste de tipo suma de unidades";
        }else{
            
           
            $operacion = $lote->cantidad_disponible - $request->cantidad;
            if($operacion<0){
            
                return response()->json([
                 'icon' => 'warning',
                 'text' => 'La acción de ajuste no puede proceder, dado que la cantidad a restar es mayor que la cantidad disponible en la sección de bodega.',
                 'title' => 'Advertencia!',
                 'message' => 'Ha ocurrido un error', 
                ],402);
            }
          
            $ajusteTipoAritmetica = "Ajuste de tipo resta de unidades";
        }

        $numeroOrden = DB::SELECTONE("select concat(YEAR(NOW()),'-',count(id)+1) as numero_orden from ajuste");

        DB::beginTransaction();

        $ajuste = new ModelAjuste;
        $ajuste->numero_ajuste = $numeroOrden->numero_orden;
        $ajuste->comentario = trim($request->comentario);
        $ajuste->tipo_ajuste_id = $request->tipo_ajuste_id;
        $ajuste->solicitado_por = $request->solicitado_por;
        $ajuste->fecha = $request->fecha;
        $ajuste->recibido_bodega_id = $request->idRecibido;
        $ajuste->producto_id = $request->idProducto;
        $ajuste->precio_producto = round($request->precio_producto,2);
        $ajuste->cantidad = $request->cantidad ;
        $ajuste->cantidad_total = $request->total_unidades;
        $ajuste->users_id = Auth::user()->id;
        $ajuste->tipo_aritmetica = $ajusteTipoAritmetica;
        $ajuste->cantidad_inicial = $lote->cantidad_disponible; 
        $ajuste->unidad_medida_venta_id=$request->idUnidadVenta;
        $ajuste->save();



        $lote->cantidad_disponible = $operacion;
        $lote->save();

        $logRegistro = new ModelLogTranslados;
        $logRegistro->origen=$request->idRecibido;
        $logRegistro->cantidad=$request->total_unidades;
        $logRegistro->unidad_medida_venta_id = $request->idUnidadVenta;
        $logRegistro->users_id=Auth::user()->id;
        $logRegistro->descripcion=$ajusteTipoAritmetica;
        $logRegistro->ajuste_id=$ajuste->id;
        $logRegistro->save();


        DB::commit();
    //    return response()->json([
    //     'icon' => 'success',
    //     'text' => 'Ajuste realizado con éxito.',
    //     'title' => 'Exito!',
    //    ],200);

       return response()->json([
        'icon' => "success",
        'text' => '
        <p class="text-center">Ajuste realizado con exito.<p>
        <div class="text-center">
            <a href="/ajustes/imprimir/ajuste/'.$ajuste->id.'" target="_blank" class="btn btn-sm btn-success btn-lg"><i class="fa-solid fa-file-invoice"></i> Imprimir Documento de Ajuste</a>
     
        </div>',
        'title' => 'Exito!',


    ], 200);
       } catch (QueryException $e) {
        DB::rollback(); 
       return response()->json([
        'icon' => 'error',
        'text' => 'Ha ocurrido un error al realizar el ajuste, los cambios no fueron guardados.',
        'title' => 'Error!',
        'message' => 'Ha ocurrido un error', 
        'error' => $e,
       ],402);
       }
     }

     public function imprimirAjuste($idAjuste){

        $productos = DB::SELECT("
        select
        C.id,
        C.nombre,
        H.nombre as bodega,
        F.descripcion as seccion,
        J.nombre as medida,
        FORMAT( (A.precio_producto * A.cantidad_total)/A.cantidad,2 ) as precio,
        FORMAT(A.cantidad_total,2) as cantidad,
        FORMAT(A.precio_producto * A.cantidad_total,2) as total
        from ajuste A
        inner join recibido_bodega B
        on A.recibido_bodega_id = B.id
        inner join producto C
        on B.producto_id = C.id
        inner join unidad_medida_venta D
        on A.unidad_medida_venta_id = D.id
        inner join unidad_medida J
        on J.id = D.unidad_medida_id
        inner join seccion F
        on B.seccion_id = F.id
        inner join segmento G
        on F.segmento_id = G.id
        inner join bodega H
        on G.bodega_id = H.id
        where A.id = ".$idAjuste);

        $ajuste = DB::SELECTONE("
        select
        cantidad_inicial,
        cantidad_total,
        tipo_aritmetica,
        FORMAT(precio_producto*cantidad_total,2) as costo,
        numero_ajuste
        from ajuste where id = ".$idAjuste
        );

        $datos = DB::SELECTONE("
        select
        DATE_FORMAT(fecha,'%d/%m/%Y') as fecha,
        comentario,
        tipo_ajuste.nombre as motivo,
        name as realizado_por,
        (select name from users where id = ajuste.solicitado_por ) as solicitado_por
        from ajuste 
        inner join users
        on ajuste.users_id = users.id
        inner join tipo_ajuste
        on ajuste.tipo_ajuste_id = tipo_ajuste.id 
        where ajuste.id = ".$idAjuste
        );

        






        
        $pdf = PDF::loadView('/pdf/ajuste',compact('productos','ajuste','datos'))->setPaper('letter');
       
        return $pdf->stream("Ajuste numero ".$ajuste->numero_ajuste.".pdf");

     }

    
}
