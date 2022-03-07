CREATE TABLE `jbc_message_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_type_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `message_type_unique` (`msg_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jbc_log_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_form_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `log_form_unique` (`log_form_name`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jbc_log_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_table_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `log_table_unique` (`log_table_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jbc_log_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_type_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `log_type_unique` (`log_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jbc_code_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_type_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_type_unique` (`code_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jbc_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_name_UNIQUE` (`group_name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jbc_page_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_type_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_type_unique` (`page_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jbc_path` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path_name` varchar(300) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path_unique` (`path_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jbc_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pos_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `position_unique` (`pos_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jbc_file_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_type_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_type_unique` (`file_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jbc_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status_unique` (`status_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jbc_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  `user_code` varchar(30) CHARACTER SET utf8mb4 NOT NULL,
  `user_psw` varchar(300) CHARACTER SET utf8mb4 DEFAULT NULL,
  `user_group` int(11) NOT NULL DEFAULT '2',
  `e_mail` varchar(150) CHARACTER SET utf8mb4 DEFAULT NULL,
  `rec_status` int(11) NOT NULL DEFAULT '1',
  `page_size` int(11) NOT NULL DEFAULT '10',
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_unique` (`user_code`),
  KEY `jbc_user_ibfk_2` (`rec_status`),
  KEY `jbc_user_ibfk_1` (`user_group`),
  KEY `jbc_user_ibfk_3_idx` (`rec_user`),
  CONSTRAINT `jbc_user_ibfk_1` FOREIGN KEY (`user_group`) REFERENCES `jbc_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_user_ibfk_2` FOREIGN KEY (`rec_status`) REFERENCES `jbc_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_user_ibfk_3` FOREIGN KEY (`rec_user`) REFERENCES `jbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jbc_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  `adr_path` int(11) NOT NULL,
  `code_data` mediumtext CHARACTER SET utf8mb4,
  `code_type` int(11) NOT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_unique` (`code_name`,`adr_path`),
  KEY `jbc_code_ibfk_1` (`adr_path`),
  KEY `jbc_code_ibfk_2` (`rec_user`),
  KEY `jbc_code_ibfk_3` (`code_type`),
  CONSTRAINT `jbc_code_ibfk_1` FOREIGN KEY (`adr_path`) REFERENCES `jbc_path` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_code_ibfk_2` FOREIGN KEY (`rec_user`) REFERENCES `jbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_code_ibfk_3` FOREIGN KEY (`code_type`) REFERENCES `jbc_code_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='	';

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

CREATE TABLE `jbc_code_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mapped_code` int(11) NOT NULL,
  `page_link` int(11) NOT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_map_unique` (`mapped_code`,`page_link`),
  KEY `jbc_code_map_ibfk_2` (`page_link`),
  KEY `jbc_code_map_ibfk_3` (`rec_user`),
  CONSTRAINT `jbc_code_map_ibfk_1` FOREIGN KEY (`mapped_code`) REFERENCES `jbc_code` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_code_map_ibfk_2` FOREIGN KEY (`page_link`) REFERENCES `jbc_page` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_code_map_ibfk_3` FOREIGN KEY (`rec_user`) REFERENCES `jbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jbc_contact` (
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jbc_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  `adr_path` int(11) NOT NULL,
  `file_data` mediumblob,
  `file_type` int(11) NOT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  `mime_type` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_unique` (`file_name`,`adr_path`),
  KEY `jbc_file_ibfk_1` (`adr_path`),
  KEY `jbc_file_ibfk_2` (`file_type`),
  KEY `jbc_file_ibfk_3` (`rec_user`),
  CONSTRAINT `jbc_file_ibfk_1` FOREIGN KEY (`adr_path`) REFERENCES `jbc_path` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_file_ibfk_2` FOREIGN KEY (`file_type`) REFERENCES `jbc_file_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_file_ibfk_3` FOREIGN KEY (`rec_user`) REFERENCES `jbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jbc_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  `adr_path` int(11) NOT NULL,
  `image_data` mediumblob,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `image_unique` (`image_name`,`adr_path`),
  KEY `jbc_image_ibfk_1` (`rec_user`),
  KEY `jbc_image_ibfk_2` (`adr_path`),
  CONSTRAINT `jbc_image_ibfk_1` FOREIGN KEY (`rec_user`) REFERENCES `jbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_image_ibfk_2` FOREIGN KEY (`adr_path`) REFERENCES `jbc_path` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jbc_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rec_id` int(11) NOT NULL,
  `form_name` int(11) NOT NULL,
  `type_name` int(11) NOT NULL,
  `table_name` int(11) NOT NULL,
  `log_data` json NOT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jbc_log_ibfk_1` (`rec_user`),
  KEY `jbc_log_ibfk_2` (`form_name`),
  KEY `jbc_log_ibfk_3` (`table_name`),
  KEY `jbc_log_ibfk_4` (`type_name`),
  CONSTRAINT `jbc_log_ibfk_1` FOREIGN KEY (`rec_user`) REFERENCES `jbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_log_ibfk_2` FOREIGN KEY (`form_name`) REFERENCES `jbc_log_form` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_log_ibfk_3` FOREIGN KEY (`table_name`) REFERENCES `jbc_log_table` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_log_ibfk_4` FOREIGN KEY (`type_name`) REFERENCES `jbc_log_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jbc_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  `adr_path` int(11) NOT NULL,
  `menu_data` varchar(16000) CHARACTER SET utf8mb4 DEFAULT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_unique` (`menu_name`,`adr_path`),
  KEY `jbc_menu_ibfk_1` (`rec_user`),
  KEY `jbc_menu_ibfk_2` (`adr_path`),
  CONSTRAINT `jbc_menu_ibfk_1` FOREIGN KEY (`rec_user`) REFERENCES `jbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_menu_ibfk_2` FOREIGN KEY (`adr_path`) REFERENCES `jbc_path` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jbc_message` (
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jbc_message_map` (
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='					';

CREATE TABLE `jbc_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  `adr_path` int(11) NOT NULL,
  `theme_menu` int(11) NOT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `theme_unique` (`theme_name`,`adr_path`),
  KEY `fk_theme_user` (`rec_user`),
  KEY `fk_theme_path` (`adr_path`),
  KEY `jbc_theme_ibfk_3` (`theme_menu`),
  CONSTRAINT `jbc_theme_ibfk_1` FOREIGN KEY (`rec_user`) REFERENCES `jbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_theme_ibfk_2` FOREIGN KEY (`adr_path`) REFERENCES `jbc_path` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jbc_theme_ibfk_3` FOREIGN KEY (`theme_menu`) REFERENCES `jbc_menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `jbc_page_map` (
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

