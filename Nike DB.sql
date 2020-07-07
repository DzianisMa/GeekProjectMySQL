drop database if exists nike;
create database nike;
use nike;

-- 1 
drop table if exists users; -- –ø–æ–ª—å–∑–æ–≤–∞—Ç–µ–ª–∏
create table users(
	id SERIAL primary key,
	firstname VARCHAR(50),
	lastname VARCHAR(50),
	gender CHAR(1),
	birthday DATETIME,
	hometown VARCHAR(100),
	email VARCHAR(100)unique,
	phone BIGINT,
	userSize CHAR(1),
	created_at DATETIME default NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	index users_phone_idx(phone),
	index users_names_idx(firstname, lastname)
);


-- 2
drop table if exists brendName; -- –±—Ä–µ–Ω–¥
create table brendName(
	id SERIAL primary key,
	brendName VARCHAR(50)
);


-- 3
drop table if exists sportType; -- –≤–∏–¥ —Å–ø–æ—Ä—Ç–∞
create table sportType(
	id SERIAL primary key,
	sportType VARCHAR(50)
);	


-- 4
drop table if exists catalogs; -- –≤–∏–¥ –æ–¥–µ–∂–¥—ã 
create table catalogs(
  	id SERIAL PRIMARY KEY,
  	name VARCHAR(255),
  	UNIQUE unique_name(name(10))
);


-- 5 
drop table if exists color; -- —Ü–≤–µ—Ç
create table color(
	id SERIAL primary key,
	color VARCHAR(50)
);


-- 6
drop table if exists productSize; -- —Ä–∞–∑–º–µ—Ä –æ–¥–µ–∂–¥—ã
create table productSize(
	id SERIAL primary key,
	productSize CHAR(1)
); 


-- 7
drop table if exists collection; -- –∫–æ–ª–ª–µ–∫—Ü–∏—è
create table collection(
	id SERIAL primary key,
	collection VARCHAR(50)
);


-- 8
drop table if exists products; -- –ø—Ä–æ–¥—É–∫—Ç
create table products (
  	id SERIAL PRIMARY KEY,
  	catalog_id BIGINT UNSIGNED,
  	gender CHAR(1),
  	price DECIMAL (11,2),
  	productSize_id BIGINT UNSIGNED,
  	color_id BIGINT UNSIGNED,
  	sportType_id BIGINT UNSIGNED,
  	brendName_id BIGINT UNSIGNED,
  	collection_id BIGINT UNSIGNED,
  	newOrOld char(1),
  	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  	key index_of_catalog_id (catalog_id),
  	foreign key (sportType_id) references sportType(id),
  	foreign key (brendName_id) references brendName(id),
  	foreign key (collection_id) references collection(id),
  	foreign key (color_id) references color(id),
  	foreign key (productSize_id) references productSize(id)
 );


-- 9
drop table if exists orders; -- –∑–∞–∫–∞–∑
create table orders (
  	id SERIAL PRIMARY KEY,
  	users_id BIGINT UNSIGNED,
  	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 	foreign key (users_id) references users(id)
);


-- 10
drop table if exists orders_products; -- —Å–æ–¥–µ—Ä–∂–∞–Ω–∏–µ –∑–∞–∫–∞–∑–∞
create table orders_products (
 	id SERIAL PRIMARY KEY,
 	orders_id BIGINT UNSIGNED,
 	products_id BIGINT UNSIGNED,
 	total INT UNSIGNED DEFAULT 1,
 	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 	foreign key (orders_id) references orders(id),
 	foreign key (products_id) references products(id)
 );


-- 11 
drop table if exists discounts; -- —Å–∫–∏–¥–∫–∏
create table discounts (
  	id SERIAL PRIMARY KEY,
  	user_id INT UNSIGNED,
  	products_id BIGINT UNSIGNED,
  	discount FLOAT UNSIGNED,
  	started_at DATETIME,
  	finished_at DATETIME,
  	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 	key index_of_user_id(user_id),
  	key index_of_products_id(products_id),
  	foreign key (products_id) references products(id)
  );


-- 12
drop table if exists storehouses; -- —Å–∫–ª–∞–¥
create table storehouses (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


-- 13
drop table if exists storehouses_products;
create table storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id BIGINT UNSIGNED,
  product_id BIGINT UNSIGNED,
  value INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  foreign key (storehouse_id) references storehouses(id),
  foreign key (product_id) references products(id)
);

-- «‡‰‡ÌËÂ 4


-- «‡‰‡ÌËÂ 5

INSERT INTO `users` VALUES ('1','Lucinda','Bins','f','1991-04-15 21:23:11','New Pierce','luettgen.adrian@example.org','319','S','1984-08-01 15:34:13','1972-07-09 00:33:44'),
('2','Erica','Daniel','m','2012-02-11 16:33:49','Jaidenbury','elisabeth13@example.com','0','S','1994-04-16 22:51:43','1972-04-13 08:24:47'),
('3','Janet','Ebert','f','2011-09-14 15:22:52','Lake Shaunberg','ellie.graham@example.com','81','L','1997-01-19 16:10:02','1995-07-07 17:14:00'),
('4','Arjun','Price','m','1993-02-24 02:02:13','Welchtown','muller.brice@example.com','13','M','2004-07-18 18:02:52','2011-12-19 01:17:50'),
('5','Sibyl','Carroll','m','2020-06-15 09:50:59','Port Frederiktown','olga16@example.net','0','','2015-01-30 06:22:06','1983-05-16 14:58:39'),
('6','Princess','Waters','m','1977-12-23 23:40:47','Port Kaelynhaven','strosin.autumn@example.net','0','L','1997-10-31 12:11:27','1971-12-12 15:16:26'),
('7','Lenna','Deckow','m','1978-10-20 15:04:06','Jacobsonmouth','akeem46@example.com','0','S','1999-12-11 15:01:51','1980-08-17 14:43:19'),
('8','Damien','Lakin','f','1994-04-09 10:30:51','South Kelton','imelda.weber@example.net','1','S','2020-02-18 15:33:38','1979-02-15 22:25:33'),
('9','Rolando','Murazik','m','1978-08-04 01:49:12','Joneston','fwisozk@example.net','479224','S','2008-07-02 12:13:32','1979-10-12 10:01:09'),
('10','Antonia','Frami','m','1983-05-26 14:27:24','Fritschbury','elyssa53@example.org','235','','2014-06-13 21:55:31','1992-04-07 19:25:49'),
('11','Kaitlyn','Marvin','f','1974-06-22 05:29:20','Port Berenicestad','armstrong.ahmed@example.com','1','L','2003-09-12 04:30:34','2013-09-22 01:02:59'),
('12','Keshaun','Upton','m','1982-08-24 12:03:40','West Titus','qkohler@example.org','552','S','2003-03-17 15:38:17','2010-10-16 14:25:49'),
('13','Ignacio','Kutch','f','2008-03-04 07:34:22','Kuhlmanshire','ostokes@example.org','0','L','2001-08-21 18:30:52','2018-11-25 08:02:58'),
('14','Lizzie','Padberg','f','2005-06-17 18:49:48','Farrellport','mazie.larkin@example.com','0','L','1994-01-01 03:59:59','2017-04-29 16:50:33'),
('15','Shakira','Conn','f','2004-02-28 11:19:56','South Zaria','jalen76@example.net','2770228506','M','2006-11-26 12:08:52','1984-09-28 20:09:14'),
('16','Josiah','O\'Connell','f','1979-06-24 05:40:05','Aprilhaven','xlang@example.org','277','X','1983-05-06 13:57:02','2002-02-07 17:44:30'),
('17','Cathrine','Huels','m','1971-04-27 01:03:29','Thompsonstad','alaina82@example.org','365993','S','1988-01-22 14:04:17','2004-09-11 17:25:18'),
('18','Rogelio','Lehner','m','1980-02-18 01:32:16','New Carolanne','renner.axel@example.net','18','M','2012-11-24 14:42:26','2015-01-25 06:55:19'),
('19','Lacey','Gutmann','f','1987-02-24 15:42:45','Mannmouth','bgaylord@example.net','1','L','2008-11-20 11:46:20','1987-10-14 10:25:35'),
('20','Gerry','Halvorson','f','1975-03-17 22:46:49','Fordberg','trevor69@example.com','983445','','1999-12-06 01:11:59','1978-06-01 07:19:12'),
('21','Isobel','Dickinson','m','1997-07-14 14:43:33','West Vallie','sean68@example.org','330619','L','1982-04-23 22:47:34','2007-01-15 19:27:26'),
('22','Clotilde','Vandervort','m','1986-08-19 23:41:57','Owenstad','qconn@example.org','1','L','2003-03-19 22:08:05','1975-03-23 16:59:20'),
('23','Esperanza','Luettgen','m','2013-11-21 22:57:27','South Raphael','dexter30@example.org','627','M','2003-07-30 00:16:34','2001-02-01 18:37:42'),
('24','Thad','Braun','m','1978-09-22 04:59:57','East Evelynland','ryleigh.crist@example.com','538','','1993-03-30 03:17:32','1986-04-15 22:22:06'),
('25','Molly','Feest','f','2007-04-22 02:51:35','West Alexandroville','ayana.fahey@example.org','286','L','1994-03-27 23:01:45','2009-08-17 12:38:25'),
('26','Johanna','Boyle','f','1997-07-26 16:11:03','Shanahanville','uparisian@example.com','564','X','2015-04-29 21:34:35','1996-08-26 19:35:38'),
('27','Taylor','Cremin','m','2005-03-25 03:25:33','Chelseatown','billy.harber@example.com','0','','2018-12-06 04:52:43','1999-12-20 16:30:04'),
('28','Demario','Zemlak','f','1983-06-23 10:55:46','East Elyssa','fabian67@example.com','99','M','1975-02-04 03:30:23','1978-06-18 17:56:38'),
('29','Gwendolyn','Mayer','m','1978-09-07 19:40:45','North Marjorystad','green03@example.org','5121542143','','2006-02-22 16:47:08','1999-09-01 18:48:17'),
('30','Van','Predovic','f','1976-01-28 00:52:00','West Stefanmouth','pkoepp@example.org','50','M','2006-05-30 11:07:40','2017-07-01 18:50:27'),
('31','Jordyn','Daniel','f','1991-10-25 16:47:29','South Garnet','yschaefer@example.com','911','M','2003-07-09 20:30:42','2004-05-11 20:27:57'),
('32','Genevieve','Mills','m','1995-08-11 11:06:16','West Goldaside','rippin.craig@example.org','1','','2013-04-29 22:59:33','1970-09-18 06:18:23'),
('33','Lester','Funk','m','2008-07-05 09:00:35','Krystalville','ydibbert@example.net','0','','1993-09-19 07:30:35','2000-04-28 15:35:22'),
('34','Cullen','Bernhard','f','1989-07-14 22:47:44','Port Sydneemouth','lgorczany@example.com','33','L','1971-09-21 09:17:30','2018-08-03 01:15:31'),
('35','Jerald','Collier','f','2008-09-01 12:59:55','East Garret','hsmith@example.net','1','','1991-03-02 07:39:35','1984-03-02 19:25:54'),
('36','Thaddeus','Hagenes','m','2002-02-27 17:40:32','South Alvina','yessenia39@example.com','0','M','1980-03-02 10:20:11','1979-03-23 11:50:12'),
('37','Aliza','Olson','m','1999-02-04 02:22:40','Christelleland','shannon.labadie@example.net','0','M','1994-12-08 11:19:14','2014-07-12 07:17:16'),
('38','Bradley','Lang','f','2003-09-29 17:04:31','New Kassandra','reese72@example.net','415','M','1973-07-21 02:43:57','1971-06-08 09:10:24'),
('39','Trever','Rodriguez','f','2012-08-21 15:33:38','Saigebury','mayer.frederique@example.net','1','M','2003-12-04 19:49:00','1998-06-12 06:25:13'),
('40','Lawrence','Price','m','1981-07-20 06:44:55','Julioport','toney.mosciski@example.org','0','','2013-07-29 00:15:01','1982-06-04 03:28:34'),
('41','Janick','Rutherford','m','1998-01-04 08:51:42','West Lydabury','marta46@example.net','528','L','1980-07-26 14:56:13','1975-03-27 18:00:29'),
('42','Lucie','West','m','2006-11-24 03:29:32','Strackebury','giuseppe62@example.net','6738507076','L','2002-02-18 12:51:42','1972-04-11 23:02:06'),
('43','Otto','Gerlach','f','2006-08-03 21:50:19','Bahringerhaven','smitham.cathryn@example.net','4246145147','M','2007-10-06 03:01:18','1987-04-05 20:37:06'),
('44','Myrtis','Kassulke','f','2016-12-21 11:42:48','Johnsonport','savannah40@example.com','1','','2013-10-18 01:39:57','2011-01-31 03:18:33'),
('45','Kiara','Feil','m','2017-11-01 14:33:46','Sengerchester','monahan.rodolfo@example.org','517900','X','1994-03-21 17:39:18','2008-10-18 15:10:10'),
('46','Jalen','Dibbert','m','1978-11-09 21:56:06','Samantaberg','ramon28@example.com','0','','2017-01-28 17:12:39','2007-11-03 18:24:05'),
('47','Dessie','Zieme','f','1986-10-16 23:58:44','Martamouth','loy.waters@example.com','584836536','','1998-07-02 17:36:45','2009-07-05 08:06:35'),
('48','Bradford','Mayer','f','2004-04-05 04:24:52','West Domenic','wolff.tressa@example.net','852587','X','1979-12-21 08:24:37','1993-01-16 04:26:33'),
('49','Aric','Collins','m','1999-12-27 00:16:16','Watsicaberg','anibal75@example.com','0','L','2013-07-20 21:06:28','1986-10-26 16:38:45'),
('50','Gustave','Ryan','f','2003-05-31 05:46:59','Kautzerfort','o\'connell.lee@example.net','124','','1982-08-16 16:55:30','2012-08-05 14:44:47'),
('51','Jovany','Lang','f','1988-06-15 20:40:36','New Jewel','zzieme@example.net','0','M','1981-07-25 09:28:31','2018-09-01 15:47:22'),
('52','Darrel','Gorczany','f','1991-11-02 00:24:16','Bartolettiton','qjacobs@example.com','1','S','1976-01-23 18:00:32','2008-02-09 07:31:57'),
('53','Maud','Heller','f','1970-10-27 02:02:05','Conroyfurt','otha.cormier@example.net','206653','L','1981-06-22 06:17:31','2017-11-01 21:13:16'),
('54','Ardella','Goldner','m','2000-10-19 21:50:40','Paucekland','braun.katrine@example.net','4346','X','1993-09-02 15:07:11','1972-03-17 20:24:58'),
('55','Landen','Upton','m','1984-05-11 06:29:55','Gerdahaven','pablo16@example.net','1','S','1970-03-08 03:51:55','1976-10-19 23:20:03'),
('56','Everett','Gutkowski','f','2012-06-01 09:00:52','Herminioside','acasper@example.net','0','','2009-06-09 17:01:35','1996-11-20 10:02:35'),
('57','Katharina','Sporer','f','1974-09-07 20:30:56','East Stanville','batz.gloria@example.com','43','X','2008-05-20 03:08:14','2012-09-16 23:58:05'),
('58','Ashlynn','Kris','f','2001-10-09 04:22:24','Port Mathias','dallin94@example.net','0','','2009-02-17 16:02:14','2012-07-14 15:26:08'),
('59','Deion','Sipes','m','2005-11-17 15:31:56','Eldredside','tking@example.org','3081728691','S','2004-08-30 00:57:08','2006-01-31 18:37:16'),
('60','Bailey','Dickens','f','1973-11-25 06:57:29','New Geraldstad','bartoletti.luigi@example.com','857','M','1996-05-05 07:50:58','1989-03-06 21:33:43'),
('61','Rocky','Hintz','m','2017-05-13 13:11:22','New Antonette','schmitt.joanie@example.org','0','X','2015-09-10 05:09:58','1981-06-10 11:30:43'),
('62','Ulises','McKenzie','m','2013-03-18 08:23:07','South Tia','wolf.paige@example.net','1','','1996-02-10 17:48:12','2009-10-17 15:35:55'),
('63','Katherine','Ferry','f','1979-01-03 12:59:35','Schoenberg','ureynolds@example.net','1','S','1978-05-11 16:07:35','1998-05-26 14:55:27'),
('64','Luis','Greenfelder','f','2012-12-25 01:05:32','Elisabethton','zmiller@example.org','0','X','1980-11-28 12:41:18','2011-04-24 19:34:36'),
('65','Mafalda','Gulgowski','f','2001-11-24 02:39:35','New Rydertown','onienow@example.net','114797','X','2000-10-15 15:34:07','1976-07-01 02:22:44'),
('66','Jameson','Adams','f','1991-08-01 04:11:34','Croninville','bernice.weimann@example.org','862','S','1993-10-10 10:24:14','1989-12-04 08:55:57'),
('67','Katelyn','Steuber','f','2020-05-12 19:34:32','Lake Federico','fredrick40@example.org','0','M','1984-12-17 11:17:19','1982-10-26 21:05:36'),
('68','Stephen','Dicki','f','1977-05-31 17:34:55','Florenciomouth','thessel@example.com','875','M','1978-01-03 04:12:29','2011-07-08 12:34:59'),
('69','Gudrun','Bradtke','f','2012-12-14 23:50:53','Ashahaven','merl83@example.net','9674696723','L','2009-10-19 08:37:48','2011-11-30 21:15:26'),
('70','Barry','Murray','m','1991-08-11 07:47:48','Port Camillaville','jerrell79@example.net','0','S','1983-01-17 15:03:54','1983-05-01 08:43:15'),
('71','Johnson','Wintheiser','m','1997-04-28 15:43:33','O\'Haraland','mellie.o\'connell@example.com','741381','X','2006-09-04 12:58:16','1989-01-24 12:50:11'),
('72','Lora','Ratke','m','2014-09-11 18:18:00','Zettaside','claude.russel@example.org','127','S','1971-10-17 20:27:28','1997-05-10 05:06:30'),
('73','Alena','Sauer','f','1976-03-03 02:36:17','Volkmanburgh','kenna36@example.com','996304','M','1979-04-13 19:09:26','1988-05-07 20:19:32'),
('74','Brook','Balistreri','f','2017-07-31 09:43:36','East Kennediborough','wkautzer@example.org','200','M','1985-01-30 15:22:29','1979-08-14 20:38:26'),
('75','Marielle','Shields','m','2015-05-30 11:36:56','West Frederic','casper.brant@example.com','1','','2004-03-24 12:30:17','2007-09-27 06:43:48'),
('76','June','Herzog','m','2000-01-06 08:55:33','West Betsyfurt','gruecker@example.net','0','S','2008-07-22 05:00:53','1992-02-09 14:10:26'),
('77','Herta','Corkery','f','2017-03-22 11:22:08','New Eliseoborough','jordane.pfannerstill@example.com','0','','2001-08-11 16:10:31','1997-10-28 06:44:46'),
('78','Cameron','Leffler','m','1994-02-17 02:58:39','West Fay','giovanny.wilkinson@example.org','1','X','1994-01-12 08:44:13','2012-04-18 08:06:54'),
('79','Dana','Mohr','f','1984-08-29 03:10:53','East Crystaltown','o\'kon.emilia@example.net','92','X','2019-05-12 23:39:54','1989-02-21 14:39:43'),
('80','Scarlett','Schamberger','f','2016-12-02 08:24:53','New Justusstad','hardy.swaniawski@example.org','0','X','1975-08-24 10:59:09','1995-02-04 17:03:01'),
('81','Julie','Welch','f','2005-06-13 02:13:32','Williamsonfurt','deja69@example.com','1','L','1993-07-09 01:46:48','1991-10-19 21:51:51'),
('82','Cora','McCullough','m','1982-07-25 02:10:59','Kohlerview','aliza.marks@example.com','715889','X','2016-07-22 22:04:24','1978-01-10 07:47:36'),
('83','Jerry','Douglas','f','2015-12-08 03:02:51','East Antonio','sydnie71@example.com','593','X','1971-01-22 11:45:07','1999-01-19 13:36:24'),
('84','Abdullah','Casper','f','1977-06-09 21:46:19','South Milofurt','shamill@example.org','1','X','2017-04-24 18:31:12','2016-06-18 13:47:03'),
('85','Theresia','Carroll','f','2018-04-26 11:35:18','West Moniquetown','jzboncak@example.net','0','','1972-09-11 21:52:15','1990-12-18 04:59:40'),
('86','Jacynthe','Stark','f','2005-04-29 03:35:31','Patrickstad','eino28@example.com','937','L','1975-12-01 09:02:40','2003-03-13 00:07:06'),
('87','Jasen','Brakus','m','1981-08-26 01:52:17','New Arnoldland','trey.schimmel@example.org','745','S','2009-03-24 09:10:33','2017-10-27 06:02:39'),
('88','Henri','Heidenreich','f','2012-06-22 00:11:53','North Shaun','jadyn.murphy@example.net','1','X','1970-01-14 21:37:57','1988-11-14 13:04:30'),
('89','Lydia','Sporer','m','1988-05-16 13:53:01','Lucioville','verdman@example.org','370','S','1988-11-02 01:31:21','2007-05-23 23:27:44'),
('90','Dwight','Dicki','m','2007-01-25 18:31:27','New Haylee','howell.strosin@example.org','10102','S','2003-05-09 18:20:51','2002-09-22 00:57:27'),
('91','Raphael','Von','m','2016-06-18 04:43:22','New Karellefort','shanahan.ernie@example.net','0','','1982-07-04 20:52:17','1978-02-11 09:16:40'),
('92','Okey','Ryan','m','1974-04-06 21:50:18','Lake Cecile','orval.homenick@example.com','1','S','2018-04-30 21:14:27','2001-06-05 01:55:03'),
('93','Valentin','Christiansen','m','1981-11-13 05:42:04','Wilkinsonburgh','fabian25@example.net','0','X','2015-11-29 11:43:12','1979-08-15 19:22:06'),
('94','Aubrey','Sauer','f','1991-03-22 05:53:36','Josephineshire','sabryna13@example.net','407153','X','2008-03-17 03:34:27','1991-10-12 00:07:31'),
('95','Katelyn','Casper','m','1987-12-17 14:36:53','Janetbury','block.korey@example.org','894689','X','1981-02-11 05:56:26','1997-02-12 09:20:01'),
('96','Conor','Grant','m','2008-09-28 18:28:12','East Harveyfurt','mtreutel@example.net','622','M','2005-01-29 11:39:22','1988-06-28 21:04:43'),
('97','Mallory','Hettinger','f','2017-08-14 20:43:00','Stammmouth','mstrosin@example.org','434','M','2008-12-14 09:12:40','1981-06-18 02:17:25'),
('98','Verna','Bradtke','m','1990-08-29 15:04:51','East Jaymeville','purdy.kim@example.net','554072','L','1988-01-25 05:37:05','1997-10-31 10:18:58'),
('99','Augusta','Padberg','m','2016-01-30 10:35:50','Lake Ayden','lionel54@example.net','717161','X','1975-01-12 05:31:43','1990-06-22 04:16:37'),
('100','Brandi','Hermann','m','2007-05-03 16:27:15','Nathenberg','blanda.lillie@example.org','798595','M','2011-04-16 05:19:53','1989-11-03 12:05:02'); 



