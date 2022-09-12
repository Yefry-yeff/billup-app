<?php

namespace App\Http\Livewire\Usuarios;

use Livewire\Component;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Auth;
use Validator;
use Illuminate\Database\QueryException;
use Throwable;

use DataTables;



class ListarUsuarios extends Component
{
    public function render()
    {
        return view('livewire.usuarios.listar-usuarios');
    }

    public function listarUsuarios(){

        try {

            $listaUsuarios = DB::SELECT("

            SELECT
            @i := @i + 1 as contador,
            users.id as id,
            name as nombre,
            telefono,
            email,
            identidad,
            fecha_nacimiento,
            rol.nombre as tipo_usuario,
            users.created_at as fecha_registro

            FROM users inner join rol
            on users.rol_id = rol.id
            cross join (select @i := 0) r


            ");

            return Datatables::of($listaUsuarios)


            ->make(true);

        } catch (QueryException $e) {

            return response()->json([
                "message" => "Ha ocurrido un error al listar los usuarios.",
                "error" => $e
            ]);
        }

    }
}
