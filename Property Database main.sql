-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: qpropertymanagement
-- ------------------------------------------------------
-- Server version	8.0.25
-- Updated script February 2024 in version 8.0.33

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

Create Database qproperty;
Use qproperty;
--
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent` (
  `AgentID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Position` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`AgentID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent`
--

LOCK TABLES `agent` WRITE;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
INSERT INTO `agent` VALUES (1,'Cynthia','Wang','0412500600','Manager'),(2,'Anne','Brompton','0404111000','Assistant'),(3,'Daniel','Walsh','0455888090','Supervisor'),(4,'Mary','Quinn','0455777111','Manager'),(5,'Saskia','Hall','0416222000','Manager'),(6,'Julie','Nelson','0433522090','Manager');
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `DOB` date DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Jo','Jones','0416111000','1991-05-03'),(2,'Alison','Harris','0433211012','1992-09-05'),(3,'Ron','Ritchie','0411999778',NULL),(4,'Kalpen','Modi','0467111222','1989-01-19');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inspection`
--

DROP TABLE IF EXISTS `inspection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inspection` (
  `PropertyID` int NOT NULL,
  `CustomerID` int NOT NULL,
  `InspectionDate` date DEFAULT NULL,
  `comments` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PropertyID`,`CUSTOMERID`),
  KEY `inspection_ibfk_1` (`CUSTOMERID`),
  CONSTRAINT `inspection_ibfk_1` FOREIGN KEY (`CUSTOMERID`) REFERENCES `customer` (`CUSTOMERID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inspection_ibfk_2` FOREIGN KEY (`PROPERTYID`) REFERENCES `property` (`PROPERTYID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inspection`
--

LOCK TABLES `inspection` WRITE;
/*!40000 ALTER TABLE `inspection` DISABLE KEYS */;
INSERT INTO `inspection` VALUES (1,2,'2023-06-07','Beyond budget'),(2,2,'2023-06-08','Not suitable'),(4,2,'2023-06-05','Unfurnished'),(5,3,'2023-06-06','Applied'),(7,3,'2023-01-02','Beyond budget'),(6,1,'2023-07-01',NULL);
/*!40000 ALTER TABLE `inspection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property` (
  `PropertyID` int NOT NULL AUTO_INCREMENT,
  `Street` varchar(20) NOT NULL,
  `Suburb` varchar(20) NOT NULL,
  `State` varchar(10) DEFAULT NULL,
  `WeeklyRent` decimal(10,2) NOT NULL,
  `AgentID` int DEFAULT NULL,
  PRIMARY KEY (`PROPERTYID`),
  KEY `AgentID` (`AgentID`),
  CONSTRAINT `property_ibfk_1` FOREIGN KEY (`AgentID`) REFERENCES `agent` (`AGENTID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` VALUES (1,'6 Nemo Street','North Lakes','QLD',460.00,3),(2,'9 Bondi Close','Daisy Hill','QLD',510.00,5),(3,'15 Heron Street','North Lakes','QLD',570.00,4),(4,'2 Starling Road','Daisy Hill','QLD',550.00,2),(5,'18 Dromana Road','Wynnum','QLD',510.00,2),(6,'5 Nova Street','Daisy Hill','QLD',440.00,3),(7,'10 Noosa Street','Spring Hill','QLD',660.00,2),(8,'18 Bells Drive','North Lakes','QLD',520.00,1);
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repairjob`
--

DROP TABLE IF EXISTS `repairjob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repairjob` (
  `JobID` int NOT NULL AUTO_INCREMENT,
  `JobDescription` varchar(45) NOT NULL,
  `TradesmanID` int DEFAULT NULL,
  `PropertyID` int DEFAULT NULL,
  `CompletedDate` date DEFAULT NULL,
  `Charge` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`JobID`),
  KEY `PropertyID_idx` (`PropertyID`),
  KEY `TrademanID_idx` (`TradesmanID`),
  CONSTRAINT `PropertyID` FOREIGN KEY (`PropertyID`) REFERENCES `property` (`PROPERTYID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `TrademanID` FOREIGN KEY (`TradesmanID`) REFERENCES `tradesman` (`TradesmanID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repairjob`
--

LOCK TABLES `repairjob` WRITE;
/*!40000 ALTER TABLE `repairjob` DISABLE KEYS */;
INSERT INTO `repairjob` VALUES (1,'Replaced aircon B1',2,1,'2023-05-09',3000.00),(2,'Fixed shower leak',1,3,'2023-03-11',300.00),(3,'Replaced dishwasher',5,3,'2023-03-12',800.00),(4,'Fixed fence posts',4,2,'2023-04-12',1200.00),(5,'Removed trees',4,3,'2023-09-17',650.00),(6,'Fixed toilet leak',3,4,'2023-04-29',150.00),(7,'Replaced aircon B2',5,4,'2023-04-18',2900.00);
/*!40000 ALTER TABLE `repairjob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tradesman`
--

DROP TABLE IF EXISTS `tradesman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tradesman` (
  `TradesmanID` int NOT NULL AUTO_INCREMENT,
  `FIRSTNAME` varchar(20) NOT NULL,
  `LASTNAME` varchar(20) NOT NULL,
  `PHONE` varchar(20) NOT NULL,
  `LicensenNo` varchar(10) NOT NULL,
  `Skill` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`TradesmanID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tradesman`
--

LOCK TABLES `tradesman` WRITE;
/*!40000 ALTER TABLE `tradesman` DISABLE KEYS */;
INSERT INTO `tradesman` VALUES (1,'Tom','Hanks','0433999000','Q090954551','Plumbing'),(2,'David','Beckham','0422111909','Q087766124','Electric'),(3,'Lionel','Messi','0433999888','Q089877701','Plumbing'),(4,'Tiger','Woods','0423009777','Q098877712','Handyman'),(5,'Samantha','Kerr','0455920767','Q200099229','Electric'),(6,'James','Cook','0451228808','Q099934355','Handyman'),(7,'Christian','Eriksen','0456009132','Q120099999','Plumbing');
/*!40000 ALTER TABLE `tradesman` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-08 10:24:33
-- Question 1

