/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.5.2-MariaDB, for osx10.20 (arm64)
--
-- Host: localhost    Database: plants
-- ------------------------------------------------------
-- Server version	11.5.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `fertilizer_type`
--

DROP TABLE IF EXISTS `fertilizer_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fertilizer_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fertilizing_name` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fertilizer_type`
--

LOCK TABLES `fertilizer_type` WRITE;
/*!40000 ALTER TABLE `fertilizer_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `fertilizer_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fertilizing`
--

DROP TABLE IF EXISTS `fertilizing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fertilizing` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plant_id` int(10) unsigned NOT NULL,
  `fertilizing_date` date NOT NULL,
  `fertilizer_type` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fertilizing___fk` (`plant_id`),
  KEY `fertilizing_fertilizer_type_id_fk` (`fertilizer_type`),
  CONSTRAINT `fertilizing___fk` FOREIGN KEY (`plant_id`) REFERENCES `plant` (`id`),
  CONSTRAINT `fertilizing_fertilizer_type_id_fk` FOREIGN KEY (`fertilizer_type`) REFERENCES `fertilizer_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fertilizing`
--

LOCK TABLES `fertilizing` WRITE;
/*!40000 ALTER TABLE `fertilizing` DISABLE KEYS */;
/*!40000 ALTER TABLE `fertilizing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plant`
--

DROP TABLE IF EXISTS `plant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `species_id` int(10) unsigned NOT NULL,
  `date_added` date NOT NULL,
  `location` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `plant_species_id_fk` (`species_id`),
  CONSTRAINT `plant_species_id_fk` FOREIGN KEY (`species_id`) REFERENCES `species` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plant`
--

LOCK TABLES `plant` WRITE;
/*!40000 ALTER TABLE `plant` DISABLE KEYS */;
/*!40000 ALTER TABLE `plant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `species`
--

DROP TABLE IF EXISTS `species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `species` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `species`
--

LOCK TABLES `species` WRITE;
/*!40000 ALTER TABLE `species` DISABLE KEYS */;
/*!40000 ALTER TABLE `species` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watering`
--

DROP TABLE IF EXISTS `watering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watering` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plant_id` int(10) unsigned NOT NULL,
  `watering_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `watering___fk` (`plant_id`),
  CONSTRAINT `watering___fk` FOREIGN KEY (`plant_id`) REFERENCES `plant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watering`
--

LOCK TABLES `watering` WRITE;
/*!40000 ALTER TABLE `watering` DISABLE KEYS */;
/*!40000 ALTER TABLE `watering` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2024-11-15 17:58:39
