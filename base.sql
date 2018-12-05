-- MySQL dump 10.13  Distrib 8.0.11, for Linux (x86_64)
--
-- Host: localhost    Database: restaurante2
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `carta_general`
--

DROP TABLE IF EXISTS `carta_general`;
/*!50001 DROP VIEW IF EXISTS `carta_general`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `carta_general` AS SELECT 
 1 AS `categoria`,
 1 AS `subcategoria`,
 1 AS `nombre`,
 1 AS `descripcion`,
 1 AS `precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `carta_vino`
--

DROP TABLE IF EXISTS `carta_vino`;
/*!50001 DROP VIEW IF EXISTS `carta_vino`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `carta_vino` AS SELECT 
 1 AS `bodega`,
 1 AS `nombre`,
 1 AS `color`,
 1 AS `tamaño`,
 1 AS `variedad_uva`,
 1 AS `precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `categoria` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `padre` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_categoria_padre` (`padre`),
  CONSTRAINT `fk_categoria_padre` FOREIGN KEY (`padre`) REFERENCES `categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'SUGERENCIAS',NULL),(2,'PLATOS',1),(3,'POSTRES',1),(4,'MENÚ LIGHT',NULL),(5,'PLATOS',4),(6,'CREPPES',4),(7,'SANDWICHES',4),(8,'ENTRADAS',NULL),(9,'ENSALADAS',NULL),(11,'COMPUESTA',NULL),(12,'ESPECIALES',9),(13,'SANDWICHES',NULL),(14,'FRÍOS',13),(15,'CALIENTES',13),(16,'ADICIONALES',13),(17,'PASTAS',NULL),(18,'SALSAS',17);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cobrable`
--

DROP TABLE IF EXISTS `cobrable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `cobrable` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tamaño` varchar(45) NOT NULL,
  `precio` decimal(20,2) NOT NULL DEFAULT '1.00',
  `tipo` enum('VINO','ITEM_CARTA','MENU_PROMOCIONAL','') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cobrable`
--

LOCK TABLES `cobrable` WRITE;
/*!40000 ALTER TABLE `cobrable` DISABLE KEYS */;
INSERT INTO `cobrable` VALUES (1,'CREPE DE ALGARROBA','',1.00,'ITEM_CARTA'),(2,'SUPREMA PIRI-PIRI','',1.00,'ITEM_CARTA'),(3,'BIFECITOS DE BONDIOLA','',1.00,'ITEM_CARTA'),(4,'LENGUADO NORMANDA','',1.00,'ITEM_CARTA'),(5,'BIFE DE CHORIZO RELLENO','',1.00,'ITEM_CARTA'),(6,'LOMO BLACK','',1.00,'ITEM_CARTA'),(7,'OJO DE BIFE MALBEC','',1.00,'ITEM_CARTA'),(8,'ENTRAÑAS GRILLÉ','',1.00,'ITEM_CARTA'),(9,'BAILEYS FROZEN','',1.00,'ITEM_CARTA'),(10,'COPA FINSUR','',1.00,'ITEM_CARTA'),(11,'CUERDAS DE GUITARRA AL WOK','',1.00,'ITEM_CARTA'),(12,'PECHUGA AL VERDEO','',1.00,'ITEM_CARTA'),(13,'MERLUZA A LA ESPAÑOLA','',1.00,'ITEM_CARTA'),(14,'LIGHT (FRÍO)','',1.00,'ITEM_CARTA'),(15,'DE ATÚN (FRÍO)','',1.00,'ITEM_CARTA'),(16,'VERDE (CALIENTE)','',1.00,'ITEM_CARTA'),(17,'ORIENTAL (CALIENTE)','',1.00,'ITEM_CARTA'),(18,'DE ATÚN','',1.00,'ITEM_CARTA'),(19,'DE SALMÓN','',1.00,'ITEM_CARTA'),(20,'Mejillones a la Provenzal o al Ajillo','',1.00,'ITEM_CARTA'),(21,'Gambas al Ajillo','',1.00,'ITEM_CARTA'),(22,'Rabas','',1.00,'ITEM_CARTA'),(23,'Mayonesa de Ave','',1.00,'ITEM_CARTA'),(24,'Mayonesa de Atún','',1.00,'ITEM_CARTA'),(25,'Tomate Relleno','',1.00,'ITEM_CARTA'),(26,'Empanada de Carne, Pollo o Jamón y Queso Empanada de Verdura o Humita','',1.00,'ITEM_CARTA'),(27,'Hasta tres ingredientes','',1.00,'ITEM_CARTA'),(28,'Hasta cinco ingredientes','',1.00,'ITEM_CARTA'),(29,'Completa','',1.00,'ITEM_CARTA'),(30,'CÉSAR','',1.00,'ITEM_CARTA'),(31,'DEL CHEF','',1.00,'ITEM_CARTA'),(32,'CENTENARIO','',1.00,'ITEM_CARTA'),(33,'LULI','',1.00,'ITEM_CARTA'),(34,'POPEYE','',1.00,'ITEM_CARTA'),(35,'EMILIANO','',1.00,'ITEM_CARTA'),(36,'RÚCULA Y PARMESANO','',1.00,'ITEM_CARTA'),(37,'Jamón Crudo','',1.00,'ITEM_CARTA'),(38,'Jamón Cocido','',1.00,'ITEM_CARTA'),(39,'Salame','',1.00,'ITEM_CARTA'),(40,'Leverwust','',1.00,'ITEM_CARTA'),(41,'Hamburguesa','',1.00,'ITEM_CARTA'),(42,'Pollo','',1.00,'ITEM_CARTA'),(43,'Lomo','',1.00,'ITEM_CARTA'),(44,'Milanesa','',1.00,'ITEM_CARTA'),(45,'Queso','',1.00,'ITEM_CARTA'),(46,'Tomate y Lechuga','',1.00,'ITEM_CARTA'),(47,'Huevo Duro','',1.00,'ITEM_CARTA'),(48,'Ajíes','',1.00,'ITEM_CARTA'),(49,'Pickles','',1.00,'ITEM_CARTA'),(50,'Ñoquis','',1.00,'ITEM_CARTA'),(51,'Tallarines','',1.00,'ITEM_CARTA'),(52,'Spaguettis','',1.00,'ITEM_CARTA'),(53,'Ñoquis Rellenos (blancos o verdes)','',1.00,'ITEM_CARTA'),(54,'Ravioles','',1.00,'ITEM_CARTA'),(55,'Sorrentinos','',1.00,'ITEM_CARTA'),(56,'Canelones','',1.00,'ITEM_CARTA'),(57,'Lasagna','',1.00,'ITEM_CARTA'),(58,'Crema de Jamón','',1.00,'ITEM_CARTA'),(59,'Parisién','',1.00,'ITEM_CARTA'),(60,'Cuatro Quesos','',1.00,'ITEM_CARTA'),(61,'Pesto','',1.00,'ITEM_CARTA'),(62,'Carbonara','',1.00,'ITEM_CARTA'),(63,'Michele Torino','Botella 700ml',1.00,'VINO'),(64,'Santa Ana','Botella 700ml',1.00,'VINO');
/*!40000 ALTER TABLE `cobrable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comanda`
--

DROP TABLE IF EXISTS `comanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `comanda` (
  `fecha` date NOT NULL,
  `mesa` int(11) NOT NULL,
  `cantidad_comensales` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estado` enum('abierta','cerrada') DEFAULT NULL,
  `nro_mozo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`fecha`,`mesa`),
  KEY `fk_comanda_mozo` (`nro_mozo`),
  CONSTRAINT `fk_comanda_mozo` FOREIGN KEY (`nro_mozo`) REFERENCES `mozo` (`nro_mozo`)
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
-- Table structure for table `cupon`
--

DROP TABLE IF EXISTS `cupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `cupon` (
  `nro_cupon` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `numero_factura` int(10) unsigned NOT NULL,
  `nro_tarjeta_pago` int(16) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `nro_comprobante` int(10) NOT NULL,
  `codigo_autorizacion` int(10) NOT NULL,
  PRIMARY KEY (`nro_cupon`),
  KEY `fk_factura_cupon` (`numero_factura`),
  CONSTRAINT `fk_factura_cupon` FOREIGN KEY (`numero_factura`) REFERENCES `factura` (`nro_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupon`
--

LOCK TABLES `cupon` WRITE;
/*!40000 ALTER TABLE `cupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `cupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion_mozo`
--

DROP TABLE IF EXISTS `direccion_mozo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `direccion_mozo` (
  `calle` varchar(45) NOT NULL,
  `localidad` varchar(45) NOT NULL,
  `numeracion` int(6) unsigned zerofill NOT NULL,
  `nro_mozo` int(10) unsigned NOT NULL,
  PRIMARY KEY (`calle`,`localidad`,`numeracion`,`nro_mozo`),
  KEY `fk_mozo_direccion` (`nro_mozo`),
  CONSTRAINT `fk_direccion_mozo` FOREIGN KEY (`nro_mozo`) REFERENCES `mozo` (`nro_mozo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion_mozo`
--

LOCK TABLES `direccion_mozo` WRITE;
/*!40000 ALTER TABLE `direccion_mozo` DISABLE KEYS */;
/*!40000 ALTER TABLE `direccion_mozo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `factura` (
  `nro_factura` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fecha_comanda` date NOT NULL,
  `mesa_comanda` int(11) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `importe` decimal(20,2) NOT NULL,
  PRIMARY KEY (`nro_factura`),
  KEY `fk_factura_comanda` (`fecha_comanda`,`mesa_comanda`),
  CONSTRAINT `fk_factura_comanda` FOREIGN KEY (`fecha_comanda`, `mesa_comanda`) REFERENCES `comanda` (`fecha`, `mesa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_carta`
--

DROP TABLE IF EXISTS `item_carta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `item_carta` (
  `cobrable` int(11) unsigned NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `categoria` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cobrable`,`categoria`) USING BTREE,
  KEY `fk_item_carta_categoria` (`categoria`),
  CONSTRAINT `fk_item_carta_categoria` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_item_carta_cobrable` FOREIGN KEY (`cobrable`) REFERENCES `cobrable` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_carta`
--

LOCK TABLES `item_carta` WRITE;
/*!40000 ALTER TABLE `item_carta` DISABLE KEYS */;
INSERT INTO `item_carta` VALUES (1,'(cebollas moradas, brócoli, hongos, queso brie, zapallitos, con salsa de oliva, ajo, cherry y albahaca)',2),(2,'(queso ahumado, panceta, salsa de soja, tomates secos, crema, cebolla, vino blanco, aceitunas negras, chips de papas)',2),(3,'en barbacoa y Boconccini de espinaca',2),(4,'(camarones, mejillones, vieiras, jamón, champiñones, verdeo, parmesano)',2),(5,'(jamón cocido, queso de cabra, fondeo de tomates con anís y guarnición de minis malfattis)',2),(6,'(ciruelas pasas, jamón cocido, morrones, zanahorias, vino merlot, papas paillé)',2),(7,'(hongos, jamón serrano y papas Dauphny)',2),(8,'con chips de papas, chorizo colorado  y panceta ahumada',2),(9,'(Baileys, hielo, americana, chocolate  y crema)',3),(10,'(helado de chocolate, dulce de leche, mousse de chocolate, crema y nueces)',3),(11,'(integrales, verdeo, chauchas, tomate, morrón, zuchinni, brócoli)',5),(12,'(verdeo, champiñón, queso descremado)',5),(13,'(puerro, zanahoria, cebolla, verdeo, queso blanco, azafrán, perejil, vino de arroz)',5),(14,'(palmitos, huevo duro, jamón cocido, apio, kétchup, mayonesa light, jugo de limón)',6),(16,'(blanco de ave, champiñón, puerro, queso gratinado y semillas de sésamo, en espejo de salsa roja)',6),(17,'(camarones, cerdo desgrasado, brotes de soja, arroz, morrón, verdeo, jengibre, hongos, salsa de soja)',6),(18,'(arvejas, queso, huevo duro, choclo,  mayonesa light)',6),(18,'(atún, pan de salvado, aceitunas verdes, mayonesa, queso crema light, rúcula)',7),(19,'(salmón ahumado, queso brie,  rúcula)',7),(20,NULL,8),(21,NULL,8),(22,NULL,8),(23,NULL,8),(24,NULL,8),(25,NULL,8),(26,NULL,8),(27,NULL,11),(28,NULL,11),(29,'(lechuga, tomate, zanahoria rallada, remolacha rallada, cebolla, huevo duro)',11),(30,'(pollo, hojas verdes, panceta, parmesano, croutons, aderezo César)',12),(31,'(lechuga, tomate, cebolla, zanahoria, gruyere, jamón, champiñones)',12),(32,'(espárragos, jamón, queso, tomate,  zanahoria, papas)',12),(33,'(choclo, zanahoria, remolacha,  chauchas)',12),(34,'(espinaca, huevo y parmesano)',12),(35,'(corazón de alcauciles, blanco de ave, muzzarella, papas, tomate, zanahoria, rúcula, aceitunas, orégano, albahaca)',12),(36,NULL,12),(37,NULL,14),(38,NULL,14),(39,NULL,14),(40,NULL,14),(41,NULL,15),(42,NULL,15),(43,NULL,15),(44,NULL,15),(45,NULL,16),(46,NULL,16),(47,NULL,16),(48,NULL,16),(49,NULL,16),(50,NULL,17),(51,NULL,17),(52,NULL,17),(53,NULL,17),(54,NULL,17),(55,NULL,17),(56,NULL,17),(57,NULL,17),(58,NULL,18),(59,'(pollo, jamón cocido, champiñones,  crema)',18),(60,NULL,18),(61,NULL,18),(62,'(ajo, tocino, yemas de huevo)',18);
/*!40000 ALTER TABLE `item_carta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_promocional`
--

DROP TABLE IF EXISTS `menu_promocional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `menu_promocional` (
  `cobrable` int(11) unsigned NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `dias_de_la_semana` int(10) unsigned NOT NULL COMMENT 'Máscara de bits con los dias de la semana en que el menu está disponible, empezando por Lunes.',
  `tipo` int(11) NOT NULL,
  PRIMARY KEY (`cobrable`),
  CONSTRAINT `fk_menu_cobrable` FOREIGN KEY (`cobrable`) REFERENCES `cobrable` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
-- Table structure for table `mozo`
--

DROP TABLE IF EXISTS `mozo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `mozo` (
  `nro_mozo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `dni` int(8) unsigned DEFAULT NULL,
  `cuil` int(11) NOT NULL,
  `telefono` int(10) DEFAULT NULL,
  PRIMARY KEY (`nro_mozo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mozo`
--

LOCK TABLES `mozo` WRITE;
/*!40000 ALTER TABLE `mozo` DISABLE KEYS */;
/*!40000 ALTER TABLE `mozo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paso`
--

DROP TABLE IF EXISTS `paso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `paso` (
  `nombre_menu` varchar(45) NOT NULL,
  `tamaño_menu` varchar(45) NOT NULL,
  `nombre_item` varchar(45) NOT NULL,
  `tamaño_item` varchar(45) NOT NULL,
  PRIMARY KEY (`nombre_menu`,`tamaño_menu`,`nombre_item`,`tamaño_item`),
  KEY `fk_paso_item` (`nombre_item`,`tamaño_item`)
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
 SET character_set_client = utf8 ;
CREATE TABLE `solicitud` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fecha_comanda` date NOT NULL,
  `mesa_comanda` int(11) NOT NULL,
  `nombre_cobrable` varchar(45) NOT NULL,
  `tamaño_cobrable` varchar(45) NOT NULL,
  `cantidad` int(10) unsigned NOT NULL,
  `precio` decimal(20,2) NOT NULL,
  `estado` enum('PEDIDO','COCINANDO','COCINADO','ENTREGADO','COBRADO') NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_solicitud_cobrable` (`nombre_cobrable`,`tamaño_cobrable`),
  KEY `fk_solicitud_comanda` (`fecha_comanda`,`mesa_comanda`)
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
 SET character_set_client = utf8 ;
CREATE TABLE `vino` (
  `cobrable` int(11) unsigned NOT NULL,
  `color` varchar(45) NOT NULL,
  `bodega` varchar(45) NOT NULL,
  `variedad_uva` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cobrable`),
  CONSTRAINT `fk_vino_cobrable` FOREIGN KEY (`cobrable`) REFERENCES `cobrable` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vino`
--

LOCK TABLES `vino` WRITE;
/*!40000 ALTER TABLE `vino` DISABLE KEYS */;
INSERT INTO `vino` VALUES (63,'Tinto','La Rosa',NULL),(64,'Tinto','',NULL);
/*!40000 ALTER TABLE `vino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `carta_general`
--

/*!50001 DROP VIEW IF EXISTS `carta_general`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `carta_general` AS select coalesce(`categoria_padre`.`nombre`,`categoria`.`nombre`) AS `categoria`,(case when isnull(`categoria`.`padre`) then NULL else `categoria`.`nombre` end) AS `subcategoria`,`cobrable`.`nombre` AS `nombre`,`item_carta`.`descripcion` AS `descripcion`,`cobrable`.`precio` AS `precio` from (((`item_carta` join `cobrable` on((`item_carta`.`cobrable` = `cobrable`.`id`))) join `categoria` on((`item_carta`.`categoria` = `categoria`.`id`))) left join `categoria` `categoria_padre` on((`categoria`.`padre` = `categoria_padre`.`id`))) order by coalesce(`categoria_padre`.`nombre`,`categoria`.`nombre`),(case when isnull(`categoria`.`padre`) then NULL else `categoria`.`nombre` end),`cobrable`.`nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `carta_vino`
--

/*!50001 DROP VIEW IF EXISTS `carta_vino`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `carta_vino` AS select `vino`.`bodega` AS `bodega`,`cobrable`.`nombre` AS `nombre`,`vino`.`color` AS `color`,`cobrable`.`tamaño` AS `tamaño`,`vino`.`variedad_uva` AS `variedad_uva`,`cobrable`.`precio` AS `precio` from (`vino` join `cobrable` on((`vino`.`cobrable` = `cobrable`.`id`))) order by `vino`.`bodega`,`cobrable`.`nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-03 16:30:06
