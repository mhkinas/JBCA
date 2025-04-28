-- --------------------------------------------------------
-- Sunucu:                       127.0.0.1
-- Sunucu sürümü:                10.6.4-MariaDB - mariadb.org binary distribution
-- Sunucu İşletim Sistemi:       Win64
-- HeidiSQL Sürüm:               11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- jbcdb için veritabanı yapısı dökülüyor
CREATE DATABASE IF NOT EXISTS `jbcdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `jbcdb`;

-- tablo yapısı dökülüyor jbcdb.jbc_code
CREATE TABLE IF NOT EXISTS `jbc_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  `adr_path` int(11) NOT NULL,
  `code_data` mediumtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `code_type` int(11) NOT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_unique` (`code_name`),
  KEY `jbc_code_ibfk_1` (`adr_path`),
  KEY `jbc_code_ibfk_2` (`rec_user`),
  KEY `jbc_code_ibfk_3` (`code_type`),
  CONSTRAINT `jbc_code_ibfk_1` FOREIGN KEY (`adr_path`) REFERENCES `jbc_path` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_code_ibfk_2` FOREIGN KEY (`rec_user`) REFERENCES `jbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_code_ibfk_3` FOREIGN KEY (`code_type`) REFERENCES `jbc_code_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- jbcdb.jbc_code: ~3 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `jbc_code` DISABLE KEYS */;
INSERT INTO `jbc_code` (`id`, `code_name`, `adr_path`, `code_data`, `code_type`, `rec_user`, `rec_date`) VALUES
	(1, 'modal-width-90', 5, '\r\n	.modal-dialog.modal-custom \r\n	{\r\n		max-width: 90%;\r\n	}\r\n	\r\n	\r\n\r\n', 2, 2, '2022-02-15 13:26:00'),
	(2, 'back-warn', 5, 'history.pushState(null, null, location.href);\r\n    window.onpopstate = function () {\r\n        history.go(1);\r\n    };', 1, 2, '2022-02-15 13:27:00'),
	(3, 'Admin-Menu_db', 5, '<nav class=\'navbar navbar-expand-sm bg-dark navbar-dark\'><div class="container-fluid "><a class=\'navbar-brand\' href=\'/JBCA_F/admin/admin.jsp\'>JBCA</a><ul class=\'navbar-nav\'><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-bs-toggle=\'dropdown\' href=\'/JBCA_F/#\'>Pages</a>	<div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/JBCA_F/page/page.jsp\'>Page</a><a class=\'dropdown-item\' href=\'/JBCA_F/page/theme.jsp\'>Theme</a><a class=\'dropdown-item\' href=\'/JBCA_F/page/page-link.jsp\'>Page Link</a><a class=\'dropdown-item\' href=\'/JBCA_F/page/page-map.jsp\'>Page Map</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-bs-toggle=\'dropdown\' href=\'/JBCA_F/#\'>Codes</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/JBCA_F/code/code.jsp\'>Code</a><a class=\'dropdown-item\' href=\'/JBCA_F/code/code-map.jsp\'>Code Map</a></div></li><li class=\'nav-item\'><a class=\'nav-link\' href=\'/JBCA_F/menu/menu.jsp\'>Menus</a></li><li class=\'nav-item\'><a class=\'nav-link\' href=\'/JBCA_F/file/file.jsp\'>Files</a></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-bs-toggle=\'dropdown\' href=\'/JBCA_F/#\'>References</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/JBCA_F/reference/code-type.jsp\'>Code Type</a><a class=\'dropdown-item\' href=\'/JBCA_F/reference/file-type.jsp\'>File Type</a><a class=\'dropdown-item\' href=\'/JBCA_F/reference/message-type.jsp\'>Message Type</a><a class=\'dropdown-item\' href=\'/JBCA_F/reference/page-type.jsp\'>Page Type</a>	<a class=\'dropdown-item\' href=\'/JBCA_F/reference/path.jsp\'>Path</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-bs-toggle=\'dropdown\' href=\'/JBCA_F/#\'>Log Records</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/JBCA_F/log/log-form.jsp\'>Log Form</a><a class=\'dropdown-item\' href=\'/JBCA_F/log/log-table.jsp\'>Log Table</a><a class=\'dropdown-item\' href=\'/JBCA_F/log/log-type.jsp\'>Log Type</a><a class=\'dropdown-item\' href=\'/JBCA_F/log/log.jsp\'>View Log</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-bs-toggle=\'dropdown\' href=\'/JBCA_F/#\'>User</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/JBCA_F/admin/admin.jsp\'>Administration</a><a class=\'dropdown-item\' href=\'/JBCA_F/admin/group.jsp\'>Group</a><a class=\'dropdown-item\' href=\'/JBCA_F/user/message.jsp\'>Message Record</a><a class=\'dropdown-item\' href=\'/JBCA_F/user/message-map.jsp\'>Message Delivery</a><a class=\'dropdown-item\' href=\'/JBCA_F/user/message-rew.jsp\'>Message Review</a><a class=\'dropdown-item\' href=\'/JBCA_F/user/password.jsp\'>Password</a><a class=\'dropdown-item\' href=\'/JBCA_F/start/login.jsp\'>Login</a></div></li></ul><ul class=\'navbar-nav ms-auto\'><li><a href=\'/JBCA_F/admin/admin.jsp\' style=\'color:#ffffff\'>EN</a></li><li><span style=\'color:#ffffff\'>/</span></li><li><a href=\'/JBCA_F/admin/yonetim.jsp\' style=\'color:#ffffff\'>TR</a></li></ul></div></nav>', 5, 1, '2023-08-08 16:33:00');
/*!40000 ALTER TABLE `jbc_code` ENABLE KEYS */;

-- tablo yapısı dökülüyor jbcdb.jbc_code_map
CREATE TABLE IF NOT EXISTS `jbc_code_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mapped_code` int(11) NOT NULL,
  `page_link` int(11) NOT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_map_unique` (`mapped_code`,`page_link`),
  KEY `jbc_code_map_ibfk_2` (`page_link`),
  CONSTRAINT `jbc_code_map_ibfk_1` FOREIGN KEY (`mapped_code`) REFERENCES `jbc_code` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_code_map_ibfk_2` FOREIGN KEY (`page_link`) REFERENCES `jbc_page` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- jbcdb.jbc_code_map: ~4 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `jbc_code_map` DISABLE KEYS */;
INSERT INTO `jbc_code_map` (`id`, `mapped_code`, `page_link`, `rec_user`, `rec_date`) VALUES
	(1, 2, 24, 2, '2022-02-15 13:38:00'),
	(2, 2, 25, 2, '2022-02-15 13:38:00'),
	(3, 1, 24, 2, '2022-02-15 13:40:00'),
	(4, 1, 25, 2, '2022-02-15 13:40:00');
/*!40000 ALTER TABLE `jbc_code_map` ENABLE KEYS */;

-- tablo yapısı dökülüyor jbcdb.jbc_code_type
CREATE TABLE IF NOT EXISTS `jbc_code_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_type_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_type_unique` (`code_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- jbcdb.jbc_code_type: ~5 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `jbc_code_type` DISABLE KEYS */;
INSERT INTO `jbc_code_type` (`id`, `code_type_name`) VALUES
	(2, 'css'),
	(5, 'HTML'),
	(1, 'javascript'),
	(3, 'other'),
	(4, 'XML');
/*!40000 ALTER TABLE `jbc_code_type` ENABLE KEYS */;

-- tablo yapısı dökülüyor jbcdb.jbc_contact
CREATE TABLE IF NOT EXISTS `jbc_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  `e_mail` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  `web_site` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `message_data` varchar(10000) CHARACTER SET utf8mb4 NOT NULL,
  `rec_user` int(11) DEFAULT NULL,
  `rec_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jbc_contact_ibfk_1` (`rec_user`),
  CONSTRAINT `jbc_contact_ibfk_1` FOREIGN KEY (`rec_user`) REFERENCES `jbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- jbcdb.jbc_contact: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `jbc_contact` DISABLE KEYS */;
INSERT INTO `jbc_contact` (`id`, `contact_name`, `e_mail`, `web_site`, `message_data`, `rec_user`, `rec_date`) VALUES
	(1, 'deneme01', 'hayati.kinas@gmail.com', 'https://www.hayatikinas.com', 'Deneme 01', NULL, '2022-02-22 17:07:00');
/*!40000 ALTER TABLE `jbc_contact` ENABLE KEYS */;

