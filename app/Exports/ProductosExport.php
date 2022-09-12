<?php

namespace App\Exports;

use App\Models\ModelProducto;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;


class ProductosExport implements FromCollection, WithHeadings, ShouldAutoSize
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        //return ModelProducto::all();
        return ModelProducto::select("id","nombre","descripcion","isv","precio_base","ultimo_costo_compra","costo_promedio","codigo_barra","codigo_estatal","unidadad_compra","users_id","sub_categoria_id")->get();
    }

    public function headings(): array
    {
        return [
            '#',
            'Nombre',
            'Descripción',
            'ISV',
            'Precio Base',
            'Último Costo de Compra',
            'Costo Promedio',
            'Código de Barra',
            'Código Estatal',
            'Unidad de Compra',
            'ID Usuario',
            'Sub Categoria',
        ];
    }
}
