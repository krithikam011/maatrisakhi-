-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: maatrisakhi_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `alert`
--

DROP TABLE IF EXISTS `alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert` (
  `alert_id` int NOT NULL AUTO_INCREMENT,
  `mother_id` int DEFAULT NULL,
  `child_id` int DEFAULT NULL,
  `alert_type` varchar(100) DEFAULT NULL,
  `message` text,
  `alert_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`alert_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert`
--

LOCK TABLES `alert` WRITE;
/*!40000 ALTER TABLE `alert` DISABLE KEYS */;
INSERT INTO `alert` VALUES (1,1,1,'HIGH RISK','Immediate medical attention required','2026-06-26 14:33:57');
/*!40000 ALTER TABLE `alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `child`
--

DROP TABLE IF EXISTS `child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `child` (
  `child_id` int NOT NULL AUTO_INCREMENT,
  `mother_id` int DEFAULT NULL,
  `child_name` varchar(100) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`child_id`),
  KEY `mother_id` (`mother_id`),
  CONSTRAINT `child_ibfk_1` FOREIGN KEY (`mother_id`) REFERENCES `mother` (`mother_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `child`
--

LOCK TABLES `child` WRITE;
/*!40000 ALTER TABLE `child` DISABLE KEYS */;
INSERT INTO `child` VALUES (1,1,'Baby A','Female','2026-06-26');
/*!40000 ALTER TABLE `child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `health_record`
--

DROP TABLE IF EXISTS `health_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `health_record` (
  `record_id` int NOT NULL AUTO_INCREMENT,
  `mother_id` int DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `SystolicBP` int DEFAULT NULL,
  `DiastolicBP` int DEFAULT NULL,
  `BS` float DEFAULT NULL,
  `BodyTemp` float DEFAULT NULL,
  `HeartRate` int DEFAULT NULL,
  `RiskLevel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `mother_id` (`mother_id`),
  CONSTRAINT `health_record_ibfk_1` FOREIGN KEY (`mother_id`) REFERENCES `mother` (`mother_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health_record`
--

LOCK TABLES `health_record` WRITE;
/*!40000 ALTER TABLE `health_record` DISABLE KEYS */;
INSERT INTO `health_record` VALUES (1,1,25,120,80,6.5,98.6,75,'low risk'),(2,1,25,120,80,6.5,98.6,75,'low risk'),(3,1,25,120,80,6.5,98.6,75,'low risk'),(4,1,25,120,80,6.5,98.6,75,'low risk');
/*!40000 ALTER TABLE `health_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mother`
--

DROP TABLE IF EXISTS `mother`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mother` (
  `mother_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `village` varchar(100) DEFAULT NULL,
  `pregnancy_month` int DEFAULT NULL,
  PRIMARY KEY (`mother_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mother`
--

LOCK TABLES `mother` WRITE;
/*!40000 ALTER TABLE `mother` DISABLE KEYS */;
INSERT INTO `mother` VALUES (1,'Priya',25,'9876543210','Kolar',6);
/*!40000 ALTER TABLE `mother` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vaccination`
--

DROP TABLE IF EXISTS `vaccination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vaccination` (
  `vaccination_id` int NOT NULL AUTO_INCREMENT,
  `child_id` int DEFAULT NULL,
  `vaccine_name` varchar(100) DEFAULT NULL,
  `dose_number` int DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `vaccination_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`vaccination_id`),
  KEY `child_id` (`child_id`),
  CONSTRAINT `vaccination_ibfk_1` FOREIGN KEY (`child_id`) REFERENCES `child` (`child_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaccination`
--

LOCK TABLES `vaccination` WRITE;
/*!40000 ALTER TABLE `vaccination` DISABLE KEYS */;
INSERT INTO `vaccination` VALUES (1,1,'BCG',1,'2026-07-01',NULL,'Pending'),(2,1,'Polio',2,'2026-07-01','2026-06-26','Completed');
/*!40000 ALTER TABLE `vaccination` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-27 10:19:49
