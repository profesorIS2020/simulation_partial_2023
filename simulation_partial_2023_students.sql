-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:13306
-- Tiempo de generación: 17-11-2023 a las 10:37:18
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `simulation_partial_2023_students`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ddl_2023`
--

DROP TABLE IF EXISTS `ddl_2023`;
CREATE TABLE IF NOT EXISTS `ddl_2023` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `enunciado` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `definición` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `query` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `ddl_2023`
--

INSERT INTO `ddl_2023` (`id`, `enunciado`, `definición`, `query`) VALUES
(1, 'Defina y halle el grado de la relación instructor utilizando SQL.', 'El grado es el número de atributos que contiene una relación', '1.DESC instructor; => 5;\r\n2. SHOW COLUMNS FROM instructor; => 5\r\n3.SELECT COUNT(COLUMN_NAME) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA =\'simulation_partial_2023_students\'AND TABLE_NAME = \'instructor\'; => 8\r\n4.SELECT COUNT(COLUMN_NAME) AS grade FROM information_schema.COLUMNS WHERE TABLE_SCHEMA =\'simulation_partial_2023_students\'AND TABLE_NAME = \'instructor\'; => 10 '),
(2, 'Halle la cardinalidad de la relación instructor.', 'La cardinalidad es el número de filas que presenta una relación', 'SELECT COUNT(ID) FROM instructor;=>8;\r\nSELECT COUNT(ID) AS cardinality FROM instructor;=>10;'),
(3, 'Determine la definición de charset y una query para obtenerlo.', 'El charset es un conjunto de símbolos y codificaciones, es decir, la forma en que la base de datos guarda internamente los datos. ', 'SELECT DEFAULT_CHARACTER_SET_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME =\'simulation_partial_2023_students\''),
(4, 'Defina y obtenga mediante query el collation de la relación instructor', 'El collation es el conjunto de reglas que se aplican para comparar caracteres en un charset , es decir, indica a la base de datos como debe comparar los datos.\r\n', 'SELECT DEFAULT_COLLATION_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME =\'simulation_partial_2023_students\''),
(5, 'El atributo ID identifica unívocamente a cada estudiante y es un número natural positivo menor o igual que 255. Cree una tabla \"pregunta_4\" que contenga al campo ID. Defina el tipo del dato, el tipo de campo y el subtipo de dato. Defina también el tipo de atributo.\r\n', 'Tipo de dato: Numérico, sin punto flotante, tinyint', 'DROP TABLE IF EXISTS `pregunta_4`;\r\nCREATE TABLE IF NOT EXISTS `pregunta_4` (\r\n  `ID` tinyint \r\n) => 4\r\nDROP TABLE IF EXISTS `pregunta_4`;\r\nCREATE TABLE IF NOT EXISTS `pregunta_4` (\r\n  `ID` tinyint NOT NULL,\r\n) \r\nCOMMIT; => 5\r\nDROP TABLE IF EXISTS `pregunta_4`;\r\nCREATE TABLE IF NOT EXISTS `pregunta_4` (\r\n  `ID` tinyint NOT NULL,\r\n  PRIMARY KEY (`ID`)\r\n) => 7\r\n\r\nDROP TABLE IF EXISTS `pregunta_4`;\r\nCREATE TABLE IF NOT EXISTS `pregunta_4` (\r\n  `ID` tinyint NOT NULL,\r\n  PRIMARY KEY (`ID`)\r\n) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;\r\nCOMMIT; =>10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dml_2023`
--

DROP TABLE IF EXISTS `dml_2023`;
CREATE TABLE IF NOT EXISTS `dml_2023` (
  `id` int NOT NULL AUTO_INCREMENT,
  `enunciado` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL,
  `operation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `conjuntos` text NOT NULL,
  `query_ar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `query_sql` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_in` date NOT NULL,
  `updated_in` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dni` varchar(255) NOT NULL,
  `user` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Disparadores `dml_2023`
--
DROP TRIGGER IF EXISTS `updated_in`;
DELIMITER $$
CREATE TRIGGER `updated_in` BEFORE UPDATE ON `dml_2023` FOR EACH ROW BEGIN
SET NEW.updated_in = NOW();

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructor`
--

DROP TABLE IF EXISTS `instructor`;
CREATE TABLE IF NOT EXISTS `instructor` (
  `ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dept_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `instructor`
--

INSERT INTO `instructor` (`ID`, `name`, `dept_name`, `salary`) VALUES
('10101', 'Srinivasan', 'Comp. Sci.', '65000.00'),
('12121', 'Wu', 'Finance', '90000.00'),
('15151', 'Mozart', 'Music', '40000.00'),
('22222', 'Einstein', 'Physics', '95000.00'),
('32343', 'El Said', 'History', '60000.00'),
('33456', 'Gold', 'Physics', '87000.00'),
('45565', 'Katz', 'Comp. Sci.', '75000.00'),
('58583', 'Califieri', 'History', '62000.00'),
('76543', 'Singh', 'Finance', '80000.00'),
('76766', 'Crick', 'Biology', '72000.00'),
('83821', 'Brandt', 'Comp. Sci.', '92000.00'),
('98345', 'Kim', 'Elec. Eng.', '80000.00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
