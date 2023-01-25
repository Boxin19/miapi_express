CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `t1_clientes`
--

DROP TABLE IF EXISTS `t1_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t1_clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Ap` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Dni` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Dni_UNIQUE` (`Dni`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t1_clientes`
--

LOCK TABLES `t1_clientes` WRITE;
/*!40000 ALTER TABLE `t1_clientes` DISABLE KEYS */;
INSERT INTO `t1_clientes` VALUES (1,'Guillermo','Saiz','01572145G'),(2,'Marta','Ortiz','01572175G'),(3,'Luis','Pérez','01592145G'),(4,'Andrés','Ortega','01512145G');
/*!40000 ALTER TABLE `t1_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t2_viaje`
--

DROP TABLE IF EXISTS `t2_viaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t2_viaje` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IdentificadorVuelo` varchar(25) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Hotel` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `t1_cliente_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_t2_Viaje_t1_clientes` (`t1_cliente_id`),
  CONSTRAINT `fk_t2_Viaje_t1_clientes` FOREIGN KEY (`t1_cliente_id`) REFERENCES `t1_clientes` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t2_viaje`
--

LOCK TABLES `t2_viaje` WRITE;
/*!40000 ALTER TABLE `t2_viaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2_viaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t3_hotel`
--

DROP TABLE IF EXISTS `t3_hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t3_hotel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `tarifa` mediumint NOT NULL,
  `t1_cliente_id` int NOT NULL,
  `t2_viaje_id` int NOT NULL,
  PRIMARY KEY (`id`,`t1_cliente_id`,`t2_viaje_id`),
  KEY `fk_t3_hotel_t1_clientes1` (`t1_cliente_id`),
  KEY `fk_t3_hotel_t2_Viaje1` (`t2_viaje_id`),
  CONSTRAINT `fk_t3_hotel_t1_clientes1` FOREIGN KEY (`t1_cliente_id`) REFERENCES `t1_clientes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_t3_hotel_t2_Viaje1` FOREIGN KEY (`t2_viaje_id`) REFERENCES `t2_viaje` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t3_hotel`
--

LOCK TABLES `t3_hotel` WRITE;
/*!40000 ALTER TABLE `t3_hotel` DISABLE KEYS */;
/*!40000 ALTER TABLE `t3_hotel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-25 22:42:48
