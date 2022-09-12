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

class FacturarCotizacion extends Component
{
    public $idCotizacion;

    public function mount($id)
    {

        $this->idCotizacion = $id;
    }
    public function render()
    {

        $idCotizacion = $this->idCotizacion;
        $char = '"';
        $char2 = "'";

        $cotizacion = DB::SELECTONE('
        select
        id,
        nombre_cliente,
        RTN,
        fecha_emision,
        fecha_vencimiento,
        sub_total,
        isv,
        total,
        cliente_id,
        tipo_venta_id,
        users_id,
        numeroInputs,
        created_at,
        updated_at,
        REPLACE(arregloIdInputs,'.$char2.$char.$char2.','.$char2.$char.$char2.')  as "arregloIdInputs"
        from cotizacion 
        where id =' . $idCotizacion);

        

      
        $htmlProductos =  $this->generarHTML($idCotizacion);

        $urlGuardarVenta = $this->obtenerURL($cotizacion->tipo_venta_id);




        return view('livewire.cotizaciones.facturar-cotizacion', compact('cotizacion','htmlProductos','urlGuardarVenta'));
    }

    public function generarHTML($idCotizacion)
    {

        $html = '';
        $htmlSelectUnidadVenta = '';
        $i = 1;

        $productos = DB::SELECT("
        select
        A.cotizacion_id,
        A.producto_id,
        A.nombre_producto,
        A.nombre_bodega,
        A.precio_unidad,
        A.cantidad,
        A.sub_total,
        A.isv,
        A.total,
        A.bodega_id,
        A.seccion_id,
        A.resta_inventario,
        A.isv_producto,
        A.unidad_medida_venta_id,
        B.ultimo_costo_compra,
        B.isv as isvTblProducto
        from cotizacion_has_producto A
        inner join producto B
        on A.producto_id = B.id
        where cotizacion_id =  " . $idCotizacion);



        foreach ($productos as $producto) {

            $unidadesVenta = DB::SELECT(
                "
        select 
        A.unidad_venta as unidades,
        A.id as idUnidadVenta,
        B.nombre
        from unidad_medida_venta A 
        inner join unidad_medida B
        on A.unidad_medida_id = B.id
        where A.producto_id = " . $producto->producto_id
            );

            foreach ($unidadesVenta as $unidad) {

                if ($producto->unidad_medida_venta_id == $unidad->idUnidadVenta) {
                    $htmlSelectUnidadVenta =$htmlSelectUnidadVenta. '<option selected value="' . $unidad->unidades . '" data-id="' . $unidad->idUnidadVenta . '">' . $unidad->nombre . '</option>';
                } else {
                    $htmlSelectUnidadVenta =$htmlSelectUnidadVenta. '<option  value="' . $unidad->unidades . '" data-id="' . $unidad->idUnidadVenta . '">' . $unidad->nombre . '</option>';
                }
            }



            $html = $html. 
                '<div id="'.$i.'" class="row no-gutters">
                    <div class="form-group col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
                        <div class="d-flex">

                            <button class="btn btn-danger" type="button" style="display: inline" onclick="eliminarInput(' . $i . ')"><i
                                    class="fa-regular fa-rectangle-xmark"></i>
                            </button>

                            <input id="idProducto' . $i . '" name="idProducto' . $i . '" type="hidden" value="' . $producto->producto_id . '">

                            <div style="width:100%">
                                <label for="nombre' . $i . '" class="sr-only">Nombre del producto</label>
                                <input type="text" placeholder="Nombre del producto" id="nombre' . $i . '"
                                    name="nombre' . $i . '" class="form-control" 
                                    data-parsley-required "
                                    autocomplete="off"
                                    readonly 
                                    value="' . $producto->nombre_producto . '"
                                    
                                    >
                            </div>
                        </div>
                    </div>
                    <div class="form-group col-12 col-sm-12 col-md-1 col-lg-1 col-xl-1">
                        <label for="" class="sr-only">cantidad</label>
                        <input type="text" value="' . $producto->nombre_producto . '" placeholder="bodega-seccion" id="bodega' . $i . '"
                            name="bodega' . $i . '" class="form-control" 
                            autocomplete="off"  readonly  >
                    </div>

                    <div class="form-group col-12 col-sm-12 col-md-1 col-lg-1 col-xl-1">
                        <label for="precio' . $i . '" class="sr-only">Precio</label>
                        <input value="'.$producto->precio_unidad.'" type="number" placeholder="Precio Unidad" id="precio' . $i . '"
                            name="precio' . $i . '" class="form-control"  data-parsley-required step="any"
                            autocomplete="off" min="' . $producto->ultimo_costo_compra . '" onchange="calcularTotales(precio' . $i . ',cantidad' . $i . ',' . $producto->isv . ',unidad' . $i . ',' . $i . ',restaInventario' . $i . ')">
                    </div>

                    <div class="form-group col-12 col-sm-12 col-md-1 col-lg-1 col-xl-1">
                        <label for="cantidad' . $i . '" class="sr-only">cantidad</label>
                        <input value="'.$producto->cantidad.'" type="number" placeholder="Cantidad" id="cantidad' . $i . '"
                            name="cantidad' . $i . '" class="form-control" min="0" data-parsley-required
                            autocomplete="off" onchange="calcularTotales(precio' . $i . ',cantidad' . $i . ',' . $producto->isvTblProducto . ',unidad' . $i . ',' . $i . ',restaInventario' . $i . ')">
                    </div>

                    <div class="form-group col-12 col-sm-12 col-md-1 col-lg-1 col-xl-1">
                        <label for="" class="sr-only">unidad</label>
                        <select class="form-control" name="unidad' . $i . '" id="unidad' . $i . '"
                            data-parsley-required style="height:35.7px;" 
                            onchange="calcularTotales(precio' . $i . ',cantidad' . $i . ',' . $producto->isvTblProducto . ',unidad' . $i . ',' . $i . ',restaInventario' . $i . ')">
                                    ' . $htmlSelectUnidadVenta . ' 
                        </select> 
                    
                        
                    </div>




                    <div class="form-group col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
                        <label for="subTotal' . $i . '" class="sr-only">Sub Total</label>
                        <input value="'.$producto->sub_total.'" type="number" placeholder="Sub total producto" id="subTotal' . $i . '"
                            name="subTotal' . $i . '" class="form-control" min="0" step="any"
                            autocomplete="off"
                            readonly >
                    </div>

                    <div class="form-group col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
                        <label for="isvProducto' . $i . '" class="sr-only">ISV</label>
                        <input value="'.$producto->isv.'" type="number" placeholder="ISV" id="isvProducto' . $i . '"
                            name="isvProducto' . $i . '" class="form-control" min="0" step="any"
                            autocomplete="off"
                            readonly >
                    </div>

                    <div class="form-group col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
                        <label for="total' . $i . '" class="sr-only">Total</label>
                        <input value="'.$producto->total.'" type="number" placeholder="Total del producto" id="total' . $i . '"
                            name="total' . $i . '" class="form-control" min="1"  step="any"
                            autocomplete="off"
                            readonly >
                    </div>

                    <input id="idBodega'.$i.'" name="idBodega' . $i . '" type="hidden" value="'.$producto->bodega_id.'">
                    <input id="idSeccion' . $i . '" name="idSeccion' . $i . '" type="hidden" value="' . $producto->seccion_id . '">
                    <input id="restaInventario' . $i . '" name="restaInventario' . $i . '" type="hidden" value="' . $producto->resta_inventario . '">
                    <input id="isv' . $i . '" name="isv' . $i . '" type="hidden" value="' . $producto->isvTblProducto . '">                

                    </div>';
            $htmlSelectUnidadVenta='';        
            $i++;
        }

        return  $html;
    }

    public function obtenerURL($tipoVenta){
        $url='';

        switch ($tipoVenta) {
            case 1:
                $url='/ventas/corporativo/guardar';
                break;
            case 2:
                $url='/ventas/estatal/guardar';
                break; 
            case 3:
                $url='/exonerado/venta/guardar';
                break;   
        }

       return  $url;
    }
}
