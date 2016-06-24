-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.13-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para odontograma1
CREATE DATABASE IF NOT EXISTS `odontograma1` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci */;
USE `odontograma1`;


-- Volcando estructura para tabla odontograma1.admisiones
CREATE TABLE IF NOT EXISTS `admisiones` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` bigint(50) NOT NULL,
  `Cita` int(11) NOT NULL,
  `Usuario` bigint(15) NOT NULL,
  `Historia` int(11) DEFAULT NULL,
  `Fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Atendida` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Codigo` (`Codigo`),
  UNIQUE KEY `Cita` (`Cita`),
  KEY `FK_Admisiones_historias` (`Historia`),
  KEY `FK_admisiones_usuarios` (`Usuario`),
  CONSTRAINT `FK_Admisiones_historias` FOREIGN KEY (`Historia`) REFERENCES `historias` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `FK_admisiones_citas` FOREIGN KEY (`Cita`) REFERENCES `citas` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_admisiones_usuarios` FOREIGN KEY (`Usuario`) REFERENCES `usuarios` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.admisiones: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `admisiones` DISABLE KEYS */;
INSERT INTO `admisiones` (`Id`, `Codigo`, `Cita`, `Usuario`, `Historia`, `Fecha`, `Atendida`) VALUES
	(20, 2779231001, 13, 92654, NULL, '2016-06-24 00:47:50', b'0'),
	(21, 9152545479, 5, 92654, NULL, '2016-06-24 12:48:13', b'0');
/*!40000 ALTER TABLE `admisiones` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.citas
CREATE TABLE IF NOT EXISTS `citas` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Paciente` bigint(15) NOT NULL,
  `Medico` bigint(15) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `FechaRegistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaCambio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Usuario` bigint(15) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Medico_Fecha_Hora` (`Medico`,`Fecha`,`Hora`),
  KEY `FK_citas_pacientes` (`Paciente`),
  KEY `FK_citas_usuarios` (`Usuario`),
  CONSTRAINT `FK_citas_medicos` FOREIGN KEY (`Medico`) REFERENCES `medicos` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_citas_pacientes` FOREIGN KEY (`Paciente`) REFERENCES `pacientes` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_citas_usuarios` FOREIGN KEY (`Usuario`) REFERENCES `usuarios` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='almacena las citas programadas';

-- Volcando datos para la tabla odontograma1.citas: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
INSERT INTO `citas` (`Id`, `Paciente`, `Medico`, `Fecha`, `Hora`, `FechaRegistro`, `FechaCambio`, `Usuario`) VALUES
	(5, 1104, 11043, '2016-06-24', '06:30:00', '2016-06-23 22:25:02', '2016-06-23 22:25:02', 92654),
	(13, 1104, 11043, '2016-06-24', '06:45:00', '2016-06-23 22:44:31', '2016-06-23 22:44:31', 92654),
	(14, 1104, 11043, '2016-06-25', '06:45:00', '2016-06-23 22:44:50', '2016-06-23 22:44:50', 92654),
	(15, 1104, 11043, '2016-06-26', '06:00:00', '2016-06-23 23:04:37', '2016-06-23 23:04:37', 92654),
	(16, 1104, 11043, '2016-06-23', '22:00:00', '2016-06-23 23:21:50', '2016-06-23 23:21:50', 92654),
	(17, 1104, 11043, '2016-06-24', '15:30:00', '2016-06-24 15:10:22', '2016-06-24 15:10:22', 92654);
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.dientes
CREATE TABLE IF NOT EXISTS `dientes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Numero` int(11) NOT NULL,
  `Nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Position` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Dientes_posiciondents` (`Position`),
  KEY `Numero` (`Numero`),
  CONSTRAINT `FK_Dientes_posiciondents` FOREIGN KEY (`Position`) REFERENCES `posiciondents` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.dientes: ~52 rows (aproximadamente)
/*!40000 ALTER TABLE `dientes` DISABLE KEYS */;
INSERT INTO `dientes` (`Id`, `Numero`, `Nombre`, `Position`) VALUES
	(3, 11, 'Incisivo frontal superior derecho adulto', 9),
	(5, 12, 'Incisivo lateral superior derecho adulto', 9),
	(6, 13, 'Canino superior derecho adulto', 9),
	(7, 14, 'Primer premolar superior derecho adulto', 9),
	(8, 15, 'Segundo premolar superior derecho adulto', 9),
	(10, 16, 'Primer molar superior derecho adulto', 9),
	(11, 17, 'Segundo molar superior derecho adulto', 9),
	(13, 18, 'Tercer molar superior derecho adulto', 9),
	(14, 21, 'Incisivo frontal superior izquierdo adulto', 7),
	(15, 22, 'Incisivo lateral superior izquierdo adulto', 7),
	(16, 23, 'Canino superior izquierdo adulto', 7),
	(18, 24, 'Primer premolar superior izquierdo adulto', 7),
	(20, 25, 'Segundo premolar superior izquierdo adulto', 7),
	(21, 26, 'Primer molar superior izquierdo adulto', 7),
	(22, 27, 'Segundo molar superior izquierdo adulto', 7),
	(23, 28, 'Tercer molar superior izquierdo adulto', 7),
	(24, 41, 'Incisivo frontal inferior derecho adulto', 13),
	(25, 42, 'Incisivo lateral inferior derecho adulto', 13),
	(26, 43, 'Canino inferior derecho adulto', 13),
	(27, 44, 'Primer premolar inferior derecho adulto', 13),
	(28, 45, 'Segundo premolar inferior derecho adulto', 13),
	(29, 46, 'Primer molar inferior derecho adulto', 13),
	(30, 47, 'Segundo molar inferior derecho adulto', 13),
	(31, 48, 'Tercer molar inferior derecho adulto', 13),
	(33, 31, 'Incisivo frontal inferior izquierdo adulto', 11),
	(34, 32, 'Incisivo lateral inferior izquierdo adulto', 11),
	(35, 33, 'Canino inferior izquierdo adulto', 11),
	(36, 34, 'Primer premolar inferior izquierdo adulto', 11),
	(37, 35, 'Segundo premolar inferior izquierdo adulto', 11),
	(38, 36, 'Primer molar inferior izquierdo adulto', 11),
	(39, 37, 'Segundo molar inferior izquierdo adulto', 11),
	(40, 38, 'Tercer molar inferior izquierdo adulto', 11),
	(41, 51, 'Incisivo frontal superior derecho niño', 10),
	(42, 52, 'Incisivo lateral superior derecho niño', 10),
	(43, 53, 'Canino superior derecho niño', 10),
	(44, 54, 'Primer premolar superior derecho niño', 10),
	(45, 55, 'Segundo premolar superior derecho niño', 10),
	(46, 61, 'Incisivo frontal superior izquierdo niño', 8),
	(47, 62, 'Incisivo lateral superior izquierdo niño', 8),
	(48, 63, 'Canino superior izquierdo niño', 8),
	(49, 64, 'Primer premolar superior izquierdo niño', 8),
	(50, 65, 'Segundo premolar superior izquierdo niño', 8),
	(51, 81, 'Incisivo frontal inferior derecho niño', 14),
	(52, 82, 'Incisivo lateral inferior derecho niño', 14),
	(53, 83, 'Canino inferior derecho niño', 14),
	(54, 84, 'Primer premolar inferior derecho niño', 14),
	(55, 85, 'Segundo premolar inferior derecho niño', 14),
	(56, 71, 'Incisivo frontal inferior izquierdo niño', 12),
	(57, 72, 'Incisivo lateral inferior izquierdo niño', 12),
	(58, 73, 'Canino inferior izquierdo niño', 12),
	(59, 74, 'Primer premolar inferior izquierdo niño', 12),
	(60, 75, 'Segundo premolar inferior izquierdo niño', 12);
/*!40000 ALTER TABLE `dientes` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.evoluciones
CREATE TABLE IF NOT EXISTS `evoluciones` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Diagnostico` int(11) NOT NULL,
  `Tratamiento` int(11) NOT NULL,
  `Descripcion` text COLLATE utf8_spanish2_ci NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codigo`),
  KEY `FK__pacienteprocedures` (`Diagnostico`),
  KEY `FK__pacienteprocedures_2` (`Tratamiento`),
  CONSTRAINT `FK__pacienteprocedures` FOREIGN KEY (`Diagnostico`) REFERENCES `pacienteprocedures` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK__pacienteprocedures_2` FOREIGN KEY (`Tratamiento`) REFERENCES `pacienteprocedures` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Almacena las evoluciones que se le den a los diagnosticos del paciente';

-- Volcando datos para la tabla odontograma1.evoluciones: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `evoluciones` DISABLE KEYS */;
INSERT INTO `evoluciones` (`Codigo`, `Diagnostico`, `Tratamiento`, `Descripcion`, `Fecha`) VALUES
	(1, 285, 289, 'se ha evolucionado el diagnostico y su tratamiento', '2016-05-31 23:33:52'),
	(2, 201, 288, 'evolucion de procedimiento', '2016-06-06 00:31:35'),
	(3, 200, 291, 'evolucion de procedimiento 2', '2016-06-06 00:35:22'),
	(4, 202, 316, 'esta es la nota de la evolucion', '2016-06-06 22:13:59'),
	(5, 158, 327, 'evolucion de procedimientos generales', '2016-06-08 01:01:42'),
	(10, 179, 338, 'dddd', '2016-06-23 17:13:20');
