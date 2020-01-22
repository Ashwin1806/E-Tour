-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: etour
-- ------------------------------------------------------
-- Server version	5.1.38-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bookingdetail`
--

DROP TABLE IF EXISTS `bookingdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookingdetail` (
  `bookingid` int(11) NOT NULL AUTO_INCREMENT,
  `datepackageid` int(11) DEFAULT NULL,
  `bookingdate` date DEFAULT NULL,
  `customerid` int(11) DEFAULT NULL,
  `packageid` int(11) DEFAULT NULL,
  `passengerid` int(11) DEFAULT NULL,
  `activestatus` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`bookingid`),
  KEY `datepackageid_idx` (`datepackageid`),
  KEY `customerid_idx` (`customerid`),
  KEY `passengerid_idx` (`passengerid`),
  KEY `packageid_idx` (`packageid`),
  CONSTRAINT `bookingdetail_ibfk_1` FOREIGN KEY (`packageid`) REFERENCES `packagecompletedetail` (`packageid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customerid` FOREIGN KEY (`customerid`) REFERENCES `customerdetail` (`customerid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `datepackageid` FOREIGN KEY (`datepackageid`) REFERENCES `datepackagedetail` (`datepackageid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `passengerid` FOREIGN KEY (`passengerid`) REFERENCES `passengerdetail` (`passengerid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookingdetail`
--

LOCK TABLES `bookingdetail` WRITE;
/*!40000 ALTER TABLE `bookingdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookingdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorysubcategory`
--

DROP TABLE IF EXISTS `categorysubcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorysubcategory` (
  `catsubid` int(11) NOT NULL AUTO_INCREMENT,
  `categoryid` int(11) DEFAULT NULL,
  `categoryname` varchar(50) DEFAULT NULL,
  `categoryimage` varchar(50) DEFAULT NULL,
  `subcategoryid` int(11) DEFAULT NULL,
  `subcategoryname` varchar(50) DEFAULT NULL,
  `subcategoryimage` varchar(50) DEFAULT NULL,
  `eofflag` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`catsubid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorysubcategory`
--

LOCK TABLES `categorysubcategory` WRITE;
/*!40000 ALTER TABLE `categorysubcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorysubcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerdetail`
--

DROP TABLE IF EXISTS `customerdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerdetail` (
  `customerid` int(11) NOT NULL AUTO_INCREMENT,
  `customername` varchar(50) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `address1` varchar(200) DEFAULT NULL,
  `address2` varchar(200) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `pin` varchar(8) DEFAULT NULL,
  `telno` varchar(10) DEFAULT NULL,
  `mobileno` varchar(10) DEFAULT NULL,
  `registrationdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`customerid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerdetail`
--

LOCK TABLES `customerdetail` WRITE;
/*!40000 ALTER TABLE `customerdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `customerdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datepackagedetail`
--

DROP TABLE IF EXISTS `datepackagedetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datepackagedetail` (
  `datepackageid` int(11) NOT NULL AUTO_INCREMENT,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `packageid` int(11) DEFAULT NULL,
  `reversetripflag` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`datepackageid`),
  KEY `packageid_idx` (`packageid`),
  CONSTRAINT `packageid` FOREIGN KEY (`packageid`) REFERENCES `packagecompletedetail` (`packageid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datepackagedetail`
--

LOCK TABLES `datepackagedetail` WRITE;
/*!40000 ALTER TABLE `datepackagedetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `datepackagedetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itinerary`
--

DROP TABLE IF EXISTS `itinerary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itinerary` (
  `itr_id` int(11) NOT NULL AUTO_INCREMENT,
  `packageid` int(11) DEFAULT NULL,
  `location` varchar(30) DEFAULT NULL,
  `dayno` int(11) DEFAULT NULL,
  `daywisedescription` tinytext,
  PRIMARY KEY (`itr_id`),
  KEY `itinerary_ibfk_1` (`packageid`),
  CONSTRAINT `itinerary_ibfk_1` FOREIGN KEY (`packageid`) REFERENCES `packagecompletedetail` (`packageid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itinerary`
--

LOCK TABLES `itinerary` WRITE;
/*!40000 ALTER TABLE `itinerary` DISABLE KEYS */;
/*!40000 ALTER TABLE `itinerary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packagecompletedetail`
--

DROP TABLE IF EXISTS `packagecompletedetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packagecompletedetail` (
  `packageid` int(11) NOT NULL AUTO_INCREMENT,
  `tourname` varchar(45) DEFAULT NULL,
  `tourimage` varchar(45) DEFAULT NULL,
  `catsubid` int(11) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`packageid`),
  KEY `catsubid_idx` (`catsubid`),
  CONSTRAINT `catsubid` FOREIGN KEY (`catsubid`) REFERENCES `categorysubcategory` (`catsubid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packagecompletedetail`
--

LOCK TABLES `packagecompletedetail` WRITE;
/*!40000 ALTER TABLE `packagecompletedetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `packagecompletedetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passengerdetail`
--

DROP TABLE IF EXISTS `passengerdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passengerdetail` (
  `passengerid` int(11) NOT NULL AUTO_INCREMENT,
  `bookingid` int(11) DEFAULT NULL,
  `passengername` varchar(50) DEFAULT NULL,
  `passengerdob` date DEFAULT NULL,
  `roomtype` varchar(20) DEFAULT NULL,
  `cost` decimal(10,3) DEFAULT NULL,
  `passengeriddocument` varchar(45) DEFAULT NULL,
  `passengeridno` int(11) DEFAULT NULL,
  `passengerdetailcol` varchar(45) DEFAULT NULL,
  `passengersex` varchar(10) DEFAULT NULL,
  `passengeremail` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`passengerid`),
  KEY `bookingid_idx` (`bookingid`),
  CONSTRAINT `bookingid` FOREIGN KEY (`bookingid`) REFERENCES `bookingdetail` (`bookingid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passengerdetail`
--

LOCK TABLES `passengerdetail` WRITE;
/*!40000 ALTER TABLE `passengerdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `passengerdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pricedetail`
--

DROP TABLE IF EXISTS `pricedetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pricedetail` (
  `priceid` int(11) NOT NULL DEFAULT '0',
  `packageid` int(11) DEFAULT '0',
  `tour_cost` decimal(10,3) DEFAULT NULL,
  `single_person` decimal(10,3) DEFAULT NULL,
  `Adults` decimal(10,3) DEFAULT NULL,
  `child w_o bed` decimal(10,3) DEFAULT NULL,
  `child with bed` decimal(10,3) DEFAULT NULL,
  PRIMARY KEY (`priceid`),
  KEY `pricedetail_ibfk_1` (`packageid`),
  CONSTRAINT `pricedetail_ibfk_1` FOREIGN KEY (`packageid`) REFERENCES `packagecompletedetail` (`packageid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricedetail`
--

LOCK TABLES `pricedetail` WRITE;
/*!40000 ALTER TABLE `pricedetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `pricedetail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-20 12:59:16
