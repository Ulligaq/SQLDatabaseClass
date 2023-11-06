-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: localhost    Database: matsu_video
-- ------------------------------------------------------
-- Server version	8.0.34-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Accessibility`
--

DROP TABLE IF EXISTS `Accessibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Accessibility` (
  `Code` int NOT NULL,
  `Languages` varchar(100) DEFAULT NULL,
  `Subtitles` varchar(100) DEFAULT NULL,
  KEY `Code` (`Code`),
  CONSTRAINT `Accessibility_ibfk_1` FOREIGN KEY (`Code`) REFERENCES `MediaType` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accessibility`
--

LOCK TABLES `Accessibility` WRITE;
/*!40000 ALTER TABLE `Accessibility` DISABLE KEYS */;
INSERT INTO `Accessibility` VALUES (99997,'Japanese','English, English for the deaf, Spanish, French'),(99998,'Silent Film','English Dialogue Cards'),(99999,'Japanese','English, English for the deaf, Spanish, French');
/*!40000 ALTER TABLE `Accessibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employees`
--

DROP TABLE IF EXISTS `Employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employees` (
  `EmployeeID` int NOT NULL,
  `FirstName` varchar(9) DEFAULT NULL,
  `LastName` varchar(9) DEFAULT NULL,
  `FavMovie` varchar(20) DEFAULT NULL,
  `Position` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employees`
--

LOCK TABLES `Employees` WRITE;
/*!40000 ALTER TABLE `Employees` DISABLE KEYS */;
INSERT INTO `Employees` VALUES (12345,'Sterling','Beck','Memories of Murder','Manager'),(33333,'Brandon','Murak','The Holy Grail','Clerk'),(33432,'Jimmy','Jim Bob','Blade Runner','Janitor'),(54321,'Kendall','Beck','Dazed and Confused','Manager'),(77777,'Kenneth','Hondl','Spirited Away','Owner'),(222222,'Rain','Hastings','Tampopo','Clerk');
/*!40000 ALTER TABLE `Employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MediaType`
--

DROP TABLE IF EXISTS `MediaType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MediaType` (
  `Code` int NOT NULL,
  `MovieID` int NOT NULL,
  `Title` varchar(30) DEFAULT NULL,
  `Format` varchar(11) DEFAULT NULL,
  `Distributor` varchar(30) DEFAULT NULL,
  `AspectRatio` varchar(6) DEFAULT NULL,
  `Length` varchar(11) DEFAULT NULL,
  `Year` varchar(4) DEFAULT NULL,
  `MPAA` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`Code`),
  KEY `MovieID` (`MovieID`),
  CONSTRAINT `MediaType_ibfk_1` FOREIGN KEY (`MovieID`) REFERENCES `Movie` (`MovieID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MediaType`
--

LOCK TABLES `MediaType` WRITE;
/*!40000 ALTER TABLE `MediaType` DISABLE KEYS */;
INSERT INTO `MediaType` VALUES (99997,111113,'Fire Walk With Me','Blu-ray','Criterion Channel','1.85:1','135 Minutes','1992','R'),(99998,111112,'He Who Gets Slapped','DVD','Warner Archive','1:33:1','72 Minutes','1924','Not Rated'),(99999,111111,'House','Blu-ray','Criterion Collection','1:33:1','88 Minutes','1977','Not Rated');
/*!40000 ALTER TABLE `MediaType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Movie`
--

DROP TABLE IF EXISTS `Movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Movie` (
  `MovieID` int NOT NULL,
  `Title` varchar(20) DEFAULT NULL,
  `Director` varchar(23) DEFAULT NULL,
  `Writer` varchar(23) DEFAULT NULL,
  `Composer` varchar(20) DEFAULT NULL,
  `Cinematographer` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MovieID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movie`
--

LOCK TABLES `Movie` WRITE;
/*!40000 ALTER TABLE `Movie` DISABLE KEYS */;
INSERT INTO `Movie` VALUES (111111,'House','Nobohiku Obayashi','Chihu Katsura','Godaigo','Yoshitaka Sakamoto'),(111112,'He Who Gets Slapped','Victor Seastrom','Victor Seastrom','William Axt','Milton Moore'),(111113,'Fire Walk With Me','David Lynch','David Lynch','Angelo Badalamenti','Ron Garcia');
/*!40000 ALTER TABLE `Movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ratings`
--

DROP TABLE IF EXISTS `Ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ratings` (
  `EmployeeID` int NOT NULL,
  `MovieID` int NOT NULL,
  `Performance` int NOT NULL,
  `Cinematography` int NOT NULL,
  `SFX` int NOT NULL,
  `Writing` int NOT NULL,
  `ShlockValue` int NOT NULL,
  PRIMARY KEY (`EmployeeID`,`MovieID`),
  KEY `MovieID` (`MovieID`),
  CONSTRAINT `Ratings_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employees` (`EmployeeID`),
  CONSTRAINT `Ratings_ibfk_2` FOREIGN KEY (`MovieID`) REFERENCES `Movie` (`MovieID`),
  CONSTRAINT `outoften1` CHECK ((`Performance` <= 10)),
  CONSTRAINT `outoften2` CHECK ((`Cinematography` <= 10)),
  CONSTRAINT `outoften3` CHECK ((`SFX` <= 10)),
  CONSTRAINT `outoften4` CHECK ((`Writing` <= 10)),
  CONSTRAINT `outoften5` CHECK ((`ShlockValue` <= 10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ratings`
--

LOCK TABLES `Ratings` WRITE;
/*!40000 ALTER TABLE `Ratings` DISABLE KEYS */;
INSERT INTO `Ratings` VALUES (12345,111113,10,10,10,10,6),(54321,111113,5,10,4,3,10);
/*!40000 ALTER TABLE `Ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recommendation`
--

DROP TABLE IF EXISTS `Recommendation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Recommendation` (
  `EmployeeID` int NOT NULL,
  `MovieID` int NOT NULL,
  KEY `EmployeeID` (`EmployeeID`),
  KEY `MovieID` (`MovieID`),
  CONSTRAINT `Recommendation_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employees` (`EmployeeID`),
  CONSTRAINT `Recommendation_ibfk_2` FOREIGN KEY (`MovieID`) REFERENCES `Movie` (`MovieID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recommendation`
--

LOCK TABLES `Recommendation` WRITE;
/*!40000 ALTER TABLE `Recommendation` DISABLE KEYS */;
INSERT INTO `Recommendation` VALUES (12345,111113),(54321,111113);
/*!40000 ALTER TABLE `Recommendation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-23  5:13:46