/*!40000 ALTER TABLE `evoluciones` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.groupitemsdent
CREATE TABLE IF NOT EXISTS `groupitemsdent` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Descripcion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `Tipe` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`),
  KEY `FK_groupitemsdent_tipeitems` (`Tipe`),
  CONSTRAINT `FK_groupitemsdent_tipeitems` FOREIGN KEY (`Tipe`) REFERENCES `tipeitems` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.groupitemsdent: ~30 rows (aproximadamente)
/*!40000 ALTER TABLE `groupitemsdent` DISABLE KEYS */;
INSERT INTO `groupitemsdent` (`Id`, `Nombre`, `Descripcion`, `Tipe`) VALUES
	(1, ' Anomalias Del Tamaño Y Erupcion Dentaria', '--', 1),
	(2, ' Caries', '--', 1),
	(3, ' Trastornos De Los Tejidos Dentarios Duros', '--', 1),
	(4, ' Afecciones De Los Tejidos De La Pulpa Dental', '--', 1),
	(5, ' Afecciones De Los Tejidos De Sosten', '--', 1),
	(6, ' Anomalias Dentofaciales\r\n', '--', 1),
	(7, ' Afecciones De Los Dientes Y Estructuras De Sosten', '--', 1),
	(8, ' Quistes Bucales', '--', 1),
	(9, ' Trastornos Del Desarrollo De Los Maxilares\r\n', '--', 1),
	(10, ' Enfermedades De Glandulas Salivales\r\n', '--', 1),
	(11, ' Alteraciones De Labios Y Mejillas', '--', 1),
	(12, ' Patologias De La Lengua', '--', 1),
	(13, ' Actividades De Promoción Y Prevención', '--', 1),
	(14, ' Diente Ausente', '--', 1),
	(15, ' Fijación A La Estructura Dentaria', '--', 1),
	(16, 'Prevencion', '--', 2),
	(17, 'Radiologia', '--', 2),
	(18, 'Exodoncia Y Cx.', '--', 2),
	(19, 'Operatoria', '--', 2),
	(20, 'Endodoncia', '--', 2),
	(21, 'Protesis', '--', 2),
	(22, 'Periodoncia', '--', 2),
	(23, 'Ortodoncia', '--', 2),
	(24, 'Biopsias', '--', 2),
	(25, 'Uvula Y Paladar', '--', 2),
	(26, 'Labio', '--', 2),
	(27, 'Mucosa Oral', '--', 2),
	(28, 'Quistes Y Lesiones', '--', 2),
	(29, 'Tumores', '--', 2),
	(30, 'Otras Cirugias', '--', 2);
/*!40000 ALTER TABLE `groupitemsdent` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.historias
CREATE TABLE IF NOT EXISTS `historias` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Paciente` bigint(15) NOT NULL,
  `Medico` bigint(15) NOT NULL,
  `FechaApertura` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Estado` bit(1) NOT NULL DEFAULT b'1',
  `Padre` int(11) DEFAULT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `FK__pacientes` (`Paciente`),
  KEY `FK_historias_medicos` (`Medico`),
  KEY `FK_historias_historias` (`Padre`),
  CONSTRAINT `FK__pacientes` FOREIGN KEY (`Paciente`) REFERENCES `pacientes` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_historias_historias` FOREIGN KEY (`Padre`) REFERENCES `historias` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `FK_historias_medicos` FOREIGN KEY (`Medico`) REFERENCES `medicos` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Almacena las diferentes historias odontologicas que se abren a los pacientes';

-- Volcando datos para la tabla odontograma1.historias: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `historias` DISABLE KEYS */;
INSERT INTO `historias` (`Codigo`, `Paciente`, `Medico`, `FechaApertura`, `Estado`, `Padre`) VALUES
	(2, 1104, 11043, '2016-05-31 12:01:47', b'1', NULL),
	(5, 789, 11043, '2016-06-24 01:18:30', b'1', NULL),
	(73, 1104, 11043, '2016-06-24 15:02:54', b'0', 2),
	(74, 1104, 11043, '2016-06-24 15:18:33', b'0', 2);
