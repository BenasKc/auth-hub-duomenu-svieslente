-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: Duomenu_Svieslente
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

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
-- Table structure for table `Chart_Team_Relations`
--

DROP TABLE IF EXISTS `Chart_Team_Relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Chart_Team_Relations` (
  `ID_of_Team` varchar(36) NOT NULL,
  `ID_of_Chart` varchar(36) NOT NULL,
  KEY `FK_Teams_Relations` (`ID_of_Team`),
  KEY `FK_Charts_Relations` (`ID_of_Chart`),
  CONSTRAINT `FK_Charts_Relations` FOREIGN KEY (`ID_of_Chart`) REFERENCES `Charts` (`ID_of_Chart`),
  CONSTRAINT `FK_Teams_Relations` FOREIGN KEY (`ID_of_Team`) REFERENCES `Teams` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Chart_Team_Relations`
--

LOCK TABLES `Chart_Team_Relations` WRITE;
/*!40000 ALTER TABLE `Chart_Team_Relations` DISABLE KEYS */;
INSERT INTO `Chart_Team_Relations` VALUES ('0c8ba4b9-c661-11ec-ba04-acd1b8e309d9','6868fd5a-c87d-11ec-a67f-acd1b8e309d9'),('ab779bae-c886-11ec-a67f-acd1b8e309d9','acc5bad3-c3b2-11ec-aa74-acd1b8e309d9'),('bcc2363b-c64d-11ec-ba04-acd1b8e309d9','6868fd5a-c87d-11ec-a67f-acd1b8e309d9'),('bcc2363b-c64d-11ec-ba04-acd1b8e309d9','66e248ba-c88e-11ec-a67f-acd1b8e309d9'),('bcc2363b-c64d-11ec-ba04-acd1b8e309d9','3cab7ab0-c96a-11ec-89a7-acd1b8e309d9'),('bcc2363b-c64d-11ec-ba04-acd1b8e309d9','66e248ba-c88e-11ec-a67f-acd1b8e309d9'),('bcc2363b-c64d-11ec-ba04-acd1b8e309d9','b26401f7-ce32-11ec-adff-acd1b8e309d9'),('bcc2363b-c64d-11ec-ba04-acd1b8e309d9','220af09e-d219-11ec-ae02-acd1b8e309d9');
/*!40000 ALTER TABLE `Chart_Team_Relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Charts`
--

DROP TABLE IF EXISTS `Charts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Charts` (
  `ID_of_Chart` varchar(36) NOT NULL,
  `Name_of_Chart` varchar(255) NOT NULL,
  `Data_blob` varchar(10000) NOT NULL,
  `Chart_config` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`ID_of_Chart`),
  UNIQUE KEY `ID_of_Chart` (`ID_of_Chart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Charts`
--

LOCK TABLES `Charts` WRITE;
/*!40000 ALTER TABLE `Charts` DISABLE KEYS */;
INSERT INTO `Charts` VALUES ('220af09e-d219-11ec-ae02-acd1b8e309d9','AF Date Range from: 2022-05-01 to: 2022-05-13','{\"title\":\"AF Date Range from: 2022-05-01 to: 2022-05-13\",\"categories_x\":\" \",\"categories_y\":\" \",\"series\":[{\"name\":\"AF data, Date Range from: 2022-05-01 to: 2022-05-13\",\"data\":[{\"name\":\"Number of Updates using af-updater\",\"y\":137},{\"name\":\"Number of Distinct DBObjects/Web articles changes\",\"y\":70},{\"name\":\"Total Number of Distinct DBObjects\",\"y\":3371}]}]}','{\"selected_graph\": \"Line\"}'),('3cab7ab0-c96a-11ec-89a7-acd1b8e309d9','Gabumai','{\"title\":\"Gabumų vertinimas\",\"categories_x\":[\"Rašymas\",\"Skaitymas\",\"Bendravimas\"],\"categories_y\":\"Darbų atlikta\",\"series\":[{\"name\":\"Jonas\",\"data\":[43,55,75]},{\"name\":\"Petras\",\"data\":[12,73,96]},{\"name\":\"Marius\",\"data\":[25,34,81]},{\"name\":\"Urtė\",\"data\":[10,19,32]},{\"name\":\"Vilma\",\"data\":[46,82,11]}]}','{\"selected_graph\": \"Bar\"}'),('66e248ba-c88e-11ec-a67f-acd1b8e309d9','Atlikt uzd','{\"title\":\"Darbuotojų efektyvumas\",\"categories_x\":[\"Užduotys\",\"Susitikimai\",\"Pardavimai\"],\"categories_y\":\"Darbų atlikta\",\"series\":[{\"name\":\"Jonas\",\"data\":[1,0,4]},{\"name\":\"Petras\",\"data\":[5,7,3]},{\"name\":\"Marius\",\"data\":[3,6,8]},{\"name\":\"Urtė\",\"data\":[0,1,3]},{\"name\":\"Vilma\",\"data\":[4,12,1]}]}','{\"selected_graph\": \"Bar\"}'),('6868fd5a-c87d-11ec-a67f-acd1b8e309d9','Atliktos Užduotys','{\"title\":\"Atliktos užduotys\",\"categories_x\":[\"Užduotys\"],\"categories_y\":\"Darbų atlikta\",\"series\":[{\"name\":\"Atliktos užduotys\",\"data\":[{\"name\":\"Jonas\",\"y\":1},{\"name\":\"Petras\",\"y\":5},{\"name\":\"Marius\",\"y\":3},{\"name\":\"Urtė\",\"y\":0},{\"name\":\"Vilma\",\"y\":4}]}]}\n','{\"selected_graph\": \"Area\"}'),('acc5bad3-c3b2-11ec-aa74-acd1b8e309d9','asd_chartas','adata_blobl_asddddddddddd','new conf'),('b26401f7-ce32-11ec-adff-acd1b8e309d9','Test chart','{\"title\":\"AF\",\"categories_x\":\" \",\"categories_y\":\" \",\"series\":[{\"name\":\"AF data, Date Range from: 2020-01-01 to: 2022-05-01\",\"data\":[{\"name\":\"Average count of versions: Web\",\"y\":0},{\"name\":\"Average count of versions: Web\",\"y\":4},{\"name\":\"Number of Updates using af-updater\",\"y\":8636},{\"name\":\"Number of Distinct DBObjects/Web articles changes\",\"y\":2673},{\"name\":\"Total Number of Distinct DBObjects\",\"y\":3371}]}]}','{\"selected_graph\": \"Bar\"}'),('ef2b241d-c88a-11ec-a67f-acd1b8e309d9','Paruošti darbai','asdofnoiasdnfoiasdnf',NULL);
/*!40000 ALTER TABLE `Charts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sessions`
--

DROP TABLE IF EXISTS `Sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sessions` (
  `ID_of_Session` varchar(36) NOT NULL,
  `Expiration_Date` datetime NOT NULL,
  `ID_of_Team` varchar(36) NOT NULL,
  UNIQUE KEY `ID_of_Session` (`ID_of_Session`),
  KEY `FK_Teams_Sessions` (`ID_of_Team`),
  CONSTRAINT `FK_Teams_Sessions` FOREIGN KEY (`ID_of_Team`) REFERENCES `Teams` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sessions`
--

LOCK TABLES `Sessions` WRITE;
/*!40000 ALTER TABLE `Sessions` DISABLE KEYS */;
INSERT INTO `Sessions` VALUES ('02757a1e-c887-11ec-a67f-acd1b8e309d9','2022-04-30 16:41:12','ab779bae-c886-11ec-a67f-acd1b8e309d9'),('03b20200-c661-11ec-ba04-acd1b8e309d9','2022-04-27 23:04:11','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('09ea950e-c7b5-11ec-ad3f-acd1b8e309d9','2022-04-29 15:38:11','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('0a188dbd-c96c-11ec-89a7-acd1b8e309d9','2022-05-01 20:00:40','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('0cb096d6-cb1f-11ec-aa4d-acd1b8e309d9','2022-05-03 23:54:35','ceb3d2fa-c884-11ec-a67f-acd1b8e309d9'),('0fe16aa3-cd39-11ec-b5cd-acd1b8e309d9','2022-05-06 16:05:50','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('10ceb1bb-c661-11ec-ba04-acd1b8e309d9','2022-04-27 23:04:33','0c8ba4b9-c661-11ec-ba04-acd1b8e309d9'),('126b4ab7-cb1c-11ec-aa4d-acd1b8e309d9','2022-05-03 23:33:17','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('185281d5-c65b-11ec-ba04-acd1b8e309d9','2022-04-27 22:21:49','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('19591789-ca43-11ec-9a4a-acd1b8e309d9','2022-05-02 21:40:07','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('1d3831cc-c65b-11ec-ba04-acd1b8e309d9','2022-04-27 22:21:57','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('1dca297f-c883-11ec-a67f-acd1b8e309d9','2022-04-30 16:13:20','19eec591-c883-11ec-a67f-acd1b8e309d9'),('1e10d541-c64e-11ec-ba04-acd1b8e309d9','2022-04-27 20:48:55','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('22c71f17-c887-11ec-a67f-acd1b8e309d9','2022-04-30 16:42:07','ab779bae-c886-11ec-a67f-acd1b8e309d9'),('244204ab-c957-11ec-89a7-acd1b8e309d9','2022-05-01 17:31:04','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('2c79bf59-cd3e-11ec-b5cd-acd1b8e309d9','2022-05-06 16:42:25','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('2e0321ca-c95f-11ec-89a7-acd1b8e309d9','2022-05-01 18:28:37','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('34f00282-c887-11ec-a67f-acd1b8e309d9','2022-04-30 16:42:37','ab779bae-c886-11ec-a67f-acd1b8e309d9'),('35414793-ca38-11ec-9a4a-acd1b8e309d9','2022-05-02 20:22:10','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('3688d76b-ce36-11ec-adff-acd1b8e309d9','2022-05-07 22:17:58','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('36fd4fcf-ce31-11ec-adff-acd1b8e309d9','2022-05-07 21:42:11','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('3c6f0463-c60e-11ec-a21c-acd1b8e309d9','2022-04-27 13:11:38','215a2ac2-c3ae-11ec-aa74-acd1b8e309d9'),('3f74afba-c65e-11ec-ba04-acd1b8e309d9','2022-04-27 22:44:23','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('422e7111-cd34-11ec-a277-acd1b8e309d9','2022-05-06 15:31:27','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('43579620-c65a-11ec-ba04-acd1b8e309d9','2022-04-27 22:15:52','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('4a8f43f9-cb16-11ec-aa4d-acd1b8e309d9','2022-05-03 22:51:54','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('4c574384-c887-11ec-a67f-acd1b8e309d9','2022-04-30 16:43:16','ab779bae-c886-11ec-a67f-acd1b8e309d9'),('4d331ba6-cb1f-11ec-aa4d-acd1b8e309d9','2022-05-03 23:56:24','ceb3d2fa-c884-11ec-a67f-acd1b8e309d9'),('4da9cc76-d215-11ec-ae02-acd1b8e309d9','2022-05-12 20:32:28','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('573fc37c-cb1f-11ec-aa4d-acd1b8e309d9','2022-05-03 23:56:40','ceb3d2fa-c884-11ec-a67f-acd1b8e309d9'),('5b106ffe-c88b-11ec-a67f-acd1b8e309d9','2022-04-30 17:12:19','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('61835e3c-cb1d-11ec-aa4d-acd1b8e309d9','2022-05-03 23:42:39','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('63c6fd19-c887-11ec-a67f-acd1b8e309d9','2022-04-30 16:43:56','ab779bae-c886-11ec-a67f-acd1b8e309d9'),('64ba3151-c963-11ec-89a7-acd1b8e309d9','2022-05-01 18:58:47','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('660d15a4-cb1c-11ec-aa4d-acd1b8e309d9','2022-05-03 23:35:37','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('669f25f2-c7b8-11ec-ad3f-acd1b8e309d9','2022-04-29 16:02:15','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('68b0b833-c883-11ec-a67f-acd1b8e309d9','2022-04-30 16:15:26','6255a161-c883-11ec-a67f-acd1b8e309d9'),('68b4975f-cb6c-11ec-9a11-acd1b8e309d9','2022-05-04 09:08:21','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('6a81f22f-ca3c-11ec-9a4a-acd1b8e309d9','2022-05-02 20:52:17','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('6c740aa6-cd42-11ec-b5cd-acd1b8e309d9','2022-05-06 17:12:51','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('6ca7a9b2-caee-11ec-aa4d-acd1b8e309d9','2022-05-03 18:06:31','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('6d08f0fc-c882-11ec-a67f-acd1b8e309d9','2022-04-30 16:08:24','687586ea-c882-11ec-a67f-acd1b8e309d9'),('6e4dbe7a-cb1d-11ec-aa4d-acd1b8e309d9','2022-05-03 23:43:00','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('6f6cd19f-cd34-11ec-a277-acd1b8e309d9','2022-05-06 15:32:43','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('71294d81-cd4b-11ec-b5cd-acd1b8e309d9','2022-05-06 18:17:24','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('71ac158b-c65a-11ec-ba04-acd1b8e309d9','2022-04-27 22:17:09','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('724532ee-cb1f-11ec-aa4d-acd1b8e309d9','2022-05-03 23:57:26','ceb3d2fa-c884-11ec-a67f-acd1b8e309d9'),('727863ac-cfc4-11ec-8971-acd1b8e309d9','2022-05-09 21:48:38','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('7597f2dc-c87f-11ec-a67f-acd1b8e309d9','2022-04-30 15:47:10','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('769c0453-ce3a-11ec-adff-acd1b8e309d9','2022-05-07 22:48:23','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('780ab5cf-cb1d-11ec-aa4d-acd1b8e309d9','2022-05-03 23:43:17','ceb3d2fa-c884-11ec-a67f-acd1b8e309d9'),('7b10d002-d214-11ec-ae02-acd1b8e309d9','2022-05-12 20:26:34','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('860d6c65-cb1c-11ec-aa4d-acd1b8e309d9','2022-05-03 23:36:31','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('87a66d98-cb1d-11ec-aa4d-acd1b8e309d9','2022-05-03 23:43:43','ceb3d2fa-c884-11ec-a67f-acd1b8e309d9'),('97befd48-cd34-11ec-a277-acd1b8e309d9','2022-05-06 15:33:50','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('9b328eda-c3af-11ec-aa74-acd1b8e309d9','2022-04-24 12:49:13','215a2ac2-c3ae-11ec-aa74-acd1b8e309d9'),('9d161ea8-c980-11ec-89a7-acd1b8e309d9','2022-05-01 22:27:57','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('9e8f0d34-c967-11ec-89a7-acd1b8e309d9','2022-05-01 19:29:02','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('a17ac196-c65a-11ec-ba04-acd1b8e309d9','2022-04-27 22:18:30','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('a67bdd37-cb1c-11ec-aa4d-acd1b8e309d9','2022-05-03 23:37:25','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('a859233c-c6cd-11ec-8cdb-acd1b8e309d9','2022-04-28 12:01:53','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('abd9fde9-c732-11ec-b85a-acd1b8e309d9','2022-04-29 00:04:58','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('acfeb26a-cb1d-11ec-aa4d-acd1b8e309d9','2022-05-03 23:44:45','ceb3d2fa-c884-11ec-a67f-acd1b8e309d9'),('ad8450b3-c6ca-11ec-8cdb-acd1b8e309d9','2022-04-28 11:40:33','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('af5a1a7c-c886-11ec-a67f-acd1b8e309d9','2022-04-30 16:38:53','ab779bae-c886-11ec-a67f-acd1b8e309d9'),('b15f5f59-cb16-11ec-aa4d-acd1b8e309d9','2022-05-03 22:54:46','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('b2e48d8c-c662-11ec-ba04-acd1b8e309d9','2022-04-27 23:16:15','aea7c03a-c662-11ec-ba04-acd1b8e309d9'),('b49d93ac-cfc8-11ec-8971-acd1b8e309d9','2022-05-09 22:19:07','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('b5786e9d-cb1c-11ec-aa4d-acd1b8e309d9','2022-05-03 23:37:50','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('b6b692aa-c883-11ec-a67f-acd1b8e309d9','2022-04-30 16:17:37','b34fa794-c883-11ec-a67f-acd1b8e309d9'),('b7633c48-c730-11ec-b85a-acd1b8e309d9','2022-04-28 23:50:59','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('b9eeed01-c656-11ec-ba04-acd1b8e309d9','2022-04-27 21:50:33','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('c422ca2a-cb1e-11ec-aa4d-acd1b8e309d9','2022-05-03 23:52:34','ceb3d2fa-c884-11ec-a67f-acd1b8e309d9'),('c4d5d3f4-c6bb-11ec-bc07-acd1b8e309d9','2022-04-28 09:53:50','be0a92b1-c6bb-11ec-bc07-acd1b8e309d9'),('c668db11-c884-11ec-a67f-acd1b8e309d9','2022-04-30 16:25:13','c3f3d52c-c884-11ec-a67f-acd1b8e309d9'),('c7442b41-d214-11ec-ae02-acd1b8e309d9','2022-05-12 20:28:42','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('c8c13acb-c884-11ec-a67f-acd1b8e309d9','2022-04-30 16:25:17','c3f3d52c-c884-11ec-a67f-acd1b8e309d9'),('cc74e0ce-cb6b-11ec-9a11-acd1b8e309d9','2022-05-04 09:03:59','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('d13c0c0e-c884-11ec-a67f-acd1b8e309d9','2022-04-30 16:25:31','ceb3d2fa-c884-11ec-a67f-acd1b8e309d9'),('d36d11e2-c886-11ec-a67f-acd1b8e309d9','2022-04-30 16:39:53','d009cdd6-c886-11ec-a67f-acd1b8e309d9'),('d3cb41f2-cb1e-11ec-aa4d-acd1b8e309d9','2022-05-03 23:53:00','ceb3d2fa-c884-11ec-a67f-acd1b8e309d9'),('d65e7bfa-cd46-11ec-b5cd-acd1b8e309d9','2022-05-06 17:44:26','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('d7b14e57-c655-11ec-ba04-acd1b8e309d9','2022-04-27 21:44:13','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('d8e773ed-c7bc-11ec-ad3f-acd1b8e309d9','2022-04-29 16:34:04','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('dab6c48e-cb6c-11ec-9a11-acd1b8e309d9','2022-05-04 09:11:32','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('e47a7a43-cb1b-11ec-aa4d-acd1b8e309d9','2022-05-03 23:31:59','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('e7b5e438-c3ae-11ec-aa74-acd1b8e309d9','2022-04-24 12:14:12','215a2ac2-c3ae-11ec-aa74-acd1b8e309d9'),('eb84ddb5-c883-11ec-a67f-acd1b8e309d9','2022-04-30 16:19:05','e63d4f1a-c883-11ec-a67f-acd1b8e309d9'),('efd44b16-c97b-11ec-89a7-acd1b8e309d9','2022-05-01 21:54:28','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('efec64f1-c87a-11ec-a67f-acd1b8e309d9','2022-04-30 15:14:47','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('fad5ab73-cb6b-11ec-9a11-acd1b8e309d9','2022-05-04 09:05:17','bcc2363b-c64d-11ec-ba04-acd1b8e309d9'),('fe262bcf-d216-11ec-ae02-acd1b8e309d9','2022-05-12 20:44:33','bcc2363b-c64d-11ec-ba04-acd1b8e309d9');
/*!40000 ALTER TABLE `Sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teams`
--

DROP TABLE IF EXISTS `Teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Teams` (
  `ID` varchar(36) NOT NULL,
  `Name_of_Organisation` varchar(127) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `Username` varchar(63) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Hash` varchar(255) NOT NULL,
  `Email` varchar(320) DEFAULT NULL,
  `Telephone` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teams`
--

LOCK TABLES `Teams` WRITE;
/*!40000 ALTER TABLE `Teams` DISABLE KEYS */;
INSERT INTO `Teams` VALUES ('0c8ba4b9-c661-11ec-ba04-acd1b8e309d9','Bab','Bab','14b6b2d4941769193da2f5e549b5f9d327cb5aab9aa44a5d8c5eb91e9f9cb1bba8aab0e4a9c546d25900cd64e4c4c62dfcb5f86959aff119af504d103b68a2bd','c2b25815d2ed7de33f7b42b5cf02fcf5',NULL,NULL),('19eec591-c883-11ec-a67f-acd1b8e309d9','___','bas','022b15c6bb93b62bce4bf8a807f27f0a2917c9e5076d4fa91c21b8c4db92ca284807ac839a5a2b4ea2bc194b63adc9a4d70ef6d38540452388df3d71f6106f62','0748ca6cdf938e9494122344b08aca04',NULL,NULL),('215a2ac2-c3ae-11ec-aa74-acd1b8e309d9','aaa','bdb','cc','dd',NULL,NULL),('5aa0807d-d214-11ec-ae02-acd1b8e309d9','dasdsf','asdasd','66117da04b1abb99e9302723e14241641ce5a191644e34893b89d4abe96fcf8c507fe4fff24a0e9b0af615bdf49005beff577b91d0412b6f1add71db44e2e3a2','d028f8fb712c20b2462948e35fd33da3',NULL,NULL),('5ef85e0b-d214-11ec-ae02-acd1b8e309d9','dasdsfasd','asdasdasd','1b65dd68bbd560d3dda13c37961b8fb35aadb252358f91863da58a4c9f1658ebdaaa88bb1c88c8fefb86877cf0936d1697732ee9a866be3954953b7cc810a400','5d2ab94d7b1b63a9d1fb14a79601e702',NULL,NULL),('6255a161-c883-11ec-a67f-acd1b8e309d9','____','bra','4ca6f37b346c8e5cca034627e9f6afd44ca82335ede93336b20f0835cd828f0aca7c8087bd7b2dd16072c31813dc5cd85db21da83ce93ba1f65d65a8e13f5c01','ae30070674aa559c958f630b9a3c7d21',NULL,NULL),('687586ea-c882-11ec-a67f-acd1b8e309d9','Bard__rinkim__organizacijos_bendruomen_','Brob','7fabc6a26a2e7d57169e461c29ea7a9b798b6200f620dd14875dbff5a958540b14b040053e51c96a5f11cbcf6cbcb3a983295bfa06c73db3e6fa4fe436aac172','5ccfab9c68170dcd430eb837f8249203',NULL,NULL),('9d4e6b59-c64c-11ec-ba04-acd1b8e309d9','asd','asdf','123','123',NULL,NULL),('ab779bae-c886-11ec-a67f-acd1b8e309d9','ąąąą','abcd','1ec7c0d8d2dad236bf67fad0d7a3fa31cf800b336607abb7be6888f438731a8e9bee12e17c81ac162de3b14e1bcdcc7efdbf79e8b50431397d6447ddc336f20e','f521a9c528b9b89f9634207f539dae65',NULL,NULL),('aea7c03a-c662-11ec-ba04-acd1b8e309d9','baba','baba','be03017f76d75932fd5043bcc463a898013518f901933e47bfd83f42f3ded5ecfe251f44dec5f685d48e3f9ca81a85c08273cbc24094a743b316a9b4526e0fed','a0b98d1e9949e7dc66090e78eb4054f6',NULL,NULL),('b34fa794-c883-11ec-a67f-acd1b8e309d9','____','abr','2a4615294e2192e3ac0beb157ab56b5638b447c0677b1e379bf2244939d415521932eeaacc4bd3c7b1e820b107bd1a135e79849362e1003869e443b283a10438','3be33325c4143328c4cd8e39e9401996',NULL,NULL),('bcc2363b-c64d-11ec-ba04-acd1b8e309d9','BenasKc','BenasKc','e089468eb458ce0aca3e27fbeaac9fc614f55950e872c28e4a24fc4e10f599243122f315297d07b7b71668ac36b3b2b799ea657cae369830a5efb006c720328b','161c2a7674a09642fdf38e42b03b5d7f',NULL,NULL),('be0a92b1-c6bb-11ec-bc07-acd1b8e309d9','The_Builder','Bob','19442998449efc0217c36f1dd594015c155d89ae7e648293edbb4ab16d9ba6746ac178314f2c1cd13ced500f6308661899168d767776aa1e512eced7a2d569bd','26d733e6d0fccfb671cc236ed819d890',NULL,NULL),('c3f3d52c-c884-11ec-a67f-acd1b8e309d9','ąąčėęįūš„ūųęščįąėčęųūėęščįėąę','fff','596b755ea79b61e96d15a0d26fb4c2ce0fa8b913a62d571762cf310f90d42b1806436fa949cd3007396edccef9746331c61140d46433bb0588f1ff3206608037','f07b7026352f13d799e2243e48d2d014',NULL,NULL),('ceb3d2fa-c884-11ec-a67f-acd1b8e309d9','ėįųš„ū„ęčąė','aaa','8daa5d19255fb7936bca4aa05ddad3df424cec5482c50accc550fe12441a2065e903c12ec46d729915ff359951813dd1d689c28e21455184ed0c9c13629190da','107b244e45638095e6f13891c133cbb5',NULL,NULL),('d009cdd6-c886-11ec-a67f-acd1b8e309d9','čįščę','acac','0d43816c57719b31a3db33e352f37f17af70032fe70808edcbdb0c325dd22ec9c3f82ad0e8e5884c071ecedf0fa3582424458b75235b2f35068c20b5fcd86ff7','82012eb13e588427f37e07cbc221fbd5',NULL,NULL),('e63d4f1a-c883-11ec-a67f-acd1b8e309d9','das','abraa','587cf93d90be9c141d9310c6ef68c5270bc9ce33c2dc85e256505968644d8a2e01839b03d969e56db5a5c0a0238a6a7ad3ee0385f2ca83100614dbf99ab2401f','f93169e630178378f15d65e245481ecd',NULL,NULL);
/*!40000 ALTER TABLE `Teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Duomenu_Svieslente'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_Check_Login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`administratorius`@`localhost` PROCEDURE `sp_Check_Login`(IN usernamse varchar(63))
BEGIN
    SELECT Password, Hash FROM Duomenu_Svieslente.Teams WHERE Username like usernamse;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Check_Token` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`administratorius`@`localhost` PROCEDURE `sp_Check_Token`(IN id varchar(36))
BEGIN
	IF((SELECT count(ID_of_Session) FROM Sessions WHERE ID_of_Session = id AND NOW() < Expiration_Date LIMIT 1)=0) THEN
		SELECT 'false' AS stat;
	ELSE
		SELECT 'true' AS stat;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Check_Token_Out` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`administratorius`@`localhost` PROCEDURE `sp_Check_Token_Out`(INOUT id varchar(36))
BEGIN
	IF((SELECT count(ID_of_Session) FROM Sessions WHERE ID_of_Session = id AND NOW() < Expiration_Date LIMIT 1)=0) THEN
		SELECT 'false' into id;
	ELSE
		SELECT 'true' into id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Create_Account` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`administratorius`@`localhost` PROCEDURE `sp_Create_Account`(IN name_of_org varchar(127), IN usernamez varchar(63),IN pass varchar(255),IN hsh varchar(255))
BEGIN
    IF(name_of_org IS NOT NULL AND usernamez IS NOT NULL AND pass IS NOT NULL AND hsh IS NOT NULL
		AND length(name_of_org) > 2 AND length(usernamez) > 2 AND (SELECT COUNT(1) FROM Teams WHERE Username = usernamez) = 0) THEN
		INSERT INTO Teams (ID, Name_of_Organisation, Username, Password, Hash) VALUES (uuid(), name_of_org, usernamez, pass, hsh);
        SELECT 'Successfully registered' AS stat;
	ELSE 
		SELECT 'Invalid parameters' AS stat;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Create_Relation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`administratorius`@`localhost` PROCEDURE `sp_Create_Relation`(IN teamid varchar(36), IN chartid varchar(36))
BEGIN
    INSERT INTO Chart_Team_Relations VALUES (teamid, chartid);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Fetch_Charts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Fetch_Charts`(IN Session_ID varchar(36))
BEGIN
SELECT DISTINCT Charts.Name_of_Chart, Charts.Data_blob, Charts.ID_of_Chart, Charts.Chart_config FROM Charts INNER JOIN Chart_Team_Relations ON Chart_Team_Relations.ID_of_Chart = Charts.ID_of_Chart WHERE Chart_Team_Relations.ID_of_Team = (SELECT ID_of_Team FROM Sessions WHERE ID_of_Session = Session_ID AND NOW() < Expiration_Date LIMIT 1);
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Fetch_Profile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Fetch_Profile`(IN Session_ID varchar(36))
BEGIN
    SELECT Name_of_Organisation, Username  FROM Teams WHERE ID = (SELECT ID_of_Team FROM Sessions WHERE ID_of_Session = Session_ID AND NOW() < Expiration_Date LIMIT 1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Init_Session` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`administratorius`@`localhost` PROCEDURE `sp_Init_Session`(IN usernamse varchar(63))
BEGIN
	DECLARE uid varchar(36);
	DECLARE userid varchar(36);
    SET userid = (SELECT ID FROM Teams WHERE Username = Usernamse LIMIT 1);
    SET uid = uuid() ;
    IF (userid IS NOT NULL) THEN
		INSERT INTO Sessions VALUES (uid, DATE_ADD(NOW(), INTERVAL 30 MINUTE), userid);
        SELECT uid;
        ELSE SELECT '-1';
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Insert_Chart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Insert_Chart`(IN namechart varchar(255), IN datablob varchar(10000), IN conf varchar(2000), IN ses_id varchar(36))
BEGIN
	SET @y = ses_id;
    CALL Duomenu_Svieslente.sp_Check_Token_Out(@y);
    
	IF(@y = 'true') THEN
		SET @z = uuid();
		INSERT INTO Charts VALUES (@z, namechart, datablob, conf);
        CALL sp_Create_Relation((SELECT (ID_of_Team) FROM Sessions WHERE ID_of_Session = ses_id AND NOW() < Expiration_Date LIMIT 1) , @z);
	ELSE
		SELECT 'Invalid session';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Save_Preference` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`administratorius`@`localhost` PROCEDURE `sp_Save_Preference`(IN Session_ID varchar(36),  IN Chart_ID varchar(36), IN config varchar(2000))
BEGIN
	SET @x = Session_ID;
    CALL Duomenu_Svieslente.sp_Check_Token_Out(@x);
	IF(@x = 'true') THEN
		UPDATE Charts SET Chart_config = config WHERE ID_of_Chart = Chart_ID;
        SELECT 'true';
        ELSE SELECT 'false';
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_test` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`administratorius`@`localhost` PROCEDURE `sp_test`(IN usernamse varchar(63))
BEGIN
    SELECT * FROM Duomenu_Svieslente.Teams WHERE Username like usernamse;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-12 20:39:33