-- tablo yapısı dökülüyor jbcdb.jbc_currency
CREATE TABLE IF NOT EXISTS `jbc_currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_code` varchar(150) NOT NULL,
  `currency_name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_unique` (`currency_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- jbcdb.jbc_currency: ~3 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `jbc_currency` DISABLE KEYS */;
INSERT INTO `jbc_currency` (`id`, `currency_code`, `currency_name`) VALUES
	(1, 'TL', 'Türk Lirası'),
	(2, 'USD', 'Amerikan Doları'),
	(3, 'EUR', 'EURO');
/*!40000 ALTER TABLE `jbc_currency` ENABLE KEYS */;

-- tablo yapısı dökülüyor jbcdb.jbc_exc_rate
CREATE TABLE IF NOT EXISTS `jbc_exc_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cur_code` int(11) NOT NULL,
  `fx_buy` decimal(10,4) NOT NULL,
  `fx_sel` decimal(10,4) NOT NULL,
  `bn_buy` decimal(10,4) NOT NULL,
  `bn_sel` decimal(10,4) NOT NULL,
  `unit` int(11) NOT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_unique` (`cur_code`),
  KEY `jbc_exc_rate_ibfk_1` (`cur_code`),
  KEY `jbc_exc_rate_ibfk_2` (`rec_user`),
  CONSTRAINT `jbc_exc_rate_ibfk_1` FOREIGN KEY (`cur_code`) REFERENCES `jbc_currency` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_exc_rate_ibfk_2` FOREIGN KEY (`rec_user`) REFERENCES `jbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- jbcdb.jbc_exc_rate: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `jbc_exc_rate` DISABLE KEYS */;
INSERT INTO `jbc_exc_rate` (`id`, `cur_code`, `fx_buy`, `fx_sel`, `bn_buy`, `bn_sel`, `unit`, `rec_user`, `rec_date`) VALUES
	(1, 2, 8.8240, 8.8399, 8.8178, 8.8531, 1, 1, '2021-09-26 18:06:00'),
	(2, 3, 10.3526, 10.3712, 10.3453, 10.3868, 1, 1, '2021-09-26 18:06:00');
/*!40000 ALTER TABLE `jbc_exc_rate` ENABLE KEYS */;

-- tablo yapısı dökülüyor jbcdb.jbc_file
CREATE TABLE IF NOT EXISTS `jbc_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  `adr_path` int(11) NOT NULL,
  `file_data` mediumblob DEFAULT NULL,
  `file_type` int(11) NOT NULL,
  `file_size` int(20) DEFAULT NULL,
  `mime_type` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_unique` (`file_name`),
  KEY `jbc_file_ibfk_1` (`adr_path`),
  KEY `jbc_file_ibfk_2` (`file_type`),
  KEY `jbc_file_ibfk_3` (`rec_user`),
  CONSTRAINT `jbc_file_ibfk_1` FOREIGN KEY (`adr_path`) REFERENCES `jbc_path` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_file_ibfk_2` FOREIGN KEY (`file_type`) REFERENCES `jbc_file_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_file_ibfk_3` FOREIGN KEY (`rec_user`) REFERENCES `jbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- jbcdb.jbc_file: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `jbc_file` DISABLE KEYS */;
INSERT INTO `jbc_file` (`id`, `file_name`, `adr_path`, `file_data`, `file_type`, `file_size`, `mime_type`, `rec_user`, `rec_date`) VALUES
	(1, 'jbca.js', 2, _binary 0x2f2a2a200d0a2a206a6263612e6a73202d2076312e30202d20323031382d31312d32380d0a2a2068747470733a2f2f7777772e6861796174696b696e61732e636f6d0d0a2a205468697320636f6cc59e2cc39c5d292f672c202720243127292e7472696d28293b0d0a0974657874203d20746578742e7265706c616365282f20202b2f672c20272027292e7472696d28293b0d0a096c6f675374722874657874293b0d0a090d0a097478456c6d2e76616c7565203d20746578743b0d0a7d0d0a0d0a, 7, 29522, 'text/javascript', 1, '2025-04-20 14:43:00');
/*!40000 ALTER TABLE `jbc_file` ENABLE KEYS */;

-- tablo yapısı dökülüyor jbcdb.jbc_file_type
CREATE TABLE IF NOT EXISTS `jbc_file_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_type_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_type_unique` (`file_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

-- jbcdb.jbc_file_type: ~8 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `jbc_file_type` DISABLE KEYS */;
INSERT INTO `jbc_file_type` (`id`, `file_type_name`) VALUES
	(4, 'excel'),
	(1, 'image'),
	(8, 'java'),
	(7, 'javascript'),
	(6, 'json'),
	(5, 'other'),
	(2, 'pdf'),
	(3, 'word');
/*!40000 ALTER TABLE `jbc_file_type` ENABLE KEYS */;

-- tablo yapısı dökülüyor jbcdb.jbc_group
CREATE TABLE IF NOT EXISTS `jbc_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_name_UNIQUE` (`group_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- jbcdb.jbc_group: ~4 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `jbc_group` DISABLE KEYS */;
INSERT INTO `jbc_group` (`id`, `group_name`) VALUES
	(1, 'Admin'),
	(3, 'Guest'),
	(5, 'Normal'),
	(6, 'Supervisor');
/*!40000 ALTER TABLE `jbc_group` ENABLE KEYS */;

-- tablo yapısı dökülüyor jbcdb.jbc_image
CREATE TABLE IF NOT EXISTS `jbc_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  `adr_path` int(11) NOT NULL,
  `image_data` mediumblob DEFAULT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `image_unique` (`image_name`),
  KEY `jbc_image_ibfk_1` (`rec_user`),
  KEY `jbc_image_ibfk_2` (`adr_path`),
  CONSTRAINT `jbc_image_ibfk_1` FOREIGN KEY (`rec_user`) REFERENCES `jbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_image_ibfk_2` FOREIGN KEY (`adr_path`) REFERENCES `jbc_path` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- jbcdb.jbc_image: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `jbc_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbc_image` ENABLE KEYS */;

-- tablo yapısı dökülüyor jbcdb.jbc_log
CREATE TABLE IF NOT EXISTS `jbc_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rec_id` int(11) NOT NULL,
  `form_name` int(11) NOT NULL,
  `type_name` int(11) NOT NULL,
  `table_name` int(11) NOT NULL,
  `log_data` text CHARACTER SET utf8mb4 NOT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jbc_log_ibfk_1` (`rec_user`),
  KEY `jbc_log_ibfk_2` (`form_name`),
  KEY `jbc_log_ibfk_3` (`type_name`),
  KEY `jbc_log_ibfk_4` (`table_name`) USING BTREE,
  CONSTRAINT `jbc_log_ibfk_1` FOREIGN KEY (`rec_user`) REFERENCES `jbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_log_ibfk_2` FOREIGN KEY (`form_name`) REFERENCES `jbc_log_form` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_log_ibfk_3` FOREIGN KEY (`table_name`) REFERENCES `jbc_log_table` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_log_ibfk_4` FOREIGN KEY (`type_name`) REFERENCES `jbc_log_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb3;

-- jbcdb.jbc_log: ~138 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `jbc_log` DISABLE KEYS */;
INSERT INTO `jbc_log` (`id`, `rec_id`, `form_name`, `type_name`, `table_name`, `log_data`, `rec_user`, `rec_date`) VALUES
	(4, 4, 17, 3, 7, '{"id": "4","page_name": "Kodlar-Sidebar","adr_path": "/JBCA_F/page/","page_type": "normal","rec_status": "Active"}', 1, '2021-11-11 19:57:00'),
	(5, 9, 17, 2, 7, '{"id": "9","page_name": "Loglar-Sidebar","adr_path": "/JBCA_F/page/","page_type": "normal","rec_status": "Active"}', 1, '2021-11-11 20:20:00'),
	(6, 9, 17, 3, 7, '{"id": "9","page_name": "Loglar-Sidebar","adr_path": "/JBCA_F/page/","page_type": "normal","rec_status": "Active"}', 1, '2021-11-11 20:21:00'),
	(7, 4, 17, 3, 7, '{"id": "4","page_name": "Kodlar-Sidebar","adr_path": "/JBCA_F/page/","page_type": "normal","rec_status": "Active"}', 1, '2021-11-11 20:29:00'),
	(8, 10, 17, 2, 7, '{"id": "10","page_name": "Codes-Sidebar","adr_path": "/JBCA_F/page/","page_type": "normal","rec_status": "Active"}', 1, '2022-02-14 11:54:00'),
	(9, 5, 17, 3, 7, '{"id": "5","page_name": "Referans-Sidebar","adr_path": "/JBCA_F/page/","page_type": "normal","rec_status": "Active"}', 1, '2022-02-14 11:54:00'),
	(10, 11, 17, 2, 7, '{"id": "11","page_name": "Files-Sidebar","adr_path": "/JBCA_F/page/","page_type": "normal","rec_status": "Active"}', 1, '2022-02-14 11:56:00'),
	(11, 12, 17, 2, 7, '{"id": "12","page_name": "Logs-Sidebar","adr_path": "/JBCA_F/page/","page_type": "normal","rec_status": "Active"}', 1, '2022-02-14 11:57:00'),
	(12, 13, 17, 2, 7, '{"id": "13","page_name": "Normal-Sidebar","adr_path": "/JBCA_F/page/","page_type": "normal","rec_status": "Active"}', 1, '2022-02-14 12:19:00'),
	(13, 14, 17, 2, 7, '{"id": "14","page_name": "Pages-Sidebar","adr_path": "/JBCA_F/page/","page_type": "normal","rec_status": "Active"}', 1, '2022-02-14 12:20:00'),
	(14, 15, 17, 2, 7, '{"id": "15","page_name": "Reference-Sidebar","adr_path": "/JBCA_F/page/","page_type": "normal","rec_status": "Active"}', 1, '2022-02-14 12:21:00'),
	(15, 16, 17, 2, 7, '{"id": "16","page_name": "Supervisor-Sidebar","adr_path": "/JBCA_F/page/","page_type": "normal","rec_status": "Active"}', 1, '2022-02-14 12:21:00'),
	(16, 17, 17, 2, 7, '{"id": "17","page_name": "User-Sidebar","adr_path": "/JBCA_F/page/","page_type": "normal","rec_status": "Active"}', 1, '2022-02-14 13:35:00'),
	(17, 18, 17, 2, 7, '{"id": "18","page_name": "Sohbet-Sidebar","adr_path": "/JBCA_F/page/","page_type": "normal","rec_status": "Passive"}', 1, '2022-02-14 15:17:00'),
	(121, 3, 17, 3, 7, '{"id": "3","page_name": "Gözetim-Sidebar","adr_path": "/JBCA_F/page/","page_type": "normal","rec_status": "Active"}', 1, '2023-07-19 13:20:00'),
	(122, 5, 17, 3, 7, '{"id": "5","page_name": "Referans-Sidebar","adr_path": "/JBCA_F/page/","page_type": "normal","rec_status": "Active"}', 1, '2023-07-25 16:06:00'),
	(123, 4, 17, 3, 7, '{"id": "4","page_name": "Kodlar-Sidebar","adr_path": "/JBCA_F/page/","page_type": "normal","rec_status": "Active"}', 1, '2023-07-25 16:09:00'),
	(124, 6, 17, 3, 7, '{"id": "6","page_name": "Normal-Sidebar-TR","adr_path": "/JBCA_F/page/","page_type": "normal","rec_status": "Active"}', 1, '2023-07-25 16:10:00'),
	(125, 7, 17, 3, 7, '{"id": "7","page_name": "Admin-Sidebar","adr_path": "/JBCA_F/page/","page_type": "normal","rec_status": "Active"}', 1, '2023-07-25 16:10:00'),
	(126, 8, 17, 3, 7, '{"id": "8","page_name": "Dosyalar-Sidebar","adr_path": "/JBCA_F/page/","page_type": "normal","rec_status": "Active"}', 1, '2023-07-25 16:11:00'),
	(127, 9, 17, 3, 7, '{"id": "9","page_name": "Loglar-Sidebar","adr_path": "/JBCA_F/page/","page_type": "normal","rec_status": "Active"}', 1, '2023-07-25 16:15:00'),
	(128, 10, 17, 3, 7, '{"id": "10","page_name": "Codes-Sidebar","adr_path": "/JBCA_F/page/","page_type": "normal","rec_status": "Active"}', 1, '2023-07-25 16:17:00'),
	(129, 6, 1, 3, 2, '{"id": "6","user_name": "test03","user_code": "test03","user_group": "Admin","e_mail": "info@hayatikinas.com","rec_status": "Active","page_size": "1000"}', 1, '2025-04-10 20:25:00'),
	(130, 6, 1, 3, 2, '{"id": "6","user_name": "test003","user_code": "test03","user_group": "Admin","e_mail": "info@hayatikinas.com","rec_status": "Active","page_size": "1000"}', 1, '2025-04-12 17:52:00'),
	(131, 3, 1, 3, 2, '{"id": "3","user_name": "test02","user_code": "test02","user_group": "Supervisor","e_mail": "hayati.kinas@gmail.com","rec_status": "Active","page_size": "100"}', 1, '2025-04-13 18:39:00'),
	(132, 3, 1, 3, 2, '{"id": "3","user_name": "test02","user_code": "test02","user_group": "Supervisor","e_mail": "hayati.kinas@gmail.com","rec_status": "Active","page_size": "100"}', 1, '2025-04-13 18:43:00'),
	(133, 6, 1, 3, 2, '{"id": "6","user_name": "test03","user_code": "test03","user_group": "Admin","e_mail": "info@hayatikinas.com","rec_status": "Active","page_size": "1000"}', 1, '2025-04-13 18:44:00'),
	(134, 3, 1, 3, 2, '{"id": "3","user_name": "test002","user_code": "test002","user_group": "Supervisor","e_mail": "hayati.kinas@gmail.com","rec_status": "Active","page_size": "100"}', 1, '2025-04-15 12:47:00'),
	(135, 3, 1, 3, 2, '{"id": "3","user_name": "test02","user_code": "test02","user_group": "Supervisor","e_mail": "hayati.kinas@gmail.com","rec_status": "Active","page_size": "100"}', 1, '2025-04-15 12:59:00'),
	(136, 3, 1, 3, 2, '{"id": "3","user_name": "test02","user_code": "test02","user_group": "Supervisor","e_mail": "hayati.kinas@gmail.com","rec_status": "Active","page_size": "100"}', 1, '2025-04-15 18:02:00'),
	(137, 1, 9, 3, 4, '{"id": "1","file_name": "jbca.js","adr_path": "/JBCA_F/file/","file_type": "javascript","file_size": "29522","mime_type": "text/javascript"}', 1, '2025-04-20 14:43:00'),
	(138, 2, 17, 3, 7, '{"id": "2","page_name": "Sayfalar-Sidebar","adr_path": "/JBCA_F/page/","page_type": "normal","rec_status": "Active"}', 1, '2025-04-20 15:41:00'),
	(139, 14, 19, 3, 7, '{"id": "14","page_name": "Pages-Sidebar","adr_path": "/JBCA_F/page/","page_type": "normal","rec_status": "Active"}', 1, '2025-04-20 18:05:00'),
	(140, 14, 19, 3, 7, '{"id": "14","page_name": "Pages-Sidebar","adr_path": "/JBCA_F/page/","page_type": "normal","rec_status": "Active"}', 1, '2025-04-20 18:11:00'),
	(141, 2, 19, 3, 7, '{"id": "2","page_name": "Sayfalar-Sidebar","adr_path": "/JBCA_F/page/","page_type": "normal","rec_status": "Active"}', 1, '2025-04-20 18:20:00'),
	(142, 14, 19, 3, 7, '{"id": "14","page_name": "Pages-Sidebar","adr_path": "/JBCA_F/page/","page_type": "normal","rec_status": "Active"}', 1, '2025-04-20 18:21:00');
/*!40000 ALTER TABLE `jbc_log` ENABLE KEYS */;

-- tablo yapısı dökülüyor jbcdb.jbc_log_form
CREATE TABLE IF NOT EXISTS `jbc_log_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_form_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `log_form_unique` (`log_form_name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;

-- jbcdb.jbc_log_form: ~23 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `jbc_log_form` DISABLE KEYS */;
INSERT INTO `jbc_log_form` (`id`, `log_form_name`) VALUES
	(6, 'Code'),
	(4, 'Code Map'),
	(7, 'Contact'),
	(9, 'Dosya'),
	(10, 'File'),
	(8, 'İletişim'),
	(5, 'Kod'),
	(3, 'Kod Map'),
	(1, 'Kullanıcı'),
	(11, 'Menü'),
	(14, 'Mesaj'),
	(12, 'Mesaj Map'),
	(15, 'Message'),
	(13, 'Message Map'),
	(19, 'Page'),
	(20, 'Page Link'),
	(21, 'Page Map'),
	(17, 'Sayfa'),
	(16, 'Sayfa Link'),
	(18, 'Sayfa Map'),
	(22, 'Tema'),
	(23, 'Theme'),
	(2, 'User');
/*!40000 ALTER TABLE `jbc_log_form` ENABLE KEYS */;

-- tablo yapısı dökülüyor jbcdb.jbc_log_table
CREATE TABLE IF NOT EXISTS `jbc_log_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_table_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `log_table_unique` (`log_table_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

-- jbcdb.jbc_log_table: ~13 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `jbc_log_table` DISABLE KEYS */;
INSERT INTO `jbc_log_table` (`id`, `log_table_name`) VALUES
	(1, 'jbc_code'),
	(13, 'jbc_code_map'),
	(3, 'jbc_contact'),
	(4, 'jbc_file'),
	(5, 'jbc_image'),
	(6, 'jbc_menu'),
	(11, 'jbc_message'),
	(12, 'jbc_message_map'),
	(7, 'jbc_page'),
	(8, 'jbc_page_link'),
	(9, 'jbc_page_map'),
	(10, 'jbc_theme'),
	(2, 'jbc_user');
/*!40000 ALTER TABLE `jbc_log_table` ENABLE KEYS */;

-- tablo yapısı dökülüyor jbcdb.jbc_log_type
CREATE TABLE IF NOT EXISTS `jbc_log_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_type_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `log_type_unique` (`log_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- jbcdb.jbc_log_type: ~3 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `jbc_log_type` DISABLE KEYS */;
INSERT INTO `jbc_log_type` (`id`, `log_type_name`) VALUES
	(1, 'delete'),
	(2, 'insert'),
	(3, 'update');
/*!40000 ALTER TABLE `jbc_log_type` ENABLE KEYS */;

-- tablo yapısı dökülüyor jbcdb.jbc_menu
CREATE TABLE IF NOT EXISTS `jbc_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  `adr_path` int(11) NOT NULL,
  `menu_data` varchar(16000) CHARACTER SET utf8mb4 DEFAULT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_unique` (`menu_name`),
  KEY `jbc_menu_ibfk_1` (`rec_user`),
  KEY `jbc_menu_ibfk_2` (`adr_path`),
  CONSTRAINT `jbc_menu_ibfk_1` FOREIGN KEY (`rec_user`) REFERENCES `jbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_menu_ibfk_2` FOREIGN KEY (`adr_path`) REFERENCES `jbc_path` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

-- jbcdb.jbc_menu: ~8 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `jbc_menu` DISABLE KEYS */;
INSERT INTO `jbc_menu` (`id`, `menu_name`, `adr_path`, `menu_data`, `rec_user`, `rec_date`) VALUES
	(1, 'Yonetici-Menu', 1, '<nav class=\'navbar navbar-expand-sm bg-dark navbar-dark\'><div class=container-fluid ><a class=\'navbar-brand\' href=\'/JBCA_F/admin/yonetim.jsp\'>JBCA</a><ul class=\'navbar-nav\'><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-bs-toggle=\'dropdown\' href=\'/JBCA_F/#\'>Sayfalar</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/JBCA_F/page/sayfa.jsp\'>Sayfa</a><a class=\'dropdown-item\' href=\'/JBCA_F/page/tema.jsp\'>Tema</a><a class=\'dropdown-item\' href=\'/JBCA_F/page/sayfa-link.jsp\'>Sayfa Link</a><a class=\'dropdown-item\' href=\'/JBCA_F/page/sayfa-map.jsp\'>Sayfa Map</a><a class=\'dropdown-item\' href=\'/JBCA_F/code/kod.jsp\'>Kod</a><a class=\'dropdown-item\' href=\'/JBCA_F/code/kod-map.jsp\'>Kod Map</a><a class=dropdown-item href=/JBCA_F/menu/menu-tr.jsp>Menüler</a><a class=dropdown-item href=/JBCA_F/file/dosya.jsp>Dosyalar</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-bs-toggle=\'dropdown\' href=\'/JBCA_F/#\'>Referanslar</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/JBCA_F/reference/kod-tip.jsp\'>Kod Tipi</a><a class=\'dropdown-item\' href=\'/JBCA_F/reference/dosya-tip.jsp\'>Dosya Tipi</a><a class=\'dropdown-item\' href=\'/JBCA_F/reference/mesaj-tip.jsp\'>Mesaj Tipi</a><a class=\'dropdown-item\' href=\'/JBCA_F/reference/pozisyon.jsp\'>Pozisyon</a><a class=\'dropdown-item\' href=\'/JBCA_F/reference/sayfa-tip.jsp\'>Sayfa Tipi</a><a class=\'dropdown-item\' href=\'/JBCA_F/reference/yol.jsp\'>Yol</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-bs-toggle=\'dropdown\' href=\'/JBCA_F/#\'>Log Kaydı</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/JBCA_F/log/log-formu.jsp\'>Log Formu</a><a class=\'dropdown-item\' href=\'/JBCA_F/log/log-tablo.jsp\'>Log Tablo</a><a class=\'dropdown-item\' href=\'/JBCA_F/log/log-tip.jsp\'>Log Tipi</a><a class=\'dropdown-item\' href=\'/JBCA_F/log/log-tr.jsp\'>Log İzle</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-bs-toggle=\'dropdown\' href=\'/JBCA_F/#\'>Kullanıcı</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/JBCA_F/admin/yonetim.jsp\'>Yönetim</a><a class=\'dropdown-item\' href=\'/JBCA_F/admin/grup.jsp\'>Grup</a><a class=\'dropdown-item\' href=\'/JBCA_F/user/mesaj.jsp\'>Mesaj Kaydet</a><a class=\'dropdown-item\' href=\'/JBCA_F/user/mesaj-map.jsp\'>Mesaj Dağıt</a><a class=\'dropdown-item\' href=\'/JBCA_F/user/mesaj-bak.jsp\'>Mesaj Bak</a><a class=\'dropdown-item\' href=\'/JBCA_F/user/sifre.jsp\'>Şifre</a><a class=\'dropdown-item\' href=\'/JBCA_F/start/giris.jsp\'>Çıkış</a></div></li></ul><ul class=\'navbar-nav ms-auto\'><li><button type=\'button\' class=\'btn btn-dark\' id=\'temeModeSwitch\'>Dark/Light</button></li></ul><ul class=\'navbar-nav ms-auto\'><li><a href=\'/JBCA_F/admin/admin.jsp\' style=\'color:#ffffff\'>EN</a></li><li><span style=\'color:#ffffff\'>/</span></li><li><a href=\'/JBCA_F/admin/yonetim.jsp\' style=\'color:#ffffff\'>TR</a></li></ul></div></nav>', 1, '2025-04-10 16:53:00'),
	(2, 'Gozetmen-Menu', 1, '<nav class=\'navbar navbar-expand-sm bg-dark navbar-dark\'><div class=container-fluid ><a class=\'navbar-brand\' href=\'/JBCA_F/admin/yonetim.jsp\'>JBCA</a><ul class=\'navbar-nav\'><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-bs-toggle=\'dropdown\' href=\'/JBCA_F/#\'>Sayfalar</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/JBCA_F/page/sayfa.jsp\'>Sayfa</a><a class=\'dropdown-item\' href=\'/JBCA_F/page/tema.jsp\'>Tema</a><a class=\'dropdown-item\' href=\'/JBCA_F/page/sayfa-link.jsp\'>Sayfa Link</a><a class=\'dropdown-item\' href=\'/JBCA_F/page/sayfa-map.jsp\'>Sayfa Map</a><a class=\'dropdown-item\' href=\'/JBCA_F/code/kod.jsp\'>Kod</a><a class=\'dropdown-item\' href=\'/JBCA_F/code/kod-map.jsp\'>Kod Map</a><a class=dropdown-item href=/JBCA_F/menu/menu-tr.jsp>Menüler</a><a class=dropdown-item href=/JBCA_F/file/dosya.jsp>Dosyalar</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-bs-toggle=\'dropdown\' href=\'/JBCA_F/#\'>Referanslar</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/JBCA_F/reference/kod-tip.jsp\'>Kod Tipi</a><a class=\'dropdown-item\' href=\'/JBCA_F/reference/dosya-tip.jsp\'>Dosya Tipi</a><a class=\'dropdown-item\' href=\'/JBCA_F/reference/mesaj-tip.jsp\'>Mesaj Tipi</a><a class=\'dropdown-item\' href=\'/JBCA_F/reference/pozisyon.jsp\'>Pozisyon</a><a class=\'dropdown-item\' href=\'/JBCA_F/reference/sayfa-tip.jsp\'>Sayfa Tipi</a><a class=\'dropdown-item\' href=\'/JBCA_F/reference/yol.jsp\'>Yol</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-bs-toggle=\'dropdown\' href=\'/JBCA_F/#\'>Log Kaydı</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/JBCA_F/log/log-formu.jsp\'>Log Formu</a><a class=\'dropdown-item\' href=\'/JBCA_F/log/log-tablo.jsp\'>Log Tablo</a><a class=\'dropdown-item\' href=\'/JBCA_F/log/log-tip.jsp\'>Log Tipi</a><a class=\'dropdown-item\' href=\'/JBCA_F/log/log-tr.jsp\'>Log İzle</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-bs-toggle=\'dropdown\' href=\'/JBCA_F/#\'>Kullanıcı</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/JBCA_F/user/kullanici.jsp\'>Kullanıcı</a><a class=\'dropdown-item\' href=\'/JBCA_F/user/mesaj.jsp\'>Mesaj Kaydet</a><a class=\'dropdown-item\' href=\'/JBCA_F/user/mesaj-map.jsp\'>Mesaj Dağıt</a><a class=\'dropdown-item\' href=\'/JBCA_F/user/mesaj-bak.jsp\'>Mesaj Bak</a><a class=\'dropdown-item\' href=\'/JBCA_F/user/sifre.jsp\'>Şifre</a><a class=\'dropdown-item\' href=\'/JBCA_F/start/giris.jsp\'>Çıkış</a></div></li></ul><ul class=\'navbar-nav ms-auto\'><li><button type=\'button\' class=\'btn btn-dark\' id=\'temeModeSwitch\'>Dark/Light</button></li></ul><ul class=\'navbar-nav ms-auto\'><li><a href=\'/JBCA_F/admin/admin.jsp\' style=\'color:#ffffff\'>EN</a></li><li><span style=\'color:#ffffff\'>/</span></li><li><a href=\'/JBCA_F/admin/yonetim.jsp\' style=\'color:#ffffff\'>TR</a></li></ul></div></nav>', 1, '2025-04-10 18:21:00'),
	(3, 'Normal-Kul-Menu', 1, '<nav class=\'navbar navbar-expand-sm bg-dark navbar-dark\'><div class=\'container-fluid \'><a class=\'navbar-brand\' href=\'/JBCA_F/user/mesaj-bak.jsp\'>JBCA</a><ul class=\'navbar-nav\'><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-bs-toggle=\'dropdown\' href=\'/JBCA_F/#\'>Sayfalar</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/JBCA_F/page/sayfa.jsp\'>Sayfa</a><a class=\'dropdown-item\' href=\'/JBCA_F/page/tema.jsp\'>Tema</a><a class=\'dropdown-item\' href=\'/JBCA_F/page/sayfa-link.jsp\'>Sayfa Link</a><a class=\'dropdown-item\' href=\'/JBCA_F/page/sayfa-map.jsp\'>Sayfa Map</a><a class=\'dropdown-item\' href=\'/JBCA_F/file/dosya.jsp\'>Dosyalar</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-bs-toggle=\'dropdown\' href=\'/JBCA_F/#\'>Kullanıcı</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/JBCA_F/user/mesaj.jsp\'>Mesaj Kaydet</a><a class=\'dropdown-item\' href=\'/JBCA_F/user/mesaj-bak.jsp\'>Mesaj Bak</a><a class=\'dropdown-item\' href=\'/JBCA_F/user/sifre.jsp\'>Şifre</a><a class=\'dropdown-item\' href=\'/JBCA_F/start/giris.jsp\'>Çıkış</a></div></li></ul><ul class=\'navbar-nav ms-auto\'><li><button type=\'button\' class=\'btn btn-dark\' id=\'temeModeSwitch\'>Dark/Light</button></li></ul><ul class=\'navbar-nav ms-auto\'><li><a href=\'/JBCA_F/user/message-rew.jsp\' style=\'color:#ffffff\'>EN</a></li><li><span style=\'color:#ffffff\'>/</span></li><li><a href=\'/JBCA_F/user/mesaj-bak.jsp\' style=\'color:#ffffff\'>TR</a></li></ul></div></nav>', 1, '2025-04-10 18:18:00'),
	(4, 'Admin-Menu', 1, '<nav class=\'navbar navbar-expand-sm bg-dark navbar-dark\'><div class=container-fluid ><a class=\'navbar-brand\' href=\'/JBCA_F/admin/admin.jsp\'>JBCA</a><ul class=\'navbar-nav\'><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-bs-toggle=\'dropdown\' href=\'/JBCA_F/#\'>Pages</a>	<div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/JBCA_F/page/page.jsp\'>Page</a><a class=\'dropdown-item\' href=\'/JBCA_F/page/theme.jsp\'>Theme</a><a class=\'dropdown-item\' href=\'/JBCA_F/page/page-link.jsp\'>Page Link</a><a class=\'dropdown-item\' href=\'/JBCA_F/page/page-map.jsp\'>Page Map</a><a class=\'dropdown-item\' href=\'/JBCA_F/code/code.jsp\'>Code</a><a class=\'dropdown-item\' href=\'/JBCA_F/code/code-map.jsp\'>Code Map</a><a class=dropdown-item href=/JBCA_F/menu/menu.jsp>Menus</a><a class=dropdown-item href=/JBCA_F/file/file.jsp>Files</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-bs-toggle=\'dropdown\' href=\'/JBCA_F/#\'>References</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/JBCA_F/reference/code-type.jsp\'>Code Type</a><a class=\'dropdown-item\' href=\'/JBCA_F/reference/file-type.jsp\'>File Type</a><a class=\'dropdown-item\' href=\'/JBCA_F/reference/message-type.jsp\'>Message Type</a><a class=\'dropdown-item\' href=\'/JBCA_F/reference/page-type.jsp\'>Page Type</a>	<a class=\'dropdown-item\' href=\'/JBCA_F/reference/path.jsp\'>Path</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-bs-toggle=\'dropdown\' href=\'/JBCA_F/#\'>Log Records</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/JBCA_F/log/log-form.jsp\'>Log Form</a><a class=\'dropdown-item\' href=\'/JBCA_F/log/log-table.jsp\'>Log Table</a><a class=\'dropdown-item\' href=\'/JBCA_F/log/log-type.jsp\'>Log Type</a><a class=\'dropdown-item\' href=\'/JBCA_F/log/log.jsp\'>View Log</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-bs-toggle=\'dropdown\' href=\'/JBCA_F/#\'>User</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/JBCA_F/admin/admin.jsp\'>Administration</a><a class=\'dropdown-item\' href=\'/JBCA_F/admin/group.jsp\'>Group</a><a class=\'dropdown-item\' href=\'/JBCA_F/user/message.jsp\'>Message Record</a><a class=\'dropdown-item\' href=\'/JBCA_F/user/message-map.jsp\'>Message Delivery</a><a class=\'dropdown-item\' href=\'/JBCA_F/user/message-rew.jsp\'>Message Review</a><a class=\'dropdown-item\' href=\'/JBCA_F/user/password.jsp\'>Password</a><a class=\'dropdown-item\' href=\'/JBCA_F/start/login.jsp\'>Login</a></div></li></ul><ul class=\'navbar-nav ms-auto\'><li><button type=\'button\' class=\'btn btn-dark\' id=\'temeModeSwitch\'>Dark/Light</button></li></ul><ul class=\'navbar-nav ms-auto\'><li><a href=\'/JBCA_F/admin/admin.jsp\' style=\'color:#ffffff\'>EN</a></li><li><span style=\'color:#ffffff\'>/</span></li><li><a href=\'/JBCA_F/admin/yonetim.jsp\' style=\'color:#ffffff\'>TR</a></li></ul></div></nav>', 1, '2025-04-10 18:23:00'),
	(5, 'Superviser-Menu', 1, '<nav class=\'navbar navbar-expand-sm bg-dark navbar-dark\'><div class=container-fluid ><a class=\'navbar-brand\' href=\'/JBCA_F/admin/admin.jsp\'>JBCA</a><ul class=\'navbar-nav\'><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-bs-toggle=\'dropdown\' href=\'/JBCA_F/#\'>Pages</a>	<div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/JBCA_F/page/page.jsp\'>Page</a><a class=\'dropdown-item\' href=\'/JBCA_F/page/theme.jsp\'>Theme</a><a class=\'dropdown-item\' href=\'/JBCA_F/page/page-link.jsp\'>Page Link</a><a class=\'dropdown-item\' href=\'/JBCA_F/page/page-map.jsp\'>Page Map</a><a class=\'dropdown-item\' href=\'/JBCA_F/code/code.jsp\'>Code</a><a class=\'dropdown-item\' href=\'/JBCA_F/code/code-map.jsp\'>Code Map</a><a class=dropdown-item href=/JBCA_F/menu/menu.jsp>Menus</a><a class=dropdown-item href=/JBCA_F/file/file.jsp>Files</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-bs-toggle=\'dropdown\' href=\'/JBCA_F/#\'>References</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/JBCA_F/reference/code-type.jsp\'>Code Type</a><a class=\'dropdown-item\' href=\'/JBCA_F/reference/file-type.jsp\'>File Type</a><a class=\'dropdown-item\' href=\'/JBCA_F/reference/message-type.jsp\'>Message Type</a><a class=\'dropdown-item\' href=\'/JBCA_F/reference/page-type.jsp\'>Page Type</a>	<a class=\'dropdown-item\' href=\'/JBCA_F/reference/path.jsp\'>Path</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-bs-toggle=\'dropdown\' href=\'/JBCA_F/#\'>Log Records</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/JBCA_F/log/log-form.jsp\'>Log Form</a><a class=\'dropdown-item\' href=\'/JBCA_F/log/log-table.jsp\'>Log Table</a><a class=\'dropdown-item\' href=\'/JBCA_F/log/log-type.jsp\'>Log Type</a><a class=\'dropdown-item\' href=\'/JBCA_F/log/log.jsp\'>View Log</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-bs-toggle=\'dropdown\' href=\'/JBCA_F/#\'>User</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/JBCA_F/user/user.jsp\'>User</a><a class=\'dropdown-item\' href=\'/JBCA_F/admin/group.jsp\'>Group</a><a class=\'dropdown-item\' href=\'/JBCA_F/user/message.jsp\'>Message Record</a><a class=\'dropdown-item\' href=\'/JBCA_F/user/message-map.jsp\'>Message Delivery</a><a class=\'dropdown-item\' href=\'/JBCA_F/user/message-rew.jsp\'>Message Review</a><a class=\'dropdown-item\' href=\'/JBCA_F/user/password.jsp\'>Password</a><a class=\'dropdown-item\' href=\'/JBCA_F/start/login.jsp\'>Login</a></div></li></ul><ul class=\'navbar-nav ms-auto\'><li><button type=\'button\' class=\'btn btn-dark\' id=\'temeModeSwitch\'>Dark/Light</button></li></ul><ul class=\'navbar-nav ms-auto\'><li><a href=\'/JBCA_F/admin/admin.jsp\' style=\'color:#ffffff\'>EN</a></li><li><span style=\'color:#ffffff\'>/</span></li><li><a href=\'/JBCA_F/admin/yonetim.jsp\' style=\'color:#ffffff\'>TR</a></li></ul></div></nav>', 1, '2025-04-10 18:14:00'),
	(6, 'Normal-User-Menu', 1, '<nav class=\'navbar navbar-expand-sm bg-dark navbar-dark\'><div class=container-fluid ><a class=\'navbar-brand\' href=\'/JBCA_F/user/message-rew.jsp\'>JBCA</a><ul class=\'navbar-nav\'><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-bs-toggle=\'dropdown\' href=\'/JBCA_F/#\'>Pages</a>	<div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/JBCA_F/page/page.jsp\'>Page</a><a class=\'dropdown-item\' href=\'/JBCA_F/page/theme.jsp\'>Theme</a><a class=\'dropdown-item\' href=\'/JBCA_F/page/page-link.jsp\'>Page Link</a><a class=\'dropdown-item\' href=\'/JBCA_F/page/page-map.jsp\'>Page Map</a><a class=dropdown-item href=/JBCA_F/file/file.jsp>Files</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-bs-toggle=\'dropdown\' href=\'/JBCA_F/#\'>User</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/JBCA_F/user/message-rew.jsp\'>Message Review</a><a class=\'dropdown-item\' href=\'/JBCA_F/user/password.jsp\'>Password</a><a class=\'dropdown-item\' href=\'/JBCA_F/start/login.jsp\'>Login</a></div></li></ul><ul class=\'navbar-nav ms-auto\'><li><button type=\'button\' class=\'btn btn-dark\' id=\'temeModeSwitch\'>Dark/Light</button></li></ul><ul class=\'navbar-nav ms-auto\'><li><a href=\'/JBCA_F/user/message-rew.jsp\' style=\'color:#ffffff\'>EN</a></li><li><span style=\'color:#ffffff\'>/</span></li><li><a href=\'/JBCA_F/admin/yonetim.jsp\' style=\'color:#ffffff\'>TR</a></li></ul></div></nav>', 1, '2025-04-10 18:19:00'),
	(7, 'Websitesi-Menu', 11, '<nav class=\'navbar navbar-expand-lg navbar-dark bg-dark sticky-top\'>      <div class=\'container\'>		<a class=\'navbar-brand\' href=\'/website/start/baslangic/\'>MHK</a>		<ul class=\'navbar-nav\'>		  <li class=\'nav-item\'>			<a class=\'nav-link\' href=\'/website/start/baslangic/\'>Başlangıç</a>		  </li>	      <li class=\'nav-item dropdown\'>			<a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/website/services/hizmetler/\'>Hizmetler</a>			  <div class=\'dropdown-menu\'>          		<a class=\'dropdown-item\' href=\'/website/services/sistem-analiz-ve-tasarimi/\'>Analiz ve Tasarım</a>          		<a class=\'dropdown-item\' href=\'/website/services/yazilim-gelistirme/\'>Yazılım Geliştirme</a>          		<a class=\'dropdown-item\' href=\'/website/services/sistem-entegrasyon/\'>Entegrasyon</a>          		<a class=\'dropdown-item\' href=\'/website/services/veri-tabani-calismalari/\'>Veritabanı Çalışmaları</a>          		<a class=\'dropdown-item\' href=\'/website/services/danismanlik/\'>Danışmanlık</a>          	  </div>		  </li>		  <li class=\'nav-item dropdown\'>			<a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/website/about/mehmet-hayati-kinas-hakkinda/\'>Hakkında</a>			  <div class=\'dropdown-menu\'>				<a class=\'dropdown-item\' href=\'/website/about/mehmet-hayati-kinas-kimdir/\'>Mehmet Hayati KINAŞ Kimdir</a>				<a class=\'dropdown-item\' href=\'/website/about/is-tecrubeleri/\'>Tecrübeler</a>				<a class=\'dropdown-item\' href=\'/website/about/uzmanlik-alanlari/\'>Uzmanlık Alanları</a>			  </div>		  </li>		  <li class=\'nav-item\'>			<a class=\'nav-link\' href=\'/website/blog/bloglar/\'>Blog</a>		  </li>		  <li class=\'nav-item\'>			<a class=\'nav-link\' href=\'/website/sohbet/\'>Sohbet</a>		  </li>		  <li class=\'nav-item\'>			<a class=\'nav-link\' href=\'/website/contact/iletisim-bilgileri/\'>İletişim</a>		  </li>		</ul>		<ul class=\'navbar-nav ml-auto\'>			<li><a href=\'/website/start/inception/\' style=\'color:#ffffff\'>EN</a></li>			<li><span style=\'color:#ffffff\'>/</span></li>			<li><a href=\'/website/start/baslangic/\' style=\'color:#ffffff\'>TR</a></li>	    </ul>      </div>	</nav>', 2, '2022-02-14 18:14:00'),
	(8, 'Website-Menu', 11, '<nav class=\'navbar navbar-expand-lg navbar-dark bg-dark sticky-top\'><div class=\'container\'><a class=\'navbar-brand\' href=\'/website/start/inception.jsp\'>MHK</a><ul class=\'navbar-nav\'><li class=\'nav-item\'><a class=\'nav-link\' href=\'/website/start/inception.jsp\'>Inception</a></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/website/services/services.jsp\'>Services</a>			  <div class=\'dropdown-menu\'>          		<a class=\'dropdown-item\' href=\'/website/services/system.jsp\'>Analysis and Design</a>          		<a class=\'dropdown-item\' href=\'/website/services/software.jsp\'>Software Development</a>          		<a class=\'dropdown-item\' href=\'/website/services/integration.jsp\'>Integration</a>          		<a class=\'dropdown-item\' href=\'/website/services/database.jsp\'>Database Works</a>          		<a class=\'dropdown-item\' href=\'/website/services/consulting.jsp\'>Consulting</a>          	  </div>		  </li>		  <li class=\'nav-item dropdown\'>			<a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/website/about/about.jsp\'>About</a>			  <div class=\'dropdown-menu\'>				<a class=\'dropdown-item\' href=\'/website/about/whois.jsp\'>Who is Mehmet Hayati KINAŞ</a>				<a class=\'dropdown-item\' href=\'/website/about/experience.jsp\'>Experiences</a>				<a class=\'dropdown-item\' href=\'/website/about/expertise.jsp\'>Areas of Expertise</a>			  </div>		  </li>		  <li class=\'nav-item\'>			<a class=\'nav-link\' href=\'/website/blog/blog.jsp\'>Blog</a>		  </li>		  <li class=\'nav-item\'>			<a class=\'nav-link\' href=\'/website/contact/contact.jsp\'>Contact</a>		  </li>		</ul>		<ul class=\'navbar-nav ml-auto\'>			<li><a href=\'/website/start/inception.jsp\' style=\'color:#ffffff\'>EN</a></li>			<li><span style=\'color:#ffffff\'>/</span></li>			<li><a href=\'/website/start/baslangic.jsp\' style=\'color:#ffffff\'>TR</a></li>	    </ul>      </div>	</nav>', 2, '2022-02-14 18:15:00');
/*!40000 ALTER TABLE `jbc_menu` ENABLE KEYS */;

-- tablo yapısı dökülüyor jbcdb.jbc_message
CREATE TABLE IF NOT EXISTS `jbc_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  `msg_data` varchar(16000) CHARACTER SET utf8mb4 DEFAULT NULL,
  `message_type` int(11) NOT NULL,
  `rec_status` int(11) NOT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `message_unique` (`msg_name`) COMMENT '																				',
  KEY `jbc_message_ibfk_1` (`rec_status`),
  KEY `jbc_message_ibfk_2` (`rec_user`),
  KEY `jbc_message_ibfk_3` (`message_type`),
  CONSTRAINT `jbc_message_ibfk_1` FOREIGN KEY (`rec_status`) REFERENCES `jbc_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_message_ibfk_2` FOREIGN KEY (`rec_user`) REFERENCES `jbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_message_ibfk_3` FOREIGN KEY (`message_type`) REFERENCES `jbc_message_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- jbcdb.jbc_message: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `jbc_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbc_message` ENABLE KEYS */;

-- tablo yapısı dökülüyor jbcdb.jbc_message_map
CREATE TABLE IF NOT EXISTS `jbc_message_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mapped_msg` int(11) NOT NULL,
  `user_group` int(11) NOT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `message_map_unique` (`mapped_msg`,`user_group`),
  KEY `fk_message_map_group` (`user_group`),
  KEY `jbc_message_map_ibfk_1` (`rec_user`),
  CONSTRAINT `jbc_message_map_ibfk_1` FOREIGN KEY (`rec_user`) REFERENCES `jbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_message_map_ibfk_2` FOREIGN KEY (`user_group`) REFERENCES `jbc_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_message_map_ibfk_3` FOREIGN KEY (`mapped_msg`) REFERENCES `jbc_message` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- jbcdb.jbc_message_map: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `jbc_message_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbc_message_map` ENABLE KEYS */;

-- tablo yapısı dökülüyor jbcdb.jbc_message_type
CREATE TABLE IF NOT EXISTS `jbc_message_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_type_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `message_type_unique` (`msg_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- jbcdb.jbc_message_type: ~4 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `jbc_message_type` DISABLE KEYS */;
INSERT INTO `jbc_message_type` (`id`, `msg_type_name`) VALUES
	(2, 'alert'),
	(4, 'error'),
	(1, 'info'),
	(3, 'warning');
/*!40000 ALTER TABLE `jbc_message_type` ENABLE KEYS */;

-- tablo yapısı dökülüyor jbcdb.jbc_page
CREATE TABLE IF NOT EXISTS `jbc_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `adr_path` int(11) NOT NULL,
  `page_data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_type` int(11) NOT NULL,
  `rec_status` int(11) NOT NULL DEFAULT 1,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_unique` (`page_name`),
  KEY `jbc_page_ibfk_1` (`adr_path`),
  KEY `jbc_page_ibfk_2` (`page_type`),
  KEY `jbc_page_ibfk_3` (`rec_status`),
  KEY `jbc_page_ibfk_4` (`rec_user`),
  CONSTRAINT `jbc_page_ibfk_1` FOREIGN KEY (`adr_path`) REFERENCES `jbc_path` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_page_ibfk_2` FOREIGN KEY (`page_type`) REFERENCES `jbc_page_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_page_ibfk_3` FOREIGN KEY (`rec_status`) REFERENCES `jbc_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_page_ibfk_4` FOREIGN KEY (`rec_user`) REFERENCES `jbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3;

-- jbcdb.jbc_page: ~58 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `jbc_page` DISABLE KEYS */;
INSERT INTO `jbc_page` (`id`, `page_name`, `adr_path`, `page_data`, `page_type`, `rec_status`, `rec_user`, `rec_date`) VALUES
	(1, 'Yonetim-Sidebar', 7, '	  <nav class="navbar bg-outline-dark col-md-1 col-xl-2">\n	   <div class="container-fluid ">\n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/admin/yonetim.jsp">\n			  <i class="far fa-user"></i><span>&nbsp;Yönetim &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/admin/grup.jsp">\n			  <i class="fas fa-users"></i><span>&nbsp;Grup &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/user/mesaj.jsp">\n			  <i class="far fa-message"></i><span>&nbsp;Mesaj &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/user/mesaj-map.jsp">\n			  <i class="fa-regular fa-paper-plane"></i><span>&nbsp;Mesaj Dağıtım &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/user/mesaj-bak.jsp">\n			  <i class="far fa-eye"></i><span>&nbsp;Mesaj Bak &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/user/sifre.jsp">\n			  <i class="fas fa-key"></i><span>&nbsp;Şifre &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/start/giris.jsp">\n			  <i class="fas fa-arrow-right-from-bracket"></i><span>&nbsp;Çıkış &nbsp;</span></a></li>\n		 </ul>\n	   </div>\n	  </nav>\n', 3, 1, 1, '2025-04-10 18:36:00'),
	(2, 'Sayfalar-Sidebar', 7, '	  <nav class="navbar bg-outline-dark col-md-1 col-xl-2">\n		<div class="container-fluid "> \n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/page/sayfa.jsp">\n			  <i class="far fa-file-lines"></i><span>&nbsp;Sayfa &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/page/tema.jsp">\n			  <i class="fa-brands fa-themeisle"></i><span>&nbsp;Tema &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/page/sayfa-link.jsp">\n			  <i class="fas fa-circle-nodes"></i><span>&nbsp;Sayfa Link &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/page/sayfa-map.jsp">\n			  <i class="far fa-map"></i><span>&nbsp;Sayfa Map &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/code/kod.jsp">\n			  <i class="fas fa-code"></i><span>&nbsp;Kod &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/code/kod-map.jsp">\n			  <i class="far fa-map"></i><span>&nbsp;Kod Map &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/menu/menu-tr.jsp">\n			  <i class="fas fa-bars"></i><span>&nbsp;Menü &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/file/dosya.jsp">\n			  <i class="far fa-file"></i><span>&nbsp;Dosya &nbsp;</span></a></li>\n		 </ul>\n		</div>\n	  </nav>\n\n', 3, 1, 1, '2025-04-20 18:20:00'),
	(3, 'Gözetim-Sidebar', 7, '	  <nav class="navbar bg-outline-dark col-md-1 col-xl-2">\n		<div class="container-fluid "> \n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/user/kullanici.jsp">\n			  <i class="far fa-user"></i><span>&nbsp;Kullanıcı &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/user/mesaj.jsp">\n			  <i class="far fa-message"></i><span>&nbsp;Mesaj &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/user/mesaj-map.jsp">\n			  <i class="fa-regular fa-paper-plane"></i><span>&nbsp;Mesaj Dağıtım &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/user/mesaj-bak.jsp">\n			  <i class="fa-regular fa-eye"></i><span>&nbsp;Mesaj Bak &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/user/sifre.jsp">\n			  <i class="fas fa-key"></i><span>&nbsp;Şifre &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/start/giris.jsp">Çıkış &nbsp;</span></a></li>\n		 </ul>\n		</div> \n	  </nav>\n', 3, 1, 1, '2025-04-10 18:37:00'),
	(4, 'Kodlar-Sidebar', 7, '	  <nav class="navbar bg-outline-dark col-md-1 col-xl-2">\n		<div class="container-fluid "> \n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/code/kod.jsp">\n			  <i class="fas fa-code"></i><span>&nbsp;Kod &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/code/kod-map.jsp">\n			  <i class="far fa-map"></i><span>&nbsp;Kod Map &nbsp;</span></a></li>\n		 </ul>\n		</div> \n	  </nav>\n\n', 3, 1, 1, '2025-04-10 18:37:00'),
	(5, 'Referans-Sidebar', 7, '	  <nav class="navbar bg-outline-dark col-md-1 col-xl-2">\n		<div class="container-fluid "> \n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/reference/kod-tip.jsp">\n			  <i class="fas fa-code"></i><span>&nbsp;Kod Tipi &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/reference/dosya-tip.jsp">\n			  <i class="far fa-file"></i><span>&nbsp;Dosya Tipi &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/reference/mesaj-tip.jsp">\n			  <i class="far fa-message"></i><span>&nbsp;Mesaj Tipi &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/reference/pozisyon.jsp">\n			  <i class="fas fa-up-down-left-right"></i><span>&nbsp;Pozisyon &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/reference/sayfa-tip.jsp">\n			  <i class="far fa-file-lines"></i><span>&nbsp;Sayfa Tipi &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/reference/yol.jsp">\n			  <i class="far fa-folder"></i><span>&nbsp;Yol &nbsp;</span></a></li>\n		 </ul>\n		</div>\n	  </nav>\n', 3, 1, 1, '2025-04-10 18:38:00'),
	(6, 'Normal-Sidebar-TR', 7, '	  <nav class="navbar bg-outline-darkt col-md-1 col-xl-2">\n		<div class="container-fluid "> \n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/user/mesaj-bak.jsp">\n			  <i class="fa-regular fa-eye"></i><span>&nbsp;Mesaj Bak &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/user/sifre.jsp">\n			  <i class="fas fa-key"></i><span>&nbsp;Şifre &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/start/giris.jsp">\n			  <i class="fas fa-arrow-right-from-bracket"></i><span>&nbsp;Çıkış &nbsp;</span></a></li>\n		 </ul>\n		</div> \n	  </nav>\n', 3, 1, 1, '2025-04-10 18:38:00'),
	(7, 'Admin-Sidebar', 7, '	  <nav class="navbar bg-outline-dark col-md-1 col-xl-2">\n		<div class="container-fluid "> \n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/admin/admin.jsp">\n			  <i class="far fa-user"></i><span>&nbsp;Administration &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/admin/group.jsp">\n			  <i class="fas fa-users"></i><span>&nbsp;Group &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/user/message.jsp">\n			  <i class="far fa-message"></i><span>&nbsp;Message Record &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/user/message-map.jsp">\n			  <i class="fa-regular fa-paper-plane"></i><span>&nbsp;Message Map &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/user/message-rew.jsp">\n			  <i class="far fa-eye"></i><span>&nbsp;Message Review &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/user/password.jsp">\n			  <i class="fas fa-key"></i><span>&nbsp;Password &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/start/login.jsp">\n			  <i class="fas fa-arrow-right-from-bracket"></i><span>&nbsp;Login &nbsp;</span></a></li>\n		 </ul>\n		</div> \n	  </nav>\n', 3, 1, 1, '2025-04-10 18:38:00'),
	(8, 'Dosyalar-Sidebar', 7, '	  <nav class="navbar bg-outline-dark col-md-1 col-xl-2">\n		<div class="container-fluid "> \n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/admin/yonetim.jsp">Yönetim &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/admin/grup.jsp">Grup &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/user/mesaj.jsp">Mesaj &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/user/sifre.jsp">Şifre &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/start/giris.jsp">Çıkış &nbsp;</span></a></li>\n		 </ul>\n		</div> \n	  </nav>\n\n', 3, 1, 1, '2025-04-10 18:38:00'),
	(9, 'Loglar-Sidebar', 7, '	  <nav class="navbar bg-outline-dark col-md-1 col-xl-2">\n		<div class="container-fluid "> \n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/log/log-formu.jsp">\n			  <i class="fa-brands fa-wpforms"></i><span>&nbsp;Log Formu &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/log/log-tablo.jsp">\n			  <i class="fa-solid fa-table"></i><span>&nbsp;Log Tablo &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/log/log-tip.jsp">\n			  <i class="fa-solid fa-list"></i><span>&nbsp;Log Tipi &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/log/log-tr.jsp">\n			  <i class="fa-regular fa-eye"></i><span>&nbsp;Log İzle &nbsp;</span></a></li>\n		 </ul>\n		</div> \n	  </nav>\n\n', 3, 1, 1, '2025-04-10 18:38:00'),
	(10, 'Codes-Sidebar', 7, '	  <nav class="navbar bg-outline-dark col-md-1 col-xl-2">\n		<div class="container-fluid "> \n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/code/code.jsp">\n			  <i class="fas fa-code"></i><span>&nbsp;Code &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/code/code-map.jsp">\n			  <i class="far fa-map"></i><span>&nbsp;Code Map &nbsp;</span></a></li>\n		 </ul>\n		</div> \n	  </nav>\n\n', 3, 1, 1, '2025-04-10 18:39:00'),
	(11, 'Files-Sidebar', 7, '	  <nav class="navbar bg-outline-dark col-md-1 col-xl-2">\n		<div class="container-fluid "> \n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/admin/yonetim.jsp">Yönetim &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/admin/grup.jsp">Grup &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/user/mesaj.jsp">Mesaj &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/user/sifre.jsp">Şifre &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/start/giris.jsp">Çıkış &nbsp;</span></a></li>\n		 </ul>\n		</div> \n	  </nav>\n\n', 3, 1, 1, '2025-04-10 18:39:00'),
	(12, 'Logs-Sidebar', 7, '	  <nav class="navbar bg-outline-dark col-md-1 col-xl-2">\n		<div class="container-fluid "> \n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/log/log-form.jsp\'>\n			  <i class="fa-brands fa-wpforms"></i><span>&nbsp;Log Form &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/log/log-table.jsp\'>\n			  <i class="fa-solid fa-table"></i><span>&nbsp;Log Table &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/log/log-type.jsp\'>\n			  <i class="fa-solid fa-list"></i><span>&nbsp;Log Type &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/log/log.jsp\'>\n			  <i class="fa-regular fa-eye"></i><span>&nbsp;View Log &nbsp;</span></a></li>\n		 </ul>\n		</div> \n	  </nav>\n\n', 3, 1, 1, '2025-04-10 18:39:00'),
	(13, 'Normal-Sidebar', 7, '	  <nav class="navbar bg-outline-dark col-md-1 col-xl-2">\n		<div class="container-fluid "> \n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/user/message-rew.jsp">\n			  <i class="fa-regular fa-eye"></i></i><span>&nbsp;Message Review &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/user/password.jsp">\n			  <i class="fas fa-key"></i><span>&nbsp;Password &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/start/login.jsp">\n			  <i class="fas fa-arrow-right-from-bracket"></i><span>&nbsp;Login &nbsp;</span></a></li>\n		 </ul>\n		</div> \n	  </nav>\n', 3, 1, 1, '2025-04-10 18:40:00'),
	(14, 'Pages-Sidebar', 7, '	  <nav class="navbar bg-outline-dark col-md-1 col-xl-2">\n		<div class="container-fluid "> \n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/page/page.jsp">\n			  <i class="far fa-file-lines"></i><span>&nbsp;Page &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/page/theme.jsp">\n			  <i class="fa-brands fa-themeisle"></i><span>&nbsp;Theme &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/page/page-link.jsp">\n			  <i class="fas fa-circle-nodes"></i><span>&nbsp;Page Link &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/page/page-map.jsp">\n			  <i class="far fa-map"></i><span>&nbsp;Page Map &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/code/code.jsp">\n			  <i class="fas fa-code"></i><span>&nbsp;Code &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/code/code-map.jsp">\n			  <i class="far fa-map"></i><span>&nbsp;Code Map &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/menu/menu.jsp">\n			  <i class="fas fa-bars"></i><span>&nbsp;Menu &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/file/file.jsp">\n			  <i class="far fa-file"></i><span>&nbsp;File &nbsp;</span></a></li>\n		 </ul>\n		<div class="container-fluid "> \n	  </nav>\n\n', 3, 1, 1, '2025-04-20 18:21:00'),
	(15, 'Reference-Sidebar', 7, '	  <nav class="navbar bg-outline-dark col-md-1 col-xl-2">\n		<div class="container-fluid "> \n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/reference/code-type.jsp">\n			  <i class="fas fa-code"></i><span>&nbsp;Code Type &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/reference/file-type.jsp">\n			  <i class="far fa-file"></i><span>&nbsp;File Type &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/reference/message-type.jsp">\n			  <i class="far fa-message"></i><span>&nbsp;Message Type &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/reference/position.jsp">\n			  <i class="fas fa-up-down-left-right"></i><span>&nbsp;Position &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/reference/page-type.jsp">\n			  <i class="far fa-file-lines"></i><span>&nbsp;Page Type &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/reference/path.jsp">\n			  <i class="far fa-folder"></i><span>&nbsp;Path &nbsp;</span></a></li>\n		 </ul>\n		</div>\n	  </nav>\n', 3, 1, 1, '2025-04-10 18:40:00'),
	(16, 'Supervisor-Sidebar', 7, '	  <nav class="navbar bg-outline-dark col-md-1 col-xl-2">\n		<div class="container-fluid ">\n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/user/user.jsp">\n			  <i class="far fa-user"></i><span>&nbsp;User &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/user/message.jsp">\n			  <i class="far fa-message"></i><span>&nbsp;Message Record &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/user/message-map.jsp">\n			  <i class="fa-regular fa-paper-plane"></i><span>&nbsp;Message Map &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/user/message-rew.jsp">\n			  <i class="fa-regular fa-eye"></i><span>&nbsp;Message Review &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/user/password.jsp">\n			  <i class="fas fa-key"></i><span>&nbsp;Password &nbsp;</span></a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/JBCA_F/start/login.jsp">\n			  <i class="fas fa-arrow-right-from-bracket"></i><span>&nbsp;Login &nbsp;</span></a></li>\n		 </ul>\n		</div>\n	  </nav>\n', 3, 1, 1, '2025-04-10 18:41:00'),
	(17, 'User-Sidebar', 7, '<!DOCTYPE html>\n<html lang="tr">\n<head>\n  <title>JBCA</title>\n  <meta charset="utf-8">\n  <meta name="viewport" content="width=device-width, initial-scale=1">\n  <link rel="stylesheet" href="css/bootstrap.min.css">\n  <script src="js/jquery.min.js"></script>\n  <script src="js/bootstrap.min.js"></script>\n</head>\n\n  <body>\n\n    <div class="container-fluid">\n      <div class="row">\n        <div class="col-sm-3 col-md-2 sidebar">\n          <ul class="nav nav-sidebar">\n            <li ><a href="#"> </a></li>\n			<li><a href="jsp/user/Message.jsp">Message</a></li>\n			<li><a href="jsp/user/Password.jsp">Password</a></li>\n			<li><a href="jsp/Login.jsp">Login</a></li>\n          </ul>\n       </div>\n       <div class="col-sm-9 col-md-10 main">\n          <h2 class="sub-header">Section title</h2>\n          <div class="table-responsive">\n            <table class="table table-striped">\n              <thead>\n                <tr>\n                  <th>#</th>\n                  <th>Header</th>\n                  <th>Header</th>\n                  <th>Header</th>\n                  <th>Header</th>\n                </tr>\n              </thead>\n              <tbody>\n                <tr>\n                  <td>1,001</td>\n                  <td>Lorem</td>\n                  <td>ipsum</td>\n                  <td>dolor</td>\n                  <td>sit</td>\n                </tr>\n                <tr>\n                  <td>1,002</td>\n                  <td>amet</td>\n                  <td>consectetur</td>\n                  <td>adipiscing</td>\n                  <td>elit</td>\n                </tr>\n                <tr>\n                  <td>1,003</td>\n                  <td>Integer</td>\n                  <td>nec</td>\n                  <td>odio</td>\n                  <td>Praesent</td>\n                </tr>\n               </tbody>\n            </table>\n          </div>\n        </div>\n      </div>\n    </div>\n</body></html>', 3, 1, 1, '2022-02-14 13:35:00');
/*!40000 ALTER TABLE `jbc_page` ENABLE KEYS */;

-- tablo yapısı dökülüyor jbcdb.jbc_page_link
CREATE TABLE IF NOT EXISTS `jbc_page_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  `adr_path` int(11) NOT NULL,
  `linked_page` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `theme` int(11) NOT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_link_unique` (`link_name`),
  KEY `fk_page_link_user` (`rec_user`),
  KEY `fk_page_link_page` (`linked_page`),
  KEY `jbc_page_link_ibfk_4` (`position`),
  KEY `adr_path_index` (`adr_path`),
  KEY `fk_page_link_theme` (`theme`),
  CONSTRAINT `jbc_page_link_ibfk_2` FOREIGN KEY (`adr_path`) REFERENCES `jbc_path` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;

-- jbcdb.jbc_page_link: ~32 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `jbc_page_link` DISABLE KEYS */;
INSERT INTO `jbc_page_link` (`id`, `link_name`, `adr_path`, `linked_page`, `position`, `theme`, `rec_user`, `rec_date`) VALUES
	(1, 'about', 8, 27, 1, 2, 2, '2022-02-14 18:19:00'),
	(2, 'blog-tr', 9, 36, 1, 1, 2, '2022-02-14 18:20:00'),
	(3, 'blog', 9, 35, 1, 2, 2, '2022-02-14 18:21:00'),
	(4, 'consultancy', 12, 47, 1, 2, 2, '2022-02-14 18:21:00'),
	(5, 'danismanlik', 12, 48, 1, 1, 2, '2022-02-14 18:23:00'),
	(6, 'database', 12, 49, 1, 2, 2, '2022-02-14 18:23:00'),
	(7, 'entegrasyon', 12, 50, 1, 1, 2, '2022-02-14 18:24:00');
/*!40000 ALTER TABLE `jbc_page_link` ENABLE KEYS */;

-- tablo yapısı dökülüyor jbcdb.jbc_page_map
CREATE TABLE IF NOT EXISTS `jbc_page_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mapped_page` int(11) NOT NULL,
  `theme` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_map_unique` (`mapped_page`,`theme`),
  KEY `jbc_page_map_ibfk_2` (`position`),
  KEY `jbc_page_map_ibfk_5` (`rec_user`),
  KEY `jbc_page_map_ibfk_1` (`theme`),
  CONSTRAINT `jbc_page_map_ibfk_1` FOREIGN KEY (`theme`) REFERENCES `jbc_theme` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_page_map_ibfk_2` FOREIGN KEY (`position`) REFERENCES `jbc_position` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_page_map_ibfk_3` FOREIGN KEY (`mapped_page`) REFERENCES `jbc_page` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_page_map_ibfk_5` FOREIGN KEY (`rec_user`) REFERENCES `jbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- jbcdb.jbc_page_map: ~6 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `jbc_page_map` DISABLE KEYS */;
INSERT INTO `jbc_page_map` (`id`, `mapped_page`, `theme`, `position`, `rec_user`, `rec_date`) VALUES
	(1, 22, 1, 4, 2, '2022-02-15 13:14:00'),
	(2, 20, 1, 5, 2, '2022-02-15 13:14:00'),
	(3, 26, 1, 3, 2, '2022-02-15 13:15:00'),
	(4, 21, 2, 4, 2, '2022-02-15 13:16:00'),
	(5, 19, 2, 5, 2, '2022-02-15 13:16:00'),
	(6, 25, 2, 3, 2, '2022-02-15 13:17:00');
/*!40000 ALTER TABLE `jbc_page_map` ENABLE KEYS */;

-- tablo yapısı dökülüyor jbcdb.jbc_page_type
CREATE TABLE IF NOT EXISTS `jbc_page_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_type_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jbc_page_type_UNIQUE` (`page_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- jbcdb.jbc_page_type: ~4 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `jbc_page_type` DISABLE KEYS */;
INSERT INTO `jbc_page_type` (`id`, `page_type_name`) VALUES
	(2, 'info'),
	(1, 'main'),
	(4, 'menu'),
	(3, 'normal');
/*!40000 ALTER TABLE `jbc_page_type` ENABLE KEYS */;

-- tablo yapısı dökülüyor jbcdb.jbc_parameters
CREATE TABLE IF NOT EXISTS `jbc_parameters` (
  `id` int(11) NOT NULL,
  `param_key` varchar(150) NOT NULL DEFAULT '',
  `param_value` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- jbcdb.jbc_parameters: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `jbc_parameters` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbc_parameters` ENABLE KEYS */;

-- tablo yapısı dökülüyor jbcdb.jbc_path
CREATE TABLE IF NOT EXISTS `jbc_path` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path_name` varchar(300) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path_unique` (`path_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

-- jbcdb.jbc_path: ~13 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `jbc_path` DISABLE KEYS */;
INSERT INTO `jbc_path` (`id`, `path_name`) VALUES
	(3, '/JBCA_F/admin/'),
	(5, '/JBCA_F/code/'),
	(2, '/JBCA_F/file/'),
	(1, '/JBCA_F/menu/'),
	(7, '/JBCA_F/page/'),
	(6, '/JBCA_F/reference/'),
	(4, '/JBCA_F/user/'),
	(8, '/website/about/'),
	(9, '/website/blog/'),
	(10, '/website/contact/'),
	(11, '/website/menu/'),
	(12, '/website/services/'),
	(13, '/website/theme/');
/*!40000 ALTER TABLE `jbc_path` ENABLE KEYS */;

-- tablo yapısı dökülüyor jbcdb.jbc_position
CREATE TABLE IF NOT EXISTS `jbc_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pos_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `position_unique` (`pos_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- jbcdb.jbc_position: ~5 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `jbc_position` DISABLE KEYS */;
INSERT INTO `jbc_position` (`id`, `pos_name`) VALUES
	(5, 'buttom'),
	(1, 'center'),
	(2, 'left'),
	(3, 'right'),
	(4, 'top');
/*!40000 ALTER TABLE `jbc_position` ENABLE KEYS */;

-- tablo yapısı dökülüyor jbcdb.jbc_status
CREATE TABLE IF NOT EXISTS `jbc_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status_unique` (`status_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- jbcdb.jbc_status: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `jbc_status` DISABLE KEYS */;
INSERT INTO `jbc_status` (`id`, `status_name`) VALUES
	(1, 'Active'),
	(3, 'Passive');
/*!40000 ALTER TABLE `jbc_status` ENABLE KEYS */;

-- tablo yapısı dökülüyor jbcdb.jbc_theme
CREATE TABLE IF NOT EXISTS `jbc_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  `adr_path` int(11) NOT NULL,
  `theme_menu` int(11) NOT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `theme_unique` (`theme_name`),
  KEY `fk_theme_user` (`rec_user`),
  KEY `fk_theme_path` (`adr_path`),
  KEY `jbc_theme_ibfk_3` (`theme_menu`),
  CONSTRAINT `jbc_theme_ibfk_1` FOREIGN KEY (`rec_user`) REFERENCES `jbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_theme_ibfk_2` FOREIGN KEY (`adr_path`) REFERENCES `jbc_path` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_theme_ibfk_3` FOREIGN KEY (`theme_menu`) REFERENCES `jbc_menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- jbcdb.jbc_theme: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `jbc_theme` DISABLE KEYS */;
INSERT INTO `jbc_theme` (`id`, `theme_name`, `adr_path`, `theme_menu`, `rec_user`, `rec_date`) VALUES
	(1, 'Websitesi-Tema1', 13, 7, 2, '2022-02-14 18:16:00'),
	(2, 'Website-Theme1', 13, 8, 1, '2023-07-17 11:30:00');
/*!40000 ALTER TABLE `jbc_theme` ENABLE KEYS */;

-- tablo yapısı dökülüyor jbcdb.jbc_user
CREATE TABLE IF NOT EXISTS `jbc_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  `user_code` varchar(30) CHARACTER SET utf8mb4 NOT NULL,
  `user_psw` varchar(300) CHARACTER SET utf8mb4 DEFAULT NULL,
  `user_group` int(11) NOT NULL DEFAULT 2,
  `e_mail` varchar(150) CHARACTER SET utf8mb4 DEFAULT NULL,
  `rec_status` int(11) NOT NULL DEFAULT 1,
  `page_size` int(11) NOT NULL DEFAULT 10,
  `rec_user` int(11) DEFAULT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`user_code`),
  KEY `jbc_user_ibfk_2` (`rec_status`),
  KEY `jbc_user_ibfk_1` (`user_group`),
  CONSTRAINT `jbc_user_ibfk_1` FOREIGN KEY (`user_group`) REFERENCES `jbc_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_user_ibfk_2` FOREIGN KEY (`rec_status`) REFERENCES `jbc_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

-- jbcdb.jbc_user: ~6 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `jbc_user` DISABLE KEYS */;
INSERT INTO `jbc_user` (`id`, `user_name`, `user_code`, `user_psw`, `user_group`, `e_mail`, `rec_status`, `page_size`, `rec_user`, `rec_date`) VALUES
	(1, 'Mehmet Hayati KINAŞ', 'hayati', 'o3XE8X22zM0hLvmz67bHz1KYQewdkUzjYgmNbYCmIp8=', 1, 'info@hayatikinas.com', 1, 1000, 1, '2021-11-11 18:29:00'),
	(2, 'Test 01', 'test01', 'o3XE8X22zM0hLvmz67bHz1KYQewdkUzjYgmNbYCmIp8=', 1, 'info@hayatikinas.com', 1, 100, 1, '2025-04-10 19:30:00');
/*!40000 ALTER TABLE `jbc_user` ENABLE KEYS */;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_code
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_jbc_code` (
	`id` INT(11) NOT NULL,
	`code_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`adr_path` VARCHAR(300) NOT NULL COLLATE 'utf8mb4_general_ci',
	`code_type` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_user` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date1` DATETIME NOT NULL,
	`rec_date2` DATETIME NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_code_map
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_jbc_code_map` (
	`id` INT(11) NOT NULL,
	`mapped_code` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`page_link` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_user` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date1` DATETIME NOT NULL,
	`rec_date2` DATETIME NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_contact
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_jbc_contact` (
	`id` INT(11) NOT NULL,
	`contact_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`e_mail` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`web_site` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`message_data` VARCHAR(10000) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_user` VARCHAR(30) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_exc_rate
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_jbc_exc_rate` (
	`id` INT(11) NOT NULL,
	`cur_code` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`fx_buy` DECIMAL(10,4) NOT NULL,
	`fx_sel` DECIMAL(10,4) NOT NULL,
	`bn_buy` DECIMAL(10,4) NOT NULL,
	`bn_sel` DECIMAL(10,4) NOT NULL,
	`unit` INT(11) NOT NULL,
	`rec_user` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_file
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_jbc_file` (
	`id` INT(11) NOT NULL,
	`file_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`adr_path` VARCHAR(300) NOT NULL COLLATE 'utf8mb4_general_ci',
	`file_type` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`file_size` INT(20) NULL,
	`mime_type` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`rec_user` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date1` DATETIME NOT NULL,
	`rec_date2` DATETIME NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_group_s
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_jbc_group_s` (
	`id` INT(11) NOT NULL,
	`group_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_image
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_jbc_image` (
	`id` INT(11) NOT NULL,
	`image_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`adr_path` VARCHAR(300) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_user` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date1` DATETIME NOT NULL,
	`rec_date2` DATETIME NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_log
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_jbc_log` (
	`id` INT(11) NOT NULL,
	`rec_id` INT(11) NOT NULL,
	`form_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`type_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`table_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`log_data` TEXT NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_user` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date1` DATETIME NOT NULL,
	`rec_date2` DATETIME NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_menu
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_jbc_menu` (
	`id` INT(11) NOT NULL,
	`menu_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`adr_path` VARCHAR(300) NOT NULL COLLATE 'utf8mb4_general_ci',
	`menu_data` VARCHAR(16000) NULL COLLATE 'utf8mb4_general_ci',
	`rec_user` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date1` DATETIME NOT NULL,
	`rec_date2` DATETIME NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_message
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_jbc_message` (
	`id` INT(11) NOT NULL,
	`msg_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`message_type` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_status` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`msg_data` VARCHAR(16000) NULL COLLATE 'utf8mb4_general_ci',
	`rec_user` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date1` DATETIME NOT NULL,
	`rec_date2` DATETIME NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_message_map
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_jbc_message_map` (
	`id` INT(11) NOT NULL,
	`mapped_msg` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`user_group` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_user` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date1` DATETIME NOT NULL,
	`rec_date2` DATETIME NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_page
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_jbc_page` (
	`id` INT(11) NOT NULL,
	`page_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`adr_path` VARCHAR(300) NOT NULL COLLATE 'utf8mb4_general_ci',
	`page_type` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_status` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_user` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date1` DATETIME NOT NULL,
	`rec_date2` DATETIME NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_page_link
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_jbc_page_link` (
	`id` INT(11) NOT NULL,
	`link_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`adr_path` VARCHAR(300) NOT NULL COLLATE 'utf8mb4_general_ci',
	`linked_page` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`position` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`theme` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_user` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date1` DATETIME NOT NULL,
	`rec_date2` DATETIME NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_page_map
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_jbc_page_map` (
	`id` INT(11) NOT NULL,
	`mapped_page` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`theme` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`position` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_user` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date1` DATETIME NOT NULL,
	`rec_date2` DATETIME NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_theme
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_jbc_theme` (
	`id` INT(11) NOT NULL,
	`theme_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`adr_path` VARCHAR(300) NOT NULL COLLATE 'utf8mb4_general_ci',
	`theme_menu` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_user` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date1` DATETIME NOT NULL,
	`rec_date2` DATETIME NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_user
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_jbc_user` (
	`id` INT(11) NOT NULL,
	`user_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`user_code` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`user_psw` VARCHAR(300) NULL COLLATE 'utf8mb4_general_ci',
	`user_group` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`e_mail` VARCHAR(150) NULL COLLATE 'utf8mb4_general_ci',
	`rec_status` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`page_size` INT(11) NOT NULL,
	`rec_user` VARCHAR(30) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date1` DATETIME NOT NULL,
	`rec_date2` DATETIME NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_user_s
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_jbc_user_s` (
	`id` INT(11) NOT NULL,
	`user_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`user_code` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`user_psw` VARCHAR(300) NULL COLLATE 'utf8mb4_general_ci',
	`user_group` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`e_mail` VARCHAR(150) NULL COLLATE 'utf8mb4_general_ci',
	`rec_status` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`page_size` INT(11) NOT NULL,
	`rec_user` VARCHAR(30) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date1` DATETIME NOT NULL,
	`rec_date2` DATETIME NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_view_message
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_jbc_view_message` (
	`id` INT(11) NOT NULL,
	`msg_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`message_type` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_status` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`msg_data` VARCHAR(16000) NULL COLLATE 'utf8mb4_general_ci',
	`user_group` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_user` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date1` DATETIME NOT NULL,
	`rec_date2` DATETIME NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_code
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_jbc_code`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_jbc_code` AS select `c`.`id` AS `id`,`c`.`code_name` AS `code_name`,`p`.`path_name` AS `adr_path`,`t`.`code_type_name` AS `code_type`,`u`.`user_code` AS `rec_user`,date_format(`c`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`c`.`rec_date` AS `rec_date1`,`c`.`rec_date` AS `rec_date2` from (((`jbc_code` `c` join `jbc_path` `p`) join `jbc_code_type` `t`) join `jbc_user` `u`) where `c`.`adr_path` = `p`.`id` and `c`.`code_type` = `t`.`id` and `c`.`rec_user` = `u`.`id` order by `c`.`id`;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_code_map
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_jbc_code_map`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_jbc_code_map` AS select `cm`.`id` AS `id`,`c`.`code_name` AS `mapped_code`,`pl`.`link_name` AS `page_link`,`u`.`user_code` AS `rec_user`,date_format(`cm`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`cm`.`rec_date` AS `rec_date1`,`cm`.`rec_date` AS `rec_date2` from ((((`jbc_code_map` `cm` join `jbc_code` `c`) join `jbc_page_link` `pl`) join `jbc_user` `u`) join `jbc_path` `pt`) where `cm`.`mapped_code` = `c`.`id` and `cm`.`page_link` = `pl`.`id` and `cm`.`rec_user` = `u`.`id` and `pl`.`adr_path` = `pt`.`id` order by `cm`.`id`;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_contact
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_jbc_contact`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_jbc_contact` AS select `c`.`id` AS `id`,`c`.`contact_name` AS `contact_name`,`c`.`e_mail` AS `e_mail`,`c`.`web_site` AS `web_site`,`c`.`message_data` AS `message_data`,`u`.`user_code` AS `rec_user`,date_format(`c`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date` from (`jbc_contact` `c` left join `jbc_user` `u` on(`c`.`rec_user` = `u`.`id`)) order by `c`.`id`;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_exc_rate
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_jbc_exc_rate`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_jbc_exc_rate` AS select `e`.`id` AS `id`,`c`.`currency_code` AS `cur_code`,`e`.`fx_buy` AS `fx_buy`,`e`.`fx_sel` AS `fx_sel`,`e`.`bn_buy` AS `bn_buy`,`e`.`bn_sel` AS `bn_sel`,`e`.`unit` AS `unit`,`u`.`user_code` AS `rec_user`,date_format(`e`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date` from ((`jbc_exc_rate` `e` join `jbc_currency` `c`) join `jbc_user` `u`) where `e`.`cur_code` = `c`.`id` and `e`.`rec_user` = `u`.`id` order by `e`.`id`;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_file
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_jbc_file`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_jbc_file` AS select `f`.`id` AS `id`,`f`.`file_name` AS `file_name`,`p`.`path_name` AS `adr_path`,`ft`.`file_type_name` AS `file_type`,`f`.`file_size` AS `file_size`,`f`.`mime_type` AS `mime_type`,`u`.`user_code` AS `rec_user`,date_format(`f`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`f`.`rec_date` AS `rec_date1`,`f`.`rec_date` AS `rec_date2` from (((`jbc_file` `f` join `jbc_path` `p`) join `jbc_file_type` `ft`) join `jbc_user` `u`) where `f`.`adr_path` = `p`.`id` and `f`.`file_type` = `ft`.`id` and `f`.`rec_user` = `u`.`id` order by `f`.`id`;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_group_s
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_jbc_group_s`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_jbc_group_s` AS select `g`.`id` AS `id`,`g`.`group_name` AS `group_name` from `jbc_group` `g` where `g`.`group_name` <> 'Admin';

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_image
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_jbc_image`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_jbc_image` AS select `m`.`id` AS `id`,`m`.`image_name` AS `image_name`,`p`.`path_name` AS `adr_path`,`u`.`user_code` AS `rec_user`,date_format(`m`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`m`.`rec_date` AS `rec_date1`,`m`.`rec_date` AS `rec_date2` from ((`jbc_image` `m` join `jbc_path` `p`) join `jbc_user` `u`) where `m`.`adr_path` = `p`.`id` and `m`.`rec_user` = `u`.`id`;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_log
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_jbc_log`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_jbc_log` AS select `l`.`id` AS `id`,`l`.`rec_id` AS `rec_id`,`f`.`log_form_name` AS `form_name`,`t`.`log_type_name` AS `type_name`,`b`.`log_table_name` AS `table_name`,`l`.`log_data` AS `log_data`,`u`.`user_code` AS `rec_user`,date_format(`l`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`l`.`rec_date` AS `rec_date1`,`l`.`rec_date` AS `rec_date2` from ((((`jbc_log` `l` join `jbc_log_table` `b`) join `jbc_log_type` `t`) join `jbc_log_form` `f`) join `jbc_user` `u`) where `l`.`form_name` = `f`.`id` and `l`.`type_name` = `t`.`id` and `l`.`table_name` = `b`.`id` and `l`.`rec_user` = `u`.`id` order by `l`.`id`;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_menu
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_jbc_menu`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_jbc_menu` AS select `m`.`id` AS `id`,`m`.`menu_name` AS `menu_name`,`p`.`path_name` AS `adr_path`,`m`.`menu_data` AS `menu_data`,`u`.`user_code` AS `rec_user`,date_format(`m`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`m`.`rec_date` AS `rec_date1`,`m`.`rec_date` AS `rec_date2` from ((`jbc_menu` `m` join `jbc_path` `p`) join `jbc_user` `u`) where `m`.`adr_path` = `p`.`id` and `m`.`rec_user` = `u`.`id`;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_message
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_jbc_message`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_jbc_message` AS select `m`.`id` AS `id`,`m`.`msg_name` AS `msg_name`,`mt`.`msg_type_name` AS `message_type`,`s`.`status_name` AS `rec_status`,`m`.`msg_data` AS `msg_data`,`u`.`user_code` AS `rec_user`,date_format(`m`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`m`.`rec_date` AS `rec_date1`,`m`.`rec_date` AS `rec_date2` from (((`jbc_message` `m` join `jbc_status` `s`) join `jbc_user` `u`) join `jbc_message_type` `mt`) where `m`.`rec_status` = `s`.`id` and `m`.`rec_user` = `u`.`id` and `m`.`message_type` = `mt`.`id`;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_message_map
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_jbc_message_map`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_jbc_message_map` AS select `mm`.`id` AS `id`,`m`.`msg_name` AS `mapped_msg`,`g`.`group_name` AS `user_group`,`u`.`user_code` AS `rec_user`,date_format(`mm`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`mm`.`rec_date` AS `rec_date1`,`mm`.`rec_date` AS `rec_date2` from (((`jbc_message_map` `mm` join `jbc_message` `m`) join `jbc_group` `g`) join `jbc_user` `u`) where `mm`.`mapped_msg` = `m`.`id` and `mm`.`user_group` = `g`.`id` and `mm`.`rec_user` = `u`.`id`;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_page
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_jbc_page`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_jbc_page` AS select `p`.`id` AS `id`,`p`.`page_name` AS `page_name`,`pt`.`path_name` AS `adr_path`,`py`.`page_type_name` AS `page_type`,`s`.`status_name` AS `rec_status`,`u`.`user_code` AS `rec_user`,date_format(`p`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`p`.`rec_date` AS `rec_date1`,`p`.`rec_date` AS `rec_date2` from ((((`jbc_page` `p` join `jbc_path` `pt`) join `jbc_page_type` `py`) join `jbc_status` `s`) join `jbc_user` `u`) where `p`.`adr_path` = `pt`.`id` and `p`.`page_type` = `py`.`id` and `p`.`rec_status` = `s`.`id` and `p`.`rec_user` = `u`.`id`;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_page_link
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_jbc_page_link`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_jbc_page_link` AS select `pl`.`id` AS `id`,`pl`.`link_name` AS `link_name`,`pt`.`path_name` AS `adr_path`,`p`.`page_name` AS `linked_page`,`ps`.`pos_name` AS `position`,`t`.`theme_name` AS `theme`,`u`.`user_code` AS `rec_user`,date_format(`pl`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`pl`.`rec_date` AS `rec_date1`,`pl`.`rec_date` AS `rec_date2` from (((((`jbc_page_link` `pl` join `jbc_path` `pt`) join `jbc_page` `p`) join `jbc_position` `ps`) join `jbc_theme` `t`) join `jbc_user` `u`) where `pl`.`adr_path` = `pt`.`id` and `pl`.`linked_page` = `p`.`id` and `pl`.`position` = `ps`.`id` and `pl`.`theme` = `t`.`id` and `pl`.`rec_user` = `u`.`id`;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_page_map
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_jbc_page_map`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_jbc_page_map` AS select `pm`.`id` AS `id`,`p`.`page_name` AS `mapped_page`,`t`.`theme_name` AS `theme`,`ps`.`pos_name` AS `position`,`u`.`user_code` AS `rec_user`,date_format(`pm`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`pm`.`rec_date` AS `rec_date1`,`pm`.`rec_date` AS `rec_date2` from ((((`jbc_page_map` `pm` join `jbc_page` `p`) join `jbc_theme` `t`) join `jbc_position` `ps`) join `jbc_user` `u`) where `pm`.`mapped_page` = `p`.`id` and `pm`.`theme` = `t`.`id` and `pm`.`position` = `ps`.`id` and `pm`.`rec_user` = `u`.`id`;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_theme
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_jbc_theme`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_jbc_theme` AS select `t`.`id` AS `id`,`t`.`theme_name` AS `theme_name`,`pt`.`path_name` AS `adr_path`,`m`.`menu_name` AS `theme_menu`,`u`.`user_code` AS `rec_user`,date_format(`t`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`t`.`rec_date` AS `rec_date1`,`t`.`rec_date` AS `rec_date2` from (((`jbc_theme` `t` join `jbc_path` `pt`) join `jbc_menu` `m`) join `jbc_user` `u`) where `t`.`adr_path` = `pt`.`id` and `t`.`theme_menu` = `m`.`id` and `t`.`rec_user` = `u`.`id`;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_user
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_jbc_user`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_jbc_user` AS select `u`.`id` AS `id`,`u`.`user_name` AS `user_name`,`u`.`user_code` AS `user_code`,`u`.`user_psw` AS `user_psw`,`g`.`group_name` AS `user_group`,`u`.`e_mail` AS `e_mail`,`s`.`status_name` AS `rec_status`,`u`.`page_size` AS `page_size`,(select `us`.`user_code` from `jbc_user` `us` where `u`.`rec_user` = `us`.`id`) AS `rec_user`,date_format(`u`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`u`.`rec_date` AS `rec_date1`,`u`.`rec_date` AS `rec_date2` from ((`jbc_user` `u` join `jbc_group` `g`) join `jbc_status` `s`) where `u`.`user_group` = `g`.`id` and `u`.`rec_status` = `s`.`id`;

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_user_s
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_jbc_user_s`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_jbc_user_s` AS select `u`.`id` AS `id`,`u`.`user_name` AS `user_name`,`u`.`user_code` AS `user_code`,`u`.`user_psw` AS `user_psw`,`g`.`group_name` AS `user_group`,`u`.`e_mail` AS `e_mail`,`s`.`status_name` AS `rec_status`,`u`.`page_size` AS `page_size`,(select `us`.`user_code` from `jbc_user` `us` where `u`.`rec_user` = `us`.`id`) AS `rec_user`,date_format(`u`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`u`.`rec_date` AS `rec_date1`,`u`.`rec_date` AS `rec_date2` from ((`jbc_user` `u` join `jbc_group` `g`) join `jbc_status` `s`) where `u`.`user_group` = `g`.`id` and `u`.`rec_status` = `s`.`id` and `g`.`group_name` <> 'Admin';

-- görünüm yapısı dökülüyor jbcdb.vt_jbc_view_message
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_jbc_view_message`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_jbc_view_message` AS select `m`.`id` AS `id`,`m`.`msg_name` AS `msg_name`,`mt`.`msg_type_name` AS `message_type`,`s`.`status_name` AS `rec_status`,`m`.`msg_data` AS `msg_data`,`g`.`group_name` AS `user_group`,`u`.`user_code` AS `rec_user`,date_format(`m`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`m`.`rec_date` AS `rec_date1`,`m`.`rec_date` AS `rec_date2` from (((((`jbc_message` `m` join `jbc_status` `s`) join `jbc_user` `u`) join `jbc_message_type` `mt`) join `jbc_message_map` `mm`) join `jbc_group` `g`) where `m`.`rec_status` = `s`.`id` and `m`.`rec_user` = `u`.`id` and `m`.`message_type` = `mt`.`id` and `m`.`id` = `mm`.`mapped_msg` and `mm`.`user_group` = `g`.`id`;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