/*!40000 ALTER TABLE `historias` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.items
CREATE TABLE IF NOT EXISTS `items` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `Nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Descripcion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `resource` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Representacion` int(11) NOT NULL,
  `GroupParent` int(11) NOT NULL,
  `Zone` int(11) DEFAULT NULL COMMENT 'en este campo se usara para verificar cuales necesitan escogerce una zona y cuales ya tienen una predeterminada',
  PRIMARY KEY (`Id`),
  KEY `FK_items_representaciom` (`Representacion`),
  KEY `FK_items_groupitemsdent` (`GroupParent`),
  KEY `FK_items_zones` (`Zone`),
  CONSTRAINT `FK_items_groupitemsdent` FOREIGN KEY (`GroupParent`) REFERENCES `groupitemsdent` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_items_representacion` FOREIGN KEY (`Representacion`) REFERENCES `representacion` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_items_zones` FOREIGN KEY (`Zone`) REFERENCES `zones` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.items: ~347 rows (aproximadamente)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`Id`, `Codigo`, `Nombre`, `Descripcion`, `resource`, `Representacion`, `GroupParent`, `Zone`) VALUES
	(1, 'K000', 'Anodoncia', '--', NULL, 2, 1, 8),
	(2, 'K001', 'Dientes Supernumerarios', '--', NULL, 2, 1, 9),
	(3, 'K002', 'Anomalias Del Tamaño Y De La Forma Del Diente', '--', NULL, 2, 1, 11),
	(4, 'K003', 'Dientes Moteados', '--', NULL, 2, 1, 11),
	(5, 'K004', 'Alteraciones En La Formacion Dentaria', '--', NULL, 2, 1, 8),
	(6, 'K005', 'Alteraciones Hereditarias De La Estructura Dentaria No Clasificadas En Otra Parte', '--', NULL, 2, 1, NULL),
	(7, 'K006', 'Alteraciones En La Erupcion Dentaria', '--', NULL, 2, 1, 8),
	(8, 'K007', 'Sindrome De La Erupcion Dentaria', '--', NULL, 2, 1, 8),
	(9, 'K008', 'Otros Trastornos Del Desarrollo De Los Dientes', '--', NULL, 2, 1, 10),
	(10, 'K009', 'Trastorno Del Desarrollo De Los Dientes No Especificado', '--', NULL, 2, 1, 8),
	(11, 'K010', 'Dientes Incluidos', '--', NULL, 2, 1, 8),
	(12, 'K011', 'Dientes Impactados', '--', NULL, 2, 1, 8),
	(13, 'K020', 'Caries Limitada Al Esmalte', '--', 'FF0000', 1, 2, NULL),
	(14, 'K021', 'Caries De La Dentina', '--', 'FF0000', 1, 2, NULL),
	(15, 'K022', 'Caries Del Cemento', '--', 'FF0000', 1, 2, NULL),
	(16, 'K023', 'Caries Dentaria Detenida', '--', 'D17A00', 1, 2, NULL),
	(17, 'K024', 'Odontoclasia Melanodoncia Infantil Melanodontoclasia', '--', '63B982', 1, 2, NULL),
	(18, 'K028', 'Otras Caries Dentales Especificadas', '--', 'FF9900', 1, 2, NULL),
	(19, 'K029', 'Caries Dental No Especificada', '--', 'FF9900', 1, 2, NULL),
	(20, 'K030', 'Atricion Excesiva De Los Dientes', '--', NULL, 2, 3, 8),
	(21, 'K031', 'Abrasion De Los Dientes', '--', NULL, 2, 3, 8),
	(22, 'K032', 'Erosion De Los Dientes', '--', NULL, 2, 3, 8),
	(23, 'K033', 'Reabsorcion Patologica De Los Dientes', '--', NULL, 2, 3, 8),
	(24, 'K034', 'Hipercementosis', '--', NULL, 2, 3, 8),
	(25, 'K035', 'Anquilosis Dental', '--', NULL, 2, 3, 8),
	(26, 'K036', 'Depositos [acreciones] En Los Dientes', '--', NULL, 2, 3, 8),
	(27, 'K037', 'Cambios Posteruptivos Del Color De Los Tejidos Dentales Duros', '--', NULL, 2, 3, 8),
	(28, 'K038', 'Otras Enfermedades Especificadas De Los Tejidos Duros De Los Dientes', '--', NULL, 2, 3, 8),
	(29, 'K039', 'Enfermedad No Especificada De Los Tejidos Dentales Duros', '--', NULL, 2, 3, 8),
	(30, 'S025', 'Fractura De Los Dientes', '--', NULL, 2, 3, 8),
	(31, 'S032', 'Luxacion De Diente', '--', NULL, 2, 3, 8),
	(32, 'K040', 'Pulpitis', '--', NULL, 2, 4, 8),
	(33, 'K041', 'Necrosis De La Pulpa Gangrena De La Pulpa', '--', NULL, 2, 4, 8),
	(34, 'K042', 'Degeneracion De La Pulpa Calcificaciones De La Pulpa Denticulos Piedras De La Pulpa', '--', NULL, 2, 4, 8),
	(35, 'K043', 'Formacion Anormal De Tejido Duro En La Pulpa Dentina Secundaria O Irregular', '--', NULL, 2, 4, 8),
	(36, 'K044', 'Periodontitis Apical Aguda Originada En La Pulpa Periodontitis Apical Aguda Sai', '--', NULL, 2, 4, 8),
	(37, 'K045', 'Periodontitis Apical Cronica Granuloma Apical', '--', NULL, 2, 4, 8),
	(38, 'K046', 'Absceso Periapical Con Fistula', '--', NULL, 2, 4, 8),
	(39, 'K047', 'Absceso Periapical Sin Fistula Dental Dentoalveolar Sin Fistula', '--', NULL, 2, 4, 8),
	(40, 'K048', 'Quiste Radicular', '--', NULL, 2, 4, 8),
	(41, 'K049', 'Otras Enfermedades Y Las No Especificadas De La Pulpa Y Del Tejido Periapical', '--', NULL, 2, 4, 8),
	(42, 'K050', 'Gingivitis Aguda', '--', NULL, 2, 5, 8),
	(43, 'K051', 'Gingivitis Cronica', '--', NULL, 2, 5, 8),
	(44, 'K052', 'Periodontitis Aguda', '--', NULL, 2, 5, 8),
	(45, 'K053', 'Periodontitis Cronica', '--', NULL, 2, 5, 8),
	(46, 'K054', 'Periodontosis Juvenil', '--', NULL, 2, 5, 8),
	(47, 'K055', 'Otras Enfermedades Periodontales', '--', NULL, 2, 5, 8),
	(48, 'K056', 'Enfermedad Del Periodonto No Especificada', '--', NULL, 2, 5, 8),
	(49, 'K060', 'Retraccion Gingival', '--', NULL, 2, 5, 8),
	(50, 'K061', 'Hiperplasia Gingival', '--', NULL, 2, 5, 8),
	(51, 'K062', 'Lesiones De La Encia Y De La Zona Edentula Asociadas Con Traumatismo', '--', NULL, 2, 5, 8),
	(52, 'K068', 'Otros Trastornos Especificados De La Encia Y De La Zona Edentula', '--', NULL, 2, 5, 8),
	(53, 'K069', 'Trastorno No Especificado De La Encia Y De La Zona Edentula', '--', NULL, 2, 5, 8),
	(54, 'K070', 'Anomalias Evidentes Del Tamaño De Los Maxilares', '--', NULL, 2, 6, 8),
	(55, 'K071', 'Anomalias De La Relacion Maxilobasilar', '--', NULL, 2, 6, 8),
	(56, 'K072', 'Anomalias De La Relacion Entre Los Arcos Dentarios', '--', NULL, 2, 6, 8),
	(57, 'K073', 'Anomalias De La Posicion Del Diente', '--', NULL, 2, 6, 8),
	(58, 'K074', 'Maloclusion De Tipo No Especificado', '--', NULL, 2, 6, 8),
	(59, 'K075', 'Anomalias Dentofaciales Funcionales', '--', NULL, 2, 6, 8),
	(60, 'K076', 'Trastornos De La Articulacion Temporomaxilar', '--', NULL, 2, 6, 8),
	(61, 'K078', 'Otras Anomalias Dentofaciales', '--', NULL, 2, 6, 8),
	(62, 'K079', 'Anomalia Dentofacial No Especificada', '--', NULL, 2, 6, 8),
	(63, 'K080', 'Exfoliacion De Los Dientes Debida A Causas Sistemicas', '--', NULL, 2, 7, 8),
	(64, 'K081', 'Perdida De Dientes Debida A Accidente Extraccion O Enfermedad Periodontal Local', '--', NULL, 2, 7, 8),
	(65, 'K082', 'Atrofia Del Reborde Alveolar Desdentado', '--', NULL, 2, 7, 8),
	(66, 'K083', 'Raiz Dental Retenida', '--', NULL, 2, 7, 8),
	(67, 'K088', 'Otras Afecciones Especificadas De Los Dientes Y De Sus Estructuras De Sosten', '--', NULL, 2, 7, 8),
	(68, 'K089', 'Trastorno De Los Dientes Y De Sus Estructuras De Sosten No Especificado', '--', NULL, 2, 7, 8),
	(69, 'K090', 'Quistes Originados Por El Desarrollo De Los Dientes', '--', NULL, 2, 8, 8),
	(70, 'K091', 'Quistes De Las Fisuras (no Odontogenicos)', '--', NULL, 2, 8, 8),
	(71, 'K092', 'Otros Quistes De Los Maxilares', '--', NULL, 2, 8, 8),
	(72, 'K098', 'Otros Quistes De La Region Bucal No Clasificados En Otra Parte', '--', NULL, 2, 8, 8),
	(73, 'K099', 'Quiste De La Region Bucal Sin Otra Especificacion', '--', NULL, 2, 8, 8),
	(74, 'K100', 'Trastornos Del Desarrollo De Los Maxilares', '--', NULL, 2, 9, 8),
	(75, 'K101', 'Granuloma Central De Celulas Gigantes', '--', NULL, 2, 9, 8),
	(76, 'K102', 'Afecciones Inflamatorias De Los Maxilares', '--', NULL, 2, 9, 8),
	(77, 'K103', 'Alveolitis Del Maxilar', '--', NULL, 2, 9, 8),
	(78, 'K108', 'Otras Enfermedades Especificadas De Los Maxilares', '--', NULL, 2, 9, 8),
	(79, 'K109', 'Enfermedad De Los Maxilares No Especificada', '--', NULL, 2, 9, 8),
	(80, 'K110', 'Atrofia De Glandula Salival', '--', NULL, 2, 10, 8),
	(81, 'K111', 'Hipertrofia De Glandula Salival', '--', NULL, 2, 10, 8),
	(82, 'K112', 'Sialadenitis', '--', NULL, 2, 10, 8),
	(83, 'K113', 'Absceso De Glandula Salival', '--', NULL, 2, 10, 8),
	(84, 'K114', 'Fistula De Glandula Salival', '--', NULL, 2, 10, 8),
	(85, 'K115', 'Sialolitiasis', '--', NULL, 2, 10, 8),
	(86, 'K116', 'Mucocele De Glandula Salival', '--', NULL, 2, 10, 8),
	(87, 'K117', 'Alteraciones De La Secrecion Salival', '--', NULL, 2, 10, 8),
	(88, 'K118', 'Otras Enfermedades De Las Glandulas Salivales', '--', NULL, 2, 10, 8),
	(89, 'K119', 'Enfermedad De Glandula Salival No Especificada', '--', NULL, 2, 10, 8),
	(90, 'K120', 'Estomatitis Aftosa Recurrente', '--', NULL, 2, 11, 8),
	(91, 'K121', 'Otras Formas De Estomatitis', '--', NULL, 2, 11, 8),
	(92, 'K122', 'Celulitis Y Abceso De Boca', '--', NULL, 2, 11, 8),
	(93, 'K130', 'Enfermedades De Los Labios', '--', NULL, 2, 11, 8),
	(94, 'K131', 'Mordedura Del Labio Y De La Mejilla', '--', NULL, 2, 11, 8),
	(95, 'K132', 'Leucoplasia Y Otras Alteraciones Del Epitelio Bucal Incluyendo La Lengua', '--', NULL, 2, 11, 8),
	(96, 'K133', 'Leucoplasia Pilosa', '--', NULL, 2, 11, 8),
	(97, 'K134', 'Granuloma Y Lesiones Semejantes De La Mucosa Bucal', '--', NULL, 2, 11, 8),
	(98, 'K135', 'Fibrosis De La Submucosa Bucal', '--', NULL, 2, 11, 8),
	(99, 'K136', 'Hiperplasia Irrritativa De La Mucosa Bucal', '--', NULL, 2, 11, 8),
	(100, 'K137', 'Otras Lesiones Y Las No Especificadas De La Mucosa Bucal', '--', NULL, 2, 11, 8),
	(101, 'K140', 'Glositis', '--', NULL, 2, 12, 8),
	(102, 'K141', 'Lengua Geografica', '--', NULL, 2, 12, 8),
	(103, 'K142', 'Glositis Romboidea Mediana', '--', NULL, 2, 12, 8),
	(104, 'K143', 'Hipertrofia De Las Papilas Linguales', '--', NULL, 2, 12, 8),
	(105, 'K144', 'Atrofia De Las Papilas Linguales', '--', NULL, 2, 12, 8),
	(106, 'K145', 'Lengua Plegada', '--', NULL, 2, 12, 8),
	(107, 'K146', 'Glosodinia', '--', NULL, 2, 12, 8),
	(108, 'K148', 'Otras Enfermedades De La Lengua', '--', NULL, 2, 12, 8),
	(109, 'K149', 'Enfermedad De La Lengua No Especificada', '--', NULL, 2, 12, 8),
	(110, 'GP00', 'Examen Odontologico', '--', NULL, 2, 13, 8),
	(111, 'GP02', 'Superficie Sana', '--', '000000', 1, 13, NULL),
	(112, 'GP03', 'Actividades De Promocion Y Prevencion', '--', NULL, 2, 13, 8),
	(113, 'GP01', 'Diente Ausente', '--', NULL, 2, 14, 8),
	(114, 'GP04', 'Corona En Mal Estado', '--', NULL, 2, 15, 8),
	(115, 'GP05', 'Provisional En Mal Estado', '--', NULL, 2, 15, 8),
	(116, 'GP06', 'Resina Desadaptada', '--', '32FF12', 1, 15, NULL),
	(117, 'GP07', 'Amlagama Desadaptada', '--', '2A12FF', 1, 15, NULL),
	(118, 'GP08', 'Ionomero Desadaptado', '--', 'E5FC1C', 1, 15, NULL),
	(119, 'GP09', 'Provisional En Buen Estado', '--', NULL, 2, 15, 8),
	(121, '990203', 'Educacion Individual En Salud, Por Odontologia', '--', NULL, 2, 16, NULL),
	(122, '990212', 'Educacion Individual En Salud, Por Higiene Oral', '--', NULL, 2, 16, 8),
	(123, '997101', 'Aplicacion De Sellantes De Autocurado', '--', NULL, 2, 16, 9),
	(124, '997102', 'Aplicacion De Sellantes De Fotocurado', '--', NULL, 2, 16, 11),
	(125, '997103', 'Topicacion De Fluor En Gel', '--', NULL, 2, 16, 8),
	(127, '997104', 'Topicacion De Fluor En Solucion', '--', NULL, 2, 16, 8),
	(128, '997106', 'Topificacion Barniz De Fluor', '--', NULL, 2, 16, 8),
	(129, '997300', 'Detartraje Supragingival Sod +', '--', NULL, 2, 16, 8),
	(130, '997310', 'Control De Placa Dental Ncoc', '--', NULL, 2, 16, 8),
	(131, 'C00015', 'Topificacion De Fluor En Barniz', '--', NULL, 2, 16, 8),
	(132, '870101', 'Radiografia De Cara (perfilograma) +', '--', NULL, 2, 17, 8),
	(133, '870102', 'Radiografia De Orbitas', '--', NULL, 2, 17, 8),
	(134, '870103', 'Radiografia De Agujeros Opticos', '--', NULL, 2, 17, 8),
	(135, '870104', 'Radiografia De Malar', '--', NULL, 2, 17, 8),
	(136, '870105', 'Radiografia De Arco Cigomatico', '--', NULL, 2, 17, 8),
	(137, '870107', 'Radiografia De Huesos Nasales', '--', NULL, 2, 17, 8),
	(138, '870108', 'Radiografia De Senos Paranasales', '--', NULL, 2, 17, 8),
	(139, '870112', 'Radiografia De Maxilar Superior', '--', NULL, 2, 17, 8),
	(140, '870113', 'Radiografia De Maxilar Inferior', '--', NULL, 2, 17, 8),
	(141, '870114', 'Radiografia Panoramica De Maxilares, Superior E Inferior (ortopantomografia)', '--', NULL, 2, 17, 8),
	(142, '870131', 'Radiografia De Articulacion Temporomaxilar (atm)', '--', NULL, 2, 17, 8),
	(143, '870440', 'Radiografias Intraorales Oclusales', '--', NULL, 2, 17, 8),
	(144, '870450', 'Radiografias Intraorales Periapicales Milimetradas', '--', NULL, 2, 17, 8),
	(145, '870451', 'Radiografias Intraorales Periapicales Dientes Anteriores Superiores', '--', NULL, 2, 17, 8),
	(146, '870452', 'Radiografias Intraorales Periapicales Dientes Anteriores Inferiores', '--', NULL, 2, 17, 8),
	(147, '870453', 'Radiografias Intraorales Periapicales Zona De Caninos', '--', NULL, 2, 17, 8),
	(148, '870454', 'Radiografias Intraorales Periapicales Premolares', '--', NULL, 2, 17, 8),
	(149, '870455', 'Radiografias Intraorales Periapicales Molares', '--', NULL, 2, 17, 8),
	(150, '870456', 'Radiografias Intraorales Periapicales Juego Completo', '--', NULL, 2, 17, 8),
	(151, '870460', 'Radiografias Intraorales Coronales', '--', NULL, 2, 17, 8),
	(152, '230100', 'Exodoncia De Dientes Permanentes Sod', '--', NULL, 2, 18, 8),
	(153, '230101', 'Exodoncia De Diente Permanente Unirradicular +', '--', NULL, 2, 18, 8),
	(154, '230102', 'Exodoncia De Diente Permanente Multirradicular +', '--', NULL, 2, 18, 8),
	(155, '230200', 'Exodoncia De Dientes Temporales Sod', '--', NULL, 2, 18, 8),
	(156, '230201', 'Exodoncia De Diente Temporal Unirradicular +', '--', NULL, 2, 18, 8),
	(157, '230202', 'Exodoncia De Diente Temporal Multirradicular +', '--', NULL, 2, 18, 8),
	(158, '231100', 'Exodoncia Quirurgica Unirradicular Sod', '--', NULL, 2, 18, 8),
	(159, '231200', 'Exodoncia Quirurgica Multirradicular Sod', '--', NULL, 2, 18, 8),
	(160, '231300', 'Exodoncia De Diente Incluido Sod +', '--', NULL, 2, 18, 8),
	(161, '231301', 'Exodoncia De Incluido En Posicion Ectopica Con Abordaje Intraoral +', '--', NULL, 2, 18, 8),
	(162, '231302', 'Exodoncia De Incluido En Posicion Ectopica Con Abordaje Extraoral +', '--', NULL, 2, 18, 8),
	(163, '231400', 'Exodoncias Multiples Con Alveoloplastia, Por Cuadrante Sod', '--', NULL, 2, 18, 8),
	(164, '231500', 'Colgajo Desplazado Para Abordaje De Diente Retenido (ventana Quirurgica) Sod', '--', NULL, 2, 18, 8),
	(165, '237502', 'Procedimientos Correctivos En Fracturas Radiculares', '--', NULL, 2, 18, 8),
	(166, '237600', 'Fistulizacion Endodontica Sod', '--', NULL, 2, 18, 8),
	(167, '237601', 'Fistulizacion Endodontica Por Trepanacion Y Drenaje +', '--', NULL, 2, 18, 8),
	(168, '237602', 'Fistulizacion Endodontica Por Incision +', '--', NULL, 2, 18, 8),
	(169, '237700', 'Radectomia (amputacion Radicular) Sod', '--', NULL, 2, 18, 8),
	(170, '237701', 'Radectomia (amputacion Radicular) Unica', '--', NULL, 2, 18, 8),
	(171, '237702', 'Radectomia (amputacion Radicular) Multiple', '--', NULL, 2, 18, 8),
	(172, '237800', 'Hemiseccion Del Diente Sod', '--', NULL, 2, 18, 8),
	(173, '242202', 'Cirugia A Colgajo Con Reseccion Radicular (amputacion, Hemiseccion)', '--', NULL, 2, 18, 8),
	(174, '245200', 'Alveolectomia Sod +', '--', NULL, 2, 18, 8),
	(175, '249100', 'Control De Hemorragia Dental Pos Quirurgica Sod +', '--', NULL, 2, 18, 8),
	(176, '270100', 'Incision Y Drenaje En Cavidad Bucal Sod', '--', NULL, 2, 18, 8),
	(177, '270101', 'Incision Y Drenaje Intraoral En Cavidad Bucal', '--', NULL, 2, 18, 8),
	(178, '270102', 'Incision Y Drenaje Extraoral En Cavidad Bucal', '--', NULL, 2, 18, 8),
	(179, '271100', 'Drenaje De Coleccion De Paladar Sod', '--', NULL, 2, 18, 8),
	(180, '274100', 'Frenillectomia Labial Sod +', '--', NULL, 2, 18, 8),
	(182, '232101', 'Obturacion Dental Con Amalgama +', '--', '2A12FF ', 1, 19, NULL),
	(183, '232102', 'Obturacion Dental Con Resina De Fotocurado +', '--', '63B982', 1, 19, NULL),
	(184, '232103', 'Obturacion Dental Con Ionomero De Vidrio +', '--', 'E5FC1C', 1, 19, NULL),
	(185, '232200', 'Obturacion Temporal Por Diente Sod', '--', NULL, 2, 19, 8),
	(186, '232401', 'Reconstruccion De Angulo Incisal, Con Resina De Fotocurado', '--', NULL, 2, 19, 8),
	(187, '232402', 'Reconstruccion Tercio Incisal, Con Resina De Fotocurado', '--', NULL, 2, 19, 8),
	(188, '237901', 'Blanqueamiento De Diente [intrinseco] Por Causas Endo-donticas +', '--', NULL, 2, 19, 8),
	(189, '248100', 'Cierre De Diastema (alveolar, Dental) Sod', '--', NULL, 2, 19, 8),
	(190, '997105', 'Aplicacion De Resina Preventiva', '--', '32FF12', 1, 19, NULL),
	(191, '235200', 'Trasplante De Diente (intencional) Sod', '--', NULL, 2, 20, 8),
	(192, '237100', 'Pulpotomia Sod +', '--', NULL, 2, 20, 8),
	(193, '237101', 'Pulpotomia Con Pulpectomia +', '--', NULL, 2, 20, 8),
	(194, '237200', 'Apexificacion (induccion De Apexogenesis) Sod +', '--', NULL, 2, 20, 8),
	(195, '237300', 'Terapia De Conducto Radicular Sod', '--', NULL, 2, 20, 8),
	(196, '237301', 'Terapia De Conducto Radicular En Diente Unirradicular +', '--', NULL, 2, 20, 8),
	(197, '237302', 'Terap Ia De Conducto Radicular En Diente Birradicular +', '--', NULL, 2, 20, 8),
	(198, '237303', 'Terapia De Conducto Radicular En Diente Multirradicular +', '--', NULL, 2, 20, 8),
	(199, '237304', 'Terapia De Conducto Radicular En Diente Temporal Unirra-dicular +', '--', NULL, 2, 20, 8),
	(200, '237305', 'Terapia De Conducto Radicular En Diente Temporal Multi-rradicular +', '--', NULL, 2, 20, 8),
	(201, '237501', 'Procedimiento Correctivo En Resorcion Radicular (interna Y Externa)', '--', NULL, 2, 20, 8),
	(202, '232300', 'Colocacion De Pin Milimetrico Sod', '--', NULL, 2, 21, 8),
	(203, '233100', 'Restauracion De Dientes Mediante Incrustacion Metalica Sod', '--', NULL, 2, 21, 8),
	(204, '233200', 'Restauracion De Dientes Mediante Incrustacion No Metalica Sod', '--', NULL, 2, 21, 8),
	(205, '234100', 'Colocacion O Aplicacion De Corona Sod', '--', NULL, 2, 21, 8),
	(206, '234101', 'Colocacion O Aplicacion De Corona En Acero Inoxidable (para Dientes Temporales)', '--', NULL, 2, 21, 8),
	(207, '234102', 'Colocacion O Aplicacion De Corona En Policarboxilato (para Dientes Temporales)', '--', NULL, 2, 21, 8),
	(208, '234103', 'Colocacion O Aplicacion De Corona En Forma Plastica', '--', NULL, 2, 21, 8),
	(209, '234104', 'Colocacion O Aplicacion De Corona Acrilica Termocurada', '--', NULL, 2, 21, 8),
	(210, '234201', 'Colocacion O Insercion De Protesis Fija Cada Unidad (pilar Y Ponticos)', '--', NULL, 2, 21, 8),
	(211, '234201*', 'Colocacion O Insercion De Protesis Fija Cada Unidad (ponticos)', '--', NULL, 2, 21, 8),
	(212, '234202', 'Reconstruccion De Muñones', '--', NULL, 2, 21, 8),
	(213, '234203', 'Patron De Nucleo', '--', NULL, 2, 21, 8),
	(214, '234204', 'Re Paracion De Protesis Fija', '--', NULL, 2, 21, 8),
	(215, '234301', 'Colocacion O Insercion De Protesis Removible (superior O Inferior) Mucosoportada', '--', NULL, 2, 21, 8),
	(216, '234302', 'Colocacion O Insercion De Protesis Removible (superior O Inferior) Dentomucosoportada', '--', NULL, 2, 21, 8),
	(217, '234303', 'Reparacion De Protesis Removible', '--', NULL, 2, 21, 8),
	(218, '234401', 'Colocacion O Insercion De Protesis Total Medio Caso (superior O Inferior)', '--', NULL, 2, 21, 8),
	(219, '234402', 'Colocacion O Insercion De Protesis Total (superior E Inferior)', '--', NULL, 2, 21, 8),
	(220, '248200', 'Ajustamiento Oclusal Sod', '--', NULL, 2, 21, 8),
	(221, '248400', 'Reparacion De Aparatologia Fija O Removible Sod', '--', NULL, 2, 21, 8),
	(222, '235100', 'Reimplante De Diente Sod', '--', NULL, 2, 22, 8),
	(223, '236100', 'Implante Aloplastico Ceramico Sod', '--', NULL, 2, 22, 8),
	(224, '236200', 'Implante Aloplastico Metalico Sod', '--', NULL, 2, 22, 8),
	(225, '236300', 'Implante Dental Aloplastico (oseointegracion) Sod', '--', NULL, 2, 22, 8),
	(226, '237401', 'Curetaje Apical Con Apicectomia Y Obturacion Retrogada [cirugia Perirradicular]', '--', NULL, 2, 22, 8),
	(227, '240200', 'Detartraje Subgingival Sod +', '--', NULL, 2, 22, 8),
	(228, '240300', 'Alisado Radicular, Campo Cerrado Sod +', '--', NULL, 2, 22, 8),
	(229, '240400', 'Drenaje De Coleccion Periodontal (cerrado Con Alisado Radicular) Sod+', '--', NULL, 2, 22, 8),
	(230, '242100', 'Plastia Mucogingival Sod', '--', NULL, 2, 22, 8),
	(231, '242101', 'Plastia Mucogingival Con Injertos Pediculados (colgajos Pediculados)', '--', NULL, 2, 22, 8),
	(232, '242102', 'Plastia Mucogingival Con Injerto Gingival Libre +', '--', NULL, 2, 22, 8),
	(233, '242201', 'Curetaje A Campo Abierto +', '--', NULL, 2, 22, 8),
	(234, '242300', 'Plastias Preprotesicas (aumento De Corona Clinica) Sod', '--', NULL, 2, 22, 8),
	(235, '242400', 'Reparacion O Plastia Periodontal Regenerativa (injertos, Membranas) Sod', '--', NULL, 2, 22, 8),
	(236, '243400', 'Gingivectomia Sod', '--', NULL, 2, 22, 8),
	(237, '243500', 'Operculectomia Ncoc +', '--', NULL, 2, 22, 8),
	(238, '245100', 'Regularizacion De Rebordes Sod +', '--', NULL, 2, 22, 8),
	(239, '247100', 'Colocacion De Aparatologia Fija Para Ortodoncia (arcada) Sod', '--', NULL, 2, 23, 8),
	(240, '247201', 'Colocacion De Aparatologia Removible Intraoral Para Ortodoncia (arcada)', '--', NULL, 2, 23, 8),
	(241, '247202', 'Colocacion De Aparatologia Removible Extraoral Para Ortodoncia (arcada)', '--', NULL, 2, 23, 8),
	(242, '247300', 'Colocacion De Aparatos De Retencion Sod', '--', NULL, 2, 23, 8),
	(243, '241100', 'Biopsia De Encia Sod', '--', NULL, 2, 24, 8),
	(244, '241101', 'Biopsia Incisional De Encia', '--', NULL, 2, 24, 8),
	(245, '241102', 'Biopsia Escisional De Encia Con Cierre Primario', '--', NULL, 2, 24, 8),
	(246, '241103', 'Biopsia Escisional De Encia Y Recubrimiento Con Colgajo O Injerto', '--', NULL, 2, 24, 8),
	(247, '241200', 'Biopsia De Pared Alveolar Sod +', '--', NULL, 2, 24, 8),
	(248, '272101', 'Biopsia De Uvula', '--', NULL, 2, 24, 8),
	(249, '272102', 'Biopsia Incisional De Paladar', '--', NULL, 2, 24, 8),
	(250, '272103', 'Biopsia Escisional De Paladar', '--', NULL, 2, 24, 8),
	(251, '272300', 'Biopsia De Labio Sod', '--', NULL, 2, 24, 8),
	(252, '272301', 'Biopsia Incisional De Labio', '--', NULL, 2, 24, 8),
	(253, '272302', 'Biopsia Escisional De Labio', '--', NULL, 2, 24, 8),
	(254, '272400', 'Biopsia De Pared De Cavidad Bucal Sod +', '--', NULL, 2, 24, 8),
	(255, '272401', 'Biopsia Por Aspiracion Con Aguja Fina En Cavidad Oral', '--', NULL, 2, 24, 8),
	(256, '273100', 'Escision Local De Lesion En Paladar Oseo Sod', '--', NULL, 2, 25, 8),
	(257, '273101', 'Escision De Lesion Superficial De Paladar', '--', NULL, 2, 25, 8),
	(258, '273102', 'Reseccion Local Del Paladar Por Cauterizacion O Crio-', '--', NULL, 2, 25, 8),
	(259, '273103', 'Reseccion Local Del Paladar Por Quimioterapia', '--', NULL, 2, 25, 8),
	(260, '273200', 'Escision Amplia De Lesion En Paladar Oseo Sod', '--', NULL, 2, 25, 8),
	(261, '273201', 'Escision De Lesion Profunda De Paladar', '--', NULL, 2, 25, 8),
	(262, '273202', 'Reseccion En Bloque De Apofisis Alveolar Y Paladar', '--', NULL, 2, 25, 8),
	(263, '273203', 'Palatectomia Parcial Ncoc +', '--', NULL, 2, 25, 8),
	(264, '273204', 'Palatectomia Total', '--', NULL, 2, 25, 8),
	(265, '276100', 'Sutura De Laceracion De Paladar Sod', '--', NULL, 2, 25, 8),
	(266, '276101', 'Palatorrafia En Z (furlow)', '--', NULL, 2, 25, 8),
	(267, '276200', 'Correccion De Paladar Fisurado (estafilorrafia) Sod', '--', NULL, 2, 25, 8),
	(268, '276201', 'Correccion De Hendidura Alveolopalatina', '--', NULL, 2, 25, 8),
	(269, '276202', 'Cierre De Hendidura Alveolar Con Injerto', '--', NULL, 2, 25, 8),
	(270, '276203', 'Cierre De Hendidura Alveolar Sin Injerto', '--', NULL, 2, 25, 8),
	(271, '276204', 'Reconstruccion De Boveda Palatina Mediante Colgajos Pediculados', '--', NULL, 2, 25, 8),
	(272, '276205', 'Correccion De Fisura Palatina, Con Colgajo Vomeriano', '--', NULL, 2, 25, 8),
	(273, '276206', 'Injerto Oseo De Paladar', '--', NULL, 2, 25, 8),
	(274, '276207', 'Uvulo-palato-faringoplastia', '--', NULL, 2, 25, 8),
	(275, '276208', 'Uvulo-palato-faringoplastia Con Laser', '--', NULL, 2, 25, 8),
	(276, '276300', 'Revision De Reparacion De Paladar Fisurado Sod +', '--', NULL, 2, 25, 8),
	(277, '277100', 'Incision De Uvula Sod +', '--', NULL, 2, 25, 8),
	(278, '277201', 'Reseccion Parcial De Uvula', '--', NULL, 2, 25, 8),
	(279, '277301', 'Uvulorrafia', '--', NULL, 2, 25, 8),
	(280, '278200', 'Incision De Cavidad Bucal, Estructura No Especificada Sod', '--', NULL, 2, 25, 8),
	(281, '278301', 'Cierre Velofaringeo Con Colgajo Faringeo', '--', NULL, 2, 25, 8),
	(282, '278400', 'Correccion De Macro O Microstoma Sod +', '--', NULL, 2, 25, 8),
	(283, '274200', 'Escision De Lesion De Labio Sod', '--', NULL, 2, 26, 8),
	(284, '274201', 'Reseccion Parcial De Labio Por Tumor Maligno +', '--', NULL, 2, 26, 8),
	(285, '274202', 'Reseccion Parcial De Labio Por Tumor Maligno, Con Rotacion De Colgajo', '--', NULL, 2, 26, 8),
	(286, '274203', 'Reseccion Total De Labio Por Tumor Maligno', '--', NULL, 2, 26, 8),
	(287, '274400', 'Reseccion De Fosetas Labiales Sod +', '--', NULL, 2, 26, 8),
	(288, '275100', 'Sutura De Laceracion En Labios Sod', '--', NULL, 2, 26, 8),
	(289, '275101', 'Sutura O Reparacion De Laceracion (herida) En Labios Hasta De Cinco Centimetros +', '--', NULL, 2, 26, 8),
	(290, '275102', 'Sutura O Reparacion De Laceracion (herida) En Labios De Mas De Cinco Centimetros +', '--', NULL, 2, 26, 8),
	(291, '275400', 'Reparacion De Labio Fisurado [queiloplastia] Sod', '--', NULL, 2, 26, 8),
	(292, '275401', 'Correccion Parcial De Labio Fisurado Por Adhesion', '--', NULL, 2, 26, 8),
	(293, '275402', 'Correccion Primaria De Labio Fisurado Unilateral', '--', NULL, 2, 26, 8),
	(294, '275403', 'Correccion Secundaria De Labio Fisurado Unilateral', '--', NULL, 2, 26, 8),
	(295, '275404', 'Correccion De Labio Fisurado Bilateral Ncoc +', '--', NULL, 2, 26, 8),
	(296, '243200', 'Sutura De Laceracion De Encia Sod', '--', NULL, 2, 27, 8),
	(297, '243201', 'Sutura De Laceracion De Encia, Menor De Tres Centimetros', '--', NULL, 2, 27, 8),
	(298, '243202', 'Sutura De Laceracion De Encia, Mayor De Tres Centimetros', '--', NULL, 2, 27, 8),
	(299, '274300', 'Escision De Lesion En Mucosa Oral Sod', '--', NULL, 2, 27, 8),
	(300, '274301', 'Reseccion De Lesion Benigna De La Mucosa Oral, Hasta De Dos Centimetros De Diametro', '--', NULL, 2, 27, 8),
	(301, '274302', 'Reseccion De Lesion Benigna De La Mucosa Oral, Mayor De Dos Centimetros De Diametro', '--', NULL, 2, 27, 8),
	(302, '274303', 'Reseccion De Tumor Maligno De Mucosa Oral +', '--', NULL, 2, 27, 8),
	(303, '274304', 'Reseccion De Tumor Maligno De Mucosa Oral, Con Colgajo Local O A Distancia', '--', NULL, 2, 27, 8),
	(304, '274901', 'Remocion De Cuerpo Extraño En Tejidos Blandos De La Boca', '--', NULL, 2, 27, 8),
	(305, '274902', 'Reseccion De Bridas Intraorales', '--', NULL, 2, 27, 8),
	(306, '275103', 'Sutura Y/o Plastia En Avulsion De Labios', '--', NULL, 2, 27, 8),
	(307, '275200', 'Sutura De Laceracion De Otra Parte De La Boca Sod', '--', NULL, 2, 27, 8),
	(308, '275201', 'Estomatorrafia (sutura De Herida En Mucosa Oral) De Menos De Cinco Centimetros', '--', NULL, 2, 27, 8),
	(309, '275202', 'Estomatorrafia (sutura De Herida En Mucosa Oral) De Masde Cinco Centimetros', '--', NULL, 2, 27, 8),
	(310, '243100', 'Escision De Lesion De Encia Sod', '--', NULL, 2, 28, 8),
	(311, '243101', 'Escision De Lesion Benigna Encapsulada En Encia Hasta De Tres Centimetros', '--', NULL, 2, 28, 8),
	(312, '243102', 'Escision De Lesion Benigna Encapsulada En Encia De Mas De Tres Centimetros', '--', NULL, 2, 28, 8),
	(313, '243103', 'Escision De Lesion Benigna No Encapsulada En Encia Hasta De Tres Centimetros', '--', NULL, 2, 28, 8),
	(314, '243104', 'Escision De Lesion Benigna No Encapsulada En Encia De Mas De Tres Cen', '--', NULL, 2, 28, 8),
	(315, '243105', 'Escision De Lesion Maligna De Encia Sin Vaciamiento Ganglionar Ni Reseccion De Estructuras Vecinas U', '--', NULL, 2, 28, 8),
	(316, '243106', 'Escision De Lesion Maligna De Encia Con Vaciamiento Ganglionar, Piso De Boca Y/o Lengua Con Cierre P', '--', NULL, 2, 28, 8),
	(317, '243107', 'Escision De Lesion Maligna De Encia Con Vaciamiento Ganglionar, Piso De Boca Y/o Lengua Y Reconstruc', '--', NULL, 2, 28, 8),
	(318, '243108', 'Escision De Lesion Maligna De Encia Con Vaciamiento Ganglionar, Reseccion Osea Y Reconstruccion Con ', '--', NULL, 2, 28, 8),
	(319, '243109', 'Escision De Lesion Maligna De Encia Con Vaciamiento Ganglionar, Reseccion Osea Y Reconstruccion Con ', '--', NULL, 2, 28, 8),
	(320, '243300', 'Enucleacion De Quiste Epidermoide Sod', '--', NULL, 2, 28, 8),
	(321, '243301', 'Enucleacion De Quiste Epidermoide, Via Intraoral', '--', NULL, 2, 28, 8),
	(322, '243302', 'Enucleacion De Quiste Epidermoide, Via Extraoral', '--', NULL, 2, 28, 8),
	(323, '244100', 'Escision De Lesion Odontogenica Sod', '--', NULL, 2, 28, 8),
	(324, '244101', 'Enucleacion De Quiste Odontogenico Hasta De Tres Centimetros De Diametro+', '--', NULL, 2, 28, 8),
	(325, '244102', 'Enucleacion De Quiste Odontogenico De Mas De Tres Centimetros De Diametro', '--', NULL, 2, 28, 8),
	(326, '244108', 'Marsupializacion De Quiste Odontogenico +', '--', NULL, 2, 28, 8),
	(327, '244103', 'Reseccion De Tumor Benigno O Maligno Odontogenico', '--', NULL, 2, 29, 8),
	(328, '244104', 'Reseccion De Tumor Benigno O Maligno Odontogenico Y Reconstruccion Inmediata Con Injerto Oseo Libre', '--', NULL, 2, 29, 8),
	(329, '244105', 'Reseccion De Tumor Benigno O Maligno Odontogenico Y Reconstruccion Con Colgajo Oseo Pediculado', '--', NULL, 2, 29, 8),
	(330, '244106', 'Reseccion De Tumor Benigno O Maligno Odontogenico Y Reconstruccion Con Colgajo Oseo Libre', '--', NULL, 2, 29, 8),
	(331, '244107', 'Reseccion De Tumor Benigno O Maligno Odontogenico Y Reconstruccion Con Placa', '--', NULL, 2, 29, 8),
	(332, '237902', 'Exploracion Y Movilizacion De Nervio Dentario Inferior', '--', NULL, 2, 30, 8),
	(333, '242204', 'Aumento De Reborde Parcialmente Edentulo (sin Material)', '--', NULL, 2, 30, 8),
	(334, '242205', 'Aumento De Reborde Parcialmente Edentulo (con Material)', '--', NULL, 2, 30, 8),
	(335, '247400', 'Ferulizacion Sod', '--', NULL, 2, 30, 8),
	(336, '247401', 'Ferulizacion Rigida (superior Y/o Inferior)', '--', NULL, 2, 30, 8),
	(337, '247402', 'Ferulizacion Semirrigida (superior Y/o Inferior)', '--', NULL, 2, 30, 8),
	(338, '275301', 'Reseccion Intraoral De Fistula De Boca', '--', NULL, 2, 30, 8),
	(339, '275302', 'Reseccion Extraoral De Fistula De Boca', '--', NULL, 2, 30, 8),
	(340, '275303', 'Cierre De Fistula Orosinusal U Oronasal, Con Colgajo Palatino, Lingual O Bucal', '--', NULL, 2, 30, 8),
	(341, '275304', 'Cierre De Fistula Orosinusal Con Sinusotomia, Con O Sin Remocion De Cuerpo Extraño O Colgajo Palatin', '--', NULL, 2, 30, 8),
	(342, '275305', 'Alargamiento De Paladar Con Colgajo En Isla', '--', NULL, 2, 30, 8),
	(343, '275500', 'Injerto De Piel De Grosor Total Aplicado Al Labio Y Cavidad Bucal Sod', '--', NULL, 2, 30, 8),
	(344, '275601', 'Lipoinjerto En Cara', '--', NULL, 2, 30, 8),
	(345, '275701', 'Injerto De Piel En Labios Con Adhesion De Colgajo Pediculado', '--', NULL, 2, 30, 8),
	(346, '275800', 'Profundizacion De Piso De Boca Sod', '--', NULL, 2, 30, 8),
	(347, '275801', 'Profundizacion O Descenso De Piso De Boca Con Desinsercion De Milohiodeo Y/o Genihiodeo', '--', NULL, 2, 30, 8),
	(348, '275900', 'Profundizacion De Surco Vestibular Sod', '--', NULL, 2, 30, 8),
	(349, '275901', 'Profundizacion De Surco Vestibular Con Injerto Mucoso', '--', NULL, 2, 30, 8),
	(350, '275902', 'Profundizacion De Surco Vestibular Con Injerto Cutaneo', '--', NULL, 2, 30, 8);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.medicos
CREATE TABLE IF NOT EXISTS `medicos` (
  `Id` bigint(15) NOT NULL,
  `Tipoid` enum('CC','TI','RC','AN') COLLATE utf8_spanish2_ci NOT NULL,
  `Nombres` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Apellidos` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Edad` int(3) NOT NULL,
  `Sexo` enum('F','M') COLLATE utf8_spanish2_ci NOT NULL,
  `Telefono` varchar(6) COLLATE utf8_spanish2_ci NOT NULL,
  `Celular` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `Direccion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Usuario` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Password` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Estado` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Usuario` (`Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.medicos: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `medicos` DISABLE KEYS */;
