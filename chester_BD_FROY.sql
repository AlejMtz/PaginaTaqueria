-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-03-2024 a las 04:46:57
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `chester`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`) VALUES
(1, 'Bebidas'),
(2, 'Salsas'),
(3, 'Carne al Pastor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `fecha`) VALUES
(1, '2024-03-29 21:32:35'),
(2, '2024-03-29 21:32:50'),
(3, '2024-03-29 21:33:06'),
(4, '2024-03-29 21:33:23'),
(5, '2024-03-29 21:33:40'),
(6, '2024-03-29 21:33:58'),
(7, '2024-03-29 21:34:11'),
(8, '2024-03-29 21:34:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumos`
--

CREATE TABLE `insumos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `estado` enum('Habilitado','Deshabilitado') DEFAULT 'Habilitado',
  `ID_UnidadMedida` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `insumos`
--

INSERT INTO `insumos` (`id`, `nombre`, `descripcion`, `estado`, `ID_UnidadMedida`) VALUES
(1, 'Carne', 'Lomo de cerdo', 'Deshabilitado', 1),
(2, 'Limones', 'verde', 'Deshabilitado', 1),
(3, 'Aguacate', 'Maduro y entrado', 'Deshabilitado', 1),
(4, 'Chile', 'Jalapeño', 'Deshabilitado', 2),
(5, 'Cebolla', 'Blanca', 'Deshabilitado', 1),
(6, 'Cilantro', 'Manojos', 'Deshabilitado', 2),
(7, 'Azucar', 'Glass', 'Deshabilitado', 1),
(8, 'Naranja', 'Naranja fresca', 'Deshabilitado', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumoscompras`
--

