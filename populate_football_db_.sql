--matches
Table matches {
  id integer [primary key]
  date date
  home_team_score integer
  away_team_score integer
  referee_name varchar
  match_week integer
  home_team_id integer
  away_team_id integer
  stadium_id integer
}

INSERT INTO matches VALUES (1,'19-MAR-2023',2,1,'Ricardo de Burgos Bengoetxea',26,1,3,1);
INSERT INTO matches VALUES (2,'23-APR-2023',1,0,'Jose María Sanchez Martinez',30,1,2,1);
INSERT INTO matches VALUES (3,'02-MAY-2023',2,0,'Juan Luis Pulido Santana',19,4,3,4);

/*
INSERT INTO matches VALUES (4,'',,,'',,,,);
INSERT INTO matches VALUES (5,'',,,'',,,,);
INSERT INTO matches VALUES (6,'',,,'',,,,);
INSERT INTO matches VALUES (7,'',,,'',,,,);
INSERT INTO matches VALUES (8,'',,,'',,,,);
INSERT INTO matches VALUES (9,'',,,'',,,,);
INSERT INTO matches VALUES (10,'',,,'',,,,);
*/

--teams
Table teams {
  id integer [primary key]
  name varchar
  founded date
  stadium_id integer
  country_id integer
  manager_name varchar
}

INSERT INTO teams VALUES (1,'Barcelona','29-NOV-1899',1,1,'Xavier Hernandez Creus');
INSERT INTO teams VALUES (2,'Atletico Madrid','26-APR-1903',2,1,'Diego Simeone');
INSERT INTO teams VALUES (3,'Real Madrid','06-MAR-1902',3,1,'Carlo Ancelotti');
INSERT INTO teams VALUES (4,'Real Sociedad','07-SEP-1909',4,1,'Imanol Alguacil');

/*
INSERT INTO teams VALUES (5,'Villarreal','10-MAR-1923',5,1,'Quique Setien');
INSERT INTO teams VALUES (6,'Real Betis','12-SEP-1907',6,1,'Manuel Pellegrini');
INSERT INTO teams VALUES (7,'Girona','23-JUL-1930',7,1,'Miguel Angel Sanchez Munoz');
INSERT INTO teams VALUES (8,'Athletic Club','18-JUL-1898',8,1,'Ernesto Valverde');
INSERT INTO teams VALUES (9,'Rayo Vallecano de Madrid','29-MAY-1924',9,1,'Andoni Iraola');
INSERT INTO teams VALUES (10,'Osasuna','24-OCT-1920',10,1,'Jagoba Arrasate');

INSERT INTO teams VALUES (11,'Sevilla','25-JAN-1890',11,1,'Jose Luis Mendilibar');
INSERT INTO teams VALUES (12,'Mallorca','05-MAR-1916',12,1,'Javier Aguirre');
INSERT INTO teams VALUES (13,'Celta Vigo','23-AUG-1923',13,1,'Carlos Carvalhal');
INSERT INTO teams VALUES (14,'Almeria','26-JUL-1989',14,1,'Joan Francesc Ferrer Sicilia');
INSERT INTO teams VALUES (15,'Cadiz','10-SEP-1910',15,1,'Sergio Gonzalez');
INSERT INTO teams VALUES (16,'Valladolid','20-JUN-1928',16,1,'Paulo Pezzolano');
INSERT INTO teams VALUES (17,'Valencia','18-MAR-1919',17,1,'Ruben Baraja');
INSERT INTO teams VALUES (18,'Getafe','08-JUL-1983',18,1,'Jose Bordalas');
INSERT INTO teams VALUES (19,'Espanyol','28-OCT-1900',19,1,'Luis García');
INSERT INTO teams VALUES (20,'Elche','10-JAN-1923',20,1,'Sebastian Beccacece');
*/

--stadiums = grounds
Table stadiums {
  id integer [primary key]
  name varchar
  city varchar
  capacity long
  country_id integer
}

INSERT INTO stadiums VALUES (1,'Camp Nou','Barcelona',99354,1);
INSERT INTO stadiums VALUES (2,'Estadio Metropolitano','Madrid',68456,1);
INSERT INTO stadiums VALUES (3,'Santiago Bernabeu','Madrid',81044,1);
INSERT INTO stadiums VALUES (4,'Anoeta Stadium','San Sebastian',39500,1);

