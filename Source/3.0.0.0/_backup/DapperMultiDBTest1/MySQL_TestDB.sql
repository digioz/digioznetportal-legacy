-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: digiozportal3
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` varchar(128) DEFAULT NULL,
  `Name` text,
  `Location` text,
  `Controller` text,
  `Action` text,
  `URL` text,
  `Target` text,
  `Visible` bit(1) DEFAULT NULL,
  `Timestamp` datetime DEFAULT NULL,
  `SortOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (13,'d1c447c1-b022-4c92-93e8-ab9aaea65224','Home 1','TopMenu','Home','Index',NULL,NULL,'','2018-04-30 20:20:25',1),(14,'d1c447c1-b022-4c92-93e8-ab9aaea65224','About 1','TopMenu','Home','About',NULL,NULL,'','2018-04-30 20:20:25',2),(15,'d1c447c1-b022-4c92-93e8-ab9aaea65224','Contact 1','TopMenu','Home','Contact',NULL,NULL,'\0','2018-04-30 20:20:25',3),(16,'d1c447c1-b022-4c92-93e8-ab9aaea65224','Forum 1','TopMenu','Forum','Index',NULL,NULL,'','2018-04-30 20:20:25',4),(17,'d1c447c1-b022-4c92-93e8-ab9aaea65224','Links 1','TopMenu','Links','Index',NULL,NULL,'','2018-04-30 20:20:25',5),(18,'d1c447c1-b022-4c92-93e8-ab9aaea65224','Chat 1','TopMenu','Chat','Index',NULL,NULL,'','2018-04-30 20:20:25',6),(19,'d1c447c1-b022-4c92-93e8-ab9aaea65224','Store 1','TopMenu','Store','Index',NULL,NULL,'\0','2018-04-30 20:20:25',7),(20,'d1c447c1-b022-4c92-93e8-ab9aaea65224','Twitter 1','TopMenu','Twitter','Index',NULL,NULL,'\0','2018-04-30 20:20:25',8),(21,'d1c447c1-b022-4c92-93e8-ab9aaea65224','Home 1','LeftMenu','Home','Index',NULL,NULL,'','2018-04-30 20:20:25',9),(22,'d1c447c1-b022-4c92-93e8-ab9aaea65224','Pictures 1','LeftMenu','Pictures','Index',NULL,NULL,'','2018-04-30 20:20:25',10),(23,'d1c447c1-b022-4c92-93e8-ab9aaea65224','Videos 1','LeftMenu','Videos','Index',NULL,NULL,'','2018-04-30 20:20:25',11);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-20 11:46:05
