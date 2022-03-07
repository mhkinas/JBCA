-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: jbcdb
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `jbc_page_link`
--

DROP TABLE IF EXISTS `jbc_page_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbc_page_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  `adr_path` int(11) NOT NULL,
  `linked_page` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `theme` int(11) NOT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_link_unique` (`link_name`,`adr_path`),
  KEY `jbc_page_link_ibfk_1` (`linked_page`),
  KEY `jbc_page_link_ibfk_3` (`position`),
  KEY `jbc_page_link_ibfk_4` (`rec_user`),
  KEY `jbc_page_link_ibfk_2` (`adr_path`),
  KEY `jbc_page_link_ibfk_5` (`theme`),
  CONSTRAINT `jbc_page_link_ibfk_1` FOREIGN KEY (`linked_page`) REFERENCES `jbc_page` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_page_link_ibfk_2` FOREIGN KEY (`adr_path`) REFERENCES `jbc_path` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_page_link_ibfk_3` FOREIGN KEY (`position`) REFERENCES `jbc_position` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_page_link_ibfk_4` FOREIGN KEY (`rec_user`) REFERENCES `jbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_page_link_ibfk_5` FOREIGN KEY (`theme`) REFERENCES `jbc_theme` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbc_page_link`
--

LOCK TABLES `jbc_page_link` WRITE;
/*!40000 ALTER TABLE `jbc_page_link` DISABLE KEYS */;
INSERT INTO `jbc_page_link` VALUES (4,'about',9,23,1,6,2,'2018-10-28 22:56:00'),(5,'blog-tr',10,32,1,5,2,'2018-10-28 22:55:00'),(6,'blog',10,31,1,6,2,'2018-10-28 22:57:00'),(7,'consultancy',11,35,1,6,2,'2018-10-28 22:58:00'),(8,'danismanlik',11,36,1,5,2,'2018-10-28 22:58:00'),(9,'database',11,37,1,6,2,'2018-10-28 23:01:00'),(10,'entegrasyon',11,38,1,5,2,'2018-10-28 23:02:00'),(11,'experience',9,24,1,6,2,'2018-12-18 23:44:00'),(12,'expertise',9,25,1,6,2,'2018-12-18 23:44:00'),(13,'frontside',10,33,1,6,2,'2018-10-28 23:03:00'),(14,'hakkinda',9,26,1,5,2,'2018-10-28 23:03:00'),(15,'hizmetler',11,39,1,5,2,'2018-10-28 23:05:00'),(16,'integration',11,41,1,6,2,'2018-10-28 23:05:00'),(17,'kimdir',9,27,1,5,2,'2018-10-28 23:06:00'),(18,'onyuz',10,34,1,5,2,'2018-10-28 23:07:00'),(19,'services',11,42,1,6,2,'2018-10-28 23:08:00'),(20,'sistem',11,43,1,5,2,'2018-10-28 23:08:00'),(21,'software',11,44,1,6,2,'2018-10-28 23:09:00'),(22,'system',11,45,1,6,2,'2018-10-28 23:09:00'),(23,'tecrubeler',9,28,1,5,2,'2018-10-28 23:10:00'),(24,'uzmanlik',9,29,1,5,2,'2018-10-28 23:10:00'),(26,'whois',9,30,1,6,2,'2018-10-28 23:11:00'),(27,'yazilim',11,47,1,5,2,'2018-10-28 23:12:00'),(28,'contact',13,48,1,6,2,'2018-11-05 14:25:00'),(29,'iletisim',13,49,1,5,2,'2018-11-05 14:26:00'),(30,'veritabani',11,46,1,5,2,'2018-12-20 22:42:00');
/*!40000 ALTER TABLE `jbc_page_link` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-10 22:24:39