/*
INSERT INTO stadiums VALUES (5,'Estadio de la Cerámica','Villarreal',23000,1);
INSERT INTO stadiums VALUES (6,'Estadio Benito Villamarín','Seville',60720,1);
INSERT INTO stadiums VALUES (7,'Estadi Montilivi','Girona',11810,1);
INSERT INTO stadiums VALUES (8,'San Mames','Bilbao',53331,1);
INSERT INTO stadiums VALUES (9,'Campo de Fútbol de Vallecas','Puente de Vallecas',14708,1);
INSERT INTO stadiums VALUES (10,'El Sadar','Pamplona',23576,1);

INSERT INTO stadiums VALUES (11,'Ramón Sánchez Pizjuán Stadium','Seville',42714,1);
INSERT INTO stadiums VALUES (12,'Estadi Mallorca Son Moix','Palma de Mallorca',23142,1);
INSERT INTO stadiums VALUES (13,'Balaídos','Vigo',29000,1);
INSERT INTO stadiums VALUES (14,'Power Horse Stadium','Almería',15294,1);
INSERT INTO stadiums VALUES (15,'Nuevo Mirandilla','Cadiz',20,724,1);
INSERT INTO stadiums VALUES (16,'José Zorrilla','Valladolid',27846,1);
INSERT INTO stadiums VALUES (17,'Mestalla','Valencia',49430,1);
INSERT INTO stadiums VALUES (18,'Coliseum Alfonso Pérez','Getafe',17000,1);
INSERT INTO stadiums VALUES (19,'RCDE Stadium','Cornella',40000,1);
INSERT INTO stadiums VALUES (20,'Estadio Manuel Martínez Valero','Elche',33732,1);
*/

--members
Table members {
  id integer [primary key]
  name varchar
  surname varchar
  dob date
  salary double
  country_id integer
  team_id integer
}
1 i 3
INSERT INTO members VALUES (1,'Marc-Andre','ter Stegen','30-APR-1992',8900.99,2,1);
INSERT INTO members VALUES (2,'Ronald','Araujo','07-MAR-1999',7858.09,3,1);
INSERT INTO members VALUES (3,'Jules','Kounde','12-NOV-1998',6905.98,4,1);
INSERT INTO members VALUES (4,'Andreas','Christensen','10-APR-1996',7489.30,5,1);
INSERT INTO members VALUES (5,'Alejandro','Balde','18-OCT-2003',5784.84,1,1);
INSERT INTO members VALUES (6,'Sergi','Roberto','07-FEB-1992',7094.39,1,1);
INSERT INTO members VALUES (7,'Sergio','Busquets','16-JUL-1988',9043.84,1,1);
INSERT INTO members VALUES (8,'Frenkie','de Jong','12-MAY-1997',8109.03,6,1);
INSERT INTO members VALUES (9,'Raphael','Belloli','14-DEC-1996',9000,7,1);
INSERT INTO members VALUES (10,'Robert','Lewandowski','21-AUG-1988',8703.09,8,1);
INSERT INTO members VALUES (11,'Pablo','Gavira','05-AUG-2004',5039.49,1,1);

INSERT INTO members VALUES (12,'Jan','Oblak','07-JAN-1993',7049.94,9,2);
INSERT INTO members VALUES (13,'Jorge','Merodio','08-JAN-1992',10030.01,1,2);
INSERT INTO members VALUES (14,'Mario','Hermoso','18-JUN-1995',6940.87,1,2);
INSERT INTO members VALUES (15,'Jose','Gimenez','20-JAN-1995',5940.04,3,2);
INSERT INTO members VALUES (16,'Stefan','Savic','08-JAN-1991',6000.00,10,2);
INSERT INTO members VALUES (17,'Nahuel','Molina','06-APR-1998',6403.03,11,2);
INSERT INTO members VALUES (18,'Thomas','Lemar','12-NOV-1995',9100.04,4,2);
INSERT INTO members VALUES (19,'Axel','Witsel','12-JAN-1989',6500.39,12,2);
INSERT INTO members VALUES (20,'Rodrigo','De Paul','24-MAY-1994',5800.45,11,2);
INSERT INTO members VALUES (21,'Antoine','Griezmann','21-MAR-1991',6493.04,4,2);
INSERT INTO members VALUES (22,'Angel','Correa','09-MAR-1995',8049.39,11,2);

