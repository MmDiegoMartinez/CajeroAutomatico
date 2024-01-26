-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-12-2023 a las 23:27:38
-- Versión del servidor: 10.4.32-MariaDB-log
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cajerobd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

CREATE TABLE `cuentas` (
  `Id_Cuenta` bigint(20) NOT NULL,
  `Num_Usu` bigint(20) DEFAULT NULL,
  `Saldo` decimal(10,2) DEFAULT 0.00,
  `NIP` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cuentas`
--

INSERT INTO `cuentas` (`Id_Cuenta`, `Num_Usu`, `Saldo`, `NIP`) VALUES
(1068765432, 10013, 0.00, '4847'),
(1095765432, 10020, 800.00, '2705'),
(1234867890, 10024, 45070.25, '8711'),
(1264567890, 10016, 31400.25, '6549'),
(1284567890, 10009, 36000.50, '8561'),
(2355678901, 10018, 60000.75, '4747'),
(2365678901, 10008, 80000.25, '4727'),
(3496789012, 10006, 45000.75, '6899'),
(4325098765, 10019, 25000.00, '8741'),
(4381098765, 10011, 20000.00, '6759'),
(4527890123, 10000, 75000.50, '5748'),
(5432809876, 10022, 15000.75, '0673'),
(5462109876, 10003, 90000.00, '3726'),
(5462709876, 10014, 40000.75, '8871'),
(5688901234, 10010, 95000.75, '2805'),
(6563210987, 10004, 30000.25, '7710'),
(7860123456, 10005, 60000.50, '2735'),
(8765432109, 10015, 10000.00, '2845'),
(8765532109, 10021, 70000.50, '6349'),
(8765832109, 10023, 90000.00, '4557'),
(8795432109, 10012, 55000.25, '0543'),
(8951234567, 10017, 85000.50, '0743'),
(8961234567, 10007, 15000.00, '0873'),
(9846543210, 10000, 25000.00, '1244'),
(9850123456, 10002, 11970.75, '9742');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transacciones`
--

CREATE TABLE `transacciones` (
  `ID_Transaccion` bigint(20) NOT NULL,
  `Id_Cuenta` bigint(20) DEFAULT NULL,
  `Tipo_Movimiento` varchar(20) DEFAULT NULL,
  `Monto` decimal(10,2) DEFAULT NULL,
  `Fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `transacciones`
--

INSERT INTO `transacciones` (`ID_Transaccion`, `Id_Cuenta`, `Tipo_Movimiento`, `Monto`, `Fecha`) VALUES
(6, 1068765432, 'Depósito', 20.00, '2023-11-19 07:48:07'),
(7, 1068765432, 'Depósito', 50.00, '2023-11-19 07:48:18'),
(8, 1068765432, 'Depósito', 50.00, '2023-11-19 07:56:55'),
(9, 1068765432, 'Transferencia', 1000.00, '2023-11-19 07:57:36'),
(10, 1068765432, 'Depósito', 800.00, '2023-11-19 08:01:27'),
(11, 1068765432, 'Transferencia', 400.00, '2023-11-19 08:01:39'),
(13, 1068765432, 'Retiro', 999999.00, '2023-11-19 08:02:50'),
(14, 1068765432, 'Depósito', 20.00, '2023-11-19 08:05:37'),
(15, 1068765432, 'Depósito', 20.00, '2023-11-19 08:06:08'),
(16, 1068765432, 'Transferencia', 500.00, '2023-11-19 08:09:57'),
(17, 1068765432, 'Transferencia', 500.00, '2023-11-19 08:10:18'),
(18, 1068765432, 'Retiro', 50000.00, '2023-11-19 08:10:26'),
(19, 1068765432, 'Retiro', 50000.00, '2023-11-19 08:10:42'),
(20, 1068765432, 'Retiro', 9883301.00, '2023-11-19 08:10:56'),
(21, 1068765432, 'Retiro', 80000000.00, '2023-11-19 08:11:18'),
(22, 1068765432, 'Retiro', 949715.00, '2023-11-19 08:11:30'),
(23, 1068765432, 'Depósito', 20.00, '2023-11-19 21:07:34'),
(24, 9850123456, 'Depósito', 20.00, '2023-11-19 21:12:45'),
(25, 9850123456, 'Retiro', 50.00, '2023-11-19 21:13:13'),
(26, 1068765432, 'Retiro', 8000000.00, '2023-11-19 22:33:07'),
(27, 1068765432, 'Depósito', 29.50, '2023-11-19 22:34:49'),
(28, 1068765432, 'Depósito', 20.00, '2023-11-20 09:25:31'),
(29, 1068765432, 'Transferencia', 20.00, '2023-11-20 09:26:59'),
(30, 1068765432, 'Depósito', 20.00, '2023-11-20 09:27:19'),
(31, 1068765432, 'Retiro', 50.00, '2023-11-20 09:27:28'),
(32, 1068765432, 'Depósito', 1000.00, '2023-11-20 10:12:14'),
(33, 1068765432, 'Transferencia', 50.00, '2023-11-20 10:19:25'),
(34, 1068765432, 'Retiro', 50.00, '2023-11-20 10:20:49'),
(35, 1068765432, 'Retiro', 50.00, '2023-11-20 10:20:52'),
(36, 1068765432, 'Depósito', 20.00, '2023-11-22 19:34:52'),
(37, 1068765432, 'Retiro', 50.00, '2023-11-22 19:35:09'),
(38, 1095765432, 'Transferencia', 50.00, '2023-11-27 07:33:28'),
(39, 1095765432, 'Transferencia', 197265.00, '2023-11-27 07:35:01'),
(40, 1068765432, 'Retiro', 197735.00, '2023-11-27 07:36:00'),
(41, 1095765432, 'Depósito', 500.00, '2023-11-27 07:36:23'),
(42, 1095765432, 'Transferencia', 500.00, '2023-11-27 07:36:36'),
(43, 1068765432, 'Retiro', 500.00, '2023-11-27 07:38:37'),
(44, 1095765432, 'Depósito', 450.00, '2023-11-27 07:39:13'),
(45, 1095765432, 'Transferencia', 500.00, '2023-11-27 07:39:30'),
(46, 1068765432, 'Retiro', 500.00, '2023-11-27 07:54:07'),
(47, 1095765432, 'Depósito', 500.00, '2023-11-27 07:54:17'),
(48, 1095765432, 'Transferencia', 500.00, '2023-11-27 07:55:07'),
(49, 1095765432, 'Transferencia', 500.00, '2023-11-27 07:56:27'),
(50, 1068765432, 'Retiro', 500.00, '2023-11-27 08:17:55'),
(51, 1095765432, 'Depósito', 500.00, '2023-11-27 08:18:04'),
(52, 1095765432, 'Transferencia', 500.00, '2023-11-27 08:18:30'),
(53, 1068765432, 'Retiro', 500.00, '2023-11-27 08:25:11'),
(54, 1095765432, 'Depósito', 500.00, '2023-11-27 08:26:08'),
(55, 1095765432, 'Transferencia', 500.00, '2023-11-27 08:26:32'),
(56, 1068765432, 'Retiro', 500.00, '2023-11-27 08:43:21'),
(57, 1095765432, 'Depósito', 500.00, '2023-11-27 08:43:31'),
(58, 1095765432, 'Transferencia', 500.00, '2023-11-27 08:43:53'),
(59, 1095765432, 'Depósito', 500.00, '2023-11-29 04:06:52'),
(60, 1095765432, 'Depósito', 50.00, '2023-11-29 04:08:49'),
(61, 1095765432, 'Depósito', 50.00, '2023-11-29 04:32:17'),
(62, 1095765432, 'Depósito', 0.00, '2023-11-29 04:39:35'),
(63, 1095765432, 'Depósito', 0.00, '2023-11-29 04:39:41'),
(64, 1095765432, 'Depósito', 0.00, '2023-11-29 04:39:45'),
(65, 1095765432, 'Depósito', 500.00, '2023-11-29 04:39:56'),
(66, 1095765432, 'Depósito', 50.00, '2023-11-29 04:40:02'),
(67, 1095765432, 'Retiro', 100.00, '2023-11-29 04:40:13'),
(68, 1095765432, 'Retiro', 1000.00, '2023-11-29 04:40:20'),
(69, 1095765432, 'Depósito', 0.00, '2023-11-29 04:40:22'),
(70, 1095765432, 'Depósito', 100.00, '2023-11-29 04:40:29'),
(71, 1095765432, 'Depósito', 400.00, '2023-11-29 04:40:33'),
(72, 1095765432, 'Depósito', 400.00, '2023-11-29 04:41:27'),
(73, 1095765432, 'Depósito', 400.00, '2023-11-29 04:41:39'),
(74, 1095765432, 'Depósito', 400.00, '2023-11-29 04:41:45'),
(75, 1095765432, 'Depósito', 400.00, '2023-11-29 04:42:30'),
(76, 1095765432, 'Depósito', 0.00, '2023-11-29 04:42:50'),
(77, 1095765432, 'Depósito', 100.00, '2023-11-29 04:42:54'),
(78, 1095765432, 'Depósito', 20.00, '2023-11-29 04:43:19'),
(79, 1095765432, 'Depósito', 20.00, '2023-11-29 04:43:26'),
(80, 1095765432, 'Depósito', 20.00, '2023-11-29 04:44:34'),
(81, 1095765432, 'Depósito', 0.00, '2023-11-29 04:44:49'),
(82, 1095765432, 'Depósito', 0.00, '2023-11-29 04:44:55'),
(83, 1095765432, 'Depósito', 20.00, '2023-11-29 04:44:59'),
(84, 1095765432, 'Depósito', 20.00, '2023-11-29 04:45:04'),
(85, 1095765432, 'Depósito', 20.00, '2023-11-29 04:45:09'),
(86, 1095765432, 'Depósito', 20.00, '2023-11-29 04:45:14'),
(87, 1095765432, 'Depósito', 20.00, '2023-11-29 04:45:27'),
(88, 1095765432, 'Depósito', 50.00, '2023-11-29 04:45:31'),
(89, 1095765432, 'Depósito', 90.00, '2023-11-29 04:45:37'),
(90, 1095765432, 'Depósito', 50.00, '2023-11-29 05:27:55'),
(91, 1095765432, 'Depósito', 0.00, '2023-11-29 05:28:38'),
(92, 1095765432, 'Depósito', 50.00, '2023-11-29 05:28:52'),
(93, 1095765432, 'Depósito', 0.00, '2023-11-29 05:29:02'),
(94, 1095765432, 'Depósito', 0.00, '2023-11-29 05:29:05'),
(95, 1095765432, 'Depósito', 100.00, '2023-11-29 05:29:08'),
(96, 1095765432, 'Depósito', 500.00, '2023-11-29 05:29:12'),
(97, 1095765432, 'Transferencia', 500.00, '2023-11-29 05:34:51'),
(98, 1095765432, 'Transferencia', 500.00, '2023-11-29 05:37:21'),
(99, NULL, 'Depósito', 0.00, '2023-11-29 05:37:47'),
(100, 1095765432, 'Transferencia', 5.00, '2023-11-29 05:38:25'),
(101, 1095765432, 'Transferencia', 50.00, '2023-11-29 05:43:34'),
(102, 1095765432, 'Transferencia', 50.00, '2023-11-29 05:53:21'),
(103, 1095765432, 'Transferencia', 50.00, '2023-11-29 05:53:37'),
(104, 1095765432, 'Transferencia', 50.00, '2023-11-29 05:54:28'),
(105, 1095765432, 'Transferencia', 50.00, '2023-11-29 05:54:49'),
(106, 1095765432, 'Transferencia', 50.00, '2023-11-29 06:04:40'),
(107, 1095765432, 'Transferencia', 50.00, '2023-11-29 06:10:01'),
(108, 1095765432, 'Transferencia', 50.00, '2023-11-29 06:10:11'),
(109, 1095765432, 'Transferencia', 50.00, '2023-11-29 06:10:58'),
(110, 1095765432, 'Transferencia', 45.00, '2023-11-29 06:11:05'),
(111, 1095765432, 'Depósito', 0.00, '2023-11-29 06:11:13'),
(112, 1095765432, 'Depósito', 100.00, '2023-11-29 06:11:16'),
(113, 1095765432, 'Depósito', 200.00, '2023-11-29 06:11:20'),
(114, 1095765432, 'Depósito', 0.00, '2023-11-29 06:11:26'),
(115, 1095765432, 'Transferencia', 500.00, '2023-11-29 06:13:49'),
(116, 1068765432, 'Depósito', 0.00, '2023-11-29 06:14:36'),
(117, 1068765432, 'Depósito', 0.00, '2023-11-29 06:14:36'),
(118, 1068765432, 'Depósito', 0.00, '2023-11-29 06:32:52'),
(119, 1068765432, 'Retiro', 2500.00, '2023-11-29 06:33:00'),
(120, 1095765432, 'Transferencia', 50.00, '2023-11-29 06:33:39'),
(121, 1068765432, 'Depósito', 0.00, '2023-11-29 21:00:26'),
(122, 1068765432, 'Depósito', 50.00, '2023-11-29 21:00:32'),
(123, 1068765432, 'Transferencia', 50.00, '2023-11-29 21:01:32'),
(124, 1068765432, 'Transferencia', 20.00, '2023-11-29 21:02:02'),
(125, 1068765432, 'Depósito', 0.00, '2023-11-29 21:02:23'),
(126, 1068765432, 'Depósito', 20.00, '2023-11-29 21:02:26'),
(127, 1068765432, 'Depósito', 0.00, '2023-11-29 21:02:27'),
(128, 1068765432, 'Retiro', 50.00, '2023-11-29 21:02:32'),
(129, 1095765432, 'Transferencia', 20.00, '2023-12-03 20:55:40'),
(130, 1068765432, 'Depósito', 0.00, '2023-12-03 20:57:00'),
(131, 1068765432, 'Depósito', 20.00, '2023-12-03 20:57:07'),
(132, 1068765432, 'Depósito', 0.00, '2023-12-03 20:57:09'),
(133, 1068765432, 'Depósito', 0.00, '2023-12-03 20:57:17'),
(134, 1068765432, 'Depósito', 20.00, '2023-12-03 20:57:20'),
(135, 1068765432, 'Retiro', 60.00, '2023-12-03 20:57:26'),
(136, 1095765432, 'Depósito', 0.00, '2023-12-03 20:57:31'),
(137, 1095765432, 'Depósito', 500.00, '2023-12-03 20:57:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Num_Usu` bigint(20) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Apellidos` varchar(100) DEFAULT NULL,
  `Telefono` bigint(20) DEFAULT NULL,
  `Correo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Num_Usu`, `Nombre`, `Apellidos`, `Telefono`, `Correo`) VALUES
(10000, 'Juan', 'Martínez Santiago', 9511711111, 'juan.martinez@gmail.com'),
(10001, 'Ana', 'López García', 9512222423, 'ana.lopez@hotmail.com'),
(10002, 'Carlos', 'Hernández Pérez', 9513333335, 'carlos.hernandez@gmail.com'),
(10003, 'María', 'Gutiérrez Rodríguez', 9517444447, 'maria.gutierrez@hotmail.com'),
(10004, 'José', 'Jiménez Martínez', 9515515559, 'jose.jimenez@gmail.com'),
(10005, 'Sofía', 'Ramírez Flores', 9516466661, 'sofia.ramirez@hotmail.com'),
(10006, 'Daniel', 'Pérez López', 9517776773, 'daniel.perez@gmail.com'),
(10007, 'Fernanda', 'García Martínez', 9518188885, 'fernanda.garcia@hotmail.com'),
(10008, 'Alejandro', 'Mendoza Herrera', 9519999897, 'alejandro.mendoza@gmail.com'),
(10009, 'Paola', 'Torres Jiménez', 9511010209, 'paola.torres@hotmail.com'),
(10010, 'Arturo', 'Reyes Vásquez', 9511212143, 'arturo.reyes@gmail.com'),
(10011, 'Valentina', 'Núñez Sánchez', 9518313135, 'valentina.nunez@hotmail.com'),
(10012, 'Miguel', 'Ríos Torres', 9511454147, 'miguel.rios@gmail.com'),
(10013, 'Camila', 'Salgado Cruz', 9511515659, 'camila.salgado@hotmail.com'),
(10014, 'Héctor', 'Molina Gómez', 9514616161, 'hector.molina@gmail.com'),
(10015, 'Lucía', 'Gómez Rosales', 9511717123, 'lucia.gomez@hotmail.com'),
(10016, 'Gustavo', 'Ortega Vargas', 9516818185, 'gustavo.ortega@gmail.com'),
(10017, 'Diana', 'Castro Guzmán', 9511919194, 'diana.castro@hotmail.com'),
(10018, 'Ricardo', 'Vega Ramírez', 9512021209, 'ricardo.vega@gmail.com'),
(10019, 'Carmen', 'Maldonado Paredes', 9512121411, 'carmen.maldonado@hotmail.com'),
(10020, 'Eduardo', 'Herrera Ríos', 9513222723, 'eduardo.herrera@gmail.com'),
(10021, 'Isabella', 'Cruz Molina', 9512323635, 'isabella.cruz@hotmail.com'),
(10022, 'Javier', 'Martínez Gómez', 9512428247, 'javier.martinez@gmail.com'),
(10023, 'Luisa', 'Santiago Ortega', 9512526259, 'luisa.santiago@hotmail.com'),
(10024, 'Pedro', 'Flores Vega', 9514626261, 'pedro.flores@gmail.com'),
(10025, 'Renata', 'Paredes Maldonado', 9514727273, 'renata.paredes@hotmail.com'),
(10026, 'Andrés', 'Ramírez Herrera', 9512828265, 'andres.ramirez@gmail.com'),
(10027, 'Ana María', 'Gómez Salgado', 9512929247, 'ana.gomez@hotmail.com'),
(10028, 'Roberto', 'Vargas Ortega', 9513130309, 'roberto.vargas@gmail.com'),
(10029, 'Marina', 'Guzmán Castro', 9513531311, 'marina.guzman@hotmail.com'),
(10030, 'Hugo', 'Ortega Molina', 9513232623, 'hugo.ortega@gmail.com'),
(10031, 'Gabriela', 'Sánchez Mendoza', 9514333375, 'gabriela.sanchez@hotmail.com'),
(10032, 'Diego', 'Jiménez Ríos', 9513434387, 'diego.jimenez@gmail.com'),
(10033, 'Elena', 'Torres Cruz', 9513535359, 'elena.torres@hotmail.com'),
(10034, 'Antonio', 'Pérez Núñez', 9513636661, 'antonio.perez@gmail.com'),
(10035, 'Ximena', 'Martínez Salgado', 9513734373, 'ximena.martinez@hotmail.com'),
(10036, 'Raul', 'Gómez Mendoza', 9514838385, 'raul.gomez@gmail.com'),
(10037, 'Karla', 'Molina Guzmán', 9513939387, 'karla.molina@hotmail.com'),
(10038, 'Fernando', 'Salgado Ortega', 9514050409, 'fernando.salgado@gmail.com'),
(10039, 'Patricia', 'Vega Herrera', 9514141441, 'patricia.vega@hotmail.com'),
(10040, 'Santiago', 'Herrera Gómez', 9514242423, 'santiago.herrera@gmail.com'),
(10041, 'Isabel', 'Vargas Torres', 9515343435, 'isabel.vargas@hotmail.com'),
(10042, 'Marco', 'Torres Maldonado', 9514444647, 'marco.torres@gmail.com'),
(10043, 'Julia', 'Paredes Ramírez', 9514545459, 'julia.paredes@hotmail.com'),
(10044, 'Alberto', 'Maldonado Santiago', 9516646461, 'alberto.maldonado@gmail.com'),
(10045, 'Lorena', 'Herrera Cruz', 9514747473, 'lorena.herrera@hotmail.com'),
(10046, 'Jorge', 'Gómez Salgado', 9514848585, 'jorge.gomez@gmail.com'),
(10047, 'Mariana', 'Molina Ortega', 9516949497, 'mariana.molina@hotmail.com'),
(10048, 'Raúl', 'Salgado Herrera', 9515150509, 'raul.salgado@gmail.com'),
(10049, 'Natalia', 'Vega Torres', 9515151541, 'natalia.vega@hotmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD PRIMARY KEY (`Id_Cuenta`),
  ADD UNIQUE KEY `NIP` (`NIP`),
  ADD KEY `Num_Usu` (`Num_Usu`);

--
-- Indices de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD PRIMARY KEY (`ID_Transaccion`),
  ADD KEY `Id_Cuenta` (`Id_Cuenta`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Num_Usu`),
  ADD UNIQUE KEY `Telefono` (`Telefono`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  MODIFY `ID_Transaccion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Num_Usu` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10050;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD CONSTRAINT `cuentas_ibfk_1` FOREIGN KEY (`Num_Usu`) REFERENCES `usuarios` (`Num_Usu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD CONSTRAINT `transacciones_ibfk_1` FOREIGN KEY (`Id_Cuenta`) REFERENCES `cuentas` (`Id_Cuenta`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
