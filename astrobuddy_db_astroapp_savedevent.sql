CREATE DATABASE  IF NOT EXISTS `astrobuddy_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `astrobuddy_db`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: astrobuddy_db
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `astroapp_savedevent`
--

DROP TABLE IF EXISTS `astroapp_savedevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `astroapp_savedevent` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `event_title` varchar(255) NOT NULL,
  `event_description` longtext NOT NULL,
  `event_time` datetime(6) NOT NULL,
  `location` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `astroapp_savedevent_user_id_event_title_event_time_7413b31b_uniq` (`user_id`,`event_title`,`event_time`),
  CONSTRAINT `astroapp_savedevent_user_id_83b4e562_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `astroapp_savedevent`
--

LOCK TABLES `astroapp_savedevent` WRITE;
/*!40000 ALTER TABLE `astroapp_savedevent` DISABLE KEYS */;
INSERT INTO `astroapp_savedevent` VALUES (3,'Sunset','The sun sets below the horizon.','2025-06-20 13:45:13.000000','Indore','2025-06-20 10:29:52.877721',2),(4,'Sunrise','The sun rises above the horizon.','2025-06-20 00:11:06.000000','Indore','2025-06-20 10:30:37.678803',2),(5,'Sunrise','The sun rises above the horizon.','2025-06-20 00:11:02.000000','Indore','2025-06-20 10:56:58.072981',2);
/*!40000 ALTER TABLE `astroapp_savedevent` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-20 19:28:11