INSERT INTO `medicos` (`Id`, `Tipoid`, `Nombres`, `Apellidos`, `Edad`, `Sexo`, `Telefono`, `Celular`, `Direccion`, `Usuario`, `Password`, `Estado`) VALUES
	(11043, 'CC', 'andres', 'arreola', 25, 'M', '281000', '300856412', 'sincelejo', '', '', b'1');
/*!40000 ALTER TABLE `medicos` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.pacienteprocedures
CREATE TABLE IF NOT EXISTS `pacienteprocedures` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Historia` int(11) NOT NULL,
  `Diente` int(11) DEFAULT NULL,
  `Zone` int(11) NOT NULL,
  `Procedure` int(11) NOT NULL,
  `Tipe` int(11) NOT NULL,
  `Cause` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Paciente_Diente_Zone_Procedure` (`Historia`,`Diente`,`Zone`,`Tipe`),
  KEY `FK_PacienteDiagnosticos_paciente` (`Historia`),
  KEY `FK_PacienteDiagnosticos_dientes` (`Diente`),
  KEY `FK_PacienteDiagnosticos_diagnosticos` (`Procedure`),
  KEY `FK_pacienteprocedures_zones` (`Zone`),
  KEY `FK_pacienteprocedures_tipeitems` (`Tipe`),
  KEY `FK_pacienteprocedures_pacienteprocedures` (`Cause`),
  CONSTRAINT `FK_PacienteDiagnosticos_diagnosticos` FOREIGN KEY (`Procedure`) REFERENCES `items` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_PacienteDiagnosticos_dientes` FOREIGN KEY (`Diente`) REFERENCES `dientes` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pacienteprocedures_Historia` FOREIGN KEY (`Historia`) REFERENCES `historias` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pacienteprocedures_pacienteprocedures` FOREIGN KEY (`Cause`) REFERENCES `pacienteprocedures` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pacienteprocedures_tipeitems` FOREIGN KEY (`Tipe`) REFERENCES `tipeitems` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pacienteprocedures_zones` FOREIGN KEY (`Zone`) REFERENCES `zones` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1526 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.pacienteprocedures: ~46 rows (aproximadamente)
/*!40000 ALTER TABLE `pacienteprocedures` DISABLE KEYS */;
INSERT INTO `pacienteprocedures` (`Id`, `Fecha`, `Historia`, `Diente`, `Zone`, `Procedure`, `Tipe`, `Cause`) VALUES
	(51, '2016-04-20 17:44:46', 2, 18, 1, 13, 1, NULL),
	(73, '2016-04-21 11:08:21', 2, 22, 1, 13, 1, NULL),
	(77, '2016-04-21 11:55:15', 2, 40, 1, 13, 1, NULL),
	(78, '2016-04-21 11:55:21', 2, 40, 5, 13, 1, NULL),
	(82, '2016-04-21 16:53:54', 2, 21, 1, 13, 1, NULL),
	(130, '2016-04-27 17:53:45', 2, 23, 9, 2, 1, NULL),
	(156, '2016-04-27 17:55:41', 2, 22, 9, 2, 1, NULL),
	(158, '2016-04-27 17:57:00', 2, NULL, 11, 4, 1, NULL),
	(159, '2016-04-27 17:57:29', 2, 38, 8, 5, 1, NULL),
	(162, '2016-04-27 18:08:40', 2, 23, 1, 13, 1, NULL),
	(165, '2016-05-02 16:40:43', 2, 21, 8, 1, 1, NULL),
	(178, '2016-05-02 16:53:09', 2, 7, 8, 1, 1, NULL),
	(179, '2016-05-02 16:53:12', 2, 8, 8, 1, 1, NULL),
	(181, '2016-05-02 16:56:09', 2, 39, 1, 16, 1, NULL),
	(182, '2016-05-02 16:57:01', 2, 39, 2, 19, 1, NULL),
	(183, '2016-05-02 16:59:34', 2, 14, 1, 14, 1, NULL),
	(186, '2016-05-02 16:59:44', 2, 14, 2, 16, 1, NULL),
	(187, '2016-05-02 16:59:51', 2, 14, 3, 18, 1, NULL),
	(188, '2016-05-02 16:59:57', 2, 15, 8, 20, 1, NULL),
	(189, '2016-05-02 17:30:49', 2, 5, 9, 2, 1, NULL),
	(190, '2016-05-02 17:30:54', 2, 5, 8, 1, 1, NULL),
	(192, '2016-05-26 16:39:32', 2, 22, 4, 17, 1, NULL),
	(195, '2016-05-26 16:39:38', 2, 22, 5, 17, 1, NULL),
	(196, '2016-05-26 16:39:41', 2, 22, 2, 17, 1, NULL),
	(197, '2016-05-26 16:39:47', 2, 22, 7, 18, 1, NULL),
	(198, '2016-05-26 16:39:52', 2, 18, 3, 18, 1, NULL),
	(199, '2016-05-26 16:53:38', 2, 3, 1, 18, 1, NULL),
	(200, '2016-05-26 16:53:43', 2, 11, 1, 18, 1, NULL),
	(201, '2016-05-26 16:53:45', 2, 11, 7, 18, 1, NULL),
	(202, '2016-05-26 16:53:49', 2, 45, 1, 18, 1, NULL),
	(211, '2016-05-26 17:46:49', 2, 44, 10, 9, 1, NULL),
	(212, '2016-05-30 19:03:34', 2, 33, 9, 2, 1, NULL),
	(269, '2016-05-30 20:07:36', 2, 31, 5, 16, 1, NULL),
	(273, '2016-05-30 20:07:45', 2, 31, 1, 6, 1, NULL),
	(274, '2016-05-30 20:07:48', 2, 31, 3, 6, 1, NULL),
	(277, '2016-05-30 20:07:53', 2, 31, 4, 6, 1, NULL),
	(285, '2016-05-31 15:16:34', 2, 11, 6, 17, 1, NULL),
	(288, '2016-05-31 19:59:00', 2, 11, 7, 121, 2, 201),
	(289, '2016-05-31 20:26:12', 2, 11, 6, 121, 2, 285),
	(291, '2016-06-06 00:34:34', 2, 11, 1, 121, 2, 200),
	(315, '2016-06-06 01:11:10', 2, 38, 1, 13, 1, NULL),
	(316, '2016-06-06 14:30:11', 2, 45, 1, 121, 2, 202),
	(327, '2016-06-07 21:57:01', 2, NULL, 11, 124, 2, 158),
	(328, '2016-06-22 21:53:47', 2, 24, 8, 33, 1, NULL),
	(338, '2016-06-23 15:08:16', 2, 8, 8, 122, 2, 179),
	(339, '2016-06-23 15:08:34', 2, 7, 8, 122, 2, 178),
	(1458, '2016-04-20 17:44:46', 73, 18, 1, 13, 1, NULL),
	(1459, '2016-05-02 17:30:54', 73, 5, 8, 1, 1, NULL),
	(1460, '2016-05-26 16:39:32', 73, 22, 4, 17, 1, NULL),
	(1461, '2016-05-26 16:39:38', 73, 22, 5, 17, 1, NULL),
	(1462, '2016-05-26 16:39:41', 73, 22, 2, 17, 1, NULL),
	(1463, '2016-05-26 16:39:47', 73, 22, 7, 18, 1, NULL),
	(1464, '2016-05-26 16:39:52', 73, 18, 3, 18, 1, NULL),
	(1465, '2016-05-26 16:53:38', 73, 3, 1, 18, 1, NULL),
	(1466, '2016-05-26 17:46:49', 73, 44, 10, 9, 1, NULL),
	(1467, '2016-05-30 19:03:34', 73, 33, 9, 2, 1, NULL),
	(1468, '2016-05-30 20:07:36', 73, 31, 5, 16, 1, NULL),
	(1469, '2016-05-30 20:07:45', 73, 31, 1, 6, 1, NULL),
	(1470, '2016-05-30 20:07:48', 73, 31, 3, 6, 1, NULL),
	(1471, '2016-05-30 20:07:53', 73, 31, 4, 6, 1, NULL),
	(1472, '2016-06-06 01:11:10', 73, 38, 1, 13, 1, NULL),
	(1473, '2016-06-22 21:53:47', 73, 24, 8, 33, 1, NULL),
	(1474, '2016-05-02 17:30:49', 73, 5, 9, 2, 1, NULL),
	(1475, '2016-05-02 16:59:57', 73, 15, 8, 20, 1, NULL),
	(1476, '2016-04-21 11:08:21', 73, 22, 1, 13, 1, NULL),
	(1477, '2016-04-21 11:55:15', 73, 40, 1, 13, 1, NULL),
	(1478, '2016-04-21 11:55:21', 73, 40, 5, 13, 1, NULL),
	(1479, '2016-04-21 16:53:54', 73, 21, 1, 13, 1, NULL),
	(1480, '2016-04-27 17:53:45', 73, 23, 9, 2, 1, NULL),
	(1481, '2016-04-27 17:55:41', 73, 22, 9, 2, 1, NULL),
	(1482, '2016-04-27 17:57:29', 73, 38, 8, 5, 1, NULL),
	(1483, '2016-04-27 18:08:40', 73, 23, 1, 13, 1, NULL),
	(1484, '2016-05-02 16:40:43', 73, 21, 8, 1, 1, NULL),
	(1485, '2016-05-02 16:53:09', 73, 7, 8, 1, 1, NULL),
	(1486, '2016-05-02 16:56:09', 73, 39, 1, 16, 1, NULL),
	(1487, '2016-05-02 16:57:01', 73, 39, 2, 19, 1, NULL),
	(1488, '2016-05-02 16:59:34', 73, 14, 1, 14, 1, NULL),
	(1489, '2016-05-02 16:59:44', 73, 14, 2, 16, 1, NULL),
	(1490, '2016-05-02 16:59:51', 73, 14, 3, 18, 1, NULL),
	(1491, '2016-06-23 15:08:34', 73, 7, 8, 122, 2, 1485),
	(1492, '2016-05-26 16:53:38', 74, 3, 1, 18, 1, NULL),
	(1493, '2016-04-27 17:55:41', 74, 22, 9, 2, 1, NULL),
	(1494, '2016-04-27 18:08:40', 74, 23, 1, 13, 1, NULL),
	(1495, '2016-04-27 17:53:45', 74, 23, 9, 2, 1, NULL),
	(1496, '2016-06-22 21:53:47', 74, 24, 8, 33, 1, NULL),
	(1497, '2016-05-30 20:07:45', 74, 31, 1, 6, 1, NULL),
	(1498, '2016-05-30 20:07:48', 74, 31, 3, 6, 1, NULL),
	(1499, '2016-05-30 20:07:53', 74, 31, 4, 6, 1, NULL),
	(1500, '2016-05-30 20:07:36', 74, 31, 5, 16, 1, NULL),
	(1501, '2016-05-30 19:03:34', 74, 33, 9, 2, 1, NULL),
	(1502, '2016-06-06 01:11:10', 74, 38, 1, 13, 1, NULL),
	(1503, '2016-04-27 17:57:29', 74, 38, 8, 5, 1, NULL),
	(1504, '2016-05-02 16:56:09', 74, 39, 1, 16, 1, NULL),
	(1505, '2016-05-02 16:57:01', 74, 39, 2, 19, 1, NULL),
	(1506, '2016-04-21 11:55:15', 74, 40, 1, 13, 1, NULL),
	(1507, '2016-04-21 11:55:21', 74, 40, 5, 13, 1, NULL),
	(1508, '2016-05-26 16:39:47', 74, 22, 7, 18, 1, NULL),
	(1509, '2016-05-26 16:39:38', 74, 22, 5, 17, 1, NULL),
	(1510, '2016-05-02 17:30:54', 74, 5, 8, 1, 1, NULL),
	(1511, '2016-05-02 17:30:49', 74, 5, 9, 2, 1, NULL),
	(1512, '2016-05-02 16:53:09', 74, 7, 8, 1, 1, NULL),
	(1513, '2016-05-02 16:59:34', 74, 14, 1, 14, 1, NULL),
	(1514, '2016-05-02 16:59:44', 74, 14, 2, 16, 1, NULL),
	(1515, '2016-05-02 16:59:51', 74, 14, 3, 18, 1, NULL),
	(1516, '2016-05-02 16:59:57', 74, 15, 8, 20, 1, NULL),
	(1517, '2016-04-20 17:44:46', 74, 18, 1, 13, 1, NULL),
	(1518, '2016-05-26 16:39:52', 74, 18, 3, 18, 1, NULL),
	(1519, '2016-04-21 16:53:54', 74, 21, 1, 13, 1, NULL),
	(1520, '2016-05-02 16:40:43', 74, 21, 8, 1, 1, NULL),
	(1521, '2016-04-21 11:08:21', 74, 22, 1, 13, 1, NULL),
	(1522, '2016-05-26 16:39:41', 74, 22, 2, 17, 1, NULL),
	(1523, '2016-05-26 16:39:32', 74, 22, 4, 17, 1, NULL),
	(1524, '2016-05-26 17:46:49', 74, 44, 10, 9, 1, NULL),
	(1525, '2016-06-23 15:08:34', 74, 7, 8, 122, 2, 1512);