INSERT INTO members VALUES (23,'Thibaut','Courtois','11-MAY-1992',5093.89,12,3);
INSERT INTO members VALUES (24,'Jose','Iglesias','18-JAN-1990',9000.49,1,3);
INSERT INTO members VALUES (25,'Antonio','Ruediger','03-MAR-1993',8700.98,2,3);
INSERT INTO members VALUES (26,'Eder','Militao','18-JAN-1998',7409.98,7,3);
INSERT INTO members VALUES (27,'Dani','Carvajal','11-JAN-1992',5489.09,1,3);
INSERT INTO members VALUES (28,'Toni','Kroos','04-JAN-1990',7684.07,2,3);
INSERT INTO members VALUES (29,'Eduardo','Camavinga','10-NOV-2002',5039.79,4,3);
INSERT INTO members VALUES (30,'Vinicius','Junior','12-JUL-2000',6849.49,7,3);
INSERT INTO members VALUES (31,'Luka','Modric','09-SEP-1985',10001.45,13,3);
INSERT INTO members VALUES (32,'Federico','Valverde','22-JULY-1998',7100.90,3,3);
INSERT INTO members VALUES (33,'Karim','Benzema','19-DEC-1987',8300.44,4,3);

INSERT INTO members VALUES (34,'Alex','Remiro','24-MAR-1995',7403.89,1,4);
INSERT INTO members VALUES (35,'Andoni','Gorosabel','04-AUG-1996',5890.34,1,4);
INSERT INTO members VALUES (36,'Igor','Zubeldia','30-MAR-1997',6100.46,1,4);
INSERT INTO members VALUES (37,'Robin','Le Normand','11-NOV-1996',6209.48,4,4);
INSERT INTO members VALUES (38,'Aihen','Munoz','16-AUG-1997',7398.01,1,4);
INSERT INTO members VALUES (39,'Martin','Zubimendi','02-FEB-1999',6584.09,1,4);
INSERT INTO members VALUES (40,'Takefusa','Kubo','04-JUN-2001',7594.02,14,4);
INSERT INTO members VALUES (41,'Mikel','Merino','22-JUN-1996',8293.02,1,4);
INSERT INTO members VALUES (42,'David','Silva','08-JAN-1986',9450.28,1,4);
INSERT INTO members VALUES (43,'Mikel','Oyarzabal','21-APR-1997',6890.77,1,4);
INSERT INTO members VALUES (44,'Alexander','Sorloth','05-DEC-1995',6498.99,15,4);

