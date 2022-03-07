USE [jbcdb]
GO

/****** Object:  Table [dbo].[jbc_code]    Script Date: 3.10.2019 09:28:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[jbc_code_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code_type_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_jbc_code_type] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[jbc_file_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[file_type_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_jbc_file_type] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[jbc_group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[group_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_jbc_group] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[jbc_log_form](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[log_form_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_jbc_log_form] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[jbc_log_table](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[log_table_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_jbc_log_table] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[jbc_log_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[log_type_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_jbc_log_type] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[jbc_message_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[msg_type_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_jbc_message_type] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[jbc_page_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[page_type_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_jbc_page_type] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[jbc_path](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[path_name] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_jbc_path] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[jbc_position](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pos_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_jbc_position] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[jbc_status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_jbc_status] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[jbc_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](150) NOT NULL,
	[user_code] [nvarchar](30) NOT NULL,
	[user_psw] [nvarchar](300) NULL,
	[user_group] [int] NOT NULL,
	[e_mail] [nvarchar](150) NULL,
	[rec_status] [int] NOT NULL,
	[page_size] [int] NULL,
	[rec_user] [int] NOT NULL,
	[rec_date] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_jbc_user] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[jbc_user]  WITH CHECK ADD  CONSTRAINT [FK_jbc_user_jbc_group] FOREIGN KEY([user_group])
REFERENCES [dbo].[jbc_group] ([id])
GO

ALTER TABLE [dbo].[jbc_user] CHECK CONSTRAINT [FK_jbc_user_jbc_group]
GO

ALTER TABLE [dbo].[jbc_user]  WITH CHECK ADD  CONSTRAINT [FK_jbc_user_jbc_status] FOREIGN KEY([rec_status])
REFERENCES [dbo].[jbc_status] ([id])
GO

ALTER TABLE [dbo].[jbc_user] CHECK CONSTRAINT [FK_jbc_user_jbc_status]
GO

CREATE TABLE [dbo].[jbc_contact](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contact_name] [nvarchar](150) NOT NULL,
	[e_mail] [nvarchar](150) NULL,
	[web_site] [nvarchar](100) NOT NULL,
	[message_data] [nvarchar](1000) NULL,
	[rec_user] [int] NOT NULL,
	[rec_date] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_jbc_contact] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[jbc_contact]  WITH CHECK ADD  CONSTRAINT [FK_jbc_contact_jbc_user] FOREIGN KEY([rec_user])
REFERENCES [dbo].[jbc_user] ([id])
GO

ALTER TABLE [dbo].[jbc_contact] CHECK CONSTRAINT [FK_jbc_contact_jbc_user]
GO

CREATE TABLE [dbo].[jbc_code](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code_name] [nvarchar](150) NOT NULL,
	[adr_path] [int] NOT NULL,
	[code_data] [nvarchar](max) NULL,
	[code_type] [int] NOT NULL,
	[rec_user] [int] NOT NULL,
	[rec_date] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_jbc_code] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[jbc_code]  WITH CHECK ADD  CONSTRAINT [FK_jbc_code_jbc_code_type] FOREIGN KEY([code_type])
REFERENCES [dbo].[jbc_code_type] ([id])
GO

ALTER TABLE [dbo].[jbc_code] CHECK CONSTRAINT [FK_jbc_code_jbc_code_type]
GO

ALTER TABLE [dbo].[jbc_code]  WITH CHECK ADD  CONSTRAINT [FK_jbc_code_jbc_path] FOREIGN KEY([adr_path])
REFERENCES [dbo].[jbc_path] ([id])
GO

ALTER TABLE [dbo].[jbc_code] CHECK CONSTRAINT [FK_jbc_code_jbc_path]
GO

ALTER TABLE [dbo].[jbc_code]  WITH CHECK ADD  CONSTRAINT [FK_jbc_code_jbc_user] FOREIGN KEY([rec_user])
REFERENCES [dbo].[jbc_user] ([id])
GO

ALTER TABLE [dbo].[jbc_code] CHECK CONSTRAINT [FK_jbc_code_jbc_user]
GO

CREATE TABLE [dbo].[jbc_file](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[file_name] [nvarchar](150) NOT NULL,
	[adr_path] [int] NOT NULL,
	[file_data] [varbinary](max) NULL,
	[file_type] [int] NOT NULL,
	[file_size] [int] NOT NULL,
	[mime_type] [nvarchar](100) NOT NULL,
	[rec_user] [int] NOT NULL,
	[rec_date] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_jbc_file] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[jbc_file]  WITH CHECK ADD  CONSTRAINT [FK_jbc_file_jbc_file_type] FOREIGN KEY([file_type])
REFERENCES [dbo].[jbc_file_type] ([id])
GO

ALTER TABLE [dbo].[jbc_file] CHECK CONSTRAINT [FK_jbc_file_jbc_file_type]
GO

ALTER TABLE [dbo].[jbc_file]  WITH CHECK ADD  CONSTRAINT [FK_jbc_file_jbc_path] FOREIGN KEY([adr_path])
REFERENCES [dbo].[jbc_path] ([id])
GO

ALTER TABLE [dbo].[jbc_file] CHECK CONSTRAINT [FK_jbc_file_jbc_path]
GO

ALTER TABLE [dbo].[jbc_file]  WITH CHECK ADD  CONSTRAINT [FK_jbc_file_jbc_user] FOREIGN KEY([rec_user])
REFERENCES [dbo].[jbc_user] ([id])
GO

ALTER TABLE [dbo].[jbc_file] CHECK CONSTRAINT [FK_jbc_file_jbc_user]
GO

CREATE TABLE [dbo].[jbc_image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image_name] [nvarchar](150) NOT NULL,
	[adr_path] [int] NOT NULL,
	[image_data] [varbinary](max) NULL,
	[rec_user] [int] NOT NULL,
	[rec_date] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_jbc_image] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[jbc_image]  WITH CHECK ADD  CONSTRAINT [FK_jbc_image_jbc_path] FOREIGN KEY([adr_path])
REFERENCES [dbo].[jbc_path] ([id])
GO

ALTER TABLE [dbo].[jbc_image] CHECK CONSTRAINT [FK_jbc_image_jbc_path]
GO

ALTER TABLE [dbo].[jbc_image]  WITH CHECK ADD  CONSTRAINT [FK_jbc_image_jbc_user] FOREIGN KEY([rec_user])
REFERENCES [dbo].[jbc_user] ([id])
GO

ALTER TABLE [dbo].[jbc_image] CHECK CONSTRAINT [FK_jbc_image_jbc_user]
GO

CREATE TABLE [dbo].[jbc_page](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[page_name] [nvarchar](150) NOT NULL,
	[adr_path] [int] NOT NULL,
	[page_data] [nvarchar](max) NULL,
	[page_type] [int] NOT NULL,
	[rec_status] [int] NOT NULL,
	[rec_user] [int] NOT NULL,
	[rec_date] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_jbc_page] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[jbc_page]  WITH CHECK ADD  CONSTRAINT [FK_jbc_page_jbc_page_type] FOREIGN KEY([page_type])
REFERENCES [dbo].[jbc_page_type] ([id])
GO

ALTER TABLE [dbo].[jbc_page] CHECK CONSTRAINT [FK_jbc_page_jbc_page_type]
GO

ALTER TABLE [dbo].[jbc_page]  WITH CHECK ADD  CONSTRAINT [FK_jbc_page_jbc_path] FOREIGN KEY([adr_path])
REFERENCES [dbo].[jbc_path] ([id])
GO

ALTER TABLE [dbo].[jbc_page] CHECK CONSTRAINT [FK_jbc_page_jbc_path]
GO

ALTER TABLE [dbo].[jbc_page]  WITH CHECK ADD  CONSTRAINT [FK_jbc_page_jbc_status] FOREIGN KEY([rec_status])
REFERENCES [dbo].[jbc_status] ([id])
GO

ALTER TABLE [dbo].[jbc_page] CHECK CONSTRAINT [FK_jbc_page_jbc_status]
GO

ALTER TABLE [dbo].[jbc_page]  WITH CHECK ADD  CONSTRAINT [FK_jbc_page_jbc_user] FOREIGN KEY([rec_user])
REFERENCES [dbo].[jbc_user] ([id])
GO

ALTER TABLE [dbo].[jbc_page] CHECK CONSTRAINT [FK_jbc_page_jbc_user]
GO


CREATE TABLE [dbo].[jbc_code_map](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mapped_code] [int] NOT NULL,
	[page_link] [int] NOT NULL,
	[rec_user] [int] NOT NULL,
	[rec_date] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_jbc_code_map] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[jbc_code_map]  WITH CHECK ADD  CONSTRAINT [FK_jbc_code_map_jbc_code] FOREIGN KEY([mapped_code])
REFERENCES [dbo].[jbc_code] ([id])
GO

ALTER TABLE [dbo].[jbc_code_map] CHECK CONSTRAINT [FK_jbc_code_map_jbc_code]
GO

ALTER TABLE [dbo].[jbc_code_map]  WITH CHECK ADD  CONSTRAINT [FK_jbc_code_map_jbc_page] FOREIGN KEY([page_link])
REFERENCES [dbo].[jbc_page] ([id])
GO

ALTER TABLE [dbo].[jbc_code_map] CHECK CONSTRAINT [FK_jbc_code_map_jbc_page]
GO

ALTER TABLE [dbo].[jbc_code_map]  WITH CHECK ADD  CONSTRAINT [FK_jbc_code_map_jbc_user] FOREIGN KEY([rec_user])
REFERENCES [dbo].[jbc_user] ([id])
GO

ALTER TABLE [dbo].[jbc_code_map] CHECK CONSTRAINT [FK_jbc_code_map_jbc_user]
GO

CREATE TABLE [dbo].[jbc_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rec_id] [int] NOT NULL,
	[form_name] [int] NOT NULL,
	[type_name] [int] NOT NULL,
	[table_name] [int] NOT NULL,
	[log_data] [nvarchar](max) NULL,
	[rec_user] [int] NOT NULL,
	[rec_date] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_jbc_log] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[jbc_log]  WITH CHECK ADD  CONSTRAINT [FK_jbc_log_jbc_log_type] FOREIGN KEY([type_name])
REFERENCES [dbo].[jbc_log_type] ([id])
GO

ALTER TABLE [dbo].[jbc_log] CHECK CONSTRAINT [FK_jbc_log_jbc_log_type]
GO

ALTER TABLE [dbo].[jbc_log]  WITH CHECK ADD  CONSTRAINT [FK_jbc_log_jbc_log_form] FOREIGN KEY([form_name])
REFERENCES [dbo].[jbc_log_form] ([id])
GO

ALTER TABLE [dbo].[jbc_log] CHECK CONSTRAINT [FK_jbc_log_jbc_log_form]
GO

ALTER TABLE [dbo].[jbc_log]  WITH CHECK ADD  CONSTRAINT [FK_jbc_log_jbc_log_table] FOREIGN KEY([table_name])
REFERENCES [dbo].[jbc_log_table] ([id])
GO

ALTER TABLE [dbo].[jbc_log] CHECK CONSTRAINT [FK_jbc_log_jbc_log_table]
GO

ALTER TABLE [dbo].[jbc_log]  WITH CHECK ADD  CONSTRAINT [FK_jbc_log_jbc_user] FOREIGN KEY([rec_user])
REFERENCES [dbo].[jbc_user] ([id])
GO

ALTER TABLE [dbo].[jbc_log] CHECK CONSTRAINT [FK_jbc_log_jbc_user]
GO


CREATE TABLE [dbo].[jbc_menu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[menu_name] [nvarchar](150) NOT NULL,
	[adr_path] [int] NOT NULL,
	[menu_data] [nvarchar](max) NULL,
	[rec_user] [int] NOT NULL,
	[rec_date] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_jbc_menu] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[jbc_menu]  WITH CHECK ADD  CONSTRAINT [FK_jbc_menu_jbc_path] FOREIGN KEY([adr_path])
REFERENCES [dbo].[jbc_path] ([id])
GO

ALTER TABLE [dbo].[jbc_menu] CHECK CONSTRAINT [FK_jbc_menu_jbc_path]
GO

ALTER TABLE [dbo].[jbc_menu]  WITH CHECK ADD  CONSTRAINT [FK_jbc_menu_jbc_user] FOREIGN KEY([rec_user])
REFERENCES [dbo].[jbc_user] ([id])
GO

ALTER TABLE [dbo].[jbc_menu] CHECK CONSTRAINT [FK_jbc_menu_jbc_user]
GO

CREATE TABLE [dbo].[jbc_message](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[msg_name] [nvarchar](150) NOT NULL,
	[msg_data] [nvarchar](max) NULL,
	[message_type] [int] NOT NULL,
	[rec_status] [int] NOT NULL,
	[rec_user] [int] NOT NULL,
	[rec_date] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_jbc_message] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[jbc_message]  WITH CHECK ADD  CONSTRAINT [FK_jbc_message_jbc_message_type] FOREIGN KEY([message_type])
REFERENCES [dbo].[jbc_message_type] ([id])
GO

ALTER TABLE [dbo].[jbc_message] CHECK CONSTRAINT [FK_jbc_message_jbc_message_type]
GO

ALTER TABLE [dbo].[jbc_message]  WITH CHECK ADD  CONSTRAINT [FK_jbc_message_jbc_status] FOREIGN KEY([rec_status])
REFERENCES [dbo].[jbc_status] ([id])
GO

ALTER TABLE [dbo].[jbc_message] CHECK CONSTRAINT [FK_jbc_message_jbc_status]
GO

ALTER TABLE [dbo].[jbc_message]  WITH CHECK ADD  CONSTRAINT [FK_jbc_message_jbc_user] FOREIGN KEY([rec_user])
REFERENCES [dbo].[jbc_user] ([id])
GO

ALTER TABLE [dbo].[jbc_message] CHECK CONSTRAINT [FK_jbc_message_jbc_user]
GO


CREATE TABLE [dbo].[jbc_message_map](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mapped_msg] [int] NOT NULL,
	[user_group] [int] NOT NULL,
	[rec_user] [int] NOT NULL,
	[rec_date] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_jbc_message_map] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[jbc_message_map]  WITH CHECK ADD  CONSTRAINT [FK_jbc_message_map_jbc_message] FOREIGN KEY([mapped_msg])
REFERENCES [dbo].[jbc_message] ([id])
GO

ALTER TABLE [dbo].[jbc_message_map] CHECK CONSTRAINT [FK_jbc_message_map_jbc_message]
GO

ALTER TABLE [dbo].[jbc_message_map]  WITH CHECK ADD  CONSTRAINT [FK_jbc_message_map_jbc_group] FOREIGN KEY([user_group])
REFERENCES [dbo].[jbc_group] ([id])
GO

ALTER TABLE [dbo].[jbc_message_map] CHECK CONSTRAINT [FK_jbc_message_map_jbc_group]
GO

ALTER TABLE [dbo].[jbc_message_map]  WITH CHECK ADD  CONSTRAINT [FK_jbc_message_map_jbc_user] FOREIGN KEY([rec_user])
REFERENCES [dbo].[jbc_user] ([id])
GO

ALTER TABLE [dbo].[jbc_message_map] CHECK CONSTRAINT [FK_jbc_message_map_jbc_user]
GO

CREATE TABLE [dbo].[jbc_theme](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[theme_name] [nvarchar](150) NOT NULL,
	[adr_path] [int] NOT NULL,
	[theme_menu] [int] NULL,
	[rec_user] [int] NOT NULL,
	[rec_date] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_jbc_theme] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[jbc_theme]  WITH CHECK ADD  CONSTRAINT [FK_jbc_theme_jbc_path] FOREIGN KEY([adr_path])
REFERENCES [dbo].[jbc_path] ([id])
GO

ALTER TABLE [dbo].[jbc_theme] CHECK CONSTRAINT [FK_jbc_theme_jbc_path]
GO

ALTER TABLE [dbo].[jbc_theme]  WITH CHECK ADD  CONSTRAINT [FK_jbc_theme_jbc_menu] FOREIGN KEY([theme_menu])
REFERENCES [dbo].[jbc_menu] ([id])
GO

ALTER TABLE [dbo].[jbc_theme] CHECK CONSTRAINT [FK_jbc_theme_jbc_menu]
GO

ALTER TABLE [dbo].[jbc_theme]  WITH CHECK ADD  CONSTRAINT [FK_jbc_theme_jbc_user] FOREIGN KEY([rec_user])
REFERENCES [dbo].[jbc_user] ([id])
GO

ALTER TABLE [dbo].[jbc_theme] CHECK CONSTRAINT [FK_jbc_theme_jbc_user]
GO

CREATE TABLE [dbo].[jbc_page_link](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[link_name] [nvarchar](150) NOT NULL,
	[adr_path] [int] NOT NULL,
	[linked_page] [int] NOT NULL,
	[position] [int] NOT NULL,
	[theme] [int] NOT NULL,
	[rec_user] [int] NOT NULL,
	[rec_date] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_jbc_page_link] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[jbc_page_link]  WITH CHECK ADD  CONSTRAINT [FK_jbc_page_link_jbc_path] FOREIGN KEY([adr_path])
REFERENCES [dbo].[jbc_path] ([id])
GO

ALTER TABLE [dbo].[jbc_page_link] CHECK CONSTRAINT [FK_jbc_page_link_jbc_path]
GO

ALTER TABLE [dbo].[jbc_page_link]  WITH CHECK ADD  CONSTRAINT [FK_jbc_page_link_jbc_page] FOREIGN KEY([linked_page])
REFERENCES [dbo].[jbc_page] ([id])
GO

ALTER TABLE [dbo].[jbc_page_link] CHECK CONSTRAINT [FK_jbc_page_link_jbc_page]
GO

ALTER TABLE [dbo].[jbc_page_link]  WITH CHECK ADD  CONSTRAINT [FK_jbc_page_link_jbc_position] FOREIGN KEY([position])
REFERENCES [dbo].[jbc_position] ([id])
GO

ALTER TABLE [dbo].[jbc_page_link] CHECK CONSTRAINT [FK_jbc_page_link_jbc_position]
GO

ALTER TABLE [dbo].[jbc_page_link]  WITH CHECK ADD  CONSTRAINT [FK_jbc_page_link_jbc_theme] FOREIGN KEY([theme])
REFERENCES [dbo].[jbc_theme] ([id])
GO

ALTER TABLE [dbo].[jbc_page_link] CHECK CONSTRAINT [FK_jbc_page_link_jbc_theme]
GO

ALTER TABLE [dbo].[jbc_page_link]  WITH CHECK ADD  CONSTRAINT [FK_jbc_page_link_jbc_user] FOREIGN KEY([rec_user])
REFERENCES [dbo].[jbc_user] ([id])
GO

ALTER TABLE [dbo].[jbc_page_link] CHECK CONSTRAINT [FK_jbc_page_link_jbc_user]
GO

CREATE TABLE [dbo].[jbc_page_map](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mapped_page] [int] NOT NULL,
	[theme] [int] NOT NULL,
	[position] [int] NOT NULL,
	[rec_user] [int] NOT NULL,
	[rec_date] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_jbc_page_map] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[jbc_page_map]  WITH CHECK ADD  CONSTRAINT [FK_jbc_page_map_jbc_page] FOREIGN KEY([mapped_page])
REFERENCES [dbo].[jbc_page] ([id])
GO

ALTER TABLE [dbo].[jbc_page_map] CHECK CONSTRAINT [FK_jbc_page_map_jbc_page]
GO

ALTER TABLE [dbo].[jbc_page_map]  WITH CHECK ADD  CONSTRAINT [FK_jbc_page_map_jbc_theme] FOREIGN KEY([theme])
REFERENCES [dbo].[jbc_theme] ([id])
GO

ALTER TABLE [dbo].[jbc_page_map] CHECK CONSTRAINT [FK_jbc_page_map_jbc_theme]
GO

ALTER TABLE [dbo].[jbc_page_map]  WITH CHECK ADD  CONSTRAINT [FK_jbc_page_map_jbc_position] FOREIGN KEY([position])
REFERENCES [dbo].[jbc_position] ([id])
GO

ALTER TABLE [dbo].[jbc_page_map] CHECK CONSTRAINT [FK_jbc_page_map_jbc_position]
GO

ALTER TABLE [dbo].[jbc_page_map]  WITH CHECK ADD  CONSTRAINT [FK_jbc_page_map_jbc_user] FOREIGN KEY([rec_user])
REFERENCES [dbo].[jbc_user] ([id])
GO

ALTER TABLE [dbo].[jbc_page_map] CHECK CONSTRAINT [FK_jbc_page_map_jbc_user]
GO


