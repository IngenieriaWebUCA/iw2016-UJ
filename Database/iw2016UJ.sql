-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 02-06-2016 a las 19:12:31
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`id`, `nombre`) VALUES
(1, 'Cai'),
(2, 'datocualquiera'),
(3, 'nombrecualquiera2'),
(4, 'insertootravez');

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
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `demandante`
--

INSERT INTO `demandante` (`id`, `nombre`, `apellidos`, `dni`, `fecha_nacimiento`, `sexo`, `direccion`, `email`, `telefono`, `id_usuario`) VALUES
(3, 'aaa', 'a', 'a', '2016-07-30', 'a', 'a', 'a', 425, 15),
(4, 'deman3', 'apellidos', '25252n', '2014-06-11', 'Hombre', 'calle 252', 'dfsa@hotmail.com', 2622363, 20),
(5, 'Paco', 'paquinho', '35252', '2016-08-20', 'hombre', 'fdasf', 'fasdf', 85785, 16);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id`, `cif`, `nombre`, `email`, `numero_empleados`, `id_usuario`, `actividad_profesional`) VALUES
(1, '000001', 'Empresa SA', 'empresa@empresa.com', 237, 17, 'Seguridad informática'),
(2, '2020202', 'Hormigones SA', 'hormigas@sa.com', 2001, 18, 'Construcción de edificios'),
(3, '33333', 'hito', 'fdsaff', 2, 14, 'Hito'),
(4, '2122121', 'empresahito SA', 'empreaa@fdsas.com', 2, 19, 'fdasf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
`id` int(11) NOT NULL,
  `nombre` varchar(32) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id`, `nombre`) VALUES
(1, 'En espera'),
(2, 'Activa'),
(3, 'Detenida'),
(4, 'Cancelada'),
(5, 'En trámite'),
(6, 'Resuelta');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `experiencia_profesional`
--

