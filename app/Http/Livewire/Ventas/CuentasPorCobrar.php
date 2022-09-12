<?php

namespace App\Http\Livewire\Ventas;

use Livewire\Component;

use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Auth;
use Validator;
use DataTables;

class CuentasPorCobrar extends Component
{
    public function render()
    {
        return view('livewire.ventas.cuentas-por-cobrar');
    }

    public function listarClientes(){
        try {
 
         //$clientes = DB::SELECT("select id, nombre as text from cliente where estado_cliente_id = 1");//Clientes Activos
         $clientes = DB::SELECT("select id, nombre as text from cliente");//Todos los Clientes

        return response()->json([
            'results'=>$clientes,
        ],200);
       
        } catch (QueryException $e) {
        return response()->json([
         'message' => 'Ha ocurrido un error', 
         'error' => $e
        ],402);
        }
    }

    /*
    public function listarCuentasPorCobrar(){
        try{

        $bancos = DB::SELECT("select 
        banco.id,
        banco.nombre,
        banco.cuenta,
        users.name
        from banco
        inner join users
        on banco.users_id = users.id");

        return Datatables::of($bancos)
                ->addColumn('opciones', function ($banco) {

                    return

                        '
                <div class="btn-group">
                <button data-toggle="dropdown" class="btn btn-warning dropdown-toggle" aria-expanded="false">Ver
                    más</button>
                <ul class="dropdown-menu" x-placement="bottom-start"
                    style="position: absolute; top: 33px; left: 0px; will-change: top, left;">

                    <li>
                        <a class="dropdown-item" onclick="datosBanco('.$banco->id.')" >
                            <i class="fa-solid fa-arrows-to-eye text-info"></i> Editar 
                        </a>
                    </li>
                    <li>
                    <a class="dropdown-item"   ><i class="fa-solid fa-xmark text-danger"></i> Desactivar </a>
                    </li>

                </ul>
            </div>
                ';
                })
            

                ->rawColumns(['opciones'])
                ->make(true);
        } catch (QueryException $e) {


            return response()->json([
                'message' => 'Ha ocurrido un error al listar los bancos.',
                'errorTh' => $e,
            ], 402);
        }
    }

    */


}