/*!40000 ALTER TABLE `pacienteprocedures` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.pacientes
CREATE TABLE IF NOT EXISTS `pacientes` (
  `Id` bigint(15) NOT NULL,
  `Tipoid` enum('CC','TI','RC','AN') COLLATE utf8_spanish2_ci NOT NULL,
  `Nombres` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Apellidos` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Edad` int(3) NOT NULL,
  `Sexo` enum('F','M') COLLATE utf8_spanish2_ci NOT NULL,
  `Telefono` varchar(6) COLLATE utf8_spanish2_ci NOT NULL,
  `Celular` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `Direccion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Estado` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.pacientes: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` (`Id`, `Tipoid`, `Nombres`, `Apellidos`, `Edad`, `Sexo`, `Telefono`, `Celular`, `Direccion`, `Estado`) VALUES
	(789, 'CC', 'pedro', 'perez', 34, 'M', '280536', '31245689', 'sincelejo', b'1'),
	(1104, 'CC', 'carlos', 'guzman', 24, 'M', '274563', '300', 'sincelejo', b'1');
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.posiciondents
CREATE TABLE IF NOT EXISTS `posiciondents` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Descripcion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_posiciondents_posiciondents` (`Parent`),
  CONSTRAINT `FK_posiciondents_posiciondents` FOREIGN KEY (`Parent`) REFERENCES `posiciondents` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.posiciondents: ~14 rows (aproximadamente)
/*!40000 ALTER TABLE `posiciondents` DISABLE KEYS */;
INSERT INTO `posiciondents` (`Id`, `Nombre`, `Descripcion`, `Parent`) VALUES
	(1, 'Rowup', 'Fila superior de dientes', NULL),
	(2, 'Rowdown', 'Fila inferior de dientes', NULL),
	(3, 'Groupupleft', 'Fila superior izquierda de dientes', 1),
	(4, 'Groupupright', 'Fila superior derecha de dientes', 1),
	(5, 'Groupdownleft', 'Fila inferior izquierda de dientes', 2),
	(6, 'Groupdownright', 'Fila inferior derecha de dientes', 2),
	(7, 'Subgroupupleftadult', 'Fila superior izquierda de dientes adultos', 3),
	(8, 'Subgroupupleftchild', 'Fila superior izquierda de dientes niños', 3),
	(9, 'Subgroupuprightadult', 'Fila superior derecha de dientes adultos', 4),
	(10, 'Subgroupuprightchild', 'Fila superior derecha de dientes niños', 4),
	(11, 'Subgroupdownleftadult', 'Fila inferior izquierda de dientes adultos', 5),
	(12, 'Subgroupdownleftchild', 'Fila inferior izquierda de dientes niños', 5),
	(13, 'Subgroupdownrightadult', 'Fila inferior derecha de dientes adultos', 6),
	(14, 'Subgroupdownrightchild', 'Fila inferior derecha de dientes niños', 6);
