//*****comandos utiles****

1. crear modelo -> php artisan make:model <directory_name>/<model_name>

2. crear componente -> php artisan make:livewire ShowPosts 

3. crear componente en sub carpeta -> php artisan make:livewire Post/Show

4. composer require yajra/laravel-datatables-buttons -W



---Consulta para actualizar facturas vencidas---
update factura set estado_venta_id=4
where  estado_venta_id=1 and fecha_vencimiento < curdate() and pendiente_cobro >0