/*
INSERT INTO members VALUES (45,'','','',,,);
INSERT INTO members VALUES (46,'','','',,,);
INSERT INTO members VALUES (47,'','','',,,);
INSERT INTO members VALUES (48,'','','',,,);
INSERT INTO members VALUES (49,'','','',,,);
INSERT INTO members VALUES (50,'','','',,,);
INSERT INTO members VALUES (51,'','','',,,);
INSERT INTO members VALUES (52,'','','',,,);
INSERT INTO members VALUES (53,'','','',,,);
INSERT INTO members VALUES (54,'','','',,,);
INSERT INTO members VALUES (55,'','','',,,);

INSERT INTO members VALUES (56,'','','',,,);
INSERT INTO members VALUES (57,'','','',,,);
INSERT INTO members VALUES (58,'','','',,,);
INSERT INTO members VALUES (59,'','','',,,);
INSERT INTO members VALUES (60,'','','',,,);
INSERT INTO members VALUES (61'','','',,,);
INSERT INTO members VALUES (62,'','','',,,);
INSERT INTO members VALUES (63,'','','',,,);
INSERT INTO members VALUES (64,'','','',,,);
INSERT INTO members VALUES (65,'','','',,,);
INSERT INTO members VALUES (66,'','','',,,);

INSERT INTO members VALUES (67,'','','',,,);
INSERT INTO members VALUES (68,'','','',,,);
INSERT INTO members VALUES (69,'','','',,,);
INSERT INTO members VALUES (70,'','','',,,);
INSERT INTO members VALUES (71,'','','',,,);
INSERT INTO members VALUES (72,'','','',,,);
INSERT INTO members VALUES (73,'','','',,,);
INSERT INTO members VALUES (74,'','','',,,);
INSERT INTO members VALUES (75,'','','',,,);
INSERT INTO members VALUES (76,'','','',,,);
INSERT INTO members VALUES (77,'','','',,,);

INSERT INTO members VALUES (78,'','','',,,);
INSERT INTO members VALUES (79,'','','',,,);
INSERT INTO members VALUES (80,'','','',,,);
INSERT INTO members VALUES (81,'','','',,,);
INSERT INTO members VALUES (82,'','','',,,);
INSERT INTO members VALUES (83,'','','',,,);
INSERT INTO members VALUES (84,'','','',,,);
INSERT INTO members VALUES (85,'','','',,,);
INSERT INTO members VALUES (86,'','','',,,);
INSERT INTO members VALUES (87,'','','',,,);
INSERT INTO members VALUES (88,'','','',,,);

INSERT INTO members VALUES (89,'','','',,,);
INSERT INTO members VALUES (90,'','','',,,);
INSERT INTO members VALUES (91,'','','',,,);
INSERT INTO members VALUES (92,'','','',,,);
INSERT INTO members VALUES (93,'','','',,,);
INSERT INTO members VALUES (94,'','','',,,);
INSERT INTO members VALUES (95,'','','',,,);
INSERT INTO members VALUES (96,'','','',,,);
INSERT INTO members VALUES (97,'','','',,,);
INSERT INTO members VALUES (98,'','','',,,);
INSERT INTO members VALUES (99,'','','',,,);

INSERT INTO members VALUES (100,'','','',,,);
INSERT INTO members VALUES (101,'','','',,,);
INSERT INTO members VALUES (102,'','','',,,);
INSERT INTO members VALUES (103,'','','',,,);
INSERT INTO members VALUES (104,'','','',,,);
INSERT INTO members VALUES (105,'','','',,,);
INSERT INTO members VALUES (106,'','','',,,);
INSERT INTO members VALUES (107,'','','',,,);
INSERT INTO members VALUES (108,'','','',,,);
INSERT INTO members VALUES (109,'','','',,,);
INSERT INTO members VALUES (110,'','','',,,);

INSERT INTO members VALUES (111,'','','',,,);
INSERT INTO members VALUES (112,'','','',,,);
INSERT INTO members VALUES (113,'','','',,,);
INSERT INTO members VALUES (114,'','','',,,);
INSERT INTO members VALUES (115,'','','',,,);
INSERT INTO members VALUES (116,'','','',,,);
INSERT INTO members VALUES (117,'','','',,,);
INSERT INTO members VALUES (118,'','','',,,);
INSERT INTO members VALUES (119,'','','',,,);
INSERT INTO members VALUES (120,'','','',,,);
INSERT INTO members VALUES (121,'','','',,,);

INSERT INTO members VALUES (122,'','','',,,);
INSERT INTO members VALUES (123,'','','',,,);
INSERT INTO members VALUES (124,'','','',,,);
INSERT INTO members VALUES (125,'','','',,,);
INSERT INTO members VALUES (126,'','','',,,);
INSERT INTO members VALUES (127,'','','',,,);
INSERT INTO members VALUES (128,'','','',,,);
INSERT INTO members VALUES (129,'','','',,,);
INSERT INTO members VALUES (130,'','','',,,);
INSERT INTO members VALUES (131,'','','',,,);
INSERT INTO members VALUES (132,'','','',,,);

INSERT INTO members VALUES (133,'','','',,,);
INSERT INTO members VALUES (134,'','','',,,);
INSERT INTO members VALUES (135,'','','',,,);
INSERT INTO members VALUES (136,'','','',,,);
INSERT INTO members VALUES (137,'','','',,,);
INSERT INTO members VALUES (138,'','','',,,);
INSERT INTO members VALUES (139,'','','',,,);
INSERT INTO members VALUES (140,'','','',,,);
INSERT INTO members VALUES (141,'','','',,,);
INSERT INTO members VALUES (142,'','','',,,);
INSERT INTO members VALUES (143,'','','',,,);

INSERT INTO members VALUES (144,'','','',,,);
INSERT INTO members VALUES (145,'','','',,,);
INSERT INTO members VALUES (146,'','','',,,);
INSERT INTO members VALUES (147,'','','',,,);
INSERT INTO members VALUES (148,'','','',,,);
INSERT INTO members VALUES (149,'','','',,,);
INSERT INTO members VALUES (150,'','','',,,);
INSERT INTO members VALUES (151,'','','',,,);
INSERT INTO members VALUES (152,'','','',,,);
INSERT INTO members VALUES (153,'','','',,,);
INSERT INTO members VALUES (154,'','','',,,);

INSERT INTO members VALUES (155,'','','',,,);
INSERT INTO members VALUES (156,'','','',,,);
INSERT INTO members VALUES (157,'','','',,,);
INSERT INTO members VALUES (158,'','','',,,);
INSERT INTO members VALUES (159,'','','',,,);
INSERT INTO members VALUES (160,'','','',,,);
INSERT INTO members VALUES (161,'','','',,,);
INSERT INTO members VALUES (162,'','','',,,);
INSERT INTO members VALUES (163,'','','',,,);
INSERT INTO members VALUES (164,'','','',,,);
INSERT INTO members VALUES (165,'','','',,,);

INSERT INTO members VALUES (166,'','','',,,);
INSERT INTO members VALUES (167,'','','',,,);
INSERT INTO members VALUES (168,'','','',,,);
INSERT INTO members VALUES (169,'','','',,,);
INSERT INTO members VALUES (170,'','','',,,);
INSERT INTO members VALUES (171,'','','',,,);
INSERT INTO members VALUES (172,'','','',,,);
INSERT INTO members VALUES (173,'','','',,,);
INSERT INTO members VALUES (174,'','','',,,);
INSERT INTO members VALUES (175,'','','',,,);
INSERT INTO members VALUES (176,'','','',,,);

INSERT INTO members VALUES (177,'','','',,,);
INSERT INTO members VALUES (178,'','','',,,);
INSERT INTO members VALUES (179,'','','',,,);
INSERT INTO members VALUES (180,'','','',,,);
INSERT INTO members VALUES (181,'','','',,,);
INSERT INTO members VALUES (182,'','','',,,);
INSERT INTO members VALUES (183,'','','',,,);
INSERT INTO members VALUES (184,'','','',,,);
INSERT INTO members VALUES (185,'','','',,,);
INSERT INTO members VALUES (186,'','','',,,);
INSERT INTO members VALUES (187,'','','',,,);

INSERT INTO members VALUES (188,'','','',,,);
INSERT INTO members VALUES (189,'','','',,,);
INSERT INTO members VALUES (190,'','','',,,);
INSERT INTO members VALUES (191,'','','',,,);
INSERT INTO members VALUES (192,'','','',,,);
INSERT INTO members VALUES (193,'','','',,,);
INSERT INTO members VALUES (194,'','','',,,);
INSERT INTO members VALUES (195,'','','',,,);
INSERT INTO members VALUES (196,'','','',,,);
INSERT INTO members VALUES (197,'','','',,,);
INSERT INTO members VALUES (198,'','','',,,);

INSERT INTO members VALUES (199,'','','',,,);
INSERT INTO members VALUES (200,'','','',,,);
INSERT INTO members VALUES (201,'','','',,,);
INSERT INTO members VALUES (202,'','','',,,);
INSERT INTO members VALUES (203,'','','',,,);
INSERT INTO members VALUES (204,'','','',,,);
INSERT INTO members VALUES (205,'','','',,,);
INSERT INTO members VALUES (206,'','','',,,);
INSERT INTO members VALUES (207,'','','',,,);
INSERT INTO members VALUES (208,'','','',,,);
INSERT INTO members VALUES (209,'','','',,,);

INSERT INTO members VALUES (210,'','','',,,);
INSERT INTO members VALUES (211,'','','',,,);
INSERT INTO members VALUES (212,'','','',,,);
INSERT INTO members VALUES (213,'','','',,,);
INSERT INTO members VALUES (214,'','','',,,);
INSERT INTO members VALUES (215,'','','',,,);
INSERT INTO members VALUES (216,'','','',,,);
INSERT INTO members VALUES (217,'','','',,,);
INSERT INTO members VALUES (218,'','','',,,);
INSERT INTO members VALUES (219,'','','',,,);
INSERT INTO members VALUES (220,'','','',,,);
*/

