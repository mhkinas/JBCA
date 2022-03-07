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
-- Temporary view structure for view `vt_jbc_theme`
--

DROP TABLE IF EXISTS `vt_jbc_theme`;
/*!50001 DROP VIEW IF EXISTS `vt_jbc_theme`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_jbc_theme` AS SELECT 
 1 AS `id`,
 1 AS `theme_name`,
 1 AS `adr_path`,
 1 AS `theme_menu`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_date1`,
 1 AS `rec_date2`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_jbc_page_map`
--

DROP TABLE IF EXISTS `vt_jbc_page_map`;
/*!50001 DROP VIEW IF EXISTS `vt_jbc_page_map`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_jbc_page_map` AS SELECT 
 1 AS `id`,
 1 AS `mapped_page`,
 1 AS `theme`,
 1 AS `position`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_date1`,
 1 AS `rec_date2`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_jbc_code_map`
--

DROP TABLE IF EXISTS `vt_jbc_code_map`;
/*!50001 DROP VIEW IF EXISTS `vt_jbc_code_map`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_jbc_code_map` AS SELECT 
 1 AS `id`,
 1 AS `mapped_code`,
 1 AS `page_link`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_date1`,
 1 AS `rec_date2`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_jbc_user_s`
--

DROP TABLE IF EXISTS `vt_jbc_user_s`;
/*!50001 DROP VIEW IF EXISTS `vt_jbc_user_s`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_jbc_user_s` AS SELECT 
 1 AS `id`,
 1 AS `user_name`,
 1 AS `user_code`,
 1 AS `user_psw`,
 1 AS `user_group`,
 1 AS `e_mail`,
 1 AS `rec_status`,
 1 AS `page_size`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_date1`,
 1 AS `rec_date2`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_jbc_file`
--

DROP TABLE IF EXISTS `vt_jbc_file`;
/*!50001 DROP VIEW IF EXISTS `vt_jbc_file`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_jbc_file` AS SELECT 
 1 AS `id`,
 1 AS `file_name`,
 1 AS `adr_path`,
 1 AS `file_type`,
 1 AS `file_size`,
 1 AS `mime_type`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_date1`,
 1 AS `rec_date2`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_jbc_code`
--

DROP TABLE IF EXISTS `vt_jbc_code`;
/*!50001 DROP VIEW IF EXISTS `vt_jbc_code`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_jbc_code` AS SELECT 
 1 AS `id`,
 1 AS `code_name`,
 1 AS `adr_path`,
 1 AS `code_type`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_date1`,
 1 AS `rec_date2`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_jbc_log`
--

DROP TABLE IF EXISTS `vt_jbc_log`;
/*!50001 DROP VIEW IF EXISTS `vt_jbc_log`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_jbc_log` AS SELECT 
 1 AS `id`,
 1 AS `rec_id`,
 1 AS `form_name`,
 1 AS `type_name`,
 1 AS `table_name`,
 1 AS `log_data`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_date1`,
 1 AS `rec_date2`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_jbc_menu`
--

DROP TABLE IF EXISTS `vt_jbc_menu`;
/*!50001 DROP VIEW IF EXISTS `vt_jbc_menu`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_jbc_menu` AS SELECT 
 1 AS `id`,
 1 AS `menu_name`,
 1 AS `adr_path`,
 1 AS `menu_data`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_date1`,
 1 AS `rec_date2`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_jbc_image`
--

DROP TABLE IF EXISTS `vt_jbc_image`;
/*!50001 DROP VIEW IF EXISTS `vt_jbc_image`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_jbc_image` AS SELECT 
 1 AS `id`,
 1 AS `image_name`,
 1 AS `adr_path`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_date1`,
 1 AS `rec_date2`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_jbc_page_link`
--

DROP TABLE IF EXISTS `vt_jbc_page_link`;
/*!50001 DROP VIEW IF EXISTS `vt_jbc_page_link`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_jbc_page_link` AS SELECT 
 1 AS `id`,
 1 AS `link_name`,
 1 AS `adr_path`,
 1 AS `linked_page`,
 1 AS `position`,
 1 AS `theme`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_date1`,
 1 AS `rec_date2`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_jbc_contact`
--

DROP TABLE IF EXISTS `vt_jbc_contact`;
/*!50001 DROP VIEW IF EXISTS `vt_jbc_contact`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_jbc_contact` AS SELECT 
 1 AS `id`,
 1 AS `contact_name`,
 1 AS `e_mail`,
 1 AS `web_site`,
 1 AS `message_data`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_date1`,
 1 AS `rec_date2`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_jbc_message`
--

DROP TABLE IF EXISTS `vt_jbc_message`;
/*!50001 DROP VIEW IF EXISTS `vt_jbc_message`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_jbc_message` AS SELECT 
 1 AS `id`,
 1 AS `msg_name`,
 1 AS `message_type`,
 1 AS `rec_status`,
 1 AS `msg_data`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_date1`,
 1 AS `rec_date2`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_jbc_group_s`
--

DROP TABLE IF EXISTS `vt_jbc_group_s`;
/*!50001 DROP VIEW IF EXISTS `vt_jbc_group_s`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_jbc_group_s` AS SELECT 
 1 AS `id`,
 1 AS `group_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_jbc_user`
--

DROP TABLE IF EXISTS `vt_jbc_user`;
/*!50001 DROP VIEW IF EXISTS `vt_jbc_user`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_jbc_user` AS SELECT 
 1 AS `id`,
 1 AS `user_name`,
 1 AS `user_code`,
 1 AS `user_psw`,
 1 AS `user_group`,
 1 AS `e_mail`,
 1 AS `rec_status`,
 1 AS `page_size`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_date1`,
 1 AS `rec_date2`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_jbc_view_message`
--

DROP TABLE IF EXISTS `vt_jbc_view_message`;
/*!50001 DROP VIEW IF EXISTS `vt_jbc_view_message`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_jbc_view_message` AS SELECT 
 1 AS `id`,
 1 AS `msg_name`,
 1 AS `message_type`,
 1 AS `rec_status`,
 1 AS `msg_data`,
 1 AS `user_group`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_date1`,
 1 AS `rec_date2`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_jbc_message_map`
--

DROP TABLE IF EXISTS `vt_jbc_message_map`;
/*!50001 DROP VIEW IF EXISTS `vt_jbc_message_map`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_jbc_message_map` AS SELECT 
 1 AS `id`,
 1 AS `mapped_msg`,
 1 AS `user_group`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_date1`,
 1 AS `rec_date2`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_jbc_page`
--

DROP TABLE IF EXISTS `vt_jbc_page`;
/*!50001 DROP VIEW IF EXISTS `vt_jbc_page`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_jbc_page` AS SELECT 
 1 AS `id`,
 1 AS `page_name`,
 1 AS `adr_path`,
 1 AS `page_type`,
 1 AS `rec_status`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_date1`,
 1 AS `rec_date2`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vt_jbc_theme`
--

/*!50001 DROP VIEW IF EXISTS `vt_jbc_theme`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_jbc_theme` AS select `t`.`id` AS `id`,`t`.`theme_name` AS `theme_name`,`pt`.`path_name` AS `adr_path`,`m`.`menu_name` AS `theme_menu`,`u`.`user_code` AS `rec_user`,date_format(`t`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`t`.`rec_date` AS `rec_date1`,`t`.`rec_date` AS `rec_date2` from (((`jbc_theme` `t` join `jbc_path` `pt`) join `jbc_menu` `m`) join `jbc_user` `u`) where ((`t`.`adr_path` = `pt`.`id`) and (`t`.`theme_menu` = `m`.`id`) and (`t`.`rec_user` = `u`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_jbc_page_map`
--

/*!50001 DROP VIEW IF EXISTS `vt_jbc_page_map`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_jbc_page_map` AS select `pm`.`id` AS `id`,`p`.`page_name` AS `mapped_page`,`t`.`theme_name` AS `theme`,`ps`.`pos_name` AS `position`,`u`.`user_code` AS `rec_user`,date_format(`pm`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`pm`.`rec_date` AS `rec_date1`,`pm`.`rec_date` AS `rec_date2` from ((((`jbc_page_map` `pm` join `jbc_page` `p`) join `jbc_theme` `t`) join `jbc_position` `ps`) join `jbc_user` `u`) where ((`pm`.`mapped_page` = `p`.`id`) and (`pm`.`theme` = `t`.`id`) and (`pm`.`position` = `ps`.`id`) and (`pm`.`rec_user` = `u`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_jbc_code_map`
--

/*!50001 DROP VIEW IF EXISTS `vt_jbc_code_map`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_jbc_code_map` AS select `cm`.`id` AS `id`,`c`.`code_name` AS `mapped_code`,`pl`.`link_name` AS `page_link`,`u`.`user_code` AS `rec_user`,date_format(`cm`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`cm`.`rec_date` AS `rec_date1`,`cm`.`rec_date` AS `rec_date2` from ((((`jbc_code_map` `cm` join `jbc_code` `c`) join `jbc_page_link` `pl`) join `jbc_user` `u`) join `jbc_path` `pt`) where ((`cm`.`mapped_code` = `c`.`id`) and (`cm`.`page_link` = `pl`.`id`) and (`cm`.`rec_user` = `u`.`id`) and (`pl`.`adr_path` = `pt`.`id`)) order by `cm`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_jbc_user_s`
--

/*!50001 DROP VIEW IF EXISTS `vt_jbc_user_s`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_jbc_user_s` AS select `u`.`id` AS `id`,`u`.`user_name` AS `user_name`,`u`.`user_code` AS `user_code`,`u`.`user_psw` AS `user_psw`,`g`.`group_name` AS `user_group`,`u`.`e_mail` AS `e_mail`,`s`.`status_name` AS `rec_status`,`u`.`page_size` AS `page_size`,(select `us`.`user_code` from `jbc_user` `us` where (`u`.`rec_user` = `us`.`id`)) AS `rec_user`,date_format(`u`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`u`.`rec_date` AS `rec_date1`,`u`.`rec_date` AS `rec_date2` from ((`jbc_user` `u` join `jbc_group` `g`) join `jbc_status` `s`) where ((`u`.`user_group` = `g`.`id`) and (`u`.`rec_status` = `s`.`id`) and (`g`.`group_name` <> 'Admin')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_jbc_file`
--

/*!50001 DROP VIEW IF EXISTS `vt_jbc_file`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_jbc_file` AS select `f`.`id` AS `id`,`f`.`file_name` AS `file_name`,`p`.`path_name` AS `adr_path`,`ft`.`file_type_name` AS `file_type`,`f`.`file_size` AS `file_size`,`f`.`mime_type` AS `mime_type`,`u`.`user_code` AS `rec_user`,date_format(`f`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`f`.`rec_date` AS `rec_date1`,`f`.`rec_date` AS `rec_date2` from (((`jbc_file` `f` join `jbc_path` `p`) join `jbc_file_type` `ft`) join `jbc_user` `u`) where ((`f`.`adr_path` = `p`.`id`) and (`f`.`file_type` = `ft`.`id`) and (`f`.`rec_user` = `u`.`id`)) order by `f`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_jbc_code`
--

/*!50001 DROP VIEW IF EXISTS `vt_jbc_code`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_jbc_code` AS select `c`.`id` AS `id`,`c`.`code_name` AS `code_name`,`p`.`path_name` AS `adr_path`,`t`.`code_type_name` AS `code_type`,`u`.`user_code` AS `rec_user`,date_format(`c`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`c`.`rec_date` AS `rec_date1`,`c`.`rec_date` AS `rec_date2` from (((`jbc_code` `c` join `jbc_path` `p`) join `jbc_code_type` `t`) join `jbc_user` `u`) where ((`c`.`adr_path` = `p`.`id`) and (`c`.`code_type` = `t`.`id`) and (`c`.`rec_user` = `u`.`id`)) order by `c`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_jbc_log`
--

/*!50001 DROP VIEW IF EXISTS `vt_jbc_log`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_jbc_log` AS select `l`.`id` AS `id`,`l`.`rec_id` AS `rec_id`,`f`.`log_form_name` AS `form_name`,`t`.`log_type_name` AS `type_name`,`b`.`log_table_name` AS `table_name`,`l`.`log_data` AS `log_data`,`u`.`user_code` AS `rec_user`,date_format(`l`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`l`.`rec_date` AS `rec_date1`,`l`.`rec_date` AS `rec_date2` from ((((`jbc_log` `l` join `jbc_log_table` `b`) join `jbc_log_type` `t`) join `jbc_log_form` `f`) join `jbc_user` `u`) where ((`l`.`form_name` = `f`.`id`) and (`l`.`type_name` = `t`.`id`) and (`l`.`table_name` = `b`.`id`) and (`l`.`rec_user` = `u`.`id`)) order by `l`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_jbc_menu`
--

/*!50001 DROP VIEW IF EXISTS `vt_jbc_menu`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_jbc_menu` AS select `m`.`id` AS `id`,`m`.`menu_name` AS `menu_name`,`p`.`path_name` AS `adr_path`,`m`.`menu_data` AS `menu_data`,`u`.`user_code` AS `rec_user`,date_format(`m`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`m`.`rec_date` AS `rec_date1`,`m`.`rec_date` AS `rec_date2` from ((`jbc_menu` `m` join `jbc_path` `p`) join `jbc_user` `u`) where ((`m`.`adr_path` = `p`.`id`) and (`m`.`rec_user` = `u`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_jbc_image`
--

/*!50001 DROP VIEW IF EXISTS `vt_jbc_image`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_jbc_image` AS select `m`.`id` AS `id`,`m`.`image_name` AS `image_name`,`p`.`path_name` AS `adr_path`,`u`.`user_code` AS `rec_user`,date_format(`m`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`m`.`rec_date` AS `rec_date1`,`m`.`rec_date` AS `rec_date2` from ((`jbc_image` `m` join `jbc_path` `p`) join `jbc_user` `u`) where ((`m`.`adr_path` = `p`.`id`) and (`m`.`rec_user` = `u`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_jbc_page_link`
--

/*!50001 DROP VIEW IF EXISTS `vt_jbc_page_link`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_jbc_page_link` AS select `pl`.`id` AS `id`,`pl`.`link_name` AS `link_name`,`pt`.`path_name` AS `adr_path`,`p`.`page_name` AS `linked_page`,`ps`.`pos_name` AS `position`,`t`.`theme_name` AS `theme`,`u`.`user_code` AS `rec_user`,date_format(`pl`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`pl`.`rec_date` AS `rec_date1`,`pl`.`rec_date` AS `rec_date2` from (((((`jbc_page_link` `pl` join `jbc_path` `pt`) join `jbc_page` `p`) join `jbc_position` `ps`) join `jbc_theme` `t`) join `jbc_user` `u`) where ((`pl`.`adr_path` = `pt`.`id`) and (`pl`.`linked_page` = `p`.`id`) and (`pl`.`position` = `ps`.`id`) and (`pl`.`theme` = `t`.`id`) and (`pl`.`rec_user` = `u`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_jbc_contact`
--

/*!50001 DROP VIEW IF EXISTS `vt_jbc_contact`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_jbc_contact` AS select `c`.`id` AS `id`,`c`.`contact_name` AS `contact_name`,`c`.`e_mail` AS `e_mail`,`c`.`web_site` AS `web_site`,`c`.`message_data` AS `message_data`,`u`.`user_code` AS `rec_user`,date_format(`c`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`c`.`rec_date` AS `rec_date1`,`c`.`rec_date` AS `rec_date2` from (`jbc_contact` `c` left join `jbc_user` `u` on((`c`.`rec_user` = `u`.`id`))) order by `c`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_jbc_message`
--

/*!50001 DROP VIEW IF EXISTS `vt_jbc_message`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_jbc_message` AS select `m`.`id` AS `id`,`m`.`msg_name` AS `msg_name`,`mt`.`msg_type_name` AS `message_type`,`s`.`status_name` AS `rec_status`,`m`.`msg_data` AS `msg_data`,`u`.`user_code` AS `rec_user`,date_format(`m`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`m`.`rec_date` AS `rec_date1`,`m`.`rec_date` AS `rec_date2` from (((`jbc_message` `m` join `jbc_status` `s`) join `jbc_user` `u`) join `jbc_message_type` `mt`) where ((`m`.`rec_status` = `s`.`id`) and (`m`.`rec_user` = `u`.`id`) and (`m`.`message_type` = `mt`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_jbc_group_s`
--

/*!50001 DROP VIEW IF EXISTS `vt_jbc_group_s`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_jbc_group_s` AS select `g`.`id` AS `id`,`g`.`group_name` AS `group_name` from `jbc_group` `g` where (`g`.`group_name` <> 'Admin') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_jbc_user`
--

/*!50001 DROP VIEW IF EXISTS `vt_jbc_user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_jbc_user` AS select `u`.`id` AS `id`,`u`.`user_name` AS `user_name`,`u`.`user_code` AS `user_code`,`u`.`user_psw` AS `user_psw`,`g`.`group_name` AS `user_group`,`u`.`e_mail` AS `e_mail`,`s`.`status_name` AS `rec_status`,`u`.`page_size` AS `page_size`,(select `us`.`user_code` from `jbc_user` `us` where (`u`.`rec_user` = `us`.`id`)) AS `rec_user`,date_format(`u`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`u`.`rec_date` AS `rec_date1`,`u`.`rec_date` AS `rec_date2` from ((`jbc_user` `u` join `jbc_group` `g`) join `jbc_status` `s`) where ((`u`.`user_group` = `g`.`id`) and (`u`.`rec_status` = `s`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_jbc_view_message`
--

/*!50001 DROP VIEW IF EXISTS `vt_jbc_view_message`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_jbc_view_message` AS select `m`.`id` AS `id`,`m`.`msg_name` AS `msg_name`,`mt`.`msg_type_name` AS `message_type`,`s`.`status_name` AS `rec_status`,`m`.`msg_data` AS `msg_data`,`g`.`group_name` AS `user_group`,`u`.`user_code` AS `rec_user`,date_format(`m`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`m`.`rec_date` AS `rec_date1`,`m`.`rec_date` AS `rec_date2` from (((((`jbc_message` `m` join `jbc_status` `s`) join `jbc_user` `u`) join `jbc_message_type` `mt`) join `jbc_message_map` `mm`) join `jbc_group` `g`) where ((`m`.`rec_status` = `s`.`id`) and (`m`.`rec_user` = `u`.`id`) and (`m`.`message_type` = `mt`.`id`) and (`m`.`id` = `mm`.`mapped_msg`) and (`mm`.`user_group` = `g`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_jbc_message_map`
--

/*!50001 DROP VIEW IF EXISTS `vt_jbc_message_map`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_jbc_message_map` AS select `mm`.`id` AS `id`,`m`.`msg_name` AS `mapped_msg`,`g`.`group_name` AS `user_group`,`u`.`user_code` AS `rec_user`,date_format(`mm`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`mm`.`rec_date` AS `rec_date1`,`mm`.`rec_date` AS `rec_date2` from (((`jbc_message_map` `mm` join `jbc_message` `m`) join `jbc_group` `g`) join `jbc_user` `u`) where ((`mm`.`mapped_msg` = `m`.`id`) and (`mm`.`user_group` = `g`.`id`) and (`mm`.`rec_user` = `u`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_jbc_page`
--

/*!50001 DROP VIEW IF EXISTS `vt_jbc_page`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_jbc_page` AS select `p`.`id` AS `id`,`p`.`page_name` AS `page_name`,`pt`.`path_name` AS `adr_path`,`py`.`page_type_name` AS `page_type`,`s`.`status_name` AS `rec_status`,`u`.`user_code` AS `rec_user`,date_format(`p`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`p`.`rec_date` AS `rec_date1`,`p`.`rec_date` AS `rec_date2` from ((((`jbc_page` `p` join `jbc_path` `pt`) join `jbc_page_type` `py`) join `jbc_status` `s`) join `jbc_user` `u`) where ((`p`.`adr_path` = `pt`.`id`) and (`p`.`page_type` = `py`.`id`) and (`p`.`rec_status` = `s`.`id`) and (`p`.`rec_user` = `u`.`id`)) */;
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

-- Dump completed on 2019-10-10 22:24:39