/*!40000 ALTER TABLE `posiciondents` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.representacion
CREATE TABLE IF NOT EXISTS `representacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Descripcion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.representacion: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `representacion` DISABLE KEYS */;
INSERT INTO `representacion` (`id`, `Nombre`, `Descripcion`) VALUES
	(1, 'Color', 'Los items de este tipo seran pintados en una de las zonas del diente'),
	(2, 'Grafico', 'Los items de este tipo se representan con una forma');
/*!40000 ALTER TABLE `representacion` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.tipeitems
CREATE TABLE IF NOT EXISTS `tipeitems` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Descripcion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.tipeitems: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tipeitems` DISABLE KEYS */;
INSERT INTO `tipeitems` (`Id`, `Nombre`, `Descripcion`) VALUES
	(1, 'Diagnosticos', 'Estos items seran los usados para realizar los diagnosticos de los dientes'),
	(2, 'Tratamientos', 'Estos items seran los usados para los tratamientos de los dientes');
/*!40000 ALTER TABLE `tipeitems` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.ubicaciones
CREATE TABLE IF NOT EXISTS `ubicaciones` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Ubicacion` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Ubicacionup` int(11) DEFAULT NULL,
  `Descripcion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_ubicaciones_ubicaciones` (`Ubicacionup`),
  CONSTRAINT `FK_ubicaciones_ubicaciones` FOREIGN KEY (`Ubicacionup`) REFERENCES `ubicaciones` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.ubicaciones: ~14 rows (aproximadamente)
/*!40000 ALTER TABLE `ubicaciones` DISABLE KEYS */;
INSERT INTO `ubicaciones` (`Id`, `Ubicacion`, `Ubicacionup`, `Descripcion`) VALUES
	(1, 'Rowup', NULL, 'Fila superior de dientes'),
	(2, 'Rowdown', NULL, 'Fila inferior de dientes'),
	(3, 'Groupleftup', 1, 'Grupo superior izquierdo de dientes'),
	(4, 'Grouprightup', 1, 'Grupo superior derecho de dientes'),
	(5, 'Groupleftdown', 2, 'Grupo inferior izquierdo de dientes'),
	(6, 'Grouprightdown', 2, 'Grupo inferior derecho de dientes'),
	(7, 'Subgroupleftadultup', 3, 'Grupo superior izquierdo de dientes adultos'),
	(8, 'Subgroupleftchildup', 3, 'Grupo superior izquierdo de dientes niños'),
	(9, 'Subgrouprightadultup', 4, 'Grupo superior derecho de dientes adultos'),
	(10, 'Subgrouprightchildup', 4, 'Grupo superior derecho de dientes niños'),
	(11, 'Subgroupleftadultdown', 5, 'Grupo inferior izquierdo de dientes adultos'),
	(12, 'Subgroupleftchilddown', 5, 'Grupo inferrior izquierdo de dientes niños'),
	(13, 'Subgrouprightadultdown', 6, 'Grupo inferior derecho de dientes adultos'),
	(14, 'Subgrouprightchilddown', 6, 'Grupo inferior derecho de dientes niños');