CREATE TABLE `insumoscompras` (
  `id` int(11) NOT NULL,
  `cantidad` float(10,2) NOT NULL,
  `costo` float(10,2) NOT NULL,
  `ID_UnidadMedida` int(10) NOT NULL,
  `ID_Insumo` int(11) NOT NULL,
  `ID_Compra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `insumoscompras`
--

INSERT INTO `insumoscompras` (`id`, `cantidad`, `costo`, `ID_UnidadMedida`, `ID_Insumo`, `ID_Compra`) VALUES
(1, 6.00, 81.33, 1, 1, 1),
(2, 2.00, 61.00, 1, 2, 2),
(3, 4.00, 41.25, 1, 3, 3),
(4, 2.00, 32.50, 1, 4, 4),
(5, 4.00, 41.25, 1, 5, 5),
(6, 2.00, 11.00, 1, 6, 6),
(7, 2.00, 31.00, 1, 7, 7),
(8, 6.00, 27.50, 1, 8, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumosproductos`
--

CREATE TABLE `insumosproductos` (
  `id` int(11) NOT NULL,
  `cantidad` float(10,2) NOT NULL,
  `merma` float(10,2) NOT NULL,
  `ID_UnidadMedida` int(11) NOT NULL,
  `ID_Insumo` int(11) NOT NULL,
  `ID_Producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `insumosproductos`
--

INSERT INTO `insumosproductos` (`id`, `cantidad`, `merma`, `ID_UnidadMedida`, `ID_Insumo`, `ID_Producto`) VALUES
(1, 100.00, 20.00, 2, 1, 1),
(2, 20.00, 5.00, 2, 4, 1),
(3, 5.00, 0.00, 2, 5, 1),
(4, 10.00, 2.00, 2, 6, 1),
(5, 20.00, 2.00, 2, 4, 2),
(6, 200.00, 50.00, 2, 3, 2),
(7, 200.00, 10.00, 2, 5, 2),
(8, 800.00, 200.00, 2, 2, 3),
(9, 100.00, 0.00, 2, 7, 3),
(10, 1000.00, 200.00, 2, 8, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id` int(11) NOT NULL,
  `fechaInventario` datetime NOT NULL,
  `estado` enum('Activo','Terminado') NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id`, `fechaInventario`, `estado`) VALUES
(1, '2024-03-29 21:31:57', 'Terminado'),
(2, '2024-03-29 21:31:57', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventarioinsumos`
--

CREATE TABLE `inventarioinsumos` (
  `id` int(11) NOT NULL,
  `cantidadSistema` float(10,2) NOT NULL,
  `cantidadFisica` float(10,2) NOT NULL,
  `ID_UnidadMedida` int(11) NOT NULL,
  `ajuste` enum('true','false') NOT NULL,
  `observaciones` varchar(100) NOT NULL,
  `ID_Insumo` int(11) NOT NULL,
  `ID_Inventario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventarioinsumos`
--

INSERT INTO `inventarioinsumos` (`id`, `cantidadSistema`, `cantidadFisica`, `ID_UnidadMedida`, `ajuste`, `observaciones`, `ID_Insumo`, `ID_Inventario`) VALUES
(1, 0.00, 10.00, 1, 'true', '', 1, 1),
(2, 0.00, 4.00, 1, 'true', '', 2, 1),
(3, 0.00, 5.00, 1, 'true', '', 3, 1),
(4, 0.00, 800.00, 2, 'true', '', 4, 1),
(5, 0.00, 5.00, 1, 'true', '', 5, 1),
(6, 0.00, 600.00, 2, 'true', '', 6, 1),
(7, 0.00, 4.00, 1, 'true', '', 7, 1),
(8, 0.00, 7.00, 1, 'true', '', 8, 1),
(9, 15.64, 0.00, 1, 'false', '', 1, 2),
(10, 5.00, 0.00, 1, 'false', '', 2, 2),
(11, 9.00, 0.00, 1, 'false', '', 3, 2),
(12, 2725.00, 0.00, 2, 'false', '', 4, 2),
(13, 8.98, 0.00, 1, 'false', '', 5, 2),
(14, 2564.00, 0.00, 2, 'false', '', 6, 2),
(15, 5.90, 0.00, 1, 'false', '', 7, 2),
(16, 10.60, 0.00, 1, 'false', '', 8, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `id` int(11) NOT NULL,
  `NoConsumo` int(11) NOT NULL,
  `estado` enum('En preparacion','Cancelada','Entregada') DEFAULT 'En preparacion'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenproductos`
--

CREATE TABLE `ordenproductos` (
  `id` int(11) NOT NULL,
  `cantidad` float(10,2) NOT NULL,
  `detalleAdicional` varchar(100) NOT NULL,
  `ID_Orden` int(11) NOT NULL,
  `ID_Producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` float(10,2) NOT NULL,
  `estado` enum('Habilitado','Deshabilitado') DEFAULT 'Habilitado',
  `ID_Categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `precio`, `estado`, `ID_Categoria`) VALUES
(1, 'Orden de 3 Tacos al Pastor', 30.00, 'Habilitado', 3),
(2, 'Guacamole Pequeño', 20.00, 'Habilitado', 2),
(3, '1L de Agua de Limón', 30.00, 'Habilitado', 1),
(4, '1L de Jugo de Naranja', 60.00, 'Habilitado', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidadmedidas`
--

CREATE TABLE `unidadmedidas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `unidadmedidas`
--

INSERT INTO `unidadmedidas` (`id`, `nombre`) VALUES
(1, 'kg'),
(2, 'g'),
(3, 'L'),
(4, 'ml');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id` int(11) NOT NULL,
  `NoConsumo` int(11) NOT NULL,
  `precioVenta` float(10,2) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id`, `NoConsumo`, `precioVenta`, `fecha`) VALUES
(1, 1, 240.00, '2024-03-29 21:36:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventaproducto`
--

CREATE TABLE `ventaproducto` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `ID_Producto` int(11) NOT NULL,
  `ID_Venta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventaproducto`
--

INSERT INTO `ventaproducto` (`id`, `cantidad`, `ID_Producto`, `ID_Venta`) VALUES
(1, 1, 1, 1),
(2, 1, 3, 1),
(3, 2, 1, 1),
(4, 2, 4, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `insumos`
--
ALTER TABLE `insumos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ID_UnidadMedida` (`ID_UnidadMedida`);

--
-- Indices de la tabla `insumoscompras`
--
ALTER TABLE `insumoscompras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ID_UnidadMedida` (`ID_UnidadMedida`),
  ADD KEY `ID_Insumo` (`ID_Insumo`),
  ADD KEY `ID_Compra` (`ID_Compra`);

--
-- Indices de la tabla `insumosproductos`
--
ALTER TABLE `insumosproductos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ID_UnidadMedida` (`ID_UnidadMedida`),
  ADD KEY `ID_Insumo` (`ID_Insumo`),
  ADD KEY `ID_Producto` (`ID_Producto`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inventarioinsumos`
--
ALTER TABLE `inventarioinsumos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ID_Insumo` (`ID_Insumo`),
  ADD KEY `ID_Inventario` (`ID_Inventario`),
  ADD KEY `ID_UnidadMedida` (`ID_UnidadMedida`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordenproductos`
--
ALTER TABLE `ordenproductos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ID_Orden` (`ID_Orden`),
  ADD KEY `ID_Producto` (`ID_Producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ID_Categoria` (`ID_Categoria`);

--
-- Indices de la tabla `unidadmedidas`
--
ALTER TABLE `unidadmedidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventaproducto`
--
ALTER TABLE `ventaproducto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ID_Producto` (`ID_Producto`),
  ADD KEY `ID_Venta` (`ID_Venta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `insumos`
--
ALTER TABLE `insumos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `insumoscompras`
--
ALTER TABLE `insumoscompras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `insumosproductos`
--
ALTER TABLE `insumosproductos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `inventarioinsumos`
--
ALTER TABLE `inventarioinsumos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ordenproductos`
--
ALTER TABLE `ordenproductos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `unidadmedidas`
--
ALTER TABLE `unidadmedidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ventaproducto`
--
ALTER TABLE `ventaproducto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `insumos`
--
ALTER TABLE `insumos`
  ADD CONSTRAINT `insumos_ibfk_1` FOREIGN KEY (`ID_UnidadMedida`) REFERENCES `unidadmedidas` (`id`);

--
-- Filtros para la tabla `insumoscompras`
--
ALTER TABLE `insumoscompras`
  ADD CONSTRAINT `insumoscompras_ibfk_1` FOREIGN KEY (`ID_UnidadMedida`) REFERENCES `unidadmedidas` (`id`),
  ADD CONSTRAINT `insumoscompras_ibfk_2` FOREIGN KEY (`ID_Insumo`) REFERENCES `insumos` (`id`),
  ADD CONSTRAINT `insumoscompras_ibfk_3` FOREIGN KEY (`ID_Compra`) REFERENCES `compras` (`id`);

--
-- Filtros para la tabla `insumosproductos`
--
ALTER TABLE `insumosproductos`
  ADD CONSTRAINT `insumosproductos_ibfk_1` FOREIGN KEY (`ID_UnidadMedida`) REFERENCES `unidadmedidas` (`id`),
  ADD CONSTRAINT `insumosproductos_ibfk_2` FOREIGN KEY (`ID_Insumo`) REFERENCES `insumos` (`id`),
  ADD CONSTRAINT `insumosproductos_ibfk_3` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `inventarioinsumos`
--
ALTER TABLE `inventarioinsumos`
  ADD CONSTRAINT `inventarioinsumos_ibfk_1` FOREIGN KEY (`ID_Insumo`) REFERENCES `insumos` (`id`),
  ADD CONSTRAINT `inventarioinsumos_ibfk_2` FOREIGN KEY (`ID_Inventario`) REFERENCES `inventario` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `inventarioinsumos_ibfk_3` FOREIGN KEY (`ID_UnidadMedida`) REFERENCES `unidadmedidas` (`id`);

--
-- Filtros para la tabla `ordenproductos`
--
ALTER TABLE `ordenproductos`
  ADD CONSTRAINT `ordenproductos_ibfk_1` FOREIGN KEY (`ID_Orden`) REFERENCES `orden` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ordenproductos_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`ID_Categoria`) REFERENCES `categoria` (`id`);

--
-- Filtros para la tabla `ventaproducto`
--
ALTER TABLE `ventaproducto`
  ADD CONSTRAINT `ventaproducto_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `ventaproducto_ibfk_2` FOREIGN KEY (`ID_Venta`) REFERENCES `venta` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