INSERT INTO `experiencia_profesional` (`id`, `nombre_empresa`, `fecha_inicio`, `fecha_fin`, `id_puesto_de_trabajo`, `id_perfil`) VALUES
(1, 'uca', '2016-06-01', '2016-06-09', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formacion_academica`
--

CREATE TABLE IF NOT EXISTS `formacion_academica` (
`id` int(11) NOT NULL,
  `curso` text NOT NULL,
  `idioma` text NOT NULL,
  `id_perfil` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `formacion_academica`
--

INSERT INTO `formacion_academica` (`id`, `curso`, `idioma`, `id_perfil`) VALUES
(1, 'Cursillo de Bootstrap', 'Inglés, Español...', 1),
(2, 'cursillo', 'español, ingles', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

CREATE TABLE IF NOT EXISTS `inscripcion` (
`id` int(11) NOT NULL,
  `nombre` varchar(32) NOT NULL,
  `id_oferta_de_trabajo` int(11) NOT NULL,
  `id_demandante` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inscripcion`
--

INSERT INTO `inscripcion` (`id`, `nombre`, `id_oferta_de_trabajo`, `id_demandante`) VALUES
(1, 'Deman', 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localizacion`
--

CREATE TABLE IF NOT EXISTS `localizacion` (
`id` int(11) NOT NULL,
  `direccion` varchar(128) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `localizacion`
--

INSERT INTO `localizacion` (`id`, `direccion`, `id_ciudad`, `id_empresa`) VALUES
(1, 'Calle Antigua ESI', 1, 1),
(2, 'Calle cualquiera nº 46', 2, 1),
(3, 'calle final', 1, 4);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `oferta_de_trabajo`
--

INSERT INTO `oferta_de_trabajo` (`id`, `tipo_concreto`, `sueldo_bruto`, `fecha_inicio`, `vacantes`, `experiencia_previa`, `fecha_de_fin`, `id_estado`, `id_empresa`, `id_puesto_de_trabajo`) VALUES
(1, 'Programador', 250, '2016-06-01', 2, 0, '2016-06-08', 2, 1, 1),
(2, 'Analista', 200, '2016-06-06', 1, 0, '2016-06-27', 2, 2, 1),
(3, 'Programador Inf', 500, '2016-06-01', 3, 0, '2016-06-29', 2, 4, 1);

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
  `id_demandante` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id`, `foto`, `presentacion`, `id_demandante`) VALUES
(1, 'imagen.jpg', 'Hola que pasa', 3),
(2, 'asdfsaf.jpg', 'fsadfasffd', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puesto_de_trabajo`
--

CREATE TABLE IF NOT EXISTS `puesto_de_trabajo` (
`id` int(11) NOT NULL,
  `nombre` varchar(64) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `puesto_de_trabajo`
--

INSERT INTO `puesto_de_trabajo` (`id`, `nombre`) VALUES
(1, 'Informatico');

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
-- Estructura de tabla para la tabla `rol_usuario`
--

CREATE TABLE IF NOT EXISTS `rol_usuario` (
`id` int(11) NOT NULL,
  `nombre` varchar(32) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol_usuario`
--

INSERT INTO `rol_usuario` (`id`, `nombre`) VALUES
(1, 'Administrador'),
(2, 'Empresa'),
(3, 'Demandante');

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
  `password` varchar(128) NOT NULL,
  `id_rol_usuario` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `password`, `id_rol_usuario`) VALUES
(14, 'admin', '$2a$10$i01pdGedHI/LdA/sYqbQIuoAggPYoD/HtLesnyqLW59YA3t.PF/S6', 1),
(15, 'deman', '$2a$10$KNYHuMiKb0wt4h3CdlDLMOfqz/9pe0nxhmBXipULR1ulfcZjcZB7C', 3),
(16, 'deman2', '$2a$10$mOLnjTiItKfP3NBOssuNC.Dla.9bxMnLMlS2BwkjPaz.GEdZsPQoG', 3),
(17, 'empresa', '$2a$10$Re9/B.cIgAgO.G0bc01rDeGnLyJzgUrbh9LeHH1BwkUvRffmEjXEG', 2),
(18, 'empresaprueba', '$2a$10$jo5bci/i.jbS8JV4oAYSk.kcWXK7aVboezq7a.XxAzgwdFUzg4ula', 2),
(19, 'empresahito', '$2a$10$4fY07jnXMiX7U25Kq0NjSuiv7m8o.zlYHHcYYXmx37pO1arz4R8pq', 2),
(20, 'deman3', '$2a$10$LF.kpMlmmhbFlySAZZrkAO8n9L05E0d5c6RVOrSok0jjHvO30I9Kq', 3);

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
 ADD PRIMARY KEY (`id`), ADD KEY `id_usuario` (`id_usuario`);

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
 ADD PRIMARY KEY (`id`), ADD KEY `id_perfil` (`id_perfil`);

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
 ADD PRIMARY KEY (`id`), ADD KEY `id_demandante` (`id_demandante`);

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
-- Indices de la tabla `rol_usuario`
--
ALTER TABLE `rol_usuario`
 ADD PRIMARY KEY (`id`);

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
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nombre` (`nombre`), ADD KEY `id_rol_usuario` (`id_rol_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `demandante`
--
ALTER TABLE `demandante`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `experiencia_profesional`
--
ALTER TABLE `experiencia_profesional`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `formacion_academica`
--
ALTER TABLE `formacion_academica`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `localizacion`
--
ALTER TABLE `localizacion`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `oferta_de_trabajo`
--
ALTER TABLE `oferta_de_trabajo`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `oferta_trabajo_titulos`
--
ALTER TABLE `oferta_trabajo_titulos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `puesto_de_trabajo`
--
ALTER TABLE `puesto_de_trabajo`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `puesto_trabajo_perfil`
--
ALTER TABLE `puesto_trabajo_perfil`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `rol_usuario`
--
ALTER TABLE `rol_usuario`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `demandante`
--
ALTER TABLE `demandante`
ADD CONSTRAINT `demandante_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Filtros para la tabla `formacion_academica`
--
ALTER TABLE `formacion_academica`
ADD CONSTRAINT `formacion_academica_ibfk_1` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
ADD CONSTRAINT `perfil_ibfk_1` FOREIGN KEY (`id_demandante`) REFERENCES `demandante` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol_usuario`) REFERENCES `rol_usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
