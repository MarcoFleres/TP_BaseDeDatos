-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: restaurante
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.17.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `nombre` varchar(45) NOT NULL,
  `padre` varchar(45) NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cobrable`
--

DROP TABLE IF EXISTS `cobrable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cobrable` (
  `nombre` varchar(45) NOT NULL,
  `tamaño` varchar(45) NOT NULL,
  `precio` decimal(20,2) NOT NULL,
  `tipo` enum('VINO','ITEM_CARTA','MENU_PROMOCIONAL','') NOT NULL,
  PRIMARY KEY (`nombre`,`tamaño`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cobrable`
--

LOCK TABLES `cobrable` WRITE;
/*!40000 ALTER TABLE `cobrable` DISABLE KEYS */;
/*!40000 ALTER TABLE `cobrable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comanda`
--

DROP TABLE IF EXISTS `comanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comanda` (
  `id_solicitud` int(10) unsigned NOT NULL,
  `fecha` date NOT NULL,
  `mesa` int(11) NOT NULL,
  `cantidad_comensales` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estado` enum('abierta','cerrada') DEFAULT NULL,
  PRIMARY KEY (`id_solicitud`,`fecha`,`mesa`),
  CONSTRAINT `fk_comanda_solicitud` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitud` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comanda`
--

LOCK TABLES `comanda` WRITE;
/*!40000 ALTER TABLE `comanda` DISABLE KEYS */;
/*!40000 ALTER TABLE `comanda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_carta`
--

DROP TABLE IF EXISTS `item_carta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_carta` (
  `nombre` varchar(45) NOT NULL,
  `tamaño` varchar(45) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`nombre`,`tamaño`),
  KEY `fk_item_carta_categoria` (`categoria`),
  CONSTRAINT `fk_item_carta_categoria` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`nombre`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_item_carta_cobrable` FOREIGN KEY (`nombre`, `tamaño`) REFERENCES `cobrable` (`nombre`, `tamaño`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_carta`
--

LOCK TABLES `item_carta` WRITE;
/*!40000 ALTER TABLE `item_carta` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_carta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_promocional`
--

DROP TABLE IF EXISTS `menu_promocional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_promocional` (
  `nombre` varchar(45) NOT NULL,
  `tamaño` varchar(45) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `dias_de_la_semana` int(10) unsigned NOT NULL COMMENT 'Máscara de bits con los dias de la semana en que el menu está disponible, empezando por Lunes.',
  `tipo` int(11) NOT NULL,
  PRIMARY KEY (`nombre`,`tamaño`),
  CONSTRAINT `fk_menu_cobrable` FOREIGN KEY (`nombre`, `tamaño`) REFERENCES `cobrable` (`nombre`, `tamaño`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_promocional`
--

LOCK TABLES `menu_promocional` WRITE;
/*!40000 ALTER TABLE `menu_promocional` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_promocional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paso`
--

DROP TABLE IF EXISTS `paso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paso` (
  `nombre_menu` varchar(45) NOT NULL,
  `tamaño_menu` varchar(45) NOT NULL,
  `nombre_item` varchar(45) NOT NULL,
  `tamaño_item` varchar(45) NOT NULL,
  PRIMARY KEY (`nombre_menu`,`tamaño_menu`,`nombre_item`,`tamaño_item`),
  KEY `fk_paso_item` (`nombre_item`,`tamaño_item`),
  CONSTRAINT `fk_paso_item` FOREIGN KEY (`nombre_item`, `tamaño_item`) REFERENCES `item_carta` (`nombre`, `tamaño`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_paso_menu` FOREIGN KEY (`nombre_menu`, `tamaño_menu`) REFERENCES `menu_promocional` (`nombre`, `tamaño`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paso`
--

LOCK TABLES `paso` WRITE;
/*!40000 ALTER TABLE `paso` DISABLE KEYS */;
/*!40000 ALTER TABLE `paso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud`
--

DROP TABLE IF EXISTS `solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitud` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_cobrable` varchar(45) NOT NULL,
  `tamaño_cobrable` varchar(45) NOT NULL,
  `cantidad` int(10) unsigned NOT NULL,
  `precio` decimal(20,2) NOT NULL,
  `estado` enum('PEDIDO','COCINANDO','COCINADO','ENTREGADO','COBRADO') NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_solicitud_cobrable` (`nombre_cobrable`,`tamaño_cobrable`),
  CONSTRAINT `fk_solicitud_cobrable` FOREIGN KEY (`nombre_cobrable`, `tamaño_cobrable`) REFERENCES `cobrable` (`nombre`, `tamaño`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud`
--

LOCK TABLES `solicitud` WRITE;
/*!40000 ALTER TABLE `solicitud` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vino`
--

DROP TABLE IF EXISTS `vino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vino` (
  `nombre` varchar(45) NOT NULL,
  `tamaño` varchar(45) NOT NULL,
  `color` varchar(45) NOT NULL,
  `bodega` varchar(45) NOT NULL,
  `variedadDeUva` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`nombre`,`tamaño`,`color`,`bodega`),
  CONSTRAINT `fk_vino_cobrable` FOREIGN KEY (`nombre`, `tamaño`) REFERENCES `cobrable` (`nombre`, `tamaño`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vino`
--

LOCK TABLES `vino` WRITE;
/*!40000 ALTER TABLE `vino` DISABLE KEYS */;
/*!40000 ALTER TABLE `vino` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-28 14:22:42
