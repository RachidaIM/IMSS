CREATE DATABASE  IF NOT EXISTS `student1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `student1`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: student1
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etudiant` (
  `idetudiant` int NOT NULL AUTO_INCREMENT,
  `NomEtudiant` varchar(45) NOT NULL,
  `PrenomEtudiant` varchar(45) NOT NULL,
  `validation` varchar(45) DEFAULT NULL,
  `filiere_idfiliere` int DEFAULT NULL,
  `semestre_idsemestre` int DEFAULT NULL,
  PRIMARY KEY (`idetudiant`),
  KEY `fk_etudiant_filiere_idx` (`filiere_idfiliere`),
  KEY `fk_etudiant_semestre1_idx` (`semestre_idsemestre`),
  CONSTRAINT `fk_etudiant_filiere` FOREIGN KEY (`filiere_idfiliere`) REFERENCES `filiere` (`idfiliere`),
  CONSTRAINT `fk_etudiant_semestre1` FOREIGN KEY (`semestre_idsemestre`) REFERENCES `semestre` (`idsemestre`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etudiant`
--

LOCK TABLES `etudiant` WRITE;
/*!40000 ALTER TABLE `etudiant` DISABLE KEYS */;
INSERT INTO `etudiant` VALUES (1,'HAMMOUCHE','FATIHAA',NULL,1,NULL),(2,'LACHHAB','Nouhaila',NULL,1,NULL),(3,'IMANDOU','Rachida',NULL,1,NULL),(4,'HAMMOUCHE','Amina',NULL,2,NULL),(5,'KASSI','Yassmine',NULL,2,NULL),(6,'ISLAH','Nouhaila',NULL,2,NULL),(7,'HAMMOUCHE','Anass',NULL,3,NULL),(8,'BAIROUK','Hafida',NULL,3,NULL),(9,'ELMGHARI','Abdelmajid',NULL,3,NULL),(10,'TOUILEB','Diyae',NULL,1,NULL),(11,'Elouthmani','Saad-eddine',NULL,1,NULL);
/*!40000 ALTER TABLE `etudiant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluation`
--

DROP TABLE IF EXISTS `evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluation` (
  `CNE` int NOT NULL,
  `Noteecrit` int DEFAULT NULL,
  `Notetp` int DEFAULT NULL,
  `id_matiere` int NOT NULL,
  `presence_tp` int DEFAULT '0',
  PRIMARY KEY (`CNE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluation`
--

LOCK TABLES `evaluation` WRITE;
/*!40000 ALTER TABLE `evaluation` DISABLE KEYS */;
INSERT INTO `evaluation` VALUES (1,18,19,6,6),(2,17,18,6,6),(3,7,18,6,5),(4,NULL,NULL,14,4),(5,NULL,NULL,14,3),(6,NULL,NULL,14,3),(7,NULL,NULL,21,0),(8,NULL,NULL,21,0),(9,NULL,NULL,21,0),(10,16,16,6,4),(11,13,-2,6,0);
/*!40000 ALTER TABLE `evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filiere`
--

DROP TABLE IF EXISTS `filiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filiere` (
  `idfiliere` int NOT NULL AUTO_INCREMENT,
  `Nomfiliere` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idfiliere`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filiere`
--

LOCK TABLES `filiere` WRITE;
/*!40000 ALTER TABLE `filiere` DISABLE KEYS */;
INSERT INTO `filiere` VALUES (1,'SIC'),(2,'GME'),(3,'GE');
/*!40000 ALTER TABLE `filiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filiere_has_semestre`
--

DROP TABLE IF EXISTS `filiere_has_semestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filiere_has_semestre` (
  `filiere_idfiliere` int NOT NULL,
  `semestre_idsemestre` int NOT NULL,
  PRIMARY KEY (`filiere_idfiliere`,`semestre_idsemestre`),
  KEY `fk_filiere_has_semestre_semestre1_idx` (`semestre_idsemestre`),
  KEY `fk_filiere_has_semestre_filiere1_idx` (`filiere_idfiliere`),
  CONSTRAINT `fk_filiere_has_semestre_filiere1` FOREIGN KEY (`filiere_idfiliere`) REFERENCES `filiere` (`idfiliere`),
  CONSTRAINT `fk_filiere_has_semestre_semestre1` FOREIGN KEY (`semestre_idsemestre`) REFERENCES `semestre` (`idsemestre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filiere_has_semestre`
--

LOCK TABLES `filiere_has_semestre` WRITE;
/*!40000 ALTER TABLE `filiere_has_semestre` DISABLE KEYS */;
/*!40000 ALTER TABLE `filiere_has_semestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matiere` (
  `IDmatiere` int NOT NULL AUTO_INCREMENT,
  `Nommatiiere` varchar(45) NOT NULL,
  `coeftp` int DEFAULT NULL,
  `coefecrit` int DEFAULT NULL,
  `matierecol` varchar(45) DEFAULT NULL,
  `module_IDmodule` int NOT NULL,
  `nbr_tp` int DEFAULT '0',
  PRIMARY KEY (`IDmatiere`,`Nommatiiere`),
  KEY `fk_matiere_module1_idx` (`module_IDmodule`),
  CONSTRAINT `fk_matiere_module1` FOREIGN KEY (`module_IDmodule`) REFERENCES `module` (`IDmodule`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matiere`
--

LOCK TABLES `matiere` WRITE;
/*!40000 ALTER TABLE `matiere` DISABLE KEYS */;
INSERT INTO `matiere` VALUES (1,'Algorithme',NULL,NULL,NULL,1,0),(2,'Operating_System',NULL,NULL,NULL,1,0),(3,'Electronique_Numerique',NULL,NULL,NULL,2,0),(4,'Capteur',NULL,NULL,NULL,2,0),(5,'Modelisation',NULL,NULL,NULL,3,0),(6,'Projet_POO',2,3,NULL,3,6),(7,'Automatique',NULL,NULL,NULL,4,0),(8,'Python',NULL,NULL,NULL,4,0),(9,'Construction_mecanique',NULL,NULL,NULL,5,0),(10,'Mecanique_de_solide3',NULL,NULL,NULL,5,0),(11,'Mecanique_de_Fluide',NULL,NULL,NULL,6,0),(12,'Mecanique_des_vibrations',NULL,NULL,NULL,6,0),(13,'Procedes_de_fabrication',NULL,NULL,NULL,7,0),(14,'Résistances_des_matériaux',2,3,NULL,7,4),(15,'Mecanique_des_solides_4',NULL,NULL,NULL,8,0),(16,'Projet_d\'application',NULL,NULL,NULL,8,0),(17,'Electronique_Analogique',NULL,NULL,NULL,9,0),(18,'Electronique_Numérique',NULL,NULL,NULL,9,0),(19,'LanguageC',NULL,NULL,NULL,10,0),(20,'Operating_System',NULL,NULL,NULL,10,0),(21,'Electronique_Analogique2',NULL,NULL,NULL,11,0),(22,'Architectures_des_ordinateurs',NULL,NULL,NULL,11,0),(23,'Systemes_Embarquees',NULL,NULL,NULL,12,0),(24,'Les_signaux',NULL,NULL,NULL,12,0);
/*!40000 ALTER TABLE `matiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module` (
  `IDmodule` int NOT NULL AUTO_INCREMENT,
  `Nommodule` varchar(45) NOT NULL,
  `semestre_idsemestre` int DEFAULT NULL,
  `filiereid` int DEFAULT NULL,
  PRIMARY KEY (`IDmodule`),
  KEY `fk_module_semestre1_idx` (`semestre_idsemestre`),
  KEY `filiereid_idx` (`filiereid`),
  CONSTRAINT `filiereid` FOREIGN KEY (`filiereid`) REFERENCES `filiere` (`idfiliere`),
  CONSTRAINT `fk_semestre` FOREIGN KEY (`semestre_idsemestre`) REFERENCES `semestre` (`idsemestre`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module`
--

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
INSERT INTO `module` VALUES (1,'Algo_OS',1,1),(2,'Electro_Capteur',1,1),(3,'Modelisation_Poo',2,1),(4,'Automatique_Python',2,1),(5,'Construction_Meca',1,2),(6,'Fluides_Vibrations',1,2),(7,'Procedes_RDM',2,2),(8,'Meca4_Projet_d\'application',2,2),(9,'Analogique_Electronique',1,3),(10,'LanguageC_OS',1,3),(11,'Analogique2_archi',2,3),(12,'Systemes_signaux',2,3);
/*!40000 ALTER TABLE `module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semestre`
--

DROP TABLE IF EXISTS `semestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semestre` (
  `idsemestre` int NOT NULL AUTO_INCREMENT,
  `Nomsemestre` varchar(45) NOT NULL,
  PRIMARY KEY (`idsemestre`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semestre`
--

LOCK TABLES `semestre` WRITE;
/*!40000 ALTER TABLE `semestre` DISABLE KEYS */;
INSERT INTO `semestre` VALUES (1,'S3'),(2,'S4');
/*!40000 ALTER TABLE `semestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `IDuser` int NOT NULL AUTO_INCREMENT,
  `Nomuser` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Role` varchar(45) NOT NULL,
  PRIMARY KEY (`IDuser`)
) ENGINE=InnoDB AUTO_INCREMENT=1786 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1234,'Nouhaila','123456','cordinateur'),(1785,'Fatiha','12345','prof');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_filiere`
--

DROP TABLE IF EXISTS `user_has_filiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_has_filiere` (
  `user_IDuser` int NOT NULL,
  `filiere_idfiliere` int NOT NULL,
  PRIMARY KEY (`user_IDuser`,`filiere_idfiliere`),
  KEY `fk_user_has_filiere_filiere1_idx` (`filiere_idfiliere`),
  KEY `fk_user_has_filiere_user1_idx` (`user_IDuser`),
  CONSTRAINT `fk_user_has_filiere_filiere1` FOREIGN KEY (`filiere_idfiliere`) REFERENCES `filiere` (`idfiliere`),
  CONSTRAINT `fk_user_has_filiere_user1` FOREIGN KEY (`user_IDuser`) REFERENCES `user` (`IDuser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_filiere`
--

LOCK TABLES `user_has_filiere` WRITE;
/*!40000 ALTER TABLE `user_has_filiere` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_has_filiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'student1'
--

--
-- Dumping routines for database 'student1'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-20 22:33:11
