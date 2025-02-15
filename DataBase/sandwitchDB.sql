-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: sandwitchdatabase
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id_address` int NOT NULL AUTO_INCREMENT,
  `city` varchar(100) NOT NULL,
  `state` int NOT NULL,
  `street` varchar(100) NOT NULL,
  `zip_code` varchar(6) NOT NULL,
  PRIMARY KEY (`id_address`),
  KEY `id_state_idx` (`state`),
  CONSTRAINT `id_state` FOREIGN KEY (`state`) REFERENCES `state` (`id_state`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Tarnowskie Góy',1,'Titututut','42-600');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `id_order_item` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `unit_price` decimal(19,2) NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id_order_item`),
  KEY `id_order_idx` (`order_id`),
  KEY `id_product_idx` (`product_id`),
  CONSTRAINT `id_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id_orders`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,10,100.00,1,1);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id_orders` int NOT NULL AUTO_INCREMENT,
  `order_tracking_numer` varchar(255) NOT NULL,
  `total_price` decimal(19,2) NOT NULL,
  `total_quantity` int NOT NULL,
  `status` tinyint NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY (`id_orders`),
  KEY `id_user_idx` (`user_id`),
  KEY `id_address_idx` (`address_id`),
  CONSTRAINT `id_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`id_address`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'rter345345345',100.00,10,0,'2021-06-11 00:00:00.000000',1,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id_product` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `unit_price` decimal(13,2) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `available` tinyint NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id_product`),
  KEY `id_category_idx` (`category_id`),
  CONSTRAINT `id_category` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id_product_category`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Hamburger','z wieprzowiną, duetem salat, mixem warzyw (pomidor, ogórek, sałata, cebula i kapusta), sosem czosnkowym i ketchupem',10.00,'blank',1,1),(2,'Frytki','złociste frytusie',5.50,'blank',1,1),(3,'Hot-dog klasyczny','bułka pszenna, parówka, cebulka prażona, sos',6.00,'blank',1,1),(4,'Chessburger','z wieprzowiną, serem, duetem sałat, mixem warzyw (pomidor, ogórek, sałata, cebula i kapusta), sosem czosnkowym i ketchupem',7.50,'blank',1,1),(5,'Quesadilla Tradycyjna z kurczakiem﻿','z grillowanym kurczakiem, wędzonym serem i papryką',19.99,'blank',1,1),(6,'ChickeBurger','z 100% kurczakiem, maślaną bułką, duetem sałat, mixem warzyw (pomidor, ogórek, sałata, cebula i kapusta) i sosami',8.50,'blank',1,1),(7,'Nachos','chrupiące nachosy + sos',15.00,'blank',1,1),(8,'ChessNachos','chrupiące nachosy z serem',17.50,'blank',1,1),(9,'Kebab','mix kapust i sałat, ogórek zielony, pomidor, cebula czerwona, gyros drobiowy 150g, sos czosnkowy',10.00,'blank',1,1),(10,'KebabMax','mix kapust i sałat, ogórek zielony, pomidor, cebula czerwona, gyros drobiowy 300g, sos czosnkowy',18.00,'blank',1,1),(11,'Qurrito','ser cheddar,kukurydza,cebula,kurczak ,sos',15.00,'blank',1,1),(12,'Burrito Tradycyjne z wołowiną﻿','z grillowaną wołowiną, ryżem po meksykańsku, czerwoną fasolą, kukurydzą, papryką, salsą pico de gallo, sałatą i sosem kolendrowym',16.99,'blank',1,1),(13,'Quesadilla Chorizo﻿','z grillowanym chorizo, grillowanym batatem, wędzonym serem i papryką',21.99,'blank',1,1),(14,'Tortilla','sałata lodowa, pekińska, kurczak, ogorek, pomidor, sos czosnkowy',12.99,'blank',1,1),(15,'Sałatka grecka','zielone i czarne oliwki, pomidor koktajlowy, ser sałatkowy, czerwona cebula, ogórek, sałata lodowa, sos a\'la Corleone',10.99,'blank',1,1),(16,'Sałatka meksykańska ','kebab drobiowy, papryka, czerwona fasola, ser sałatkowy, ogórek, czerwona cebula, sałata lodowa, prażona cebula, sos a\'la Corleone',10.99,'blank',1,1),(17,'Nuggetsy','8 pysznych kawałków z piersi kurczaka',9.99,'blank',1,1),(18,'Krążki cebulowe','8 krążków cebulowych ',6.99,'blank',1,1),(19,'Kuberłek','4 polędwiczki z kurczaka oraz 4 skrzydełka',18.99,'blank',1,1),(20,'Burger wołowy','ze 100% wołowiną, bułką maślaną, duetem sałat, mixem warzyw (pomidor, ogórek, sałata, cebula i kapusta), boczkiem, pieczarkami, jajkiem, serem i sosami',16.99,'blank',1,1),(21,'Hot-god z warzywami','bułka pszenna, parówka, cebulka prażona, mix warzyw (sałata, ogórek, pomidor) sos',7.99,'blank',1,1),(22,'Sałata cesarska ','kurczak, jajko, pomidor koktajlowy, ser sałatkowy, ogórek, czerwona cebula, kukurydza, sałata lodowa, sos a\'la Corleone',12.99,'blank',1,1),(23,'Zupa chilli con corne','pikantna zupa z mięsem mielonym, fasolą, kukurydzą, papryką i serem żółtym',12.99,'blank',1,1),(24,'Quesadilla Grande','z guacamole, salsą Pico de Gallo, 3 warzywami oraz mięsem do wyboru',26.99,'blank',1,1),(25,'Fajitas Carne','z grillowaną wołowiną, grillowanymi warzywami, guacamole, salsą Pico de Gallo, sosem kolendrowym',30.99,'blank',1,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id_product_category` int NOT NULL AUTO_INCREMENT,
  `name` varchar(2555) NOT NULL,
  PRIMARY KEY (`id_product_category`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,'Burgery'),(2,'Pizza'),(3,'Napoje'),(4,'Sałatki'),(5,'Dodatki');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `id_state` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_state`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (5,'Dolnośląskie'),(6,'Kujawsko-pomorskie'),(7,'Łódzkie'),(2,'Lubelskie'),(16,'Lubuskie'),(4,'Małopolskie'),(8,'Mazowieckie'),(3,'Opolskie'),(9,'Podkarpackie'),(10,'Podlaskie'),(11,'Pomorskie'),(1,'Śląskie'),(12,'Świętokrzyskie'),(13,'Warmińsko-mazurskie'),(14,'Wielkopolskie'),(15,'Zachodniopomorskie');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  `phone_number` int NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Sebastian','Szczypkowski','sebastian@gmail.com','customer',666666666),(2,'Dawid','Kańtoch','dawid@gfmail.com','admin',999999999),(3,'Adam','Jochemczyk','adam@gmail','waiter',333333333);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-11 17:14:05
