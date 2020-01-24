-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: whereIsMyBand
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

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
-- Table structure for table `band`
--

DROP TABLE IF EXISTS `band`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `band` (
  `idBand` int(11) NOT NULL AUTO_INCREMENT,
  `bandName` varchar(80) NOT NULL,
  `city` varchar(80) NOT NULL,
  `style_idstyle` int(11) NOT NULL,
  `skill_idskill` int(11) NOT NULL,
  PRIMARY KEY (`idBand`),
  KEY `fk_band_style_idx` (`style_idstyle`),
  KEY `fk_band_skill1_idx` (`skill_idskill`),
  CONSTRAINT `fk_band_skill1` FOREIGN KEY (`skill_idskill`) REFERENCES `skill` (`idskill`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_band_style` FOREIGN KEY (`style_idstyle`) REFERENCES `style` (`idstyle`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `band`
--

LOCK TABLES `band` WRITE;
/*!40000 ALTER TABLE `band` DISABLE KEYS */;
INSERT INTO `band` VALUES (1,'Dream-Root','Paderborn',1,2),(2,'Seven Chicks','Munich',2,1),(3,'UguDugu','Seattle',3,5),(4,'Lowlands','Portland',4,3),(5,'Highlands','Bristol',5,4),(6,'Devonshire','Rom',6,2),(7,'Kuno','Magdeburg',7,4),(8,'Klausurtagung','Fuessen',8,5),(9,'Unix-Shellac','Kiel',9,3),(10,'Oefterreich','Basel',10,1),(11,'Killing Cowboys','Hamburg',11,2),(12,'Plastik-Bonbon','Berlin',12,4),(13,'Julo','Bremen',13,3),(14,'Finding Limo','Cologne',5,1),(15,'Seek\'Destroy\'Reboot','Stuttgart',7,4),(16,'TZ-489','Duisburg',2,5),(17,'Dauner-Remains','Ulm',4,2),(18,'Desasterhoch3','Juelich',1,3),(19,'Zollstock','Mannheim',6,4),(20,'ToechterDeinerStadt','Kleve',8,1);
/*!40000 ALTER TABLE `band` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instrument`
--

DROP TABLE IF EXISTS `instrument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instrument` (
  `idinstrument` int(11) NOT NULL AUTO_INCREMENT,
  `instrumentName` varchar(80) NOT NULL,
  PRIMARY KEY (`idinstrument`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instrument`
--

LOCK TABLES `instrument` WRITE;
/*!40000 ALTER TABLE `instrument` DISABLE KEYS */;
INSERT INTO `instrument` VALUES (1,'piano'),(2,'violin'),(3,'bass'),(4,'voice'),(5,'mixer'),(6,'trumpet'),(7,'guitar'),(8,'drums'),(9,'cello'),(10,'viola'),(11,'flugelhorn'),(12,'clarinet'),(13,'flute'),(14,'keyboard'),(15,'oboe'),(16,'saxophon'),(17,'banjo');
/*!40000 ALTER TABLE `instrument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musician`
--

DROP TABLE IF EXISTS `musician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `musician` (
  `idmusician` int(11) NOT NULL AUTO_INCREMENT,
  `musicianName` varchar(80) NOT NULL,
  `skill_idskill` int(11) NOT NULL,
  `style_idstyle` int(11) NOT NULL,
  `instrument_idinstrument` int(11) NOT NULL,
  PRIMARY KEY (`idmusician`),
  KEY `fk_musician_skill1_idx` (`skill_idskill`),
  KEY `fk_musician_style1_idx` (`style_idstyle`),
  KEY `fk_musician_instrument1_idx` (`instrument_idinstrument`),
  CONSTRAINT `fk_musician_instrument1` FOREIGN KEY (`instrument_idinstrument`) REFERENCES `instrument` (`idinstrument`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_musician_skill1` FOREIGN KEY (`skill_idskill`) REFERENCES `skill` (`idskill`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_musician_style1` FOREIGN KEY (`style_idstyle`) REFERENCES `style` (`idstyle`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musician`
--

LOCK TABLES `musician` WRITE;
/*!40000 ALTER TABLE `musician` DISABLE KEYS */;
INSERT INTO `musician` VALUES (1,'Malte Knezevic',2,3,7),(2,'Denis Kutlovci',3,5,4),(3,'Stefan Ganze',5,1,11);
/*!40000 ALTER TABLE `musician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill` (
  `idskill` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(80) NOT NULL,
  PRIMARY KEY (`idskill`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` VALUES (1,'Beginner'),(2,'Advanced'),(3,'Professional'),(4,'Expert'),(5,'Luminary');
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `style`
--

DROP TABLE IF EXISTS `style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `style` (
  `idstyle` int(11) NOT NULL AUTO_INCREMENT,
  `styleName` varchar(80) NOT NULL,
  PRIMARY KEY (`idstyle`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `style`
--

LOCK TABLES `style` WRITE;
/*!40000 ALTER TABLE `style` DISABLE KEYS */;
INSERT INTO `style` VALUES (1,'Rock'),(2,'Pop'),(3,'Rap'),(4,'Punk'),(5,'Raggae'),(6,'Schlager'),(7,'Metal'),(8,'Jazz'),(9,'Country'),(10,'Hip Hop'),(11,'Alternative'),(12,'Electro'),(13,'Other');
/*!40000 ALTER TABLE `style` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-22 10:01:34