CREATE DATABASE  IF NOT EXISTS `mini_ebay_cpen410` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mini_ebay_cpen410`;
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
  `Bid` int NOT NULL,
  `UserName` varchar(20) DEFAULT NULL,
  `ProductID` int NOT NULL,
  PRIMARY KEY (`Bid`),
  KEY `UserName` (`UserName`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `bid_ibfk_1` FOREIGN KEY (`UserName`) REFERENCES `usergood` (`UserName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bid_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
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
INSERT INTO `department` VALUES ('Automobiles'),('Books'),('Computers'),('Electronics'),('Movies'),('Phones'),('Power Tools'),('school supplies'),('Shoes'),('Video Games');
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
  `bid` double NOT NULL,
  `duedate` date NOT NULL,
  `UserName` varchar(20) NOT NULL,
  `image` mediumtext,
  PRIMARY KEY (`ProductID`),
  UNIQUE KEY `ProductID_UNIQUE` (`ProductID`),
  KEY `product_ibfk_1` (`UserName`),
  KEY `product_ibfk_2` (`dept_name`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`UserName`) REFERENCES `usergood` (`UserName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (78,'The Amazing Spider-Man','Spiderman movie','Movies',252,'2024-05-23','Mannychuela','spidermanmovie.jpg'),(82,'Toyota Tercel 93','Carro esta en buena condiciones. Le falta el titulo','Automobiles',11000,'2024-05-23','Mannychuela','good car.jpg'),(84,'Pencil','Un lapiz bueno','school supplies',2,'2024-05-30','Mannychuela','pencil.png'),(85,'Toaster','La tostadora esta tostando','Electronics',15.77,'2024-05-30','Mannychuela','Untitled.jpg'),(86,'Lord Of The Rings Trilogy','The extended trilogy in 4k','Movies',59.99,'2024-05-30','Mannychuela','Lord-Of-The-Rings-TrilogyExtended-Theatrical-Editions.webp'),(87,'Shoes','Running shoes','Shoes',45.5,'2024-05-30','Mannychuela','s-l225.jpg'),(88,'Pavilion laptop','A decent office laptop','Computers',350.99,'2024-05-30','Mannychuela','pavilion.jpg'),(89,'Inspiron Laptop','Good working laptop','Computers',399.99,'2024-05-31','Mannychuela','inspiron.jpg'),(90,'Wireless Earbuds','Used wireless earbuds','Electronics',59.99,'2024-06-19','Mannychuela','earbuds.jpg'),(91,'Samsung Galaxy','A brand new galaxy phone','Phones',599.99,'2024-05-31','Mannychuela','galaxy.jpg'),(92,'IphoneX','Mint-condition IphoneX','Phones',699.99,'2024-05-30','Mannychuela','iphonex.jpg'),(93,'Coraline','The Coraline book','Books',25.99,'2024-05-31','Mannychuela','coraline book.jpg'),(94,'Dewalt Power Tools','Nice power tools bundle','Power Tools',89.99,'2024-05-31','Mannychuela','Untitled.png'),(95,'Elden Ring','Elden Ring Video Game PS5','Video Games',69.99,'2024-05-31','ElPepe','81h2WhI4dtL._AC_UF1000,1000_QL80_.jpg');
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
INSERT INTO `roleuser` VALUES ('admin','ROLE1','2024-03-12'),('admin01','ROLE1','2024-03-12'),('admin03','ROLE1','2024-03-12'),('admin2','ROLE1','2024-03-12'),('admin60','ROLE1','2024-03-12'),('admin78','ROLE1','2024-03-12'),('admin89','ROLE1','2024-03-12'),('adminnnn','ROLE1','2024-03-12'),('adminTest','ROLE1','2024-03-12'),('ElPepe','ROLE2','2024-03-12'),('Mannychuela','ROLE1','2024-03-12'),('manuel','ROLE1','2024-03-12'),('mario','ROLE2','2024-03-12'),('otro','ROLE1','2024-03-12'),('prueba','ROLE2','2024-03-12'),('prueba2','ROLE2','2024-03-12'),('prueba89','ROLE2','2024-03-12'),('qwertyBro','ROLE2','2024-03-12'),('spidey','ROLE2','2024-03-12'),('testHash','ROLE2','2024-03-12'),('userTest','ROLE2','2024-03-12'),('wilfredo','ROLE2','2024-03-12');
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
INSERT INTO `usergood` VALUES ('admin','ac9689e2272427085e35b9d3e3e8bed88cb3434828b43b86fc0596cad4c6e270','Admin','1234'),('admin01','b463c4aa2c9490d2005efd2aa8f6e1010d3d16308763404af3f70e2af97e6995','Admin','1234'),('admin03','8b343a5b6d2f0f41ca270bcae8012d6487fde73d406e576eb52395e5593efcb0','admin','1234'),('admin2','5137b9f1887bd3dda179a6c0ff5a7a48b74f56e7bef65c343600a1dba197b24f','admin','1234'),('admin60','d289a2f97aad2ac6e0a6d25d51dcf650ff694c14eace88bcae576c1af624840e','Admin','1234'),('admin78','0b5674fec534577a601eb15d8ea85bbde8990d50eaac1987c83952d41d5e617b','admin','1234'),('admin89','f27eefc0d88601045f8d1d69b01e2ba2fcc2531d14b7480991efe54e76f463cf','Admin','1234'),('adminnnn','7d83ae87c3b1229600132b11a63427ca60043e397e28f88a096020d30f55b799','Admin','1234'),('adminTest','6f5f08d0a207c30d9d0da887d29c8ecbbb7481192648842140c1ccaf6d9eea3e','w','1234'),('ElPepe','a673196c3224f8f21d6cb7c7c4fdcd74bf353f4399847e72cbc66b133a71a871','Padre Tiempo','123456'),('Mannychuela','688c1c23ca73a1dbb4d8b83d8a1ca14ff5589d5944f59a48b40e98cd67eecddf','Manu','8478406871'),('manuel','7fd657fd8296c1c40bcbe04b7eb61e27bb5dafdbb7d103b140cdb7475f8211af','manuel','9999'),('mario','1ad4ab0a74a2483318322183d0807282f01f2d8ba6779fd6bd28d871f06885b0','mario','1234'),('otro','c2b08b4f74abac794ed0849a9f24f4e50337342ae6cddf02918bf80b0b943e4a','otro','1234'),('prueba','66db84d7882ef2321e453772d227c4e4e9a53c96131aac8e6549342dd97b3203','Prueba','1234'),('prueba2','b3f831f7997359e07c4e5258515361d2e2154986d3df4c1e98f775b72b495a4c','User 1','1234'),('prueba89','83a9caf2f39663b40623cdad0c56ff84719bcff3c6359cb9726ce973f9887938','qwerty','1234'),('qwertyBro','642dd5d882ab724d4e54b4afe14203b8dc3c5ee4913992ed2f3aa5b1755ba1a6','Bro','1'),('spidey','1037b05ffda6a634816289ae0955332ee2dd1c5e14db28bd6b189904e8a173dd','Pete','1234'),('testHash','bb2128b67a60be66e2aae7bb7d0670e42e23b5d9e0edba57a8554a3a94de15f7','Test Hash','4321'),('userTest','308caa642ae3f0be8ed54ffbe4ca60642c7d1bc7062f9fc6ca26acaf32393925','TEST','1234'),('wilfredo','cce9a7d4f07bd544560177c3586c1df7a269ab8095c19f6217420a80a1983f1a','Wilfredo','1234');
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
INSERT INTO `webpageprevious` VALUES ('addAdmin.jsp','addAdmin.jsp'),('newAdmin.jsp','addAdmin.jsp'),('welcomeMenu.jsp','addAdmin.jsp'),('addDepartment.jsp','addDepartment.jsp'),('newDepartment.jsp','addDepartment.jsp'),('welcomeMenu.jsp','addDepartment.jsp'),('addProduct.jsp','addProduct.jsp'),('newProduct.jsp','addProduct.jsp'),('welcomeMenu.jsp','addProduct.jsp'),('welcomeMEnu.jsp','addUser.jsp'),('bidProcessed.jsp','bidProcessed.jsp'),('displayItem.jsp','bidProcessed.jsp'),('welcomeMenu.jsp','bidProcessed.jsp'),('deleteDepartment.jsp','deleteDepartment.jsp'),('removeDepartment.jsp','deleteDepartment.jsp'),('welcomeMenu.jsp','deleteDepartment.jsp'),('deleteProduct.jsp','deleteProduct.jsp'),('removeProduct.jsp','deleteProduct.jsp'),('welcomeMenu.jsp','deleteProduct.jsp'),('removeUser.jsp','deleteUser.jsp'),('welcomeMenu.jsp','deleteUser.jsp'),('displayItem.jsp','displayItem.jsp'),('searchProduct.jsp','displayItem.jsp'),('updateBid.jsp','displayItem.jsp'),('welcomeMenu.jsp','displayItem.jsp'),('addUser.jsp','listUser.jsp'),('validationHashing.jsp','loginHashing.html'),('modifyDepartment.jsp','modifyDepartment.jsp'),('updateDepartment.jsp','modifyDepartment.jsp'),('welcomeMenu.jsp','modifyDepartment.jsp'),('modifyProduct.jsp','modifyProduct.jsp'),('updateProduct.jsp','modifyProduct.jsp'),('welcomeMenu.jsp','modifyProduct.jsp'),('modifyUser.jsp','modifyUser.jsp'),('updateUser.jsp','modifyUser.jsp'),('welcomeMenu.jsp','modifyUser.jsp'),('addAdmin.jsp','newAdmin.jsp'),('newAdmin.jsp','newAdmin.jsp'),('welcomeMenu.jsp','newAdmin.jsp'),('addDepartment.jsp','newDepartment.jsp'),('newDepartment.jsp','newDepartment.jsp'),('welcomeMenu.jsp','newDepartment.jsp'),('addProduct.jsp','newProduct.jsp'),('newProduct.jsp','newProduct.jsp'),('welcomeMenu.jsp','newProduct.jsp'),('addUser.jsp','newUser.html'),('deleteDepartment.jsp','removeDepartment.jsp'),('removeDepartment.jsp','removeDepartment.jsp'),('welcomeMenu.jsp','removeDepartment.jsp'),('deleteProduct.jsp','removeProduct.jsp'),('removeProduct.jsp','removeProduct.jsp'),('welcomeMenu.jsp','removeProduct.jsp'),('deleteUser.jsp','removeUser.jsp'),('removeUser.jsp','removeUser.jsp'),('welcomeMenu.jsp','removeUser.jsp'),('displayItem.jsp','searchProduct.jsp'),('searchProduct.jsp','searchProduct.jsp'),('welcomeMenu.jsp','searchProduct.jsp'),('bidProcessed.jsp','updateBid.jsp'),('displayItem.jsp','updateBid.jsp'),('welcomeMenu.jsp','updateBid.jsp'),('modifyDepartment.jsp','updateDepartment.jsp'),('updateDepartment.jsp','updateDepartment.jsp'),('welcomeMenu.jsp','updateDepartment.jsp'),('modifyProduct.jsp','updateProduct.jsp'),('updateProduct.jsp','updateProduct.jsp'),('welcomeMenu.jsp','updateProduct.jsp'),('modifyUser.jsp','updateUser.jsp'),('updateUser.jsp','updateUser.jsp'),('welcomeMEnu.jsp','updateUser.jsp'),('welcomeMenu.jsp','validationHashing.jsp'),('listUser.jsp','welcomeMenu.jsp'),('modifyDepartment.jsp','welcomeMenu.jsp'),('modifyProduct.jsp','welcomeMenu.jsp'),('modifyUser.jsp','welcomeMenu.jsp'),('newAdmin.jsp','welcomeMenu.jsp'),('newDepartment.jsp','welcomeMenu.jsp'),('newProduct.jsp','welcomeMenu.jsp'),('removeDepartment.jsp','welcomeMenu.jsp'),('removeProduct.jsp','welcomeMenu.jsp'),('removeUser.jsp','welcomeMenu.jsp'),('searchProduct.jsp','welcomeMenu.jsp'),('welcomeMenu.jsp','welcomeMenu.jsp');
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

-- Dump completed on 2024-03-31 21:41:29
