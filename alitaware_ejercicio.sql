--
-- Base de datos: `alitaware_ejercicio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `id_equipo` int(10) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `cant_miembros` int(5) NOT NULL DEFAULT '0',
  `id_usuario` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`id_equipo`, `nombre`, `cant_miembros`, `id_usuario`) VALUES
(1, 'Team de Juan', 4, 1),
(2, 'Team de Ale', 3, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_conexion`
--

CREATE TABLE `historial_conexion` (
  `id_conexion` int(11) NOT NULL,
  `latitud` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `longitud` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `historial_conexion`
--

INSERT INTO `historial_conexion` (`id_conexion`, `latitud`, `longitud`, `fecha_hora`, `id_usuario`) VALUES
(1, '-27.369678', '-55.911204', '2020-08-17 10:00:00', 1),
(2, '-27.364304', '-55.911478', '2020-08-19 18:30:00', 1),
(3, '-27.367778', '-55.912771', '2020-08-19 16:24:00', 1),
(4, '-27.472733', '-58.810596', '2020-08-24 17:10:00', 5),
(5, '-27.446963', '-58.986187', '2020-08-22 15:30:00', 5),
(6, '-26.789987', '-65.023001', '2020-08-24 11:13:00', 2),
(7, '-33.461802', '-66.351366', '2020-08-17 05:20:00', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id_pago` int(10) NOT NULL,
  `periodo` varchar(7) COLLATE utf8_spanish_ci NOT NULL,
  `total` float NOT NULL,
  `fecha` datetime NOT NULL,
  `id_usuario` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`id_pago`, `periodo`, `total`, `fecha`, `id_usuario`) VALUES
(1, '08/2020', 260, '2020-08-24 10:00:00', 1),
(2, '08/2020', 435, '2020-08-21 09:32:00', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_detalle`
--

CREATE TABLE `pago_detalle` (
  `id_pago_detalle` int(11) NOT NULL,
  `precio` float NOT NULL,
  `id_servicio` int(10) NOT NULL,
  `id_pago` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pago_detalle`
--

INSERT INTO `pago_detalle` (`id_pago_detalle`, `precio`, `id_servicio`, `id_pago`) VALUES
(1, 260, 1, 1),
(2, 225, 3, 2),
(3, 210, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precio_suscripcion`
--

CREATE TABLE `precio_suscripcion` (
  `id_precio_suscripcion` int(10) NOT NULL,
  `min_usuarios` int(11) DEFAULT NULL,
  `max_usuarios` int(11) DEFAULT NULL,
  `precio_usuario` float NOT NULL,
  `id_servicio` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `precio_suscripcion`
--

INSERT INTO `precio_suscripcion` (`id_precio_suscripcion`, `min_usuarios`, `max_usuarios`, `precio_usuario`, `id_servicio`) VALUES
(1, 1, 5, 65, 1),
(2, 6, 25, 50, 1),
(3, 26, 100, 30, 1),
(4, 1, 5, 75, 3),
(5, 6, 25, 60, 3),
(6, 26, 100, 50, 3),
(7, 1, 1, 90, 2),
(8, 2, 2, 80, 2),
(9, 3, 3, 70, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id_servicio` int(10) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id_servicio`, `nombre`) VALUES
(1, 'Juego 3D'),
(2, 'Publicación Digital'),
(3, 'App');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suscripcion`
--

CREATE TABLE `suscripcion` (
  `id_usuario` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `suscripcion`
--

INSERT INTO `suscripcion` (`id_usuario`, `id_servicio`, `fecha`) VALUES
(1, 1, '2020-08-23 19:19:08'),
(5, 2, '2020-08-23 19:19:08'),
(5, 3, '2020-08-23 19:19:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(10) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `dni` varchar(10) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `apellido`, `dni`) VALUES
(1, 'Juan', 'Lopez', '10277962'),
(2, 'Pedro', 'Gimenez', '30949045'),
(3, 'Gonzalo', 'Acosta', '29456745'),
(4, 'Victor', 'Schmidt', '34445670'),
(5, 'Alejandro', 'Barreiro', '17662451'),
(6, 'Vilma', 'Zayas', '29551321'),
(7, 'Carlos', 'Chemes', '28747654');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_equipo`
--

CREATE TABLE `usuario_equipo` (
  `id_usuario` int(10) NOT NULL,
  `id_equipo` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario_equipo`
--

INSERT INTO `usuario_equipo` (`id_usuario`, `id_equipo`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 2),
(6, 2),
(7, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`id_equipo`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `historial_conexion`
--
ALTER TABLE `historial_conexion`
  ADD PRIMARY KEY (`id_conexion`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `pago_detalle`
--
ALTER TABLE `pago_detalle`
  ADD PRIMARY KEY (`id_pago_detalle`),
  ADD KEY `id_pago` (`id_pago`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `precio_suscripcion`
--
ALTER TABLE `precio_suscripcion`
  ADD PRIMARY KEY (`id_precio_suscripcion`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `suscripcion`
--
ALTER TABLE `suscripcion`
  ADD PRIMARY KEY (`id_usuario`,`id_servicio`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `usuario_equipo`
--
ALTER TABLE `usuario_equipo`
  ADD PRIMARY KEY (`id_usuario`,`id_equipo`),
  ADD KEY `id_equipo` (`id_equipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `id_equipo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `historial_conexion`
--
ALTER TABLE `historial_conexion`
  MODIFY `id_conexion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pago_detalle`
--
ALTER TABLE `pago_detalle`
  MODIFY `id_pago_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `precio_suscripcion`
--
ALTER TABLE `precio_suscripcion`
  MODIFY `id_precio_suscripcion` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id_servicio` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `historial_conexion`
--
ALTER TABLE `historial_conexion`
  ADD CONSTRAINT `historial_conexion_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `pago_detalle`
--
ALTER TABLE `pago_detalle`
  ADD CONSTRAINT `pago_detalle_ibfk_1` FOREIGN KEY (`id_pago`) REFERENCES `pago` (`id_pago`),
  ADD CONSTRAINT `pago_detalle_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`);

--
-- Filtros para la tabla `precio_suscripcion`
--
ALTER TABLE `precio_suscripcion`
  ADD CONSTRAINT `precio_suscripcion_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`);

--
-- Filtros para la tabla `suscripcion`
--
ALTER TABLE `suscripcion`
  ADD CONSTRAINT `suscripcion_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `suscripcion_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`);

--
-- Filtros para la tabla `usuario_equipo`
--
ALTER TABLE `usuario_equipo`
  ADD CONSTRAINT `usuario_equipo_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `equipo` (`id_equipo`),
  ADD CONSTRAINT `usuario_equipo_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

