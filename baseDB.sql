-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: us-cdbr-iron-east-01.cleardb.net    Database: heroku_73e4e22d73e7b8a
-- ------------------------------------------------------
-- Server version	5.5.56-log

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
-- Table structure for table `tb_category`
--

DROP TABLE IF EXISTS `tb_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_category` (
  `idCategory` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(45) NOT NULL,
  PRIMARY KEY (`idCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_category`
--

LOCK TABLES `tb_category` WRITE;
/*!40000 ALTER TABLE `tb_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_color_status`
--

DROP TABLE IF EXISTS `tb_color_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_color_status` (
  `idStatus` int(11) NOT NULL,
  `typeStatus` varchar(100) NOT NULL,
  `colorStatus` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`idStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_color_status`
--

LOCK TABLES `tb_color_status` WRITE;
/*!40000 ALTER TABLE `tb_color_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_color_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_dns`
--

DROP TABLE IF EXISTS `tb_dns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_dns` (
  `idDNS` int(11) NOT NULL AUTO_INCREMENT,
  `dnsName` varchar(45) NOT NULL,
  `dnsPrimary` varchar(45) NOT NULL,
  `dnsSecondary` varchar(45) NOT NULL,
  `dnsWeb` varchar(100) NOT NULL,
  PRIMARY KEY (`idDNS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_dns`
--

LOCK TABLES `tb_dns` WRITE;
/*!40000 ALTER TABLE `tb_dns` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_dns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_game`
--

DROP TABLE IF EXISTS `tb_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_game` (
  `idGame` int(11) NOT NULL AUTO_INCREMENT,
  `gameTitle` varchar(45) NOT NULL,
  `gameCategory` int(11) NOT NULL,
  `gameRegion` int(11) NOT NULL,
  `gameID` varchar(12) NOT NULL,
  `coop` tinyint(1) NOT NULL,
  `playersLocal` decimal(10,0) NOT NULL,
  `playersOnline` decimal(10,0) NOT NULL,
  `dns1` int(11) NOT NULL,
  `dns2` int(11) NOT NULL,
  `originalHost` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`idGame`),
  KEY `FK_GAME_CATEGORY_idx` (`gameCategory`),
  KEY `FK_GAME_REGION_idx` (`gameRegion`),
  KEY `FK_DNS_idx` (`dns1`),
  KEY `FK_DNS2_idx` (`dns2`),
  KEY `FK_ORIGINAL_HOST_idx` (`originalHost`),
  KEY `FK_STATUS_idx` (`status`),
  CONSTRAINT `FK_STATUS` FOREIGN KEY (`status`) REFERENCES `tb_color_status` (`idStatus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_DNS1` FOREIGN KEY (`dns1`) REFERENCES `tb_dns` (`idDNS`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_DNS2` FOREIGN KEY (`dns2`) REFERENCES `tb_dns` (`idDNS`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_GAME_CATEGORY` FOREIGN KEY (`gameCategory`) REFERENCES `tb_category` (`idCategory`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_GAME_REGION` FOREIGN KEY (`gameRegion`) REFERENCES `tb_region` (`idRegion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ORIGINAL_HOST` FOREIGN KEY (`originalHost`) REFERENCES `tb_original_host` (`idHost`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_game`
--

LOCK TABLES `tb_game` WRITE;
/*!40000 ALTER TABLE `tb_game` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_game_image`
--

DROP TABLE IF EXISTS `tb_game_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_game_image` (
  `idImage` int(11) NOT NULL,
  `gameCoverURL` varchar(45) DEFAULT NULL,
  `screenshot1` varchar(45) DEFAULT NULL,
  `screenshot2` varchar(45) DEFAULT NULL,
  `screenshot3` varchar(45) DEFAULT NULL,
  `screenshot4` varchar(45) DEFAULT NULL,
  `screenshot5` varchar(45) DEFAULT NULL,
  `idGame` int(11) NOT NULL,
  PRIMARY KEY (`idImage`),
  KEY `FK_ID_GAME_idx` (`idGame`),
  CONSTRAINT `FK_ID_GAME` FOREIGN KEY (`idGame`) REFERENCES `tb_game` (`idGame`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_game_image`
--

LOCK TABLES `tb_game_image` WRITE;
/*!40000 ALTER TABLE `tb_game_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_game_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_game_review`
--

DROP TABLE IF EXISTS `tb_game_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_game_review` (
  `idReview` int(11) NOT NULL,
  `reviewEN` longtext,
  `reviewPT` longtext,
  `reviewES` longtext,
  `idGame` int(11) NOT NULL,
  PRIMARY KEY (`idReview`),
  KEY `idGame_idx` (`idGame`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_game_review`
--

LOCK TABLES `tb_game_review` WRITE;
/*!40000 ALTER TABLE `tb_game_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_game_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_original_host`
--

DROP TABLE IF EXISTS `tb_original_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_original_host` (
  `idHost` int(11) NOT NULL AUTO_INCREMENT,
  `hostName` varchar(45) NOT NULL,
  PRIMARY KEY (`idHost`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_original_host`
--

LOCK TABLES `tb_original_host` WRITE;
/*!40000 ALTER TABLE `tb_original_host` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_original_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_region`
--

DROP TABLE IF EXISTS `tb_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_region` (
  `idRegion` int(11) NOT NULL AUTO_INCREMENT,
  `regionName` varchar(10) NOT NULL,
  `regionAlias` varchar(3) NOT NULL,
  PRIMARY KEY (`idRegion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_region`
--

LOCK TABLES `tb_region` WRITE;
/*!40000 ALTER TABLE `tb_region` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_region` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-26 16:33:16