--countries
Table countries {
  id integer [primary key]
  name varchar
}

INSERT INTO countries VALUES (1,'Spain');
INSERT INTO countries VALUES (2,'Germany');
INSERT INTO countries VALUES (3,'Uruguay');
INSERT INTO countries VALUES (4,'France');
INSERT INTO countries VALUES (5,'Denmark');
INSERT INTO countries VALUES (6,'Netherlands');
INSERT INTO countries VALUES (7,'Brazil');
INSERT INTO countries VALUES (8,'Poland');
INSERT INTO countries VALUES (9,'Slovenia');
INSERT INTO countries VALUES (10,'Montenegro');
INSERT INTO countries VALUES (11,'Argentina');
INSERT INTO countries VALUES (12,'Belgium');
INSERT INTO countries VALUES (13,'Croatia');
INSERT INTO countries VALUES (14,'Japan');
INSERT INTO countries VALUES (15,'Norway');


--tickets
Table tickets {
  id integer [primary key]
  sector varchar
  price double
  quantity long
  match_id integer
}

INSERT INTO tickets VALUES (1,'Basic',150,60000,1);
INSERT INTO tickets VALUES (2,'VIP Premium',500,5000,1);
INSERT INTO tickets VALUES (3,'Player Experience',650,6000,1);

