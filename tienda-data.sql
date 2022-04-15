-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 15-04-2022 a las 01:00:36
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

DROP TABLE IF EXISTS `compra`;
CREATE TABLE IF NOT EXISTS `compra` (
  `idauto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` tinytext NOT NULL,
  `telefono` tinytext NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `entregado` tinyint(1) NOT NULL,
  `notas` text NOT NULL,
  `productos` text NOT NULL,
  `idaleatorio` tinytext NOT NULL,
  PRIMARY KEY (`idauto`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`idauto`, `nombre`, `telefono`, `total`, `entregado`, `notas`, `productos`, `idaleatorio`) VALUES
(7, 'nombre Tres', '+50654323483', '24100', 1, 'Esta es una nota en la tercera entrada de las ventas. Etcetera', '{\"products\":[{\"id\":\"kzswbp3d\",\"cantidad\":3,\"valor\":\"2000\"},{\"id\":\"kzsw4u07\",\"cantidad\":5,\"valor\":\"2000\"},{\"id\":\"kzas9rqr\",\"cantidad\":7,\"valor\":\"2000\"}]}', 'kzbh0eh6'),
(6, 'nombre Dos', '+50612345689', '20000', 1, 'Esta es una nota en la segunda entrada de las ventas', '{\"products\":[{\"id\":\"kzswbp3d\",\"cantidad\":7,\"valor\":\"2000\"},{\"id\":\"kzsw4u07\",\"cantidad\":3,\"valor\":\"2000\"},{\"id\":\"kzas9rqr\",\"cantidad\":5,\"valor\":\"2000\"}]}', 'kzasc0w5'),
(5, 'nombre uno', '+50623454567', '250000', 1, 'Esta es una nota aleatoria que quiero mostrar', '{\"products\":[{\"id\":\"kzswbp3d\",\"cantidad\":1,\"valor\":\"2000\"},{\"id\":\"kzsw4u07\",\"cantidad\":8,\"valor\":\"2000\"},{\"id\":\"kzas9rqr\",\"cantidad\":5,\"valor\":\"2000\"}]}', 'kzas5hal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `idauto` int(11) NOT NULL AUTO_INCREMENT,
  `idaleatorio` tinytext NOT NULL,
  `titulo` tinytext NOT NULL,
  `descripcion` tinytext NOT NULL,
  `valor` decimal(10,0) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `categoria` tinytext NOT NULL,
  `imagenes` text NOT NULL,
  `disponible` tinyint(1) NOT NULL,
  PRIMARY KEY (`idauto`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idauto`, `idaleatorio`, `titulo`, `descripcion`, `valor`, `cantidad`, `categoria`, `imagenes`, `disponible`) VALUES
(46, 'l046skwp', 'Zapatos cafÃ©s', 'Esta es la descripcion de los zapatos cafÃ©s que quiero agregar a los productos', '50000', 5, 'zapatos,cafe,hombre,cuero', 'a37af8b2-3302-40d1-8bc8-fdab33f52a89.jpg,4470f142-4575-419c-9e43-a621f5683c8b.jpg,e1dcfebc-d9de-4262-9457-d0a6d740bae0.jpg,744836b8-acc5-4905-8890-75c9b897940e.jpg,', 1),
(45, 'kzswdicg', 'Zapato tacÃ³n alto ', 'TacÃ³n alto antideslizante, color negro y color crema', '35000', 10, 'alto,zapato,antideslizante,negro,crema', '3b5bc40c-086d-41d1-a9be-edb7e2d975f6.jpg,0644327c-0f1a-426b-b59b-9029c4241e0c.jpg,c16ad9da-1f2a-4489-8dfb-fc580999b52b.jfif,d7f84b40-fffb-47b0-8f15-42d6a562c214.jpg,', 0),
(44, 'kzswd8x6', 'Zapatos negros de cuero', 'Zapatos negros formales de cuero, zuela antideslizante', '55000', 10, 'zapatos,negro,antideslizante', '62ba2473-19b8-4388-8af8-e6d5ea4cbd5b.jpg,d8a4ea62-25ac-4cb3-9ffa-5bb7ab404099.jpg,8d23d76e-9f6a-4f5b-a0cf-bd0c8a8d7a54.webp,96f20656-355b-4865-a0f7-edd8ce163f01.jpg,', 1),
(43, 'kzswd15i', 'Gabardina cafÃ©', 'Gabardina de lana, manga larga, solapado', '20000', 8, 'Gabardina,lana', 'f024b678-a9a6-4c39-b684-fe4fbbda8eb5.jpg,7a35ed04-21f6-43c2-a893-f43a20b2c75a.jpg,935bf028-048b-4c77-9dd3-fb7a9d119fdf.webp,01922060-4a72-4258-ad74-6979edd03ab4.jpg,', 1),
(41, 'kzswbp3d', 'Camisa de colores', 'Camisa de colores, talla M, varios colores disponibles', '5000', 16, 'Camisa,colores', 'a3c25340-a29d-48b2-8a67-434e8c262f55.jpg,', 1),
(42, 'kzswce41', 'Bolso', 'Bolsos de gran calidad y resistencia, varios colores disponibles', '15200', 20, 'bolso', '86713210-0902-49a2-a2bd-e05299a9ff60.webp,32a2a8ad-d9c4-4c51-bd08-8f46ecac0996.jpg,e4fcb42a-31ee-4589-9653-fc85005098f1.jpg,', 1),
(39, 'kzsv3nxl', 'Bola de soccer', 'Esta es la descripcion de una bola de soccer tradicional, para uso profesional', '234543', 23, 'soccer, bola,profesional', 'c3003989-a7f0-4449-98b2-c50c627b6279.jpg,ed141ce5-8979-4b5d-8b15-de1bb1d7fc20.jfif,3d91ddfb-026c-47f6-8dd4-038a0af3caba.jfif,', 1),
(40, 'kzsw4u07', 'Abrigo amarillo', 'Esta descripciÃ³n es acerca de un abrigo amarillo.\r\n\r\n%\r\n\r\nEs un abrigo grande de color amarillo\r\n\r\nHola, esta es la prueba para hacer un salto', '234543', 34, 'Abrigo,amarillo,grande', '7684e572-179c-4966-bb1c-8eb823b8907c.png,', 1),
(37, 'kzsmc2y2', 'Abrigo grande', 'Esta es la descripcion de un abrigo muy grande', '2444', 3, 'algo', '118bd00f-a69d-4c19-8d02-5179297527b2.jpeg,0a1180af-1763-45d3-9d8b-4982ae063663.jpg,9dcb2229-2280-429b-b1c7-860ff4d95191.png,7e6d0479-1e22-4aa7-9e8b-35135310f6b0.jpg,', 1),
(38, 'kzsv2kr1', 'Medias de futbol', 'Esta es la descripciÃ³n de las medias de futbol', '2000', 25, 'medias,soccer', 'd612cce6-5451-4841-905a-c8319a8c6ac5.jpg,dc347c1b-7e34-43bc-9f57-521be13109c7.jpg,ccdc866b-c877-417d-9a25-79d5171d5a1a.jpg,', 1),
(36, 'kzbhl70r', 'Abrigo verde', 'Descripcion de un problema detectado', '5000', 32, 'abrigo,verde,grande', 'b061694c-69fa-49f0-a8bf-4a18df4de939.jfif,93805358-2d11-4aea-b814-9d1cf236cca5.jpeg,b3f044aa-8d25-4f5e-92d9-dc2b00b9d6dd.jpg,4bba1fa1-011a-4df0-bead-77f6d7b67b4d.png,', 1),
(35, 'kzbgydtg', 'Tacones', 'Esta es la descripciÃ³n que se va a mostrar en la pÃ¡gina', '40000', 2, 'tacones', '01e95997-ef74-40dc-ba96-8596cee34a05.jpg,79a59ca7-faa2-4d42-acac-40b56705e0b9.jpg,', 1),
(34, 'kzas9rqr', 'Agrigo negro grande', 'Descripcion del producto que se desea mostrar en la pagina\r\n\r\nEste es un salto de linea', '5000', 20, 'abrigo,negro,grande', '5d91ed30-7d2f-4a13-9c90-807dcdbb951f.webp,', 1),
(33, 'kza3m1qy', 'Ropa de cama', 'Esta es la descripciÃ³n de la ropa de cama', '110000', 20, 'Ropa de cama, colchon', 'fbabf1d8-76a9-4d97-bf26-4bcb763445fa.jfif,9bd39327-477e-41f5-a070-9ebca0d0d5ac.jpg,d4c7d39b-274b-42cf-9046-fa44942989fd.jpg,4194c821-17dc-406e-90a3-6266f84fa3cb.jpg,', 1),
(31, 'kza3i8k6', 'Camisas', 'Esta es la descripcion de la camisa', '2300', 34, 'Camisas', 'bc6d5c1f-912e-4f27-b60f-b37e495bfeaf.png,f18763e5-b930-4b93-b0ed-d60fb1edfb7d.png,', 1),
(32, 'kza3j3er', 'Zapatos', 'Esta es la descripciÃ³n de los zapatos. son zapatos de varios tipos, y de colores negro y cafÃ©', '35000', 23, 'zapatos', '6e27f4db-d8e8-4193-bd88-17724c38096b.jpg,974e8496-ff58-4e67-b541-e8fb355abfd2.jpg,8601e076-119a-4dcf-b84c-14f12ca8ac39.jpg,23a022d2-73e3-4e25-b4b8-b4d34e65ecaa.webp,', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema`
--

DROP TABLE IF EXISTS `sistema`;
CREATE TABLE IF NOT EXISTS `sistema` (
  `idauto` int(11) NOT NULL AUTO_INCREMENT,
  `nombrenegocio` tinytext NOT NULL,
  `logo` tinytext NOT NULL,
  `telefonowspp` tinytext NOT NULL,
  PRIMARY KEY (`idauto`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sistema`
--

INSERT INTO `sistema` (`idauto`, `nombrenegocio`, `logo`, `telefonowspp`) VALUES
(1, 'Nombre de la tienda', 'logo.webp', '+50612345678');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `idauto` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` tinytext NOT NULL,
  `contrasenia` tinytext NOT NULL,
  `tipo` tinytext NOT NULL,
  PRIMARY KEY (`idauto`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idauto`, `usuario`, `contrasenia`, `tipo`) VALUES
(1, 'admin', 'admin', 'administrador');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
