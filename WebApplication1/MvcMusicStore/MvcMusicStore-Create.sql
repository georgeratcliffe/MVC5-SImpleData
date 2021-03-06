use Test1;

IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Album_AlbumArtUrl]') AND parent_object_id = OBJECT_ID(N'[dbo].[Albums]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Album_AlbumArtUrl]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Albums] DROP CONSTRAINT [DF_Album_AlbumArtUrl]
END


End
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Album__ArtistId__276EDEB3]') AND parent_object_id = OBJECT_ID(N'[dbo].[Albums]'))
ALTER TABLE [dbo].[Albums] DROP CONSTRAINT [FK__Album__ArtistId__276EDEB3]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Album_Genre]') AND parent_object_id = OBJECT_ID(N'[dbo].[Albums]'))
ALTER TABLE [dbo].[Albums] DROP CONSTRAINT [FK_Album_Genre]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cart_Album]') AND parent_object_id = OBJECT_ID(N'[dbo].[Carts]'))
ALTER TABLE [dbo].[Carts] DROP CONSTRAINT [FK_Cart_Album]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__InvoiceLi__Invoi__2F10007B]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetails]'))
ALTER TABLE [dbo].[OrderDetails] DROP CONSTRAINT [FK__InvoiceLi__Invoi__2F10007B]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDetail_Album]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetails]'))
ALTER TABLE [dbo].[OrderDetails] DROP CONSTRAINT [FK_OrderDetail_Album]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Carts]') AND type in (N'U'))
DROP TABLE [dbo].[Carts]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderDetails]') AND type in (N'U'))
DROP TABLE [dbo].[OrderDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Albums]') AND type in (N'U'))
DROP TABLE [dbo].[Albums]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Artists]') AND type in (N'U'))
DROP TABLE [dbo].[Artists]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders]') AND type in (N'U'))
DROP TABLE [dbo].[Orders]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Genres]') AND type in (N'U'))
DROP TABLE [dbo].[Genres]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Genres]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Genres](
	[GenreId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](120) NULL,
	[Description] [nvarchar](4000) NULL,
 CONSTRAINT [PK__Genres__0385057E1EA48E88] PRIMARY KEY CLUSTERED 
(
	[GenreId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Genres] ON
INSERT [dbo].[Genres] ([GenreId], [Name], [Description]) VALUES (1, N'Rock', N'Rock and Roll is a form of rock music developed in the 1950s and 1960s. Rock music combines many kinds of music from the United States, such as country music, folk music, church music, work songs, blues and jazz.')
INSERT [dbo].[Genres] ([GenreId], [Name], [Description]) VALUES (2, N'Jazz', N'Jazz is a type of music which was invented in the United States. Jazz music combines African-American music with European music. Some common jazz instruments include the saxophone, trumpet, piano, double bass, and drums.')
INSERT [dbo].[Genres] ([GenreId], [Name], [Description]) VALUES (3, N'Metal', N'Heavy Metal is a loud, aggressive style of Rock music. The bands who play heavy-metal music usually have one or two guitars, a bass guitar and drums. In some bands, electronic keyboards, organs, or other instruments are used. Heavy metal songs are loud and powerful-sounding, and have strong rhythms that are repeated. There are many different types of Heavy Metal, some of which are described below. Heavy metal bands sometimes dress in jeans, leather jackets, and leather boots, and have long hair. Heavy metal bands sometimes behave in a dramatic way when they play their instruments or sing. However, many heavy metal bands do not like to do this.')
INSERT [dbo].[Genres] ([GenreId], [Name], [Description]) VALUES (4, N'Alternative', N'Alternative rock is a type of rock music that became popular in the 1980s and became widely popular in the 1990s. Alternative rock is made up of various subgenres that have come out of the indie music scene since the 1980s, such as grunge, indie rock, Britpop, gothic rock, and indie pop. These genres are sorted by their collective types of punk, which laid the groundwork for alternative music in the 1970s.')
INSERT [dbo].[Genres] ([GenreId], [Name], [Description]) VALUES (5, N'Disco', N'Disco is a style of pop music that was popular in the mid-1970s. Disco music has a strong beat that people can dance to. People usually dance to disco music at bars called disco clubs. The word "disco" is also used to refer to the style of dancing that people do to disco music, or to the style of clothes that people wear to go disco dancing. Disco was at its most popular in the United States and Europe in the 1970s and early 1980s. Disco was brought into the mainstream by the hit movie Saturday Night Fever, which was released in 1977. This movie, which starred John Travolta, showed people doing disco dancing. Many radio stations played disco in the late 1970s.')
INSERT [dbo].[Genres] ([GenreId], [Name], [Description]) VALUES (6, N'Blues', N'The blues is a form of music that started in the United States during the start of the 20th century. It was started by former African slaves from spirituals, praise songs, and chants. The first blues songs were called Delta blues. These songs came from the area near the mouth of the Mississippi River.')
INSERT [dbo].[Genres] ([GenreId], [Name], [Description]) VALUES (7, N'Latin', N'Latin American music is the music of all countries in Latin America (and the Caribbean) and comes in many varieties. Latin America is home to musical styles such as the simple, rural conjunto music of northern Mexico, the sophisticated habanera of Cuba, the rhythmic sounds of the Puerto Rican plena, the symphonies of Heitor Villa-Lobos, and the simple and moving Andean flute. Music has played an important part recently in Latin America''s politics, the nueva canción movement being a prime example. Latin music is very diverse, with the only truly unifying thread being the use of Latin-derived languages, predominantly the Spanish language, the Portuguese language in Brazil, and to a lesser extent, Latin-derived creole languages, such as those found in Haiti.')
INSERT [dbo].[Genres] ([GenreId], [Name], [Description]) VALUES (8, N'Reggae', N'Reggae is a music genre first developed in Jamaica in the late 1960s. While sometimes used in a broader sense to refer to most types of Jamaican music, the term reggae more properly denotes a particular music style that originated following on the development of ska and rocksteady.')
INSERT [dbo].[Genres] ([GenreId], [Name], [Description]) VALUES (9, N'Pop', N'Pop music is a music genre that developed from the mid-1950s as a softer alternative to rock ''n'' roll and later to rock music. It has a focus on commercial recording, often oriented towards a youth market, usually through the medium of relatively short and simple love songs. While these basic elements of the genre have remained fairly constant, pop music has absorbed influences from most other forms of popular music, particularly borrowing from the development of rock music, and utilizing key technological innovations to produce new variations on existing themes.')
INSERT [dbo].[Genres] ([GenreId], [Name], [Description]) VALUES (10, N'Classical', N'Classical music is a very general term which normally refers to the standard music of countries in the Western world. It is music that has been composed by musicians who are trained in the art of writing music (composing) and written down in music notation so that other musicians can play it. Classical music can also be described as "art music" because great art (skill) is needed to compose it and to perform it well. Classical music differs from pop music because it is not made just in order to be popular for a short time or just to be a commercial success.')
SET IDENTITY_INSERT [dbo].[Genres] OFF
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Username] [nvarchar](256) NULL,
	[FirstName] [nvarchar](160) NULL,
	[LastName] [nvarchar](160) NULL,
	[Address] [nvarchar](70) NULL,
	[City] [nvarchar](40) NULL,
	[State] [nvarchar](40) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](40) NULL,
	[Phone] [nvarchar](24) NULL,
	[Email] [nvarchar](160) NULL,
	[Total] [numeric](10, 2) NOT NULL,
 CONSTRAINT [PK__Invoice__D796AAB51A14E395] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Orders] ON
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (1, '2010-03-06 13:17:47.710', N'Marcus9', N'Sandy', N'O''Neill', N'254 East White Hague Parkway', N'Jersey', N'Hawaii', N'41049', N'Egypt', N'055-4065238', N'jhtunxp.liyxnlsf@ordnor.com', 48.88)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (2, '2011-02-08 07:12:27.760', N'Jamison6', N'Walter', N'Bates', N'116 Oak Freeway', N'Greensboro', N'Florida', N'03229', N'Saint Helena', N'355491-5255', N'ujlz.hdhdaj@uxdi-v.com', 53.89)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (3, '2010-10-06 02:21:37.870', N'Esther608', N'Barbara', N'Daniel', N'247 White Fabien Road', N'Jackson', N'Mississippi', N'34543', N'Taiwan', N'7164489286', N'ngpvoqe.cdzukxmsi@dodemi.net', 51.18)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (4, '2011-08-07 19:46:41.620', N'Ira', N'Paul', N'Carr', N'981 West Hague Road', NULL, N'Vermont', N'91964', N'Georgia', N'683-886-0302', N'jfromkw70@nzyeok.com', 39.65)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (5, '2010-09-15 15:06:13.600', N'Adrienne896', N'Duane', N'Hensley', N'248 Green Nobel Blvd.', N'Rochester', N'Wisconsin', N'78099', N'Taiwan', N'1503648778', N'sqsfafyc27@yjomjn.net', 20.30)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (6, '2012-02-09 00:35:11.870', N'Brandy3', N'Amanda', N'Brady', N'952 Green Milton Drive', N'Santa Ana', N'Alaska', N'23520', N'Saudi Arabia', N'115792-8525', N'ygzmppfa.lfro@lexbzm.net', 39.69)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (7, '2011-01-29 20:40:47.040', N'Jermaine3', N'Tania', N'Hendricks', N'85 White Cowley Avenue', N'Columbus', N'California', N'15623', N'Yemen', N'0453190358', N'zeao.bxhpslgnpj@ihhsrj.com', 58.76)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (8, '2011-07-08 05:40:39.360', N'Todd', N'Christine', N'Diaz', N'94 White Nobel Way', N'Corpus Christi', N'New Hampshire', N'55797', N'Micronesia', N'0178801296', N'aeqqcll45@wvoxaw.com', 33.28)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (9, '2011-06-01 23:20:22.850', N'Floyd31', N'Jacquelyn', N'Cordova', N'44 Oak Parkway', N'Dallas', N'Indiana', N'91941', N'Macedonia', N'748411-0298', N'yonfpdnp61@wgrngzfbe.e-lmsv.com', 62.69)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (10, '2011-09-24 05:24:45.020', N'Ruth9', N'Toby', N'Sellers', N'534 Hague Boulevard', N'Jacksonville', N'Utah', N'78786', N'Montenegro', N'333783-2372', N'vecpck94@xnaw.hfnpow.net', 24.02)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (11, '2010-03-28 15:03:30.500', N'Saul780', N'Eli', N'Estrada', N'94 Oak Parkway', N'Toledo', N'Montana', N'51480', N'Western Sahara', N'022-5589047', N'tapraw@eygegayb.vdwszp.com', 25.02)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (12, '2011-05-08 19:59:10.920', N'Vanessa676', N'Lakeisha', N'Farley', N'765 East White Second Freeway', N'Shreveport', N'Georgia', N'31473', N'Russia', N'692893-8045', N'ocxhhf48@ouduev.net', 34.66)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (13, '2010-03-09 17:22:02.660', N'Israel49', N'Alexis', N'Alvarez', N'67 Green Old Avenue', N'Sacramento', N'Georgia', N'86780', N'Mayotte', N'048704-8574', N'danrn283@mkwtea.net', 43.74)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (14, '2011-11-10 15:07:43.610', N'Glenda1', N'Kristi', N'Soto', N'46 West Rocky Hague Freeway', N'Buffalo', N'South Dakota', N'57099', N'Swaziland', N'645-211-1970', N'buwdh000@rvgnof.net', 34.78)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (15, '2011-06-09 02:03:20.500', N'Hector097', N'Randy', N'Berg', N'17 West Green First St.', N'Portland', N'Oregon', N'47154', N'Burkina Faso', N'5025165577', N'dynchpld.qdzeqjek@zbfuumj.dheygs.com', 62.94)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (16, '2010-07-16 15:04:28.690', N'Abraham618', N'Jessica', N'Watson', N'63 New St.', N'Houston', N'West Virginia', N'12857', N'Costa Rica', N'218-451-9272', N'htwrsacq15@kewj.bsshuf.net', 10.65)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (17, '2011-05-23 14:49:53.330', N'Felipe7', N'Joy', N'Hickman', N'583 North Cowley Drive', N'Long Beach', N'Arizona', N'66516', N'Tanzania', N'823732-5879', N'pfrw5@nsrzypi.gvmfy-.org', 56.36)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (18, '2010-01-12 14:11:45.760', N'Randal', N'Eva', N'Horne', N'689 Green Oak St.', N'Norfolk', N'Oregon', N'62805', N'Vietnam', N'744005-9916', N'nmjo490@tmxyrw.net', 63.67)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (19, '2010-10-24 17:01:20.590', N'Ray30', N'Trevor', N'Dennis', N'490 Rocky New Blvd.', N'San Jose', N'Mississippi', N'19772', N'Macedonia', N'243317-9855', N'drfed@gtqdpx.net', 46.19)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (20, '2010-07-05 20:00:50.860', N'Monique', N'Elijah', N'Erickson', N'180 Rocky Hague St.', N'Honolulu', N'Montana', N'05164', N'France', N'671-4887609', N'dmymitzk9@ujyk.ghhfeo.com', 26.27)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (21, '2010-08-29 12:19:57.170', N'Tameka096', N'Nick', N'Russo', N'21 Rocky New Avenue', N'Indianapolis', N'Arizona', N'37626', N'Georgia', N'715-048-5693', N'rgwgdpev.advygtzu@llkstr.com', 53.87)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (22, '2010-07-31 15:08:09.350', N'Sergio9', N'Ana', N'Andersen', N'512 Green Hague Blvd.', N'Glendale', N'Ohio', N'92941', N'Comoros', N'259-2804651', N'txhjzh5@hebgyx.org', 55.58)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (23, '2011-03-31 10:18:41.040', N'Eva', N'Mandi', N'Gay', N'222 Clarendon Freeway', N'Honolulu', N'Missouri', N'34132', N'Somalia', N'718-724-2865', N'jbpfkqjo@mztcpcq.nwmdbi.com', 63.48)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (24, '2010-02-02 00:26:40.490', N'Edward', N'Wendi', N'Reyes', N'102 West White First St.', N'Kansas', N'Connecticut', N'93163', N'South Georgia', N'884-2689194', N'kelu.hjesxtp@wljzil.net', 10.78)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (25, '2011-07-26 22:24:11.900', N'Karin9', N'Cynthia', N'Richmond', N'36 Fabien Parkway', N'Jackson', N'Florida', N'43094', N'Guyana', N'4864879080', N'vhcpm.dbakebji@rjxxfx.com', 47.44)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (26, '2010-09-17 13:15:12.720', N'Tyler', N'Angel', N'Hart', N'85 Hague Street', N'Dallas', N'Connecticut', N'10227', N'Iran', N'314-5110221', N'bqssj35@jyuuto.net', 37.90)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (27, '2012-02-09 20:20:55.760', N'Malcolm628', N'Damon', N'Le', N'88 Rocky Clarendon St.', N'Omaha', N'West Virginia', N'04571', N'Niue', N'630-3100186', N'fptnc600@iovjyr.com', 60.30)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (28, '2011-11-13 18:46:35.980', N'Betty191', N'Andy', N'Bass', N'15 Old Drive', N'Phoenix', N'Massachusetts', N'66734', N'Niger', N'178-7672601', N'tytnt.zxoejk@fhdphhp.ht-dvc.com', 46.76)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (29, '2010-02-02 16:41:04.080', N'Tia156', N'Joan', N'Krueger', N'152 Green Milton Avenue', N'Des Moines', N'Ohio', N'77336', N'Egypt', N'155607-1160', N'bddy@hvctn.jedfpb.net', 39.03)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (30, '2010-11-16 01:22:08.460', N'Alyssa509', N'Marcy', N'Melendez', N'23 Hague Freeway', N'Sacramento', N'Delaware', N'07318', N'Samoa', N'4252489547', N'dkenlttr.nscfg@jbkilewwk.uzpmga.net', 13.44)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (31, '2011-12-28 22:25:55.150', N'Gerald336', N'Cecil', N'Best', N'97 Hague Road', N'Charlotte', N'Wisconsin', N'09873', N'Paraguay', N'7185511056', N'sutj@gfvvdz.net', 19.27)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (32, '2010-12-17 07:29:16.070', N'Armando', N'Kara', N'Shaw', N'42 Fabien Way', N'Anaheim', N'West Virginia', N'11623', N'Kuwait', N'6060117606', N'gaktrghr96@fqcgnliz.kqjxp-.com', 33.89)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (33, '2011-07-14 01:55:04.100', N'Constance6', N'Simon', N'Hebert', N'233 Nobel Parkway', N'Jersey', N'Wyoming', N'22289', N'Serbia', N'050026-9199', N'valggrgh03@yxya.sykmvg.com', 25.31)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (34, '2011-01-01 10:49:59.190', N'Amber', N'Kirk', N'Hampton', N'621 First Avenue', N'Louisville', N'Nebraska', N'70812', N'Mexico', N'191-9875904', N'chis.feqsbzy@aygqnl.net', 63.30)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (35, '2012-02-05 23:33:32.840', N'Bethany70', N'Cecil', N'Meza', N'494 Cowley Way', N'Buffalo', N'Vermont', N'87301', N'Micronesia', N'844-5053354', N'ypvwgk.zvsdae@xwuhdw.org', 44.29)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (36, '2011-11-10 19:49:36.790', N'Norman', N'Austin', N'Landry', N'95 West Oak Drive', N'Mesa', N'West Virginia', N'58627', N'Argentina', N'822749-2826', N'wzkooqx.ujcvpyuc@dgsywewsr.jianoz.org', 50.90)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (37, '2010-01-08 00:06:03.700', N'Donna88', N'Kenneth', N'Lindsey', N'170 North Clarendon Way', N'Glendale', N'Wisconsin', N'48351', N'Nepal', N'1224741356', N'zbjy2@phy-ea.net', 10.65)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (38, '2010-11-24 16:53:02.640', N'Melanie7', N'Lindsay', N'Blair', N'561 Rocky New Freeway', N'Jacksonville', N'Michigan', N'15451', N'Serbia', N'533373-3412', N'zdbn9@zlio.pqucas.org', 29.92)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (39, '2010-11-12 17:44:31.130', N'Marjorie337', N'Bryant', N'Rush', N'78 Milton Drive', N'Stockton', N'Louisiana', N'92764', N'Panama', N'679-0161729', N'zscmgktq26@fmpils.org', 27.84)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (40, '2011-10-22 10:02:05.230', N'Greg859', N'Jamison', N'Chandler', N'41 Hague Way', N'Memphis', N'California', N'48709', N'Czech Republic', N'492-955-3814', N'ulejs000@dhjxkm.com', 61.59)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (41, '2012-05-03 06:55:51.920', N'Roxanne3', N'Angelo', N'Weaver', N'964 North Rocky Hague Parkway', N'Wichita', N'Missouri', N'81966', N'American Samoa', N'952-333-4632', N'udbxruk62@gxqhx.lkcgdx.com', 36.74)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (42, '2011-03-17 02:19:33.220', N'Cary813', N'Olivia', N'Pena', N'58 New Street', N'Aurora', N'Colorado', N'20503', N'North Korea', N'5444291280', N'xcsyz963@ywypi.fcxktp.com', 48.32)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (43, '2010-03-22 01:32:26.270', N'Katrina05', N'Christi', N'Mc Connell', N'80 West Milton St.', N'Yonkers', N'Montana', N'31950', N'Niger', N'1916500681', N'zvrwx.cmfuthfshg@ftpmnyirn.mibjdg.org', 15.52)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (44, '2012-02-05 20:31:50.840', N'Brett', N'Felipe', N'Owens', N'17 East Green Old Boulevard', N'Tacoma', NULL, N'22681', N'Palau', N'2139427563', N'umhrvjt.nbkpem@-jidxo.org', 24.01)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (45, '2012-05-09 14:14:12.950', N'Whitney456', N'Heath', N'Patton', N'257 Old Boulevard', N'Charlotte', N'Mississippi', N'28487', N'Belize', N'1534549351', N'iawrjc.bmuuoyg@jupcdh.net', 58.82)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (46, '2011-06-22 12:43:37.170', N'Camille465', N'Demetrius', N'Hansen', N'124 West Rocky Milton Blvd.', N'Wichita', N'Arizona', N'33977', N'Mongolia', N'838-099-7763', N'bexxcw.fnjw@ldyossuu.cplntr.com', 52.65)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (47, '2011-08-18 17:42:32.730', N'Allison4', N'Vickie', N'Dillon', N'943 Hague St.', N'Little Rock', N'Tennessee', N'34893', N'Greenland', N'096-433-6761', N'radhyapz.ujkw@djldop.org', 27.51)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (48, '2011-10-27 12:25:23.800', N'Brian', N'Jayson', N'Kerr', N'41 Cowley Blvd.', N'Kansas', N'North Carolina', N'98863', N'Slovakia', N'5914721686', N'hbthp283@-xlcip.org', 34.10)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (49, '2011-03-01 23:11:00.580', N'Nancy', N'Sabrina', N'Kerr', N'43 Rocky First Street', NULL, N'Rhode Island', N'88808', N'Cyprus', N'790963-5046', N'zkrg.jkfe@wizxfg.com', 17.05)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (50, '2010-03-01 02:04:51.640', N'Molly323', N'Andrea', N'Osborne', N'100 New Road', N'Richmond', N'Alaska', N'99994', N'Bolivia', N'2278503783', N'snncezn@zmguw.mnrztb.net', 21.14)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (51, '2010-12-22 03:07:15.260', N'Debra066', N'Bryan', N'Barrera', N'787 Nobel Parkway', N'Columbus', N'Texas', N'03266', N'French Guiana', N'847-7689561', N'pzrxp.gxdmxobtkc@jppq.cmstrf.net', 31.51)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (52, '2012-01-07 02:28:20.020', N'Sherrie47', N'Mark', N'Graham', N'648 White Fabien Avenue', N'Aurora', N'Arkansas', N'15482', N'Guinea', N'425980-1954', N'vkpawi77@gzukuf.net', 48.47)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (53, '2010-12-03 03:51:28.600', N'Brandon47', N'Peggy', N'Velasquez', N'349 East Fabien Freeway', N'Tacoma', N'Minnesota', N'73949', N'Canada', N'289-0326411', N'ficajcv356@bemtouelq.znhcrh.net', 43.04)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (54, '2012-01-24 08:58:22.440', N'Shonda52', N'Latoya', N'Simon', N'479 East White New Drive', N'New York', N'Oklahoma', N'15520', N'Indonesia', N'299-0299349', N'jtfnho.nghlf@exqyar.org', 35.79)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (55, '2011-07-11 04:06:44.410', N'Marco0', N'Olga', N'Schmidt', N'587 Cowley Avenue', N'Fremont', N'Wyoming', N'93528', N'China', N'713-056-0087', N'ushavurj.chlwoxyc@xcepao.org', 19.69)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (56, '2012-04-06 22:09:38.360', N'Rick7', N'Byron', N'Beasley', N'478 North New Drive', N'Mobile', N'Rhode Island', N'03009', N'Azerbaijan', N'4692019805', N'bjwtgqk.nvzwwlbcqm@sazxver.qyfrkh.com', 57.23)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (57, '2012-07-11 20:53:46.720', N'Chanda43', N'Dante', N'Cohen', N'99 White Old Avenue', N'St. Paul', N'Montana', N'82185', N'United States', N'7824087342', N'jbulsx740@mkbtwi.com', 54.33)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (58, '2010-09-04 01:54:57.380', N'Shannon84', N'Edward', N'Caldwell', N'373 West White Nobel Road', N'Cleveland', N'Ohio', N'79623', N'Aruba', N'042-336-7981', N'wkmt55@ozotpsx.vpsbkc.net', 49.39)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (59, '2010-01-12 21:22:29.720', N'Nora1', N'Leah', N'Marquez', N'36 Old Avenue', N'Newark', N'Louisiana', N'74078', N'Ukraine', N'251278-3834', N'dndxozc.qhrjovr@lrouvkwfn.dtziuz.org', 56.14)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (60, '2012-08-30 01:51:00.880', N'Anita50', N'Roland', N'Todd', N'84 Oak Avenue', N'New York', N'Oklahoma', N'28336', N'Kiribati', N'969569-3124', N'llwpxzfy227@krhujr.-ilhkt.com', 46.33)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (61, '2012-08-31 04:14:16.110', N'Hilary', N'Thomas', N'Ramirez', N'35 North Nobel Street', N'Louisville', N'Texas', N'48678', N'Bhutan', N'526-1153587', N'xkju187@wzqyfz.org', 43.32)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (62, '2011-11-18 01:54:11.070', N'April864', N'Joy', N'Spencer', N'53 Nobel Blvd.', N'Houston', N'California', N'56395', N'Greenland', N'4011025665', N'ormevjsk.ooliliwxzw@umeuut.com', 20.98)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (63, '2011-06-05 12:59:35.270', N'Beth', N'Beth', N'Riley', N'130 Rocky Old St.', N'Detroit', N'North Dakota', N'13074', N'Grenada', N'044111-7010', N'fijqbhl4@qtfacn.com', 58.18)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (64, '2010-07-17 21:58:14.380', N'Ruben29', N'Ramiro', N'Palmer', N'529 Green Oak Parkway', N'Yonkers', N'Vermont', N'27915', N'Russia', N'9813954062', N'bjzfoiw.anya@feug.wqiniy.com', 58.24)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (65, '2012-05-28 06:58:49.870', N'Lorena1', N'Kristy', N'Montes', N'310 Cowley Street', N'St. Petersburg', N'Colorado', N'63518', N'Togo', N'5509112886', N'hdrgfaiw074@nxoqnwaw.gjlj-k.net', 13.74)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (66, '2011-12-12 07:34:14.440', N'Marcia', N'Rodolfo', N'Mason', N'608 Green New Blvd.', N'Mobile', NULL, N'74673', N'Macao', N'181-7480862', N'rvrvi9@w-rmsk.com', 55.06)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (67, '2012-06-26 18:04:06.830', N'Dallas2', N'Betty', N'Gomez', N'83 East Old Avenue', N'Garland', N'Vermont', N'00177', N'Vanuatu', N'149203-8622', N'quic23@oywxhm.org', 18.33)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (68, '2011-11-08 06:32:03.470', N'Jeanne798', N'Everett', N'Preston', N'940 Clarendon Road', N'San Antonio', N'New Hampshire', N'18845', N'Zambia', N'418585-1631', N'ukeqv.vdwqu@zeuaho.com', 44.37)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (69, '2012-06-05 15:34:10.770', N'Jonathon', N'Eva', N'Chang', N'11 First Way', N'Madison', N'Hawaii', N'85321', N'Fiji', N'048891-0562', N'oaiylvd.flcqaq@rijd.rdbmzr.org', 54.41)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (70, '2012-03-30 06:13:43.720', N'Darrin8', N'Paige', N'Ayers', N'52 South Oak Way', N'New York', N'North Dakota', N'33330', N'Belgium', N'015-9072957', N'emakwei.xsedljpkz@apfffc.org', 21.03)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (71, '2010-07-09 14:58:24.990', N'Claude199', N'Daphne', N'Bruce', N'194 South Green Hague Avenue', N'Shreveport', N'Washington', N'34822', N'Mauritius', N'661-3764962', N'wywlwlay147@lrzhgv.bzcifo.org', 63.92)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (72, '2010-06-29 21:56:50.680', N'Taryn', N'Marc', N'Paul', N'308 East First Drive', N'Indianapolis', N'South Carolina', N'03936', N'Belgium', N'913-9029697', N'eswea237@mfvdbxc.pgwaih.net', 35.43)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (73, '2011-11-01 20:27:14.630', N'Rita835', N'Joan', N'Wright', N'13 White Cowley Parkway', N'Memphis', N'Wisconsin', N'94939', N'Fiji', NULL, N'infl.bloodgkk@vj-xd-.org', 44.82)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (74, '2011-09-04 06:59:15.360', N'Deanna29', N'Juanita', N'Miller', N'72 First Avenue', N'Greensboro', N'New Mexico', N'42703', N'Gambia', N'834346-2572', N'mkexwvv.eyvnzre@ontwlfq.eyhxsh.org', 48.53)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (75, '2010-11-03 13:04:58.950', N'Marty', N'Darlene', N'Ferguson', N'349 Green Cowley Way', N'Spokane', N'Maryland', N'74364', N'Ethiopia', N'0450635425', N'yied.smufm@vswttk.net', 53.46)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (76, '2012-02-14 10:00:23.950', N'Jeanette', N'Jeff', N'Klein', N'656 Old Freeway', N'Columbus', N'Maryland', N'37064', N'Nepal', N'688147-5505', N'qzzhoq.nlqppbjz@wuhbf.vfiekd.net', 14.53)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (77, '2010-05-12 13:35:43.080', N'Trent', N'Brad', N'Romero', N'45 Milton Road', N'Sacramento', N'Alaska', N'78684', N'Macedonia', N'439-511-2044', N'liii@vchuvflvj.tzozfo.net', 49.04)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (78, '2011-10-25 13:46:50.200', N'Dominic', N'Tammi', N'Farley', N'773 White Clarendon Avenue', N'Detroit', N'Washington', N'54992', N'Brazil', N'911-360-5638', N'ligryjn.hsaudutzf@wpunvo.com', 48.46)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (79, '2010-05-27 10:12:27.550', N'Sheila3', N'Vicky', N'Valencia', N'48 New Way', N'Buffalo', N'Florida', N'90368', N'Portugal', N'567-240-5685', N'hmct.ksvd@hcbe.hbpdv-.org', 15.88)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (80, '2010-02-04 09:40:34.720', N'Nicolas', N'Catherine', N'Vance', N'140 Rocky Second Freeway', N'Bakersfield', N'Alabama', N'73054', N'San Marino', NULL, N'jjvn.jynlr@mvtc.vavcuo.com', 58.72)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (81, '2011-10-01 19:32:40.000', N'Latisha1', N'Jodie', N'Huff', N'77 White Hague Blvd.', N'Denver', N'California', N'73980', N'Bangladesh', N'0933367366', N'nmvumm@oechuz.qizcvg.net', 19.38)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (82, '2010-04-16 07:55:31.960', N'Brandi0', N'Laura', N'Savage', N'169 White Nobel Drive', N'Baltimore', N'Kentucky', N'33966', N'Sweden', N'983621-5109', N'xeayfohx91@ec-gee.net', 35.18)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (83, '2010-09-14 19:35:35.390', N'Lydia6', N'Nicolas', N'Shah', N'89 South New Way', N'Milwaukee', N'Mississippi', N'06854', N'Japan', N'6745251921', N'ogwk636@sohb.zaggvz.net', 38.70)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (84, '2012-08-05 14:36:12.450', N'Henry583', N'Gabrielle', N'Reese', N'99 First St.', N'Tucson', N'Florida', N'37256', N'Botswana', N'883-7318805', N'ardv0@bptbuk.org', 26.87)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (85, '2012-07-26 22:14:53.210', N'Israel', N'Alvin', N'Young', N'723 West Cowley Boulevard', N'Lubbock', N'Maryland', N'77928', N'Latvia', N'136-098-6249', N'zqsealx219@oi-jla.net', 45.85)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (86, '2012-08-22 19:57:35.140', N'Kerry469', N'Erik', N'Sexton', N'553 White Second Way', N'Riverside', N'Tennessee', N'21480', N'Grenada', N'600-678-3646', N'cchnmrhx2@jerz.esbgzt.com', 34.72)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (87, '2010-01-15 03:37:47.460', N'Billy378', N'Gabriel', N'Lin', N'487 Green New Street', N'Sacramento', N'California', N'37305', N'Georgia', N'7207219929', N'bkclzalu.wnzfvd@sodffi.evaavc.com', 54.78)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (88, '2012-02-19 16:56:41.660', N'Allen47', N'Dean', N'Stevenson', N'58 Old Boulevard', N'Louisville', N'Montana', N'83325', N'Hong Kong', N'491-778-3423', N'jqwu.fobvnv@zxzelbaz.et-tdj.net', 53.44)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (89, '2012-02-23 06:43:14.790', N'Ross5', N'Kari', N'Banks', N'74 Green New Blvd.', N'Anchorage', N'Idaho', N'92812', N'Indonesia', N'441-418-3949', N'niqpo.jwmzbkrm@wcbqql.net', 52.59)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (90, '2012-07-02 01:23:54.490', N'Jenna222', N'Dwayne', N'Hunter', N'239 Rocky Fabien Road', N'Mobile', N'Wyoming', N'42751', N'Luxembourg', N'759449-0397', N'vraswbe958@zquooa.net', 50.99)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (91, '2011-12-31 22:55:50.070', N'Bruce11', N'Noel', N'Drake', N'97 Rocky First Road', N'Columbus', N'Pennsylvania', N'81473', N'Belize', N'307-578-2097', N'nhcwhg.wvtfthhqal@frzbfl.org', 60.49)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (92, '2012-01-05 22:11:06.330', N'Chadwick330', N'Jocelyn', N'Peters', N'88 Green Old Avenue', N'Portland', N'Maine', N'61681', N'Moldova', N'828856-0484', N'wcxvmk@txrccq.org', 25.19)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (93, '2010-11-12 19:30:32.920', N'Dexter', N'Dylan', N'Gonzalez', N'18 Second Blvd.', N'St. Louis', N'Indiana', N'53237', N'Suriname', N'021310-9651', N'rsjeod182@vceeuy.shbnz-.com', 37.71)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (94, '2010-11-14 15:53:30.260', N'Toni49', N'Lori', N'Goodwin', N'922 Clarendon Freeway', N'Jacksonville', N'New York', N'05182', N'Djibouti', NULL, N'adpi.umcro@hfilpj.net', 45.43)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (95, '2011-10-23 05:47:49.120', N'Jimmy957', N'Sylvia', N'Hale', N'560 North Old St.', N'Columbus', N'Oregon', N'20974', N'Bermuda', N'441-7417477', N'nyjs@vennhd.fy-vaq.org', 27.26)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (96, '2010-06-17 05:01:40.850', N'Sonja7', N'Freddie', N'Shea', N'142 Green Second Parkway', N'San Francisco', N'Montana', N'38601', N'Pakistan', N'094980-7169', N'ffijct67@ffqval.glafie.org', 24.74)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (97, '2012-06-12 13:19:57.960', N'Leslie83', N'Pete', N'Wood', N'81 South Rocky Milton Drive', N'Honolulu', N'Wyoming', N'40995', N'Grenada', N'294525-5134', N'npnwekkd.jgvuv@dpv-hd.net', 54.07)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (98, '2012-05-06 03:34:11.890', N'Gwendolyn', N'Zachary', N'Savage', N'77 East Fabien Freeway', N'Lubbock', N'South Dakota', N'51016', N'Trinidad', N'8430275476', N'tvbey.xrnucwydu@zqebmrele.ibekrf.com', 21.21)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (99, '2012-05-11 13:33:00.970', N'Linda665', N'Christian', N'Carlson', N'97 South Rocky Old Way', N'Memphis', N'Idaho', N'41544', N'Seychelles', N'681707-8400', N'jzowfj079@bxfefls.jzmuon.com', 19.25)
INSERT INTO [dbo].[Orders] ([OrderId], [OrderDate], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Email], [Total]) VALUES (100, '2010-05-30 06:39:58.510', N'Bradford477', N'Gabrielle', N'Frazier', N'172 Hague Avenue', N'Jacksonville', N'Massachusetts', N'10874', N'Moldova', N'855370-0268', N'jkqnold.kvwgqknzdi@gmus.zzabqu.com', 12.75)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Artists]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Artists](
	[ArtistId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](120) NULL,
 CONSTRAINT [PK__Artists__25706B50245D67DE] PRIMARY KEY CLUSTERED 
(
	[ArtistId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Artists] ON
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (1, N'AC/DC')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (2, N'Accept')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (3, N'Aerosmith')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (4, N'Alanis Morissette')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (5, N'Alice In Chains')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (6, N'Antônio Carlos Jobim')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (7, N'Apocalyptica')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (8, N'Audioslave')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (10, N'Billy Cobham')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (11, N'Black Label Society')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (12, N'Black Sabbath')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (14, N'Bruce Dickinson')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (15, N'Buddy Guy')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (16, N'Caetano Veloso')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (17, N'Chico Buarque')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (18, N'Chico Science & Nação Zumbi')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (19, N'Cidade Negra')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (20, N'Cláudio Zoli')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (21, N'Various Artists')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (22, N'Led Zeppelin')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (23, N'Frank Zappa & Captain Beefheart')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (24, N'Marcos Valle')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (27, N'Gilberto Gil')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (37, N'Ed Motta')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (41, N'Elis Regina')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (42, N'Milton Nascimento')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (46, N'Jorge Ben')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (50, N'Metallica')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (51, N'Queen')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (52, N'Kiss')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (53, N'Spyro Gyra')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (55, N'David Coverdale')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (56, N'Gonzaguinha')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (58, N'Deep Purple')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (59, N'Santana')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (68, N'Miles Davis')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (72, N'Vinícius De Moraes')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (76, N'Creedence Clearwater Revival')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (77, N'Cássia Eller')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (79, N'Dennis Chambers')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (80, N'Djavan')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (81, N'Eric Clapton')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (82, N'Faith No More')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (83, N'Falamansa')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (84, N'Foo Fighters')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (86, N'Funk Como Le Gusta')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (87, N'Godsmack')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (88, N'Guns N'' Roses')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (89, N'Incognito')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (90, N'Iron Maiden')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (92, N'Jamiroquai')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (94, N'Jimi Hendrix')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (95, N'Joe Satriani')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (96, N'Jota Quest')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (98, N'Judas Priest')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (99, N'Legião Urbana')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (100, N'Lenny Kravitz')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (101, N'Lulu Santos')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (102, N'Marillion')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (103, N'Marisa Monte')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (105, N'Men At Work')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (106, N'Motörhead')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (109, N'Mötley Crüe')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (110, N'Nirvana')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (111, N'O Terço')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (112, N'Olodum')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (113, N'Os Paralamas Do Sucesso')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (114, N'Ozzy Osbourne')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (115, N'Page & Plant')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (117, N'Paul D''Ianno')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (118, N'Pearl Jam')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (120, N'Pink Floyd')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (124, N'R.E.M.')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (126, N'Raul Seixas')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (127, N'Red Hot Chili Peppers')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (128, N'Rush')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (130, N'Skank')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (132, N'Soundgarden')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (133, N'Stevie Ray Vaughan & Double Trouble')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (134, N'Stone Temple Pilots')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (135, N'System Of A Down')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (136, N'Terry Bozzio, Tony Levin & Steve Stevens')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (137, N'The Black Crowes')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (139, N'The Cult')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (140, N'The Doors')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (141, N'The Police')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (142, N'The Rolling Stones')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (144, N'The Who')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (145, N'Tim Maia')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (150, N'U2')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (151, N'UB40')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (152, N'Van Halen')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (153, N'Velvet Revolver')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (155, N'Zeca Pagodinho')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (157, N'Dread Zeppelin')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (179, N'Scorpions')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (196, N'Cake')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (197, N'Aisha Duo')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (200, N'The Posies')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (201, N'Luciana Souza/Romero Lubambo')
GO
print 'Processed 100 total records'
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (202, N'Aaron Goldberg')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (203, N'Nicolaus Esterhazy Sinfonia')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (204, N'Temple of the Dog')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (205, N'Chris Cornell')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (206, N'Alberto Turco & Nova Schola Gregoriana')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (208, N'English Concert & Trevor Pinnock')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (211, N'Wilhelm Kempff')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (212, N'Yo-Yo Ma')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (213, N'Scholars Baroque Ensemble')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (217, N'Royal Philharmonic Orchestra & Sir Thomas Beecham')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (219, N'Britten Sinfonia, Ivor Bolton & Lesley Garrett')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (221, N'Sir Georg Solti & Wiener Philharmoniker')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (223, N'London Symphony Orchestra & Sir Charles Mackerras')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (224, N'Barry Wordsworth & BBC Concert Orchestra')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (226, N'Eugene Ormandy')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (229, N'Boston Symphony Orchestra & Seiji Ozawa')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (230, N'Aaron Copland & London Symphony Orchestra')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (231, N'Ton Koopman')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (232, N'Sergei Prokofiev & Yuri Temirkanov')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (233, N'Chicago Symphony Orchestra & Fritz Reiner')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (234, N'Orchestra of The Age of Enlightenment')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (236, N'James Levine')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (237, N'Berliner Philharmoniker & Hans Rosbaud')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (238, N'Maurizio Pollini')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (240, N'Gustav Mahler')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (242, N'Edo de Waart & San Francisco Symphony')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (244, N'Choir Of Westminster Abbey & Simon Preston')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (245, N'Michael Tilson Thomas & San Francisco Symphony')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (247, N'The King''s Singers')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (248, N'Berliner Philharmoniker & Herbert Von Karajan')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (250, N'Christopher O''Riley')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (251, N'Fretwork')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (252, N'Amy Winehouse')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (253, N'Calexico')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (255, N'Yehudi Menuhin')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (258, N'Les Arts Florissants & William Christie')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (259, N'The 12 Cellists of The Berlin Philharmonic')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (260, N'Adrian Leaper & Doreen de Feis')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (261, N'Roger Norrington, London Classical Players')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (264, N'Kent Nagano and Orchestre de l''Opéra de Lyon')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (265, N'Julian Bream')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (266, N'Martin Roscoe')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (267, N'Göteborgs Symfoniker & Neeme Järvi')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (270, N'Gerald Moore')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (271, N'Mela Tenenbaum, Pro Musica Prague & Richard Kapp')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (274, N'Nash Ensemble')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (276, N'Chic')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (277, N'Anita Ward')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (278, N'Donna Summer')
SET IDENTITY_INSERT [dbo].[Artists] OFF
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Albums]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Albums](
	[AlbumId] [int] IDENTITY(1,1) NOT NULL,
	[GenreId] [int] NOT NULL,
	[ArtistId] [int] NOT NULL,
	[Title] [nvarchar](160) NOT NULL,
	[Price] [numeric](10, 2) NOT NULL,
	[AlbumArtUrl] [nvarchar](1024) NULL CONSTRAINT [DF_Album_AlbumArtUrl]  DEFAULT (N'/Content/Images/placeholder.gif'),
 CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED 
(
	[AlbumId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Albums] ON
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (1, 1, 1, N'For Those About To Rock We Salute You', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (2, 1, 1, N'Let There Be Rock', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (3, 1, 100, N'Greatest Hits', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (4, 1, 102, N'Misplaced Childhood', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (5, 1, 105, N'The Best Of Men At Work', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (7, 1, 110, N'Nevermind', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (8, 1, 111, N'Compositores', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (9, 1, 114, N'Bark at the Moon (Remastered)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (10, 1, 114, N'Blizzard of Ozz', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (11, 1, 114, N'Diary of a Madman (Remastered)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (12, 1, 114, N'No More Tears (Remastered)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (13, 1, 114, N'Speak of the Devil', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (14, 1, 115, N'Walking Into Clarksdale', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (15, 1, 117, N'The Beast Live', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (16, 1, 118, N'Live On Two Legs [Live]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (17, 1, 118, N'Riot Act', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (18, 1, 118, N'Ten', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (19, 1, 118, N'Vs.', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (20, 1, 120, N'Dark Side Of The Moon', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (21, 1, 124, N'New Adventures In Hi-Fi', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (22, 1, 126, N'Raul Seixas', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (23, 1, 127, N'By The Way', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (24, 1, 127, N'Californication', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (25, 1, 128, N'Retrospective I (1974-1980)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (26, 1, 130, N'Maquinarama', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (27, 1, 130, N'O Samba Poconé', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (28, 1, 132, N'A-Sides', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (29, 1, 134, N'Core', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (30, 1, 136, N'[1997] Black Light Syndrome', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (31, 1, 139, N'Beyond Good And Evil', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (33, 1, 140, N'The Doors', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (34, 1, 141, N'The Police Greatest Hits', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (35, 1, 142, N'Hot Rocks, 1964-1971 (Disc 1)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (36, 1, 142, N'No Security', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (37, 1, 142, N'Voodoo Lounge', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (38, 1, 144, N'My Generation - The Very Best Of The Who', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (39, 1, 150, N'Achtung Baby', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (40, 1, 150, N'B-Sides 1980-1990', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (41, 1, 150, N'How To Dismantle An Atomic Bomb', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (42, 1, 150, N'Pop', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (43, 1, 150, N'Rattle And Hum', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (44, 1, 150, N'The Best Of 1980-1990', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (45, 1, 150, N'War', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (46, 1, 150, N'Zooropa', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (47, 1, 152, N'Diver Down', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (48, 1, 152, N'The Best Of Van Halen, Vol. I', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (49, 1, 152, N'Van Halen III', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (50, 1, 152, N'Van Halen', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (51, 1, 153, N'Contraband', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (52, 1, 157, N'Un-Led-Ed', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (54, 1, 2, N'Balls to the Wall', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (55, 1, 2, N'Restless and Wild', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (56, 1, 200, N'Every Kind of Light', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (57, 1, 22, N'BBC Sessions [Disc 1] [Live]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (58, 1, 22, N'BBC Sessions [Disc 2] [Live]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (59, 1, 22, N'Coda', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (60, 1, 22, N'Houses Of The Holy', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (61, 1, 22, N'In Through The Out Door', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (62, 1, 22, N'IV', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (63, 1, 22, N'Led Zeppelin I', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (64, 1, 22, N'Led Zeppelin II', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (65, 1, 22, N'Led Zeppelin III', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (66, 1, 22, N'Physical Graffiti [Disc 1]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (67, 1, 22, N'Physical Graffiti [Disc 2]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (68, 1, 22, N'Presence', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (69, 1, 22, N'The Song Remains The Same (Disc 1)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (70, 1, 22, N'The Song Remains The Same (Disc 2)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (71, 1, 23, N'Bongo Fury', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (72, 1, 3, N'Big Ones', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (73, 1, 4, N'Jagged Little Pill', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (74, 1, 5, N'Facelift', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (75, 1, 51, N'Greatest Hits I', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (76, 1, 51, N'Greatest Hits II', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (77, 1, 51, N'News Of The World', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (78, 1, 52, N'Greatest Kiss', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (79, 1, 52, N'Unplugged [Live]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (80, 1, 55, N'Into The Light', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (81, 1, 58, N'Come Taste The Band', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (82, 1, 58, N'Deep Purple In Rock', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (83, 1, 58, N'Fireball', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (84, 1, 58, N'Machine Head', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (85, 1, 58, N'MK III The Final Concerts [Disc 1]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (86, 1, 58, N'Purpendicular', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (87, 1, 58, N'Slaves And Masters', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (88, 1, 58, N'Stormbringer', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (89, 1, 58, N'The Battle Rages On', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (90, 1, 58, N'The Final Concerts (Disc 2)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (91, 1, 59, N'Santana - As Years Go By', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (92, 1, 59, N'Santana Live', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (93, 1, 59, N'Supernatural', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (94, 1, 76, N'Chronicle, Vol. 1', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (95, 1, 76, N'Chronicle, Vol. 2', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (96, 1, 8, N'Audioslave', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (97, 1, 82, N'King For A Day Fool For A Lifetime', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (98, 1, 84, N'In Your Honor [Disc 1]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (99, 1, 84, N'In Your Honor [Disc 2]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (100, 1, 84, N'The Colour And The Shape', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (101, 1, 88, N'Appetite for Destruction', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (102, 1, 88, N'Use Your Illusion I', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (103, 1, 90, N'A Matter of Life and Death', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
GO
print 'Processed 100 total records'
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (104, 1, 90, N'Brave New World', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (105, 1, 90, N'Fear Of The Dark', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (106, 1, 90, N'Live At Donington 1992 (Disc 1)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (107, 1, 90, N'Live At Donington 1992 (Disc 2)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (108, 1, 90, N'Rock In Rio [CD2]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (109, 1, 90, N'The Number of The Beast', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (110, 1, 90, N'The X Factor', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (111, 1, 90, N'Virtual XI', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (112, 1, 92, N'Emergency On Planet Earth', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (113, 1, 94, N'Are You Experienced?', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (114, 1, 95, N'Surfing with the Alien (Remastered)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (115, 10, 203, N'The Best of Beethoven', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (119, 10, 208, N'Pachelbel: Canon & Gigue', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (122, 10, 211, N'Bach: Goldberg Variations', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (123, 10, 212, N'Bach: The Cello Suites', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (124, 10, 213, N'Handel: The Messiah (Highlights)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (128, 10, 217, N'Haydn: Symphonies 99 - 104', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (130, 10, 219, N'A Soprano Inspired', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (132, 10, 221, N'Wagner: Favourite Overtures', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (134, 10, 223, N'Tchaikovsky: The Nutcracker', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (135, 10, 224, N'The Last Night of the Proms', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (138, 10, 226, N'Respighi:Pines of Rome', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (139, 10, 226, N'Strauss: Waltzes', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (140, 10, 229, N'Carmina Burana', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (141, 10, 230, N'A Copland Celebration, Vol. I', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (142, 10, 231, N'Bach: Toccata & Fugue in D Minor', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (143, 10, 232, N'Prokofiev: Symphony No.1', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (144, 10, 233, N'Scheherazade', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (145, 10, 234, N'Bach: The Brandenburg Concertos', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (147, 10, 236, N'Mascagni: Cavalleria Rusticana', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (148, 10, 237, N'Sibelius: Finlandia', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (152, 10, 242, N'Adams, John: The Chairman Dances', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (154, 10, 245, N'Berlioz: Symphonie Fantastique', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (155, 10, 245, N'Prokofiev: Romeo & Juliet', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (157, 10, 247, N'English Renaissance', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (159, 10, 248, N'Mozart: Symphonies Nos. 40 & 41', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (161, 10, 250, N'SCRIABIN: Vers la flamme', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (163, 10, 255, N'Bartok: Violin & Viola Concertos', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (166, 10, 259, N'South American Getaway', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (167, 10, 260, N'Górecki: Symphony No. 3', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (168, 10, 261, N'Purcell: The Fairy Queen', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (171, 10, 264, N'Weill: The Seven Deadly Sins', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (173, 10, 266, N'Szymanowski: Piano Works, Vol. 1', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (174, 10, 267, N'Nielsen: The Six Symphonies', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (177, 10, 274, N'Mozart: Chamber Music', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (178, 2, 10, N'The Best Of Billy Cobham', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (179, 2, 197, N'Quiet Songs', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (180, 2, 202, N'Worlds', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (181, 2, 27, N'Quanta Gente Veio ver--Bônus De Carnaval', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (182, 2, 53, N'Heart of the Night', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (183, 2, 53, N'Morning Dance', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (184, 2, 6, N'Warner 25 Anos', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (185, 2, 68, N'Miles Ahead', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (186, 2, 68, N'The Essential Miles Davis [Disc 1]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (187, 2, 68, N'The Essential Miles Davis [Disc 2]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (188, 2, 79, N'Outbreak', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (189, 2, 89, N'Blue Moods', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (190, 3, 100, N'Greatest Hits', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (191, 3, 106, N'Ace Of Spades', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (192, 3, 109, N'Motley Crue Greatest Hits', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (193, 3, 11, N'Alcohol Fueled Brewtality Live! [Disc 1]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (194, 3, 11, N'Alcohol Fueled Brewtality Live! [Disc 2]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (195, 3, 114, N'Tribute', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (196, 3, 12, N'Black Sabbath Vol. 4 (Remaster)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (197, 3, 12, N'Black Sabbath', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (198, 3, 135, N'Mezmerize', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (199, 3, 14, N'Chemical Wedding', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (200, 3, 50, N'...And Justice For All', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (201, 3, 50, N'Black Album', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (202, 3, 50, N'Garage Inc. (Disc 1)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (203, 3, 50, N'Garage Inc. (Disc 2)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (204, 3, 50, N'Load', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (205, 3, 50, N'Master Of Puppets', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (206, 3, 50, N'ReLoad', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (207, 3, 50, N'Ride The Lightning', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (208, 3, 50, N'St. Anger', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (209, 3, 7, N'Plays Metallica By Four Cellos', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (210, 3, 87, N'Faceless', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (211, 3, 88, N'Use Your Illusion II', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (212, 3, 90, N'A Real Dead One', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (213, 3, 90, N'A Real Live One', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (214, 3, 90, N'Live After Death', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (215, 3, 90, N'No Prayer For The Dying', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (216, 3, 90, N'Piece Of Mind', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (217, 3, 90, N'Powerslave', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (218, 3, 90, N'Rock In Rio [CD1]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (219, 3, 90, N'Rock In Rio [CD2]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (220, 3, 90, N'Seventh Son of a Seventh Son', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (221, 3, 90, N'Somewhere in Time', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (222, 3, 90, N'The Number of The Beast', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (223, 3, 98, N'Living After Midnight', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (224, 4, 196, N'Cake: B-Sides and Rarities', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (225, 4, 204, N'Temple of the Dog', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (226, 4, 205, N'Carry On', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (227, 4, 253, N'Carried to Dust (Bonus Track Version)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (228, 4, 8, N'Revelations', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (229, 6, 133, N'In Step', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (230, 6, 137, N'Live [Disc 1]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (231, 6, 137, N'Live [Disc 2]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (233, 6, 81, N'The Cream Of Clapton', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (234, 6, 81, N'Unplugged', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
GO
print 'Processed 200 total records'
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (235, 6, 90, N'Iron Maiden', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (238, 7, 103, N'Barulhinho Bom', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (239, 7, 112, N'Olodum', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (240, 7, 113, N'Acústico MTV', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (241, 7, 113, N'Arquivo II', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (242, 7, 113, N'Arquivo Os Paralamas Do Sucesso', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (243, 7, 145, N'Serie Sem Limite (Disc 1)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (244, 7, 145, N'Serie Sem Limite (Disc 2)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (245, 7, 155, N'Ao Vivo [IMPORT]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (246, 7, 16, N'Prenda Minha', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (247, 7, 16, N'Sozinho Remix Ao Vivo', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (248, 7, 17, N'Minha Historia', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (249, 7, 18, N'Afrociberdelia', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (250, 7, 18, N'Da Lama Ao Caos', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (251, 7, 20, N'Na Pista', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (252, 7, 201, N'Duos II', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (253, 7, 21, N'Sambas De Enredo 2001', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (254, 7, 21, N'Vozes do MPB', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (255, 7, 24, N'Chill: Brazil (Disc 1)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (256, 7, 27, N'Quanta Gente Veio Ver (Live)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (257, 7, 37, N'The Best of Ed Motta', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (258, 7, 41, N'Elis Regina-Minha História', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (259, 7, 42, N'Milton Nascimento Ao Vivo', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (260, 7, 42, N'Minas', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (261, 7, 46, N'Jorge Ben Jor 25 Anos', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (262, 7, 56, N'Meus Momentos', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (263, 7, 6, N'Chill: Brazil (Disc 2)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (264, 7, 72, N'Vinicius De Moraes', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (266, 7, 77, N'Cássia Eller - Sem Limite [Disc 1]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (267, 7, 80, N'Djavan Ao Vivo - Vol. 02', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (268, 7, 80, N'Djavan Ao Vivo - Vol. 1', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (269, 7, 81, N'Unplugged', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (270, 7, 83, N'Deixa Entrar', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (271, 7, 86, N'Roda De Funk', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (272, 7, 96, N'Jota Quest-1995', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (274, 7, 99, N'Mais Do Mesmo', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (275, 8, 100, N'Greatest Hits', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (276, 8, 151, N'UB40 The Best Of - Volume Two [UK]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (277, 8, 19, N'Acústico MTV [Live]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (278, 8, 19, N'Cidade Negra - Hits', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (280, 9, 21, N'Axé Bahia 2001', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (281, 9, 252, N'Frank', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (282, 5, 276, N'Le Freak', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (283, 5, 278, N'MacArthur Park Suite', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (284, 5, 277, N'Ring My Bell', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
SET IDENTITY_INSERT [dbo].[Albums] OFF
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[AlbumId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [numeric](10, 2) NOT NULL,
 CONSTRAINT [PK__InvoiceL__0D760AD91DE57479] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (1, 73, 211, 1, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (2, 82, 235, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (3, 77, 221, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (4, 56, 163, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (5, 21, 54, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (6, 56, 163, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (7, 91, 258, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (8, 45, 112, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (9, 98, 278, 1, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (10, 28, 71, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (11, 30, 75, 1, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (12, 47, 123, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (13, 64, 188, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (14, 47, 124, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (15, 99, 280, 1, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (16, 4, 9, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (17, 87, 248, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (18, 100, 283, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (19, 68, 199, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (20, 32, 81, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (21, 82, 234, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (22, 85, 244, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (23, 100, 283, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (24, 4, 10, 1, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (25, 70, 205, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (26, 53, 147, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (27, 94, 266, 1, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (28, 69, 202, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (29, 55, 157, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (30, 9, 21, 1, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (31, 19, 49, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (32, 46, 115, 1, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (33, 30, 77, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (34, 99, 282, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (35, 65, 191, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (36, 77, 220, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (37, 4, 9, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (38, 39, 97, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (39, 35, 88, 1, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (40, 96, 272, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (41, 51, 141, 1, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (42, 72, 209, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (43, 12, 31, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (44, 28, 71, 1, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (45, 91, 259, 1, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (46, 80, 228, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (47, 34, 86, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (48, 46, 119, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (49, 15, 39, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (50, 23, 58, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (51, 42, 104, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (52, 72, 209, 1, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (53, 62, 185, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (54, 49, 135, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (55, 20, 50, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (56, 88, 252, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (57, 83, 239, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (58, 74, 213, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (59, 86, 247, 1, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (60, 68, 200, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (61, 63, 186, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (62, 22, 57, 1, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (63, 90, 256, 1, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (64, 90, 256, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (65, 9, 23, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (66, 84, 242, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (67, 18, 44, 1, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (68, 65, 191, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (69, 83, 239, 1, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (70, 22, 57, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (71, 100, 284, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (72, 49, 132, 1, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (73, 66, 193, 1, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (74, 72, 210, 1, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (75, 81, 233, 1, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (76, 11, 26, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (77, 73, 212, 1, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (78, 72, 209, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (79, 13, 33, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (80, 91, 258, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (81, 19, 49, 1, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (82, 48, 130, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (83, 55, 155, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (84, 33, 84, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (85, 68, 198, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (86, 47, 124, 1, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (87, 84, 241, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (88, 81, 233, 1, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (89, 80, 228, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (90, 77, 221, 1, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (91, 94, 267, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (92, 30, 76, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (93, 53, 145, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (94, 67, 196, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (95, 34, 85, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (96, 29, 74, 1, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (97, 83, 235, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (98, 23, 58, 2, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (99, 19, 48, 3, 8.99)
INSERT INTO [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (100, 7, 18, 1, 8.99)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Carts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Carts](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[CartId] [varchar](50) NOT NULL,
	[AlbumId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[RecordId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Carts] ON
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (1, '09931', 211, 1, '2012-02-18 03:45:51.440')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (2, '34881', 235, 2, '2012-06-26 04:39:59.160')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (3, '42613', 221, 2, '2010-10-09 15:08:30.780')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (4, '60528', 163, 1, '2011-09-18 19:23:07.150')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (5, '45252', 54, 1, '2011-12-12 22:27:17.430')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (6, '12315', 163, 3, '2012-03-30 10:54:10.640')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (7, '72359', 258, 3, '2011-03-31 14:21:36.080')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (8, '12245', 112, 2, '2012-06-15 17:05:34.650')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (9, '04279', 278, 3, '2012-05-05 07:04:37.650')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (10, '67138', 71, 2, '2012-07-25 15:05:53.940')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (11, '78226', 75, 1, '2010-09-17 23:13:21.580')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (12, '83634', 123, 3, '2011-08-11 22:29:54.060')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (13, '71001', 188, 2, '2011-03-04 01:27:21.170')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (14, '29094', 124, 2, '2010-08-26 09:26:11.760')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (15, '44384', 280, 2, '2011-04-05 04:59:15.990')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (16, '13388', 9, 3, '2011-09-22 00:02:17.630')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (17, '29535', 248, 1, '2011-07-01 15:45:43.230')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (18, '66009', 283, 2, '2011-01-26 06:46:25.690')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (19, '35651', 199, 1, '2011-01-19 22:01:39.510')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (20, '57447', 81, 2, '2012-05-16 13:35:01.500')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (21, '59881', 234, 2, '2011-07-23 01:06:38.880')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (22, '79308', 244, 1, '2011-03-01 13:31:54.940')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (23, '09382', 283, 2, '2012-03-25 02:52:28.140')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (24, '73455', 10, 2, '2012-06-09 11:04:43.700')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (25, '26242', 205, 3, '2012-04-07 10:35:47.170')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (26, '68127', 147, 3, '2011-04-15 10:04:54.110')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (27, '38402', 266, 1, '2010-12-09 20:29:41.920')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (28, '33644', 202, 2, '2010-11-02 20:13:57.640')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (29, '57466', 157, 1, '2011-04-13 22:37:56.860')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (30, '89496', 21, 3, '2011-12-31 09:22:14.280')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (31, '73633', 49, 2, '2012-02-15 18:23:03.580')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (32, '08275', 115, 3, '2012-08-04 15:56:21.510')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (33, '27042', 77, 1, '2011-07-14 03:07:00.330')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (34, '27218', 282, 2, '2011-06-27 07:10:30.940')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (35, '50174', 191, 3, '2010-11-28 19:28:40.200')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (36, '13192', 220, 2, '2012-01-10 17:47:16.630')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (37, '30063', 9, 3, '2012-04-04 00:22:58.870')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (38, '98103', 97, 1, '2012-04-14 05:35:44.540')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (39, '34736', 88, 2, '2012-02-25 01:39:19.410')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (40, '35517', 272, 2, '2010-10-08 02:26:35.690')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (41, '83345', 141, 1, '2012-04-14 17:07:41.160')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (42, '33410', 209, 2, '2012-04-09 14:11:28.590')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (43, '06452', 31, 2, '2010-12-03 22:55:37.340')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (44, '35723', 71, 2, '2011-08-06 07:37:12.880')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (45, '98636', 259, 1, '2012-03-29 00:53:05.780')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (46, '31277', 228, 3, '2012-05-23 08:25:32.220')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (47, '24297', 86, 1, '2011-07-26 03:50:21.380')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (48, '51352', 119, 2, '2011-11-03 23:05:39.340')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (49, '47357', 39, 2, '2011-11-12 02:37:05.530')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (50, '56924', 58, 1, '2011-06-26 20:13:11.680')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (51, '49778', 104, 3, '2012-04-09 07:43:26.810')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (52, '93843', 209, 1, '2011-09-28 17:12:09.710')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (53, '73876', 185, 1, '2012-07-06 19:47:23.180')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (54, '74658', 135, 1, '2011-09-13 02:53:50.570')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (55, '38492', 50, 3, '2010-09-20 10:20:09.320')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (56, '00955', 252, 1, '2011-07-20 14:13:56.500')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (57, '27346', 239, 3, '2010-11-02 01:47:31.010')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (58, '20467', 213, 3, '2011-01-01 04:03:47.090')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (59, '38975', 247, 2, '2012-02-12 08:47:19.980')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (60, '08184', 200, 2, '2011-03-30 12:22:23.320')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (61, '49163', 186, 2, '2011-11-20 14:24:28.720')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (62, '72815', 57, 2, '2010-12-27 18:07:38.440')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (63, '83873', 256, 2, '2011-10-03 18:27:37.780')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (64, '47105', 256, 3, '2010-12-04 21:42:23.370')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (65, '13494', 23, 1, '2011-01-08 20:42:50.360')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (66, '53349', 242, 2, '2010-10-15 07:17:00.080')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (67, '75718', 44, 2, '2010-08-29 19:22:53.730')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (68, '52208', 191, 1, '2012-05-08 18:16:50.240')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (69, '22524', 239, 3, '2012-05-29 13:57:31.570')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (70, '74365', 57, 3, '2011-11-25 11:11:59.360')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (71, '88725', 284, 3, '2012-02-18 23:39:18.760')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (72, '44310', 132, 3, '2011-11-18 10:09:58.690')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (73, '13865', 193, 1, '2011-08-03 05:07:06.280')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (74, '11526', 210, 3, '2010-11-12 19:35:03.820')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (75, '03966', 233, 2, '2010-09-01 20:27:20.330')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (76, '20073', 26, 3, '2011-12-14 10:55:10.290')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (77, '62715', 212, 2, '2010-10-27 14:36:17.590')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (78, '80270', 209, 1, '2011-03-20 19:15:15.250')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (79, '80905', 33, 1, '2010-10-12 10:11:37.920')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (80, '45252', 258, 3, '2012-07-17 02:10:14.960')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (81, '28889', 49, 2, '2012-05-22 06:14:32.730')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (82, '74990', 130, 3, '2011-10-07 21:24:02.580')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (83, '60514', 155, 3, '2011-08-23 17:36:52.110')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (84, '92288', 84, 3, '2012-06-19 02:24:45.180')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (85, '51563', 198, 1, '2012-05-24 01:38:47.470')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (86, '60058', 124, 1, '2010-12-19 01:10:53.860')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (87, '59130', 241, 2, '2010-08-29 20:08:58.320')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (88, '18064', 233, 3, '2012-07-02 00:13:09.760')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (89, '83076', 228, 2, '2011-05-07 20:50:21.610')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (90, '94933', 221, 2, '2012-01-11 05:14:43.710')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (91, '30113', 267, 2, '2011-10-09 15:59:45.610')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (92, '21175', 76, 1, '2011-11-02 20:19:11.780')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (93, '36266', 145, 2, '2010-10-01 20:48:24.560')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (94, '48707', 196, 1, '2011-06-28 13:16:56.090')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (95, '79405', 85, 3, '2011-07-20 12:02:06.980')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (96, '82649', 74, 3, '2011-11-17 23:00:02.710')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (97, '59513', 235, 1, '2011-02-05 19:43:50.800')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (98, '31763', 58, 3, '2012-08-31 01:13:13.980')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (99, '62788', 48, 1, '2011-02-26 10:54:22.520')
INSERT INTO [dbo].[Carts] ([RecordId], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (100, '93314', 18, 2, '2012-01-13 17:36:05.690')
SET IDENTITY_INSERT [dbo].[Carts] OFF
SET ANSI_PADDING OFF
GO
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Album_AlbumArtUrl]') AND parent_object_id = OBJECT_ID(N'[dbo].[Albums]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Album_AlbumArtUrl]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Albums] ADD  CONSTRAINT [DF_Album_AlbumArtUrl]  DEFAULT (N'/Content/Images/placeholder.gif') FOR [AlbumArtUrl]
END


End
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Album__ArtistId__276EDEB3]') AND parent_object_id = OBJECT_ID(N'[dbo].[Albums]'))
ALTER TABLE [dbo].[Albums]  WITH NOCHECK ADD  CONSTRAINT [FK__Album__ArtistId__276EDEB3] FOREIGN KEY([ArtistId])
REFERENCES [dbo].[Artists] ([ArtistId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Album__ArtistId__276EDEB3]') AND parent_object_id = OBJECT_ID(N'[dbo].[Albums]'))
ALTER TABLE [dbo].[Albums] CHECK CONSTRAINT [FK__Album__ArtistId__276EDEB3]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Album_Genre]') AND parent_object_id = OBJECT_ID(N'[dbo].[Albums]'))
ALTER TABLE [dbo].[Albums]  WITH NOCHECK ADD  CONSTRAINT [FK_Album_Genre] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genres] ([GenreId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Album_Genre]') AND parent_object_id = OBJECT_ID(N'[dbo].[Albums]'))
ALTER TABLE [dbo].[Albums] CHECK CONSTRAINT [FK_Album_Genre]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cart_Album]') AND parent_object_id = OBJECT_ID(N'[dbo].[Carts]'))
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Album] FOREIGN KEY([AlbumId])
REFERENCES [dbo].[Albums] ([AlbumId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cart_Album]') AND parent_object_id = OBJECT_ID(N'[dbo].[Carts]'))
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Cart_Album]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__InvoiceLi__Invoi__2F10007B]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetails]'))
ALTER TABLE [dbo].[OrderDetails]  WITH NOCHECK ADD  CONSTRAINT [FK__InvoiceLi__Invoi__2F10007B] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__InvoiceLi__Invoi__2F10007B]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetails]'))
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK__InvoiceLi__Invoi__2F10007B]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDetail_Album]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetails]'))
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Album] FOREIGN KEY([AlbumId])
REFERENCES [dbo].[Albums] ([AlbumId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDetail_Album]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetails]'))
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetail_Album]
GO
