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
-- Table structure for table `jbc_page`
--

DROP TABLE IF EXISTS `jbc_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbc_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adr_path` int(11) NOT NULL,
  `page_data` mediumtext COLLATE utf8mb4_unicode_ci,
  `page_type` int(11) NOT NULL,
  `rec_status` int(11) NOT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_unique` (`page_name`,`adr_path`),
  KEY `jbc_page_ibfk_2` (`page_type`),
  KEY `jbc_page_ibfk_3` (`rec_status`),
  KEY `jbc_page_ibfk_4` (`rec_user`),
  KEY `jbc_page_ibfk_1` (`adr_path`),
  CONSTRAINT `jbc_page_ibfk_1` FOREIGN KEY (`adr_path`) REFERENCES `jbc_path` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_page_ibfk_2` FOREIGN KEY (`page_type`) REFERENCES `jbc_page_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_page_ibfk_3` FOREIGN KEY (`rec_status`) REFERENCES `jbc_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_page_ibfk_4` FOREIGN KEY (`rec_user`) REFERENCES `jbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbc_page`
--

LOCK TABLES `jbc_page` WRITE;
/*!40000 ALTER TABLE `jbc_page` DISABLE KEYS */;
INSERT INTO `jbc_page` VALUES (1,'Yonetim-Sidebar',7,'	  <nav class=\"navbar bg-light col-md-1 col-xl-2\">\n		 <ul class=\"navbar-nav flex-column\">\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/admin/yonetim.jsp\">Yönetim</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/admin/grup.jsp\">Grup</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/user/mesaj.jsp\">Mesaj</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/user/mesaj-map.jsp\">Mesaj Dağıtım</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/user/mesaj-bak.jsp\">Mesaj Bak</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/user/sifre.jsp\">Şifre</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/start/giris.jsp\">Giriş</a></li>\n		 </ul>\n	  </nav>\n',3,1,2,'2018-09-26 10:29:00'),(2,'Sayfalar-Sidebar',7,'	  <nav class=\"navbar bg-light col-md-1 col-xl-2\">\n		 <ul class=\"navbar-nav flex-column\">\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/page/sayfa.jsp\">Sayfa</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/page/tema.jsp\">Tema</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/page/sayfa-link.jsp\">Sayfa Link</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/page/sayfa-map.jsp\">Sayfa Map</a></li>\n		 </ul>\n	  </nav>\n\n',3,1,2,'2018-10-26 21:50:00'),(3,'Gözetim-Sidebar',7,'	  <nav class=\"navbar bg-light col-md-1 col-xl-2\">\n		 <ul class=\"navbar-nav flex-column\">\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/user/kullanici.jsp\">Kullanıcı</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/user/mesaj.jsp\">Mesaj</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/user/mesaj-map.jsp\">Mesaj Dağıtım</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/user/mesaj-bak.jsp\">Mesaj Bak</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/user/sifre.jsp\">Şifre</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/start/giris.jsp\">Giriş</a></li>\n		 </ul>\n	  </nav>\n',3,1,2,'2018-09-26 10:29:00'),(4,'Kodlar-Sidebar',7,'	  <nav class=\"navbar bg-light col-md-1 col-xl-2\">\n		 <ul class=\"navbar-nav flex-column\">\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/code/kod.jsp\">Kod</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/code/kod-map.jsp\">Kod Map</a></li>\n		 </ul>\n	  </nav>\n\n',3,1,2,'2018-09-20 10:18:00'),(5,'Referans-Sidebar',7,'	  <nav class=\"navbar bg-light col-md-1 col-xl-2\">\n		 <ul class=\"navbar-nav flex-column\">\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/reference/kod-tip.jsp\">Kod Tipi</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/reference/dosya-tip.jsp\">Dosya Tipi</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/reference/mesaj-tip.jsp\">Mesaj Tipi</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/reference/pozisyon.jsp\">Pozisyon</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/reference/sayfa-tip.jsp\">Sayfa Tipi</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/reference/yol.jsp\">Yol</a></li>\n		 </ul>\n	  </nav>\n\n',3,1,2,'2018-10-26 21:50:00'),(6,'Normal-Sidebar-TR',7,'	  <nav class=\"navbar bg-light col-md-1 col-xl-2\">\n		 <ul class=\"navbar-nav flex-column\">\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/user/mesaj-bak.jsp\">Mesaj Bak</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/user/sifre.jsp\">Şifre</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/start/giris.jsp\">Giriş</a></li>\n		 </ul>\n	  </nav>\n',3,1,2,'2018-09-26 10:29:00'),(7,'Admin-Sidebar',7,'	  <nav class=\"navbar bg-light col-md-1 col-xl-2\">\n		 <ul class=\"navbar-nav flex-column\">\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/admin/admin.jsp\">Administration</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/admin/group.jsp\">Group</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/user/message.jsp\">Message Record</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/user/message-map.jsp\">Message Map</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/user/message-rew.jsp\">Message Review</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/user/password.jsp\">Password</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/start/login.jsp\">Login</a></li>\n		 </ul>\n	  </nav>\n',3,1,2,'2018-10-06 22:47:00'),(8,'Codes-Sidebar',7,'	  <nav class=\"navbar bg-light col-md-1 col-xl-2\">\n		 <ul class=\"navbar-nav flex-column\">\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/code/code.jsp\">Code</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/code/code-map.jsp\">Code Map</a></li>\n		 </ul>\n	  </nav>\n\n',2,1,2,'2018-10-06 22:47:00'),(9,'Files-Sidebar',7,'	  <nav class=\"navbar bg-light col-md-1 col-xl-2\">\n		 <ul class=\"navbar-nav flex-column\">\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/admin/yonetim.jsp\">Yönetim</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/admin/grup.jsp\">Grup</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/user/mesaj.jsp\">Mesaj</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/user/sifre.jsp\">Şifre</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/start/giris.jsp\">Giriş</a></li>\n		 </ul>\n	  </nav>\n\n    <div class=\"container-fluid\">\n      <div class=\"row\">\n        <div class=\"col-sm-3 col-md-2 sidebar\">\n          <ul class=\"nav nav-sidebar\">\n            <li ><a href=\"#\"> </a></li>\n			<li><a href=\"jsp/file/Gorsel.jsp\">Görsel</a></li>\n			<li><a href=\"jsp/file/PDF-TR.jsp\">PDF</a></li>\n			<li><a href=\"jsp/file/Word-TR.jsp\">Word</a></li>\n			<li><a href=\"jsp/file/Excel-TR.jsp\">Excell</a></li>\n			<li><a href=\"jsp/file/Diger.jsp\">Diğer</a></li>\n		  </ul>\n       </div>\n',2,1,2,'2018-10-06 22:49:00'),(10,'Normal-Sidebar',7,'	  <nav class=\"navbar bg-light col-md-1 col-xl-2\">\n		 <ul class=\"navbar-nav flex-column\">\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/user/message-rew.jsp\">Message Review</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/user/password.jsp\">Password</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/start/login.jsp\">Login</a></li>\n		 </ul>\n	  </nav>\n',2,1,2,'2018-10-06 22:49:00'),(11,'Pages-Sidebar',7,'	  <nav class=\"navbar bg-light col-md-1 col-xl-2\">\n		 <ul class=\"navbar-nav flex-column\">\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/page/page.jsp\">Page</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/page/theme.jsp\">Theme</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/page/page-link.jsp\">Page Link</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/page/page-map.jsp\">Page Map</a></li>\n		 </ul>\n	  </nav>\n\n',2,1,2,'2018-10-06 22:50:00'),(12,'Reference-Sidebar',7,'	  <nav class=\"navbar bg-light col-md-1 col-xl-2\">\n		 <ul class=\"navbar-nav flex-column\">\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/reference/code-type.jsp\">Code Type</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/reference/file-type.jsp\">File Type</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/reference/message-type.jsp\">Message Type</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/reference/position.jsp\">Position</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/reference/page-type.jsp\">Page Type</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/reference/path.jsp\">Path</a></li>\n		 </ul>\n	  </nav>\n',2,1,2,'2018-10-06 22:51:00'),(13,'Supervisor-Sidebar',7,'	  <nav class=\"navbar bg-light col-md-1 col-xl-2\">\n		 <ul class=\"navbar-nav flex-column\">\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/user/user.jsp\">User</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/user/message.jsp\">Message Record</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/user/message-map.jsp\">Message Map</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/user/message-rew.jsp\">Message Review</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/user/password.jsp\">Password</a></li>\n			<li class=\"nav-item\">\n			  <a class=\"nav-link\" href=\"/JBCA/start/login.jsp\">Login</a></li>\n		 </ul>\n	  </nav>\n',2,1,2,'2018-10-06 22:52:00');
/*!40000 ALTER TABLE `jbc_page` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-10 22:24:37