INSERT INTO `brendName` (`id`, `brendName`) VALUES ('1', 'Nike Sportswear');
INSERT INTO `brendName` (`id`, `brendName`) VALUES ('2', 'NikeLab');
INSERT INTO `brendName` (`id`, `brendName`) VALUES ('3', 'Jordan');
INSERT INTO `brendName` (`id`, `brendName`) VALUES ('4', 'Nike SB');
INSERT INTO `brendName` (`id`, `brendName`) VALUES ('5', 'ACG');
INSERT INTO `brendName` (`id`, `brendName`) VALUES ('6', 'Nike Pro');


INSERT INTO `sportType` (`id`, `sportType`) VALUES ('1', '–ë–µ–≥');
INSERT INTO `sportType` (`id`, `sportType`) VALUES ('2', '–§—É—Ç–±–æ–ª');
INSERT INTO `sportType` (`id`, `sportType`) VALUES ('3', '–ë–∞—Å–∫–µ—Ç–±–æ–ª');
INSERT INTO `sportType` (`id`, `sportType`) VALUES ('4', '–§–∏—Ç–Ω–µ—Å');
INSERT INTO `sportType` (`id`, `sportType`) VALUES ('5', '–ö—Ä–æ—Å—Å-—Ç—Ä–µ–Ω–∏–Ω–≥');
INSERT INTO `sportType` (`id`, `sportType`) VALUES ('6', '–ô–æ–≥–∞');
INSERT INTO `sportType` (`id`, `sportType`) VALUES ('7', '–°–∫–µ–π—Ç–±–æ—Ä–¥–∏–Ω–≥');
INSERT INTO `sportType` (`id`, `sportType`) VALUES ('8', '–¢–µ–Ω–Ω–∏—Å');
INSERT INTO `sportType` (`id`, `sportType`) VALUES ('9', '–ì–æ–ª—å—Ñ');
INSERT INTO `sportType` (`id`, `sportType`) VALUES ('10', '–ê–º–µ—Ä–∏–∫–∞–Ω—Å–∫–∏–π —Ñ—É—Ç–±–æ–ª');
INSERT INTO `sportType` (`id`, `sportType`) VALUES ('11', 'NBA');
INSERT INTO `sportType` (`id`, `sportType`) VALUES ('12', '–¢–∞–Ω—Ü—ã');


INSERT INTO `catalogs` (`id`, `name`) VALUES ('1', '–°–ø–æ—Ä—Ç–∏–≤–Ω—ã–µ –∫–æ—Å—Ç—é–º—ã');
INSERT INTO `catalogs` (`id`, `name`) VALUES ('2', '–Æ–±–∫–∏ –∏ –ø–ª–∞—Ç—å—è');
INSERT INTO `catalogs` (`id`, `name`) VALUES ('3', '–®–æ—Ä—Ç—ã');
INSERT INTO `catalogs` (`id`, `name`) VALUES ('4', '–ë—Ä—é–∫–∏ –∏ –ª–µ–≥–≥–∏–Ω—Å—ã');
INSERT INTO `catalogs` (`id`, `name`) VALUES ('5', '–ö—É—Ä—Ç–∫–∏ –∏ –∂–∏–ª–µ—Ç—ã');
INSERT INTO `catalogs` (`id`, `name`) VALUES ('6', '–•—É–¥–∏ –∏ —Ç–æ–ª—Å—Ç–æ–≤–∫–∏');
INSERT INTO `catalogs` (`id`, `name`) VALUES ('7', '–¢–æ–ø—ã –∏ —Ñ—É—Ç–±–æ–ª–∫–∏');
INSERT INTO `catalogs` (`id`, `name`) VALUES ('8', '–ö–æ–º–ø—Ä–µ—Å—Å–∏–æ–Ω–Ω—ã–µ –º–æ–¥–µ–ª–∏');
INSERT INTO `catalogs` (`id`, `name`) VALUES ('9', '–ë—Ä–∞ —Å–ø–æ—Ä—Ç–∏–≤–Ω—ã–µ');
INSERT INTO `catalogs` (`id`, `name`) VALUES ('10', '–§—É—Ç–±–æ–ª–∫–∏');
INSERT INTO `catalogs` (`id`, `name`) VALUES ('11', '–ü–æ–ª–æ');
INSERT INTO `catalogs` (`id`, `name`) VALUES ('12', '–ë—Ä—é–∫–∏ –∏ —Ç–∞–π—Ç—Å—ã');
INSERT INTO `catalogs` (`id`, `name`) VALUES ('13', '–§–æ—Ä–º–∞ –∏ –¥–∂–µ—Ä—Å–∏');
INSERT INTO `catalogs` (`id`, `name`) VALUES ('14', '–ö—Ä–æ—Å—Å–æ–≤–∫–∏');
INSERT INTO `catalogs` (`id`, `name`) VALUES ('15', '–ê–∫—Å–µ—Å—Å—É–∞—Ä—ã');


INSERT INTO `color` (`id`, `color`) VALUES ('1', 'fuchsia');
INSERT INTO `color` (`id`, `color`) VALUES ('2', 'black');
INSERT INTO `color` (`id`, `color`) VALUES ('3', 'silver');
INSERT INTO `color` (`id`, `color`) VALUES ('4', 'lime');
INSERT INTO `color` (`id`, `color`) VALUES ('5', 'gray');
INSERT INTO `color` (`id`, `color`) VALUES ('6', 'aqua');
INSERT INTO `color` (`id`, `color`) VALUES ('7', 'blue');
INSERT INTO `color` (`id`, `color`) VALUES ('8', 'olive');
INSERT INTO `color` (`id`, `color`) VALUES ('9', 'teal');
INSERT INTO `color` (`id`, `color`) VALUES ('10', 'navy');
INSERT INTO `color` (`id`, `color`) VALUES ('11', 'green');
INSERT INTO `color` (`id`, `color`) VALUES ('12', 'yellow');
INSERT INTO `color` (`id`, `color`) VALUES ('13', 'maroon');
INSERT INTO `color` (`id`, `color`) VALUES ('14', 'purple');
INSERT INTO `color` (`id`, `color`) VALUES ('15', 'white');
INSERT INTO `color` (`id`, `color`) VALUES ('16', 'red');
INSERT INTO `color` (`id`, `color`) VALUES ('17', 'orange');
INSERT INTO `color` (`id`, `color`) VALUES ('18', 'yellow');
INSERT INTO `color` (`id`, `color`) VALUES ('19', 'pink');
INSERT INTO `color` (`id`, `color`) VALUES ('20', 'gold');


INSERT INTO `productSize` (`id`, `productSize`) VALUES ('1', 'S');
INSERT INTO `productSize` (`id`, `productSize`) VALUES ('2', 'X');
INSERT INTO `productSize` (`id`, `productSize`) VALUES ('3', 'L');
INSERT INTO `productSize` (`id`, `productSize`) VALUES ('4', 'M');


INSERT INTO `collection` (`id`, `collection`) VALUES ('1', 'Joyride');
INSERT INTO `collection` (`id`, `collection`) VALUES ('2', 'React');
INSERT INTO `collection` (`id`, `collection`) VALUES ('3', 'Pegasus');
INSERT INTO `collection` (`id`, `collection`) VALUES ('4', 'Vomero');
INSERT INTO `collection` (`id`, `collection`) VALUES ('5', 'Structure');
INSERT INTO `collection` (`id`, `collection`) VALUES ('6', 'Flyknit');
INSERT INTO `collection` (`id`, `collection`) VALUES ('7', 'Free');
INSERT INTO `collection` (`id`, `collection`) VALUES ('8', 'Zoom');
INSERT INTO `collection` (`id`, `collection`) VALUES ('9', 'Air Force 1');
INSERT INTO `collection` (`id`, `collection`) VALUES ('10', 'Blazer');
INSERT INTO `collection` (`id`, `collection`) VALUES ('11', 'VaporMax');
INSERT INTO `collection` (`id`, `collection`) VALUES ('12', 'Huarache');
INSERT INTO `collection` (`id`, `collection`) VALUES ('13', 'Cortez');
INSERT INTO `collection` (`id`, `collection`) VALUES ('14', 'Presto');
INSERT INTO `collection` (`id`, `collection`) VALUES ('15', 'Phantom');


INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('1', '1', 'f', '37.00', '1', '1', '1', '1', '1', 'D', '1993-07-28 12:20:15', '1996-08-30 21:49:34');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('2', '2', 'f', '37.00', '2', '2', '2', '2', '2', 'O', '1974-01-26 03:20:15', '2018-11-12 19:40:15');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('3', '3', 'f', '53.00', '3', '3', '3', '3', '3', 'O', '1997-01-17 22:41:28', '2018-06-23 06:49:49');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('4', '4', 'm', '36.00', '4', '4', '4', '4', '4', 'O', '1980-05-12 00:58:45', '2006-10-22 23:02:23');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('5', '5', 'f', '75.00', '1', '5', '5', '5', '5', 'O', '1971-02-22 06:11:12', '1992-12-11 14:50:47');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('6', '6', 'f', '60.00', '2', '6', '6', '6', '6', 'N', '1984-01-07 01:57:23', '1974-08-29 23:18:05');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('7', '7', 'm', '70.00', '3', '7', '7', '1', '7', 'O', '1970-11-02 04:07:06', '1983-01-21 23:34:21');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('8', '8', 'm', '23.00', '4', '8', '8', '2', '8', 'O', '1979-09-23 06:08:59', '2015-03-03 08:40:54');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('9', '9', 'f', '32.00', '1', '9', '9', '3', '9', 'O', '2010-04-16 23:02:58', '2009-12-19 22:38:06');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('10', '10', 'f', '25.00', '2', '10', '10', '4', '10', 'N', '1979-12-05 05:10:20', '1989-08-26 22:47:53');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('11', '11', 'f', '99.00', '3', '11', '11', '5', '11', 'N', '1986-09-17 12:31:42', '2005-04-04 03:23:37');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('12', '12', 'm', '100.00', '4', '12', '12', '6', '12', 'O', '2015-11-15 07:13:21', '2010-10-23 03:57:43');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('13', '13', 'f', '86.00', '1', '13', '1', '1', '13', 'D', '2008-03-19 15:02:44', '1977-07-21 08:05:49');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('14', '14', 'f', '70.00', '2', '14', '2', '2', '14', 'O', '1987-03-02 15:31:18', '2003-04-11 18:14:56');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('15', '15', 'm', '91.00', '3', '15', '3', '3', '15', 'O', '2020-03-09 02:05:33', '2008-12-30 09:01:19');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('16', '1', 'f', '40.00', '4', '16', '4', '4', '1', 'O', '2016-07-25 21:42:39', '1976-10-12 01:27:10');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('17', '2', 'f', '15.00', '1', '17', '5', '5', '2', 'D', '1991-04-18 20:11:07', '2003-03-30 08:47:26');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('18', '3', 'f', '28.00', '2', '18', '6', '6', '3', 'N', '2006-06-23 02:38:16', '1981-01-10 05:01:51');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('19', '4', 'm', '67.00', '3', '19', '7', '1', '4', 'N', '1988-05-21 03:03:05', '2003-09-30 11:50:12');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('20', '5', 'm', '61.00', '4', '20', '8', '2', '5', 'O', '2012-09-26 12:17:56', '1971-12-31 02:05:20');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('21', '6', 'f', '49.00', '1', '1', '9', '3', '6', 'O', '1981-09-17 03:08:44', '1994-02-24 11:31:47');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('22', '7', 'm', '7.00', '2', '2', '10', '4', '7', 'N', '2007-03-10 11:40:15', '2019-11-22 00:57:34');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('23', '8', 'f', '67.00', '3', '3', '11', '5', '8', 'N', '1993-07-25 03:54:37', '1974-06-29 09:49:33');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('24', '9', 'f', '85.00', '4', '4', '12', '6', '9', 'N', '1994-04-12 04:50:11', '1990-09-27 01:13:57');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('25', '10', 'f', '52.00', '1', '5', '1', '1', '10', 'O', '2009-09-30 00:56:51', '1972-03-16 20:42:53');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('26', '11', 'm', '97.00', '2', '6', '2', '2', '11', 'N', '1974-05-22 18:23:33', '2012-11-07 08:35:47');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('27', '12', 'f', '78.00', '3', '7', '3', '3', '12', 'N', '1978-02-26 21:28:59', '1994-08-24 18:28:43');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('28', '13', 'm', '38.00', '4', '8', '4', '4', '13', 'D', '1998-07-15 09:35:42', '1971-01-07 15:41:18');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('29', '14', 'f', '71.00', '1', '9', '5', '5', '14', 'D', '1975-05-12 07:39:30', '2019-02-18 14:47:55');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('30', '15', 'f', '50.00', '2', '10', '6', '6', '15', 'O', '1992-08-25 23:12:40', '2007-11-02 06:17:07');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('31', '1', 'f', '39.00', '3', '11', '7', '1', '1', 'O', '1987-10-07 05:30:46', '1990-09-09 21:39:28');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('32', '2', 'f', '28.00', '4', '12', '8', '2', '2', 'O', '1983-09-17 02:34:23', '2000-03-13 19:18:32');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('33', '3', 'f', '28.00', '1', '13', '9', '3', '3', 'D', '2012-07-16 02:53:23', '2013-08-23 18:44:32');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('34', '4', 'f', '77.00', '2', '14', '10', '4', '4', 'N', '1991-09-20 00:11:10', '2010-01-07 22:21:09');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('35', '5', 'f', '14.00', '3', '15', '11', '5', '5', 'N', '1971-08-13 04:42:40', '2009-09-09 23:04:25');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('36', '6', 'm', '51.00', '4', '16', '12', '6', '6', 'N', '2017-05-08 16:33:20', '2009-10-16 23:23:59');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('37', '7', 'f', '26.00', '1', '17', '1', '1', '7', 'N', '2012-02-08 05:25:38', '2007-12-25 17:33:12');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('38', '8', 'm', '36.00', '2', '18', '2', '2', '8', 'O', '2000-09-08 03:01:52', '1995-01-28 16:07:10');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('39', '9', 'm', '66.00', '3', '19', '3', '3', '9', 'O', '1988-10-19 14:37:12', '1978-09-30 04:34:36');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('40', '10', 'f', '18.00', '4', '20', '4', '4', '10', 'O', '1993-09-25 08:58:07', '1986-09-07 19:48:39');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('41', '11', 'f', '77.00', '1', '1', '5', '5', '11', 'N', '1978-10-18 08:16:28', '1971-10-22 02:43:57');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('42', '12', 'm', '46.00', '2', '2', '6', '6', '12', 'O', '1994-08-01 12:02:48', '2016-11-23 03:13:36');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('43', '13', 'f', '23.00', '3', '3', '7', '1', '13', 'O', '1988-06-11 02:26:52', '1998-02-08 13:17:38');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('44', '14', 'm', '74.00', '4', '4', '8', '2', '14', 'O', '2016-10-22 12:53:24', '1982-12-02 04:08:50');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('45', '15', 'f', '42.00', '1', '5', '9', '3', '15', 'D', '2003-01-18 05:43:46', '1975-10-08 18:00:34');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('46', '1', 'm', '91.00', '2', '6', '10', '4', '1', 'D', '2019-03-08 13:57:30', '1987-10-17 18:56:42');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('47', '2', 'f', '44.00', '3', '7', '11', '5', '2', 'N', '2002-12-11 23:55:56', '1981-05-03 20:16:34');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('48', '3', 'm', '48.00', '4', '8', '12', '6', '3', 'N', '1974-05-08 00:55:24', '2012-04-30 21:09:15');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('49', '4', 'f', '11.00', '1', '9', '1', '1', '4', 'N', '1996-06-05 11:17:46', '1986-03-11 04:37:27');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('50', '5', 'f', '34.00', '2', '10', '2', '2', '5', 'D', '2012-12-11 20:40:16', '1985-11-24 06:03:09');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('51', '6', 'm', '55.00', '3', '11', '3', '3', '6', 'D', '2012-12-27 16:03:52', '1991-04-29 10:44:33');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('52', '7', 'm', '73.00', '4', '12', '4', '4', '7', 'D', '1999-12-16 13:50:36', '2008-10-22 12:35:42');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('53', '8', 'm', '61.00', '1', '13', '5', '5', '8', 'O', '2010-04-12 20:57:08', '1990-12-15 22:26:39');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('54', '9', 'f', '68.00', '2', '14', '6', '6', '9', 'D', '1973-04-28 10:59:51', '1982-12-04 01:45:22');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('55', '10', 'm', '52.00', '3', '15', '7', '1', '10', 'D', '1984-02-08 22:05:29', '2020-04-15 06:02:06');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('56', '11', 'f', '32.00', '4', '16', '8', '2', '11', 'D', '1974-06-17 05:21:45', '1985-10-26 02:52:11');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('57', '12', 'm', '62.00', '1', '17', '9', '3', '12', 'O', '2003-02-02 09:08:54', '1975-06-24 18:43:19');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('58', '13', 'f', '26.00', '2', '18', '10', '4', '13', 'N', '2000-02-22 17:11:36', '2003-01-07 22:54:53');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('59', '14', 'f', '62.00', '3', '19', '11', '5', '14', 'D', '1992-07-22 05:59:07', '1971-01-01 07:30:19');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('60', '15', 'm', '35.00', '4', '20', '12', '6', '15', 'N', '2009-05-14 11:02:01', '1986-07-28 04:26:32');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('61', '1', 'f', '47.00', '1', '1', '1', '1', '1', 'N', '1986-09-11 14:02:30', '1974-02-15 08:28:00');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('62', '2', 'f', '76.00', '2', '2', '2', '2', '2', 'O', '2010-03-05 18:12:55', '2013-03-18 04:47:09');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('63', '3', 'f', '12.00', '3', '3', '3', '3', '3', 'N', '2012-10-31 05:32:26', '2007-10-26 07:24:03');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('64', '4', 'm', '67.00', '4', '4', '4', '4', '4', 'D', '2000-08-13 11:13:42', '1988-06-21 13:08:11');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('65', '5', 'f', '6.00', '1', '5', '5', '5', '5', 'D', '2012-12-22 11:51:14', '2020-01-13 11:13:28');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('66', '6', 'f', '36.00', '2', '6', '6', '6', '6', 'D', '2019-01-22 04:53:42', '1975-08-21 21:45:20');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('67', '7', 'f', '87.00', '3', '7', '7', '1', '7', 'N', '1981-02-16 07:51:47', '1980-03-01 22:08:51');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('68', '8', 'm', '44.00', '4', '8', '8', '2', '8', 'N', '1971-04-11 00:36:05', '1974-02-10 02:20:42');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('69', '9', 'm', '68.00', '1', '9', '9', '3', '9', 'N', '2013-12-17 20:42:36', '2002-11-07 20:42:49');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('70', '10', 'f', '82.00', '2', '10', '10', '4', '10', 'D', '1987-02-13 09:08:59', '1997-02-18 06:38:46');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('71', '11', 'f', '43.00', '3', '11', '11', '5', '11', 'N', '1986-05-14 11:37:54', '2004-02-27 00:33:15');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('72', '12', 'f', '22.00', '4', '12', '12', '6', '12', 'O', '1981-06-04 06:17:01', '1991-10-15 22:22:53');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('73', '13', 'f', '46.00', '1', '13', '1', '1', '13', 'O', '2012-02-24 05:03:43', '2002-08-28 19:04:20');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('74', '14', 'f', '47.00', '2', '14', '2', '2', '14', 'D', '1977-10-09 17:43:52', '2015-06-22 19:05:13');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('75', '15', 'f', '75.00', '3', '15', '3', '3', '15', 'N', '1974-11-17 06:41:57', '2002-09-01 03:08:36');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('76', '1', 'm', '13.00', '4', '16', '4', '4', '1', 'N', '1986-06-30 01:19:30', '1986-02-07 18:43:57');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('77', '2', 'm', '14.00', '1', '17', '5', '5', '2', 'N', '2018-01-30 03:55:12', '2010-04-29 10:28:16');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('78', '3', 'm', '61.00', '2', '18', '6', '6', '3', 'D', '2003-01-25 16:55:19', '2003-04-25 06:15:38');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('79', '4', 'm', '50.00', '3', '19', '7', '1', '4', 'D', '2006-11-04 23:58:55', '1976-02-27 05:08:20');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('80', '5', 'f', '35.00', '4', '20', '8', '2', '5', 'D', '2012-11-26 17:54:36', '2002-11-24 03:09:15');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('81', '6', 'm', '84.00', '1', '1', '9', '3', '6', 'N', '1998-06-29 09:45:53', '2003-11-13 15:50:31');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('82', '7', 'f', '58.00', '2', '2', '10', '4', '7', 'D', '1975-05-03 02:00:02', '1974-10-31 18:46:54');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('83', '8', 'f', '76.00', '3', '3', '11', '5', '8', 'O', '1986-10-21 19:48:18', '1972-08-01 21:51:58');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('84', '9', 'f', '10.00', '4', '4', '12', '6', '9', 'N', '2020-02-15 12:29:58', '2011-04-26 00:07:47');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('85', '10', 'f', '67.00', '1', '5', '1', '1', '10', 'O', '1980-01-11 04:32:41', '2003-04-30 11:32:46');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('86', '11', 'f', '23.00', '2', '6', '2', '2', '11', 'O', '2003-08-11 01:05:35', '1972-01-29 06:22:38');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('87', '12', 'm', '11.00', '3', '7', '3', '3', '12', 'D', '1987-07-07 00:57:01', '1994-05-31 00:41:42');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('88', '13', 'f', '17.00', '4', '8', '4', '4', '13', 'N', '1993-12-07 04:32:55', '1981-10-15 13:00:20');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('89', '14', 'f', '62.00', '1', '9', '5', '5', '14', 'D', '1999-08-11 12:51:36', '2011-12-12 14:27:44');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('90', '15', 'f', '11.00', '2', '10', '6', '6', '15', 'O', '2004-11-21 11:51:17', '2009-10-26 23:40:51');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('91', '1', 'm', '94.00', '3', '11', '7', '1', '1', 'N', '1991-07-06 06:02:06', '1989-03-11 20:43:06');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('92', '2', 'm', '38.00', '4', '12', '8', '2', '2', 'N', '2014-05-22 05:57:33', '2008-05-23 00:16:24');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('93', '3', 'f', '91.00', '1', '13', '9', '3', '3', 'O', '1989-02-14 00:34:08', '1998-10-07 05:29:43');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('94', '4', 'f', '20.00', '2', '14', '10', '4', '4', 'N', '2019-06-28 09:38:29', '1990-07-03 10:26:55');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('95', '5', 'm', '67.00', '3', '15', '11', '5', '5', 'O', '1978-11-04 04:14:04', '1992-08-24 18:53:43');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('96', '6', 'f', '53.00', '4', '16', '12', '6', '6', 'D', '1988-01-05 15:43:09', '1986-01-06 13:04:37');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('97', '7', 'f', '70.00', '1', '17', '1', '1', '7', 'D', '1979-05-30 15:46:53', '1984-10-14 13:02:33');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('98', '8', 'f', '1.00', '2', '18', '2', '2', '8', 'D', '2003-04-19 18:59:30', '1984-12-04 02:51:16');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('99', '9', 'm', '31.00', '3', '19', '3', '3', '9', 'N', '2018-07-07 14:37:30', '1972-01-14 19:43:05');
INSERT INTO `products` (`id`, `catalog_id`, `gender`, `price`, `productSize_id`, `color_id`, `sportType_id`, `brendName_id`, `collection_id`, `newOrOld`, `created_at`, `updated_at`) VALUES ('100', '10', 'f', '62.00', '4', '20', '4', '4', '10', 'N', '2005-06-03 17:31:37', '2012-01-31 05:33:41');


INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('1', 'Shop1', '2008-05-06 17:34:33', '1992-01-29 02:53:02');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('2', 'Shop2', '1972-04-29 14:47:07', '1978-11-18 06:24:59');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('3', 'Shop3', '1987-12-25 12:34:30', '1974-12-02 01:58:33');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('4', 'Shop4', '1999-06-06 10:46:36', '1981-07-28 14:51:27');
INSERT INTO `storehouses` (`id`, `name`, `created_at`, `updated_at`) VALUES ('5', 'Shop5', '1998-05-29 12:21:03', '1971-12-11 22:51:11');


INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('1', 1, 1, 6, '2001-07-26 00:05:16', '1984-07-01 23:41:31');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('2', 2, 2, 7, '2000-09-06 09:51:01', '2011-03-04 03:59:46');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('3', 3, 3, 5, '2001-12-30 03:10:56', '1974-08-15 23:12:14');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('4', 4, 4, 6, '1974-01-26 21:49:36', '2019-03-08 19:37:08');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('5', 5, 5, 9, '2009-04-19 05:08:55', '1991-03-20 04:39:08');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('6', 1, 6, 6, '1986-02-06 11:32:37', '1970-03-13 02:16:43');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('7', 2, 7, 5, '2011-01-01 06:13:13', '1991-09-11 10:14:23');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('8', 3, 8, 5, '2000-10-20 01:08:44', '1990-04-22 13:15:17');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('9', 4, 9, 5, '1971-12-09 02:02:07', '1971-02-06 17:10:00');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('10', 5, 10, 7, '1999-02-18 12:44:43', '1993-11-29 10:26:43');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('11', 1, 11, 9, '1982-08-27 04:03:29', '1973-11-03 23:54:14');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('12', 2, 12, 10, '1994-07-26 13:54:14', '2003-04-12 21:44:27');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('13', 3, 13, 7, '1985-11-15 15:13:47', '1991-05-23 10:06:29');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('14', 4, 14, 10, '1972-09-16 09:18:50', '2019-07-06 21:53:53');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('15', 5, 15, 10, '2011-07-08 22:00:46', '1971-04-15 08:45:21');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('16', 1, 16, 1, '1981-11-13 18:08:43', '1978-10-28 23:52:42');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('17', 2, 17, 8, '2011-02-04 15:03:11', '1972-06-12 15:05:05');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('18', 3, 18, 1, '1972-01-31 15:04:14', '2014-08-30 11:53:22');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('19', 4, 19, 1, '2010-04-01 11:45:40', '1976-01-14 00:55:35');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('20', 5, 20, 1, '1998-05-02 05:21:09', '1995-08-24 04:32:58');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('21', 1, 21, 2, '1984-06-25 06:14:04', '2019-05-29 01:34:06');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('22', 2, 22, 1, '2000-12-02 18:25:18', '1985-02-19 19:56:10');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('23', 3, 23, 9, '2011-09-08 01:12:03', '2003-07-20 01:18:27');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('24', 4, 24, 8, '1979-06-21 15:27:50', '2008-09-13 16:23:46');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('25', 5, 25, 2, '2020-02-29 19:38:02', '1984-11-09 09:02:16');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('26', 1, 26, 8, '1989-05-09 12:51:29', '2010-11-28 23:57:40');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('27', 2, 27, 5, '2012-11-18 17:22:01', '1986-09-08 15:14:57');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('28', 3, 28, 5, '2012-07-30 10:34:14', '1977-08-23 05:41:33');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('29', 4, 29, 5, '2001-01-20 09:32:28', '2008-10-05 14:45:39');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('30', 5, 30, 4, '2020-02-14 16:17:10', '1973-08-17 12:20:38');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('31', 1, 31, 4, '1974-05-18 17:04:05', '2018-06-21 07:48:14');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('32', 2, 32, 7, '2005-08-08 02:22:15', '1995-11-23 04:22:41');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('33', 3, 33, 1, '1992-01-28 20:23:07', '2006-11-11 12:57:41');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('34', 4, 34, 1, '1988-12-01 21:28:45', '2018-08-28 23:03:06');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('35', 5, 35, 0, '2010-04-29 11:43:31', '2020-05-30 09:30:58');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('36', 1, 36, 6, '1974-07-14 12:42:14', '1992-05-23 10:16:23');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('37', 2, 37, 6, '2000-05-22 21:24:44', '2012-07-07 00:45:08');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('38', 3, 38, 6, '2010-06-14 03:58:39', '2004-12-28 06:56:18');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('39', 4, 39, 6, '2000-09-14 16:42:52', '2006-01-27 21:37:34');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('40', 5, 40, 10, '2019-01-14 17:13:08', '1991-12-31 20:57:43');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('41', 1, 41, 9, '1996-08-25 05:59:20', '1977-08-31 19:16:44');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('42', 2, 42, 1, '2001-01-14 07:49:38', '2014-05-17 17:07:30');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('43', 3, 43, 4, '1988-09-15 22:27:35', '2013-09-26 10:07:50');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('44', 4, 44, 4, '1971-07-13 21:03:30', '1997-01-27 03:49:15');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('45', 5, 45, 8, '1991-01-31 19:36:04', '2002-03-17 10:36:22');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('46', 1, 46, 6, '1994-04-21 05:24:54', '2000-02-05 11:38:38');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('47', 2, 47, 9, '2006-10-30 07:31:45', '1981-09-27 02:26:15');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('48', 3, 48, 8, '1999-01-04 20:59:09', '2017-10-03 23:22:04');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('49', 4, 49, 1, '1984-06-09 17:06:52', '2018-10-14 03:05:19');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('50', 5, 50, 5, '2005-04-28 13:04:40', '1974-07-08 06:54:35');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('51', 1, 51, 3, '1973-01-09 05:28:56', '1989-06-28 10:02:03');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('52', 2, 52, 2, '2004-03-04 18:22:13', '1986-11-14 00:38:53');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('53', 3, 53, 9, '2013-02-16 14:20:01', '1994-12-14 07:23:46');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('54', 4, 54, 9, '2001-02-14 07:55:52', '2004-03-14 08:14:45');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('55', 5, 55, 0, '2016-05-01 07:14:24', '1975-08-23 10:20:59');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('56', 1, 56, 1, '2013-09-02 04:31:49', '1983-06-01 02:53:08');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('57', 2, 57, 3, '2003-03-18 00:40:56', '1982-06-19 17:32:49');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('58', 3, 58, 2, '2003-08-18 10:05:12', '2012-10-11 06:03:51');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('59', 4, 59, 10, '2004-03-22 10:07:16', '1973-07-17 13:16:35');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('60', 5, 60, 5, '1974-10-16 09:35:15', '1984-02-28 02:54:44');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('61', 1, 61, 0, '1998-01-26 08:26:10', '2005-03-06 12:59:04');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('62', 2, 62, 7, '2012-11-30 07:23:48', '2004-06-24 03:34:35');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('63', 3, 63, 1, '1991-12-23 08:49:56', '1986-07-28 20:40:42');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('64', 4, 64, 0, '1990-07-31 21:23:26', '1977-01-09 10:39:45');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('65', 5, 65, 4, '1993-12-26 13:22:59', '1981-07-22 22:36:14');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('66', 1, 66, 9, '1977-12-02 19:15:03', '2010-12-14 04:51:34');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('67', 2, 67, 6, '2001-01-04 18:27:05', '2001-11-23 12:35:54');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('68', 3, 68, 8, '1985-01-14 23:39:46', '1983-10-18 12:21:35');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('69', 4, 69, 7, '1999-08-10 19:00:25', '1990-06-07 10:01:23');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('70', 5, 70, 4, '1980-07-18 10:51:47', '1978-06-04 14:42:19');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('71', 1, 71, 8, '1994-09-03 11:20:30', '1992-07-29 11:07:12');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('72', 2, 72, 6, '2014-01-25 23:18:49', '1984-07-25 07:31:29');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('73', 3, 73, 6, '1991-01-05 23:46:10', '1974-01-27 10:59:13');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('74', 4, 74, 10, '1982-11-17 05:35:38', '1983-10-11 02:13:30');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('75', 5, 75, 2, '2007-04-16 02:28:54', '2016-12-04 23:34:42');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('76', 1, 76, 6, '1977-12-06 18:47:09', '2015-01-06 00:41:52');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('77', 2, 77, 0, '1994-05-04 17:52:08', '1984-09-18 09:05:41');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('78', 3, 78, 7, '1970-12-11 20:00:37', '2003-12-13 04:23:42');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('79', 4, 79, 5, '1997-01-08 04:50:08', '1988-01-15 01:31:54');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('80', 5, 80, 10, '1993-04-20 11:06:44', '1975-10-19 02:48:10');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('81', 1, 81, 2, '2014-02-12 22:05:32', '1976-09-08 07:28:50');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('82', 2, 82, 8, '2005-10-21 10:29:52', '1979-09-01 05:29:59');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('83', 3, 83, 7, '1977-04-01 05:12:02', '1975-06-11 12:30:53');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('84', 4, 84, 4, '2007-04-30 03:41:57', '1981-09-14 23:28:22');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('85', 5, 85, 1, '1982-10-17 02:07:58', '1995-02-14 10:38:54');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('86', 1, 86, 9, '1971-11-13 22:16:05', '1970-06-16 23:50:22');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('87', 2, 87, 2, '2019-08-22 05:09:24', '2011-09-15 03:16:01');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('88', 3, 88, 2, '1981-04-03 14:00:45', '1998-04-29 11:35:37');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('89', 4, 89, 3, '1981-05-10 21:49:48', '1990-07-24 11:29:28');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('90', 5, 90, 3, '1974-04-20 17:52:34', '1970-06-05 22:45:55');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('91', 1, 91, 10, '2017-09-17 16:55:36', '1978-04-08 04:05:33');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('92', 2, 92, 8, '1993-06-25 08:19:14', '2004-07-12 22:26:47');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('93', 3, 93, 4, '1995-10-20 23:05:35', '1996-04-03 04:48:42');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('94', 4, 94, 6, '2004-04-09 18:23:08', '2000-08-23 11:39:27');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('95', 5, 95, 0, '2014-02-06 16:43:11', '1990-06-24 08:20:57');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('96', 1, 96, 1, '1982-05-05 08:02:26', '2001-08-12 18:01:06');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('97', 2, 97, 1, '1990-01-15 05:58:41', '2014-08-25 06:23:27');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('98', 3, 98, 5, '1990-04-22 08:30:57', '2003-08-15 09:30:02');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('99', 4, 99, 1, '1973-08-05 03:23:05', '2015-11-15 08:29:14');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('100', 5, 100, 0, '1984-04-14 07:42:54', '1970-02-21 16:14:17');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('101', 1, 1, 5, '1975-10-01 03:46:35', '2010-12-27 14:38:52');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('102', 2, 2, 0, '1975-06-01 23:32:18', '2003-03-24 07:36:10');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('103', 3, 3, 2, '1979-07-13 13:59:31', '2006-11-21 17:35:48');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('104', 4, 4, 2, '2009-01-25 00:40:13', '2006-10-27 17:33:12');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('105', 5, 5, 3, '1995-09-03 03:43:23', '2003-07-17 19:17:28');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('106', 1, 6, 7, '1981-07-08 13:55:23', '1995-11-09 14:31:51');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('107', 2, 7, 10, '1990-04-13 13:27:02', '1987-02-04 02:04:07');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('108', 3, 8, 7, '1990-12-19 05:58:56', '1975-03-14 08:49:09');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('109', 4, 9, 3, '1993-01-08 03:48:16', '1981-09-19 18:19:39');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('110', 5, 10, 3, '2002-05-16 04:49:33', '2004-03-26 09:21:08');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('111', 1, 11, 2, '1986-08-02 02:23:11', '1974-09-19 20:46:43');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('112', 2, 12, 9, '2011-01-03 16:45:55', '1996-04-15 02:40:46');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('113', 3, 13, 8, '2007-11-28 15:05:22', '1980-08-17 06:07:52');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('114', 4, 14, 10, '1980-02-05 12:29:35', '2000-11-05 15:07:32');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('115', 5, 15, 4, '1991-08-03 18:00:51', '2004-12-17 09:23:01');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('116', 1, 16, 9, '1997-12-19 03:24:45', '1988-12-05 15:02:21');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('117', 2, 17, 8, '2001-01-19 11:01:16', '2006-03-18 06:46:57');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('118', 3, 18, 3, '1979-01-22 09:30:12', '1999-05-15 02:41:29');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('119', 4, 19, 1, '1997-08-16 01:57:23', '1994-11-06 12:55:17');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('120', 5, 20, 6, '1987-09-29 10:36:21', '1991-08-05 17:50:31');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('121', 1, 21, 6, '2018-10-28 05:30:45', '1993-04-12 06:33:51');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('122', 2, 22, 7, '1989-07-01 17:58:20', '2007-02-24 04:27:04');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('123', 3, 23, 9, '2018-08-30 02:03:08', '1987-09-06 04:57:18');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('124', 4, 24, 6, '2004-04-13 03:47:39', '2000-05-21 07:25:00');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('125', 5, 25, 3, '2000-05-30 04:09:03', '1986-07-24 16:12:54');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('126', 1, 26, 2, '1971-07-08 05:29:06', '1985-06-23 10:59:47');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('127', 2, 27, 9, '1973-09-17 10:21:48', '1976-01-07 05:43:32');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('128', 3, 28, 3, '1981-03-01 23:29:12', '2013-07-21 15:18:49');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('129', 4, 29, 10, '1993-04-20 11:45:53', '1980-02-06 11:34:45');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('130', 5, 30, 2, '1988-11-16 19:31:01', '1979-09-23 03:48:46');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('131', 1, 31, 5, '1973-12-16 21:58:11', '1978-12-04 00:27:36');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('132', 2, 32, 8, '1982-05-21 10:26:21', '2011-01-31 01:24:22');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('133', 3, 33, 9, '2018-06-22 16:15:50', '1973-03-24 17:46:22');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('134', 4, 34, 2, '2018-10-19 23:50:17', '1999-04-07 01:51:15');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('135', 5, 35, 5, '2006-08-12 06:34:40', '2016-01-06 03:11:55');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('136', 1, 36, 4, '1984-07-22 20:52:51', '2017-08-28 14:43:31');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('137', 2, 37, 2, '2019-02-10 03:51:30', '2012-11-18 08:20:37');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('138', 3, 38, 10, '2000-07-16 09:54:24', '1991-09-16 14:06:38');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('139', 4, 39, 1, '2015-11-30 01:44:41', '1998-12-16 19:27:00');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('140', 5, 40, 0, '1970-02-04 07:12:52', '2002-07-14 18:12:21');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('141', 1, 41, 5, '1976-05-17 12:43:58', '1984-01-08 10:13:08');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('142', 2, 42, 5, '1974-06-15 07:39:06', '2020-05-09 07:24:12');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('143', 3, 43, 7, '2016-02-09 19:37:09', '1999-04-23 04:51:38');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('144', 4, 44, 5, '2014-07-07 18:29:51', '1998-11-09 09:23:21');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('145', 5, 45, 8, '1995-11-25 17:21:25', '2015-02-18 02:16:49');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('146', 1, 46, 10, '2017-08-29 13:12:26', '2012-04-07 08:27:46');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('147', 2, 47, 10, '2000-11-01 11:31:02', '1984-02-03 05:05:41');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('148', 3, 48, 7, '1985-07-01 14:14:42', '1991-03-23 11:13:17');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('149', 4, 49, 2, '1976-12-27 21:06:18', '1974-07-03 21:15:28');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('150', 5, 50, 3, '2006-08-11 19:53:51', '1971-10-11 03:27:12');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('151', 1, 51, 10, '2002-11-27 16:30:01', '1985-10-07 22:07:07');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('152', 2, 52, 5, '1988-02-14 18:19:23', '2005-04-01 10:08:23');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('153', 3, 53, 0, '2008-01-18 18:21:05', '1973-11-18 14:56:31');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('154', 4, 54, 4, '1983-01-02 17:11:46', '2011-03-22 08:56:20');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('155', 5, 55, 9, '1975-12-07 15:38:27', '2019-01-14 19:33:15');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('156', 1, 56, 9, '1985-09-15 14:30:43', '2000-09-08 13:28:25');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('157', 2, 57, 4, '2002-06-28 07:30:53', '2002-07-18 02:47:46');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('158', 3, 58, 6, '2004-05-05 00:34:48', '1997-11-23 19:44:14');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('159', 4, 59, 0, '2008-12-30 11:56:22', '1981-04-10 23:11:50');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('160', 5, 60, 7, '1977-06-04 05:32:15', '2019-09-09 22:23:59');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('161', 1, 61, 10, '2003-07-01 03:26:54', '2000-05-26 15:28:01');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('162', 2, 62, 10, '2000-06-04 13:48:56', '1994-02-24 20:20:49');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('163', 3, 63, 2, '2015-07-19 04:00:06', '1979-06-12 03:29:26');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('164', 4, 64, 4, '1970-12-27 03:02:36', '2014-02-06 16:45:04');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('165', 5, 65, 8, '2011-11-09 09:18:28', '1981-06-20 18:37:58');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('166', 1, 66, 3, '2005-10-10 03:46:01', '1986-07-04 04:16:16');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('167', 2, 67, 8, '2009-10-23 01:53:13', '2008-07-10 01:55:18');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('168', 3, 68, 9, '1995-02-03 06:48:20', '1998-06-24 17:14:22');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('169', 4, 69, 4, '1982-12-29 18:13:42', '1994-08-31 16:18:52');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('170', 5, 70, 3, '2000-08-19 07:46:00', '2006-08-28 09:32:35');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('171', 1, 71, 9, '2010-04-25 08:46:33', '2014-06-29 04:54:00');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('172', 2, 72, 1, '2004-06-08 08:53:01', '1992-09-01 03:57:49');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('173', 3, 73, 1, '2013-06-21 18:53:40', '2016-05-22 13:16:22');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('174', 4, 74, 0, '2010-10-20 23:43:28', '1977-09-20 09:50:28');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('175', 5, 75, 6, '1992-03-02 17:56:32', '2005-12-02 03:44:16');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('176', 1, 76, 5, '2004-10-01 06:55:33', '2004-03-02 01:54:04');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('177', 2, 77, 5, '1970-07-19 03:00:50', '1991-09-05 06:27:45');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('178', 3, 78, 5, '1980-01-11 12:48:30', '1993-04-17 19:35:18');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('179', 4, 79, 1, '1999-04-06 00:22:47', '2019-08-31 23:21:34');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('180', 5, 80, 8, '1980-02-10 23:48:08', '1981-01-26 11:34:14');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('181', 1, 81, 6, '1975-03-12 23:40:58', '2005-11-17 20:52:56');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('182', 2, 82, 5, '1996-11-28 15:51:32', '1973-04-25 01:55:14');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('183', 3, 83, 4, '1978-05-31 08:30:12', '1976-10-10 06:41:22');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('184', 4, 84, 5, '1981-11-01 20:54:13', '1975-02-08 08:29:54');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('185', 5, 85, 8, '1996-05-07 11:40:18', '2007-06-14 13:56:23');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('186', 1, 86, 9, '1998-06-12 11:28:15', '2003-11-05 18:23:21');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('187', 2, 87, 1, '1998-11-28 20:30:40', '2000-09-26 02:25:55');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('188', 3, 88, 1, '1973-06-26 06:32:32', '2006-08-23 14:48:08');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('189', 4, 89, 10, '1971-07-21 21:12:57', '2015-01-29 04:31:26');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('190', 5, 90, 9, '2007-02-24 02:38:49', '2009-11-24 05:44:38');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('191', 1, 91, 1, '1976-12-11 08:27:58', '2018-02-04 23:46:57');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('192', 2, 92, 5, '1987-08-13 01:51:32', '2015-09-25 00:06:09');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('193', 3, 93, 5, '2000-05-18 12:40:34', '2002-09-05 13:21:17');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('194', 4, 94, 3, '1981-09-08 06:10:53', '1983-06-19 03:30:10');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('195', 5, 95, 0, '1990-11-09 19:09:13', '1973-06-20 01:56:25');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('196', 1, 96, 2, '1998-04-11 00:22:28', '1984-03-25 06:23:57');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('197', 2, 97, 6, '2004-03-13 14:05:32', '2000-03-23 19:52:39');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('198', 3, 98, 4, '1970-03-27 19:04:43', '1999-09-02 23:21:51');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('199', 4, 99, 9, '2000-03-01 20:27:13', '1973-03-29 09:32:22');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('200', 5, 100, 0, '2004-08-31 08:18:54', '2006-01-27 08:52:44');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('201', 1, 1, 7, '2019-09-05 12:01:53', '1999-03-18 03:26:25');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('202', 2, 2, 10, '1974-11-05 22:18:47', '2002-10-25 18:17:54');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('203', 3, 3, 2, '1990-05-13 10:59:34', '1977-09-26 10:35:39');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('204', 4, 4, 4, '1999-01-26 13:53:33', '2012-09-06 14:11:42');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('205', 5, 5, 6, '2014-03-26 18:29:50', '1980-02-27 11:08:42');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('206', 1, 6, 10, '1997-04-25 16:11:25', '2011-04-21 00:27:30');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('207', 2, 7, 8, '1981-07-12 20:05:13', '1972-08-28 01:19:23');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('208', 3, 8, 5, '1996-03-22 10:07:02', '1986-07-02 18:14:20');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('209', 4, 9, 6, '1984-03-22 22:43:31', '1989-04-29 17:04:13');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('210', 5, 10, 8, '2010-07-26 15:15:45', '2000-01-27 23:22:31');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('211', 1, 11, 8, '2006-12-09 02:14:26', '1991-06-01 07:57:48');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('212', 2, 12, 2, '2016-10-26 17:02:55', '2003-03-29 04:03:26');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('213', 3, 13, 4, '2013-11-27 04:11:23', '1995-06-12 15:25:24');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('214', 4, 14, 1, '2010-02-04 18:26:34', '1993-12-17 22:35:17');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('215', 5, 15, 5, '2009-05-30 22:44:22', '1998-04-10 07:50:21');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('216', 1, 16, 2, '2008-04-01 18:57:35', '2007-11-30 15:04:13');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('217', 2, 17, 10, '2010-05-10 09:05:04', '1989-07-11 00:08:02');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('218', 3, 18, 1, '1987-11-09 18:32:05', '2003-09-09 01:59:57');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('219', 4, 19, 8, '2016-07-25 18:50:38', '1999-12-23 17:19:28');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('220', 5, 20, 0, '2006-11-07 18:03:02', '2012-04-28 13:58:32');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('221', 1, 21, 7, '2017-07-15 06:09:29', '2019-06-12 23:17:03');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('222', 2, 22, 6, '1970-03-05 02:02:18', '1986-11-28 23:36:04');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('223', 3, 23, 9, '1996-07-14 02:50:40', '1975-04-06 17:43:32');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('224', 4, 24, 7, '1970-08-18 10:13:31', '1977-01-29 13:19:19');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('225', 5, 25, 10, '1986-01-14 13:23:09', '1997-08-03 23:42:30');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('226', 1, 26, 2, '1997-10-30 18:54:40', '1981-04-05 23:44:03');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('227', 2, 27, 8, '1983-02-24 01:45:35', '1974-01-28 09:37:20');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('228', 3, 28, 3, '2014-04-03 17:27:01', '1981-06-09 01:24:53');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('229', 4, 29, 8, '1981-10-17 21:59:09', '1970-01-15 08:44:53');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('230', 5, 30, 1, '2000-12-19 14:12:00', '2002-01-15 12:59:29');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('231', 1, 31, 3, '1973-03-23 09:43:57', '1991-11-22 02:44:33');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('232', 2, 32, 8, '1995-02-02 23:22:02', '2018-09-03 03:58:39');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('233', 3, 33, 4, '1996-07-15 13:55:28', '2017-09-09 02:34:10');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('234', 4, 34, 9, '1998-07-27 18:23:16', '1980-09-19 22:10:03');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('235', 5, 35, 0, '2014-12-14 01:03:25', '1988-05-10 18:53:46');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('236', 1, 36, 6, '2002-09-26 20:40:36', '1970-07-06 06:50:53');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('237', 2, 37, 4, '2018-05-14 01:15:11', '2013-09-23 16:29:05');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('238', 3, 38, 9, '2009-08-29 03:00:44', '2017-07-10 01:27:26');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('239', 4, 39, 4, '2005-03-19 05:45:18', '1980-10-20 21:21:07');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('240', 5, 40, 1, '2006-03-11 09:30:27', '1992-10-03 22:04:53');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('241', 1, 41, 4, '2003-04-21 22:08:53', '2014-05-21 11:46:49');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('242', 2, 42, 7, '2011-05-23 19:14:01', '1975-08-09 06:27:19');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('243', 3, 43, 9, '1995-01-17 04:19:48', '1986-11-20 20:24:07');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('244', 4, 44, 0, '1995-04-13 11:02:09', '2000-07-13 09:44:37');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('245', 5, 45, 2, '2017-09-05 13:50:00', '1976-09-26 20:30:29');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('246', 1, 46, 0, '1977-09-23 00:19:13', '1978-02-08 23:33:14');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('247', 2, 47, 4, '1992-09-13 18:29:20', '2011-02-17 06:02:46');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('248', 3, 48, 8, '2019-01-16 18:27:57', '1994-05-09 03:47:36');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('249', 4, 49, 7, '1980-05-09 15:03:16', '1975-04-19 15:11:50');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('250', 5, 50, 1, '1994-05-29 23:16:45', '1999-01-12 00:43:40');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('251', 1, 51, 9, '1994-09-28 20:43:15', '1976-03-07 22:08:01');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('252', 2, 52, 4, '1994-11-21 09:18:02', '1975-11-11 19:14:39');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('253', 3, 53, 5, '2005-02-10 13:09:07', '1973-12-17 11:34:26');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('254', 4, 54, 5, '1981-07-14 04:08:37', '1999-08-14 00:18:18');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('255', 5, 55, 9, '2016-09-30 03:07:42', '2018-11-26 23:13:33');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('256', 1, 56, 4, '1989-08-09 00:52:19', '1979-09-15 10:21:00');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('257', 2, 57, 8, '1995-12-31 17:29:39', '1975-08-04 00:35:57');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('258', 3, 58, 8, '2010-01-14 07:49:20', '1979-12-10 03:35:14');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('259', 4, 59, 3, '1998-09-13 18:06:36', '2001-01-28 16:08:14');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('260', 5, 60, 0, '2013-07-06 13:49:16', '2007-10-20 14:15:02');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('261', 1, 61, 7, '2000-03-02 18:03:09', '1981-10-15 12:29:16');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('262', 2, 62, 3, '1974-03-05 11:48:34', '1971-12-08 03:07:45');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('263', 3, 63, 7, '2001-04-22 22:22:32', '2009-04-10 01:54:34');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('264', 4, 64, 7, '1973-12-30 02:57:14', '2017-02-22 14:40:20');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('265', 5, 65, 8, '2018-07-13 12:34:03', '2007-10-12 09:27:19');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('266', 1, 66, 7, '1987-07-03 22:34:49', '1981-07-29 03:55:09');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('267', 2, 67, 0, '2017-01-30 18:40:15', '1984-07-21 19:20:25');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('268', 3, 68, 7, '1997-04-05 22:55:51', '1985-09-03 19:53:28');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('269', 4, 69, 0, '2002-03-07 16:53:46', '2003-12-10 17:35:03');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('270', 5, 70, 10, '2020-06-08 02:57:56', '1988-01-11 11:07:51');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('271', 1, 71, 1, '2001-06-25 11:23:30', '1975-03-17 03:14:00');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('272', 2, 72, 4, '1987-06-27 19:52:03', '2015-02-10 17:35:55');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('273', 3, 73, 4, '2020-05-24 12:04:53', '2004-10-10 03:08:05');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('274', 4, 74, 8, '1974-11-20 20:35:19', '1980-01-15 19:34:42');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('275', 5, 75, 7, '1982-09-21 22:27:18', '2012-04-04 14:52:46');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('276', 1, 76, 6, '2002-07-01 04:20:43', '1982-03-11 06:12:26');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('277', 2, 77, 1, '2019-10-09 09:47:39', '2015-07-15 17:31:42');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('278', 3, 78, 7, '1995-02-23 14:53:40', '1977-04-04 02:31:57');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('279', 4, 79, 7, '1989-10-03 06:43:09', '1979-09-08 05:01:16');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('280', 5, 80, 4, '2015-12-29 19:04:03', '1986-06-14 19:31:27');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('281', 1, 81, 3, '1978-07-19 04:26:56', '1999-11-23 16:54:54');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('282', 2, 82, 6, '1998-08-16 16:49:21', '2003-08-21 12:36:47');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('283', 3, 83, 9, '1979-01-03 22:25:30', '1983-05-04 22:33:08');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('284', 4, 84, 3, '2011-05-03 17:43:20', '1985-12-26 12:21:27');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('285', 5, 85, 4, '2005-01-28 22:08:38', '2003-05-12 23:17:44');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('286', 1, 86, 0, '1993-06-27 01:09:19', '1993-11-09 21:31:35');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('287', 2, 87, 0, '1985-05-19 02:45:42', '2006-10-28 08:30:53');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('288', 3, 88, 6, '1998-09-06 20:46:57', '2002-08-08 18:04:35');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('289', 4, 89, 10, '2006-04-27 10:46:29', '2016-01-04 12:57:47');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('290', 5, 90, 7, '2017-06-29 23:37:08', '1990-09-08 19:19:42');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('291', 1, 91, 5, '1975-03-16 19:36:29', '2006-09-12 14:01:05');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('292', 2, 92, 9, '1984-01-29 09:35:35', '1993-09-27 23:43:45');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('293', 3, 93, 3, '2009-04-02 18:48:44', '2008-02-03 14:37:32');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('294', 4, 94, 7, '2014-03-01 11:44:07', '2006-05-20 04:16:32');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('295', 5, 95, 4, '1983-10-09 08:31:41', '1976-04-13 17:44:51');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('296', 1, 96, 0, '2000-01-05 16:26:38', '1986-02-16 14:47:52');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('297', 2, 97, 2, '2018-05-21 01:33:20', '1994-05-01 14:29:31');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('298', 3, 98, 0, '1972-04-23 13:23:06', '2017-07-10 15:04:55');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('299', 4, 99, 2, '2005-01-30 08:52:28', '2008-11-14 10:30:31');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('300', 5, 100, 0, '1972-05-12 20:36:25', '2014-08-06 02:30:50');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('301', 1, 1, 4, '2008-02-06 22:28:43', '1984-04-27 21:07:26');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('302', 2, 2, 6, '1998-01-15 20:34:20', '2000-03-31 22:38:05');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('303', 3, 3, 0, '1997-05-09 07:21:05', '2018-10-11 04:24:40');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('304', 4, 4, 1, '1971-08-10 09:38:10', '2012-04-14 07:56:03');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('305', 5, 5, 7, '1975-08-19 15:53:14', '2012-11-26 08:05:56');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('306', 1, 6, 7, '1984-05-06 17:44:18', '2008-07-03 02:14:22');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('307', 2, 7, 5, '2005-11-20 02:37:34', '1985-03-05 15:47:30');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('308', 3, 8, 9, '1984-11-17 23:42:29', '1980-05-19 05:38:11');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('309', 4, 9, 10, '1983-06-03 21:39:28', '2010-09-20 17:28:58');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('310', 5, 10, 2, '2009-11-03 16:22:01', '2009-05-10 08:15:51');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('311', 1, 11, 8, '1977-01-18 15:52:19', '1974-08-10 05:57:04');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('312', 2, 12, 9, '1982-05-01 00:57:47', '1994-07-16 08:40:09');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('313', 3, 13, 0, '1986-08-07 02:24:39', '1991-04-30 19:01:49');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('314', 4, 14, 5, '1996-06-02 09:22:56', '1985-01-01 10:44:35');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('315', 5, 15, 8, '2007-04-29 07:04:01', '1972-12-14 15:17:30');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('316', 1, 16, 7, '1992-10-19 04:59:30', '1982-07-30 08:13:11');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('317', 2, 17, 7, '1984-11-29 23:23:05', '2004-09-13 10:08:55');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('318', 3, 18, 0, '1999-03-07 13:48:33', '1977-06-05 11:17:16');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('319', 4, 19, 4, '2007-07-18 06:41:57', '1970-08-13 20:50:15');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('320', 5, 20, 10, '2017-03-29 06:04:26', '1982-07-23 01:54:58');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('321', 1, 21, 10, '2015-12-24 17:49:51', '2002-03-23 08:38:03');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('322', 2, 22, 9, '2016-08-15 20:19:17', '1982-10-13 17:43:01');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('323', 3, 23, 4, '2009-12-12 02:01:08', '2005-09-01 14:46:56');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('324', 4, 24, 4, '1972-12-06 08:15:52', '1996-05-03 04:57:13');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('325', 5, 25, 9, '1999-03-25 09:36:03', '2013-08-16 08:32:35');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('326', 1, 26, 2, '1970-02-28 23:47:30', '2002-11-17 07:25:16');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('327', 2, 27, 8, '2000-06-20 15:04:46', '1995-07-01 14:10:51');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('328', 3, 28, 4, '2008-05-14 02:19:18', '2015-09-16 12:53:43');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('329', 4, 29, 2, '1998-07-22 12:45:42', '1993-09-19 12:01:33');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('330', 5, 30, 4, '2018-01-08 08:17:07', '2000-10-02 13:18:38');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('331', 1, 31, 5, '2010-11-24 05:52:39', '1987-09-02 14:53:48');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('332', 2, 32, 4, '1994-04-03 05:58:54', '1991-05-01 08:13:24');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('333', 3, 33, 8, '2018-04-21 14:07:39', '2012-03-24 03:42:52');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('334', 4, 34, 5, '1977-02-25 12:31:37', '2015-12-14 00:13:06');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('335', 5, 35, 4, '2014-12-20 22:30:50', '1973-08-21 14:02:33');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('336', 1, 36, 6, '1999-04-09 06:16:20', '2014-08-23 19:27:21');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('337', 2, 37, 9, '2011-04-09 16:47:27', '1971-04-16 11:43:59');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('338', 3, 38, 9, '1973-03-08 08:54:42', '2018-06-12 18:37:05');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('339', 4, 39, 0, '2004-09-11 01:26:13', '2017-08-11 10:31:04');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('340', 5, 40, 7, '2018-05-16 10:31:13', '2018-05-06 13:18:46');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('341', 1, 41, 10, '2007-06-29 00:53:44', '1984-11-17 13:40:47');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('342', 2, 42, 1, '1971-07-25 20:27:45', '2010-05-21 21:25:14');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('343', 3, 43, 2, '2017-01-12 15:03:16', '1990-12-08 08:12:16');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('344', 4, 44, 6, '2006-07-28 09:50:13', '2002-07-07 10:54:03');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('345', 5, 45, 4, '1991-10-22 10:17:42', '1975-04-18 11:02:35');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('346', 1, 46, 2, '1990-09-19 21:35:59', '1991-03-25 05:07:47');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('347', 2, 47, 9, '1977-10-01 18:31:23', '2002-10-02 06:39:51');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('348', 3, 48, 6, '1990-12-24 19:53:29', '2003-03-09 17:36:14');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('349', 4, 49, 10, '2006-02-03 17:51:44', '1971-09-08 14:09:30');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('350', 5, 50, 5, '1970-06-23 11:28:59', '2009-04-25 11:38:25');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('351', 1, 51, 8, '1972-01-23 10:45:24', '2016-05-29 02:12:33');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('352', 2, 52, 2, '1975-07-12 02:35:22', '1988-08-31 19:12:35');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('353', 3, 53, 2, '1982-10-10 12:18:51', '1987-12-22 05:42:05');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('354', 4, 54, 6, '2012-05-12 01:21:18', '2012-12-01 15:25:02');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('355', 5, 55, 4, '1975-07-09 06:14:07', '1972-04-10 13:09:00');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('356', 1, 56, 7, '1978-04-20 15:55:12', '1985-11-10 07:59:54');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('357', 2, 57, 10, '1971-03-15 21:10:39', '2008-03-10 06:26:28');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('358', 3, 58, 6, '2005-01-12 03:58:50', '1995-09-15 04:03:48');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('359', 4, 59, 4, '1990-01-21 04:27:55', '1983-08-08 01:24:17');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('360', 5, 60, 3, '1992-02-29 21:34:39', '2013-06-05 06:03:43');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('361', 1, 61, 4, '1974-02-10 13:30:13', '1994-05-30 22:14:53');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('362', 2, 62, 6, '1979-07-22 13:12:01', '1998-06-19 18:24:00');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('363', 3, 63, 8, '1982-01-12 06:46:11', '2006-07-27 23:49:09');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('364', 4, 64, 7, '1974-01-12 06:14:17', '1971-11-09 01:16:17');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('365', 5, 65, 0, '1979-11-04 23:45:13', '2015-07-30 01:03:32');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('366', 1, 66, 7, '2006-01-31 10:19:32', '2002-10-24 10:13:19');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('367', 2, 67, 3, '1971-06-01 01:11:30', '1990-08-21 21:29:47');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('368', 3, 68, 8, '1977-05-21 01:39:14', '1971-07-25 13:54:55');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('369', 4, 69, 3, '2000-08-22 22:10:15', '1990-12-17 05:33:13');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('370', 5, 70, 0, '1992-10-31 14:46:35', '2009-04-02 11:05:49');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('371', 1, 71, 0, '2003-01-06 09:07:56', '2017-10-13 05:43:00');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('372', 2, 72, 8, '1981-10-31 15:45:15', '1972-01-22 18:18:57');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('373', 3, 73, 0, '1973-02-20 18:41:27', '1995-09-12 22:48:13');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('374', 4, 74, 7, '1985-12-05 04:33:06', '1992-03-22 05:54:55');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('375', 5, 75, 8, '1998-06-09 14:52:22', '1999-03-29 18:57:33');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('376', 1, 76, 6, '1979-06-18 20:48:39', '1990-05-27 19:55:49');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('377', 2, 77, 7, '1993-09-30 12:27:18', '2008-08-22 08:04:11');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('378', 3, 78, 8, '1992-03-29 00:34:11', '1992-05-10 10:06:51');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('379', 4, 79, 3, '1993-09-08 03:35:01', '2012-06-29 15:31:06');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('380', 5, 80, 6, '2001-10-16 01:38:31', '1974-06-28 04:21:37');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('381', 1, 81, 6, '1987-02-02 07:21:05', '1996-05-28 14:25:22');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('382', 2, 82, 4, '1995-01-23 01:20:56', '1976-01-14 13:15:37');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('383', 3, 83, 6, '1990-02-15 04:47:03', '1975-05-29 20:32:07');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('384', 4, 84, 10, '1979-12-17 12:17:38', '1976-01-11 15:53:26');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('385', 5, 85, 2, '1988-04-30 06:14:15', '2008-06-20 22:32:01');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('386', 1, 86, 1, '2006-12-19 05:25:34', '1991-05-09 09:44:46');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('387', 2, 87, 7, '1975-08-20 06:24:58', '2002-07-08 22:57:48');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('388', 3, 88, 4, '1986-01-28 23:51:11', '1977-11-28 10:43:00');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('389', 4, 89, 8, '1973-08-06 04:34:31', '2006-07-13 20:23:24');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('390', 5, 90, 6, '2012-08-01 21:58:07', '2004-08-19 09:12:27');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('391', 1, 91, 0, '1988-10-27 04:06:15', '2001-05-09 17:17:42');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('392', 2, 92, 0, '1978-02-14 20:52:37', '1992-08-23 08:30:17');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('393', 3, 93, 1, '1980-10-01 03:45:34', '1979-04-12 15:43:07');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('394', 4, 94, 1, '1989-10-15 15:28:33', '2006-03-20 18:17:51');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('395', 5, 95, 0, '1975-02-18 05:12:09', '1980-03-15 17:49:50');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('396', 1, 96, 3, '1972-06-18 22:43:02', '2010-04-12 03:46:10');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('397', 2, 97, 8, '1986-04-27 17:41:31', '2020-06-20 15:56:49');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('398', 3, 98, 2, '1975-03-19 22:43:52', '1989-02-06 08:40:16');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('399', 4, 99, 5, '1992-01-21 00:41:01', '2005-08-20 05:17:00');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('400', 5, 100, 2, '2008-06-25 07:57:14', '2011-08-26 10:19:08');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('401', 1, 1, 1, '2019-05-16 18:21:28', '2005-08-22 19:29:34');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('402', 2, 2, 6, '2008-07-26 07:19:49', '2014-02-25 01:07:03');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('403', 3, 3, 2, '1970-09-12 04:33:40', '2011-09-19 03:16:40');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('404', 4, 4, 7, '1974-02-13 12:00:06', '1975-10-10 13:03:10');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('405', 5, 5, 7, '2002-05-24 01:25:22', '2010-02-20 20:06:00');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('406', 1, 6, 3, '1992-08-14 08:40:16', '2016-01-03 05:33:32');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('407', 2, 7, 8, '2015-04-12 21:41:23', '2000-01-27 08:49:51');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('408', 3, 8, 0, '1990-04-11 08:02:04', '2018-08-18 22:51:22');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('409', 4, 9, 9, '1991-07-08 12:04:01', '1987-06-30 01:37:34');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('410', 5, 10, 3, '1976-06-07 23:24:22', '1994-06-18 02:56:58');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('411', 1, 11, 1, '1970-06-20 16:35:44', '2006-10-11 17:48:56');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('412', 2, 12, 2, '1974-07-03 23:09:15', '2007-05-13 15:01:33');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('413', 3, 13, 2, '2007-01-28 18:37:19', '1975-02-10 18:37:53');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('414', 4, 14, 0, '1993-06-29 14:24:44', '2006-12-12 05:16:58');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('415', 5, 15, 6, '1983-02-01 16:44:26', '1994-05-03 16:26:55');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('416', 1, 16, 8, '2013-06-15 06:32:36', '1987-04-04 11:48:50');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('417', 2, 17, 9, '2000-09-02 05:28:40', '1985-04-03 17:25:50');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('418', 3, 18, 2, '2009-08-21 12:17:46', '1994-12-15 10:33:21');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('419', 4, 19, 4, '1988-06-07 17:24:01', '2001-06-30 11:01:48');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('420', 5, 20, 0, '1992-06-27 03:33:58', '1977-03-22 09:06:52');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('421', 1, 21, 3, '2013-05-17 02:42:54', '1982-01-17 09:04:27');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('422', 2, 22, 3, '2004-12-09 23:08:55', '1986-07-22 21:11:23');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('423', 3, 23, 5, '1990-06-15 03:16:31', '1983-10-02 05:06:29');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('424', 4, 24, 1, '2013-04-17 09:16:06', '2002-04-22 19:59:36');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('425', 5, 25, 10, '2005-08-31 09:35:18', '2008-03-10 05:04:32');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('426', 1, 26, 10, '2009-02-15 19:40:08', '1995-05-24 14:05:23');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('427', 2, 27, 5, '2004-03-10 00:52:52', '2010-07-24 11:35:23');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('428', 3, 28, 9, '2005-01-05 14:48:06', '1984-04-07 05:25:51');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('429', 4, 29, 6, '2012-04-17 15:55:47', '1977-05-30 02:23:23');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('430', 5, 30, 10, '2009-12-19 21:31:38', '2014-02-20 21:07:34');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('431', 1, 31, 5, '1971-06-05 03:53:19', '2014-06-28 20:30:01');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('432', 2, 32, 7, '1977-10-24 14:00:26', '1991-02-16 05:02:30');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('433', 3, 33, 9, '2013-06-10 05:49:25', '1997-02-10 16:51:42');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('434', 4, 34, 8, '1987-08-22 10:13:29', '1979-09-06 17:50:42');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('435', 5, 35, 9, '1995-11-25 20:03:27', '2012-06-28 19:33:42');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('436', 1, 36, 10, '1986-04-27 20:10:34', '1986-03-08 23:22:38');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('437', 2, 37, 7, '1975-08-10 18:46:41', '2003-01-08 04:05:41');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('438', 3, 38, 9, '2003-04-26 06:30:40', '1975-03-15 21:48:12');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('439', 4, 39, 0, '2009-11-28 01:11:45', '2010-12-28 04:41:39');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('440', 5, 40, 8, '2020-01-19 00:28:00', '1978-02-22 22:08:35');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('441', 1, 41, 6, '1983-05-19 02:17:33', '1988-03-10 08:34:18');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('442', 2, 42, 7, '1988-12-14 05:54:12', '1992-08-19 00:49:40');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('443', 3, 43, 9, '1978-05-29 05:32:28', '2019-11-05 07:50:32');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('444', 4, 44, 5, '1982-02-10 10:48:44', '1998-12-11 14:50:35');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('445', 5, 45, 9, '1980-01-20 12:36:09', '1998-04-07 08:49:07');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('446', 1, 46, 10, '2009-06-07 20:41:37', '1987-10-28 12:26:47');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('447', 2, 47, 10, '1976-02-07 16:03:19', '2020-06-03 12:06:21');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('448', 3, 48, 4, '2020-04-14 09:56:08', '2010-08-17 12:45:07');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('449', 4, 49, 2, '1990-10-08 05:48:10', '2004-10-01 18:07:22');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('450', 5, 50, 5, '2005-09-03 06:51:51', '2010-05-27 19:54:02');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('451', 1, 51, 1, '2019-06-24 03:32:03', '1978-06-15 23:30:29');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('452', 2, 52, 7, '1995-01-18 17:24:44', '2016-11-16 00:54:02');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('453', 3, 53, 4, '2000-10-30 13:54:09', '1976-12-31 11:16:16');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('454', 4, 54, 4, '2001-05-20 05:36:31', '2007-05-30 16:26:35');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('455', 5, 55, 2, '1990-09-07 07:39:16', '2004-02-16 23:29:19');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('456', 1, 56, 4, '1992-03-16 15:27:14', '2013-04-03 05:46:40');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('457', 2, 57, 7, '1979-01-04 04:37:34', '2009-06-30 07:57:13');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('458', 3, 58, 5, '1981-11-04 11:22:16', '1977-05-10 07:29:57');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('459', 4, 59, 2, '1995-07-07 04:05:38', '2002-04-18 09:16:58');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('460', 5, 60, 1, '1970-05-19 07:29:00', '1980-07-02 20:43:13');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('461', 1, 61, 5, '2014-07-20 23:17:24', '1976-10-02 13:41:45');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('462', 2, 62, 0, '2015-03-15 12:33:51', '1997-01-15 18:32:20');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('463', 3, 63, 10, '2004-11-21 00:36:26', '1997-10-04 14:34:01');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('464', 4, 64, 7, '1978-02-22 22:40:57', '1971-03-01 21:05:46');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('465', 5, 65, 9, '1999-07-08 12:44:39', '1996-01-14 03:57:54');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('466', 1, 66, 8, '2008-10-30 22:30:02', '1980-03-30 22:16:17');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('467', 2, 67, 4, '1986-02-23 13:27:27', '1973-12-21 22:16:09');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('468', 3, 68, 9, '1986-09-14 01:23:25', '1983-01-12 04:22:10');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('469', 4, 69, 4, '1987-11-04 14:24:47', '2015-01-13 18:50:05');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('470', 5, 70, 10, '2006-11-28 03:28:11', '1986-08-19 09:59:57');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('471', 1, 71, 5, '1992-03-26 14:32:30', '2019-05-24 01:12:38');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('472', 2, 72, 1, '2001-08-15 05:34:14', '1978-06-21 00:12:50');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('473', 3, 73, 5, '1995-12-28 07:14:22', '1983-04-13 23:27:24');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('474', 4, 74, 4, '2000-06-03 01:06:51', '1978-08-14 17:43:18');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('475', 5, 75, 10, '2002-05-11 14:43:56', '2013-07-09 08:36:09');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('476', 1, 76, 10, '1994-04-11 07:07:15', '2018-07-14 08:51:26');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('477', 2, 77, 8, '1973-03-07 01:02:07', '1974-05-20 13:16:14');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('478', 3, 78, 5, '2002-03-13 08:56:04', '1982-05-31 22:01:51');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('479', 4, 79, 6, '2007-04-30 21:39:14', '2012-02-06 11:37:22');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('480', 5, 80, 4, '1975-01-14 06:09:55', '1984-06-19 01:29:05');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('481', 1, 81, 10, '1995-07-24 12:33:36', '1971-07-31 21:42:30');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('482', 2, 82, 8, '1981-08-25 02:10:16', '1980-06-14 05:43:36');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('483', 3, 83, 0, '1978-11-04 10:53:13', '1971-06-28 16:06:10');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('484', 4, 84, 8, '2004-07-07 04:59:45', '1971-05-16 04:07:23');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('485', 5, 85, 1, '2016-07-26 21:22:42', '1995-01-20 22:06:39');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('486', 1, 86, 9, '2014-07-31 02:59:03', '1973-08-29 09:02:04');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('487', 2, 87, 7, '2000-09-11 18:53:37', '1976-08-06 09:58:28');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('488', 3, 88, 10, '1972-05-11 16:58:22', '1973-08-28 06:34:50');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('489', 4, 89, 1, '1998-09-13 12:16:46', '1982-03-31 01:28:24');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('490', 5, 90, 5, '2006-07-12 12:35:55', '1977-06-19 02:22:17');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('491', 1, 91, 7, '1976-12-13 17:49:02', '2002-11-09 11:23:27');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('492', 2, 92, 7, '2013-06-04 05:32:37', '2007-11-17 23:18:28');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('493', 3, 93, 8, '1991-10-18 01:30:55', '1984-08-24 03:23:29');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('494', 4, 94, 6, '2000-05-23 11:32:15', '1997-08-07 23:00:38');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('495', 5, 95, 9, '1990-04-19 15:13:25', '1985-12-16 23:11:09');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('496', 1, 96, 1, '1996-10-07 23:04:14', '1998-04-27 14:37:00');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('497', 2, 97, 8, '1991-02-28 22:41:23', '2011-05-12 16:53:34');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('498', 3, 98, 6, '2001-05-28 10:59:38', '1982-12-03 08:45:24');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('499', 4, 99, 7, '2016-12-05 07:22:46', '1996-04-23 09:09:10');
INSERT INTO `storehouses_products` (`id`, `storehouse_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES ('500', 5, 100, 6, '1979-01-16 08:33:28', '1983-06-28 16:27:45');


INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('1', '48', '2004-09-29 08:41:51', '2004-10-07 09:44:25');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('2', '53', '2004-05-30 21:25:32', '1990-01-31 19:04:40');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('3', '45', '1986-12-01 16:23:20', '1992-02-22 13:05:08');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('4', '3', '1993-07-27 18:29:21', '2015-10-26 03:11:34');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('5', '79', '1988-08-03 09:01:42', '1984-10-26 14:13:41');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('6', '30', '1993-01-30 07:07:58', '1989-02-02 12:54:19');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('7', '50', '1980-04-19 17:26:42', '1979-02-05 09:51:53');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('8', '18', '1999-03-21 16:40:25', '1991-09-12 13:40:44');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('9', '78', '1978-07-30 20:15:56', '2007-09-03 17:25:40');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('10', '44', '1987-08-13 03:07:30', '1973-06-05 12:26:38');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('11', '98', '1989-02-19 20:32:34', '1974-03-02 08:54:12');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('12', '70', '2007-02-07 11:06:08', '2009-09-20 13:18:23');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('13', '38', '1971-07-21 01:40:13', '2005-01-28 07:38:59');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('14', '74', '1972-07-04 02:50:16', '2020-06-20 02:20:56');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('15', '57', '1987-03-18 12:58:31', '1990-10-12 19:52:11');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('16', '96', '1987-01-22 16:44:40', '2015-11-16 09:01:18');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('17', '64', '2002-11-24 11:29:08', '1996-10-15 10:40:29');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('18', '78', '2008-06-28 04:36:47', '2016-03-25 11:43:40');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('19', '91', '2015-09-29 13:28:06', '2002-04-08 23:09:19');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('20', '95', '1977-03-26 17:43:56', '1978-05-26 07:02:51');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('21', '17', '2009-10-16 16:20:12', '2017-01-25 17:06:11');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('22', '23', '1978-12-24 12:12:24', '2017-08-26 10:58:57');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('23', '6', '1971-11-24 03:18:29', '1991-12-15 00:58:08');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('24', '65', '1970-08-13 20:32:44', '2005-04-09 18:01:20');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('25', '84', '2001-11-05 18:32:24', '1987-06-02 12:43:33');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('26', '4', '2019-02-20 20:20:55', '1970-09-12 04:37:08');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('27', '60', '2010-06-05 06:55:17', '2012-08-29 09:19:57');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('28', '44', '2011-12-09 03:58:39', '1996-08-31 03:00:15');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('29', '61', '2007-12-08 13:04:15', '2006-10-04 19:14:49');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('30', '86', '2007-06-26 15:48:53', '2015-11-10 11:30:32');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('31', '1', '2008-07-05 02:54:56', '1998-03-29 20:22:36');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('32', '9', '1979-11-28 02:47:22', '2016-06-22 01:17:17');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('33', '38', '2003-09-13 00:21:05', '2019-03-01 08:56:02');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('34', '45', '2012-12-19 07:54:02', '2008-08-08 22:14:10');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('35', '12', '2010-04-15 22:58:44', '1970-07-11 22:35:48');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('36', '17', '2009-12-27 12:43:21', '2015-02-19 01:17:59');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('37', '75', '1976-01-05 01:07:24', '2013-05-14 06:38:17');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('38', '62', '1987-11-25 14:35:31', '1995-10-11 12:13:00');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('39', '35', '1975-08-13 03:21:59', '2015-03-10 07:13:24');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('40', '52', '1997-08-04 06:13:00', '2009-08-29 23:11:10');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('41', '5', '2001-11-10 01:58:18', '1974-12-19 23:14:37');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('42', '32', '1999-06-10 11:52:59', '1977-02-04 18:00:17');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('43', '21', '1981-02-02 21:13:45', '2003-11-30 16:20:58');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('44', '43', '2001-11-07 18:49:09', '1986-11-26 12:44:58');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('45', '6', '1994-02-23 06:28:43', '1984-05-08 08:12:33');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('46', '78', '2018-01-20 10:56:29', '2001-09-12 20:16:44');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('47', '38', '1978-10-16 00:27:20', '1974-04-03 22:37:12');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('48', '70', '1999-11-17 04:02:47', '2014-05-24 14:19:41');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('49', '55', '1997-08-03 11:25:43', '2000-11-22 00:35:57');
INSERT INTO `orders` (`id`, `users_id`, `created_at`, `updated_at`) VALUES ('50', '28', '1978-02-18 09:21:21', '2000-05-13 13:31:18');


INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('1', '42', '96', 2, '2010-08-04 00:53:26', '2008-08-24 11:26:16');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('2', '3', '78', 1, '1972-01-07 04:58:26', '1983-08-06 08:51:04');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('3', '35', '52', 2, '1999-01-06 01:38:39', '1972-01-20 21:03:41');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('4', '24', '36', 2, '2002-04-25 00:21:03', '2000-11-02 22:12:10');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('5', '31', '58', 2, '2005-07-29 23:18:12', '1995-11-09 22:24:07');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('6', '27', '35', 2, '2012-10-04 10:36:28', '1971-02-24 06:57:21');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('7', '19', '9', 2, '1989-12-08 23:09:46', '1973-09-10 08:15:52');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('8', '35', '60', 1, '1983-01-21 14:28:23', '1992-05-05 22:02:05');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('9', '49', '73', 2, '1985-03-16 07:05:11', '2006-07-07 08:03:01');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('10', '10', '46', 1, '2004-03-02 16:15:30', '2002-05-17 01:14:54');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('11', '7', '32', 1, '1994-04-21 09:05:54', '2004-03-10 13:47:31');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('12', '18', '100', 1, '2003-08-25 10:38:35', '2016-08-22 16:45:52');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('13', '7', '77', 1, '2019-12-26 22:41:22', '1997-05-16 08:57:46');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('14', '14', '12', 1, '2020-05-15 21:50:59', '2005-04-04 19:01:58');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('15', '11', '21', 2, '1970-02-13 13:55:25', '1984-06-09 09:33:19');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('16', '2', '4', 1, '1974-10-12 02:15:55', '2012-08-23 13:45:52');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('17', '9', '10', 2, '2009-08-11 10:55:15', '2013-10-24 19:56:14');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('18', '41', '86', 1, '2015-06-20 05:20:24', '2007-04-30 17:08:37');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('19', '31', '29', 1, '1990-08-03 09:23:58', '2000-12-17 03:22:54');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('20', '11', '22', 2, '2013-09-01 18:05:51', '1994-06-28 04:06:22');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('21', '44', '74', 1, '1998-12-30 03:12:17', '2001-03-02 18:47:23');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('22', '28', '24', 1, '1977-04-30 00:43:01', '1990-08-08 12:24:20');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('23', '41', '26', 1, '1987-08-04 07:24:51', '1986-04-11 18:23:00');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('24', '42', '78', 1, '1996-05-13 21:23:15', '1995-12-19 03:14:15');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('25', '49', '2', 2, '1984-07-23 21:40:32', '1973-02-13 06:41:39');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('26', '12', '11', 2, '2005-08-21 19:35:06', '2004-07-03 19:43:59');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('27', '17', '58', 2, '2002-10-03 16:32:51', '1995-07-21 09:50:46');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('28', '6', '46', 1, '1970-12-03 14:23:46', '1989-03-27 06:55:43');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('29', '17', '38', 2, '1976-09-21 08:34:44', '2013-05-22 22:34:13');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('30', '29', '56', 1, '2018-08-20 12:37:19', '2003-07-11 10:34:56');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('31', '29', '60', 1, '1995-11-10 10:41:18', '1972-08-16 17:38:35');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('32', '30', '74', 2, '1981-02-13 22:44:24', '2003-03-06 05:04:56');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('33', '35', '41', 1, '1983-12-27 10:36:25', '1988-09-23 15:13:32');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('34', '30', '30', 1, '1995-01-23 03:45:55', '1999-04-10 17:15:46');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('35', '35', '81', 2, '1987-09-24 03:09:19', '1989-05-22 11:12:09');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('36', '26', '55', 1, '2017-01-18 14:18:33', '1999-01-26 14:02:04');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('37', '27', '7', 1, '2014-05-27 02:53:50', '1996-08-30 12:15:25');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('38', '39', '36', 2, '2009-02-02 00:22:27', '2007-02-15 06:41:27');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('39', '16', '62', 2, '1988-11-01 17:21:57', '1977-03-06 06:26:38');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('40', '7', '30', 2, '1988-08-11 03:52:44', '1993-12-24 14:36:07');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('41', '32', '36', 2, '1992-11-21 03:02:21', '1984-04-14 22:34:51');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('42', '20', '97', 2, '1990-07-09 10:05:19', '1981-07-24 12:22:32');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('43', '47', '50', 1, '2001-08-30 13:04:01', '1974-10-26 10:30:05');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('44', '21', '28', 2, '1971-05-02 20:01:07', '1988-09-04 23:50:54');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('45', '44', '98', 1, '1981-03-17 19:51:31', '2006-11-03 13:58:57');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('46', '42', '45', 2, '1995-10-17 07:53:12', '1987-02-27 14:37:40');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('47', '29', '42', 1, '2011-06-17 17:00:22', '2006-04-19 06:11:20');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('48', '10', '27', 1, '1993-03-21 07:33:48', '2003-03-10 04:51:29');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('49', '42', '78', 1, '2004-03-25 14:55:31', '2007-02-08 07:21:54');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('50', '28', '51', 1, '1991-09-12 16:17:27', '1987-02-22 10:57:35');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('51', '30', '7', 1, '2006-05-16 18:11:34', '1975-10-25 10:22:43');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('52', '3', '13', 2, '2012-02-09 20:12:59', '2003-06-14 01:51:53');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('53', '7', '83', 2, '1991-03-17 11:18:32', '2007-12-12 21:21:11');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('54', '24', '46', 1, '1988-12-24 15:58:51', '1982-10-09 01:52:06');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('55', '22', '61', 2, '1984-04-17 09:44:47', '1991-09-16 05:54:15');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('56', '38', '7', 2, '1981-11-06 21:39:05', '1975-07-04 13:02:36');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('57', '49', '14', 1, '2001-10-16 17:40:18', '1992-02-16 15:59:09');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('58', '2', '90', 2, '1984-06-28 07:28:06', '2017-03-16 04:08:23');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('59', '32', '45', 2, '2019-10-29 17:40:52', '1986-03-23 03:07:28');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('60', '9', '50', 2, '1974-05-14 11:25:56', '2016-04-21 06:31:19');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('61', '22', '100', 1, '1972-12-03 03:16:07', '2014-07-06 20:27:33');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('62', '48', '100', 2, '2008-11-07 15:07:29', '1984-01-29 20:55:58');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('63', '21', '13', 2, '1984-12-24 11:53:39', '1997-03-08 09:06:14');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('64', '14', '24', 1, '1970-12-24 17:51:07', '2007-12-08 21:01:20');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('65', '45', '83', 2, '2013-07-11 01:35:05', '2007-12-30 18:34:13');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('66', '38', '49', 1, '1986-05-07 07:57:52', '2015-04-04 05:53:57');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('67', '45', '80', 1, '1983-08-30 11:25:10', '2002-11-08 14:38:26');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('68', '31', '3', 2, '2004-11-15 15:01:20', '1987-02-18 13:31:23');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('69', '32', '9', 1, '1976-01-23 14:02:05', '1989-11-12 18:29:57');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('70', '24', '7', 2, '2008-04-09 15:08:37', '1992-01-10 22:31:41');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('71', '35', '22', 2, '1990-02-08 05:26:35', '1982-07-17 04:57:36');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('72', '7', '65', 1, '1984-07-10 18:36:01', '1979-11-18 21:28:51');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('73', '18', '17', 2, '2013-08-14 09:51:43', '2015-09-26 00:26:42');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('74', '28', '99', 2, '1992-02-13 00:09:42', '2014-10-06 16:14:31');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('75', '31', '72', 1, '1990-06-30 16:59:59', '2014-03-30 11:21:30');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('76', '25', '3', 2, '2004-12-02 18:23:02', '1979-03-23 04:33:47');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('77', '36', '43', 2, '1977-09-21 03:31:54', '2006-02-04 05:46:28');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('78', '2', '13', 1, '2016-09-13 14:20:18', '1987-03-30 11:33:22');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('79', '28', '29', 2, '2020-03-04 16:48:07', '2012-05-13 18:07:54');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('80', '19', '45', 1, '1991-02-23 08:07:28', '1979-01-19 16:07:28');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('81', '6', '11', 1, '2017-10-16 15:37:19', '2013-07-16 15:54:38');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('82', '47', '1', 1, '1994-04-13 07:30:31', '1971-08-26 09:49:21');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('83', '45', '54', 1, '1995-05-28 14:11:46', '1970-11-12 03:20:47');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('84', '2', '52', 1, '2013-11-06 14:10:58', '2019-05-18 18:36:25');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('85', '32', '51', 2, '1986-01-20 10:30:07', '1978-11-07 21:05:43');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('86', '30', '32', 2, '1989-07-09 02:53:53', '1973-08-22 00:32:13');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('87', '36', '72', 1, '1984-09-27 01:38:46', '1982-11-23 14:36:02');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('88', '48', '8', 1, '1995-09-18 09:48:34', '2018-07-21 21:21:40');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('89', '44', '51', 2, '2014-01-19 01:25:53', '1989-06-22 18:34:09');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('90', '3', '48', 1, '2011-12-19 19:18:47', '1976-12-19 01:46:59');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('91', '11', '55', 1, '1988-02-13 22:45:12', '1997-08-05 15:57:55');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('92', '26', '93', 2, '2004-06-27 07:55:54', '1990-04-08 18:50:05');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('93', '49', '54', 2, '1993-12-13 22:18:42', '1987-12-07 20:51:27');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('94', '3', '52', 1, '1988-09-12 23:04:37', '1982-01-14 00:02:40');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('95', '42', '42', 2, '1985-04-05 10:20:41', '2015-07-18 15:32:15');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('96', '49', '94', 1, '1976-12-09 12:56:35', '1997-09-20 18:55:56');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('97', '26', '90', 2, '2010-01-11 14:25:03', '2018-09-17 20:58:19');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('98', '47', '42', 1, '2009-04-12 17:42:01', '1975-09-06 12:38:03');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('99', '22', '97', 1, '1977-02-25 09:50:24', '1998-04-15 18:06:34');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('100', '47', '6', 2, '1989-09-19 05:37:07', '1973-10-05 02:17:48');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('101', '24', '52', 1, '2007-07-08 08:15:05', '2013-03-31 18:43:37');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('102', '19', '19', 2, '2007-07-21 03:07:58', '1989-04-19 22:12:27');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('103', '12', '33', 1, '2002-08-05 03:09:46', '1998-09-06 09:56:03');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('104', '13', '11', 1, '1979-10-10 08:45:29', '1978-08-02 19:54:18');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('105', '42', '32', 1, '2008-09-23 03:44:54', '1980-04-03 20:37:31');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('106', '29', '5', 1, '2001-11-03 05:54:50', '2012-11-18 18:34:11');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('107', '43', '9', 1, '1995-02-11 10:17:14', '2000-01-13 02:59:45');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('108', '49', '83', 1, '1994-06-28 12:23:19', '2001-01-14 23:37:00');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('109', '31', '3', 1, '2019-10-08 09:04:39', '2019-10-16 22:43:05');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('110', '18', '44', 1, '1987-01-02 01:52:35', '2005-01-15 08:12:11');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('111', '22', '32', 2, '2010-10-17 13:19:05', '1993-06-03 22:41:26');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('112', '19', '96', 1, '2019-10-22 22:32:06', '2020-06-15 21:19:33');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('113', '11', '31', 2, '1975-07-22 01:24:35', '1995-12-22 03:10:53');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('114', '19', '65', 1, '1996-05-24 21:49:00', '2006-09-08 05:35:31');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('115', '14', '31', 2, '2016-06-23 07:51:16', '2012-01-23 02:40:21');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('116', '35', '73', 2, '2003-01-18 22:46:38', '1994-10-14 08:58:45');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('117', '42', '7', 1, '2020-04-26 18:06:21', '1992-03-19 23:27:08');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('118', '46', '6', 2, '2014-06-24 13:41:58', '2004-09-17 19:44:06');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('119', '20', '17', 1, '1971-03-11 10:18:15', '1995-03-02 14:54:44');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('120', '8', '22', 2, '1988-01-18 01:19:32', '2005-05-26 06:46:08');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('121', '24', '74', 2, '2018-04-28 06:15:52', '1983-08-03 20:46:20');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('122', '14', '34', 1, '1982-07-05 07:28:09', '1971-05-21 17:24:12');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('123', '41', '24', 1, '1973-08-19 15:33:45', '1981-12-25 03:28:43');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('124', '9', '43', 1, '1987-04-29 16:54:57', '1983-05-06 05:55:03');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('125', '13', '52', 1, '1997-07-20 23:49:27', '1976-08-07 17:32:28');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('126', '44', '70', 1, '1974-07-05 15:51:54', '1985-07-10 12:04:24');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('127', '42', '23', 2, '2004-05-14 02:13:33', '1970-09-30 13:47:50');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('128', '33', '3', 1, '1989-12-07 07:47:04', '1973-11-10 14:25:49');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('129', '27', '3', 1, '1985-03-27 14:42:47', '1987-03-26 01:47:54');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('130', '34', '80', 2, '2003-06-05 04:34:33', '2005-09-09 03:30:50');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('131', '17', '37', 2, '2016-04-27 21:58:45', '2004-10-31 07:17:55');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('132', '26', '16', 2, '2002-06-25 07:12:33', '2007-08-08 16:32:14');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('133', '22', '43', 2, '1980-10-06 11:05:48', '2000-03-05 05:04:14');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('134', '11', '83', 1, '2009-03-22 10:47:51', '2013-08-15 04:46:16');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('135', '30', '36', 2, '1993-04-28 11:57:44', '1979-07-24 20:36:53');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('136', '2', '7', 2, '1982-10-28 20:06:44', '2006-01-12 17:26:18');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('137', '5', '31', 1, '1980-02-21 15:17:03', '1991-09-19 13:03:56');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('138', '20', '91', 1, '1970-11-09 22:37:01', '1990-12-13 15:47:02');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('139', '27', '57', 1, '1999-08-22 07:07:49', '1976-08-23 11:05:46');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('140', '17', '80', 2, '2009-04-14 10:47:56', '1987-06-21 20:10:02');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('141', '4', '20', 2, '1970-06-02 12:36:16', '2018-02-27 01:13:25');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('142', '25', '90', 1, '2014-12-01 11:26:56', '2007-07-08 06:21:13');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('143', '22', '14', 2, '1986-08-25 09:29:18', '2016-05-14 02:36:20');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('144', '47', '96', 2, '1986-01-14 15:57:01', '2007-07-20 09:31:13');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('145', '8', '60', 1, '2008-07-10 23:04:43', '1990-05-08 15:33:20');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('146', '38', '49', 1, '2011-08-11 10:16:09', '1995-11-27 19:29:08');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('147', '49', '26', 1, '1985-05-28 22:38:35', '2014-09-28 06:17:41');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('148', '32', '40', 2, '2001-02-26 23:05:31', '2004-06-12 14:49:39');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('149', '35', '85', 2, '2005-01-19 15:52:16', '1989-11-23 01:22:32');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('150', '11', '28', 1, '2007-03-29 23:09:32', '1991-07-02 17:21:43');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('151', '11', '26', 1, '1979-09-02 03:11:26', '1997-12-29 15:22:35');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('152', '17', '30', 2, '1998-02-15 23:57:00', '1977-08-15 05:37:57');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('153', '28', '74', 1, '1975-06-29 17:54:39', '1983-04-22 04:19:23');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('154', '11', '9', 1, '1978-10-19 00:40:45', '1998-02-07 10:13:31');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('155', '15', '55', 1, '2003-01-03 16:13:51', '2008-01-10 22:23:39');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('156', '44', '37', 1, '1992-01-12 07:38:16', '1983-11-05 10:09:01');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('157', '37', '37', 2, '1999-03-06 01:31:06', '2016-12-14 18:03:45');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('158', '13', '17', 1, '1998-03-07 13:30:27', '1989-01-17 17:08:21');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('159', '26', '18', 1, '2006-04-15 21:16:48', '1987-10-25 06:33:28');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('160', '6', '67', 1, '2013-03-21 06:36:47', '1991-08-30 15:03:57');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('161', '39', '86', 2, '1992-01-19 20:38:05', '2007-03-20 16:39:17');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('162', '8', '74', 2, '2004-06-24 06:29:07', '2009-07-08 02:52:57');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('163', '6', '79', 1, '1970-07-14 05:04:48', '2011-02-23 11:58:41');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('164', '7', '80', 1, '1998-04-26 11:17:41', '1991-03-19 21:59:29');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('165', '32', '34', 2, '1970-04-10 12:36:04', '2007-04-19 12:52:24');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('166', '4', '84', 1, '2014-02-16 12:58:48', '2002-12-19 21:41:46');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('167', '30', '41', 2, '1982-06-26 03:15:15', '1988-10-15 14:23:36');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('168', '7', '15', 2, '2003-10-18 07:27:20', '1977-01-25 17:12:21');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('169', '7', '34', 1, '2005-02-19 03:14:09', '1983-03-10 19:07:00');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('170', '12', '43', 1, '2014-12-06 12:27:28', '2015-03-19 20:54:49');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('171', '44', '11', 1, '1984-04-16 15:22:03', '1972-08-03 14:24:23');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('172', '40', '62', 2, '1974-05-18 22:06:15', '1992-06-02 01:09:33');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('173', '24', '5', 1, '2000-12-28 22:56:12', '1983-12-16 23:53:00');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('174', '39', '98', 1, '2012-07-16 15:26:36', '1977-08-25 11:44:32');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('175', '12', '90', 1, '1972-07-31 04:37:13', '1972-07-14 16:09:51');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('176', '32', '100', 1, '1973-07-27 20:18:17', '2009-05-23 00:33:33');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('177', '38', '79', 2, '2009-10-04 14:41:16', '2014-10-23 12:34:04');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('178', '37', '87', 2, '2012-06-25 04:02:26', '1976-03-18 16:35:03');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('179', '29', '85', 2, '1975-10-24 22:28:11', '1978-10-25 17:28:12');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('180', '34', '21', 1, '2020-05-25 02:46:42', '1976-09-14 09:41:22');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('181', '10', '74', 1, '1981-02-05 06:16:50', '2013-05-27 01:51:04');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('182', '2', '78', 2, '1974-02-19 07:57:57', '1996-12-20 11:29:34');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('183', '7', '16', 2, '1991-05-22 19:59:10', '1980-06-14 21:50:54');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('184', '46', '28', 2, '2016-10-30 01:24:39', '2013-05-06 19:55:05');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('185', '25', '15', 2, '2014-08-09 15:59:22', '1974-10-29 23:58:30');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('186', '36', '37', 1, '1984-08-22 13:02:45', '2019-07-20 02:44:47');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('187', '13', '50', 1, '2010-06-25 13:31:10', '2006-07-13 16:42:25');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('188', '49', '73', 1, '2014-02-04 21:29:32', '2003-05-18 16:38:19');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('189', '27', '75', 1, '1990-01-25 21:03:15', '1986-05-12 13:56:01');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('190', '35', '76', 2, '1981-11-05 22:39:49', '1993-12-06 20:34:14');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('191', '33', '34', 1, '1998-01-21 19:00:17', '1973-09-28 09:13:07');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('192', '38', '40', 1, '1984-02-14 12:09:38', '1995-07-13 15:10:26');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('193', '7', '48', 1, '2002-12-12 09:45:15', '1973-06-26 06:25:25');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('194', '13', '70', 1, '1997-01-09 05:15:32', '1989-02-20 04:08:17');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('195', '17', '93', 2, '1981-07-20 17:46:18', '2002-12-11 03:45:53');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('196', '45', '51', 2, '1970-02-03 22:16:58', '1997-08-06 23:01:19');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('197', '33', '94', 1, '1978-04-16 18:00:41', '1993-10-28 05:30:13');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('198', '15', '80', 2, '2014-03-03 03:06:18', '2007-04-23 05:01:35');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('199', '5', '20', 1, '2002-02-04 16:44:36', '2005-12-19 10:18:38');
INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `total`, `created_at`, `updated_at`) VALUES ('200', '4', '58', 2, '2003-03-13 12:36:01', '1995-10-25 07:41:58');


INSERT INTO `discounts` (`id`, `user_id`, `products_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('1', 5, '78', '3', '2018-06-02 08:48:09', '2011-09-02 13:19:36', '2008-08-22 12:23:34', '1993-03-18 14:55:12');
INSERT INTO `discounts` (`id`, `user_id`, `products_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('2', 39, '85', '1', '1976-04-12 21:41:12', '1978-06-11 20:20:25', '1978-05-01 20:28:14', '2007-07-13 09:22:49');
INSERT INTO `discounts` (`id`, `user_id`, `products_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('3', 38, '25', '1', '1991-06-18 02:37:38', '1979-02-02 20:04:47', '2002-12-02 03:50:42', '1998-07-24 22:25:39');
INSERT INTO `discounts` (`id`, `user_id`, `products_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('4', 51, '81', '4', '1979-09-19 22:44:02', '2017-07-01 00:59:03', '1981-05-22 15:29:28', '2016-02-14 04:04:20');
INSERT INTO `discounts` (`id`, `user_id`, `products_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('5', 89, '83', '5', '1982-10-08 01:25:23', '1995-04-19 00:37:22', '1992-12-17 03:10:11', '1993-06-11 03:37:03');
INSERT INTO `discounts` (`id`, `user_id`, `products_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('6', 60, '77', '4', '1988-11-17 13:55:55', '1970-07-01 16:14:49', '1985-08-18 16:01:57', '2003-07-19 15:56:19');
INSERT INTO `discounts` (`id`, `user_id`, `products_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('7', 48, '62', '3', '2015-08-05 17:11:20', '1978-01-13 08:41:45', '2001-09-30 08:00:22', '1997-06-28 03:24:52');
INSERT INTO `discounts` (`id`, `user_id`, `products_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('8', 19, '84', '5', '2020-02-14 08:20:06', '1977-04-24 08:03:27', '1974-09-26 21:50:19', '1971-03-06 07:14:22');
INSERT INTO `discounts` (`id`, `user_id`, `products_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('9', 74, '25', '4', '1993-09-22 16:03:49', '1971-07-24 01:28:24', '1994-02-18 12:34:20', '1974-01-18 08:56:56');
INSERT INTO `discounts` (`id`, `user_id`, `products_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('10', 60, '52', '5', '1976-10-06 21:48:12', '1972-11-27 04:24:47', '2014-04-26 22:47:04', '1981-07-29 21:49:50');
INSERT INTO `discounts` (`id`, `user_id`, `products_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('11', 73, '73', '3', '2012-03-26 18:43:39', '2008-03-05 10:32:35', '1976-11-21 12:12:58', '1994-07-20 14:19:17');
INSERT INTO `discounts` (`id`, `user_id`, `products_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('12', 20, '88', '2', '1989-05-12 17:29:18', '1971-10-27 14:54:07', '1971-09-23 08:01:31', '1994-02-16 18:49:22');
INSERT INTO `discounts` (`id`, `user_id`, `products_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('13', 49, '54', '5', '2001-12-14 04:19:49', '1979-10-15 02:41:23', '1997-05-20 12:31:39', '1975-01-24 17:32:58');
INSERT INTO `discounts` (`id`, `user_id`, `products_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('14', 92, '3', '4', '2013-11-08 22:18:31', '2002-12-14 00:39:52', '1985-08-23 08:11:32', '2020-04-15 12:12:13');
INSERT INTO `discounts` (`id`, `user_id`, `products_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('15', 87, '14', '3', '1999-10-19 01:08:31', '1988-11-11 12:33:41', '1979-03-13 13:21:43', '2014-01-08 09:27:16');
INSERT INTO `discounts` (`id`, `user_id`, `products_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('16', 76, '91', '1', '1984-01-28 03:11:09', '2014-02-06 03:09:26', '2017-03-13 13:04:52', '1978-02-25 21:36:33');
INSERT INTO `discounts` (`id`, `user_id`, `products_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('17', 92, '14', '2', '2002-07-01 01:46:20', '1976-12-13 06:44:42', '1998-01-04 04:00:06', '1999-10-04 18:49:54');
INSERT INTO `discounts` (`id`, `user_id`, `products_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('18', 76, '29', '3', '1986-09-01 16:03:16', '1971-12-03 21:30:18', '1981-04-16 06:34:55', '1986-10-30 17:47:47');
INSERT INTO `discounts` (`id`, `user_id`, `products_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('19', 39, '27', '5', '2010-05-01 08:55:36', '1999-11-11 23:07:23', '2017-03-09 02:49:08', '1985-04-29 19:43:41');
INSERT INTO `discounts` (`id`, `user_id`, `products_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('20', 9, '27', '5', '1970-11-30 14:09:39', '2007-09-20 01:45:59', '2012-09-01 18:06:40', '2013-01-30 10:24:38');
INSERT INTO `discounts` (`id`, `user_id`, `products_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('21', 10, '68', '1', '1972-10-21 10:14:14', '2007-03-14 12:46:03', '1978-10-05 15:34:04', '1986-12-27 03:06:35');
INSERT INTO `discounts` (`id`, `user_id`, `products_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('22', 3, '57', '1', '2007-10-17 21:28:22', '1982-07-29 10:02:45', '2003-03-09 14:55:45', '1982-09-01 10:13:01');
INSERT INTO `discounts` (`id`, `user_id`, `products_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('23', 30, '21', '4', '1972-12-07 07:45:30', '2012-05-09 11:22:03', '1996-01-12 08:28:37', '2000-09-22 20:28:50');
INSERT INTO `discounts` (`id`, `user_id`, `products_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('24', 40, '3', '4', '1999-06-05 14:52:27', '2014-04-10 01:53:39', '2015-09-14 16:18:06', '2007-05-26 17:03:31');
INSERT INTO `discounts` (`id`, `user_id`, `products_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('25', 46, '100', '2', '1999-02-18 15:10:08', '2007-12-20 12:48:14', '1999-12-13 04:42:45', '1980-01-27 09:15:46');
INSERT INTO `discounts` (`id`, `user_id`, `products_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('26', 55, '19', '5', '1979-04-27 22:32:17', '1993-10-02 11:16:18', '2019-04-19 00:50:17', '2005-06-18 13:02:46');
INSERT INTO `discounts` (`id`, `user_id`, `products_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('27', 73, '74', '4', '1988-09-18 04:54:48', '1978-07-27 15:05:28', '2008-11-27 14:49:00', '1974-08-05 04:46:39');
INSERT INTO `discounts` (`id`, `user_id`, `products_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('28', 6, '21', '5', '1973-11-02 14:05:56', '2000-05-24 22:38:53', '1971-01-23 11:31:12', '1988-11-04 06:35:36');
INSERT INTO `discounts` (`id`, `user_id`, `products_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('29', 27, '97', '5', '1997-04-29 17:23:50', '1990-01-20 01:57:02', '1988-04-07 03:05:43', '2008-08-24 09:13:04');
INSERT INTO `discounts` (`id`, `user_id`, `products_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES ('30', 24, '14', '1', '1976-10-20 10:59:14', '1997-04-09 12:20:19', '1987-06-16 04:52:39', '2016-04-01 20:00:39');

-- «‡‰‡ÌËÂ 6
-- √ÛÔÔËÓ‚Í‡ ‰‡ÌÌ˚ı ÔÓ „Ó‰Û ÓÊ‰ÂÌËˇ ˛ÁÂÓ‚

select id, firstname, substring(birthday,1,3) as decade from users order by decade;

select 
	count(*) as total,
	substring(birthday,1,3) as decade 
		from users group by decade order by total desc;
	
-- ÔÓÒÎÂ „ÛÔÔËÓ‚ÍË ÒÏÓÚËÏ ÒÔËÒÓr ÔÓÎ¸ÁÓ‚‡ÚÂÎÂÈ ÔÓ „Ó‰‡Ï ÓÊ‰ÂÌËˇ
select 
	group_concat(firstname order by firstname separator ', '),
	substring(birthday,1,3) as decade
	from users group by decade;

-- ‚˚‚Ó‰ Ï‡ÍÒËÏ‡Î¸ÌÓÈ ˆÂÌ˚ Ë ÏËÌËÏ‡Î¸ÌÓÈ ˆÂÌ˚ ÔÓ „ÛÔÔÂ ÚÓ‚‡‡Ó‚
select catalog_id, 
	Min(price) as min, Max(price) as max
	from products group by catalog_id; 


-- ‚˚‚Ó· ‚ÒÂı ÚÓ‚‡Ó‚, ÓÚÌÓÒˇ˘ËıÒˇ Í „ÛÔÔÂ "¯ÓÚ˚" (3) ËÁ ÒÔËÒÍ‡ ÔÓ‰ÛÍÚÓ‚
select id, price, gender, productSize_id 
	from products 
	where catalog_id = (select id from catalogs c where name = 'ÿÓÚ˚');

 -- ‰Ó·‡‚ÎˇÂÏ ·ÛÍ‚Û ‡ÁÏÂ‡ ‚ÏÂÒÚÓ ˆËÙ˚ ËÁ Í‡Ú‡ÎÓ„‡
select id, price, gender, (select productSize from productSize where id = productSize_id) as 'Size'
	from products 
	where catalog_id = (select id from catalogs c where name = 'ÿÓÚ˚');


-- join
select 
	p.catalog_id,
	p.brendName_id ,
	s.sportType	
	from products as p
		join sporttype as s on s.id=p.catalog_id;
		
	
-- «‡‰‡ÌËÂ 7 œÂ‰ÒÚ‡‚ÎÂÌËˇ