<?php

use Illuminate\Support\Facades\Route;
use App\Http\Livewire\Bodega;
use App\Http\Livewire\BodegaComponent\BodegaEditar;
use App\Http\Livewire\Proveedores;
use App\Http\Livewire\Usuarios\ListarUsuarios;
use App\Http\Livewire\Inventario\Producto;
use App\Http\Livewire\Inventario\Retenciones;
use App\Http\Livewire\Inventario\DetalleProducto;
use App\Http\Livewire\Inventario\CompraProducto;
use App\Http\Livewire\Inventario\ListarCompras;
use App\Http\Livewire\Inventario\DetalleCompra;
use App\Http\Livewire\Inventario\PagosCompra;
use App\Http\Livewire\Inventario\RecibirProducto;
use App\Http\Livewire\Inventario\Incidencias;
use App\Http\Livewire\Inventario\AnularCompra;
use App\Http\Livewire\Inventario\Translados;
use App\Http\Livewire\Inventario\Marca;
use App\Http\Livewire\Inventario\UnidadesMedida;
use App\Http\Livewire\Inventario\Ajustes;
use App\Http\Livewire\Clientes\Cliente;
use App\Http\Livewire\Ventas\ListadoFacturas;
use App\Http\Livewire\Ventas\FacturacionCorporativa;
use App\Http\Livewire\Ventas\DetalleVenta;
use App\Http\Livewire\Ventas\Cobros;
use App\Http\Livewire\Ventas\Comparacion;
use App\Http\Livewire\Ventas\Configuracion;
use App\Http\Livewire\VentasEstatal\FacturacionEstatal;
use App\Http\Livewire\VentasEstatal\ListadoFacturaEstatal;
use App\Http\Livewire\Ventas\SeleccionarFactura;
use App\Http\Livewire\Ventas\LitsadoFacturasVendedor;
use App\Http\Livewire\Ventas\DetalleVentaVendedor;
use App\Http\Livewire\VentasEstatal\LitsadoFacturasEstatalVendedor;
use App\Http\Livewire\VentasExoneradas\VentasExoneradas;
use App\Http\Livewire\VentasExoneradas\ListadoFacturasExonerads;
use App\Http\Livewire\Cotizaciones\Cotizacion;
use App\Http\Livewire\Cotizaciones\ListarCotizaciones;
use App\Http\Livewire\Cotizaciones\FacturarCotizacion;
use App\Http\Livewire\Ventas\ListadoFacturasAnuladas;
use App\Http\Livewire\Inventario\ListadoAjustes;
use App\Http\Livewire\Inventario\HistorialTranslados;
use App\Http\Livewire\Cardex\Cardex;

use App\Http\Livewire\Ventas\Cai;
use App\Http\Livewire\Bancos;
use App\Http\Livewire\VentasEstatal\NumOrdenCompra;
use App\Http\Livewire\VentasEstatal\CodigoExoneracion;
use App\Http\Livewire\Inventario\TipoAjuste;
use App\Http\Livewire\Ventas\MotivoNotaCredito;

use App\Http\Livewire\NotaCredito\CrearNotaCredito;
use App\Http\Livewire\Inventario\Categoria;
use App\Http\Livewire\Inventario\SubCategoria;

use App\Http\Livewire\Ventas\SinRestriccionPrecio;

use App\Http\Livewire\Ventas\ListadoFacturasND;


use App\Http\Livewire\Ventas\CuentasPorCobrar;
use App\Http\Livewire\Ventas\HistoricoPreciosCliente;
use App\Http\Livewire\CuentasPorCobrar\ListadoFacturas as listadoCuentasCobrar;




/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    //return view('welcome');
    return redirect('/login');
});

Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', function () {
   return view('/dashboard');
    //return redirect('/bodega');
})->name('dashboard');


