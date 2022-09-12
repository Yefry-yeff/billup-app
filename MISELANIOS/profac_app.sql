-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 30-07-2022 a las 00:51:23
-- Versión del servidor: 5.7.33
-- Versión de PHP: 8.0.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `profac_app`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ajuste`
--

CREATE TABLE `ajuste` (
  `id` int(11) NOT NULL,
  `numero_ajuste` varchar(45) NOT NULL,
  `comentario` text NOT NULL,
  `tipo_aritmetica` varchar(45) NOT NULL,
  `tipo_ajuste_id` int(11) NOT NULL,
  `solicitado_por` bigint(20) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `recibido_bodega_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `precio_producto` double NOT NULL,
  `cantidad_inicial` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `cantidad_total` int(11) NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `unidad_medida_venta_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ajuste`
--

INSERT INTO `ajuste` (`id`, `numero_ajuste`, `comentario`, `tipo_aritmetica`, `tipo_ajuste_id`, `solicitado_por`, `fecha`, `recibido_bodega_id`, `producto_id`, `precio_producto`, `cantidad_inicial`, `cantidad`, `cantidad_total`, `users_id`, `unidad_medida_venta_id`, `created_at`, `updated_at`) VALUES
(1, '2022-1', 'prueba de ajuste', 'Ajuste de tipo suma de unidades', 1, 8, '2022-07-26', 1, 1, 115, 701, 4, 4, 3, 2, '2022-07-26 22:18:12', '2022-07-26 22:18:12'),
(2, '2022-2', 'prueba', 'Ajuste de tipo suma de unidades', 1, 5, '2022-07-28', 1, 1, 115, 705, 5, 5, 3, 2, '2022-07-28 17:32:29', '2022-07-28 17:32:29'),
(3, '2022-3', 'Prueba de ajsute', 'Ajuste de tipo suma de unidades', 1, 4, '2022-07-28', 2, 4, 5.75, 700, 5, 5, 3, 3, '2022-07-28 18:16:22', '2022-07-28 18:16:22'),
(4, '2022-4', 'Prueba de ajuste', 'Ajuste de tipo resta de unidades', 1, 4, '2022-07-28', 2, 4, 5.75, 705, 5, 5, 3, 3, '2022-07-28 18:17:36', '2022-07-28 18:17:36'),
(5, '2022-5', 'prueba de ajuste', 'Ajuste de tipo suma de unidades', 1, 4, '2022-07-28', 1, 1, 115, 710, 5, 5, 3, 2, '2022-07-28 18:19:11', '2022-07-28 18:19:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco`
--

CREATE TABLE `banco` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `cuenta` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `banco`
--

INSERT INTO `banco` (`id`, `nombre`, `cuenta`, `created_at`, `updated_at`, `users_id`) VALUES
(1, 'Banco Atlantida', '22775544', '2022-07-06 03:38:27', '2022-07-06 03:38:27', 2),
(2, 'Banco Ficohsa', '33447788', '2022-07-06 03:38:27', '2022-07-06 03:38:27', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodega`
--

CREATE TABLE `bodega` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(500) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `municipio_id` int(11) NOT NULL,
  `encargado_bodega` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `latitud` varchar(45) DEFAULT NULL,
  `longitud` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bodega`
--

INSERT INTO `bodega` (`id`, `nombre`, `direccion`, `estado_id`, `municipio_id`, `encargado_bodega`, `created_at`, `updated_at`, `latitud`, `longitud`) VALUES
(1, 'Bodega 1', 'Tegucigalpa', 2, 110, 2, '2022-07-19 22:32:06', '2022-07-19 16:32:06', '14.051166', '-87.218651'),
(2, 'Bodega 2', 'Comayagua', 2, 110, 4, '2022-07-19 22:32:11', '2022-07-19 16:32:11', '14.390777', '-87.617484'),
(3, 'BODEGA CENTRAL 2', 'COLONIA GODOY', 1, 110, 5, '2022-07-15 15:58:47', '2022-07-15 15:58:47', NULL, NULL),
(4, 'ANEXO 1', 'COLONIA GODOY', 1, 110, 5, '2022-07-19 16:33:18', '2022-07-19 16:33:18', NULL, NULL),
(5, 'ANEXO 2', 'COLONIA GODOY', 1, 110, 5, '2022-07-19 22:35:47', '2022-07-19 16:35:47', NULL, NULL),
(6, 'ANEXO 3', 'COLONIA GODOY', 1, 110, 5, '2022-07-19 16:34:18', '2022-07-19 16:34:18', NULL, NULL),
(7, 'ANEXO 4', 'COLONIA GODOY', 1, 110, 5, '2022-07-19 16:34:48', '2022-07-19 16:34:48', NULL, NULL),
(8, 'ANEXO 5', 'COLONIA GODOY', 1, 110, 5, '2022-07-19 16:35:20', '2022-07-19 16:35:20', NULL, NULL),
(9, 'CENTRAL 3', 'COLONIA GODOY', 1, 110, 5, '2022-07-19 16:36:45', '2022-07-19 16:36:45', NULL, NULL),
(10, 'ANEXO 10 (ALCA)', 'COMAYAGUA', 1, 110, 5, '2022-07-19 16:37:43', '2022-07-19 16:37:43', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cai`
--

CREATE TABLE `cai` (
  `id` int(11) NOT NULL,
  `cai` varchar(37) NOT NULL,
  `punto_de_emision` varchar(45) NOT NULL,
  `cantidad_solicitada` int(11) NOT NULL,
  `cantidad_otorgada` int(11) NOT NULL,
  `numero_actual` int(11) NOT NULL,
  `serie` int(11) NOT NULL,
  `cantidad_no_utilizada` int(11) NOT NULL,
  `numero_inicial` varchar(19) NOT NULL,
  `numero_final` varchar(19) NOT NULL,
  `numero_base` varchar(19) NOT NULL,
  `fecha_limite_emision` date NOT NULL,
  `tipo_documento_fiscal_id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cai`
--

INSERT INTO `cai` (`id`, `cai`, `punto_de_emision`, `cantidad_solicitada`, `cantidad_otorgada`, `numero_actual`, `serie`, `cantidad_no_utilizada`, `numero_inicial`, `numero_final`, `numero_base`, `fecha_limite_emision`, `tipo_documento_fiscal_id`, `estado_id`, `users_id`, `created_at`, `updated_at`) VALUES
(1, '000-001-01-00000001', 'INVERCIONES VALENCIA', 5000, 5000, 19, 14, 4982, '000-001-01-00000001', '000-001-01-00005000', '000-001-01', '2022-09-24', 1, 1, 2, '2022-07-20 16:17:08', '2022-07-22 23:18:50'),
(2, '6ED2D4-868337-6741A2-EB18BA-A8FE57-37', 'INVERCIONES VALENCIA', 24, 24, 1, 1, 23, '000-001-05-00000651', '000-001-05-00000675', '000-001-05', '2022-09-11', 2, 1, 4, '2022-06-08 01:26:28', '2022-07-01 23:17:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Mayorista Nacional ', '2022-03-15 00:53:07', '2022-03-15 00:53:07'),
(2, 'Mayorista Inscrito                 ', '2022-03-15 00:53:07', '2022-03-15 00:53:07'),
(3, 'Exportador', '2022-03-15 00:53:21', '2022-03-15 00:53:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_producto`
--

CREATE TABLE `categoria_producto` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria_producto`
--

INSERT INTO `categoria_producto` (`id`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Oficina', '2022-03-24 01:06:03', NULL),
(2, 'Hogar', '2022-03-24 01:06:03', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `direccion` text NOT NULL,
  `telefono_empresa` varchar(15) NOT NULL,
  `rtn` varchar(14) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `latitud` varchar(45) DEFAULT NULL,
  `longitud` varchar(45) DEFAULT NULL,
  `url_imagen` varchar(250) DEFAULT NULL,
  `credito` double NOT NULL,
  `dias_credito` int(11) NOT NULL,
  `tipo_cliente_id` int(11) NOT NULL,
  `tipo_personalidad_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `vendedor` bigint(20) UNSIGNED NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `estado_cliente_id` int(11) NOT NULL,
  `municipio_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `direccion`, `telefono_empresa`, `rtn`, `correo`, `latitud`, `longitud`, `url_imagen`, `credito`, `dias_credito`, `tipo_cliente_id`, `tipo_personalidad_id`, `categoria_id`, `vendedor`, `users_id`, `estado_cliente_id`, `municipio_id`, `created_at`, `updated_at`) VALUES
(1, 'Cliente Generico', 'Honduras', '222222', '00000000000000', 'email@email.com', NULL, NULL, NULL, 100000, 0, 1, 1, 1, 4, 3, 1, 110, '2022-06-06 20:31:04', '2022-07-13 00:23:38'),
(4, 'Corte suprema', 'Frente a cascadas mall, col miraflores', '22778855', '08011990123455', 'email@gmail.com', '', '', 'IMG_1652994899.jpg', 8787.5, 20, 2, 2, 2, 4, 3, 1, 110, '2022-05-19 17:29:45', '2022-07-14 05:07:47'),
(5, 'Maximax', 'comayaguela', '22445588', '08011990123455', 'maxi@email.com', NULL, NULL, 'IMG_1654574745.png', 46377.5, 15, 1, 2, 1, 4, 3, 1, 110, '2022-05-24 23:14:04', '2022-07-14 05:59:55'),
(6, 'Gobernacion', 'boulevard Juan pablo II, Tegucigalpa', '222335588', '08011969123456', 'gobernacion@email.hn', NULL, NULL, 'IMG_1656729251.png', 100000, 25, 2, 2, 2, 4, 3, 1, 110, '2022-07-02 02:34:11', '2022-07-02 02:34:11'),
(7, 'Secretaria de Seguridad', 'Salida a lepaterique', '22235566', '08011969123456', 'seguridad@email.hn', NULL, NULL, 'IMG_1656729847.png', 50000, 15, 2, 2, 2, 4, 3, 1, 110, '2022-07-02 02:44:07', '2022-07-02 02:44:07'),
(8, 'Papeleria Millenuim', 'Matro Mall, Cuarto Nivel, local 25', '22556688', '08011995884566', 'email@gmail.com', '', '', 'IMG_1656975938.jpg', 25000, 5, 1, 1, 1, 4, 3, 1, 110, '2022-07-04 23:05:38', '2022-07-11 20:31:51'),
(9, 'Solaris', 'Centro de tegucigalpa', '22558877', '08011990123456', 'email@gmail.com', '', '', NULL, 19344.5, 20, 1, 1, 1, 4, 3, 1, 110, '2022-07-06 00:41:43', '2022-07-14 04:41:06'),
(10, 'SuperMax', 'Comayaguela.', '22557788', '08011990123456', 'email@gmail.com', '', '', NULL, 27247.25, 60, 1, 1, 1, 4, 3, 1, 110, '2022-07-11 20:33:23', '2022-07-14 04:45:36'),
(11, 'PRODUCT DEPOT S. DE R.L', '18 Y19 AVE 8 CALLE BARRIO RIO PIEDRAS, SAN PEDRO SULA CORTES', '25523888', '05019018030969', 'dvalenciahonduras@yahoo.com', NULL, NULL, NULL, 5000, 30, 1, 2, 1, 4, 5, 1, 110, '2022-07-20 09:45:03', '2022-07-20 09:45:03'),
(12, 'SEGUROS DEL PAIS S.A.', 'SPS BOULEVARD MEDINA * AVENIDA,7 CALLE', '25662020', '05019002064060', 'dvalenciahonduras@yahoo.com', '', '', NULL, 692.25, 30, 2, 2, 2, 4, 5, 1, 110, '2022-07-20 16:17:08', '2022-07-20 10:17:08'),
(13, 'Prueba de cliente', 'Prueba', '22446688', '08011990123455', 'email@email.com', NULL, NULL, NULL, 50000, 30, 1, 1, 1, 4, 3, 1, 110, '2022-07-23 04:13:53', '2022-07-23 04:13:53'),
(14, 'Melo s', 'Tegucigalpa', '55885566', '08011990123459', 'email@gmail.com', '', '', 'IMG_1659127570.png', 25000.5, 60, 1, 1, 1, 6, 3, 1, 110, '2022-07-29 20:46:10', '2022-07-29 21:18:17'),
(15, 'Pelo s', 'Tegucigalpa', '89282144', '08011990123455', 'email@gmail.com', '', '', NULL, 1200, 60, 1, 1, 1, 4, 3, 1, 110, '2022-07-29 21:16:07', '2022-07-29 21:19:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigo_exoneracion`
--

CREATE TABLE `codigo_exoneracion` (
  `id` int(11) NOT NULL,
  `codigo` varchar(45) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id` int(11) NOT NULL,
  `cai_retencion` varchar(45) DEFAULT NULL,
  `numero_secuencia_retencion` int(11) DEFAULT NULL,
  `numero_factura` varchar(90) NOT NULL,
  `codigo_cai` varchar(45) NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `fecha_emision` date NOT NULL DEFAULT '2022-04-21',
  `fecha_recepcion` date NOT NULL DEFAULT '2022-04-21',
  `isv_compra` double NOT NULL,
  `sub_total` double NOT NULL,
  `total` double NOT NULL,
  `debito` double NOT NULL,
  `cai_id` int(11) DEFAULT NULL,
  `proveedores_id` int(11) NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `tipo_compra_id` int(11) NOT NULL,
  `estado_compra_id` int(11) NOT NULL,
  `numero_orden` varchar(45) NOT NULL,
  `monto_retencion` double NOT NULL,
  `retenciones_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`id`, `cai_retencion`, `numero_secuencia_retencion`, `numero_factura`, `codigo_cai`, `fecha_vencimiento`, `fecha_emision`, `fecha_recepcion`, `isv_compra`, `sub_total`, `total`, `debito`, `cai_id`, `proveedores_id`, `users_id`, `tipo_compra_id`, `estado_compra_id`, `numero_orden`, `monto_retencion`, `retenciones_id`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, '1', '1', '2022-07-30', '2022-07-13', '2022-07-14', 16672.5, 111150, 127822.5, 127822.5, NULL, 1, 3, 1, 1, '2022-1', 0, 2, '2022-07-14 05:06:03', '2022-07-14 05:06:03'),
(2, NULL, NULL, '\'000-002-01-00002527', 'BDD755-FBD694-6C4398-2042A1-41C3E7-3D', '2022-08-15', '2022-07-15', '2022-07-15', 231, 1540, 1771, 1771, NULL, 1, 5, 1, 1, '2022-2', 0, 2, '2022-07-15 14:27:51', '2022-07-15 14:27:51'),
(3, NULL, NULL, '001-001-01-00021316', '85433B-842F54-C449A7-95E3AE-EE0BF4-66', '2022-07-15', '2022-07-15', '2022-07-15', 344.35, 2295.65, 2640, 2640, NULL, 12, 5, 2, 1, '2022-3', 0, 2, '2022-07-15 15:38:42', '2022-07-15 15:38:42'),
(4, NULL, NULL, '19072022', '12345678910', '2022-07-19', '2022-07-19', '2022-07-19', 186.81, 1245.49, 1432.31, 1432.31, NULL, 13, 5, 2, 1, '2022-4', 0, 2, '2022-07-19 16:06:14', '2022-07-19 16:06:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_has_producto`
--

CREATE TABLE `compra_has_producto` (
  `compra_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `precio_unidad` double NOT NULL,
  `cantidad_ingresada` int(11) NOT NULL,
  `cantidad_sin_asignar` int(11) DEFAULT NULL,
  `fecha_expiracion` date DEFAULT NULL,
  `sub_total_producto` double NOT NULL,
  `isv` double NOT NULL,
  `precio_total` double NOT NULL,
  `cantidad_disponible` int(11) NOT NULL,
  `unidad_compra_id` int(11) NOT NULL,
  `unidades_compra` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compra_has_producto`
--

INSERT INTO `compra_has_producto` (`compra_id`, `producto_id`, `precio_unidad`, `cantidad_ingresada`, `cantidad_sin_asignar`, `fecha_expiracion`, `sub_total_producto`, `isv`, `precio_total`, `cantidad_disponible`, `unidad_compra_id`, `unidades_compra`, `updated_at`, `created_at`) VALUES
(1, 1, 100, 100, 0, NULL, 100000, 15000, 115000, 100, 11, 10, '2022-07-14 05:06:03', '2022-07-14 05:06:03'),
(1, 4, 5, 1000, 0, NULL, 5000, 750, 5750, 1000, 1, 1, '2022-07-14 05:06:03', '2022-07-14 05:06:03'),
(1, 12, 6.15, 20, 0, NULL, 6150, 922.5, 7072.5, 20, 11, 50, '2022-07-14 05:06:03', '2022-07-14 05:06:03'),
(2, 16, 220, 7, 0, '2022-06-15', 1540, 231, 1771, 7, 12, 1, '2022-07-15 14:27:51', '2022-07-15 14:27:51'),
(3, 17, 7.971, 6, 0, NULL, 2295.65, 344.35, 2640, 6, 7, 48, '2022-07-15 15:38:42', '2022-07-15 15:38:42'),
(4, 18, 1, 1, 0, '2022-07-19', 1, 0.15, 1.15, 1, 3, 1, '2022-07-19 16:06:14', '2022-07-19 16:06:14'),
(4, 19, 1, 13, 0, '2022-07-19', 13, 1.95, 14.95, 13, 3, 1, '2022-07-19 16:06:14', '2022-07-19 16:06:14'),
(4, 20, 0.01, 101, 0, '2022-07-19', 1.01, 0.15, 1.16, 101, 3, 1, '2022-07-19 16:06:14', '2022-07-19 16:06:14'),
(4, 21, 0.01, 2700, 0, '2022-07-19', 27, 4.05, 31.05, 2700, 3, 1, '2022-07-19 16:06:14', '2022-07-19 16:06:14'),
(4, 22, 0.01, 10327, 0, '2022-07-19', 103.27, 15.49, 118.76, 10327, 3, 1, '2022-07-19 16:06:14', '2022-07-19 16:06:14'),
(4, 23, 0.01, 3002, 0, '2022-07-19', 30.02, 4.5, 34.52, 3002, 3, 1, '2022-07-19 16:06:14', '2022-07-19 16:06:14'),
(4, 24, 1, 60, 0, '2022-07-19', 60, 9, 69, 60, 3, 1, '2022-07-19 16:06:14', '2022-07-19 16:06:14'),
(4, 25, 0.01, 1230, 0, '2022-07-19', 12.3, 1.84, 14.15, 1230, 3, 1, '2022-07-19 16:06:14', '2022-07-19 16:06:14'),
(4, 26, 0.01, 5889, 0, '2022-07-19', 58.89, 8.83, 67.72, 5889, 3, 1, '2022-07-19 16:06:14', '2022-07-19 16:06:14'),
(4, 27, 1, 67, 0, '2022-07-19', 67, 10.05, 77.05, 67, 3, 1, '2022-07-19 16:06:14', '2022-07-19 16:06:14'),
(4, 28, 0.01, 311, 0, '2022-07-19', 3.11, 0.47, 3.58, 311, 3, 1, '2022-07-19 16:06:14', '2022-07-19 16:06:14'),
(4, 29, 0.01, 4490, 0, '2022-07-19', 44.9, 6.73, 51.63, 4490, 3, 1, '2022-07-19 16:06:14', '2022-07-19 16:06:14'),
(4, 30, 0.01, 52031, 0, '2022-07-19', 520.31, 78.05, 598.36, 52031, 3, 1, '2022-07-19 16:06:14', '2022-07-19 16:06:14'),
(4, 31, 0.01, 4769, 0, '2022-07-19', 47.69, 7.15, 54.84, 4769, 3, 1, '2022-07-19 16:06:14', '2022-07-19 16:06:14'),
(4, 32, 0.01, 2346, 0, '2022-07-19', 23.46, 3.52, 26.98, 2346, 3, 1, '2022-07-19 16:06:14', '2022-07-19 16:06:14'),
(4, 33, 0.01, 517, 0, '2022-07-19', 5.17, 0.78, 5.95, 517, 3, 1, '2022-07-19 16:06:14', '2022-07-19 16:06:14'),
(4, 34, 0.01, 953, 0, '2022-07-19', 9.53, 1.43, 10.96, 953, 4, 1, '2022-07-19 16:06:14', '2022-07-19 16:06:14'),
(4, 35, 0.01, 21783, 0, '2022-07-19', 217.83, 32.67, 250.5, 21783, 4, 1, '2022-07-19 16:06:14', '2022-07-19 16:06:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE `contacto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `contacto`
--

INSERT INTO `contacto` (`id`, `nombre`, `telefono`, `cliente_id`, `estado_id`, `created_at`, `updated_at`) VALUES
(1, 'Pedro Chata', '88557799', 4, 2, '2022-05-19 17:29:45', '2022-07-14 04:38:32'),
(2, 'Pedro Chata', '88557799', 4, 2, '2022-05-19 19:18:00', '2022-07-14 04:38:32'),
(3, '', '', 4, 2, '2022-05-19 19:18:00', '2022-07-14 04:38:32'),
(4, 'Pedro Chata', '88557799', 4, 2, '2022-05-19 19:18:25', '2022-07-14 04:38:32'),
(5, 'Carlos Menchaca', '97885566', 4, 2, '2022-05-19 19:18:25', '2022-07-14 04:38:32'),
(6, 'Pedro Chata', '88557799', 4, 2, '2022-05-19 19:23:32', '2022-07-14 04:38:32'),
(7, 'Carlos Menchaca', '97885566', 4, 2, '2022-05-19 19:23:32', '2022-07-14 04:38:32'),
(8, 'Pedro Chata', '88557799', 4, 2, '2022-05-19 19:23:47', '2022-07-14 04:38:32'),
(9, 'Carlos Menchaca', '97885566', 4, 2, '2022-05-19 19:23:47', '2022-07-14 04:38:32'),
(10, 'Pedro Chata', '88557799', 4, 2, '2022-05-19 19:23:56', '2022-07-14 04:38:32'),
(11, 'Carlos Menchaca', '97885566', 4, 2, '2022-05-19 19:23:56', '2022-07-14 04:38:32'),
(12, 'Pedro Chata', '88995566', 5, 1, '2022-05-24 23:14:04', '2022-05-24 23:14:04'),
(13, 'Julio aguilar', '88447722', 5, 1, '2022-05-24 23:14:04', '2022-05-24 23:14:04'),
(14, 'Pedro Chata', '88557799', 4, 2, '2022-06-20 19:36:05', '2022-07-14 04:38:32'),
(15, 'Carlos Menchaca', '97885566', 4, 2, '2022-06-20 19:36:05', '2022-07-14 04:38:32'),
(16, 'Pedro Chata', '22558877', 6, 1, '2022-07-02 02:34:11', '2022-07-02 02:34:11'),
(17, 'Julito aguilar', '22335577', 6, 1, '2022-07-02 02:34:11', '2022-07-02 02:34:11'),
(18, 'Pedro Chata', '99887755', 7, 1, '2022-07-02 02:44:07', '2022-07-02 02:44:07'),
(19, 'Julito aguilar', '88996655', 7, 1, '2022-07-02 02:44:07', '2022-07-02 02:44:07'),
(20, 'Juan Urquia', '88774455', 8, 2, '2022-07-04 23:05:38', '2022-07-11 20:31:51'),
(21, 'Julito aguilar', '88774455', 9, 2, '2022-07-06 00:41:43', '2022-07-14 03:42:09'),
(22, 'Pedro Chata', '99885544', 9, 2, '2022-07-06 00:41:43', '2022-07-14 03:42:09'),
(23, 'Julito aguilar', '88774455', 9, 2, '2022-07-11 20:29:06', '2022-07-14 03:42:09'),
(24, 'Pedro Chata', '99885544', 9, 2, '2022-07-11 20:29:06', '2022-07-14 03:42:09'),
(25, 'Julito aguilar', '88774455', 9, 2, '2022-07-11 20:29:21', '2022-07-14 03:42:09'),
(26, 'Pedro Chata', '99885544', 9, 2, '2022-07-11 20:29:21', '2022-07-14 03:42:09'),
(27, 'Julito aguilar', '88774455', 9, 2, '2022-07-11 20:29:36', '2022-07-14 03:42:09'),
(28, 'Pedro Chata', '99885544', 9, 2, '2022-07-11 20:29:36', '2022-07-14 03:42:09'),
(29, 'Juan Urquia', '88774455', 8, 1, '2022-07-11 20:31:51', '2022-07-11 20:31:51'),
(30, '', '', 8, 1, '2022-07-11 20:31:51', '2022-07-11 20:31:51'),
(31, 'Juan Urquia', '88557799', 10, 2, '2022-07-11 20:33:23', '2022-07-14 03:02:19'),
(32, 'Juan Urquia', '88557799', 10, 2, '2022-07-11 20:33:31', '2022-07-14 03:02:19'),
(33, '', '', 10, 2, '2022-07-11 20:33:31', '2022-07-14 03:02:19'),
(34, 'Juan Urquia', '88557799', 10, 2, '2022-07-13 00:22:50', '2022-07-14 03:02:19'),
(35, '', '', 10, 2, '2022-07-13 00:22:50', '2022-07-14 03:02:19'),
(36, 'Juan Urquia', '88557799', 10, 1, '2022-07-14 03:02:19', '2022-07-14 03:02:19'),
(37, '', '', 10, 1, '2022-07-14 03:02:19', '2022-07-14 03:02:19'),
(38, 'Julito aguilar', '88774455', 9, 1, '2022-07-14 03:42:09', '2022-07-14 03:42:09'),
(39, 'Pedro Chata', '99885544', 9, 1, '2022-07-14 03:42:09', '2022-07-14 03:42:09'),
(40, 'Pedro Chata', '88557799', 4, 1, '2022-07-14 04:38:32', '2022-07-14 04:38:32'),
(41, 'Carlos Menchaca', '97885566', 4, 1, '2022-07-14 04:38:32', '2022-07-14 04:38:32'),
(42, 'fgghhhh', '25523888', 11, 1, '2022-07-20 09:45:03', '2022-07-20 09:45:03'),
(43, 'GDGJJTEDSDJKKHGF', '25662020', 12, 2, '2022-07-20 16:13:50', '2022-07-20 10:13:50'),
(44, 'GJJKHGDD', '25662020', 12, 2, '2022-07-20 16:13:50', '2022-07-20 10:13:50'),
(45, 'GDGJJTEDSDJKKHGF', '25662020', 12, 1, '2022-07-20 10:13:50', '2022-07-20 10:13:50'),
(46, 'GJJKHGDD', '25662020', 12, 1, '2022-07-20 10:13:50', '2022-07-20 10:13:50'),
(47, 'Pedro Chata', '99664455', 13, 1, '2022-07-23 04:13:53', '2022-07-23 04:13:53'),
(48, 'Pedro Chata', '88557799', 14, 2, '2022-07-29 20:46:10', '2022-07-29 21:18:17'),
(49, 'Pedro Chata', '89282146', 15, 2, '2022-07-29 21:16:07', '2022-07-29 21:19:02'),
(50, 'Pedro Chata', '89282146', 15, 2, '2022-07-29 21:18:11', '2022-07-29 21:19:02'),
(51, '', '', 15, 2, '2022-07-29 21:18:11', '2022-07-29 21:19:02'),
(52, 'Pedro Chata', '88557799', 14, 1, '2022-07-29 21:18:17', '2022-07-29 21:18:17'),
(53, '', '', 14, 1, '2022-07-29 21:18:17', '2022-07-29 21:18:17'),
(54, 'Pedro Chata', '89282146', 15, 2, '2022-07-29 21:18:41', '2022-07-29 21:19:02'),
(55, '', '', 15, 2, '2022-07-29 21:18:41', '2022-07-29 21:19:02'),
(56, 'Pedro Chata', '89282146', 15, 2, '2022-07-29 21:18:52', '2022-07-29 21:19:02'),
(57, '', '', 15, 2, '2022-07-29 21:18:52', '2022-07-29 21:19:02'),
(58, 'Pedro Chata', '89282146', 15, 1, '2022-07-29 21:19:02', '2022-07-29 21:19:02'),
(59, '', '', 15, 1, '2022-07-29 21:19:02', '2022-07-29 21:19:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion`
--

CREATE TABLE `cotizacion` (
  `id` int(11) NOT NULL,
  `nombre_cliente` varchar(500) NOT NULL,
  `RTN` varchar(45) DEFAULT NULL,
  `fecha_emision` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `sub_total` double NOT NULL,
  `isv` double NOT NULL,
  `total` double NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `tipo_venta_id` int(11) NOT NULL,
  `vendedor` int(11) DEFAULT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `arregloIdInputs` text NOT NULL,
  `numeroInputs` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cotizacion`
--

INSERT INTO `cotizacion` (`id`, `nombre_cliente`, `RTN`, `fecha_emision`, `fecha_vencimiento`, `sub_total`, `isv`, `total`, `cliente_id`, `tipo_venta_id`, `vendedor`, `users_id`, `arregloIdInputs`, `numeroInputs`, `created_at`, `updated_at`) VALUES
(1, 'Maximax', '08011990123455', '2022-07-22', '2022-07-22', 1250, 187.5, 1437.5, 5, 1, NULL, 3, '[\"1\"]', 1, '2022-07-23 02:37:23', '2022-07-23 02:37:23'),
(3, 'Maximax', '08011990123455', '2022-07-25', '2022-07-25', 3680, 552, 4232, 5, 1, NULL, 3, '[\"1\",\"2\"]', 2, '2022-07-25 16:34:09', '2022-07-25 16:34:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion_has_producto`
--

CREATE TABLE `cotizacion_has_producto` (
  `cotizacion_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `nombre_producto` varchar(200) NOT NULL,
  `nombre_bodega` varchar(45) NOT NULL,
  `precio_unidad` double NOT NULL,
  `cantidad` int(11) NOT NULL,
  `sub_total` double NOT NULL,
  `isv` double NOT NULL,
  `total` double NOT NULL,
  `bodega_id` int(11) NOT NULL,
  `seccion_id` int(11) NOT NULL,
  `resta_inventario` int(11) NOT NULL,
  `isv_producto` double NOT NULL,
  `unidad_medida_venta_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cotizacion_has_producto`
--

INSERT INTO `cotizacion_has_producto` (`cotizacion_id`, `producto_id`, `nombre_producto`, `nombre_bodega`, `precio_unidad`, `cantidad`, `sub_total`, `isv`, `total`, `bodega_id`, `seccion_id`, `resta_inventario`, `isv_producto`, `unidad_medida_venta_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Papel bond carta blanco - 111', 'Bodega 1 A1', 125, 10, 1250, 187.5, 1437.5, 1, 1, 10, 15, 2, '2022-07-23 02:37:23', '2022-07-23 02:37:23'),
(3, 1, 'Papel bond carta blanco - 111', 'Bodega 1 A1', 115, 10, 1150, 172.5, 1322.5, 1, 1, 10, 15, 2, '2022-07-25 16:34:09', '2022-07-25 16:34:09'),
(3, 16, 'TINTA PARA IMPRESORA T664 70ML EPSON - 244444558825', 'Bodega 1 A1', 253, 10, 2530, 379.5, 2909.5, 1, 1, 10, 15, 17, '2022-07-25 16:34:09', '2022-07-25 16:34:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pais_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id`, `nombre`, `created_at`, `updated_at`, `pais_id`) VALUES
(1, 'ATLÁNTIDA', '2021-01-11 10:56:47', NULL, 1),
(2, 'COLÓN', '2021-01-11 10:56:55', NULL, 1),
(3, 'COMAYAGUA', '2021-01-11 09:57:53', NULL, 1),
(4, 'COPÁN', '2021-01-11 10:57:06', NULL, 1),
(5, 'CORTÉS', '2021-01-11 10:57:16', NULL, 1),
(6, 'CHOLUTECA', '2021-01-11 09:57:53', NULL, 1),
(7, 'EL PARAÍSO', '2021-01-11 10:57:34', NULL, 1),
(8, 'FRANCISCO MORAZÁN', '2021-01-11 10:57:47', NULL, 1),
(9, 'GRACIAS A DIOS', '2021-01-11 09:57:53', NULL, 1),
(10, 'INTIBUCÁ', '2021-01-11 10:58:01', NULL, 1),
(11, 'ISLAS DE LA BAHÍA', '2021-01-11 10:58:17', NULL, 1),
(12, 'LA PAZ', '2021-01-11 09:57:53', NULL, 1),
(13, 'LEMPIRA', '2021-01-11 09:57:53', NULL, 1),
(14, 'OCOTEPEQUE', '2021-01-11 09:57:53', NULL, 1),
(15, 'OLANCHO', '2021-01-11 09:57:53', NULL, 1),
(16, 'SANTA BÁRBARA', '2021-01-11 10:58:41', NULL, 1),
(17, 'VALLE', '2021-01-11 09:57:53', NULL, 1),
(18, 'YORO', '2021-01-11 09:57:53', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrega_programada`
--

CREATE TABLE `entrega_programada` (
  `id` int(11) NOT NULL,
  `fecha_entrega` date NOT NULL,
  `cantidad_entrega` int(11) NOT NULL,
  `cantidad_pendiente` int(11) NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `factura_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `lote` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enumeracion`
--

CREATE TABLE `enumeracion` (
  `id` int(11) NOT NULL,
  `numero` varchar(45) NOT NULL,
  `secuencia` int(11) NOT NULL,
  `numero_inicial` varchar(45) NOT NULL,
  `numero_final` varchar(45) NOT NULL,
  `cantidad_otorgada` varchar(45) NOT NULL,
  `cai_id` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `eliminado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `enumeracion`
--

INSERT INTO `enumeracion` (`id`, `numero`, `secuencia`, `numero_inicial`, `numero_final`, `cantidad_otorgada`, `cai_id`, `estado`, `created_at`, `updated_at`, `eliminado`) VALUES
(1, '000-001-01-00000002', 2, '000-001-01-00000001', '000-001-01-00005000', '5000', 1, 2, '2022-07-14 05:15:54', '2022-07-14 05:15:54', 1),
(2, '000-001-01-00000003', 3, '000-001-01-00000001', '000-001-01-00005000', '5000', 1, 1, '2022-07-14 05:16:54', '2022-07-14 05:16:54', 1),
(3, '000-001-01-00000004', 4, '000-001-01-00000001', '000-001-01-00005000', '5000', 1, 2, '2022-07-14 05:18:18', '2022-07-14 05:18:18', 1),
(4, '000-001-01-00000009', 9, '000-001-01-00000001', '000-001-01-00005000', '5000', 1, 2, '2022-07-14 05:44:41', '2022-07-14 05:44:41', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'activo', '2022-03-10 23:55:11', '2022-03-10 23:54:42'),
(2, 'inactivo', '2022-03-10 23:55:11', '2022-03-10 23:54:42'),
(3, 'pendiente de recibir', '2022-04-21 06:00:00', '2022-04-21 06:00:00'),
(4, 'recibido', '2022-04-21 06:00:00', '2022-04-21 06:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_cliente`
--

CREATE TABLE `estado_cliente` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado_cliente`
--

INSERT INTO `estado_cliente` (`id`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Activo', '2022-05-17 00:44:02', '2022-05-17 00:43:36'),
(2, 'Inactivo', '2022-05-17 00:44:02', '2022-05-17 00:43:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_compra`
--

CREATE TABLE `estado_compra` (
  `id` int(11) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado_compra`
--

INSERT INTO `estado_compra` (`id`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'activo', '2022-05-10 06:00:00', '2022-05-10 06:00:00'),
(2, 'anulado', '2022-05-10 06:00:00', '2022-05-10 06:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_factura`
--

CREATE TABLE `estado_factura` (
  `id` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL COMMENT '1 se presenta\n2 no se presenta',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado_factura`
--

INSERT INTO `estado_factura` (`id`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-05-23 20:45:12', '2022-05-23 20:44:47'),
(2, 0, '2022-05-23 20:45:12', '2022-05-23 20:44:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_producto`
--

CREATE TABLE `estado_producto` (
  `id` int(11) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado_producto`
--

INSERT INTO `estado_producto` (`id`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Activado', '2022-05-11 02:18:52', '2022-05-11 02:18:11'),
(2, 'Inactivo', '2022-05-11 02:18:52', '2022-05-11 02:18:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_venta`
--

CREATE TABLE `estado_venta` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado_venta`
--

INSERT INTO `estado_venta` (`id`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'activo', '2022-05-20 19:23:08', '2022-05-20 19:22:11'),
(2, 'anulado', '2022-05-20 19:23:08', '2022-05-20 19:22:11'),
(3, 'devolucion', '2022-05-20 19:23:08', '2022-05-20 19:22:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` int(11) NOT NULL,
  `numero_factura` varchar(45) NOT NULL,
  `cai` varchar(19) NOT NULL,
  `numero_secuencia_cai` int(11) NOT NULL,
  `nombre_cliente` varchar(500) NOT NULL,
  `rtn` varchar(45) DEFAULT NULL,
  `sub_total` double NOT NULL,
  `isv` double NOT NULL,
  `total` double NOT NULL,
  `pendiente_cobro` double NOT NULL,
  `credito` double NOT NULL,
  `dias_credito` int(11) NOT NULL,
  `fecha_emision` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `tipo_pago_id` int(11) NOT NULL,
  `cai_id` int(11) NOT NULL,
  `estado_venta_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `vendedor` bigint(20) UNSIGNED NOT NULL,
  `monto_comision` double NOT NULL,
  `codigo_exoneracion_id` int(11) DEFAULT NULL,
  `tipo_venta_id` int(11) NOT NULL,
  `estado_factura_id` int(11) NOT NULL,
  `comision_estado_pagado` tinyint(4) NOT NULL COMMENT '0: no hasido pagado al vendedor\n1: pagado al vendedor',
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id`, `numero_factura`, `cai`, `numero_secuencia_cai`, `nombre_cliente`, `rtn`, `sub_total`, `isv`, `total`, `pendiente_cobro`, `credito`, `dias_credito`, `fecha_emision`, `fecha_vencimiento`, `tipo_pago_id`, `cai_id`, `estado_venta_id`, `cliente_id`, `vendedor`, `monto_comision`, `codigo_exoneracion_id`, `tipo_venta_id`, `estado_factura_id`, `comision_estado_pagado`, `users_id`, `created_at`, `updated_at`) VALUES
(1, '2022-1', '000-001-01-00000001', 1, 'Corte suprema', '08011990123455', 4000, 600, 4600, 4600, 4600, 20, '2022-07-13', '2022-08-02', 2, 1, 1, 4, 3, 2300, 0, 2, 1, 0, 3, '2022-07-14 05:07:47', '2022-07-14 05:07:47'),
(2, '2022-2', '000-001-01-00000001', 1, 'SuperMax', '08011990123456', 140, 21, 161, 161, 161, 0, '2022-07-13', '2022-07-13', 1, 1, 1, 10, 3, 80.5, 0, 1, 2, 0, 3, '2022-07-14 05:13:20', '2022-07-14 05:13:20'),
(3, '2022-3', '000-001-01-00000002', 2, 'SuperMax', '08011990123456', 750, 112.5, 862.5, 862.5, 862.5, 0, '2022-07-13', '2022-07-13', 1, 1, 1, 10, 3, 431.25, 0, 1, 1, 0, 3, '2022-07-14 05:15:36', '2022-07-14 05:15:36'),
(4, '2022-4', '000-001-01-00000003', 3, 'SuperMax', '08011990123456', 350, 52.5, 402.5, 402.5, 402.5, 0, '2022-07-13', '2022-07-13', 1, 1, 1, 10, 3, 201.25, 0, 1, 2, 0, 3, '2022-07-14 05:15:54', '2022-07-14 05:15:54'),
(5, '2022-5', '000-001-01-00000004', 4, 'SuperMax', '08011990123456', 210, 31.5, 241.5, 241.5, 241.5, 0, '2022-07-13', '2022-07-13', 1, 1, 1, 10, 3, 120.75, 0, 1, 1, 0, 3, '2022-07-14 05:16:54', '2022-07-14 05:16:54'),
(6, '2022-6', '000-001-01-00000005', 5, 'SuperMax', '08011990123456', 280, 42, 322, 322, 322, 0, '2022-07-13', '2022-07-13', 1, 1, 1, 10, 3, 161, 0, 1, 2, 0, 3, '2022-07-14 05:18:18', '2022-07-14 05:18:18'),
(7, '2022-7', '000-001-01-00000005', 5, 'Secretaria de Seguridad', '08011969123456', 1170, 175.5, 1345.5, 1345.5, 1345.5, 0, '2022-07-13', '2022-07-13', 1, 1, 1, 7, 3, 672.75, 0, 2, 1, 0, 3, '2022-07-14 05:19:03', '2022-07-14 05:19:03'),
(8, '2022-8', '000-001-01-00000006', 6, 'Secretaria de Seguridad', '08011969123456', 700, 105, 805, 805, 805, 0, '2022-07-13', '2022-07-13', 1, 1, 1, 7, 3, 402.5, 0, 2, 1, 0, 3, '2022-07-14 05:19:29', '2022-07-14 05:19:29'),
(9, '2022-9', '000-001-01-00000007', 7, 'Corte suprema', '08011990123455', 350, 52.5, 402.5, 402.5, 402.5, 0, '2022-07-13', '2022-07-13', 1, 1, 2, 4, 3, 201.25, 0, 2, 1, 0, 3, '2022-07-14 05:19:55', '2022-07-22 17:43:43'),
(10, '2022-10', '000-001-01-00000008', 8, 'Maximax', '08011990123455', 200, 30, 230, 230, 230, 0, '2022-07-13', '2022-07-13', 1, 1, 1, 5, 3, 115, 0, 1, 1, 0, 3, '2022-07-14 05:37:04', '2022-07-14 05:37:04'),
(11, '2022-11', '000-001-01-00000006', 6, 'Papeleria Millenuim', '08011995884566', 750, 112.5, 862.5, 862.5, 862.5, 0, '2022-07-13', '2022-07-13', 1, 1, 1, 8, 3, 431.25, 0, 1, 2, 0, 3, '2022-07-14 05:38:04', '2022-07-14 05:38:04'),
(12, '2022-12', '000-001-01-00000007', 7, 'Papeleria Millenuim', '08011995884566', 216, 32.4, 248.4, 248.4, 248.4, 0, '2022-07-13', '2022-07-13', 1, 1, 1, 8, 3, 124.2, 0, 1, 2, 0, 3, '2022-07-14 05:40:11', '2022-07-14 05:40:11'),
(13, '2022-13', '000-001-01-00000008', 8, 'SuperMax', '08011990123456', 320, 48, 368, 368, 368, 0, '2022-07-13', '2022-07-13', 1, 1, 1, 10, 3, 184, 0, 1, 2, 0, 3, '2022-07-14 05:41:34', '2022-07-14 05:41:34'),
(14, '2022-14', '000-001-01-00000009', 9, 'Papeleria Millenuim', '08011995884566', 259, 38.85, 297.85, 297.85, 297.85, 0, '2022-07-13', '2022-07-13', 1, 1, 1, 8, 3, 148.925, 0, 1, 1, 0, 3, '2022-07-14 05:42:40', '2022-07-14 05:42:40'),
(15, '2022-15', '000-001-01-00000010', 10, 'Papeleria Millenuim', '08011995884566', 160, 24, 184, 184, 184, 0, '2022-07-13', '2022-07-13', 1, 1, 1, 8, 3, 92, 0, 1, 2, 0, 3, '2022-07-14 05:44:41', '2022-07-14 05:44:41'),
(16, '2022-16', '000-001-01-00000010', 10, 'Solaris', '08011990123456', 150, 22.5, 172.5, 172.5, 172.5, 0, '2022-07-13', '2022-07-13', 1, 1, 1, 9, 3, 86.25, 0, 1, 1, 0, 3, '2022-07-14 05:45:35', '2022-07-14 05:45:35'),
(17, '2022-17', '000-001-01-00000002', 2, 'Solaris', '08011990123456', 150, 22.5, 172.5, 172.5, 172.5, 0, '2022-07-13', '2022-07-13', 1, 1, 1, 9, 3, 86.25, 0, 1, 2, 0, 3, '2022-07-14 05:55:08', '2022-07-14 05:55:08'),
(18, '2022-18', '000-001-01-00000003', 3, 'Papeleria Millenuim', '08011995884566', 100, 15, 115, 115, 115, 0, '2022-07-13', '2022-07-13', 1, 1, 1, 8, 3, 57.5, 0, 1, 1, 0, 3, '2022-07-14 05:56:08', '2022-07-14 05:56:08'),
(19, '2022-19', '000-001-01-00000004', 4, 'Solaris', '08011990123456', 150, 22.5, 172.5, 172.5, 172.5, 0, '2022-07-13', '2022-07-13', 1, 1, 1, 9, 3, 86.25, 0, 1, 2, 0, 3, '2022-07-14 05:56:54', '2022-07-14 05:56:54'),
(20, '2022-20', '000-001-01-00000009', 9, 'Maximax', '08011990123455', 399, 59.85, 458.85, 458.85, 458.85, 0, '2022-07-13', '2022-07-13', 1, 1, 1, 5, 3, 229.425, 0, 1, 2, 0, 3, '2022-07-14 05:58:39', '2022-07-14 05:58:39'),
(21, '2022-21', '000-001-01-00000011', 11, 'Maximax', '08011990123455', 3000, 450, 3450, 3450, 3450, 15, '2022-07-13', '2022-07-28', 2, 1, 1, 5, 3, 1725, 0, 1, 2, 0, 3, '2022-07-14 05:59:55', '2022-07-14 05:59:55'),
(22, '2022-22', '000-001-01-00000011', 11, 'Papeleria Millenuim', '08011995884566', 70, 10.5, 80.5, 80.5, 80.5, 0, '2022-06-02', '2022-07-14', 1, 1, 2, 8, 3, 40.25, 0, 1, 1, 0, 3, '2022-07-14 06:50:47', '2022-07-22 20:01:12'),
(23, '2022-23', '000-001-01-00000012', 12, 'Pedro Mayorca', NULL, 450, 67.5, 517.5, 517.5, 517.5, 0, '2022-07-14', '2022-07-14', 1, 1, 2, 1, 3, 258.75, 0, 1, 2, 0, 3, '2022-07-14 06:51:40', '2022-07-22 19:37:08'),
(24, '2022-24', '000-001-01-00000012', 12, 'Solaris', '08011990123456', 224, 33.6, 257.6, 257.6, 257.6, 0, '2022-06-03', '2022-07-14', 1, 1, 2, 9, 3, 128.8, 0, 1, 1, 0, 3, '2022-07-14 06:52:21', '2022-07-22 19:21:31'),
(25, '2022-25', '000-001-01-00000013', 13, 'SuperMax', '08011990123456', 1180, 177, 1357, 1357, 1357, 0, '2022-07-14', '2022-07-14', 1, 1, 2, 10, 3, 678.5, 0, 1, 2, 0, 3, '2022-07-14 06:53:49', '2022-07-22 17:39:28'),
(26, '2022-26', '000-001-01-00000013', 13, 'Papeleria Millenuim', '08011995884566', 210, 31.5, 241.5, 241.5, 241.5, 0, '2022-06-07', '2022-07-14', 1, 1, 2, 8, 3, 120.75, 0, 1, 1, 0, 3, '2022-07-14 06:57:01', '2022-07-22 17:35:33'),
(27, '2022-27', '000-001-01-00000014', 14, 'SEGUROS DEL PAIS S.A.', '05019002064060', 25485, 3822.75, 29307.75, 29307.75, 29307.75, 30, '2022-07-20', '2022-08-18', 2, 1, 2, 12, 5, 14653.875, 0, 2, 1, 0, 5, '2022-07-20 10:17:08', '2022-07-22 16:56:45'),
(28, '2022-28', '000-001-01-00000015', 15, 'SEGUROS DEL PAIS S.A.', '05019002064060', 3000, 450, 3000, 3000, 3000, 0, '2022-07-20', '2022-07-20', 1, 1, 1, 12, 3, 1500, 0, 3, 1, 0, 3, '2022-07-20 17:02:25', '2022-07-20 17:02:25'),
(29, '2022-29', '000-001-01-00000016', 16, 'SEGUROS DEL PAIS S.A.', '05019002064060', 1660, 249, 1660, 1660, 1660, 0, '2022-07-20', '2022-07-20', 1, 1, 1, 12, 3, 830, 0, 3, 1, 0, 3, '2022-07-20 17:13:04', '2022-07-20 17:13:04'),
(30, '2022-30', '000-001-01-00000017', 17, 'SEGUROS DEL PAIS S.A.', '05019002064060', 250, 37.5, 250, 250, 250, 0, '2022-07-20', '2022-07-20', 1, 1, 2, 12, 3, 125, 0, 3, 1, 0, 3, '2022-07-20 17:17:16', '2022-07-22 17:50:49'),
(31, '2022-31', '000-001-01-00000014', 14, 'PRODUCT DEPOT S. DE R.L', '05019018030969', 6000, 900, 6900, 4900, 6900, 0, '2022-07-22', '2022-07-22', 1, 1, 1, 11, 3, 3450, 0, 1, 2, 0, 3, '2022-07-22 22:06:44', '2022-07-29 18:31:20'),
(32, '2022-32', '000-001-01-00000015', 15, 'PRODUCT DEPOT S. DE R.L', '05019018030969', 6000, 900, 6900, 6900, 6900, 0, '2022-07-22', '2022-07-22', 1, 1, 2, 11, 3, 3450, 0, 1, 2, 0, 3, '2022-07-22 22:08:42', '2022-07-22 22:10:04'),
(33, '2022-33', '000-001-01-00000016', 16, 'PRODUCT DEPOT S. DE R.L', '05019018030969', 10000, 1500, 11500, 11500, 11500, 0, '2022-07-22', '2022-07-22', 1, 1, 2, 11, 3, 5750, 0, 1, 2, 0, 3, '2022-07-22 22:23:14', '2022-07-22 22:29:36'),
(34, '2022-34', '000-001-01-00000018', 18, 'PRODUCT DEPOT S. DE R.L', '05019018030969', 4000, 600, 4000, 4000, 4000, 0, '2022-07-22', '2022-07-22', 1, 1, 1, 11, 3, 2000, 0, 3, 1, 0, 3, '2022-07-22 23:18:50', '2022-07-22 23:18:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `img_producto`
--

CREATE TABLE `img_producto` (
  `id` int(11) NOT NULL,
  `url_img` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `producto_id` int(11) NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `img_producto`
--

INSERT INTO `img_producto` (`id`, `url_img`, `created_at`, `updated_at`, `producto_id`, `users_id`) VALUES
(1, 'IMG_1653340298-0.jpg', '2022-05-23 21:11:38', NULL, 1, 3),
(2, 'IMG_1653509418-0.jpg', '2022-05-25 20:10:18', NULL, 4, 3),
(3, 'IMG_1654320735-1.jpg', '2022-06-04 05:32:15', NULL, 12, 3),
(4, 'IMG_1657665508-1.jpg', '2022-07-12 22:38:28', NULL, 13, 3),
(5, 'IMG_1657914832-1.jpg', '2022-07-15 13:53:52', NULL, 14, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencia`
--

CREATE TABLE `incidencia` (
  `id` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `url_img` varchar(250) DEFAULT NULL,
  `recibido_bodega_id` int(11) NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencia_compra`
--

CREATE TABLE `incidencia_compra` (
  `id` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `url_img` varchar(250) DEFAULT NULL,
  `compra_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `interes`
--

CREATE TABLE `interes` (
  `id` int(11) NOT NULL,
  `monto` double NOT NULL,
  `fecha` date NOT NULL,
  `estado_venta_id` int(11) NOT NULL,
  `factura_id` int(11) NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `fecha_anulado` date DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listado`
--

CREATE TABLE `listado` (
  `id` int(11) NOT NULL,
  `numero` varchar(45) NOT NULL,
  `secuencia` int(11) NOT NULL,
  `numero_inicial` varchar(45) NOT NULL,
  `numero_final` varchar(45) NOT NULL,
  `cantidad_otorgada` varchar(45) NOT NULL,
  `cai_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `eliminado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `listado`
--

INSERT INTO `listado` (`id`, `numero`, `secuencia`, `numero_inicial`, `numero_final`, `cantidad_otorgada`, `cai_id`, `created_at`, `updated_at`, `eliminado`) VALUES
(1, '000-001-01-00000001', 1, '000-001-01-00000001', '000-001-01-00005000', '5000', 1, '2022-07-14 05:07:47', '2022-07-14 05:07:47', 1),
(2, '000-001-01-00000005', 5, '000-001-01-00000001', '000-001-01-00005000', '5000', 1, '2022-07-14 05:19:03', '2022-07-14 05:19:03', 1),
(3, '000-001-01-00000006', 6, '000-001-01-00000001', '000-001-01-00005000', '5000', 1, '2022-07-14 05:19:29', '2022-07-14 05:19:29', 1),
(4, '000-001-01-00000007', 7, '000-001-01-00000001', '000-001-01-00005000', '5000', 1, '2022-07-14 05:19:55', '2022-07-14 05:19:55', 1),
(5, '000-001-01-00000014', 14, '000-001-01-00000001', '000-001-01-00005000', '5000', 1, '2022-07-20 10:17:08', '2022-07-20 10:17:08', 1),
(6, '000-001-01-00000015', 15, '000-001-01-00000001', '000-001-01-00005000', '5000', 1, '2022-07-20 17:02:25', '2022-07-20 17:02:25', 1),
(7, '000-001-01-00000016', 16, '000-001-01-00000001', '000-001-01-00005000', '5000', 1, '2022-07-20 17:13:04', '2022-07-20 17:13:04', 1),
(8, '000-001-01-00000017', 17, '000-001-01-00000001', '000-001-01-00005000', '5000', 1, '2022-07-20 17:17:16', '2022-07-20 17:17:16', 0),
(9, '000-001-01-00000018', 18, '000-001-01-00000001', '000-001-01-00005000', '5000', 1, '2022-07-22 23:18:50', '2022-07-22 23:18:50', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_credito`
--

CREATE TABLE `log_credito` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `monto` double NOT NULL,
  `users_id` int(11) DEFAULT NULL,
  `factura_id` int(11) DEFAULT NULL,
  `cliente_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `log_credito`
--

INSERT INTO `log_credito` (`id`, `descripcion`, `monto`, `users_id`, `factura_id`, `cliente_id`, `created_at`, `updated_at`) VALUES
(1, 'Reducción  de credito por factura.', 4600, 3, 1, 4, '2022-07-14 05:07:47', '2022-07-14 05:07:47'),
(2, 'Reducción  de credito por factura.', 3450, 3, 21, 5, '2022-07-14 05:59:55', '2022-07-14 05:59:55'),
(3, 'Reducción  de credito por factura.', 29307.75, 5, 27, 12, '2022-07-20 10:17:08', '2022-07-20 10:17:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_estado`
--

CREATE TABLE `log_estado` (
  `id` int(11) NOT NULL,
  `compra_id` int(11) NOT NULL,
  `estado_anterior_compra` int(11) NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_estado_factura`
--

CREATE TABLE `log_estado_factura` (
  `id` int(11) NOT NULL,
  `motivo` text NOT NULL,
  `factura_id` int(11) NOT NULL,
  `estado_venta_id_anterior` int(11) NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `log_estado_factura`
--

INSERT INTO `log_estado_factura` (`id`, `motivo`, `factura_id`, `estado_venta_id_anterior`, `users_id`, `created_at`, `updated_at`) VALUES
(1, 'Error Involuntario', 27, 1, 3, '2022-07-22 16:56:45', '2022-07-22 16:56:45'),
(2, 'Error Involuntario', 27, 2, 3, '2022-07-22 17:19:58', '2022-07-22 17:19:58'),
(3, 'Error Involuntario', 26, 1, 3, '2022-07-22 17:35:33', '2022-07-22 17:35:33'),
(4, 'Error Involuntario', 25, 1, 3, '2022-07-22 17:39:28', '2022-07-22 17:39:28'),
(5, 'Error Involuntario', 9, 1, 3, '2022-07-22 17:43:43', '2022-07-22 17:43:43'),
(6, 'Error Involuntario', 30, 1, 3, '2022-07-22 17:50:49', '2022-07-22 17:50:49'),
(7, 'Error Involuntario', 24, 1, 3, '2022-07-22 19:21:31', '2022-07-22 19:21:31'),
(8, 'Error Involuntario', 23, 1, 3, '2022-07-22 19:37:08', '2022-07-22 19:37:08'),
(9, 'Prueba de sistema, descriviendo motivo de anular factura', 22, 1, 3, '2022-07-22 20:01:12', '2022-07-22 20:01:12'),
(10, 'Devolucion de caja de papel', 32, 1, 3, '2022-07-22 22:10:04', '2022-07-22 22:10:04'),
(11, 'Probando anular factura, corrigiendo error de, unidades y cajas', 33, 1, 3, '2022-07-22 22:29:36', '2022-07-22 22:29:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_translado`
--

CREATE TABLE `log_translado` (
  `id` int(11) NOT NULL,
  `origen` int(11) NOT NULL,
  `destino` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL COMMENT 'la cantidad, realmente es el numero de unidades restadas o devueltas al inventario unidad base 1.',
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `factura_id` int(11) DEFAULT NULL,
  `ajuste_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `log_translado`
--

INSERT INTO `log_translado` (`id`, `origen`, `destino`, `cantidad`, `users_id`, `descripcion`, `factura_id`, `ajuste_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 2, 3, 'Venta de producto', 1, NULL, '2022-07-14 05:07:47', '2022-07-14 05:07:47'),
(2, 2, NULL, 20, 3, 'Venta de producto', 2, NULL, '2022-07-14 05:13:20', '2022-07-14 05:13:20'),
(3, 3, NULL, 50, 3, 'Venta de producto', 3, NULL, '2022-07-14 05:15:36', '2022-07-14 05:15:36'),
(4, 2, NULL, 50, 3, 'Venta de producto', 4, NULL, '2022-07-14 05:15:54', '2022-07-14 05:15:54'),
(5, 2, NULL, 30, 3, 'Venta de producto', 5, NULL, '2022-07-14 05:16:54', '2022-07-14 05:16:54'),
(6, 3, NULL, 20, 3, 'Venta de producto', 6, NULL, '2022-07-14 05:18:18', '2022-07-14 05:18:18'),
(7, 1, NULL, 10, 3, 'Venta de producto', 7, NULL, '2022-07-14 05:19:03', '2022-07-14 05:19:03'),
(8, 3, NULL, 50, 3, 'Venta de producto', 8, NULL, '2022-07-14 05:19:29', '2022-07-14 05:19:29'),
(9, 3, NULL, 25, 3, 'Venta de producto', 9, NULL, '2022-07-14 05:19:55', '2022-07-14 05:19:55'),
(10, 3, NULL, 20, 3, 'Venta de producto', 10, NULL, '2022-07-14 05:37:04', '2022-07-14 05:37:04'),
(11, 2, NULL, 50, 3, 'Venta de producto', 11, NULL, '2022-07-14 05:38:04', '2022-07-14 05:38:04'),
(12, 2, NULL, 36, 3, 'Venta de producto', 12, NULL, '2022-07-14 05:40:11', '2022-07-14 05:40:11'),
(13, 3, NULL, 20, 3, 'Venta de producto', 13, NULL, '2022-07-14 05:41:34', '2022-07-14 05:41:34'),
(14, 2, NULL, 37, 3, 'Venta de producto', 14, NULL, '2022-07-14 05:42:40', '2022-07-14 05:42:40'),
(15, 2, NULL, 20, 3, 'Venta de producto', 15, NULL, '2022-07-14 05:44:41', '2022-07-14 05:44:41'),
(16, 3, NULL, 15, 3, 'Venta de producto', 16, NULL, '2022-07-14 05:45:35', '2022-07-14 05:45:35'),
(17, 3, NULL, 10, 3, 'Venta de producto', 17, NULL, '2022-07-14 05:55:08', '2022-07-14 05:55:08'),
(18, 3, NULL, 10, 3, 'Venta de producto', 18, NULL, '2022-07-14 05:56:08', '2022-07-14 05:56:08'),
(19, 3, NULL, 10, 3, 'Venta de producto', 19, NULL, '2022-07-14 05:56:54', '2022-07-14 05:56:54'),
(20, 2, NULL, 57, 3, 'Venta de producto', 20, NULL, '2022-07-14 05:58:39', '2022-07-14 05:58:39'),
(21, 1, NULL, 20, 3, 'Venta de producto', 21, NULL, '2022-07-14 05:59:55', '2022-07-14 05:59:55'),
(22, 2, NULL, 10, 3, 'Venta de producto', 22, NULL, '2022-07-14 06:50:47', '2022-07-14 06:50:47'),
(23, 3, NULL, 30, 3, 'Venta de producto', 23, NULL, '2022-07-14 06:51:40', '2022-07-14 06:51:40'),
(24, 2, NULL, 32, 3, 'Venta de producto', 24, NULL, '2022-07-14 06:52:21', '2022-07-14 06:52:21'),
(25, 1, NULL, 10, 3, 'Venta de producto', 25, NULL, '2022-07-14 06:53:49', '2022-07-14 06:53:49'),
(26, 2, NULL, 30, 3, 'Venta de producto', 26, NULL, '2022-07-14 06:57:01', '2022-07-14 06:57:01'),
(27, 29, NULL, 250, 5, 'Venta de producto', 27, NULL, '2022-07-20 10:17:08', '2022-07-20 10:17:08'),
(28, 1, NULL, 20, 3, 'Venta de producto', 28, NULL, '2022-07-20 17:02:25', '2022-07-20 17:02:25'),
(29, 1, NULL, 10, 3, 'Venta de producto', 29, NULL, '2022-07-20 17:13:04', '2022-07-20 17:13:04'),
(30, 5, NULL, 10, 3, 'Venta de producto', 29, NULL, '2022-07-20 17:13:04', '2022-07-20 17:13:04'),
(31, 2, NULL, 25, 3, 'Venta de producto', 30, NULL, '2022-07-20 17:17:16', '2022-07-20 17:17:16'),
(32, 1, 36, 100, 3, 'Translado de bodega', NULL, NULL, '2022-07-20 20:10:27', '2022-07-20 20:10:27'),
(33, 29, 29, 250, 3, 'Factura Anulada', 27, NULL, '2022-07-22 16:56:45', '2022-07-22 16:56:45'),
(34, 29, 29, 250, 3, 'Factura Anulada', 27, NULL, '2022-07-22 17:19:58', '2022-07-22 17:19:58'),
(35, 2, 2, 30, 3, 'Factura Anulada', 26, NULL, '2022-07-22 17:35:33', '2022-07-22 17:35:33'),
(36, 1, 1, 10, 3, 'Factura Anulada', 25, NULL, '2022-07-22 17:39:28', '2022-07-22 17:39:28'),
(37, 3, 3, 25, 3, 'Factura Anulada', 9, NULL, '2022-07-22 17:43:43', '2022-07-22 17:43:43'),
(38, 2, 2, 25, 3, 'Factura Anulada', 30, NULL, '2022-07-22 17:50:49', '2022-07-22 17:50:49'),
(39, 2, 2, 32, 3, 'Factura Anulada', 24, NULL, '2022-07-22 19:21:31', '2022-07-22 19:21:31'),
(40, 3, 3, 30, 3, 'Factura Anulada', 23, NULL, '2022-07-22 19:37:08', '2022-07-22 19:37:08'),
(41, 2, 2, 10, 3, 'Factura Anulada', 22, NULL, '2022-07-22 20:01:12', '2022-07-22 20:01:12'),
(42, 1, NULL, 5, 3, 'Venta de producto', 31, NULL, '2022-07-22 22:06:44', '2022-07-22 22:06:44'),
(43, 1, NULL, 5, 3, 'Venta de producto', 32, NULL, '2022-07-22 22:08:42', '2022-07-22 22:08:42'),
(44, 1, 1, 5, 3, 'Factura Anulada', 32, NULL, '2022-07-22 22:10:04', '2022-07-22 22:10:04'),
(45, 1, NULL, 50, 3, 'Venta de producto', 33, NULL, '2022-07-22 22:23:14', '2022-07-22 22:23:14'),
(46, 1, 1, 50, 3, 'Factura Anulada', 33, NULL, '2022-07-22 22:29:36', '2022-07-22 22:29:36'),
(47, 1, NULL, 20, 3, 'Venta de producto', 34, NULL, '2022-07-22 23:18:50', '2022-07-22 23:18:50'),
(53, 1, NULL, 4, 3, 'Ajuste de tipo suma de unidades', NULL, 1, '2022-07-26 22:18:12', '2022-07-26 22:18:12'),
(54, 1, NULL, 5, 3, 'Ajuste de tipo suma de unidades', NULL, 2, '2022-07-28 17:32:29', '2022-07-28 17:32:29'),
(55, 2, NULL, 5, 3, 'Ajuste de tipo suma de unidades', NULL, 3, '2022-07-28 18:16:22', '2022-07-28 18:16:22'),
(56, 2, NULL, 5, 3, 'Ajuste de tipo resta de unidades', NULL, 4, '2022-07-28 18:17:36', '2022-07-28 18:17:36'),
(57, 1, NULL, 5, 3, 'Ajuste de tipo suma de unidades', NULL, 5, '2022-07-28 18:19:11', '2022-07-28 18:19:11'),
(58, 2, 37, 10, 3, 'Translado de bodega', NULL, NULL, '2022-07-28 19:58:46', '2022-07-28 19:58:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `url_img` varchar(45) DEFAULT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id`, `nombre`, `url_img`, `users_id`, `created_at`, `updated_at`) VALUES
(1, 'Marca 1', NULL, 3, '2022-05-23 06:00:00', '2022-05-23 06:00:00'),
(2, 'Marca 2', NULL, 2, '2022-05-24 06:00:00', '2022-05-24 06:00:00'),
(3, 'Marca 3', 'IMG_1657324939.jpg', 3, '2022-07-09 00:02:19', '2022-07-09 00:02:19'),
(4, 'Marca 4', 'IMG_1657346515.png', 3, '2022-07-09 00:02:35', '2022-07-09 06:02:41'),
(5, 'Marca 5', NULL, 3, '2022-07-12 00:04:52', '2022-07-12 00:04:52'),
(6, 'Marca 6', 'IMG_1657584308.jpg', 3, '2022-07-12 00:05:08', '2022-07-12 00:05:08'),
(7, 'Pointer', NULL, 5, '2022-07-15 13:52:05', '2022-07-15 13:52:05'),
(8, 'CAREZZA', NULL, 5, '2022-07-15 15:25:07', '2022-07-15 15:25:07'),
(9, 'PAPERLINE', NULL, 5, '2022-07-19 13:23:24', '2022-07-19 13:23:24'),
(10, 'ARTWORK', NULL, 5, '2022-07-19 13:23:56', '2022-07-19 13:23:56'),
(11, 'CHAMEX', NULL, 5, '2022-07-19 13:24:16', '2022-07-19 13:24:16'),
(12, 'ICOPY', NULL, 5, '2022-07-19 13:24:34', '2022-07-19 13:24:34'),
(13, 'CONCEPT PLUS', NULL, 5, '2022-07-19 13:25:15', '2022-07-19 13:25:15'),
(14, 'REPORT', NULL, 5, '2022-07-19 13:25:47', '2022-07-19 13:25:47'),
(15, 'WEX', NULL, 5, '2022-07-19 13:26:07', '2022-07-19 13:26:07'),
(16, 'SYSABE', NULL, 5, '2022-07-19 13:26:29', '2022-07-19 13:26:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `icon` varchar(45) NOT NULL,
  `nombre_menu` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rol_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motivo_nota_credito`
--

CREATE TABLE `motivo_nota_credito` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `departamento_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `municipio`
--

INSERT INTO `municipio` (`id`, `nombre`, `created_at`, `updated_at`, `departamento_id`) VALUES
(1, 'La Ceiba', '2021-01-11 10:08:15', NULL, 1),
(2, 'Tela', '2021-01-11 10:08:15', NULL, 1),
(3, 'Jutiapa', '2021-01-11 10:08:15', NULL, 1),
(4, 'La Masica', '2021-01-11 10:08:16', NULL, 1),
(5, 'San Francisco', '2021-01-11 10:08:16', NULL, 1),
(6, 'Arizona', '2021-01-11 10:08:16', NULL, 1),
(7, 'Esparta', '2021-01-11 10:08:16', NULL, 1),
(8, 'El Porvenir', '2021-01-11 10:08:16', NULL, 1),
(9, 'TRUJILLO', '2021-01-11 10:12:40', NULL, 2),
(10, 'BALFATE', '2021-01-11 10:12:40', NULL, 2),
(11, 'IRIONA', '2021-01-11 10:12:40', NULL, 2),
(12, 'LIMÓN', '2021-01-11 10:31:02', NULL, 2),
(13, 'SABÁ', '2021-01-11 10:31:36', NULL, 2),
(14, 'SANTA FE', '2021-01-11 10:12:40', NULL, 2),
(15, 'SANTA ROSA DE AGUÁN', '2021-01-11 10:12:40', NULL, 2),
(16, 'SONAGUERA', '2021-01-11 10:12:40', NULL, 2),
(17, 'TOCOA', '2021-01-11 10:12:41', NULL, 2),
(18, 'BONITO ORIENTAL', '2021-01-11 10:12:41', NULL, 2),
(19, 'COMAYAGUA', '2021-01-11 10:21:27', NULL, 3),
(20, 'AJUTERIQUE', '2021-01-11 10:21:27', NULL, 3),
(21, 'EL ROSARIO', '2021-01-11 10:21:27', NULL, 3),
(22, 'ESQUÍAS', '2021-01-11 10:21:27', NULL, 3),
(23, 'HUMUYA', '2021-01-11 10:21:27', NULL, 3),
(24, 'LA LIBERTAD', '2021-01-11 10:21:27', NULL, 3),
(25, 'LAMANÍ', '2021-01-11 10:21:27', NULL, 3),
(26, 'LA TRINIDAD', '2021-01-11 10:21:27', NULL, 3),
(27, 'LEJAMANI', '2021-01-11 10:21:27', NULL, 3),
(28, 'MEAMBAR', '2021-01-11 10:21:27', NULL, 3),
(29, 'MINAS DE ORO', '2021-01-11 10:21:27', NULL, 3),
(30, 'OJOS DE AGUA', '2021-01-11 10:21:27', NULL, 3),
(31, 'SAN JERÓNIMO (HONDURAS)', '2021-01-11 10:21:27', NULL, 3),
(32, 'SAN JOSÉ DE COMAYAGUA', '2021-01-11 10:21:27', NULL, 3),
(33, 'SAN JOSÉ DEL POTRERO', '2021-01-11 10:21:27', NULL, 3),
(34, 'SAN LUIS', '2021-01-11 10:21:27', NULL, 3),
(35, 'SAN SEBASTIÁN', '2021-01-11 10:21:27', NULL, 3),
(36, 'SIGUATEPEQUE', '2021-01-11 10:21:27', NULL, 3),
(37, 'VILLA DE SAN ANTONIO', '2021-01-11 10:21:27', NULL, 3),
(38, 'LAS LAJAS', '2021-01-11 10:21:27', NULL, 3),
(39, 'TAULABÉ', '2021-01-11 10:21:27', NULL, 3),
(40, 'SANTA ROSA DE COPÁN', '2021-01-11 10:24:20', NULL, 4),
(41, 'CABAÑAS', '2021-01-11 10:24:20', NULL, 4),
(42, 'CONCEPCIÓN', '2021-01-11 10:24:20', NULL, 4),
(43, 'COPÁN RUINAS', '2021-01-11 10:24:20', NULL, 4),
(44, 'CORQUÍN', '2021-01-11 10:24:20', NULL, 4),
(45, 'CUCUYAGUA', '2021-01-11 10:24:20', NULL, 4),
(46, 'DOLORES', '2021-01-11 10:24:21', NULL, 4),
(47, 'DULCE NOMBRE', '2021-01-11 10:24:21', NULL, 4),
(48, 'EL PARAÍSO', '2021-01-11 10:24:21', NULL, 4),
(49, 'FLORIDA', '2021-01-11 10:24:21', NULL, 4),
(50, 'LA JIGUA', '2021-01-11 10:24:21', NULL, 4),
(51, 'LA UNIÓN', '2021-01-11 10:24:21', NULL, 4),
(52, 'NUEVA ARCADIA', '2021-01-11 10:24:21', NULL, 4),
(53, 'SAN AGUSTÍN', '2021-01-11 10:24:21', NULL, 4),
(54, 'SAN ANTONIO', '2021-01-11 10:24:21', NULL, 4),
(55, 'SAN JERÓNIMO', '2021-01-11 10:24:21', NULL, 4),
(56, 'SAN JOSÉ', '2021-01-11 10:24:21', NULL, 4),
(57, 'SAN JUAN DE OPOA', '2021-01-11 10:24:21', NULL, 4),
(58, 'SAN NICOLÁS', '2021-01-11 10:24:21', NULL, 4),
(59, 'SAN PEDRO', '2021-01-11 10:24:21', NULL, 4),
(60, 'SANTA RITA', '2021-01-11 10:24:21', NULL, 4),
(61, 'TRINIDAD DE COPÁN', '2021-01-11 10:24:21', NULL, 4),
(62, 'VERACRUZ', '2021-01-11 10:24:21', NULL, 4),
(63, 'SAN PEDRO SULA', '2021-01-11 10:26:38', NULL, 5),
(64, 'CHOLOMA', '2021-01-11 10:26:38', NULL, 5),
(65, 'OMOA', '2021-01-11 10:26:38', NULL, 5),
(66, 'PIMIENTA', '2021-01-11 10:26:38', NULL, 5),
(67, 'POTRERILLOS', '2021-01-11 10:26:38', NULL, 5),
(68, 'PUERTO CORTÉS', '2021-01-11 10:26:38', NULL, 5),
(69, 'SAN ANTONIO DE CORTÉS', '2021-01-11 10:26:38', NULL, 5),
(70, 'SAN FRANCISCO DE YOJOA', '2021-01-11 10:26:38', NULL, 5),
(71, 'SAN MANUEL', '2021-01-11 10:26:38', NULL, 5),
(72, 'SANTA CRUZ DE YOJOA', '2021-01-11 10:26:38', NULL, 5),
(73, 'VILLANUEVA', '2021-01-11 10:26:38', NULL, 5),
(74, 'LA LIMA', '2021-01-11 10:26:38', NULL, 5),
(75, 'CHOLUTECA', '2021-01-11 10:29:31', NULL, 6),
(76, 'APACILAGUA', '2021-01-11 10:29:31', NULL, 6),
(77, 'CONCEPCIÓN DE MARÍA', '2021-01-11 10:29:31', NULL, 6),
(78, 'DUYURE', '2021-01-11 10:29:31', NULL, 6),
(79, 'EL CORPUS', '2021-01-11 10:29:31', NULL, 6),
(80, 'EL TRIUNFO', '2021-01-11 10:29:31', NULL, 6),
(81, 'MARCOVIA', '2021-01-11 10:29:32', NULL, 6),
(82, 'MOROLICA', '2021-01-11 10:29:32', NULL, 6),
(83, 'NAMASIGUE', '2021-01-11 10:29:32', NULL, 6),
(84, 'OROCUINA', '2021-01-11 10:29:32', NULL, 6),
(85, 'PESPIRE', '2021-01-11 10:29:32', NULL, 6),
(86, 'SAN ANTONIO DE FLORES', '2021-01-11 10:29:32', NULL, 6),
(87, 'SAN ISIDRO', '2021-01-11 10:29:32', NULL, 6),
(88, 'SAN JOSÉ', '2021-01-11 10:29:32', NULL, 6),
(89, 'SAN MARCOS DE COLÓN', '2021-01-11 10:29:32', NULL, 6),
(90, 'SANTA ANA DE YUSGUARE', '2021-01-11 10:29:32', NULL, 6),
(91, 'YUSCARÁN', '2021-01-11 10:35:04', NULL, 7),
(92, 'ALAUCA', '2021-01-11 10:35:04', NULL, 7),
(93, 'DANLÍ', '2021-01-11 10:35:04', NULL, 7),
(94, 'EL PARAÍSO', '2021-01-11 10:35:04', NULL, 7),
(95, 'GÜINOPE', '2021-01-11 10:35:04', NULL, 7),
(96, 'JACALEAPA', '2021-01-11 10:35:04', NULL, 7),
(97, 'LIURE', '2021-01-11 10:35:04', NULL, 7),
(98, 'MOROCELÍ', '2021-01-11 10:35:04', NULL, 7),
(99, 'OROPOLÍ', '2021-01-11 10:35:04', NULL, 7),
(100, 'POTRERILLOS', '2021-01-11 10:35:04', NULL, 7),
(101, 'SAN ANTONIO DE FLORES', '2021-01-11 10:35:04', NULL, 7),
(102, 'SAN LUCAS', '2021-01-11 10:35:04', NULL, 7),
(103, 'SAN MATÍAS', '2021-01-11 10:35:05', NULL, 7),
(104, 'SOLEDAD', '2021-01-11 10:35:05', NULL, 7),
(105, 'TEUPASENTI', '2021-01-11 10:35:05', NULL, 7),
(106, 'TEXIGUAT', '2021-01-11 10:35:05', NULL, 7),
(107, 'VADO ANCHO', '2021-01-11 10:35:05', NULL, 7),
(108, 'YAUYUPE', '2021-01-11 10:35:05', NULL, 7),
(109, 'TROJES', '2021-01-11 10:35:05', NULL, 7),
(110, 'DISTRITO CENTRAL', '2021-01-11 10:37:39', NULL, 8),
(111, 'ALUBARÉN', '2021-01-11 10:37:39', NULL, 8),
(112, 'CEDROS', '2021-01-11 10:37:39', NULL, 8),
(113, 'CURARÉN', '2021-01-11 10:37:39', NULL, 8),
(114, 'EL PORVENIR', '2021-01-11 10:37:39', NULL, 8),
(115, 'GUAIMACA', '2021-01-11 10:37:39', NULL, 8),
(116, 'LA LIBERTAD', '2021-01-11 10:37:39', NULL, 8),
(117, 'LA VENTA', '2021-01-11 10:37:39', NULL, 8),
(118, 'LEPATERIQUE', '2021-01-11 10:37:39', NULL, 8),
(119, 'MARAITA', '2021-01-11 10:37:39', NULL, 8),
(120, 'MARALE', '2021-01-11 10:37:39', NULL, 8),
(121, 'NUEVA ARMENIA', '2021-01-11 10:37:39', NULL, 8),
(122, 'OJOJONA', '2021-01-11 10:37:39', NULL, 8),
(123, 'ORICA', '2021-01-11 10:37:39', NULL, 8),
(124, 'REITOCA', '2021-01-11 10:37:39', NULL, 8),
(125, 'SABANAGRANDE', '2021-01-11 10:37:39', NULL, 8),
(126, 'SAN ANTONIO DE ORIENTE', '2021-01-11 10:37:39', NULL, 8),
(127, 'SAN BUENAVENTURA', '2021-01-11 10:37:39', NULL, 8),
(128, 'SAN IGNACIO', '2021-01-11 10:37:39', NULL, 8),
(129, 'SAN JUAN DE FLORES', '2021-01-11 10:37:39', NULL, 8),
(130, 'SAN MIGUELITO', '2021-01-11 10:37:39', NULL, 8),
(131, 'SANTA ANA', '2021-01-11 10:37:39', NULL, 8),
(132, 'SANTA LUCÍA', '2021-01-11 10:37:39', NULL, 8),
(133, 'TALANGA', '2021-01-11 10:37:39', NULL, 8),
(134, 'TATUMBLA', '2021-01-11 10:37:39', NULL, 8),
(135, 'VALLE DE ÁNGELES', '2021-01-11 10:37:39', NULL, 8),
(136, 'VILLA DE SAN FRANCISCO', '2021-01-11 10:37:39', NULL, 8),
(137, 'VALLECILLO', '2021-01-11 10:37:39', NULL, 8),
(138, 'PUERTO LEMPIRA', '2021-01-11 10:40:22', NULL, 9),
(139, 'BRUS LAGUNA', '2021-01-11 10:40:22', NULL, 9),
(140, 'AHUAS', '2021-01-11 10:40:22', NULL, 9),
(141, 'JUAN FRANCISCO BULNES', '2021-01-11 10:40:22', NULL, 9),
(142, 'RAMÓN VILLEDA MORALES', '2021-01-11 10:40:22', NULL, 9),
(143, 'WAMPUSIRPE', '2021-01-11 10:40:22', NULL, 9),
(144, 'LA ESPERANZA', '2021-01-11 10:42:37', NULL, 10),
(145, 'CAMASCA', '2021-01-11 10:42:37', NULL, 10),
(146, 'COLOMONCAGUA', '2021-01-11 10:42:37', NULL, 10),
(147, 'CONCEPCIÓN', '2021-01-11 10:42:37', NULL, 10),
(148, 'DOLORES', '2021-01-11 10:42:37', NULL, 10),
(149, 'INTIBUCÁ', '2021-01-11 10:42:37', NULL, 10),
(150, 'JESÚS DE OTORO', '2021-01-11 10:42:37', NULL, 10),
(151, 'MAGDALENA', '2021-01-11 10:42:37', NULL, 10),
(152, 'MASAGUARA', '2021-01-11 10:42:37', NULL, 10),
(153, 'SAN ANTONIO', '2021-01-11 10:42:37', NULL, 10),
(154, 'SAN ISIDRO', '2021-01-11 10:42:37', NULL, 10),
(155, 'SAN JUAN', '2021-01-11 10:42:37', NULL, 10),
(156, 'SAN MARCOS DE LA SIERRA', '2021-01-11 10:42:37', NULL, 10),
(157, 'SAN MIGUEL GUANCAPLA', '2021-01-11 10:42:37', NULL, 10),
(158, 'SANTA LUCÍA', '2021-01-11 10:42:37', NULL, 10),
(159, 'YAMARANGUILA', '2021-01-11 10:42:38', NULL, 10),
(160, 'SAN FRANCISCO DE OPALACA', '2021-01-11 10:42:38', NULL, 10),
(161, 'ROATÁN', '2021-01-11 10:43:50', NULL, 11),
(162, 'GUANAJA', '2021-01-11 10:43:50', NULL, 11),
(163, 'JOSÉ SANTOS GUARDIOLA', '2021-01-11 10:43:50', NULL, 11),
(164, 'UTILA', '2021-01-11 10:43:50', NULL, 11),
(165, 'LA PAZ', '2021-01-11 10:45:32', NULL, 12),
(166, 'AGUANQUETERIQUE', '2021-01-11 10:45:32', NULL, 12),
(167, 'CABAÑAS', '2021-01-11 10:45:32', NULL, 12),
(168, 'CANE', '2021-01-11 10:45:32', NULL, 12),
(169, 'CHINACLA', '2021-01-11 10:45:32', NULL, 12),
(170, 'GUAJIQUIRO', '2021-01-11 10:45:32', NULL, 12),
(171, 'LAUTERIQUE', '2021-01-11 10:45:32', NULL, 12),
(172, 'MARCALA', '2021-01-11 10:45:32', NULL, 12),
(173, 'MERCEDES DE ORIENTE', '2021-01-11 10:45:32', NULL, 12),
(174, 'OPATORO', '2021-01-11 10:45:32', NULL, 12),
(175, 'SAN ANTONIO DEL NORTE', '2021-01-11 10:45:32', NULL, 12),
(176, 'SAN JOSÉ', '2021-01-11 10:45:32', NULL, 12),
(177, 'SAN JUAN', '2021-01-11 10:45:32', NULL, 12),
(178, 'SAN PEDRO DE TUTULE', '2021-01-11 10:45:32', NULL, 12),
(179, 'SANTA ANA', '2021-01-11 10:45:33', NULL, 12),
(180, 'SANTA ELENA', '2021-01-11 10:45:33', NULL, 12),
(181, 'SANTA MARÍA', '2021-01-11 10:45:33', NULL, 12),
(182, 'SANTIAGO DE PURINGLA', '2021-01-11 10:45:33', NULL, 12),
(183, 'YARULA', '2021-01-11 10:45:33', NULL, 12),
(184, 'GRACIAS', '2021-01-11 10:47:09', NULL, 13),
(185, 'BELÉN', '2021-01-11 10:47:09', NULL, 13),
(186, 'CANDELARIA', '2021-01-11 10:47:09', NULL, 13),
(187, 'COLOLACA', '2021-01-11 10:47:09', NULL, 13),
(188, 'ERANDIQUE', '2021-01-11 10:47:10', NULL, 13),
(189, 'GUALCINCE', '2021-01-11 10:47:10', NULL, 13),
(190, 'GUARITA', '2021-01-11 10:47:10', NULL, 13),
(191, 'LA CAMPA', '2021-01-11 10:47:10', NULL, 13),
(192, 'LA IGUALA', '2021-01-11 10:47:10', NULL, 13),
(193, 'LAS FLORES', '2021-01-11 10:47:10', NULL, 13),
(194, 'LA UNIÓN', '2021-01-11 10:47:10', NULL, 13),
(195, 'LA VIRTUD', '2021-01-11 10:47:10', NULL, 13),
(196, 'LEPAERA', '2021-01-11 10:47:10', NULL, 13),
(197, 'MAPULACA', '2021-01-11 10:47:10', NULL, 13),
(198, 'PIRAERA', '2021-01-11 10:47:10', NULL, 13),
(199, 'SAN ANDRÉS', '2021-01-11 10:47:10', NULL, 13),
(200, 'SAN FRANCISCO', '2021-01-11 10:47:10', NULL, 13),
(201, 'SAN JUAN GUARITA', '2021-01-11 10:47:10', NULL, 13),
(202, 'SAN MANUEL COLOHETE', '2021-01-11 10:47:10', NULL, 13),
(203, 'SAN RAFAEL', '2021-01-11 10:47:10', NULL, 13),
(204, 'SAN SEBASTIÁN', '2021-01-11 10:47:10', NULL, 13),
(205, 'SANTA CRUZ', '2021-01-11 10:47:10', NULL, 13),
(206, 'TALGUA', '2021-01-11 10:47:10', NULL, 13),
(207, 'TAMBLA', '2021-01-11 10:47:10', NULL, 13),
(208, 'TOMALÁ', '2021-01-11 10:47:10', NULL, 13),
(209, 'VALLADOLID', '2021-01-11 10:47:10', NULL, 13),
(210, 'VIRGINIA', '2021-01-11 10:47:10', NULL, 13),
(211, 'SAN MARCOS DE CAIQUÍN', '2021-01-11 10:47:10', NULL, 13),
(212, 'OCOTEPEQUE', '2021-01-11 10:48:46', NULL, 14),
(213, 'BELÉN GUALCHO', '2021-01-11 10:48:46', NULL, 14),
(214, 'CONCEPCIÓN', '2021-01-11 10:48:46', NULL, 14),
(215, 'DOLORES MERENDÓN', '2021-01-11 10:48:46', NULL, 14),
(216, 'FRATERNIDAD', '2021-01-11 10:48:46', NULL, 14),
(217, 'LA ENCARNACIÓN', '2021-01-11 10:48:46', NULL, 14),
(218, 'LA LABOR', '2021-01-11 10:48:46', NULL, 14),
(219, 'LUCERNA', '2021-01-11 10:48:46', NULL, 14),
(220, 'MERCEDES', '2021-01-11 10:48:46', NULL, 14),
(221, 'SAN FERNANDO', '2021-01-11 10:48:46', NULL, 14),
(222, 'SAN FRANCISCO DEL VALLE', '2021-01-11 10:48:46', NULL, 14),
(223, 'SAN JORGE', '2021-01-11 10:48:46', NULL, 14),
(224, 'SAN MARCOS', '2021-01-11 10:48:46', NULL, 14),
(225, 'SANTA FE', '2021-01-11 10:48:46', NULL, 14),
(226, 'SENSENTI', '2021-01-11 10:48:46', NULL, 14),
(227, 'SINUAPA', '2021-01-11 10:48:46', NULL, 14),
(228, 'JUTICALPA', '2021-01-11 10:50:30', NULL, 15),
(229, 'CAMPAMENTO', '2021-01-11 10:50:30', NULL, 15),
(230, 'CATACAMAS', '2021-01-11 10:50:30', NULL, 15),
(231, 'CONCORDIA', '2021-01-11 10:50:30', NULL, 15),
(232, 'DULCE NOMBRE DE CULMÍ', '2021-01-11 10:50:30', NULL, 15),
(233, 'EL ROSARIO', '2021-01-11 10:50:30', NULL, 15),
(234, 'ESQUIPULAS DEL NORTE', '2021-01-11 10:50:30', NULL, 15),
(235, 'GUALACO', '2021-01-11 10:50:30', NULL, 15),
(236, 'GUARIZAMA', '2021-01-11 10:50:30', NULL, 15),
(237, 'GUATA', '2021-01-11 10:50:30', NULL, 15),
(238, 'GUAYAPE', '2021-01-11 10:50:30', NULL, 15),
(239, 'JANO', '2021-01-11 10:50:30', NULL, 15),
(240, 'LA UNIÓN', '2021-01-11 10:50:30', NULL, 15),
(241, 'MANGULILE', '2021-01-11 10:50:30', NULL, 15),
(242, 'MANTO', '2021-01-11 10:50:30', NULL, 15),
(243, 'SALAMÁ', '2021-01-11 10:50:30', NULL, 15),
(244, 'SAN ESTEBAN', '2021-01-11 10:50:30', NULL, 15),
(245, 'SAN FRANCISCO DE BECERRA', '2021-01-11 10:50:30', NULL, 15),
(246, 'SAN FRANCISCO DE LA PAZ', '2021-01-11 10:50:31', NULL, 15),
(247, 'SANTA MARÍA DEL REAL', '2021-01-11 10:50:31', NULL, 15),
(248, 'SILCA', '2021-01-11 10:50:31', NULL, 15),
(249, 'YOCÓN', '2021-01-11 10:50:31', NULL, 15),
(250, 'PATUCA', '2021-01-11 10:50:31', NULL, 15),
(251, 'SANTA BÁRBARA', '2021-01-11 10:53:10', NULL, 16),
(252, 'ARADA', '2021-01-11 10:53:10', NULL, 16),
(253, 'ATIMA', '2021-01-11 10:53:10', NULL, 16),
(254, 'AZACUALPA', '2021-01-11 10:53:10', NULL, 16),
(255, 'CEGUACA', '2021-01-11 10:53:10', NULL, 16),
(256, 'CONCEPCIÓN DEL NORTE', '2021-01-11 10:53:10', NULL, 16),
(257, 'CONCEPCIÓN DEL SUR', '2021-01-11 10:53:10', NULL, 16),
(258, 'CHINDA', '2021-01-11 10:53:10', NULL, 16),
(259, 'EL NÍSPERO', '2021-01-11 10:53:10', NULL, 16),
(260, 'GUALALA', '2021-01-11 10:53:10', NULL, 16),
(261, 'ILAMA', '2021-01-11 10:53:10', NULL, 16),
(262, 'LAS VEGAS', '2021-01-11 10:53:10', NULL, 16),
(263, 'MACUELIZO', '2021-01-11 10:53:10', NULL, 16),
(264, 'NARANJITO', '2021-01-11 10:53:10', NULL, 16),
(265, 'NUEVO CELILAC', '2021-01-11 10:53:11', NULL, 16),
(266, 'NUEVA FRONTERA', '2021-01-11 10:53:11', NULL, 16),
(267, 'PETOA', '2021-01-11 10:53:11', NULL, 16),
(268, 'PROTECCIÓN', '2021-01-11 10:53:11', NULL, 16),
(269, 'QUIMISTÁN', '2021-01-11 10:53:11', NULL, 16),
(270, 'SAN FRANCISCO DE OJUERA', '2021-01-11 10:53:11', NULL, 16),
(271, 'SAN JOSÉ DE LAS COLINAS', '2021-01-11 10:53:11', NULL, 16),
(272, 'SAN LUIS', '2021-01-11 10:53:11', NULL, 16),
(273, 'SAN MARCOS', '2021-01-11 10:53:11', NULL, 16),
(274, 'SAN NICOLÁS', '2021-01-11 10:53:11', NULL, 16),
(275, 'SAN PEDRO ZACAPA', '2021-01-11 10:53:11', NULL, 16),
(276, 'SAN VICENTE CENTENARIO', '2021-01-11 10:53:11', NULL, 16),
(277, 'SANTA RITA', '2021-01-11 10:53:11', NULL, 16),
(278, 'TRINIDAD', '2021-01-11 10:53:11', NULL, 16),
(279, 'NACAOME', '2021-01-11 10:54:24', NULL, 17),
(280, 'ALIANZA', '2021-01-11 10:54:24', NULL, 17),
(281, 'AMAPALA', '2021-01-11 10:54:24', NULL, 17),
(282, 'ARAMECINA', '2021-01-11 10:54:24', NULL, 17),
(283, 'CARIDAD', '2021-01-11 10:54:24', NULL, 17),
(284, 'GOASCORÁN', '2021-01-11 10:54:24', NULL, 17),
(285, 'LANGUE', '2021-01-11 10:54:24', NULL, 17),
(286, 'SAN FRANCISCO DE CORAY', '2021-01-11 10:54:24', NULL, 17),
(287, 'SAN LORENZO', '2021-01-11 10:54:24', NULL, 17),
(288, 'YORO', '2021-01-11 10:55:56', NULL, 18),
(289, 'ARENAL', '2021-01-11 10:55:56', NULL, 18),
(290, 'EL NEGRITO', '2021-01-11 10:55:56', NULL, 18),
(291, 'EL PROGRESO', '2021-01-11 10:55:56', NULL, 18),
(292, 'JOCÓN', '2021-01-11 10:55:56', NULL, 18),
(293, 'MORAZÁN', '2021-01-11 10:55:56', NULL, 18),
(294, 'OLANCHITO', '2021-01-11 10:55:56', NULL, 18),
(295, 'SANTA RITA', '2021-01-11 10:55:56', NULL, 18),
(296, 'SULACO', '2021-01-11 10:55:56', NULL, 18),
(297, 'VICTORIA', '2021-01-11 10:55:56', NULL, 18),
(298, 'YORITO', '2021-01-11 10:55:56', NULL, 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `numero_orden_compra`
--

CREATE TABLE `numero_orden_compra` (
  `id` int(11) NOT NULL,
  `numero_orden` varchar(45) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `numero_orden_compra`
--

INSERT INTO `numero_orden_compra` (`id`, `numero_orden`, `cliente_id`, `estado_id`, `users_id`, `created_at`, `updated_at`) VALUES
(1, '1', 4, 1, 3, '2022-07-29 20:54:53', '2022-07-29 20:54:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_compra`
--

CREATE TABLE `pago_compra` (
  `id` int(11) NOT NULL,
  `monto` double NOT NULL,
  `url_img` varchar(250) NOT NULL,
  `fecha` date NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `compra_id` int(11) NOT NULL,
  `users_id_elimina` bigint(20) UNSIGNED DEFAULT NULL,
  `fecha_eliminado` timestamp NULL DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_venta`
--

CREATE TABLE `pago_venta` (
  `id` int(11) NOT NULL,
  `monto` double NOT NULL,
  `url_img` varchar(45) NOT NULL,
  `fecha` date NOT NULL,
  `factura_id` int(11) NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `estado_venta_id` int(11) NOT NULL,
  `users_id_elimina` bigint(20) UNSIGNED DEFAULT NULL,
  `fecha_eliminado` date DEFAULT NULL,
  `banco_id` int(11) DEFAULT NULL,
  `tipo_pago_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pago_venta`
--

INSERT INTO `pago_venta` (`id`, `monto`, `url_img`, `fecha`, `factura_id`, `users_id`, `estado_venta_id`, `users_id_elimina`, `fecha_eliminado`, `banco_id`, `tipo_pago_id`, `created_at`, `updated_at`) VALUES
(1, 2000, 'IMG_1659119480-.jpg', '2022-07-29', 31, 3, 1, NULL, NULL, 2, 2, '2022-07-29 18:31:20', '2022-07-29 18:31:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Honduras', '2022-03-14 21:56:05', '2022-03-14 21:55:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametro`
--

CREATE TABLE `parametro` (
  `id` int(11) NOT NULL,
  `metodo` int(11) NOT NULL,
  `estado_encendido` tinyint(4) NOT NULL,
  `turno` int(11) NOT NULL,
  `igualdad` varchar(45) NOT NULL,
  `monto` double NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `parametro`
--

INSERT INTO `parametro` (`id`, `metodo`, `estado_encendido`, `turno`, `igualdad`, `monto`, `users_id`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 2, '>', 1000, 2, '2022-06-15 21:05:41', '2022-07-14 06:57:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precios_venta`
--

CREATE TABLE `precios_venta` (
  `id` int(11) NOT NULL,
  `precio` double NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `producto_id` int(11) NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `isv` int(11) NOT NULL,
  `precio_base` double NOT NULL,
  `ultimo_costo_compra` double NOT NULL,
  `costo_promedio` double NOT NULL,
  `codigo_barra` varchar(100) DEFAULT NULL,
  `codigo_estatal` varchar(45) DEFAULT NULL,
  `marca_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `unidad_medida_compra_id` int(11) NOT NULL,
  `unidadad_compra` double NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `estado_producto_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `isv`, `precio_base`, `ultimo_costo_compra`, `costo_promedio`, `codigo_barra`, `codigo_estatal`, `marca_id`, `categoria_id`, `unidad_medida_compra_id`, `unidadad_compra`, `users_id`, `estado_producto_id`, `created_at`, `updated_at`) VALUES
(1, 'Papel bond carta blanco', 'Papel bond carta, con 500 paginas', 15, 115, 115, 115, '111', '112', 2, 2, 11, 10, 3, 1, '2022-05-23 21:11:38', '2022-07-13 03:33:14'),
(4, 'Lapiz Big Color negro', 'Lapiz Big color negro para oficina y escuela', 15, 5.75, 5.75, 5.75, '', '', 2, 1, 1, 1, 3, 1, '2022-05-25 20:10:18', '2022-07-13 03:38:55'),
(12, 'Silicon en barra', 'Silicon en barra', 15, 7.0725, 7.0725, 7.0725, '', '', 1, 1, 11, 50, 3, 1, '2022-06-04 05:32:15', '2022-07-14 05:06:03'),
(13, 'Cinta adhesiva', 'Cinta Adhesiva, 0.25mm', 15, 14.375, 14.375, 14.375, '', '', 1, 1, 4, 1, 3, 1, '2022-07-12 22:38:28', '2022-07-14 04:33:59'),
(14, 'SEPARADORES PARA CARPETAS T/CARTA', '(10DIVISIONES) A10', 15, 14.8, 10.51, 10.51, '7453010085469', '', 7, 1, 23, 1, 5, 1, '2022-07-15 13:53:52', '2022-07-15 13:53:52'),
(15, 'Alcohol Clinico', '70%', 0, 165, 1110, 110, '', '', 1, 2, 5, 1, 5, 1, '2022-07-15 13:58:14', '2022-07-15 13:58:14'),
(16, 'TINTA PARA IMPRESORA T664 70ML EPSON', 'COLOR NEGRO', 15, 253, 253, 253, '244444558825', '', 1, 1, 12, 1, 5, 1, '2022-07-19 20:45:22', '2022-07-19 14:45:22'),
(17, 'PAPEL HIGIENICO  CAREZZA', 'MIL HOJAS', 15, 15.52, 9.16665, 9.16665, '7416502202256', '', 8, 2, 7, 48, 5, 1, '2022-07-19 20:44:45', '2022-07-19 14:44:45'),
(18, 'PAPEL BOND T/CARTA 70G PAPERLINE', 'BASE 20, BLANCURA 97% COLOR BLANCO', 15, 1.15, 1.15, 1.15, '8991389136430', '', 9, 1, 3, 1, 5, 1, '2022-07-19 22:06:14', '2022-07-19 16:06:14'),
(19, 'PAPEL BOND T/CARTA 75G PAPERLINE', 'BASE 20, BLANCURA 97% COLOR BLANCO', 15, 1.15, 1.15, 1.15, '8991389137824', '', 9, 1, 3, 1, 5, 1, '2022-07-19 22:06:14', '2022-07-19 16:06:14'),
(20, 'PAPEL BOND T/OFICIO 70G PAPERLINE', 'BASE 20, BLANCURA 97% COLOR BLANCO', 15, 0.0115, 0.0115, 0.0115, '8991389136423', '', 9, 1, 3, 1, 5, 1, '2022-07-19 22:06:14', '2022-07-19 16:06:14'),
(21, 'PAPEL BOND T/OFICIO 75G PAPERLINE', 'BASE 20,  BLANCURA 97% COLOR BLANCO', 15, 0.0115, 0.0115, 0.0115, '8991389136520', '', 9, 1, 3, 1, 5, 1, '2022-07-19 22:06:14', '2022-07-19 16:06:14'),
(22, 'PAPEL BOND T/LEGAL 70G PAPERLINE', 'BASE 20,  BLANCURA 97% COLOR BLANCO', 15, 0.0115, 0.0115, 0.0115, '8991389137734', '', 9, 1, 3, 1, 5, 1, '2022-07-19 22:06:14', '2022-07-19 16:06:14'),
(23, 'PAPEL BOND T/LEGAL 75G PAPERLINE', 'BASE 20,  BANCURA 97% COLOR BLANCO', 15, 0.0115, 0.0115, 0.0115, '8991389137833', '', 9, 1, 3, 1, 5, 1, '2022-07-19 22:06:14', '2022-07-19 16:06:14'),
(24, 'PAPEL BOND T/CARTA 75G CHAMEX', 'BASE 20,  BLANCURA 97% COLOR BLANCO', 15, 1.15, 1.15, 1.15, '7891173022882', '', 11, 1, 3, 1, 5, 1, '2022-07-19 22:06:14', '2022-07-19 16:06:14'),
(25, 'PAPEL BOND T/OFICIO 75G CHAMEX', 'BASE 20, BLANCURA 97% COLOR BLANCO', 15, 0.0115, 0.0115, 0.0115, '7891173022929', '', 11, 1, 3, 1, 5, 1, '2022-07-19 22:06:14', '2022-07-19 16:06:14'),
(26, 'PAPEL BOND T/LEGAL 75G CHAMEX', 'BASE 20, BLANCURA 97% COLOR BLANCO', 15, 0.0115, 0.0115, 0.0115, '7891173022905', '', 11, 1, 3, 1, 5, 1, '2022-07-19 22:06:14', '2022-07-19 16:06:14'),
(27, 'PAPEL BOND T/CARTA 75G ICOPY', 'BASE 20,  BLANCURA 97% COLOR BLANCO', 15, 1.15, 1.15, 1.15, '7501249809902', '', 12, 1, 3, 1, 5, 1, '2022-07-19 22:06:14', '2022-07-19 16:06:14'),
(28, 'PAPEL BOND T/OFICIO 75G ICOPY', 'BASE 20, BLANCURA 97% COLOR BLANCO', 15, 0.0115, 0.0115, 0.0115, '7501249809919', '', 12, 1, 3, 1, 5, 1, '2022-07-19 22:06:14', '2022-07-19 16:06:14'),
(29, 'PAPEL BOND T/LEGAL 75G ICOPY', 'BASE 20, BLANCURA 97% COLOR BLANCO', 15, 0.0115, 0.0115, 0.0115, '7501249809933', '', 12, 1, 3, 1, 5, 1, '2022-07-19 22:06:14', '2022-07-19 16:06:14'),
(30, 'PAPEL BOND T/CARTA 70G ARTWORK', 'BLANCURA 97% COLOR BLANCO', 15, 0.0115, 0.0115, 0.0115, '7891191004723', '', 10, 1, 3, 1, 5, 1, '2022-07-19 22:06:14', '2022-07-19 16:06:14'),
(31, 'FOLDER MANILA T/CARTA CONCEPT PLUS', 'RESMA DE 100 UND', 15, 0.0115, 0.0115, 0.0115, '', '', 13, 1, 3, 1, 5, 1, '2022-07-19 22:06:14', '2022-07-19 16:06:14'),
(32, 'FOLDER MANILA T/OFICIO CONCEP PLUS', 'RESMA DE 100 UND', 15, 0.0115, 0.0115, 0.0115, '', '', 13, 1, 3, 1, 5, 1, '2022-07-19 22:06:14', '2022-07-19 16:06:14'),
(33, 'PAPEL BOND T/A4 PAPERLINE 70G', 'BASE 20,', 15, 0.0115, 0.0115, 0.0115, '8991389136393', '', 9, 1, 3, 1, 5, 1, '2022-07-19 22:06:14', '2022-07-19 16:06:14'),
(34, 'CUADERNO UNICO LARGO 400PG WEX', 'PLASTIFICADO', 15, 0.0115, 0.0115, 0.0115, '7401111913839', '', 15, 1, 4, 1, 5, 1, '2022-07-19 22:06:14', '2022-07-19 16:06:14'),
(35, 'GRAPA STANDAR METALICA SYSABE', '26/6 5000UND', 15, 0.0115, 0.0115, 0.0115, '7591213006819', '', 16, 1, 4, 1, 4, 1, '2022-07-19 23:36:12', '2022-07-19 17:36:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) NOT NULL,
  `direccion` text NOT NULL,
  `contacto` varchar(45) NOT NULL,
  `telefono_1` varchar(45) NOT NULL,
  `telefono_2` varchar(45) DEFAULT NULL,
  `correo_1` varchar(45) NOT NULL,
  `correo_2` varchar(45) DEFAULT NULL,
  `rtn` varchar(45) NOT NULL,
  `registrado_por` bigint(20) UNSIGNED NOT NULL,
  `estado_id` int(11) NOT NULL,
  `municipio_id` int(11) NOT NULL,
  `tipo_personalidad_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `codigo`, `nombre`, `direccion`, `contacto`, `telefono_1`, `telefono_2`, `correo_1`, `correo_2`, `rtn`, `registrado_por`, `estado_id`, `municipio_id`, `tipo_personalidad_id`, `categoria_id`, `created_at`, `updated_at`) VALUES
(1, '11101', 'Proveedor 1', 'comayaguela', 'Pedro', '+50489282146', '', 'luisfaviles18@gmail.com', '', '08011990568971', 3, 1, 110, 1, 1, '2022-03-15 09:31:28', '2022-07-11 23:48:41'),
(2, '11101', 'Proveedor 2', 'comayaguela', 'Pedro', '+50489282146', NULL, 'luisfaviles18@gmail.com', NULL, '08011990568971', 3, 1, 110, 1, 1, '2022-03-15 09:32:42', '2022-07-11 22:21:19'),
(4, '12', 'Proveedor 3', 'TEGUCIGALPA\r\nTEGUCIGALPA', 'Pedro', '89282146', NULL, 'luisfaviles18@gmail.com', NULL, '08011990568971', 3, 1, 110, 1, 1, '2022-03-15 09:53:24', '2022-03-29 09:18:17'),
(5, '12', 'Proveedor 4', 'TEGUCIGALPA\r\nTEGUCIGALPA', 'Pedro', '89282146', NULL, 'luisfaviles18@gmail.com', NULL, '08011990568971', 3, 1, 110, 1, 1, '2022-03-15 09:53:41', '2022-03-29 09:18:26'),
(6, '66', 'Proveedor 5', 'TEGUCIGALPA\r\nTEGUCIGALPA', 'Pedro', '99885522', '223355669', 'proveedor1@gmail.com', NULL, '08011990568971', 3, 1, 110, 2, 1, '2022-03-15 12:21:54', '2022-03-15 12:21:54'),
(7, '66', 'Proveedor 6', 'TEGUCIGALPA\r\nTEGUCIGALPA', 'Pedro', '99885522', '223355669', 'proveedor1@gmail.com', NULL, '08011990568971', 3, 1, 110, 2, 1, '2022-03-15 12:22:04', '2022-03-29 09:18:36'),
(8, '66', 'Proveedor 7', 'TEGUCIGALPA\r\nTEGUCIGALPA', 'Pedro', '99885522', '223355669', 'proveedor1@gmail.com', NULL, '08011990568971', 3, 1, 110, 2, 1, '2022-03-15 12:22:07', '2022-03-29 09:18:43'),
(9, '663', 'Proveedor 8', 'Tegucigalpa', 'Juan Perez', '88996655', NULL, 'proveedor@gmail.com', NULL, '08011990568971', 3, 1, 10, 1, 1, '2022-03-15 12:23:56', '2022-03-15 13:02:28'),
(10, '20', 'Proveedor 20', 'comayaguela, col Policarpo Paz García, casa 204, color amarillo', 'Pedro', '89282146', NULL, 'luisfaviles18@gmail.com', 'luisfaviles18@gmail.com', '082219950082544', 3, 1, 110, 1, 1, '2022-05-05 02:39:01', '2022-05-05 02:39:01'),
(11, '504', 'Exportadora Mi Gran Pasion', 'Puerto Cortes', 'Juan Perez', '22557788', '', 'email@gmail.com', '', '08011990123458', 3, 1, 63, 1, 1, '2022-07-12 00:00:28', '2022-07-12 00:00:28'),
(12, '12', 'DISTRIBUIDORA FLORES S. DE R.L.', 'RESIDENCIAL PALMA REAL FTE FFAA', 'JONH FLORES', '96177692', '95887581', '12345678', '', '0801900926575', 5, 1, 110, 2, 1, '2022-07-15 15:23:21', '2022-07-15 15:23:21'),
(13, '13', 'INVENTARIO INICIAL', 'COLONIA GODOY', '22343424', '22343424', '', 'dvalenciahonduras@yahoo.com', '', '08011986138652', 5, 1, 110, 1, 1, '2022-07-19 14:33:54', '2022-07-19 14:33:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recibido_bodega`
--

CREATE TABLE `recibido_bodega` (
  `id` int(11) NOT NULL,
  `compra_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `seccion_id` int(11) NOT NULL,
  `cantidad_compra_lote` int(11) NOT NULL,
  `cantidad_inicial_seccion` int(11) NOT NULL,
  `cantidad_disponible` int(11) NOT NULL,
  `fecha_recibido` date NOT NULL,
  `fecha_expiracion` date DEFAULT NULL,
  `estado_recibido` int(11) NOT NULL,
  `recibido_por` bigint(20) UNSIGNED NOT NULL,
  `comentario` varchar(45) DEFAULT NULL,
  `unidad_compra_id` int(11) NOT NULL,
  `unidades_compra` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `recibido_bodega`
--

INSERT INTO `recibido_bodega` (`id`, `compra_id`, `producto_id`, `seccion_id`, `cantidad_compra_lote`, `cantidad_inicial_seccion`, `cantidad_disponible`, `fecha_recibido`, `fecha_expiracion`, `estado_recibido`, `recibido_por`, `comentario`, `unidad_compra_id`, `unidades_compra`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1000, 1000, 715, '2022-07-13', NULL, 4, 3, NULL, 11, 10, '2022-07-14 05:06:41', '2022-07-28 18:19:11'),
(2, 1, 4, 17, 1000, 1000, 690, '2022-07-13', NULL, 4, 3, NULL, 1, 1, '2022-07-14 05:06:50', '2022-07-28 19:58:46'),
(3, 1, 12, 17, 1000, 1000, 790, '2022-07-13', NULL, 4, 3, NULL, 11, 50, '2022-07-14 05:07:02', '2022-07-26 00:31:51'),
(4, 2, 16, 1, 7, 7, 7, '2022-07-15', '2022-06-15', 4, 5, NULL, 12, 1, '2022-07-15 14:29:32', '2022-07-15 14:29:32'),
(5, 3, 17, 1, 288, 288, 278, '2022-07-15', NULL, 4, 5, NULL, 7, 48, '2022-07-15 15:42:27', '2022-07-20 17:13:04'),
(6, 4, 18, 24, 1, 1, 1, '2022-07-19', '2022-07-19', 4, 5, NULL, 3, 1, '2022-07-19 16:39:29', '2022-07-19 16:39:29'),
(7, 4, 19, 19, 13, 10, 10, '2022-07-19', '2022-07-19', 4, 5, NULL, 3, 1, '2022-07-19 16:41:00', '2022-07-19 16:41:00'),
(8, 4, 19, 21, 13, 3, 3, '2022-07-19', '2022-07-19', 4, 5, NULL, 3, 1, '2022-07-19 16:41:30', '2022-07-19 16:41:30'),
(9, 4, 20, 23, 101, 3, 3, '2022-07-19', '2022-07-19', 4, 5, NULL, 3, 1, '2022-07-19 16:42:52', '2022-07-19 16:42:52'),
(10, 4, 20, 24, 101, 98, 98, '2022-07-19', '2022-07-19', 4, 5, NULL, 3, 1, '2022-07-19 16:44:00', '2022-07-19 16:44:00'),
(11, 4, 21, 21, 2700, 2700, 2700, '2022-07-19', '2022-07-19', 4, 5, NULL, 3, 1, '2022-07-19 16:44:57', '2022-07-19 16:44:57'),
(12, 4, 22, 21, 10327, 5870, 5870, '2022-07-19', '2022-07-19', 4, 5, NULL, 3, 1, '2022-07-19 16:45:38', '2022-07-19 16:45:38'),
(13, 4, 22, 22, 10327, 4080, 4080, '2022-07-19', '2022-07-19', 4, 5, NULL, 3, 1, '2022-07-19 16:46:05', '2022-07-19 16:46:05'),
(14, 4, 22, 24, 10327, 377, 377, '2022-07-19', '2022-07-19', 4, 5, NULL, 3, 1, '2022-07-19 16:46:28', '2022-07-19 16:46:28'),
(15, 4, 23, 21, 3002, 3000, 3000, '2022-07-19', '2022-07-19', 4, 5, NULL, 3, 1, '2022-07-19 16:47:21', '2022-07-19 16:47:21'),
(16, 4, 23, 24, 3002, 2, 2, '2022-07-19', '2022-07-19', 4, 5, NULL, 3, 1, '2022-07-19 16:47:43', '2022-07-19 16:47:43'),
(17, 4, 24, 24, 60, 60, 60, '2022-07-19', '2022-07-19', 4, 5, NULL, 3, 1, '2022-07-19 16:48:19', '2022-07-19 16:48:19'),
(18, 4, 25, 21, 1230, 1107, 1107, '2022-07-19', '2022-07-19', 4, 5, NULL, 3, 1, '2022-07-19 16:48:51', '2022-07-19 16:48:51'),
(19, 4, 25, 24, 1230, 123, 123, '2022-07-19', '2022-07-19', 4, 5, NULL, 3, 1, '2022-07-19 16:49:16', '2022-07-19 16:49:16'),
(20, 4, 26, 21, 5889, 2, 2, '2022-07-19', '2022-07-19', 4, 5, NULL, 3, 1, '2022-07-19 16:50:00', '2022-07-19 16:50:00'),
(21, 4, 26, 23, 5889, 2475, 2475, '2022-07-19', '2022-07-19', 4, 5, NULL, 3, 1, '2022-07-19 16:50:40', '2022-07-19 16:50:40'),
(22, 4, 26, 24, 5889, 12, 12, '2022-07-19', '2022-07-19', 4, 5, NULL, 3, 1, '2022-07-19 16:51:07', '2022-07-19 16:51:07'),
(23, 4, 26, 25, 5889, 3400, 3400, '2022-07-19', '2022-07-19', 4, 5, NULL, 3, 1, '2022-07-19 16:51:30', '2022-07-19 16:51:30'),
(24, 4, 27, 24, 67, 67, 67, '2022-07-19', '2022-07-19', 4, 5, NULL, 3, 1, '2022-07-19 16:52:02', '2022-07-19 16:52:02'),
(25, 4, 31, 20, 4769, 4769, 4769, '2022-07-19', '2022-07-19', 4, 5, NULL, 3, 1, '2022-07-19 16:52:32', '2022-07-19 16:52:32'),
(26, 4, 28, 23, 311, 311, 311, '2022-07-19', '2022-07-19', 4, 5, NULL, 3, 1, '2022-07-19 16:53:04', '2022-07-19 16:53:04'),
(27, 4, 29, 21, 4490, 4488, 4488, '2022-07-19', '2022-07-19', 4, 5, NULL, 3, 1, '2022-07-19 16:53:48', '2022-07-19 16:53:48'),
(28, 4, 29, 24, 4490, 2, 2, '2022-07-19', '2022-07-19', 4, 5, NULL, 3, 1, '2022-07-19 16:54:19', '2022-07-19 16:54:19'),
(29, 4, 30, 21, 52031, 48331, 48581, '2022-07-19', '2022-07-19', 4, 5, NULL, 3, 1, '2022-07-20 16:17:08', '2022-07-22 17:19:58'),
(30, 4, 30, 24, 52031, 770, 770, '2022-07-19', '2022-07-19', 4, 5, NULL, 3, 1, '2022-07-19 16:55:47', '2022-07-19 16:55:47'),
(31, 4, 30, 25, 52031, 2930, 2930, '2022-07-19', '2022-07-19', 4, 5, NULL, 3, 1, '2022-07-19 16:56:22', '2022-07-19 16:56:22'),
(32, 4, 32, 20, 2346, 2346, 2346, '2022-07-19', '2022-07-19', 4, 5, NULL, 3, 1, '2022-07-19 16:57:04', '2022-07-19 16:57:04'),
(33, 4, 33, 23, 517, 517, 517, '2022-07-19', '2022-07-19', 4, 5, NULL, 3, 1, '2022-07-19 16:57:29', '2022-07-19 16:57:29'),
(34, 4, 34, 23, 953, 953, 953, '2022-07-19', '2022-07-19', 4, 5, NULL, 4, 1, '2022-07-19 16:57:56', '2022-07-19 16:57:56'),
(35, 4, 35, 23, 21783, 21783, 21783, '2022-07-19', '2022-07-19', 4, 5, NULL, 4, 1, '2022-07-19 16:58:43', '2022-07-19 16:58:43'),
(36, 1, 1, 19, 1000, 100, 100, '2022-07-20', NULL, 4, 3, NULL, 11, 10, '2022-07-20 20:10:27', '2022-07-20 20:10:27'),
(37, 1, 4, 1, 1000, 10, 10, '2022-07-28', NULL, 4, 3, NULL, 1, 1, '2022-07-28 19:58:46', '2022-07-28 19:58:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retenciones`
--

CREATE TABLE `retenciones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `valor` double DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tipo_retencion_id` int(11) NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `retenciones`
--

INSERT INTO `retenciones` (`id`, `nombre`, `valor`, `created_at`, `updated_at`, `tipo_retencion_id`, `users_id`) VALUES
(1, 'No aplica a retencion', 0, '2022-03-29 04:47:17', '2022-03-15 03:20:28', 2, 2),
(2, 'Retencion del 1%', 1, '2022-03-29 04:47:22', '2022-03-15 00:49:57', 2, 2),
(3, 'prueba de registro', 18, '2022-03-30 07:35:36', '2022-03-30 07:35:36', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retenciones_has_proveedores`
--

CREATE TABLE `retenciones_has_proveedores` (
  `retenciones_id` int(11) NOT NULL,
  `proveedores_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `retenciones_has_proveedores`
--

INSERT INTO `retenciones_has_proveedores` (`retenciones_id`, `proveedores_id`, `created_at`, `updated_at`) VALUES
(2, 1, '2022-04-20 06:00:00', '2022-04-20 06:00:00'),
(2, 4, '2022-03-15 09:53:24', '2022-03-15 09:53:24'),
(2, 6, '2022-03-15 12:21:54', '2022-03-15 12:21:54'),
(2, 7, '2022-03-15 12:22:04', '2022-03-15 12:22:04'),
(2, 8, '2022-03-15 12:22:07', '2022-03-15 12:22:07'),
(2, 9, '2022-03-15 12:23:56', '2022-03-15 12:23:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', '2022-05-16 23:57:39', '2022-05-16 23:57:06'),
(2, 'Vendedor', '2022-05-16 23:57:39', '2022-05-16 23:57:06'),
(3, 'Facturador', '2022-06-07 06:00:00', '2022-06-07 06:00:00'),
(4, 'Contabilidad', '2022-07-12 06:00:00', '2022-07-12 06:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion`
--

CREATE TABLE `seccion` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `numeracion` int(11) DEFAULT NULL,
  `estado_id` int(11) NOT NULL,
  `segmento_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `seccion`
--

INSERT INTO `seccion` (`id`, `descripcion`, `numeracion`, `estado_id`, `segmento_id`, `created_at`, `updated_at`) VALUES
(1, 'Seccion A1', 1, 2, 1, '2022-04-03 01:21:42', '2022-04-05 22:22:27'),
(2, 'Seccion A2', 2, 1, 1, '2022-04-03 01:21:42', '2022-07-11 23:43:38'),
(3, 'Seccion B1', 1, 1, 2, '2022-04-03 01:21:42', '2022-07-11 23:43:38'),
(4, 'Seccion B2', 2, 1, 2, '2022-04-03 01:21:42', '2022-07-11 23:43:38'),
(5, 'Seccion B3', 3, 1, 2, '2022-04-03 01:21:42', '2022-07-11 23:43:38'),
(6, 'Seccion C1', 1, 1, 3, '2022-04-03 01:21:42', '2022-07-11 23:43:38'),
(7, 'Seccion C2', 2, 1, 3, '2022-04-03 01:21:42', '2022-07-11 23:43:38'),
(8, 'Seccion C3', 3, 1, 3, '2022-04-03 01:21:42', '2022-07-11 23:43:38'),
(9, 'Seccion C4', 4, 1, 3, '2022-04-03 01:21:42', '2022-07-11 23:43:38'),
(10, 'Seccion D1', 1, 1, 4, '2022-04-03 01:21:42', '2022-07-11 23:43:38'),
(11, 'Seccion D2', 2, 1, 4, '2022-04-03 01:21:42', '2022-07-11 23:43:38'),
(12, 'Seccion D3', 3, 1, 4, '2022-04-03 01:21:42', '2022-07-11 23:43:38'),
(13, 'Seccion D4', 4, 1, 4, '2022-04-03 01:21:42', '2022-07-11 23:43:38'),
(14, 'Seccion D5', 5, 1, 4, '2022-04-03 01:21:42', '2022-07-11 23:43:38'),
(15, 'Seccion A1', 1, 1, 5, '2022-04-08 06:10:17', '2022-04-08 06:10:17'),
(16, 'Seccion A2', 2, 1, 5, '2022-04-08 06:10:17', '2022-04-08 06:10:17'),
(17, 'Seccion A3', 3, 1, 5, '2022-04-08 06:10:17', '2022-04-08 06:10:17'),
(18, 'Seccion A 1', 1, 1, 6, '2022-07-15 15:58:47', '2022-07-15 15:58:47'),
(19, 'Seccion A 1', 1, 1, 7, '2022-07-19 16:33:18', '2022-07-19 16:33:18'),
(20, 'Seccion A 1', 1, 1, 8, '2022-07-19 22:35:47', '2022-07-19 16:35:47'),
(21, 'Seccion A 1', 1, 1, 9, '2022-07-19 16:34:18', '2022-07-19 16:34:18'),
(22, 'Seccion A 1', 1, 1, 10, '2022-07-19 16:34:48', '2022-07-19 16:34:48'),
(23, 'Seccion A 1', 1, 1, 11, '2022-07-19 16:35:20', '2022-07-19 16:35:20'),
(24, 'Seccion A 1', 1, 1, 12, '2022-07-19 16:36:45', '2022-07-19 16:36:45'),
(25, 'Seccion A 1', 1, 1, 13, '2022-07-19 16:37:43', '2022-07-19 16:37:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `segmento`
--

CREATE TABLE `segmento` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `bodega_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `segmento`
--

INSERT INTO `segmento` (`id`, `descripcion`, `bodega_id`, `created_at`, `updated_at`) VALUES
(1, 'A', 1, '2022-04-03 01:21:42', '2022-04-03 01:21:42'),
(2, 'B', 1, '2022-04-03 01:21:42', '2022-04-03 01:21:42'),
(3, 'C', 1, '2022-04-03 01:21:42', '2022-04-03 01:21:42'),
(4, 'D', 1, '2022-04-03 01:21:42', '2022-04-03 01:21:42'),
(5, 'A', 2, '2022-04-08 06:10:17', '2022-04-08 06:10:17'),
(6, 'A', 3, '2022-07-15 15:58:47', '2022-07-15 15:58:47'),
(7, 'A', 4, '2022-07-19 16:33:18', '2022-07-19 16:33:18'),
(8, 'A', 5, '2022-07-19 16:33:49', '2022-07-19 16:33:49'),
(9, 'A', 6, '2022-07-19 16:34:18', '2022-07-19 16:34:18'),
(10, 'A', 7, '2022-07-19 16:34:48', '2022-07-19 16:34:48'),
(11, 'A', 8, '2022-07-19 16:35:20', '2022-07-19 16:35:20'),
(12, 'A', 9, '2022-07-19 16:36:45', '2022-07-19 16:36:45'),
(13, 'A', 10, '2022-07-19 16:37:43', '2022-07-19 16:37:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('AEvm5f5XOomWSawYkDumXHcE0SfmSS3fWgtKsnUe', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiMjVYa0p1SnZuNlM3b0xTR29CZU41alNJYVZ0RUJtamkzTUd6dmhYdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC90cmFuc2xhZG8vaW1wcmltaXIvNTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJHNMUmxKaDFlbU4wOFppdkxEd2tHUnVjVHRNRXM4R2IzTUkubFJhRFZmb3oueC9wcW10Q0JDIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJHNMUmxKaDFlbU4wOFppdkxEd2tHUnVjVHRNRXM4R2IzTUkubFJhRFZmb3oueC9wcW10Q0JDIjt9', 1659132930);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sub_menu`
--

CREATE TABLE `sub_menu` (
  `id` int(11) NOT NULL,
  `url` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `personal_team` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `teams`
--

INSERT INTO `teams` (`id`, `user_id`, `name`, `personal_team`, `created_at`, `updated_at`) VALUES
(1, 2, 'Yefry\'s Team', 1, '2022-03-02 09:05:40', '2022-03-02 09:05:40'),
(2, 3, 'Luis\'s Team', 1, '2022-03-07 12:42:26', '2022-03-07 12:42:26'),
(3, 4, 'Usuario\'s Team', 1, '2022-03-16 01:01:19', '2022-03-16 01:01:19'),
(4, 5, 'Selenia\'s Team', 1, '2022-05-04 02:30:19', '2022-05-04 02:30:19'),
(5, 6, 'Josseline\'s Team', 1, '2022-07-09 06:38:24', '2022-07-09 06:38:24'),
(6, 7, 'Graylin\'s Team', 1, '2022-07-09 06:39:48', '2022-07-09 06:39:48'),
(7, 8, 'Francis\'s Team', 1, '2022-07-09 06:41:42', '2022-07-09 06:41:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `team_invitations`
--

CREATE TABLE `team_invitations` (
  `id` int(10) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `team_user`
--

CREATE TABLE `team_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_ajuste`
--

CREATE TABLE `tipo_ajuste` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_ajuste`
--

INSERT INTO `tipo_ajuste` (`id`, `nombre`, `users_id`, `created_at`, `updated_at`) VALUES
(1, 'Prueba de ajuste', 5, '2022-07-21 18:07:41', '2022-07-21 18:07:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cliente`
--

CREATE TABLE `tipo_cliente` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_cliente`
--

INSERT INTO `tipo_cliente` (`id`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Corporativo', '2022-07-20 16:33:41', '2022-05-16 23:52:11'),
(2, 'Estatal', '2022-05-16 23:53:19', '2022-05-16 23:52:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_compra`
--

CREATE TABLE `tipo_compra` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_compra`
--

INSERT INTO `tipo_compra` (`id`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Credito', '2022-03-24 01:03:40', NULL),
(2, 'Contado', '2022-03-24 01:03:40', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento_fiscal`
--

CREATE TABLE `tipo_documento_fiscal` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_documento_fiscal`
--

INSERT INTO `tipo_documento_fiscal` (`id`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'FACTURACION CAI', '2022-05-26 01:40:36', '2022-05-26 01:40:16'),
(2, 'RETENCION DEL 1%', '2022-06-07 23:54:06', '2022-06-07 23:53:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pago_cobro`
--

CREATE TABLE `tipo_pago_cobro` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_pago_cobro`
--

INSERT INTO `tipo_pago_cobro` (`id`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Efectivo', '2022-07-06 03:43:57', '2022-07-06 03:43:28'),
(2, 'Transferencia Bancaria', '2022-07-06 03:43:57', '2022-07-06 03:43:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pago_venta`
--

CREATE TABLE `tipo_pago_venta` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_pago_venta`
--

INSERT INTO `tipo_pago_venta` (`id`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'contado', '2022-05-20 19:26:10', '2022-05-20 19:25:49'),
(2, 'credito', '2022-05-20 19:26:10', '2022-05-20 19:25:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_personalidad`
--

CREATE TABLE `tipo_personalidad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_personalidad`
--

INSERT INTO `tipo_personalidad` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Persona Natural', '2022-03-15 00:54:28', NULL),
(2, 'Persona Jurídica', '2022-03-15 00:54:28', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_retencion`
--

CREATE TABLE `tipo_retencion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_retencion`
--

INSERT INTO `tipo_retencion` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Valor real', '2022-03-15 01:02:46', '2022-03-15 01:02:46'),
(2, 'Porcentaje', '2022-03-15 01:02:46', '2022-03-15 01:02:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_venta`
--

CREATE TABLE `tipo_venta` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_venta`
--

INSERT INTO `tipo_venta` (`id`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'corporativo', '2022-05-20 19:26:53', '2022-05-20 19:23:23'),
(2, 'estatal', '2022-05-20 19:24:01', '2022-05-20 19:23:23'),
(3, 'exenta de impuesto', '2022-07-20 16:34:12', '2022-07-15 06:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_medida`
--

CREATE TABLE `unidad_medida` (
  `id` int(11) NOT NULL,
  `unidad` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `simbolo` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `unidad_medida`
--

INSERT INTO `unidad_medida` (`id`, `unidad`, `nombre`, `simbolo`, `created_at`, `updated_at`) VALUES
(1, 1, 'unidad', 'un', '2022-03-24 01:16:22', '2022-03-24 01:08:57'),
(2, 1, 'yarda', 'yd', '2022-03-24 01:15:54', '2022-03-24 01:08:57'),
(3, 1, ' RESMA', ' RESMA', '2022-04-25 06:00:00', '2022-04-25 06:00:00'),
(4, 1, ' UNIDAD', ' UNIDAD', '2022-04-25 06:00:00', '2022-04-25 06:00:00'),
(5, 1, ' GALON', ' GALON', '2022-04-25 06:00:00', '2022-04-25 06:00:00'),
(6, 1, ' BARRIL', ' BARRIL', '2022-04-25 06:00:00', '2022-04-25 06:00:00'),
(7, 1, ' FARDO', ' FARDO', '2022-04-25 06:00:00', '2022-04-25 06:00:00'),
(8, 1, ' DOCENA', ' DOCENA', '2022-04-25 06:00:00', '2022-04-25 06:00:00'),
(9, 1, ' CUBETA', ' CUBETA', '2022-04-25 06:00:00', '2022-04-25 06:00:00'),
(10, 1, ' CUARTO', ' CUARTO', '2022-04-25 06:00:00', '2022-04-25 06:00:00'),
(11, 1, ' CAJA', ' CAJA', '2022-04-25 06:00:00', '2022-04-25 06:00:00'),
(12, 1, ' BOTE', ' BOTE', '2022-04-25 06:00:00', '2022-04-25 06:00:00'),
(13, 1, ' BOLSA', ' BOLSA', '2022-04-25 06:00:00', '2022-04-25 06:00:00'),
(14, 1, ' BLOCK', ' BLOCK', '2022-04-25 06:00:00', '2022-04-25 06:00:00'),
(15, 1, ' CUBO', ' CUBO', '2022-04-25 06:00:00', '2022-04-25 06:00:00'),
(16, 1, ' JUEGO', ' JUEGO', '2022-04-25 06:00:00', '2022-04-25 06:00:00'),
(17, 1, ' KILO', ' KILO', '2022-04-25 06:00:00', '2022-04-25 06:00:00'),
(18, 1, ' KIT', ' KIT', '2022-04-25 06:00:00', '2022-04-25 06:00:00'),
(19, 1, ' LANCE', ' LANCE', '2022-04-25 06:00:00', '2022-04-25 06:00:00'),
(20, 1, ' LATA', ' LATA', '2022-04-25 06:00:00', '2022-04-25 06:00:00'),
(21, 1, ' LIBRA', ' LIBRA', '2022-04-25 06:00:00', '2022-04-25 06:00:00'),
(22, 1, ' LITRO', ' LITRO', '2022-04-25 06:00:00', '2022-04-25 06:00:00'),
(23, 1, ' PAQUETE', ' PAQUETE', '2022-04-25 06:00:00', '2022-04-25 06:00:00'),
(24, 1, ' PAR', ' PAR', '2022-04-25 06:00:00', '2022-04-25 06:00:00'),
(25, 1, ' PIEZA', ' PIEZA', '2022-04-25 06:00:00', '2022-04-25 06:00:00'),
(26, 1, ' PLIEGO', ' PLIEGO', '2022-04-25 06:00:00', '2022-04-25 06:00:00'),
(27, 1, ' ROLLO', ' ROLLO', '2022-04-25 06:00:00', '2022-04-25 06:00:00'),
(28, 1, ' SET', ' SET', '2022-04-25 06:00:00', '2022-04-25 06:00:00'),
(29, 1, ' TONELADA', ' TONELADA', '2022-04-25 06:00:00', '2022-04-25 06:00:00'),
(30, 1, 'YARDa', 'YARDa', '2022-04-25 06:00:00', '2022-07-29 20:53:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_medida_venta`
--

CREATE TABLE `unidad_medida_venta` (
  `id` int(11) NOT NULL,
  `unidad_venta` double NOT NULL,
  `unidad_medida_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `unidad_venta_defecto` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `unidad_medida_venta`
--

INSERT INTO `unidad_medida_venta` (`id`, `unidad_venta`, `unidad_medida_id`, `producto_id`, `estado_id`, `unidad_venta_defecto`, `created_at`, `updated_at`) VALUES
(1, 10, 11, 1, 1, 0, '2022-05-23 21:11:38', '2022-05-24 18:11:34'),
(2, 1, 3, 1, 1, 1, '2022-05-23 21:11:38', '2022-05-23 21:11:38'),
(3, 1, 1, 4, 1, 1, '2022-05-25 20:10:18', '2022-05-25 20:10:18'),
(4, 10, 11, 4, 1, 0, '2022-05-25 06:00:00', '2022-05-25 06:00:00'),
(12, 1, 1, 12, 1, 1, '2022-06-04 05:32:15', '2022-06-04 05:32:15'),
(13, 50, 11, 12, 1, 0, '2022-06-04 05:32:15', '2022-06-04 05:32:15'),
(14, 1, 4, 13, 1, 1, '2022-07-12 22:38:28', '2022-07-12 22:38:28'),
(15, 1, 23, 14, 1, 1, '2022-07-15 13:53:52', '2022-07-15 13:53:52'),
(16, 1, 5, 15, 1, 1, '2022-07-15 13:58:14', '2022-07-15 13:58:14'),
(17, 1, 12, 16, 1, 1, '2022-07-15 14:23:42', '2022-07-15 14:23:42'),
(18, 1, 27, 17, 1, 1, '2022-07-15 15:31:01', '2022-07-15 15:31:01'),
(19, 48, 7, 17, 1, 0, '2022-07-15 15:31:01', '2022-07-15 15:31:01'),
(20, 1, 3, 18, 1, 1, '2022-07-19 13:31:19', '2022-07-19 13:31:19'),
(21, 10, 11, 18, 1, 0, '2022-07-19 13:31:19', '2022-07-19 13:31:19'),
(22, 1, 3, 19, 1, 1, '2022-07-19 13:35:38', '2022-07-19 13:35:38'),
(23, 10, 11, 19, 1, 0, '2022-07-19 13:35:38', '2022-07-19 13:35:38'),
(24, 1, 3, 20, 1, 1, '2022-07-19 13:39:18', '2022-07-19 13:39:18'),
(25, 5, 11, 20, 1, 0, '2022-07-19 13:39:18', '2022-07-19 13:39:18'),
(26, 1, 3, 21, 1, 1, '2022-07-19 13:49:21', '2022-07-19 13:49:21'),
(27, 10, 11, 21, 1, 0, '2022-07-19 13:49:21', '2022-07-19 13:49:21'),
(28, 1, 3, 22, 1, 1, '2022-07-19 13:54:35', '2022-07-19 13:54:35'),
(29, 10, 11, 22, 1, 0, '2022-07-19 13:54:35', '2022-07-19 13:54:35'),
(30, 1, 3, 23, 1, 1, '2022-07-19 13:58:29', '2022-07-19 13:58:29'),
(31, 5, 11, 23, 1, 0, '2022-07-19 13:58:29', '2022-07-19 13:58:29'),
(32, 1, 3, 24, 1, 1, '2022-07-19 14:03:36', '2022-07-19 14:03:36'),
(33, 10, 11, 24, 1, 0, '2022-07-19 14:03:36', '2022-07-19 14:03:36'),
(34, 1, 3, 25, 1, 1, '2022-07-19 14:07:15', '2022-07-19 14:07:15'),
(35, 10, 11, 25, 1, 0, '2022-07-19 14:07:15', '2022-07-19 14:07:15'),
(36, 1, 3, 26, 1, 1, '2022-07-19 14:09:11', '2022-07-19 14:09:11'),
(37, 10, 11, 26, 1, 0, '2022-07-19 14:09:11', '2022-07-19 14:09:11'),
(38, 1, 3, 27, 1, 1, '2022-07-19 14:10:59', '2022-07-19 14:10:59'),
(39, 10, 11, 27, 1, 0, '2022-07-19 14:10:59', '2022-07-19 14:10:59'),
(40, 1, 3, 28, 1, 1, '2022-07-19 14:13:08', '2022-07-19 14:13:08'),
(41, 10, 11, 28, 1, 0, '2022-07-19 14:13:08', '2022-07-19 14:13:08'),
(42, 1, 3, 29, 1, 1, '2022-07-19 14:14:25', '2022-07-19 14:14:25'),
(43, 5, 11, 29, 1, 0, '2022-07-19 14:14:25', '2022-07-19 14:14:25'),
(44, 1, 3, 30, 1, 1, '2022-07-19 14:16:36', '2022-07-19 14:16:36'),
(45, 10, 11, 30, 1, 0, '2022-07-19 14:16:36', '2022-07-19 14:16:36'),
(46, 1, 3, 31, 1, 1, '2022-07-19 14:18:28', '2022-07-19 14:18:28'),
(47, 1, 3, 32, 1, 1, '2022-07-19 14:21:53', '2022-07-19 14:21:53'),
(48, 1, 3, 33, 1, 1, '2022-07-19 14:24:31', '2022-07-19 14:24:31'),
(49, 5, 11, 33, 1, 0, '2022-07-19 14:24:31', '2022-07-19 14:24:31'),
(50, 1, 4, 34, 1, 1, '2022-07-19 14:27:40', '2022-07-19 14:27:40'),
(51, 30, 11, 34, 1, 0, '2022-07-19 14:27:40', '2022-07-19 14:27:40'),
(52, 1, 4, 35, 1, 1, '2022-07-19 14:29:19', '2022-07-19 14:29:19'),
(53, 100, 11, 35, 1, 0, '2022-07-19 14:29:19', '2022-07-19 14:29:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `identidad` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci,
  `fecha_nacimiento` date DEFAULT NULL,
  `telefono` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `identidad`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `fecha_nacimiento`, `telefono`, `created_at`, `updated_at`, `rol_id`) VALUES
(2, '0801199612356', 'Yefry Ortiz', 'yefryyo@gmail.com', NULL, '$2y$10$YgQRCumSehYxcGqjPKYL9e6hPVN.V8NmhwbFT6CqyWoF4bHGIf8Be', NULL, NULL, NULL, 1, NULL, '1996-04-01', '22336699', '2022-03-02 15:05:40', '2022-03-02 15:05:41', 1),
(3, '0822199500082', 'Luis Aviles', 'luisfaviles18@gmail.com', NULL, '$2y$10$sLRlJh1emN08ZivLDwkGRucTtMEs8Gb3MI.lRaDVfoz.x/pqmtCBC', NULL, NULL, 'lVsIUvBRQlYnAkpu4hY8SDX8KRc4nn6Vi0NiPckWEzTESBV8oYtDXS2osTS1', 2, 'profile-photos/oNdajTCAvTsuuRD76t4ognTdmhWLIOy9nEszULmY.jpg', '1995-03-16', '89282146', '2022-03-07 18:42:26', '2022-03-24 17:52:49', 1),
(4, '0801199036544', 'Usuario', 'usuario.prueba@distribucionesvalencia.hn', NULL, '$2y$10$KQ3DjX8eDhNcDN7qXhgTDuzMcgNL5B5RzAoRKKeL58i5c4tMcJg2O', NULL, NULL, NULL, 3, 'profile-photos/BfgxcEGyPbul0q1cEmGVkVsY97MBlO0GLBAGwavE.jpg', '2022-03-15', '88996655', '2022-05-17 05:58:07', '2022-07-14 05:22:55', 2),
(5, NULL, 'Selenia Merlo', 'selenia.merlo@distribucionesvalencia.hn', NULL, '$2y$10$3ljNTl6ifmc7vIFjp9KdC.TBek65txuJInRtUZSAL10CGHrs8MVM.', NULL, NULL, NULL, 4, 'profile-photos/PIzbMjxu7fzd1EoEV9ZKXYhlL7N4RB88Zp9OgFAK.png', NULL, NULL, '2022-05-17 05:57:53', '2022-05-04 08:30:32', 1),
(6, NULL, 'Josseline Zepeda', 'josseline.zepeda@distribucionesvalencia.hn', NULL, '$2y$10$ZUjs1TkbyXbmOWBYUcAbsuyxzjck8azgVqttekHivtsf8P.SXyV5S', NULL, NULL, NULL, NULL, 'profile-photos/f8oykAbjouztucs0DfgpmIgocTJnDFUP6aEB3H1p.png', NULL, NULL, '2022-07-09 12:38:24', '2022-07-09 12:38:43', 2),
(7, NULL, 'Graylin Quezada', 'graylin.quezada@distribucionesvalencia.hn', NULL, '$2y$10$Rf6umT8tvglETdiXiOWCT.aePblJscvmGXzgLhZx9oSkwngy5cRDa', NULL, NULL, NULL, NULL, 'profile-photos/YiRRR0GMWO74ay5d4z5ObruyV56zSCbUCxd1ev92.png', NULL, NULL, '2022-07-09 12:39:48', '2022-07-09 12:40:04', 2),
(8, NULL, 'Francis Andino', 'francis.andino@distribucionesvalencia.hn', NULL, '$2y$10$TC699zcq/KYQ9ltaicNsgeNJ5frH7ujTmrtwsanGxhH73vPrCVpHK', NULL, NULL, NULL, NULL, 'profile-photos/78Rae3J3XnEwv8gZjaBCpegEb2yVqdDiLyzXpTPt.png', NULL, NULL, '2022-07-09 12:41:42', '2022-07-09 12:41:51', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_has_producto`
--

CREATE TABLE `venta_has_producto` (
  `factura_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `lote` int(11) NOT NULL,
  `seccion_id` int(11) NOT NULL,
  `numero_unidades_resta_inventario` int(11) NOT NULL,
  `resta_inventario_total` int(11) NOT NULL COMMENT 'el total de unidades que se resto al inventario',
  `unidad_medida_venta_id` int(11) NOT NULL,
  `precio_unidad` double NOT NULL,
  `cantidad` double NOT NULL,
  `cantidad_s` double NOT NULL,
  `cantidad_sin_entregar` double NOT NULL,
  `sub_total` double NOT NULL,
  `isv` double NOT NULL,
  `total` double NOT NULL,
  `sub_total_s` double NOT NULL,
  `isv_s` double NOT NULL,
  `total_s` double NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `venta_has_producto`
--

INSERT INTO `venta_has_producto` (`factura_id`, `producto_id`, `lote`, `seccion_id`, `numero_unidades_resta_inventario`, `resta_inventario_total`, `unidad_medida_venta_id`, `precio_unidad`, `cantidad`, `cantidad_s`, `cantidad_sin_entregar`, `sub_total`, `isv`, `total`, `sub_total_s`, `isv_s`, `total_s`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 20, 20, 1, 200, 2, 2, 2, 4000, 600, 4600, 4000, 600, 4600, '2022-07-14 05:07:47', '2022-07-14 05:07:47'),
(2, 4, 2, 17, 20, 20, 3, 7, 20, 20, 20, 140, 21, 161, 140, 21, 161, '2022-07-14 05:13:20', '2022-07-14 05:13:20'),
(3, 12, 3, 17, 50, 50, 12, 15, 50, 50, 50, 750, 112.5, 862.5, 750, 112.5, 862.5, '2022-07-14 05:15:36', '2022-07-14 05:15:36'),
(4, 4, 2, 17, 50, 50, 3, 7, 50, 50, 50, 350, 52.5, 402.5, 350, 52.5, 402.5, '2022-07-14 05:15:54', '2022-07-14 05:15:54'),
(5, 4, 2, 17, 30, 30, 3, 7, 30, 30, 30, 210, 31.5, 241.5, 210, 31.5, 241.5, '2022-07-14 05:16:54', '2022-07-14 05:16:54'),
(6, 12, 3, 17, 20, 20, 12, 14, 20, 20, 20, 280, 42, 322, 280, 42, 322, '2022-07-14 05:18:18', '2022-07-14 05:18:18'),
(7, 1, 1, 1, 10, 10, 2, 117, 10, 10, 10, 1170, 175.5, 1345.5, 1170, 175.5, 1345.5, '2022-07-14 05:19:03', '2022-07-14 05:19:03'),
(8, 12, 3, 17, 50, 50, 12, 14, 50, 50, 50, 700, 105, 805, 700, 105, 805, '2022-07-14 05:19:29', '2022-07-14 05:19:29'),
(9, 12, 3, 17, 25, 25, 12, 14, 25, 25, 25, 350, 52.5, 402.5, 350, 52.5, 402.5, '2022-07-14 05:19:55', '2022-07-14 05:19:55'),
(10, 12, 3, 17, 20, 20, 12, 10, 20, 20, 20, 200, 30, 230, 200, 30, 230, '2022-07-14 05:37:04', '2022-07-14 05:37:04'),
(11, 4, 2, 17, 50, 50, 3, 15, 50, 50, 50, 750, 112.5, 862.5, 750, 112.5, 862.5, '2022-07-14 05:38:04', '2022-07-14 05:38:04'),
(12, 4, 2, 17, 36, 36, 3, 6, 36, 36, 36, 216, 32.4, 248.4, 216, 32.4, 248.4, '2022-07-14 05:40:11', '2022-07-14 05:40:11'),
(13, 12, 3, 17, 20, 20, 12, 16, 20, 20, 20, 320, 48, 368, 320, 48, 368, '2022-07-14 05:41:34', '2022-07-14 05:41:34'),
(14, 4, 2, 17, 37, 37, 3, 7, 37, 37, 37, 259, 38.85, 297.85, 259, 38.85, 297.85, '2022-07-14 05:42:40', '2022-07-14 05:42:40'),
(15, 4, 2, 17, 20, 20, 3, 8, 20, 20, 20, 160, 24, 184, 160, 24, 184, '2022-07-14 05:44:41', '2022-07-14 05:44:41'),
(16, 12, 3, 17, 15, 15, 12, 10, 15, 15, 15, 150, 22.5, 172.5, 150, 22.5, 172.5, '2022-07-14 05:45:35', '2022-07-14 05:45:35'),
(17, 12, 3, 17, 10, 10, 12, 15, 10, 10, 10, 150, 22.5, 172.5, 150, 22.5, 172.5, '2022-07-14 05:55:08', '2022-07-14 05:55:08'),
(18, 12, 3, 17, 10, 10, 12, 10, 10, 10, 10, 100, 15, 115, 100, 15, 115, '2022-07-14 05:56:08', '2022-07-14 05:56:08'),
(19, 12, 3, 17, 10, 10, 12, 15, 10, 10, 10, 150, 22.5, 172.5, 150, 22.5, 172.5, '2022-07-14 05:56:54', '2022-07-14 05:56:54'),
(20, 4, 2, 17, 57, 57, 3, 7, 57, 57, 57, 399, 59.85, 458.85, 399, 59.85, 458.85, '2022-07-14 05:58:39', '2022-07-14 05:58:39'),
(21, 1, 1, 1, 20, 20, 2, 150, 20, 20, 20, 3000, 450, 3450, 3000, 450, 3450, '2022-07-14 05:59:55', '2022-07-14 05:59:55'),
(22, 4, 2, 17, 10, 10, 3, 7, 10, 10, 10, 70, 10.5, 80.5, 70, 10.5, 80.5, '2022-07-14 06:50:47', '2022-07-14 06:50:47'),
(23, 12, 3, 17, 30, 30, 12, 15, 30, 30, 30, 450, 67.5, 517.5, 450, 67.5, 517.5, '2022-07-14 06:51:40', '2022-07-14 06:51:40'),
(24, 4, 2, 17, 32, 32, 3, 7, 32, 32, 32, 224, 33.6, 257.6, 224, 33.6, 257.6, '2022-07-14 06:52:21', '2022-07-14 06:52:21'),
(25, 1, 1, 1, 10, 10, 2, 118, 10, 10, 10, 1180, 177, 1357, 1180, 177, 1357, '2022-07-14 06:53:49', '2022-07-14 06:53:49'),
(26, 4, 2, 17, 30, 30, 3, 7, 30, 30, 30, 210, 31.5, 241.5, 210, 31.5, 241.5, '2022-07-14 06:57:01', '2022-07-14 06:57:01'),
(27, 30, 29, 21, 250, 250, 44, 101.94, 250, 250, 250, 25485, 3822.75, 29307.75, 25485, 3822.75, 29307.75, '2022-07-20 10:17:08', '2022-07-20 10:17:08'),
(28, 1, 1, 1, 20, 20, 2, 150, 20, 20, 20, 3000, 450, 3450, 3000, 450, 3450, '2022-07-20 17:02:25', '2022-07-20 17:02:25'),
(29, 1, 1, 1, 10, 10, 2, 116, 10, 10, 10, 1160, 174, 1160, 1160, 174, 1334, '2022-07-20 17:13:04', '2022-07-20 17:13:04'),
(29, 17, 5, 1, 10, 10, 18, 50, 10, 10, 10, 500, 75, 500, 500, 75, 575, '2022-07-20 17:13:04', '2022-07-20 17:13:04'),
(30, 4, 2, 17, 25, 25, 3, 10, 25, 25, 25, 250, 37.5, 250, 250, 37.5, 287.5, '2022-07-20 17:17:16', '2022-07-20 17:17:16'),
(31, 1, 1, 1, 50, 50, 1, 120, 5, 5, 5, 6000, 900, 6900, 6000, 900, 6900, '2022-07-22 22:06:44', '2022-07-22 22:06:44'),
(32, 1, 1, 1, 50, 50, 1, 120, 5, 5, 5, 6000, 900, 6900, 6000, 900, 6900, '2022-07-22 22:08:42', '2022-07-22 22:08:42'),
(33, 1, 1, 1, 50, 50, 1, 200, 5, 5, 5, 10000, 1500, 11500, 10000, 1500, 11500, '2022-07-22 22:23:14', '2022-07-22 22:23:14'),
(34, 1, 1, 1, 20, 20, 1, 200, 2, 2, 2, 4000, 600, 4000, 4000, 600, 4600, '2022-07-22 23:18:50', '2022-07-22 23:18:50');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ajuste`
--
ALTER TABLE `ajuste`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ajuste_tipo_ajuste1_idx` (`tipo_ajuste_id`),
  ADD KEY `fk_ajuste_users1_idx` (`solicitado_por`),
  ADD KEY `fk_ajuste_recibido_bodega1_idx` (`recibido_bodega_id`),
  ADD KEY `fk_ajuste_producto1_idx` (`producto_id`),
  ADD KEY `fk_ajuste_users2_idx` (`users_id`),
  ADD KEY `fk_ajuste_unidad_medida_venta1_idx` (`unidad_medida_venta_id`);

--
-- Indices de la tabla `banco`
--
ALTER TABLE `banco`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_banco_users1_idx` (`users_id`);

--
-- Indices de la tabla `bodega`
--
ALTER TABLE `bodega`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bodega_estado1_idx` (`estado_id`),
  ADD KEY `fk_bodega_municipio1_idx` (`municipio_id`),
  ADD KEY `fk_bodega_users1_idx` (`encargado_bodega`);

--
-- Indices de la tabla `cai`
--
ALTER TABLE `cai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_CAI_tipo_documento_fiscal1_idx` (`tipo_documento_fiscal_id`),
  ADD KEY `fk_CAI_estado1_idx` (`estado_id`),
  ADD KEY `fk_cai_users1_idx` (`users_id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url_imagen_UNIQUE` (`url_imagen`),
  ADD KEY `fk_cliente_tipo_cliente1_idx` (`tipo_cliente_id`),
  ADD KEY `fk_cliente_tipo_personalidad1_idx` (`tipo_personalidad_id`),
  ADD KEY `fk_cliente_categoria1_idx` (`categoria_id`),
  ADD KEY `fk_cliente_users1_idx` (`users_id`),
  ADD KEY `fk_cliente_users2_idx` (`vendedor`),
  ADD KEY `fk_cliente_estado_cliente1_idx` (`estado_cliente_id`),
  ADD KEY `fk_cliente_municipio1_idx` (`municipio_id`);

--
-- Indices de la tabla `codigo_exoneracion`
--
ALTER TABLE `codigo_exoneracion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_codigo_exoneracion_cliente1_idx` (`cliente_id`),
  ADD KEY `fk_codigo_exoneracion_estado1_idx` (`estado_id`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_compra_proveedores1_idx` (`proveedores_id`),
  ADD KEY `fk_compra_users1_idx` (`users_id`),
  ADD KEY `fk_compra_tipo_compra1_idx` (`tipo_compra_id`),
  ADD KEY `fk_compra_retenciones1_idx` (`retenciones_id`),
  ADD KEY `fk_compra_estado_compra1_idx` (`estado_compra_id`),
  ADD KEY `fk_compra_cai1_idx` (`cai_id`);

--
-- Indices de la tabla `compra_has_producto`
--
ALTER TABLE `compra_has_producto`
  ADD PRIMARY KEY (`compra_id`,`producto_id`),
  ADD KEY `fk_compra_has_producto_producto1_idx` (`producto_id`),
  ADD KEY `fk_compra_has_producto_compra1_idx` (`compra_id`),
  ADD KEY `fk_compra_has_producto_unidad_medida1_idx` (`unidad_compra_id`);

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_contacto_cliente1_idx` (`cliente_id`),
  ADD KEY `fk_contacto_estado1_idx` (`estado_id`);

--
-- Indices de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cotizacion_cliente1_idx` (`cliente_id`),
  ADD KEY `fk_cotizacion_tipo_venta1_idx` (`tipo_venta_id`),
  ADD KEY `fk_cotizacion_users1_idx` (`users_id`);

--
-- Indices de la tabla `cotizacion_has_producto`
--
ALTER TABLE `cotizacion_has_producto`
  ADD PRIMARY KEY (`cotizacion_id`,`producto_id`),
  ADD KEY `fk_cotizacion_has_producto_producto1_idx` (`producto_id`),
  ADD KEY `fk_cotizacion_has_producto_cotizacion1_idx` (`cotizacion_id`),
  ADD KEY `fk_cotizacion_has_producto_seccion1_idx` (`seccion_id`),
  ADD KEY `fk_cotizacion_has_producto_unidad_medida_venta1_idx` (`unidad_medida_venta_id`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_departamento_pais1_idx` (`pais_id`);

--
-- Indices de la tabla `entrega_programada`
--
ALTER TABLE `entrega_programada`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_entrega_programada_users1_idx` (`users_id`),
  ADD KEY `fk_entrega_programada_venta_has_producto1_idx` (`factura_id`,`producto_id`,`lote`);

--
-- Indices de la tabla `enumeracion`
--
ALTER TABLE `enumeracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado_cliente`
--
ALTER TABLE `estado_cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado_compra`
--
ALTER TABLE `estado_compra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado_factura`
--
ALTER TABLE `estado_factura`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado_producto`
--
ALTER TABLE `estado_producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado_venta`
--
ALTER TABLE `estado_venta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_venta_estado_venta1_idx` (`estado_venta_id`),
  ADD KEY `fk_venta_cliente1_idx` (`cliente_id`),
  ADD KEY `fk_venta_users1_idx` (`vendedor`),
  ADD KEY `fk_venta_tipo_venta1_idx` (`tipo_venta_id`),
  ADD KEY `fk_venta_cai1_idx` (`cai_id`),
  ADD KEY `fk_factura_tipo_pago1_idx` (`tipo_pago_id`),
  ADD KEY `fk_factura_estado_factura1_idx` (`estado_factura_id`),
  ADD KEY `fk_factura_users1_idx` (`users_id`),
  ADD KEY `fk_factura_codigo_exoneracion1_idx` (`codigo_exoneracion_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `img_producto`
--
ALTER TABLE `img_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_img_producto_producto1_idx` (`producto_id`),
  ADD KEY `fk_img_producto_users1_idx` (`users_id`);

--
-- Indices de la tabla `incidencia`
--
ALTER TABLE `incidencia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url_img_UNIQUE` (`url_img`),
  ADD KEY `fk_incidencia_recibido_bodega1_idx` (`recibido_bodega_id`),
  ADD KEY `fk_incidencia_users1_idx` (`users_id`);

--
-- Indices de la tabla `incidencia_compra`
--
ALTER TABLE `incidencia_compra`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url_img_UNIQUE` (`url_img`),
  ADD KEY `fk_incidencia_compra_compra_has_producto1_idx` (`compra_id`,`producto_id`),
  ADD KEY `fk_incidencia_compra_users1_idx` (`users_id`);

--
-- Indices de la tabla `interes`
--
ALTER TABLE `interes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_intereses_estado_venta1_idx` (`estado_venta_id`),
  ADD KEY `fk_intereses_factura1_idx` (`factura_id`),
  ADD KEY `fk_intereses_users1_idx` (`users_id`);

--
-- Indices de la tabla `listado`
--
ALTER TABLE `listado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `log_credito`
--
ALTER TABLE `log_credito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_log_credito_cliente1_idx` (`cliente_id`);

--
-- Indices de la tabla `log_estado`
--
ALTER TABLE `log_estado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_log_estado_compra1_idx` (`compra_id`),
  ADD KEY `fk_log_estado_estado_compra1_idx` (`estado_anterior_compra`),
  ADD KEY `fk_log_estado_users1_idx` (`users_id`);

--
-- Indices de la tabla `log_estado_factura`
--
ALTER TABLE `log_estado_factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_log_estado_factura_factura1_idx` (`factura_id`),
  ADD KEY `fk_log_estado_factura_estado_venta1_idx` (`estado_venta_id_anterior`),
  ADD KEY `fk_log_estado_factura_users1_idx` (`users_id`);

--
-- Indices de la tabla `log_translado`
--
ALTER TABLE `log_translado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_log_translado_recibido_bodega1_idx` (`origen`),
  ADD KEY `fk_log_translado_recibido_bodega2_idx` (`destino`),
  ADD KEY `fk_log_translado_users1_idx` (`users_id`),
  ADD KEY `fk_log_translado_ajuste1_idx` (`ajuste_id`),
  ADD KEY `fk_log_translado_factura1_idx` (`factura_id`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_marca_users1_idx` (`users_id`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_menu_rol1_idx` (`rol_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `motivo_nota_credito`
--
ALTER TABLE `motivo_nota_credito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_motivo_nota_credito_users1_idx` (`users_id`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_municipio_departamento1_idx` (`departamento_id`);

--
-- Indices de la tabla `numero_orden_compra`
--
ALTER TABLE `numero_orden_compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_numero_orden_compra_cliente1_idx` (`cliente_id`),
  ADD KEY `fk_numero_orden_compra_estado1_idx` (`estado_id`),
  ADD KEY `fk_numero_orden_compra_users1_idx` (`users_id`);

--
-- Indices de la tabla `pago_compra`
--
ALTER TABLE `pago_compra`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url_img_UNIQUE` (`url_img`),
  ADD KEY `fk_pagos_compra_users1_idx` (`users_id`),
  ADD KEY `fk_pagos_compra_compra1_idx` (`compra_id`),
  ADD KEY `fk_pago_compra_users1_idx` (`users_id_elimina`),
  ADD KEY `fk_pago_compra_estado1_idx` (`estado_id`);

--
-- Indices de la tabla `pago_venta`
--
ALTER TABLE `pago_venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pago_venta_factura1_idx` (`factura_id`),
  ADD KEY `fk_pago_venta_users1_idx` (`users_id`),
  ADD KEY `fk_pago_venta_estado_venta1_idx` (`estado_venta_id`),
  ADD KEY `fk_pago_venta_users2_idx` (`users_id_elimina`),
  ADD KEY `fk_pago_venta_banco1_idx` (`banco_id`),
  ADD KEY `fk_pago_venta_tipo_pago1_idx` (`tipo_pago_id`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `parametro`
--
ALTER TABLE `parametro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_parametro_users1_idx` (`users_id`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `precios_venta`
--
ALTER TABLE `precios_venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_precios_producto1_idx` (`producto_id`),
  ADD KEY `fk_precios_venta_users1_idx` (`users_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_producto_categoria1_idx` (`categoria_id`),
  ADD KEY `fk_producto_unidad_medida1_idx` (`unidad_medida_compra_id`),
  ADD KEY `fk_producto_users1_idx` (`users_id`),
  ADD KEY `fk_producto_estado_producto1_idx` (`estado_producto_id`),
  ADD KEY `fk_producto_marca1_idx` (`marca_id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_proveedores_users1_idx` (`registrado_por`),
  ADD KEY `fk_proveedores_estado1_idx` (`estado_id`),
  ADD KEY `fk_proveedores_municipio1_idx` (`municipio_id`),
  ADD KEY `fk_proveedores_tipo_personalidad1_idx` (`tipo_personalidad_id`),
  ADD KEY `fk_proveedores_categoria1_idx` (`categoria_id`);

--
-- Indices de la tabla `recibido_bodega`
--
ALTER TABLE `recibido_bodega`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_recibido_bodega_compra_has_producto1_idx` (`compra_id`,`producto_id`),
  ADD KEY `fk_recibido_bodega_seccion1_idx` (`seccion_id`),
  ADD KEY `fk_recibido_bodega_estado1_idx` (`estado_recibido`),
  ADD KEY `fk_recibido_bodega_users1_idx` (`recibido_por`),
  ADD KEY `fk_recibido_bodega_unidad_medida1_idx` (`unidad_compra_id`);

--
-- Indices de la tabla `retenciones`
--
ALTER TABLE `retenciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_retenciones_tipo_retencion1_idx` (`tipo_retencion_id`),
  ADD KEY `fk_retenciones_users1_idx` (`users_id`);

--
-- Indices de la tabla `retenciones_has_proveedores`
--
ALTER TABLE `retenciones_has_proveedores`
  ADD PRIMARY KEY (`retenciones_id`,`proveedores_id`),
  ADD KEY `fk_retenciones_proveedor_has_proveedores_proveedores1_idx` (`proveedores_id`),
  ADD KEY `fk_retenciones_proveedor_has_proveedores_retenciones_provee_idx` (`retenciones_id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `seccion`
--
ALTER TABLE `seccion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_estante_estado1_idx` (`estado_id`),
  ADD KEY `fk_seccion_segmento1_idx` (`segmento_id`);

--
-- Indices de la tabla `segmento`
--
ALTER TABLE `segmento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_segmento_bodega1_idx` (`bodega_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sub_menu`
--
ALTER TABLE `sub_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sub_menu_menu1_idx` (`menu_id`);

--
-- Indices de la tabla `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `team_invitations`
--
ALTER TABLE `team_invitations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `team_user`
--
ALTER TABLE `team_user`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_ajuste`
--
ALTER TABLE `tipo_ajuste`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tipo_ajuste_users1_idx` (`users_id`);

--
-- Indices de la tabla `tipo_cliente`
--
ALTER TABLE `tipo_cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_compra`
--
ALTER TABLE `tipo_compra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_documento_fiscal`
--
ALTER TABLE `tipo_documento_fiscal`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_pago_cobro`
--
ALTER TABLE `tipo_pago_cobro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_pago_venta`
--
ALTER TABLE `tipo_pago_venta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_personalidad`
--
ALTER TABLE `tipo_personalidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_retencion`
--
ALTER TABLE `tipo_retencion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_venta`
--
ALTER TABLE `tipo_venta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `unidad_medida_venta`
--
ALTER TABLE `unidad_medida_venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_unidad_medida_venta_producto1_idx` (`producto_id`),
  ADD KEY `fk_unidad_medida_venta_unidad_medida1_idx` (`unidad_medida_id`),
  ADD KEY `fk_unidad_medida_venta_estado1_idx` (`estado_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_rol1_idx` (`rol_id`);

--
-- Indices de la tabla `venta_has_producto`
--
ALTER TABLE `venta_has_producto`
  ADD PRIMARY KEY (`factura_id`,`producto_id`,`lote`),
  ADD KEY `fk_venta_has_producto_recibido_bodega1_idx` (`lote`),
  ADD KEY `fk_venta_has_producto_factura1_idx` (`factura_id`),
  ADD KEY `fk_venta_has_producto_producto1_idx` (`producto_id`),
  ADD KEY `fk_venta_has_producto_unidad_medida_venta1_idx` (`unidad_medida_venta_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ajuste`
--
ALTER TABLE `ajuste`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `banco`
--
ALTER TABLE `banco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `bodega`
--
ALTER TABLE `bodega`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `cai`
--
ALTER TABLE `cai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `codigo_exoneracion`
--
ALTER TABLE `codigo_exoneracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `contacto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `entrega_programada`
--
ALTER TABLE `entrega_programada`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `enumeracion`
--
ALTER TABLE `enumeracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `estado_cliente`
--
ALTER TABLE `estado_cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado_compra`
--
ALTER TABLE `estado_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado_factura`
--
ALTER TABLE `estado_factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado_producto`
--
ALTER TABLE `estado_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado_venta`
--
ALTER TABLE `estado_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `img_producto`
--
ALTER TABLE `img_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `incidencia`
--
ALTER TABLE `incidencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `incidencia_compra`
--
ALTER TABLE `incidencia_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `interes`
--
ALTER TABLE `interes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `listado`
--
ALTER TABLE `listado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `log_credito`
--
ALTER TABLE `log_credito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `log_estado`
--
ALTER TABLE `log_estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `log_estado_factura`
--
ALTER TABLE `log_estado_factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `log_translado`
--
ALTER TABLE `log_translado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `motivo_nota_credito`
--
ALTER TABLE `motivo_nota_credito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `municipio`
--
ALTER TABLE `municipio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=299;

--
-- AUTO_INCREMENT de la tabla `numero_orden_compra`
--
ALTER TABLE `numero_orden_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pago_compra`
--
ALTER TABLE `pago_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pago_venta`
--
ALTER TABLE `pago_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `precios_venta`
--
ALTER TABLE `precios_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `recibido_bodega`
--
ALTER TABLE `recibido_bodega`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `retenciones`
--
ALTER TABLE `retenciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `seccion`
--
ALTER TABLE `seccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `segmento`
--
ALTER TABLE `segmento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `sub_menu`
--
ALTER TABLE `sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tipo_ajuste`
--
ALTER TABLE `tipo_ajuste`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipo_cliente`
--
ALTER TABLE `tipo_cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_compra`
--
ALTER TABLE `tipo_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_pago_cobro`
--
ALTER TABLE `tipo_pago_cobro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_pago_venta`
--
ALTER TABLE `tipo_pago_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_personalidad`
--
ALTER TABLE `tipo_personalidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_retencion`
--
ALTER TABLE `tipo_retencion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_venta`
--
ALTER TABLE `tipo_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `unidad_medida_venta`
--
ALTER TABLE `unidad_medida_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ajuste`
--
ALTER TABLE `ajuste`
  ADD CONSTRAINT `fk_ajuste_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ajuste_recibido_bodega1` FOREIGN KEY (`recibido_bodega_id`) REFERENCES `recibido_bodega` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ajuste_tipo_ajuste1` FOREIGN KEY (`tipo_ajuste_id`) REFERENCES `tipo_ajuste` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ajuste_unidad_medida_venta1` FOREIGN KEY (`unidad_medida_venta_id`) REFERENCES `unidad_medida_venta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ajuste_users1` FOREIGN KEY (`solicitado_por`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ajuste_users2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `banco`
--
ALTER TABLE `banco`
  ADD CONSTRAINT `fk_banco_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `bodega`
--
ALTER TABLE `bodega`
  ADD CONSTRAINT `fk_bodega_estado1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bodega_municipio1` FOREIGN KEY (`municipio_id`) REFERENCES `municipio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bodega_users1` FOREIGN KEY (`encargado_bodega`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cai`
--
ALTER TABLE `cai`
  ADD CONSTRAINT `fk_CAI_estado1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_CAI_tipo_documento_fiscal1` FOREIGN KEY (`tipo_documento_fiscal_id`) REFERENCES `tipo_documento_fiscal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cai_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cliente_categoria1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cliente_estado_cliente1` FOREIGN KEY (`estado_cliente_id`) REFERENCES `estado_cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cliente_municipio1` FOREIGN KEY (`municipio_id`) REFERENCES `municipio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cliente_tipo_cliente1` FOREIGN KEY (`tipo_cliente_id`) REFERENCES `tipo_cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cliente_tipo_personalidad1` FOREIGN KEY (`tipo_personalidad_id`) REFERENCES `tipo_personalidad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cliente_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cliente_users2` FOREIGN KEY (`vendedor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `codigo_exoneracion`
--
ALTER TABLE `codigo_exoneracion`
  ADD CONSTRAINT `fk_codigo_exoneracion_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_codigo_exoneracion_estado1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `fk_compra_cai1` FOREIGN KEY (`cai_id`) REFERENCES `cai` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_compra_estado_compra1` FOREIGN KEY (`estado_compra_id`) REFERENCES `estado_compra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_compra_proveedores1` FOREIGN KEY (`proveedores_id`) REFERENCES `proveedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_compra_retenciones1` FOREIGN KEY (`retenciones_id`) REFERENCES `retenciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_compra_tipo_compra1` FOREIGN KEY (`tipo_compra_id`) REFERENCES `tipo_compra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_compra_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `compra_has_producto`
--
ALTER TABLE `compra_has_producto`
  ADD CONSTRAINT `fk_compra_has_producto_compra1` FOREIGN KEY (`compra_id`) REFERENCES `compra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_compra_has_producto_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_compra_has_producto_unidad_medida1` FOREIGN KEY (`unidad_compra_id`) REFERENCES `unidad_medida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD CONSTRAINT `fk_contacto_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_contacto_estado1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD CONSTRAINT `fk_cotizacion_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cotizacion_tipo_venta1` FOREIGN KEY (`tipo_venta_id`) REFERENCES `tipo_venta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cotizacion_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cotizacion_has_producto`
--
ALTER TABLE `cotizacion_has_producto`
  ADD CONSTRAINT `fk_cotizacion_has_producto_cotizacion1` FOREIGN KEY (`cotizacion_id`) REFERENCES `cotizacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cotizacion_has_producto_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cotizacion_has_producto_seccion1` FOREIGN KEY (`seccion_id`) REFERENCES `seccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cotizacion_has_producto_unidad_medida_venta1` FOREIGN KEY (`unidad_medida_venta_id`) REFERENCES `unidad_medida_venta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `fk_departamento_pais1` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `entrega_programada`
--
ALTER TABLE `entrega_programada`
  ADD CONSTRAINT `fk_entrega_programada_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_entrega_programada_venta_has_producto1` FOREIGN KEY (`factura_id`,`producto_id`,`lote`) REFERENCES `venta_has_producto` (`factura_id`, `producto_id`, `lote`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `fk_factura_codigo_exoneracion1` FOREIGN KEY (`codigo_exoneracion_id`) REFERENCES `codigo_exoneracion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_factura_estado_factura1` FOREIGN KEY (`estado_factura_id`) REFERENCES `estado_factura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_factura_tipo_pago1` FOREIGN KEY (`tipo_pago_id`) REFERENCES `tipo_pago_venta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_factura_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_cai1` FOREIGN KEY (`cai_id`) REFERENCES `cai` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_estado_venta1` FOREIGN KEY (`estado_venta_id`) REFERENCES `estado_venta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_tipo_venta1` FOREIGN KEY (`tipo_venta_id`) REFERENCES `tipo_venta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_users1` FOREIGN KEY (`vendedor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `img_producto`
--
ALTER TABLE `img_producto`
  ADD CONSTRAINT `fk_img_producto_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_img_producto_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `incidencia`
--
ALTER TABLE `incidencia`
  ADD CONSTRAINT `fk_incidencia_recibido_bodega1` FOREIGN KEY (`recibido_bodega_id`) REFERENCES `recibido_bodega` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_incidencia_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `incidencia_compra`
--
ALTER TABLE `incidencia_compra`
  ADD CONSTRAINT `fk_incidencia_compra_compra_has_producto1` FOREIGN KEY (`compra_id`,`producto_id`) REFERENCES `compra_has_producto` (`compra_id`, `producto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_incidencia_compra_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `interes`
--
ALTER TABLE `interes`
  ADD CONSTRAINT `fk_intereses_estado_venta1` FOREIGN KEY (`estado_venta_id`) REFERENCES `estado_venta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_intereses_factura1` FOREIGN KEY (`factura_id`) REFERENCES `factura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_intereses_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `log_credito`
--
ALTER TABLE `log_credito`
  ADD CONSTRAINT `fk_log_credito_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `log_estado`
--
ALTER TABLE `log_estado`
  ADD CONSTRAINT `fk_log_estado_compra1` FOREIGN KEY (`compra_id`) REFERENCES `compra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_log_estado_estado_compra1` FOREIGN KEY (`estado_anterior_compra`) REFERENCES `estado_compra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_log_estado_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `log_estado_factura`
--
ALTER TABLE `log_estado_factura`
  ADD CONSTRAINT `fk_log_estado_factura_estado_venta1` FOREIGN KEY (`estado_venta_id_anterior`) REFERENCES `estado_venta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_log_estado_factura_factura1` FOREIGN KEY (`factura_id`) REFERENCES `factura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_log_estado_factura_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `log_translado`
--
ALTER TABLE `log_translado`
  ADD CONSTRAINT `fk_log_translado_ajuste1` FOREIGN KEY (`ajuste_id`) REFERENCES `ajuste` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_log_translado_factura1` FOREIGN KEY (`factura_id`) REFERENCES `factura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_log_translado_recibido_bodega1` FOREIGN KEY (`origen`) REFERENCES `recibido_bodega` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_log_translado_recibido_bodega2` FOREIGN KEY (`destino`) REFERENCES `recibido_bodega` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_log_translado_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `marca`
--
ALTER TABLE `marca`
  ADD CONSTRAINT `fk_marca_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `fk_menu_rol1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `motivo_nota_credito`
--
ALTER TABLE `motivo_nota_credito`
  ADD CONSTRAINT `fk_motivo_nota_credito_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `fk_municipio_departamento1` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `numero_orden_compra`
--
ALTER TABLE `numero_orden_compra`
  ADD CONSTRAINT `fk_numero_orden_compra_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_numero_orden_compra_estado1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_numero_orden_compra_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pago_compra`
--
ALTER TABLE `pago_compra`
  ADD CONSTRAINT `fk_pago_compra_estado1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pago_compra_users1` FOREIGN KEY (`users_id_elimina`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pagos_compra_compra1` FOREIGN KEY (`compra_id`) REFERENCES `compra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pagos_compra_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pago_venta`
--
ALTER TABLE `pago_venta`
  ADD CONSTRAINT `fk_pago_venta_banco1` FOREIGN KEY (`banco_id`) REFERENCES `banco` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pago_venta_estado_venta1` FOREIGN KEY (`estado_venta_id`) REFERENCES `estado_venta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pago_venta_factura1` FOREIGN KEY (`factura_id`) REFERENCES `factura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pago_venta_tipo_pago1` FOREIGN KEY (`tipo_pago_id`) REFERENCES `tipo_pago_cobro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pago_venta_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pago_venta_users2` FOREIGN KEY (`users_id_elimina`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `parametro`
--
ALTER TABLE `parametro`
  ADD CONSTRAINT `fk_parametro_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `precios_venta`
--
ALTER TABLE `precios_venta`
  ADD CONSTRAINT `fk_precios_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_precios_venta_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_categoria1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_estado_producto1` FOREIGN KEY (`estado_producto_id`) REFERENCES `estado_producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_marca1` FOREIGN KEY (`marca_id`) REFERENCES `marca` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_unidad_medida1` FOREIGN KEY (`unidad_medida_compra_id`) REFERENCES `unidad_medida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `fk_proveedores_categoria1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proveedores_estado1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proveedores_municipio1` FOREIGN KEY (`municipio_id`) REFERENCES `municipio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proveedores_tipo_personalidad1` FOREIGN KEY (`tipo_personalidad_id`) REFERENCES `tipo_personalidad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proveedores_users1` FOREIGN KEY (`registrado_por`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `recibido_bodega`
--
ALTER TABLE `recibido_bodega`
  ADD CONSTRAINT `fk_recibido_bodega_compra_has_producto1` FOREIGN KEY (`compra_id`,`producto_id`) REFERENCES `compra_has_producto` (`compra_id`, `producto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_recibido_bodega_estado1` FOREIGN KEY (`estado_recibido`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_recibido_bodega_seccion1` FOREIGN KEY (`seccion_id`) REFERENCES `seccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_recibido_bodega_unidad_medida1` FOREIGN KEY (`unidad_compra_id`) REFERENCES `unidad_medida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_recibido_bodega_users1` FOREIGN KEY (`recibido_por`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `retenciones`
--
ALTER TABLE `retenciones`
  ADD CONSTRAINT `fk_retenciones_tipo_retencion1` FOREIGN KEY (`tipo_retencion_id`) REFERENCES `tipo_retencion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_retenciones_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `retenciones_has_proveedores`
--
ALTER TABLE `retenciones_has_proveedores`
  ADD CONSTRAINT `fk_retenciones_proveedor_has_proveedores_proveedores1` FOREIGN KEY (`proveedores_id`) REFERENCES `proveedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_retenciones_proveedor_has_proveedores_retenciones_proveedor1` FOREIGN KEY (`retenciones_id`) REFERENCES `retenciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `seccion`
--
ALTER TABLE `seccion`
  ADD CONSTRAINT `fk_estante_estado1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_seccion_segmento1` FOREIGN KEY (`segmento_id`) REFERENCES `segmento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `segmento`
--
ALTER TABLE `segmento`
  ADD CONSTRAINT `fk_segmento_bodega1` FOREIGN KEY (`bodega_id`) REFERENCES `bodega` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sub_menu`
--
ALTER TABLE `sub_menu`
  ADD CONSTRAINT `fk_sub_menu_menu1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipo_ajuste`
--
ALTER TABLE `tipo_ajuste`
  ADD CONSTRAINT `fk_tipo_ajuste_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `unidad_medida_venta`
--
ALTER TABLE `unidad_medida_venta`
  ADD CONSTRAINT `fk_unidad_medida_venta_estado1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_unidad_medida_venta_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_unidad_medida_venta_unidad_medida1` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_rol1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `venta_has_producto`
--
ALTER TABLE `venta_has_producto`
  ADD CONSTRAINT `fk_venta_has_producto_factura1` FOREIGN KEY (`factura_id`) REFERENCES `factura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_has_producto_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_has_producto_recibido_bodega1` FOREIGN KEY (`lote`) REFERENCES `recibido_bodega` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_has_producto_unidad_medida_venta1` FOREIGN KEY (`unidad_medida_venta_id`) REFERENCES `unidad_medida_venta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
