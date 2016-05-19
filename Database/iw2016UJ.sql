-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 19-05-2016 a las 19:32:14
-- Versión del servidor: 5.5.49-0+deb8u1
-- Versión de PHP: 5.6.20-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `iw2016UJ`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE IF NOT EXISTS `ciudad` (
`id` int(11) NOT NULL,
  `nombre` varchar(64) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`id`, `nombre`) VALUES
(1, 'Cai');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `demandante`
--

CREATE TABLE IF NOT EXISTS `demandante` (
`id` int(11) NOT NULL,
  `nombre` varchar(64) NOT NULL,
  `apellidos` varchar(128) NOT NULL,
  `dni` varchar(16) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` varchar(16) NOT NULL,
  `direccion` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `telefono` int(32) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE IF NOT EXISTS `empresa` (
`id` int(11) NOT NULL,
  `cif` varchar(32) NOT NULL,
  `nombre` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `numero_empleados` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `actividad_profesional` varchar(128) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id`, `cif`, `nombre`, `email`, `numero_empleados`, `id_usuario`, `actividad_profesional`) VALUES
(1, '000001', 'EmpresaPrueba', 'prueeab@fdsaf.com', 23, 1, 'En paro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
`id` int(11) NOT NULL,
  `nombre` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `experiencia_profesional`
--

CREATE TABLE IF NOT EXISTS `experiencia_profesional` (
`id` int(11) NOT NULL,
  `nombre_empresa` varchar(128) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `id_puesto_de_trabajo` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formacion_academica`
--

CREATE TABLE IF NOT EXISTS `formacion_academica` (
`id` int(11) NOT NULL,
  `curso` text NOT NULL,
  `idioma` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

CREATE TABLE IF NOT EXISTS `inscripcion` (
`id` int(11) NOT NULL,
  `nombre` varchar(32) NOT NULL,
  `id_oferta_de_trabajo` int(11) NOT NULL,
  `id_demandante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localizacion`
--

CREATE TABLE IF NOT EXISTS `localizacion` (
`id` int(11) NOT NULL,
  `direccion` varchar(128) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oferta_de_trabajo`
--

CREATE TABLE IF NOT EXISTS `oferta_de_trabajo` (
`id` int(11) NOT NULL,
  `tipo_concreto` varchar(32) NOT NULL,
  `sueldo_bruto` float NOT NULL,
  `fecha_inicio` date NOT NULL,
  `vacantes` int(11) NOT NULL,
  `experiencia_previa` int(11) NOT NULL,
  `fecha_de_fin` date NOT NULL,
  `id_estado` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `id_puesto_de_trabajo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oferta_trabajo_titulos`
--

CREATE TABLE IF NOT EXISTS `oferta_trabajo_titulos` (
`id` int(11) NOT NULL,
  `id_oferta_de_trabajo` int(11) NOT NULL,
  `id_titulo_academico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE IF NOT EXISTS `perfil` (
`id` int(11) NOT NULL,
  `foto` varchar(256) NOT NULL,
  `presentacion` text NOT NULL,
  `id_formacion_academica` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puesto_de_trabajo`
--

CREATE TABLE IF NOT EXISTS `puesto_de_trabajo` (
`id` int(11) NOT NULL,
  `nombre` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puesto_trabajo_perfil`
--

CREATE TABLE IF NOT EXISTS `puesto_trabajo_perfil` (
`id` int(11) NOT NULL,
  `id_puesto_de_trabajo` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titulos_academicos`
--

CREATE TABLE IF NOT EXISTS `titulos_academicos` (
`id` int(11) NOT NULL,
  `nombre` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titulos_formacion`
--

CREATE TABLE IF NOT EXISTS `titulos_formacion` (
`id` int(11) NOT NULL,
  `id_titulos_academicos` int(11) NOT NULL,
  `id_formacion_academica` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
`id` int(11) NOT NULL,
  `nombre` varchar(32) NOT NULL,
  `tipo` int(11) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `tipo`, `password`) VALUES
(1, 'prueba', 0, 'prueba');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `demandante`
--
ALTER TABLE `demandante`
 ADD PRIMARY KEY (`id`), ADD KEY `id_perfil` (`id_perfil`), ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `cif` (`cif`), ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `experiencia_profesional`
--
ALTER TABLE `experiencia_profesional`
 ADD PRIMARY KEY (`id`), ADD KEY `id_puesto_de_trabajo` (`id_puesto_de_trabajo`), ADD KEY `id_perfil` (`id_perfil`);

--
-- Indices de la tabla `formacion_academica`
--
ALTER TABLE `formacion_academica`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
 ADD PRIMARY KEY (`id`), ADD KEY `id_oferta_de_trabajo` (`id_oferta_de_trabajo`,`id_demandante`), ADD KEY `id_demandante` (`id_demandante`);

--
-- Indices de la tabla `localizacion`
--
ALTER TABLE `localizacion`
 ADD PRIMARY KEY (`id`), ADD KEY `id_ciudad` (`id_ciudad`), ADD KEY `id_empresa` (`id_empresa`);

--
-- Indices de la tabla `oferta_de_trabajo`
--
ALTER TABLE `oferta_de_trabajo`
 ADD PRIMARY KEY (`id`), ADD KEY `id_estado` (`id_estado`,`id_empresa`), ADD KEY `id_titulos_academicos` (`id_puesto_de_trabajo`), ADD KEY `id_empresa` (`id_empresa`), ADD KEY `id_puesto_de_trabajo` (`id_puesto_de_trabajo`);

--
-- Indices de la tabla `oferta_trabajo_titulos`
--
ALTER TABLE `oferta_trabajo_titulos`
 ADD PRIMARY KEY (`id`), ADD KEY `id_oferta_de_trabajo` (`id_oferta_de_trabajo`,`id_titulo_academico`), ADD KEY `id_titulo_academico` (`id_titulo_academico`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
 ADD PRIMARY KEY (`id`), ADD KEY `id_puesto_de_trabajo` (`id_formacion_academica`), ADD KEY `id_formacion_academica` (`id_formacion_academica`);

--
-- Indices de la tabla `puesto_de_trabajo`
--
ALTER TABLE `puesto_de_trabajo`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `puesto_trabajo_perfil`
--
ALTER TABLE `puesto_trabajo_perfil`
 ADD PRIMARY KEY (`id`), ADD KEY `id_puesto_de_trabajo` (`id_puesto_de_trabajo`,`id_perfil`), ADD KEY `id_perfil` (`id_perfil`);

--
-- Indices de la tabla `titulos_academicos`
--
ALTER TABLE `titulos_academicos`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `titulos_formacion`
--
ALTER TABLE `titulos_formacion`
 ADD PRIMARY KEY (`id`), ADD KEY `id_titulos_academicos` (`id_titulos_academicos`), ADD KEY `id_formacion_academica` (`id_formacion_academica`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nombre` (`nombre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `demandante`
--
ALTER TABLE `demandante`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `experiencia_profesional`
--
ALTER TABLE `experiencia_profesional`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `formacion_academica`
--
ALTER TABLE `formacion_academica`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `localizacion`
--
ALTER TABLE `localizacion`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `oferta_de_trabajo`
--
ALTER TABLE `oferta_de_trabajo`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `oferta_trabajo_titulos`
--
ALTER TABLE `oferta_trabajo_titulos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `puesto_de_trabajo`
--
ALTER TABLE `puesto_de_trabajo`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `puesto_trabajo_perfil`
--
ALTER TABLE `puesto_trabajo_perfil`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `titulos_academicos`
--
ALTER TABLE `titulos_academicos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `titulos_formacion`
--
ALTER TABLE `titulos_formacion`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `demandante`
--
ALTER TABLE `demandante`
ADD CONSTRAINT `demandante_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `demandante_ibfk_1` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empresa`
--
ALTER TABLE `empresa`
ADD CONSTRAINT `empresa_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `experiencia_profesional`
--
ALTER TABLE `experiencia_profesional`
ADD CONSTRAINT `experiencia_profesional_ibfk_1` FOREIGN KEY (`id_puesto_de_trabajo`) REFERENCES `puesto_de_trabajo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `experiencia_profesional_ibfk_2` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
ADD CONSTRAINT `inscripcion_ibfk_1` FOREIGN KEY (`id_oferta_de_trabajo`) REFERENCES `oferta_de_trabajo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `inscripcion_ibfk_2` FOREIGN KEY (`id_demandante`) REFERENCES `demandante` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `localizacion`
--
ALTER TABLE `localizacion`
ADD CONSTRAINT `localizacion_ibfk_1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `localizacion_ibfk_2` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `oferta_de_trabajo`
--
ALTER TABLE `oferta_de_trabajo`
ADD CONSTRAINT `oferta_de_trabajo_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `oferta_de_trabajo_ibfk_2` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `oferta_de_trabajo_ibfk_4` FOREIGN KEY (`id_puesto_de_trabajo`) REFERENCES `puesto_de_trabajo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `oferta_trabajo_titulos`
--
ALTER TABLE `oferta_trabajo_titulos`
ADD CONSTRAINT `oferta_trabajo_titulos_ibfk_1` FOREIGN KEY (`id_oferta_de_trabajo`) REFERENCES `oferta_de_trabajo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `oferta_trabajo_titulos_ibfk_2` FOREIGN KEY (`id_titulo_academico`) REFERENCES `titulos_academicos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `perfil`
--
ALTER TABLE `perfil`
ADD CONSTRAINT `perfil_ibfk_2` FOREIGN KEY (`id_formacion_academica`) REFERENCES `formacion_academica` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `puesto_trabajo_perfil`
--
ALTER TABLE `puesto_trabajo_perfil`
ADD CONSTRAINT `puesto_trabajo_perfil_ibfk_1` FOREIGN KEY (`id_puesto_de_trabajo`) REFERENCES `puesto_de_trabajo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `puesto_trabajo_perfil_ibfk_2` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `titulos_formacion`
--
ALTER TABLE `titulos_formacion`
ADD CONSTRAINT `titulos_formacion_ibfk_1` FOREIGN KEY (`id_titulos_academicos`) REFERENCES `titulos_academicos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `titulos_formacion_ibfk_2` FOREIGN KEY (`id_formacion_academica`) REFERENCES `formacion_academica` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
