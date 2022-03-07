USE [jbcdb]
GO

/****** Object:  View [dbo].[vt_jbc_code]    Script Date: 7.10.2019 00:46:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vt_jbc_code]
AS
SELECT        TOP (100) PERCENT dbo.jbc_code.id, dbo.jbc_code.code_name, dbo.jbc_code_type.code_type_name AS code_type, dbo.jbc_user.user_code AS rec_user, FORMAT(dbo.jbc_code.rec_date, 'dd.MM.yyyy HH:mm') as rec_date, dbo.jbc_code.rec_date AS rec_date1, 
                         dbo.jbc_code.rec_date AS rec_date2
FROM            dbo.jbc_code INNER JOIN
                         dbo.jbc_path ON dbo.jbc_code.adr_path = dbo.jbc_path.id INNER JOIN
                         dbo.jbc_user ON dbo.jbc_code.rec_user = dbo.jbc_user.id INNER JOIN
                         dbo.jbc_code_type ON dbo.jbc_code.code_type = dbo.jbc_code_type.id
ORDER BY dbo.jbc_code.id
GO

CREATE VIEW [dbo].[vt_jbc_code_map]
AS
SELECT        dbo.jbc_code_map.id, dbo.jbc_code.code_name AS mapped_code, dbo.jbc_page.page_name AS page_link, dbo.jbc_user.user_code AS rec_user, FORMAT(dbo.jbc_code_map.rec_date, 'dd.MM.yyyy HH:mm') AS rec_date, 
                         dbo.jbc_code_map.rec_date AS rec_date1, dbo.jbc_code_map.rec_date AS rec_date2
FROM            dbo.jbc_code_map INNER JOIN
                         dbo.jbc_code ON dbo.jbc_code_map.mapped_code = dbo.jbc_code.id INNER JOIN
                         dbo.jbc_page ON dbo.jbc_code_map.page_link = dbo.jbc_page.id INNER JOIN
                         dbo.jbc_user ON dbo.jbc_code_map.rec_user = dbo.jbc_user.id
GO

CREATE VIEW [dbo].[vt_jbc_contact]
AS
SELECT        dbo.jbc_contact.id, dbo.jbc_contact.contact_name, dbo.jbc_contact.e_mail, dbo.jbc_contact.web_site, dbo.jbc_user.user_code AS rec_user, FORMAT(dbo.jbc_contact.rec_date, 'dd.MM.yyyy HH:mm') as rec_date, dbo.jbc_contact.rec_date AS rec_date1, 
                         dbo.jbc_contact.rec_date AS rec_date2
FROM            dbo.jbc_contact INNER JOIN
                         dbo.jbc_user ON dbo.jbc_contact.rec_user = dbo.jbc_user.id
GO

CREATE VIEW [dbo].[vt_jbc_file]
AS
SELECT        dbo.jbc_file.id, dbo.jbc_file.file_name, dbo.jbc_path.path_name AS adr_path, dbo.jbc_file.file_type, dbo.jbc_file.file_size, dbo.jbc_file.mime_type, dbo.jbc_user.user_code AS rec_user, FORMAT(dbo.jbc_file.rec_date, 'dd.MM.yyyy HH:mm') as rec_date, 
                         dbo.jbc_file.rec_date AS rec_date1, dbo.jbc_file.rec_date AS rec_date2
FROM            dbo.jbc_file INNER JOIN
                         dbo.jbc_path ON dbo.jbc_file.adr_path = dbo.jbc_path.id INNER JOIN
                         dbo.jbc_user ON dbo.jbc_file.rec_user = dbo.jbc_user.id INNER JOIN
                         dbo.jbc_file_type ON dbo.jbc_file.file_type = dbo.jbc_file_type.id
GO

CREATE VIEW [dbo].[vt_jbc_group_s]
AS
SELECT        id, group_name
FROM            dbo.jbc_group
WHERE        (group_name <> 'Admin')
GO

CREATE VIEW [dbo].[vt_jbc_image]
AS
SELECT        dbo.jbc_image.id, dbo.jbc_image.image_name, dbo.jbc_path.path_name AS adr_path, dbo.jbc_user.user_code AS rec_user, FORMAT(dbo.jbc_image.rec_date, 'dd.MM.yyyy HH:mm') as rec_date, dbo.jbc_image.rec_date AS rec_date1, 
                         dbo.jbc_image.rec_date AS rec_date2
FROM            dbo.jbc_image INNER JOIN
                         dbo.jbc_path ON dbo.jbc_image.adr_path = dbo.jbc_path.id INNER JOIN
                         dbo.jbc_user ON dbo.jbc_image.rec_user = dbo.jbc_user.id
GO

CREATE VIEW [dbo].[vt_jbc_log]
AS
SELECT        dbo.jbc_log.id, dbo.jbc_log.rec_id, dbo.jbc_log_form.log_form_name AS form_name, dbo.jbc_log_type.log_type_name AS type_name, dbo.jbc_log_table.log_table_name AS table_name, dbo.jbc_log.log_data, 
                         dbo.jbc_user.user_code AS rec_user, FORMAT(dbo.jbc_log.rec_date, 'dd.MM.yyyy HH:mm') as rec_date, dbo.jbc_log.rec_date AS rec_date1, dbo.jbc_log.rec_date AS rec_date2
FROM            dbo.jbc_log INNER JOIN
                         dbo.jbc_log_form ON dbo.jbc_log.form_name = dbo.jbc_log_form.id INNER JOIN
                         dbo.jbc_log_table ON dbo.jbc_log.table_name = dbo.jbc_log_table.id INNER JOIN
                         dbo.jbc_log_type ON dbo.jbc_log.type_name = dbo.jbc_log_type.id INNER JOIN
                         dbo.jbc_user ON dbo.jbc_log.rec_user = dbo.jbc_user.id
GO

CREATE VIEW [dbo].[vt_jbc_menu]
AS
SELECT        dbo.jbc_menu.id, dbo.jbc_menu.menu_name, dbo.jbc_path.path_name AS adr_path, dbo.jbc_menu.menu_data, dbo.jbc_user.user_code AS rec_user, FORMAT(dbo.jbc_menu.rec_date, 'dd.MM.yyyy HH:mm') as rec_date, dbo.jbc_menu.rec_date AS rec_date1, 
                         dbo.jbc_menu.rec_date AS rec_date2
FROM            dbo.jbc_menu INNER JOIN
                         dbo.jbc_path ON dbo.jbc_menu.adr_path = dbo.jbc_path.id INNER JOIN
                         dbo.jbc_user ON dbo.jbc_menu.rec_user = dbo.jbc_user.id
GO

CREATE VIEW [dbo].[vt_jbc_message]
AS
SELECT        dbo.jbc_message.id, dbo.jbc_message.msg_name, dbo.jbc_message.msg_data, dbo.jbc_message_type.msg_type_name AS message_type, dbo.jbc_status.status_name AS rec_status, dbo.jbc_user.user_code AS rec_user, 
                         FORMAT(dbo.jbc_message.rec_date, 'dd.MM.yyyy HH:mm') as rec_date, dbo.jbc_message.rec_date AS rec_date1, dbo.jbc_message.rec_date AS redc_date2
FROM            dbo.jbc_message INNER JOIN
                         dbo.jbc_message_type ON dbo.jbc_message.message_type = dbo.jbc_message_type.id INNER JOIN
                         dbo.jbc_user ON dbo.jbc_message.rec_user = dbo.jbc_user.id INNER JOIN
                         dbo.jbc_status ON dbo.jbc_message.rec_status = dbo.jbc_status.id 
GO

CREATE VIEW [dbo].[vt_jbc_message_map]
AS
SELECT        dbo.jbc_message_map.id, dbo.jbc_message.msg_name AS mapped_msg, dbo.jbc_group.group_name AS user_group, dbo.jbc_user.user_code AS rec_user, FORMAT(dbo.jbc_message_map.rec_date, 'dd.MM.yyyy HH:mm') as rec_date, 
                         dbo.jbc_message_map.rec_date AS rec_date1, dbo.jbc_message_map.rec_date AS rec_date2
FROM            dbo.jbc_message_map INNER JOIN
                         dbo.jbc_message ON dbo.jbc_message_map.mapped_msg = dbo.jbc_message.id INNER JOIN
                         dbo.jbc_group ON dbo.jbc_message_map.user_group = dbo.jbc_group.id INNER JOIN
                         dbo.jbc_user ON dbo.jbc_message_map.rec_user = dbo.jbc_user.id 
GO

CREATE VIEW [dbo].[vt_jbc_page]
AS
SELECT        dbo.jbc_page.id, dbo.jbc_page.page_name, dbo.jbc_path.path_name AS adr_path, dbo.jbc_page_type.page_type_name AS page_type, dbo.jbc_status.status_name AS rec_status, dbo.jbc_user.user_code AS rec_user, 
                         FORMAT(dbo.jbc_page.rec_date, 'dd.MM.yyyy HH:mm') as rec_date, dbo.jbc_page.rec_date AS rec_date1, dbo.jbc_page.rec_date AS rec_date2
FROM            dbo.jbc_page INNER JOIN
                         dbo.jbc_page_type ON dbo.jbc_page.page_type = dbo.jbc_page_type.id INNER JOIN
                         dbo.jbc_path ON dbo.jbc_page.adr_path = dbo.jbc_path.id INNER JOIN
                         dbo.jbc_status ON dbo.jbc_page.rec_status = dbo.jbc_status.id INNER JOIN
                         dbo.jbc_user ON dbo.jbc_page.rec_user = dbo.jbc_user.id 
GO

CREATE VIEW [dbo].[vt_jbc_page_link]
AS
SELECT        dbo.jbc_page_link.id, dbo.jbc_page_link.link_name, dbo.jbc_path.path_name AS adr_path, dbo.jbc_page.page_name AS linked_page, dbo.jbc_position.pos_name AS position, dbo.jbc_theme.theme_name AS theme, 
                         dbo.jbc_user.user_code AS rec_user, FORMAT(dbo.jbc_page_link.rec_date, 'dd.MM.yyyy HH:mm') as rec_date, dbo.jbc_page_link.rec_date AS rec_date1, dbo.jbc_page_link.rec_date AS rec_date2
FROM            dbo.jbc_page_link INNER JOIN
                         dbo.jbc_path ON dbo.jbc_page_link.adr_path = dbo.jbc_path.id INNER JOIN
                         dbo.jbc_page ON dbo.jbc_page_link.linked_page = dbo.jbc_page.id AND dbo.jbc_path.id = dbo.jbc_page.adr_path INNER JOIN
                         dbo.jbc_position ON dbo.jbc_page_link.position = dbo.jbc_position.id INNER JOIN
                         dbo.jbc_user ON dbo.jbc_page_link.rec_user = dbo.jbc_user.idINNER JOIN
                         dbo.jbc_theme ON dbo.jbc_page_link.theme = dbo.jbc_theme.id 
GO

CREATE VIEW [dbo].[vt_jbc_page_map]
AS
SELECT        dbo.jbc_page_map.id, dbo.jbc_page.page_name AS mapped_page, dbo.jbc_theme.theme_name AS theme, dbo.jbc_position.pos_name AS position, dbo.jbc_user.user_code AS rec_user, FORMAT(dbo.jbc_page_map.rec_date, 'dd.MM.yyyy HH:mm') as rec_date, 
                         dbo.jbc_page_map.rec_date AS rec_date1, dbo.jbc_page_map.rec_date AS rec_date2
FROM            dbo.jbc_page_map INNER JOIN
                         dbo.jbc_page ON dbo.jbc_page_map.mapped_page = dbo.jbc_page.id INNER JOIN
                         dbo.jbc_theme ON dbo.jbc_page_map.theme = dbo.jbc_theme.id INNER JOIN
                         dbo.jbc_position ON dbo.jbc_page_map.position = dbo.jbc_position.id INNER JOIN
                         dbo.jbc_user ON dbo.jbc_page_map.rec_user = dbo.jbc_user.id A
GO

CREATE VIEW [dbo].[vt_jbc_theme]
AS
SELECT        dbo.jbc_theme.id, dbo.jbc_theme.theme_name, dbo.jbc_path.path_name AS adr_path, dbo.jbc_menu.menu_name AS theme_menu, dbo.jbc_user.user_code AS rec_user, FORMAT(dbo.jbc_theme.rec_date, 'dd.MM.yyyy HH:mm') as rec_date, 
                         dbo.jbc_theme.rec_date AS rec_date1, dbo.jbc_theme.rec_date AS rec_date2
FROM            dbo.jbc_theme INNER JOIN
                         dbo.jbc_path ON dbo.jbc_theme.adr_path = dbo.jbc_path.id INNER JOIN
                         dbo.jbc_menu ON dbo.jbc_theme.theme_menu = dbo.jbc_menu.id INNER JOIN
                         dbo.jbc_user ON dbo.jbc_theme.rec_user = dbo.jbc_user.id 
GO

CREATE VIEW [dbo].[vt_jbc_user]
AS
SELECT        dbo.jbc_user.id, dbo.jbc_user.user_name, dbo.jbc_user.user_code, dbo.jbc_user.user_psw, dbo.jbc_group.group_name AS user_group, dbo.jbc_user.e_mail, dbo.jbc_status.status_name AS rec_status, dbo.jbc_user.page_size, 
                         (select us.user_code from dbo.jbc_user as us where (dbo.jbc_user.rec_user = us.id)) AS rec_user, FORMAT(dbo.jbc_user.rec_date, 'dd.MM.yyyy HH:mm') as rec_date, dbo.jbc_user.rec_date AS rec_date1, dbo.jbc_user.rec_date AS rec_date2
FROM            dbo.jbc_user INNER JOIN
                         dbo.jbc_status ON dbo.jbc_user.rec_status = dbo.jbc_status.id INNER JOIN
                         dbo.jbc_group ON dbo.jbc_user.user_group = dbo.jbc_group.id 
GO

CREATE VIEW [dbo].[vt_jbc_user_s]
AS
SELECT        dbo.jbc_user.id, dbo.jbc_user.user_name, dbo.jbc_user.user_code, dbo.jbc_user.user_psw, dbo.jbc_group.group_name AS user_group, dbo.jbc_user.e_mail, dbo.jbc_status.status_name AS rec_status, dbo.jbc_user.page_size, 
                         jbc_user_1.user_code AS rec_user, FORMAT(dbo.jbc_user.rec_date, 'dd.MM.yyyy HH:mm') as rec_date, dbo.jbc_user.rec_date AS rec_date1, dbo.jbc_user.rec_date AS rec_date2
FROM            dbo.jbc_user INNER JOIN
                         dbo.jbc_status ON dbo.jbc_user.rec_status = dbo.jbc_status.id INNER JOIN
                         dbo.jbc_group ON dbo.jbc_user.user_group = dbo.jbc_group.id INNER JOIN
                         dbo.jbc_user AS jbc_user_1 ON dbo.jbc_user.id = jbc_user_1.rec_user
WHERE 			group_name <> 'Admin'
GO

CREATE VIEW [dbo].[vt_jbc_view_message]
AS
SELECT        dbo.jbc_message.id, dbo.jbc_message.msg_name, dbo.jbc_message.msg_data, dbo.jbc_message_type.msg_type_name AS message_type, dbo.jbc_status.status_name AS rec_status, dbo.jbc_message_map.user_group, 
                         dbo.jbc_user.user_code AS rec_user, FORMAT(dbo.jbc_message.rec_date, 'dd.MM.yyyy HH:mm') AS rec_date, dbo.jbc_message.rec_date AS rec_date1, dbo.jbc_message.rec_date AS redc_date2
FROM            dbo.jbc_message INNER JOIN
                         dbo.jbc_message_type ON dbo.jbc_message.message_type = dbo.jbc_message_type.id INNER JOIN
                         dbo.jbc_user ON dbo.jbc_message.rec_user = dbo.jbc_user.id INNER JOIN
                         dbo.jbc_status ON dbo.jbc_message.rec_status = dbo.jbc_status.id INNER JOIN
                         dbo.jbc_message_map ON dbo.jbc_message.id = dbo.jbc_message_map.mapped_msg 
GO