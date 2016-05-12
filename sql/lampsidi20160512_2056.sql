CREATE DATABASE  IF NOT EXISTS `lampsidi` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `lampsidi`;
-- MySQL dump 10.13  Distrib 5.7.12, for Linux (x86_64)
--
-- Host: localhost    Database: lampsidi
-- ------------------------------------------------------
-- Server version	5.7.12-0ubuntu1

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
-- Table structure for table `tbl_anno_scolastico`
--

DROP TABLE IF EXISTS `tbl_anno_scolastico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_anno_scolastico` (
  `id_anno_scolastico` int(11) NOT NULL,
  `descrizione_anno_scolastico` varchar(45) NOT NULL,
  PRIMARY KEY (`id_anno_scolastico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_anno_scolastico`
--

LOCK TABLES `tbl_anno_scolastico` WRITE;
/*!40000 ALTER TABLE `tbl_anno_scolastico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_anno_scolastico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_decodifica_anno_scolastico_sidi`
--

DROP TABLE IF EXISTS `tbl_decodifica_anno_scolastico_sidi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_decodifica_anno_scolastico_sidi` (
  `id_decodifica_anno_scolastico` int(11) NOT NULL AUTO_INCREMENT,
  `descrizione_decodifica` varchar(255) NOT NULL,
  PRIMARY KEY (`id_decodifica_anno_scolastico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_decodifica_anno_scolastico_sidi`
--

LOCK TABLES `tbl_decodifica_anno_scolastico_sidi` WRITE;
/*!40000 ALTER TABLE `tbl_decodifica_anno_scolastico_sidi` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_decodifica_anno_scolastico_sidi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_decodifica_voto_sidi`
--

DROP TABLE IF EXISTS `tbl_decodifica_voto_sidi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_decodifica_voto_sidi` (
  `id_decodifica_voto` int(11) NOT NULL,
  `descrizione_numerica` int(11) NOT NULL,
  `descrizioe_letterale` varchar(45) NOT NULL,
  PRIMARY KEY (`id_decodifica_voto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_decodifica_voto_sidi`
--

LOCK TABLES `tbl_decodifica_voto_sidi` WRITE;
/*!40000 ALTER TABLE `tbl_decodifica_voto_sidi` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_decodifica_voto_sidi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_flussi_sidi`
--

DROP TABLE IF EXISTS `tbl_flussi_sidi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_flussi_sidi` (
  `id_flussi_sidi` int(11) NOT NULL AUTO_INCREMENT,
  `descrizione_flussso` varchar(255) NOT NULL,
  `codice_versione_flusso` int(11) NOT NULL,
  PRIMARY KEY (`id_flussi_sidi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_flussi_sidi`
--

LOCK TABLES `tbl_flussi_sidi` WRITE;
/*!40000 ALTER TABLE `tbl_flussi_sidi` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_flussi_sidi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_frazioni_temporali_sidi`
--

DROP TABLE IF EXISTS `tbl_frazioni_temporali_sidi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_frazioni_temporali_sidi` (
  `id_frazioni_temporali` int(11) NOT NULL AUTO_INCREMENT,
  `descrizione_frazioni_temporali` varchar(45) NOT NULL,
  PRIMARY KEY (`id_frazioni_temporali`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_frazioni_temporali_sidi`
--

LOCK TABLES `tbl_frazioni_temporali_sidi` WRITE;
/*!40000 ALTER TABLE `tbl_frazioni_temporali_sidi` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_frazioni_temporali_sidi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipi_esiti_sidi`
--

DROP TABLE IF EXISTS `tbl_tipi_esiti_sidi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tipi_esiti_sidi` (
  `id_tipo_esito` int(11) NOT NULL,
  `descrizione_tipo_esito` varchar(100) NOT NULL,
  `passaggio` tinyint(1) NOT NULL,
  `id_tipo_esito_lamp` int(11) NOT NULL,
  PRIMARY KEY (`id_tipo_esito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipi_esiti_sidi`
--

LOCK TABLES `tbl_tipi_esiti_sidi` WRITE;
/*!40000 ALTER TABLE `tbl_tipi_esiti_sidi` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_tipi_esiti_sidi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-12 20:56:54
