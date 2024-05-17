-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: mini_ebay_cpen410
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `bid`
--

DROP TABLE IF EXISTS `bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bid` (
  `Bid` double NOT NULL,
  `UserName` varchar(20) DEFAULT NULL,
  `ProductID` int NOT NULL,
  `BidID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`BidID`),
  KEY `UserName` (`UserName`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `bid_ibfk_1` FOREIGN KEY (`UserName`) REFERENCES `usergood` (`UserName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bid_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
INSERT INTO `bid` VALUES (29.99,'marcos',113,8),(25.99,'marcos',112,9),(29.99,'user06',112,10),(30.01,'user06',110,11),(249.99,'user06',111,12);
/*!40000 ALTER TABLE `bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dept_name` varchar(20) NOT NULL,
  PRIMARY KEY (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('Books'),('Electronics'),('Movies'),('Shoes');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuelement`
--

DROP TABLE IF EXISTS `menuelement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuelement` (
  `menuID` int NOT NULL,
  `title` varchar(40) NOT NULL,
  `Description` mediumtext NOT NULL,
  PRIMARY KEY (`menuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuelement`
--

LOCK TABLES `menuelement` WRITE;
/*!40000 ALTER TABLE `menuelement` DISABLE KEYS */;
INSERT INTO `menuelement` VALUES (0,'General pages','General pages'),(1,'Users','User management'),(2,'General','General operations'),(3,'Help','Technical support'),(4,'Hidden Pages','Hidden');
/*!40000 ALTER TABLE `menuelement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `dept_name` varchar(20) NOT NULL,
  `bid` double(10,2) NOT NULL,
  `duedate` date NOT NULL,
  `UserName` varchar(20) NOT NULL,
  `image` mediumtext,
  PRIMARY KEY (`ProductID`),
  UNIQUE KEY `ProductID_UNIQUE` (`ProductID`),
  KEY `product_ibfk_1` (`UserName`),
  KEY `product_ibfk_2` (`dept_name`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`UserName`) REFERENCES `usergood` (`UserName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (109,'Coraline','Coraline book','books',25.00,'2024-12-12','marcos','41pNx3xpmTL.jpg'),(110,'Coraline','movie','Movies',30.01,'2024-12-12','marcos','R.jpeg'),(111,'Air Jordans','Air Jordans','Shoes',249.99,'2024-12-12','marcos','screen-shot-2022-10-30-at-5-36-40-pm.jpg'),(112,'The Amazing Spider-Man','TASM Movie','Books',29.99,'2024-12-12','marcos','s-l1600.jpg'),(113,'The Amazing Spider-Man','TASM Movie','Movies',29.99,'2024-12-12','marcos','91xkerDpF7L._AC_UF894,1000_QL80_.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `RoleId` varchar(20) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Description` varchar(20) NOT NULL,
  PRIMARY KEY (`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('ROLE1','Admin','Administrator Role'),('ROLE2','User','User Role');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roleuser`
--

DROP TABLE IF EXISTS `roleuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roleuser` (
  `UserName` varchar(20) NOT NULL,
  `RoleId` varchar(20) NOT NULL,
  `dateAssign` date NOT NULL,
  PRIMARY KEY (`UserName`,`RoleId`),
  KEY `fk_roleuser` (`RoleId`),
  CONSTRAINT `fk_roleuser` FOREIGN KEY (`RoleId`) REFERENCES `role` (`RoleId`) ON DELETE CASCADE,
  CONSTRAINT `fk_userrole` FOREIGN KEY (`UserName`) REFERENCES `usergood` (`UserName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roleuser`
--

LOCK TABLES `roleuser` WRITE;
/*!40000 ALTER TABLE `roleuser` DISABLE KEYS */;
INSERT INTO `roleuser` VALUES ('manuel','ROLE1','2024-03-12'),('marcos','ROLE1','2024-03-12'),('user06','ROLE2','2024-03-12');
/*!40000 ALTER TABLE `roleuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolewebpage`
--

DROP TABLE IF EXISTS `rolewebpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rolewebpage` (
  `RoleId` varchar(20) NOT NULL,
  `pageURL` varchar(255) NOT NULL,
  `dateAssign` date NOT NULL,
  PRIMARY KEY (`RoleId`,`pageURL`),
  KEY `rolewebpage_ibfk_1` (`pageURL`),
  CONSTRAINT `rolewebpage_ibfk_1` FOREIGN KEY (`pageURL`) REFERENCES `webpage` (`pageURL`) ON DELETE CASCADE,
  CONSTRAINT `rolewebpage_ibfk_2` FOREIGN KEY (`RoleId`) REFERENCES `role` (`RoleId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolewebpage`
--

LOCK TABLES `rolewebpage` WRITE;
/*!40000 ALTER TABLE `rolewebpage` DISABLE KEYS */;
INSERT INTO `rolewebpage` VALUES ('ROLE1','addAdmin.jsp','2024-03-12'),('ROLE1','addDepartment.jsp','2024-03-12'),('ROLE1','addProduct.jsp','2024-03-12'),('ROLE1','bidProcessed.jsp','2024-03-12'),('ROLE1','deleteDepartment.jsp','2024-03-12'),('ROLE1','deleteProduct.jsp','2024-03-12'),('ROLE1','deleteUser.jsp','2024-03-12'),('ROLE1','displayItem.jsp','2024-03-12'),('ROLE1','modifyDepartment.jsp','2024-03-12'),('ROLE1','modifyProduct.jsp','2024-03-12'),('ROLE1','modifyUser.jsp','2024-03-12'),('ROLE1','newAdmin.jsp','2024-03-12'),('ROLE1','newDepartment.jsp','2024-03-12'),('ROLE1','newProduct.jsp','2024-03-12'),('ROLE1','removeDepartment.jsp','2024-03-12'),('ROLE1','removeProduct.jsp','2024-03-12'),('ROLE1','removeUser.jsp','2024-03-12'),('ROLE1','searchProduct.jsp','2024-03-12'),('ROLE1','updateBid.jsp','2024-03-12'),('ROLE1','updateDepartment.jsp','2024-03-12'),('ROLE1','updateProduct.jsp','2024-03-12'),('ROLE1','updateUser.jsp','2024-03-12'),('ROLE1','welcomeMenu.jsp','2024-03-12'),('ROLE2','addProduct.jsp','2024-03-12'),('ROLE2','bidProcessed.jsp','2024-03-12'),('ROLE2','displayItem.jsp','2024-03-12'),('ROLE2','newProduct.jsp','2024-03-12'),('ROLE2','searchProduct.jsp','2024-03-12'),('ROLE2','updateBid.jsp','2024-03-12'),('ROLE2','welcomeMenu.jsp','2024-03-12');
/*!40000 ALTER TABLE `rolewebpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergood`
--

DROP TABLE IF EXISTS `usergood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergood` (
  `UserName` varchar(20) NOT NULL,
  `hashing` mediumtext NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Telephone` varchar(20) NOT NULL,
  PRIMARY KEY (`UserName`),
  UNIQUE KEY `UserName_UNIQUE` (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergood`
--

LOCK TABLES `usergood` WRITE;
/*!40000 ALTER TABLE `usergood` DISABLE KEYS */;
INSERT INTO `usergood` VALUES ('manuel','fb258e20c0fedcdd2546293674d90ec6f0f1bb6b613373ed0aefa3d831303071','Manuel','1234'),('marcos','234d2cc87f40109514cedddbb2d13d65ac76fc8051fc7469c73e765b6132e7ba','marcos','1234'),('user06','972bccfc44d812c12e21795bbeecb467ac7966f3938594e94f095f8d30f9b054','User 06','1234');
/*!40000 ALTER TABLE `usergood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webpage`
--

DROP TABLE IF EXISTS `webpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webpage` (
  `pageURL` varchar(40) NOT NULL,
  `pageTitle` varchar(40) NOT NULL,
  `Description` mediumtext NOT NULL,
  `menuID` int DEFAULT NULL,
  PRIMARY KEY (`pageURL`),
  KEY `menuID` (`menuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webpage`
--

LOCK TABLES `webpage` WRITE;
/*!40000 ALTER TABLE `webpage` DISABLE KEYS */;
INSERT INTO `webpage` VALUES ('addAdmin.jsp','New Admin','Admins can use this page to create other admins',4),('addDepartment.jsp','Add Department','This page creates a new department',4),('addProduct.jsp','Add Product','This page allows users to add products for sale',4),('addUser.jsp','Add User','This page adds users to the systems ',1),('bidProcessed.jsp','Process Bid','This page processes bids',4),('deleteDepartment.jsp','Delete Department','this page deletes departments',4),('deleteProduct.jsp','Remove Product','This page allows product removal',4),('deleteUser.jsp','Remove User','This page removes users from the system',4),('displayItem.jsp','Display Item','This page displays product search results',4),('listUser.jsp','List Users','This page lists users to the systems',1),('loginHashing.html','Log in','This page logs a user in',0),('modifyDepartment.jsp','Modify Department','This page allows department modification',0),('modifyProduct.jsp','Modify Product','This page modifies products',0),('modifyUser.jsp','Modify User','This page allows user modification',1),('newAdmin.jsp','New Admin','Admins can use this page to create other admins',1),('newDepartment.jsp','New Department','This page creates a new department',0),('newProduct.jsp','New Product','This page creates a new product',0),('newUser.html','New User','This page creates a new user',0),('removeDepartment.jsp','Remove Department','This page can remove departments',0),('removeProduct.jsp','Remove Product','This page allows product removal',0),('removeUser.jsp','Remove User','This page removes users from the system',1),('searchProduct.jsp','Search Product','This page searches products',4),('updateBid.jsp','Update Bid','This page updates bids',4),('updateDepartment.jsp','Update Product','This page updates products',4),('updateProduct.jsp','Update Product','This page updates products',4),('updateUSer.jsp','Update User','This page updates user information',4),('validationHashing.jsp','Validation Hashing','Authenticate User',1),('welcomeMenu.jsp','Welcome',' the welcome page',0);
/*!40000 ALTER TABLE `webpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webpageprevious`
--

DROP TABLE IF EXISTS `webpageprevious`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webpageprevious` (
  `currentpageURL` varchar(40) NOT NULL,
  `previouspageURL` varchar(40) NOT NULL,
  PRIMARY KEY (`currentpageURL`,`previouspageURL`),
  KEY `previouspageURL` (`previouspageURL`),
  CONSTRAINT `webpageprevious_ibfk_1` FOREIGN KEY (`currentpageURL`) REFERENCES `webpage` (`pageURL`) ON DELETE CASCADE,
  CONSTRAINT `webpageprevious_ibfk_2` FOREIGN KEY (`previouspageURL`) REFERENCES `webpage` (`pageURL`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webpageprevious`
--

LOCK TABLES `webpageprevious` WRITE;
/*!40000 ALTER TABLE `webpageprevious` DISABLE KEYS */;
INSERT INTO `webpageprevious` VALUES ('addAdmin.jsp','addAdmin.jsp'),('newAdmin.jsp','addAdmin.jsp'),('welcomeMenu.jsp','addAdmin.jsp'),('addDepartment.jsp','addDepartment.jsp'),('newDepartment.jsp','addDepartment.jsp'),('welcomeMenu.jsp','addDepartment.jsp'),('addProduct.jsp','addProduct.jsp'),('newProduct.jsp','addProduct.jsp'),('welcomeMenu.jsp','addProduct.jsp'),('welcomeMEnu.jsp','addUser.jsp'),('bidProcessed.jsp','bidProcessed.jsp'),('displayItem.jsp','bidProcessed.jsp'),('welcomeMenu.jsp','bidProcessed.jsp'),('deleteDepartment.jsp','deleteDepartment.jsp'),('removeDepartment.jsp','deleteDepartment.jsp'),('welcomeMenu.jsp','deleteDepartment.jsp'),('deleteProduct.jsp','deleteProduct.jsp'),('removeProduct.jsp','deleteProduct.jsp'),('welcomeMenu.jsp','deleteProduct.jsp'),('deleteUser.jsp','deleteUser.jsp'),('removeUser.jsp','deleteUser.jsp'),('welcomeMenu.jsp','deleteUser.jsp'),('displayItem.jsp','displayItem.jsp'),('searchProduct.jsp','displayItem.jsp'),('updateBid.jsp','displayItem.jsp'),('welcomeMenu.jsp','displayItem.jsp'),('addUser.jsp','listUser.jsp'),('validationHashing.jsp','loginHashing.html'),('modifyDepartment.jsp','modifyDepartment.jsp'),('updateDepartment.jsp','modifyDepartment.jsp'),('welcomeMenu.jsp','modifyDepartment.jsp'),('modifyProduct.jsp','modifyProduct.jsp'),('updateProduct.jsp','modifyProduct.jsp'),('welcomeMenu.jsp','modifyProduct.jsp'),('modifyUser.jsp','modifyUser.jsp'),('updateUser.jsp','modifyUser.jsp'),('welcomeMenu.jsp','modifyUser.jsp'),('addAdmin.jsp','newAdmin.jsp'),('newAdmin.jsp','newAdmin.jsp'),('welcomeMenu.jsp','newAdmin.jsp'),('addDepartment.jsp','newDepartment.jsp'),('newDepartment.jsp','newDepartment.jsp'),('welcomeMenu.jsp','newDepartment.jsp'),('addProduct.jsp','newProduct.jsp'),('newProduct.jsp','newProduct.jsp'),('welcomeMenu.jsp','newProduct.jsp'),('addUser.jsp','newUser.html'),('deleteDepartment.jsp','removeDepartment.jsp'),('removeDepartment.jsp','removeDepartment.jsp'),('welcomeMenu.jsp','removeDepartment.jsp'),('deleteProduct.jsp','removeProduct.jsp'),('removeProduct.jsp','removeProduct.jsp'),('welcomeMenu.jsp','removeProduct.jsp'),('deleteUser.jsp','removeUser.jsp'),('removeUser.jsp','removeUser.jsp'),('welcomeMenu.jsp','removeUser.jsp'),('displayItem.jsp','searchProduct.jsp'),('searchProduct.jsp','searchProduct.jsp'),('welcomeMenu.jsp','searchProduct.jsp'),('bidProcessed.jsp','updateBid.jsp'),('displayItem.jsp','updateBid.jsp'),('updateBid.jsp','updateBid.jsp'),('welcomeMenu.jsp','updateBid.jsp'),('modifyDepartment.jsp','updateDepartment.jsp'),('updateDepartment.jsp','updateDepartment.jsp'),('welcomeMenu.jsp','updateDepartment.jsp'),('modifyProduct.jsp','updateProduct.jsp'),('updateProduct.jsp','updateProduct.jsp'),('welcomeMenu.jsp','updateProduct.jsp'),('modifyUser.jsp','updateUser.jsp'),('updateUser.jsp','updateUser.jsp'),('welcomeMEnu.jsp','updateUser.jsp'),('welcomeMenu.jsp','validationHashing.jsp'),('listUser.jsp','welcomeMenu.jsp'),('modifyDepartment.jsp','welcomeMenu.jsp'),('modifyProduct.jsp','welcomeMenu.jsp'),('modifyUser.jsp','welcomeMenu.jsp'),('newAdmin.jsp','welcomeMenu.jsp'),('newDepartment.jsp','welcomeMenu.jsp'),('newProduct.jsp','welcomeMenu.jsp'),('removeDepartment.jsp','welcomeMenu.jsp'),('removeProduct.jsp','welcomeMenu.jsp'),('removeUser.jsp','welcomeMenu.jsp'),('searchProduct.jsp','welcomeMenu.jsp'),('welcomeMenu.jsp','welcomeMenu.jsp');
/*!40000 ALTER TABLE `webpageprevious` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-16  1:15:49