INSERT INTO tickets VALUES (4,'Basic',150,50000,1);
INSERT INTO tickets VALUES (5,'VIP Premium',400,3400,1);
INSERT INTO tickets VALUES (6,'Player Experience',550,4200,1);

INSERT INTO tickets VALUES (7,'Tribuna',88,10349,4);
INSERT INTO tickets VALUES (8,'Longside',200,9483,4);
INSERT INTO tickets VALUES (9,'Tribuna Premium',300,2004,4);
INSERT INTO tickets VALUES (10,'VIP',500,1500,4);

/*
INSERT INTO tickets VALUES (11,'',,,);
INSERT INTO tickets VALUES (12,'',,,);
INSERT INTO tickets VALUES (13,'',,,);
INSERT INTO tickets VALUES (14,'',,,);
INSERT INTO tickets VALUES (15,'',,,);

INSERT INTO tickets VALUES (16,'',,,);
INSERT INTO tickets VALUES (17,'',,,);
INSERT INTO tickets VALUES (18,'',,,);
INSERT INTO tickets VALUES (19,'',,,);
INSERT INTO tickets VALUES (20,'',,,);

INSERT INTO tickets VALUES (21,'',,,);
INSERT INTO tickets VALUES (22,'',,,);
INSERT INTO tickets VALUES (23,'',,,);
INSERT INTO tickets VALUES (24,'',,,);
INSERT INTO tickets VALUES (25,'',,,);

INSERT INTO tickets VALUES (26,'',,,);
INSERT INTO tickets VALUES (27,'',,,);
INSERT INTO tickets VALUES (28,'',,,);
INSERT INTO tickets VALUES (29,'',,,);
INSERT INTO tickets VALUES (30,'',,,);

INSERT INTO tickets VALUES (31,'',,,);
INSERT INTO tickets VALUES (32,'',,,);
INSERT INTO tickets VALUES (33,'',,,);
INSERT INTO tickets VALUES (34,'',,,);
INSERT INTO tickets VALUES (35,'',,,);

INSERT INTO tickets VALUES (36,'',,,);
INSERT INTO tickets VALUES (37,'',,,);
INSERT INTO tickets VALUES (38,'',,,);
INSERT INTO tickets VALUES (39,'',,,);
INSERT INTO tickets VALUES (40,'',,,);

INSERT INTO tickets VALUES (41,'',,,);
INSERT INTO tickets VALUES (42,'',,,);
INSERT INTO tickets VALUES (43,'',,,);
INSERT INTO tickets VALUES (44,'',,,);
INSERT INTO tickets VALUES (45,'',,,);
*/

