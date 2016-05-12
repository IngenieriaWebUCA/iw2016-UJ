-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1build0.15.04.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 12, 2016 at 07:16 PM
-- Server version: 5.6.28-0ubuntu0.15.04.1
-- PHP Version: 5.6.4-4ubuntu6.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `iw2016UJ`
--

-- --------------------------------------------------------

--
-- Table structure for table `ciudad`
--

CREATE TABLE IF NOT EXISTS `ciudad` (
`id` int(11) NOT NULL,
  `nombre` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `demandante`
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
  `id_perfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `empresa`
--

CREATE TABLE IF NOT EXISTS `empresa` (
`id` int(11) NOT NULL,
  `cif` varchar(32) NOT NULL,
  `nombre` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `numero_empleados` int(11) NOT NULL,
  `actividad_profesional` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
`id` int(11) NOT NULL,
  `nombre` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `experiencia_profesional`
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
-- Table structure for table `formacion_academica`
--

CREATE TABLE IF NOT EXISTS `formacion_academica` (
`id` int(11) NOT NULL,
  `curso` text NOT NULL,
  `idioma` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inscripcion`
--

CREATE TABLE IF NOT EXISTS `inscripcion` (
`id` int(11) NOT NULL,
  `nombre` varchar(32) NOT NULL,
  `id_oferta_de_trabajo` int(11) NOT NULL,
  `id_demandante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `localizacion`
--

CREATE TABLE IF NOT EXISTS `localizacion` (
`id` int(11) NOT NULL,
  `direccion` varchar(128) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oferta_de_trabajo`
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
-- Table structure for table `oferta_trabajo_titulos`
--

CREATE TABLE IF NOT EXISTS `oferta_trabajo_titulos` (
  `id_oferta_de_trabajo` int(11) NOT NULL,
  `id_titulo_academico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `perfil`
--

CREATE TABLE IF NOT EXISTS `perfil` (
`id` int(11) NOT NULL,
  `foto` varchar(256) NOT NULL,
  `presentacion` text NOT NULL,
  `id_formacion_academica` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `puesto_de_trabajo`
--

CREATE TABLE IF NOT EXISTS `puesto_de_trabajo` (
`id` int(11) NOT NULL,
  `nombre` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `puesto_trabajo_perfil`
--

CREATE TABLE IF NOT EXISTS `puesto_trabajo_perfil` (
  `id_puesto_de_trabajo` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `titulos_academicos`
--

CREATE TABLE IF NOT EXISTS `titulos_academicos` (
`id` int(11) NOT NULL,
  `nombre` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `titulos_formacion`
--

CREATE TABLE IF NOT EXISTS `titulos_formacion` (
  `id_titulos_academicos` int(11) NOT NULL,
  `id_formacion_academica` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ciudad`
--
ALTER TABLE `ciudad`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `demandante`
--
ALTER TABLE `demandante`
 ADD PRIMARY KEY (`id`), ADD KEY `id_perfil` (`id_perfil`);

--
-- Indexes for table `empresa`
--
ALTER TABLE `empresa`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `cif` (`cif`);

--
-- Indexes for table `estado`
--
ALTER TABLE `estado`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `experiencia_profesional`
--
ALTER TABLE `experiencia_profesional`
 ADD PRIMARY KEY (`id`), ADD KEY `id_puesto_de_trabajo` (`id_puesto_de_trabajo`), ADD KEY `id_perfil` (`id_perfil`);

--
-- Indexes for table `formacion_academica`
--
ALTER TABLE `formacion_academica`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inscripcion`
--
ALTER TABLE `inscripcion`
 ADD PRIMARY KEY (`id`), ADD KEY `id_oferta_de_trabajo` (`id_oferta_de_trabajo`,`id_demandante`), ADD KEY `id_demandante` (`id_demandante`);

--
-- Indexes for table `localizacion`
--
ALTER TABLE `localizacion`
 ADD PRIMARY KEY (`id`), ADD KEY `id_ciudad` (`id_ciudad`), ADD KEY `id_empresa` (`id_empresa`);

--
-- Indexes for table `oferta_de_trabajo`
--
ALTER TABLE `oferta_de_trabajo`
 ADD PRIMARY KEY (`id`), ADD KEY `id_estado` (`id_estado`,`id_empresa`), ADD KEY `id_titulos_academicos` (`id_puesto_de_trabajo`), ADD KEY `id_empresa` (`id_empresa`), ADD KEY `id_puesto_de_trabajo` (`id_puesto_de_trabajo`);

--
-- Indexes for table `oferta_trabajo_titulos`
--
ALTER TABLE `oferta_trabajo_titulos`
 ADD KEY `id_oferta_de_trabajo` (`id_oferta_de_trabajo`,`id_titulo_academico`), ADD KEY `id_titulo_academico` (`id_titulo_academico`);

--
-- Indexes for table `perfil`
--
ALTER TABLE `perfil`
 ADD PRIMARY KEY (`id`), ADD KEY `id_puesto_de_trabajo` (`id_formacion_academica`), ADD KEY `id_formacion_academica` (`id_formacion_academica`);

--
-- Indexes for table `puesto_de_trabajo`
--
ALTER TABLE `puesto_de_trabajo`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `puesto_trabajo_perfil`
--
ALTER TABLE `puesto_trabajo_perfil`
 ADD KEY `id_puesto_de_trabajo` (`id_puesto_de_trabajo`,`id_perfil`), ADD KEY `id_perfil` (`id_perfil`);

--
-- Indexes for table `titulos_academicos`
--
ALTER TABLE `titulos_academicos`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `titulos_formacion`
--
ALTER TABLE `titulos_formacion`
 ADD KEY `id_titulos_academicos` (`id_titulos_academicos`), ADD KEY `id_formacion_academica` (`id_formacion_academica`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ciudad`
--
ALTER TABLE `ciudad`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `demandante`
--
ALTER TABLE `demandante`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `empresa`
--
ALTER TABLE `empresa`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `estado`
--
ALTER TABLE `estado`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `experiencia_profesional`
--
ALTER TABLE `experiencia_profesional`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `formacion_academica`
--
ALTER TABLE `formacion_academica`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `inscripcion`
--
ALTER TABLE `inscripcion`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `localizacion`
--
ALTER TABLE `localizacion`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oferta_de_trabajo`
--
ALTER TABLE `oferta_de_trabajo`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `perfil`
--
ALTER TABLE `perfil`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `puesto_de_trabajo`
--
ALTER TABLE `puesto_de_trabajo`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `titulos_academicos`
--
ALTER TABLE `titulos_academicos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `demandante`
--
ALTER TABLE `demandante`
ADD CONSTRAINT `demandante_ibfk_1` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `experiencia_profesional`
--
ALTER TABLE `experiencia_profesional`
ADD CONSTRAINT `experiencia_profesional_ibfk_1` FOREIGN KEY (`id_puesto_de_trabajo`) REFERENCES `puesto_de_trabajo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `experiencia_profesional_ibfk_2` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inscripcion`
--
ALTER TABLE `inscripcion`
ADD CONSTRAINT `inscripcion_ibfk_1` FOREIGN KEY (`id_oferta_de_trabajo`) REFERENCES `oferta_de_trabajo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `inscripcion_ibfk_2` FOREIGN KEY (`id_demandante`) REFERENCES `demandante` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `localizacion`
--
ALTER TABLE `localizacion`
ADD CONSTRAINT `localizacion_ibfk_1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `localizacion_ibfk_2` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oferta_de_trabajo`
--
ALTER TABLE `oferta_de_trabajo`
ADD CONSTRAINT `oferta_de_trabajo_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `oferta_de_trabajo_ibfk_2` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `oferta_de_trabajo_ibfk_4` FOREIGN KEY (`id_puesto_de_trabajo`) REFERENCES `puesto_de_trabajo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oferta_trabajo_titulos`
--
ALTER TABLE `oferta_trabajo_titulos`
ADD CONSTRAINT `oferta_trabajo_titulos_ibfk_1` FOREIGN KEY (`id_oferta_de_trabajo`) REFERENCES `oferta_de_trabajo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `oferta_trabajo_titulos_ibfk_2` FOREIGN KEY (`id_titulo_academico`) REFERENCES `titulos_academicos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `perfil`
--
ALTER TABLE `perfil`
ADD CONSTRAINT `perfil_ibfk_2` FOREIGN KEY (`id_formacion_academica`) REFERENCES `formacion_academica` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `puesto_trabajo_perfil`
--
ALTER TABLE `puesto_trabajo_perfil`
ADD CONSTRAINT `puesto_trabajo_perfil_ibfk_1` FOREIGN KEY (`id_puesto_de_trabajo`) REFERENCES `puesto_de_trabajo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `puesto_trabajo_perfil_ibfk_2` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `titulos_formacion`
--
ALTER TABLE `titulos_formacion`
ADD CONSTRAINT `titulos_formacion_ibfk_1` FOREIGN KEY (`id_titulos_academicos`) REFERENCES `titulos_academicos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `titulos_formacion_ibfk_2` FOREIGN KEY (`id_formacion_academica`) REFERENCES `formacion_academica` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