Route::middleware(['auth:sanctum', 'verified'])->group(function () {

//---------------------------------------configuracion-------------------------------//
Route::get('/configuracion/datos',[Configuracion::class,'parametros']);
Route::get('/configuracion/datos/compra',[Configuracion::class,'datosCompra']);
Route::get('/datos/mes/actual',[Configuracion::class,'datosMesActual']);
Route::get('/datos/mes/anterior',[Configuracion::class,'datosMesAnterior']);
Route::get('/editar/configuracion/{estado}',[Configuracion::class,'editarEstado']);
Route::get('/configuracion/excel',[Configuracion::class,'exportarExcel']);





//-----------------------Bodega---------------------------------------------------------------------------------------------------------------------//
Route::get('/bodega', Bodega::class);
Route::get('/bodega/editar/screen', BodegaEditar::class);

Route::post('/bodega/crear',  [Bodega::class, 'crearBodega']);
Route::get('/bodega/listar/bodegas', [BodegaEditar::class, 'listarBodegas']);
Route::post('/bodega/desactivar', [BodegaEditar::class, 'desactivarBodega']);
Route::post('/bodega/datos', [BodegaEditar::class, 'obtenerDatos']);
Route::post('/bodega/editar', [BodegaEditar::class, 'editarBodega']);

Route::get('/bodega/segmentos/listar/{idBodega}', [BodegaEditar::class, 'obtenerSegmentoDeBodega']);
Route::post('/guardar/seccion', [BodegaEditar::class, 'guardarSeccion']);
Route::post('/guardar/segmento', [BodegaEditar::class, 'guardarSegmento']);


//----------------------Proveedores-----------------------------------------------------------------------------------------------------------------//

Route::get('/proveedores', Proveedores::class);
Route::post('/proveedores/crear',  [Proveedores::class, 'proveerdoresModelInsert']);
Route::post('/proveedores/obeter/departamentos', [Proveedores::class, 'obtenerDepartamentos']);
Route::post('/proveedores/obeter/municipios', [Proveedores::class, 'obtenerMunicipios']);
Route::get('/proveedores/listar/proveedores', [Proveedores::class, 'listarProveedores']);
Route::post('/proveedores/desactivar', [Proveedores::class, 'desactivarProveedor']);
Route::post('/proveedores/editar', [Proveedores::class, 'obtenerProveedor']);
Route::post('/proveedores/editar/guardar', [Proveedores::class, 'editarProveedor']);
Route::get('/inventario/retenciones', Retenciones::class);
Route::get('/inventario/retenciones/listar', [Retenciones::class, 'listarRetenciones']);
Route::post('/proveedores/retencion/crear', [Retenciones::class, 'registrarRetencion']);


//-------------------------------------------------CLIENTES-----------------------------------------------------------------------------------------//
Route::get('/clientes', Cliente::class);

Route::get('/cliente/pais', [Cliente::class, 'opbtenerPais']);
Route::post('/cliente/departamento', [Cliente::class, 'obtenerDepartamentos']);
Route::post('/cliente/municipio', [Cliente::class, 'obtenerMunicipio']);

Route::get('/cliente/tipo/personalidad', [Cliente::class, 'tipoPersonalidad']);
Route::get('/cliente/tipo/cliente', [Cliente::class, 'tipoCliente']);
Route::get('/cliente/lista/vendedores', [Cliente::class, 'listaVendedores']);
Route::post('/cliente/registrar', [Cliente::class, 'guardarCliente']);
Route::get('/clientes/listar', [Cliente::class, 'listarClientes']);
Route::post('/clientes/datos/editar', [Cliente::class, 'datosCliente']);
Route::post('/clientes/editar', [Cliente::class, 'editarCliente']);
Route::post('/clientes/imagen', [Cliente::class, 'obtenerImagen']);
Route::post('/clientes/imagen/editar', [Cliente::class, 'cambiarImagenCliente']);
Route::post('/clientes/desactivar', [Cliente::class, 'desactivarCliente']);
Route::post('/clientes/activar', [Cliente::class, 'activarCliente']);



//----------------------------------------------FACTURACIONES---------------------------------------------------------------------------------------//

Route::get('/facturas/corporativo', ListadoFacturas::class);
Route::get('/lista/facturas/corporativo', [ListadoFacturas::class,'listarFacturas']);
Route::post('/factura/corporativo/anular', [ListadoFacturas::class,'anularVentaRegistro']);

Route::get('/facturas/corporativo/vendedor', LitsadoFacturasVendedor::class);
Route::get('/lista/facturas/corporativo/vendedor', [LitsadoFacturasVendedor::class,'listarFacturasVendedor']);

Route::get('/facturas/corporativo/lista', ListadoFacturasND::class); 
Route::get('/facturas/corporativo/lista/nd', [ListadoFacturasND::class,'listarFacturas']);

//-----------------------------------------------Usuarios-------------------------------------------------------------------------------------------//
Route::get('/usuarios', ListarUsuarios::class);
Route::get('/usuarios/listar/usuarios', [ListarUsuarios::class, 'listarUsuarios']);




//--------------------------------------------Inventario--------------------------------------------------------------------------------------------//

Route::get('/producto/registro', Producto::class);
Route::post('/producto/registrar', [Producto::class, 'crearProducto']);
Route::post('/producto/editar', [Producto::class, 'editarProducto']);
Route::post('/producto/eliminar', [Producto::class, 'eliminarImagen']);
Route::get('/producto/marca/listar',[Marca::class,'listarMarcas']);
Route::post('/producto/marca/guardar',[Marca::class,'guardarMarca']);
Route::post('/producto/marca/datos', [Marca::class,'obtenerDatos']);
Route::post('/producto/marca/editar', [Marca::class,'editarMarca']);




Route::post('/ruta/imagen/edit', [Producto::class, 'guardarFoto']);
Route::get('/producto/datos/{id}', [Producto::class, 'listarModalProductoEdit']);
Route::get('/producto/listar/productos', [Producto::class, 'listarProductos']);
Route::post('/producto/actualizar/costos', [Producto::class,'calcularCostos']);
Route::get('/producto/detalle/{id}', DetalleProducto::class);
Route::get('/detalle/producto/unidad/{id}', [DetalleProducto::class,'unidadesVenta']);
Route::get('/detalle/unidades/venta', [DetalleProducto::class,'obtenerUnidadesMedida']);
Route::post('/detalle/unidades/editar', [DetalleProducto::class,'editarUnidadesVenta']);
Route::get('/producto/compra', CompraProducto::class);
Route::get('/producto/lista/proveedores', [CompraProducto::class,'listarProveedores']);
Route::get('/producto/tipo/pagos', [CompraProducto::class,'listarFormasPago']);
Route::get('/producto/listar/producto', [CompraProducto::class,'listarProductos']);
Route::post('/producto/listar/imagenes', [CompraProducto::class,'obtenerImagenes']);
Route::post('/prodcuto/compra/datos',[CompraProducto::class,'obtenerDatosProducto']);
Route::post('/producto/compra/retencion', [CompraProducto::class, 'comprobarRetencion']);
Route::post('/producto/compra/guardar', [CompraProducto::class, 'guardarCompra']);
Route::get('/producto/listar/compras', ListarCompras::class);
Route::get('/producto/compras/listar', [ListarCompras::class, 'listarCompras']);
Route::get('/producto/compras/detalle/{id}', DetalleCompra::class);
Route::get('/producto/compra/pagos/{id}', PagosCompra::class);
Route::post('/producto/compra/pagos/registro', [ PagosCompra::class, 'registrarPago']);
Route::get('/producto/compra/pagos/lista/{id}', [ PagosCompra::class, 'listarPagos']);
Route::post('/producto/compra/pagos/datos', [PagosCompra::class,'DatosCompra']);
Route::post('/producto/compra/pagos/eliminar', [PagosCompra::class,'eliminarPago']);
Route::post('/producto/compra/pagos/comprobar', [PagosCompra::class,'comprobarRetencion']);
Route::get('/producto/compra/recibir/{id}', RecibirProducto::class);
Route::get('/producto/compra/recibir/listar/{id}', [RecibirProducto::class, 'listarProductos']);
Route::get('/producto/recibir/bodega', [RecibirProducto::class, 'bodegasLista']);
Route::post('/producto/recibir/segmento', [RecibirProducto::class, 'listarSegmentos']);
Route::post('/producto/recibir/seccion', [RecibirProducto::class, 'listarSecciones']);
Route::get('/producto/recibir/Umedidas/{idProducto}', [RecibirProducto::class, 'listarUmedidas']);
Route::post('/producto/recibir/guardar', [RecibirProducto::class, 'guardarEnBodega']);
Route::get('/producto/lista/bodega/{id}', [RecibirProducto::class, 'productoBodega']);
Route::post('/producto/recibir/datos',[RecibirProducto::class, 'datosGeneralesCompra']);
Route::post('/producto/recibir/excedente',[RecibirProducto::class, 'guardarEnBodegaExcedente']);
Route::post('/producto/incidencia/bodega',[RecibirProducto::class, 'incidenciaBodega']);
Route::post('/producto/incidencia/compra',[RecibirProducto::class, 'incidenciaCompra']);
Route::get('/inventario/compras/incidencias/{id}', Incidencias::class);
Route::get('/inventario/incidencia/bodega/{id}',[Incidencias::class, 'incidenciasBodega']);
Route::get('/inventario/incidencia/compra/{id}',[Incidencias::class, 'incidenciaCompra']);
Route::post('/producto/compra/anular',[AnularCompra::class, 'anularCompraRegistro']);
Route::get('/inventario/translado', Translados::class);
Route::get('/translado/lista/productos',[Translados::class, 'listarProductos']);
Route::get('/translado/lista/bodegas',[Translados::class, 'listarBodegas']);
Route::get('/translado/producto/lista/{idBodega}/{idProducto}',[Translados::class, 'productoBodega']);
Route::get('/translado/destino/lista/{idSeccion}/{idProducto}',[Translados::class, 'productoGeneralBodega']);
Route::post('/translado/producto/bodega',[Translados::class, 'ejectarTranslado']);
Route::post('/producto/compra/pagos/eliminar', [PagosCompra::class,'eliminarPago']);
Route::post('/producto/compra/pagos/comprobar', [PagosCompra::class,'comprobarRetencion']);
Route::get('/compra/retencion/documento/{idCompra}', [PagosCompra::class,'retencionDocumentoPDF']);


Route::get('/translado/imprimir/{id}',[Translados::class,'imprimirTranslado']);

Route::get('/translados/historial', HistorialTranslados::class);
Route::post('/translados/obtener/listado', [HistorialTranslados::class,'historialTranslados']);


//---------------------------------------------------------------------VENTAS--------------------------------------------------------------------------------//

Route::get('/ventas/coporativo', FacturacionCorporativa::class);
Route::get('/ventas/lista/clientes', [FacturacionCorporativa::class,'listarClientes']);
Route::post('/ventas/datos/cliente', [FacturacionCorporativa::class,'datosCliente']);
Route::get('/ventas/tipo/pago', [FacturacionCorporativa::class,'tipoPagoVenta']);
Route::get('/ventas/listar/bodegas/{idProducto}', [FacturacionCorporativa::class,'listarBodegas']);
Route::get('/ventas/listar/', [FacturacionCorporativa::class,'productoBodega']);
Route::post('/ventas/datos/producto', [FacturacionCorporativa::class,'obtenerDatosProducto']);
Route::post('/ventas/corporativo/guardar', [FacturacionCorporativa::class,'guardarVenta']);
Route::get('/ventas/corporativo/vendedores', [FacturacionCorporativa::class,'listadoVendedores']);
Route::get('/detalle/venta/{id}', DetalleVenta::class);
Route::get('/detalle/venta/vendedor/{id}', DetalleVentaVendedor::class);
Route::get('/lista/productos/factura/{id}', [DetalleVenta::class,'listarProductosFactura']);
Route::get('/lista/ubicacion/producto/{id}', [DetalleVenta::class,'ubicacionProductos']);
Route::get('/lista/pagos/venta/{id}', [DetalleVenta::class,'pagosVenta']);
Route::get('/venta/cobro/{id}', Cobros::class);
Route::post('/venta/registro/cobro', [Cobros::class,'registrarPago']);
Route::get('/venta/litsado/pagos/{id}', [Cobros::class,'listarPagos']);
Route::post('/venta/datos/compra', [Cobros::class,'DatosCompra']);
Route::post('/venta/cobro/eliminar', [Cobros::class,'eliminarPago']);
Route::get('/factura/cooporativo/{idFactura}', [FacturacionCorporativa::class,'imprimirFacturaCoorporativa']);
Route::get('/ventas/Configuracion',Configuracion::class);


Route::get('/ventas/listado/comparacion',Comparacion::class);
Route::post('/ventas/listado/uno', [Comparacion::class,'listadoUno']);
Route::post('/ventas/listado/dos', [Comparacion::class,'listadoDos']);
Route::get('/ventas/estado/nd/{idFactura}', [Comparacion::class,'cambioEstadoND']);
Route::get('/ventas/estado/dc/{idFactura}', [Comparacion::class,'cambioEstadoDC']);


//---------------------------------------------------------------------VENTAS ESTATAL--------------------------------------------------------------------------------//


Route::get('/ventas/estatal', FacturacionEstatal::class);
Route::get('/ventas/estatal/vendedor', LitsadoFacturasEstatalVendedor::class);
Route::get('/estatal/lista/clientes', [FacturacionEstatal::class,'listarClientes']);
Route::post('/estatal/datos/cliente', [FacturacionEstatal::class,'datosCliente']);
Route::get('/estatal/tipo/pago', [FacturacionEstatal::class,'tipoPagoVenta']);
Route::get('/estatal/listar/bodegas/{idProducto}', [FacturacionEstatal::class,'listarBodegas']);
Route::post('/estatal/datos/producto', [FacturacionEstatal::class,'obtenerDatosProducto']);

Route::post('/ventas/estatal/guardar', [FacturacionEstatal::class,'guardarVenta']);
Route::get('/ventas/numero/orden',[FacturacionEstatal::class,'obtenerOrdenCompra']);

Route::post('/ventas/estatal/guardar', [FacturacionEstatal::class,'guardarVenta']);


Route::get('/facturas/estatal', ListadoFacturaEstatal::class);
Route::get('/lista/facturas/estatal', [ListadoFacturaEstatal::class,'listarFacturas']);
Route::post('/factura/estatal/anular', [ListadoFacturaEstatal::class,'anularVentaRegistro']);



Route::get('/marca/producto', Marca::class);

//-----------------------------------------------------------------Ventas Exoneradas----------------------------------------------------------------------------//
Route::get('/ventas/exonerado/factura',VentasExoneradas::class);
Route::get('/exonerado/lista/clientes', [VentasExoneradas::class,'listarClientes']);
Route::post('/exonerado/venta/guardar', [VentasExoneradas::class,'guardarVenta']);
Route::get('/exonerado/ventas/lista', ListadoFacturasExonerads::class);
Route::get('/exonerado/listas/facturas',[ListadoFacturasExonerads::class,'listarFacturas']);
Route::get('/exonerado/factura/{id}',[VentasExoneradas::class,'imprimirFacturaExonerada']);
Route::get('/exonerado/listar/codigos', [VentasExoneradas::class,'obtenerCodigoExoneracion']);


//-------------------------------------seleccionar declaraciones---------------------------------//
Route::get('/ventas/seleccionar', SeleccionarFactura::class);
Route::get('/ventas/lista/seleccionar', [SeleccionarFactura::class,'listadoFacturas']);
Route::post('/ventas/cambio', [SeleccionarFactura::class,'cambioEstado']);
Route::post('/ventas/bloquear/estado', [SeleccionarFactura::class,'guardarEstado']);
Route::post('/ventas/seleccionar/mayor',[SeleccionarFactura::class,'seleccionarMontoMayor']);
Route::post('/ventas/seleccionar/menor',[SeleccionarFactura::class,'seleccionarMontoMEnor']);


//---------------------------------------Proforma y Cotizaciones--------------------------------//
Route::get('/proforma/cotizacion/{id}',Cotizacion::class);
Route::get('/cotizacion/clientes',[Cotizacion::class,'listarClientes']);
Route::post('/guardar/cotizacion',[Cotizacion::class,'guardarCotizacion']);
Route::get('/cotizacion/listado/{id}', ListarCotizaciones::class);
Route::post('/cotizacion/obtener/listado', [ListarCotizaciones::class,'listarCotizaciones']);
Route::get('/cotizacion/imprimir/{id}',[Cotizacion::class,'imprimirCotizacion']);
Route::get('/proforma/imprimir/{id}',[Cotizacion::class,'imprimirProforma']);
Route::get('/cotizacion/facturar/{id}',FacturarCotizacion::class);


//--------------------------------------------------------Ajustes------------------------------------------------------//
Route::get('/inventario/ajustes', Ajustes::class);
Route::get('/ajustes/listar/bodegas', [Ajustes::class,'listarBodegas']);
Route::get('/ajustes/listar/productos', [Ajustes::class,'listarProductos']);
Route::get('/ajustes/motivos/listar', [Ajustes::class,'obtenerTiposAjuste']);
Route::post('/ajustes/datos/producto', [Ajustes::class,'datosProducto']);
Route::post('/ajustes/listado/producto/bodega', [Ajustes::class,'listarProducto']);

Route::post('/ajustes/listado/producto/bodega', [Ajustes::class,'listarProducto']);
Route::post('/ajustes/guardar/ajuste', [Ajustes::class,'realizarAjuste']);
Route::get('/ajustes/imprimir/ajuste/{id}', [Ajustes::class,'imprimirAjuste']);

Route::get('/listado/ajustes',ListadoAjustes::class);
Route::post('/obtener/listado/ajustes',[ListadoAjustes::class,'listarAjustes']);

//------------------------------------------------------Facturas Nulas---------------------------------------------//


Route::get('/ventas/anulado/{id}',ListadoFacturasAnuladas::class);
Route::post('/ventas/anulado/listado',[ListadoFacturasAnuladas::class,'listarFacturas']);
Route::post('/ventas/anulado/detalle',[ListadoFacturasAnuladas::class,'detalleFacturaAnulada']);



//------------------------------------------------------------------UNIDADES DE MEDIDA------------------------------------------------------------------------//

Route::get('/inventario/unidades/medida', UnidadesMedida::class);
Route::post('/inventario/unidades/guardar', [UnidadesMedida::class, 'guardarUnidad']);
Route::get('/inventario/unidades/listar', [UnidadesMedida::class, 'listarUnidades']);
Route::post('/inventario/unidades/datos', [UnidadesMedida::class, 'obtenerDatos']);
Route::post('/inventario/unidades/editar', [UnidadesMedida::class, 'editarUnidad']);

//-----------------------------------------------------------------------CAI--------------------------------------------------------------------------------//

Route::get('/ventas/cai',Cai::class);
Route::get('/ventas/cai/listar', [Cai::class,'listarCAI']);
Route::post('/ventas/cai/guardar', [Cai::class,'guardarCAI']);
Route::post('/ventas/cai/datos', [Cai::class,'datosCAI']);
Route::post('/ventas/cai/editar', [Cai::class,'editarCAI']);

//----------------------------------------------------------------------------Bancos------------------------------------------------------------------------//

Route::get('/banco/bancos', Bancos::class);
Route::get('/banco/bancos/listar', [Bancos::class,'listarBancos']);
Route::post('/banco/bancos/guardar', [Bancos::class,'guardarBanco']);
Route::post('/banco/bancos/datos', [Bancos::class,'obtenerDatos']);
Route::post('/banco/bancos/editar', [Bancos::class,'editarBanco']);



//------------------------------------------------------------------Numero de Orden de Compra--------------------------------------------------------------------------------//

Route::get('/estatal/ordenes',NumOrdenCompra::class);
Route::get('/estatal/ordenes/listar', [NumOrdenCompra::class,'listarNumOrdenCompra']);
Route::get('/estatal/ordenes/listar/clientes', [NumOrdenCompra::class,'listarClientes']);
Route::post('/estatal/ordenes/guardar', [NumOrdenCompra::class,'guardarNumOrdenCompra']);
Route::post('/estatal/ordenes/datos', [NumOrdenCompra::class,'obtenerNumOrdenCompra']);
Route::post('/estatal/ordenes/editar', [NumOrdenCompra::class,'editarNumOrdenCompra']);

Route::post('/estatal/ordenes/desactivar', [NumOrdenCompra::class,'desactivarNumOrdenCompra']);

//------------------------------------------------------------------Codigo Exoneracion--------------------------------------------------------------------------------//

Route::get('/estatal/exonerado',CodigoExoneracion::class);
Route::get('/estatal/exonerado/listar', [CodigoExoneracion::class,'listarCodigoExoneracion']);
Route::get('/estatal/exonerado/listar/clientes', [CodigoExoneracion::class,'listarClientes']);
Route::post('/estatal/exonerado/guardar', [CodigoExoneracion::class,'guardarCodigoExoneracion']);
Route::post('/estatal/exonerado/datos', [CodigoExoneracion::class,'obtenerCodigoExoneracion']);
Route::post('/estatal/exonerado/editar', [CodigoExoneracion::class,'editarCodigoExoneracion']);

Route::post('/estatal/exonerado/desactivar', [CodigoExoneracion::class,'desactivarCodigoExoneracion']);

//------------------------------------------------------------------Tipo Ajuste--------------------------------------------------------------------------------//

Route::get('/inventario/tipoajuste',TipoAjuste::class);
Route::get('/inventario/tipoajuste/listar', [TipoAjuste::class,'listarTipoAjuste']);
Route::post('/inventario/tipoajuste/guardar', [TipoAjuste::class,'guardarTipoAjuste']);
Route::post('/inventario/tipoajuste/datos', [TipoAjuste::class,'obtenerTipoAjuste']);
Route::post('/inventario/tipoajuste/editar', [TipoAjuste::class,'editarTipoAjuste']);


//-------------------------------------------------------------------Nota de Credito-------------------------------------------------------------------------------------------//

Route::get('/nota/credito',CrearNotaCredito::class);
ROUTE::get('/nota/credito/clientes', [CrearNotaCredito::class, 'obtenerClientes']);
Route::get('/nota/credito/facturas', [CrearNotaCredito::class,'obtenerFactura']);
Route::post('/nota/credito/datos/factura',[CrearNotaCredito::class, 'obtenerDetalleFactura']);
Route::post('/nota/credito/obtener/productos',[CrearNotaCredito::class,'obtenerProductos']);
Route::post('/nota/credito/datos/producto',[CrearNotaCredito::class,'datosProducto']);

Route::get('/ventas/motivo_credito',MotivoNotaCredito::class);
Route::get('/ventas/motivo_credito/listar', [MotivoNotaCredito::class,'listarMotivoNotaCredito']);
Route::post('/ventas/motivo_credito/guardar', [MotivoNotaCredito::class,'guardarMotivoNotaCredito']);
Route::post('/ventas/motivo_credito/datos', [MotivoNotaCredito::class,'obtenerMotivoNotaCredito']);
Route::post('/ventas/motivo_credito/editar', [MotivoNotaCredito::class,'editarMotivoNotaCredito']);


//--------------------------------------------------------------------------CARDEX----------------------------------------------------------------------------------------------//
Route::get('/cardex', Cardex::class);
Route::get('/cardex/listar/bodega', [Cardex::class, 'listarBodegas']);
Route::get('/cardex/listar/productos', [Cardex::class, 'listarProductos']);

Route::get('/listado/cardex/{idBodega}/{idProducto}', [Cardex::class, 'listarCardex']);


//------------------------------------------establecer links de storage---------------------------//
Route::get('/linkstorage', function () {
    Artisan::call('storage:link'); // this will do the command line job
});


//---------------------------------------------------------CRUD CATEGORIAS ---------------------------------------------------------//



Route::get('/categoria/categorias', Categoria::class);
Route::get('/categoria/listar', [Categoria::class,'listarCategorias']);
Route::post('/categoria/guardar', [Categoria::class,'guardarCategoria']);
Route::post('/categoria/datos', [Categoria::class,'obtenerDatos']);
Route::post('/categoria/editar', [Categoria::class,'editarCategoria']);


Route::get('/sub_categoria/sub_categorias', SubCategoria::class);
Route::get('/sub_categoria/listar', [SubCategoria::class,'listarSubCategorias']);
Route::get('/sub_categoria/listar/categorias', [SubCategoria::class,'listarCategorias']);
Route::get('/producto/sub_categoria/listar/{id}',[Producto::class,'listarSubcategorias']);
Route::post('/sub_categoria/guardar', [SubCategoria::class,'guardarSubCategoria']);
Route::post('/sub_categoria/datos', [SubCategoria::class,'obtenerDatos']);
Route::post('/sub_categoria/editar', [SubCategoria::class,'editarSubCategoria']);

//---------------------------------------------------------SinRestriccionPrecio-------------------------------------------------------//

Route::get('/ventas/sin/restriccion/precio', SinRestriccionPrecio::class);
Route::get('/ventas/solicitud/codigo', [SinRestriccionPrecio::class,'enviarCodigo']);
Route::post('/ventas/verificar/codigo', [SinRestriccionPrecio::class,'verificarCodigo']);
Route::post('/ventas/autorizacion/desactivar',[SinRestriccionPrecio::class,'desactivarCodigo']);
//---------------------------------------------------------SinRestriccionPrecio-------------------------------------------------------//

//////////////////////////////////////////CUENTAS POR COBRAR///////////////////////////////////////////


Route::get('/cuentas/por/cobrar/listado',listadoCuentasCobrar::class);
Route::get('/cuentas/cobrar/lista',[listadoCuentasCobrar::class,'listarFacturasCobrar']);
Route::get('/ventas/cuentas_por_cobrar', CuentasPorCobrar::class);
Route::get('/ventas/cuentas_por_cobrar/clientes', [CuentasPorCobrar::class,'listarClientes']);
//Route::get('/ventas/cuentas_por_cobrar/productos', [CuentasPorCobrar::class,'listarProductos']);

Route::get('/ventas/cuentas_por_cobrar/listar', [CuentasPorCobrar::class,'listarCuentasPorCobrar']);
//Route::get('/ventas/cuentas_por_cobrar/listar_intereses', [CuentasPorCobrar::class,'listarCuentasPorCobrarIntereses']);

//Route::get('/ventas/cuentas_por_cobrar/excel_cuentas', [CuentasPorCobrar::class,'listarCuentasPorCobrarIntereses']);
//Route::get('/ventas/cuentas_por_cobrar/excel_intereses', [CuentasPorCobrar::class,'listarCuentasPorCobrarIntereses']);

/////////////////////////////////////////HISTORICO DE PRECIOS//////////////////////////////////////////


Route::get('/ventas/historico_precios_cliente', HistoricoPreciosCliente::class);

//Route::get('/ventas/historico_precios_cliente', [HistoricoPreciosCliente::class,'listarClientes']);
//Route::get('/ventas/historico_precios_cliente', [HistoricoPreciosCliente::class,'listarHistoricoPrecios']);

//Route::get('/ventas/historico_precios_cliente/excel', [HistoricoPreciosCliente::class,'exportHistorico']);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Route::get('/ventas/sin/restriccion/precio', SinRestriccionPrecio::class);
Route::get('/ventas/solicitud/codigo', [SinRestriccionPrecio::class,'enviarCodigo']);
Route::post('/ventas/verificar/codigo', [SinRestriccionPrecio::class,'verificarCodigo']);
Route::post('/ventas/autorizacion/desactivar',[SinRestriccionPrecio::class,'desactivarCodigo']);

//////////////////////////////////////////////////////REPORTES EXCEL////////////////////////////////////////////////////////

Route::get('/cliente/excel', [Cliente::class, 'export']);
Route::get('/producto/excel', [Producto::class, 'export']);
Route::get('/compras/excel_mes/{mes}', [ListarCompras::class, 'export']);

Route::get('/bodega/excel', [Bodega::class, 'export']);

Route::get('/cai/verificacion', [Cai::class, 'verificacionEstadosCai']);

return redirect('/login');
});