/*!40000 ALTER TABLE `ubicaciones` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `Id` bigint(15) NOT NULL,
  `Tipoid` enum('CC','TI','RC','AN') COLLATE utf8_spanish2_ci NOT NULL,
  `Nombres` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Apellidos` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Edad` int(3) NOT NULL,
  `Sexo` enum('F','M') COLLATE utf8_spanish2_ci NOT NULL,
  `Telefono` varchar(6) COLLATE utf8_spanish2_ci NOT NULL,
  `Celular` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `Direccion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Usuario` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Password` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Estado` bit(1) NOT NULL DEFAULT b'1',
  `Tipo` varchar(4) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '1111',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Usuario` (`Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.usuarios: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`Id`, `Tipoid`, `Nombres`, `Apellidos`, `Edad`, `Sexo`, `Telefono`, `Celular`, `Direccion`, `Usuario`, `Password`, `Estado`, `Tipo`) VALUES
	(92654, 'CC', '92654', 'ana', 30, 'F', '280000', '31284563', 'sincelej', 'ana', 'ana', b'1', '1111');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.zones
CREATE TABLE IF NOT EXISTS `zones` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Descripcion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.zones: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
INSERT INTO `zones` (`Id`, `Nombre`, `Descripcion`) VALUES
	(1, 'Oclusal', 'Es la misma cara que el incisal pero en este caso se refiere puntualmente a los premolares y molares. Se trata de la superficie masticatoria del diente con la que se maceran los alimentos.'),
	(2, 'Vestibular', 'Se trata de la cara de los dientes que dan hacia el lado exterior, o sea, que la cara vestibular de los incisivos centrales superiores es la que vemos cuando alguien se sonríe.'),
	(3, 'Palatina', 'Se trata de la cara de los dientes que mira hacia el paladar, este término se usa para la arcada superior. Salvo en la operatoria dental no se emplea este término, normalmente se emplea el uso lingual'),
	(4, 'Mesial', 'Se trata te la línea media del diente, hacia el centro o hacia una línea imaginaria que divide al ser humano en dos trozos simétricos.'),
	(5, 'Distal', 'Es la cara que se aleja de la línea media. Tanto el término distal como mesial se definen en base a una posición anatómica.'),
	(6, 'Cervical Vestibular I', 'Inferior exterior'),
	(7, 'Cervical Vestibular S', 'Superior esterior'),
	(8, 'Top', 'Se ubica en el contenedor junto con el numero del diente'),
	(9, 'Bot', 'se ubica bajo el diente'),
	(10, 'General', 'Se ubica representa de forma que se sobrepone a todo el diente'),
	(11, 'Nula', 'Se trata de los procedimientos que no tienen una representacion grafica');
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
