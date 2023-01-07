-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: company
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Current Database: `company`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `company` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `company`;

--
-- Table structure for table `departament`
--

DROP TABLE IF EXISTS `departament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departament` (
  `Dname` varchar(15) DEFAULT NULL,
  `Dnumber` int NOT NULL,
  `Mgr_ssn` char(9) DEFAULT NULL,
  `Mgr_start_date` date DEFAULT NULL,
  `Dept_create_date` date DEFAULT NULL,
  PRIMARY KEY (`Dnumber`),
  UNIQUE KEY `unique_name_dept` (`Dname`),
  KEY `fk_dept` (`Mgr_ssn`),
  KEY `idx_departament` (`Dnumber`),
  CONSTRAINT `fk_dept` FOREIGN KEY (`Mgr_ssn`) REFERENCES `employee` (`Ssn`),
  CONSTRAINT `chk_date_dept` CHECK ((`Dept_create_date` < `Mgr_start_date`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departament`
--

LOCK TABLES `departament` WRITE;
/*!40000 ALTER TABLE `departament` DISABLE KEYS */;
INSERT INTO `departament` VALUES ('Headquarters',1,'888665555','1981-06-19','1980-06-19'),('Administration',4,'987654321','1995-01-01','1994-01-01'),('Research',5,'333445555','1988-05-22','1986-05-22');
/*!40000 ALTER TABLE `departament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependent`
--

DROP TABLE IF EXISTS `dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependent` (
  `Essn` char(9) NOT NULL,
  `Dependent_name` varchar(15) NOT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Bdate` date DEFAULT NULL,
  `Relationship` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`Essn`,`Dependent_name`),
  CONSTRAINT `fk_dependent` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependent`
--

LOCK TABLES `dependent` WRITE;
/*!40000 ALTER TABLE `dependent` DISABLE KEYS */;
INSERT INTO `dependent` VALUES ('123456789','Alice','F','1988-12-30','Daughter'),('123456789','Elizabeth','F','1967-05-05','Spouse'),('123456789','Michael','M','1988-01-04','Son'),('333445555','Alice','F','1986-04-05','Daughter'),('333445555','Joy','F','1958-05-03','Spouse'),('333445555','Theodore','M','1983-10-25','Son'),('987654321','Abner','M','1942-02-28','Spouse');
/*!40000 ALTER TABLE `dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept_locations`
--

DROP TABLE IF EXISTS `dept_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept_locations` (
  `Dnumber` int NOT NULL,
  `Dlocation` varchar(15) NOT NULL,
  PRIMARY KEY (`Dnumber`,`Dlocation`),
  CONSTRAINT `fk_dept_loc` FOREIGN KEY (`Dnumber`) REFERENCES `departament` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_locations`
--

LOCK TABLES `dept_locations` WRITE;
/*!40000 ALTER TABLE `dept_locations` DISABLE KEYS */;
INSERT INTO `dept_locations` VALUES (1,'Houston'),(4,'Stafford'),(5,'Bellaire'),(5,'Houston'),(5,'Sugarland');
/*!40000 ALTER TABLE `dept_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `dept_manager`
--

DROP TABLE IF EXISTS `dept_manager`;
/*!50001 DROP VIEW IF EXISTS `dept_manager`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dept_manager` AS SELECT 
 1 AS `Departamentos`,
 1 AS `Gerente`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Fname` varchar(15) NOT NULL,
  `Minit` char(1) DEFAULT NULL,
  `Lname` varchar(15) NOT NULL,
  `Ssn` char(9) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Super_ssn` char(9) DEFAULT NULL,
  `Dno` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`Ssn`),
  KEY `fk_employee` (`Super_ssn`),
  KEY `idx_employee` (`Dno`),
  KEY `idx_employee_Fname` (`Fname`),
  KEY `idx_employee_FullName` ((concat(`Fname`,_utf8mb4' ',`Minit`,_utf8mb4' ',`Lname`))),
  CONSTRAINT `fk_employee` FOREIGN KEY (`Super_ssn`) REFERENCES `employee` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('John','B','Smith','123456789','1965-01-09','731-Fondren-Houston-TX','M',30000.00,'333445555',5),('Franklin','T','Wong','333445555','1955-12-08','638-Voss-Houston-TX','M',40000.00,'888665555',5),('Joyce','A','English','453453453','1972-07-31','5631-Rice-Houston-TX','F',25000.00,'333445555',5),('Ramesh','K','Narayan','666884444','1962-09-15','975-Fire-Oak-Humble-TX','M',38000.00,'333445555',5),('James','E','Borg','888665555','1937-11-10','450-Stone-Houston-TX','M',55000.00,NULL,1),('Jennifer','S','Wallace','987654321','1941-06-20','291-Berry-Bellaire-TX','F',43000.00,'888665555',4),('Ahmad','V','Jabbar','987987987','1969-03-29','980-Dallas-Houston-TX','M',25000.00,'987654321',4),('Alicia','J','Zelaya','999887777','1968-01-19','3321-Castle-Spring-TX','F',25000.00,'987654321',4);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `null_value_check` AFTER INSERT ON `employee` FOR EACH ROW if (new.Address is null) then
		insert into user_messages (message, ssn) value (concat('Por favor, atualize seu endereço', new.Fname),new.Ssn);
	else 
		insert into user_messages (message, ssn) value (concat('Error',new.Fname),new.Ssn);
	end if */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `aumentar_salario` AFTER INSERT ON `employee` FOR EACH ROW BEGIN
  UPDATE employee SET Salary = 1.2 * Salary WHERE Dno = 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `employee_dep_manag`
--

DROP TABLE IF EXISTS `employee_dep_manag`;
/*!50001 DROP VIEW IF EXISTS `employee_dep_manag`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employee_dep_manag` AS SELECT 
 1 AS `Empregados`,
 1 AS `Situação de dependência`,
 1 AS `Situação de gerencia`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employee_dept_local`
--

DROP TABLE IF EXISTS `employee_dept_local`;
/*!50001 DROP VIEW IF EXISTS `employee_dept_local`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employee_dept_local` AS SELECT 
 1 AS `Localidade`,
 1 AS `Departamento`,
 1 AS `Quantidade`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `proj_dept_manager`
--

DROP TABLE IF EXISTS `proj_dept_manager`;
/*!50001 DROP VIEW IF EXISTS `proj_dept_manager`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `proj_dept_manager` AS SELECT 
 1 AS `Projetos`,
 1 AS `Departamentos`,
 1 AS `Gerente`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `proj_group_employee`
--

DROP TABLE IF EXISTS `proj_group_employee`;
/*!50001 DROP VIEW IF EXISTS `proj_group_employee`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `proj_group_employee` AS SELECT 
 1 AS `Projetos`,
 1 AS `Empregados`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `Pname` varchar(15) NOT NULL,
  `Pnumber` int NOT NULL,
  `Plocation` varchar(15) DEFAULT NULL,
  `Dnum` int NOT NULL,
  PRIMARY KEY (`Pnumber`),
  UNIQUE KEY `unique_project` (`Pname`),
  KEY `fk_project` (`Dnum`),
  CONSTRAINT `fk_project` FOREIGN KEY (`Dnum`) REFERENCES `departament` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('ProductX',1,'Bellaire',5),('ProductY',2,'Sugarland',5),('ProductZ',3,'Houston',5),('Computerization',10,'Stafford',4),('Reorganization',20,'Houston',1),('Newbenefits',30,'Stafford',4);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works_on`
--

DROP TABLE IF EXISTS `works_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works_on` (
  `Essn` char(9) NOT NULL,
  `Pno` int NOT NULL,
  `Hours` decimal(3,1) NOT NULL,
  PRIMARY KEY (`Essn`,`Pno`),
  KEY `fk_won_pno` (`Pno`),
  CONSTRAINT `fk_won_essn` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`),
  CONSTRAINT `fk_won_pno` FOREIGN KEY (`Pno`) REFERENCES `project` (`Pnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_on`
--

LOCK TABLES `works_on` WRITE;
/*!40000 ALTER TABLE `works_on` DISABLE KEYS */;
INSERT INTO `works_on` VALUES ('123456789',1,32.5),('123456789',2,7.5),('333445555',2,10.0),('333445555',3,10.0),('333445555',10,10.0),('333445555',20,10.0),('453453453',1,20.0),('453453453',2,20.0),('666884444',3,40.0),('888665555',20,0.0),('987654321',20,15.0),('987654321',30,20.0),('987987987',10,35.0),('987987987',30,5.0),('999887777',10,10.0),('999887777',30,30.0);
/*!40000 ALTER TABLE `works_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `ecommerce`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ecommerce`;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idcliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) DEFAULT NULL,
  `CNPJ_CPF` char(11) NOT NULL,
  `endereço` varchar(45) DEFAULT NULL,
  `Dnascimento` date DEFAULT NULL,
  `e_mail` varchar(30) DEFAULT NULL,
  `telefone` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idcliente`),
  UNIQUE KEY `unique_CNPJ_CPF` (`CNPJ_CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Israel Evangelista','00744532101','Rua F','1986-03-15','i_ev@mail.com','(55)9998-9999'),(2,'Leidiane Evangelista','00847833105','Rua F','1986-03-08','l_ev@mail.com','(55)9999-9999'),(3,'Jefferson Santana','10449834707','Rua M','1987-11-03','j_ev@mail.com','(55)9997-9999'),(4,'Raquel Pinheiro','11774564120','Rua K','1986-03-15','r_ev@mail.com','(55)9996-9999'),(5,'Krishna Martins','55744602970','Rua Z','1971-03-11','m_ev@mail.com','(55)9995-9999'),(6,'Leide Alves','64781603371','Rua A','1952-02-24','ld_ev@mail.com','(55)9985-9999');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cliente_mais_200`
--

DROP TABLE IF EXISTS `cliente_mais_200`;
/*!50001 DROP VIEW IF EXISTS `cliente_mais_200`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cliente_mais_200` AS SELECT 
 1 AS `Cliente`,
 1 AS `Categoria`,
 1 AS `Quantidade`,
 1 AS `Valor`,
 1 AS `Frete`,
 1 AS `Total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `count_prod_tercvendors`
--

DROP TABLE IF EXISTS `count_prod_tercvendors`;
/*!50001 DROP VIEW IF EXISTS `count_prod_tercvendors`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `count_prod_tercvendors` AS SELECT 
 1 AS `Mercadoria dos Terceiros`,
 1 AS `Quantidade`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `count_prod_vendors`
--

DROP TABLE IF EXISTS `count_prod_vendors`;
/*!50001 DROP VIEW IF EXISTS `count_prod_vendors`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `count_prod_vendors` AS SELECT 
 1 AS `Mercadoria dos Fornecedores`,
 1 AS `Quantidade`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `disponibilizando`
--

DROP TABLE IF EXISTS `disponibilizando`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disponibilizando` (
  `F_idfornecedor` int DEFAULT NULL,
  `PD_idproduto` int DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  KEY `PD_idproduto` (`PD_idproduto`),
  KEY `F_idfornecedor` (`F_idfornecedor`),
  CONSTRAINT `disponibilizando_ibfk_1` FOREIGN KEY (`PD_idproduto`) REFERENCES `produto` (`idproduto`),
  CONSTRAINT `disponibilizando_ibfk_2` FOREIGN KEY (`F_idfornecedor`) REFERENCES `fornecedor` (`idfornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disponibilizando`
--

LOCK TABLES `disponibilizando` WRITE;
/*!40000 ALTER TABLE `disponibilizando` DISABLE KEYS */;
INSERT INTO `disponibilizando` VALUES (2,1,20),(2,2,10),(2,3,25),(3,5,150),(1,6,5),(1,7,25),(3,8,80),(2,9,20),(2,10,20);
/*!40000 ALTER TABLE `disponibilizando` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disponibilizando_terc`
--

DROP TABLE IF EXISTS `disponibilizando_terc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disponibilizando_terc` (
  `PD_idproduto` int DEFAULT NULL,
  `T_idterceiro` int DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  KEY `PD_idproduto` (`PD_idproduto`),
  KEY `T_idterceiro` (`T_idterceiro`),
  CONSTRAINT `disponibilizando_terc_ibfk_1` FOREIGN KEY (`PD_idproduto`) REFERENCES `produto` (`idproduto`),
  CONSTRAINT `disponibilizando_terc_ibfk_2` FOREIGN KEY (`T_idterceiro`) REFERENCES `terceiro` (`idterceiro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disponibilizando_terc`
--

LOCK TABLES `disponibilizando_terc` WRITE;
/*!40000 ALTER TABLE `disponibilizando_terc` DISABLE KEYS */;
INSERT INTO `disponibilizando_terc` VALUES (3,7,5),(4,9,20),(5,8,3),(5,7,42),(8,7,30),(8,8,12),(9,7,5),(10,7,5);
/*!40000 ALTER TABLE `disponibilizando_terc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `esp_cliente_pedido`
--

DROP TABLE IF EXISTS `esp_cliente_pedido`;
/*!50001 DROP VIEW IF EXISTS `esp_cliente_pedido`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `esp_cliente_pedido` AS SELECT 
 1 AS `Cliente`,
 1 AS `Produto`,
 1 AS `Forma de Pagamento`,
 1 AS `Status do Pedido`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `idestoque` int NOT NULL AUTO_INCREMENT,
  `endereço` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idestoque`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,'Rua AAA, n. 100. Bairro ABC'),(2,'Rua BBB, n. 110. Bairro CBA');
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pagamento`
--

DROP TABLE IF EXISTS `forma_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_pagamento` (
  `idforma_pgt` int NOT NULL AUTO_INCREMENT,
  `tipo_pagamento` enum('Boleto','Cartão','PIX') DEFAULT NULL,
  `P_idpedido` int DEFAULT NULL,
  `P_Cidcliente` int DEFAULT NULL,
  PRIMARY KEY (`idforma_pgt`),
  KEY `P_idpedido` (`P_idpedido`),
  KEY `P_Cidcliente` (`P_Cidcliente`),
  CONSTRAINT `forma_pagamento_ibfk_1` FOREIGN KEY (`P_idpedido`) REFERENCES `pedido` (`idpedido`),
  CONSTRAINT `forma_pagamento_ibfk_2` FOREIGN KEY (`P_Cidcliente`) REFERENCES `pedido` (`C_idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pagamento`
--

LOCK TABLES `forma_pagamento` WRITE;
/*!40000 ALTER TABLE `forma_pagamento` DISABLE KEYS */;
INSERT INTO `forma_pagamento` VALUES (1,'Cartão',1,1),(2,'Cartão',2,1),(3,'Boleto',3,2),(4,'PIX',4,5),(5,'PIX',5,3),(6,'Cartão',6,2),(7,'Cartão',7,4),(8,'PIX',8,1),(9,'Boleto',9,3),(10,'Boleto',10,6);
/*!40000 ALTER TABLE `forma_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `idfornecedor` int NOT NULL AUTO_INCREMENT,
  `CNPJ_CPF` char(11) NOT NULL,
  `razao_social` varchar(30) DEFAULT NULL,
  `endereço` varchar(45) DEFAULT NULL,
  `telefone` varchar(30) DEFAULT NULL,
  `e_mail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idfornecedor`),
  UNIQUE KEY `unique_forn_CNPJ_CPF` (`CNPJ_CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'05004000005','Star Sports','Rua das Estrelas','(21)99513719','starsport@mail.com'),(2,'08004000202','Holandesas ME','Rua da Holanda','(21)99522173','avoado@mail.com'),(3,'09005500105','Rede Cupuaçu Ltda','Rua do Cupuaçu','(21)99555022','cupuacu@mail.com');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idpedido` int NOT NULL AUTO_INCREMENT,
  `status_pedido` enum('Pendente','Processando','Enviado','Entregue') DEFAULT 'Pendente',
  `descrição` varchar(45) DEFAULT NULL,
  `frete` float DEFAULT NULL,
  `C_idcliente` int DEFAULT NULL,
  PRIMARY KEY (`idpedido`),
  KEY `C_idcliente` (`C_idcliente`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`C_idcliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'Pendente','Mouse Gamer Pro',5,1),(2,'Enviado','Teclado',5,1),(3,'Processando','Mouse Pad',0,2),(4,'Entregue','Boneco Comandos em Ação',10,5),(5,'Enviado','Arroz Oriental Japa',30,3),(6,'Enviado','Sapatos de Corrida Sprint',25,2),(7,'Pendente','T-shirt - Sprint',7,4),(8,'Entregue','Bolachas Maria Refinada',0,1),(9,'Pendente','Calça Jeans - Legs',7,3),(10,'Pendente','Liquidificador - Spin Air',10,6);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pedido_total`
--

DROP TABLE IF EXISTS `pedido_total`;
/*!50001 DROP VIEW IF EXISTS `pedido_total`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pedido_total` AS SELECT 
 1 AS `Pedido`,
 1 AS `Descrição`,
 1 AS `Comprador`,
 1 AS `categoria`,
 1 AS `quantidade`,
 1 AS `valor`,
 1 AS `frete`,
 1 AS `Valor Total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `pedidos_status_forma`
--

DROP TABLE IF EXISTS `pedidos_status_forma`;
/*!50001 DROP VIEW IF EXISTS `pedidos_status_forma`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pedidos_status_forma` AS SELECT 
 1 AS `Pedido`,
 1 AS `Cliente`,
 1 AS `Forma de Pagamento`,
 1 AS `Status do Pedido`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `idproduto` int NOT NULL AUTO_INCREMENT,
  `categoria` enum('Eletrônico','Vestimenta','Brinquedos','Alimentos') DEFAULT NULL,
  `descrição` varchar(45) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  PRIMARY KEY (`idproduto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Eletrônico','Mouse com tempo de respota alto',125),(2,'Eletrônico','Teclado Mecânico ultra fino',350),(3,'Eletrônico','Mouse Pad sorvete rosa',10),(4,'Brinquedos','Comandos em Ação Edição II',100),(5,'Alimentos','Arroz oriental 500g',12),(6,'Vestimenta','Sapato marca Sprint, modelo Wingboots',450),(7,'Vestimenta','Camisa corrida marca Sprint pequena',75),(8,'Alimentos','Biscoito Maria - 1kg, Edição Refinada',10),(9,'Vestimenta','Calça Jeans - Modelo Long Legs Azul',50),(10,'Eletrônico','Liquidificador Modelo Spin Air Preto',110);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_estoque`
--

DROP TABLE IF EXISTS `produto_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_estoque` (
  `PD_idproduto` int DEFAULT NULL,
  `E_idestoque` int DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  KEY `PD_idproduto` (`PD_idproduto`),
  KEY `E_idestoque` (`E_idestoque`),
  CONSTRAINT `produto_estoque_ibfk_1` FOREIGN KEY (`PD_idproduto`) REFERENCES `produto` (`idproduto`),
  CONSTRAINT `produto_estoque_ibfk_2` FOREIGN KEY (`E_idestoque`) REFERENCES `estoque` (`idestoque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_estoque`
--

LOCK TABLES `produto_estoque` WRITE;
/*!40000 ALTER TABLE `produto_estoque` DISABLE KEYS */;
INSERT INTO `produto_estoque` VALUES (1,1,15),(2,2,10),(3,1,30),(4,1,2),(5,1,32),(6,2,5),(7,1,4),(8,2,86),(9,1,9),(10,1,10);
/*!40000 ALTER TABLE `produto_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_produto_pedido`
--

DROP TABLE IF EXISTS `rel_produto_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rel_produto_pedido` (
  `P_idpedido` int DEFAULT NULL,
  `PD_idproduto` int DEFAULT NULL,
  `quantidade` int DEFAULT '1',
  KEY `P_idpedido` (`P_idpedido`),
  KEY `PD_idproduto` (`PD_idproduto`),
  CONSTRAINT `rel_produto_pedido_ibfk_1` FOREIGN KEY (`P_idpedido`) REFERENCES `pedido` (`idpedido`),
  CONSTRAINT `rel_produto_pedido_ibfk_2` FOREIGN KEY (`PD_idproduto`) REFERENCES `produto` (`idproduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_produto_pedido`
--

LOCK TABLES `rel_produto_pedido` WRITE;
/*!40000 ALTER TABLE `rel_produto_pedido` DISABLE KEYS */;
INSERT INTO `rel_produto_pedido` VALUES (1,1,1),(2,2,1),(3,3,2),(4,4,1),(5,5,3),(6,6,1),(7,7,2),(8,8,5),(9,9,2),(10,10,1);
/*!40000 ALTER TABLE `rel_produto_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terceiro`
--

DROP TABLE IF EXISTS `terceiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terceiro` (
  `idterceiro` int NOT NULL AUTO_INCREMENT,
  `CNPJ_CPF` char(11) NOT NULL,
  `razao_social` varchar(30) DEFAULT NULL,
  `endereço` varchar(45) DEFAULT NULL,
  `telefone` varchar(30) DEFAULT NULL,
  `e_mail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idterceiro`),
  UNIQUE KEY `unique_terc_CNPJ_CPF` (`CNPJ_CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terceiro`
--

LOCK TABLES `terceiro` WRITE;
/*!40000 ALTER TABLE `terceiro` DISABLE KEYS */;
INSERT INTO `terceiro` VALUES (7,'01001000101','Zezé Distribuidora','Rua do zeze','(55)84576589','zeze@mail.com'),(8,'02002000201','Avoado Comércio','Rua do avoado','(55)99553254','avoado@mail.com'),(9,'01001000103','Brincalhão da Esquina ME','Rua do brincalhão','(55)96541000','brincahao@mail.com');
/*!40000 ALTER TABLE `terceiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `first_example`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `first_example` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `first_example`;

--
-- Table structure for table `favorite_food`
--

DROP TABLE IF EXISTS `favorite_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_food` (
  `person_id` smallint unsigned NOT NULL,
  `food` varchar(20) NOT NULL,
  PRIMARY KEY (`person_id`,`food`),
  CONSTRAINT `fk_favorite_food_person_id` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_food`
--

LOCK TABLES `favorite_food` WRITE;
/*!40000 ALTER TABLE `favorite_food` DISABLE KEYS */;
INSERT INTO `favorite_food` VALUES (1,'lasanha'),(2,'pizza'),(3,'camarão'),(4,'mortandela');
/*!40000 ALTER TABLE `favorite_food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `person_id` smallint unsigned NOT NULL,
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `gender` enum('M','F') DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `street` varchar(30) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Carolina','Silva','F','1979-08-21','rua tal','Cidade J','RJ','Brasil','26054-89'),(2,'Israel','Evangelista','M','1986-03-15','rua Farias Lemos','Fortaleza','CE','Brasil','60841-455'),(3,'Leidiane','Evangelista','F','1986-03-08','rua Farias Lemos','Fortaleza','CE','Brasil','60841-455'),(4,'Saulo','Monge','M','1981-06-12','rua do Morro','São Paulo','SP','Brasil','33154-001');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `oficina`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `oficina` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `oficina`;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idcliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) DEFAULT NULL,
  `cpf` varchar(15) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `telefone` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idcliente`),
  UNIQUE KEY `unique_cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Israel Evangelista','00744532101','i_ev@mail.com','(55)9998-9999'),(2,'Leidiane Evangelista','00847833105','l_ev@mail.com','(55)9999-9999'),(3,'Jefferson Santana','10449834707','j_ev@mail.com','(55)9997-9999'),(4,'Raquel Pinheiro','11774564120','r_ev@mail.com','(55)9996-9999'),(5,'Krishna Martins','55744602970','m_ev@mail.com','(55)9995-9999'),(6,'Leide Alves','64781603371','ld_ev@mail.com','(55)9985-9999');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipe`
--

DROP TABLE IF EXISTS `equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipe` (
  `idequipe` int NOT NULL AUTO_INCREMENT,
  `idmecanico1` int DEFAULT NULL,
  `idmecanico2` int NOT NULL,
  `idmecanico3` int NOT NULL,
  PRIMARY KEY (`idequipe`),
  KEY `FK_idmecanico` (`idmecanico1`),
  KEY `FK_idmecanico2` (`idmecanico2`),
  KEY `FK_idmecanico3` (`idmecanico3`),
  CONSTRAINT `FK_idmecanico` FOREIGN KEY (`idmecanico1`) REFERENCES `mecanico` (`idmecanico`),
  CONSTRAINT `FK_idmecanico2` FOREIGN KEY (`idmecanico2`) REFERENCES `mecanico` (`idmecanico`),
  CONSTRAINT `FK_idmecanico3` FOREIGN KEY (`idmecanico3`) REFERENCES `mecanico` (`idmecanico`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipe`
--

LOCK TABLES `equipe` WRITE;
/*!40000 ALTER TABLE `equipe` DISABLE KEYS */;
INSERT INTO `equipe` VALUES (1,8,9,6),(2,7,6,1),(3,2,3,4);
/*!40000 ALTER TABLE `equipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `idpecas` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  PRIMARY KEY (`idpecas`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,'Molas de Suspensão',40),(2,'Pneu Médio',20),(3,'Pneu Grande',15),(4,'Pastilhas de Freio',48),(5,'Bateria',25),(6,'Óleo Lubrificante',75),(7,'Filtro de Ar',14),(8,'Conjunto de Peças Menores para Reposição',187),(9,'Conjunto de Peças Médias para Reposição',112),(10,'Conjunto de Peças Grandes para Reposição',94);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mecanico`
--

DROP TABLE IF EXISTS `mecanico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mecanico` (
  `idmecanico` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `endereco` varchar(45) DEFAULT NULL,
  `especialidade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idmecanico`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mecanico`
--

LOCK TABLES `mecanico` WRITE;
/*!40000 ALTER TABLE `mecanico` DISABLE KEYS */;
INSERT INTO `mecanico` VALUES (1,'Chico Bento','Rua do Bento','Freios e Motor'),(2,'Junior Filho','Rua do Pai','Ar Condicionado e Direção Hidráulica'),(3,'Pé de Graxa','Rua Escorregou Morreu','Sistema Elétrico, Freios e Motor'),(4,'Zé Mão Boba','Rua Terremoto','Geral'),(5,'Vesgo do Pé','Rua do Calo','Sistema Elétrico'),(6,'Thompson Bucão','Rua TB','Geral'),(7,'Omar Zul','Rua do Nascente','Ar Condicionado e Sistema Elétrico'),(8,'Ryu da Bahia','Rua Japão','Sistema Elétrico e Motor'),(9,'Ken de Osasco','Rua EUA','Freios, Motor e Direção Hidráulica');
/*!40000 ALTER TABLE `mecanico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordem`
--

DROP TABLE IF EXISTS `ordem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordem` (
  `idordem` int NOT NULL AUTO_INCREMENT,
  `emissao` date DEFAULT NULL,
  `previsao_conclusao` date DEFAULT NULL,
  `status` enum('Em Serviço','Finalizado','Entregue') DEFAULT NULL,
  PRIMARY KEY (`idordem`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem`
--

LOCK TABLES `ordem` WRITE;
/*!40000 ALTER TABLE `ordem` DISABLE KEYS */;
INSERT INTO `ordem` VALUES (1,'2022-05-22','2022-05-30','Entregue'),(2,'2022-05-24','2022-05-26','Entregue'),(3,'2022-06-10','2022-06-14','Entregue'),(4,'2022-06-12','2022-06-20','Em Serviço'),(5,'2022-06-12','2022-06-21','Em Serviço'),(6,'2022-06-13','2022-06-25','Em Serviço'),(7,'2022-06-13','2022-06-25','Finalizado'),(8,'2022-06-14','2022-06-26','Em Serviço'),(9,'2022-06-14','2022-06-27','Finalizado'),(10,'2022-06-14','2022-06-30','Em Serviço'),(11,'2022-06-14','2022-07-02','Em Serviço'),(12,'2022-06-15','2022-07-02','Em Serviço');
/*!40000 ALTER TABLE `ordem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `idpagamento` int NOT NULL AUTO_INCREMENT,
  `metodo_pagamento` enum('Cartão','Boleto','PIX') DEFAULT NULL,
  PRIMARY KEY (`idpagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,'PIX'),(2,'Cartão'),(3,'Boleto'),(4,'PIX'),(5,'Cartão'),(6,'Cartão'),(7,'PIX'),(8,'Boleto'),(9,'Cartão'),(10,'Cartão'),(11,'PIX'),(12,'Cartão');
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pecas_servico`
--

DROP TABLE IF EXISTS `pecas_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pecas_servico` (
  `idpecas` int DEFAULT NULL,
  `idordem` int DEFAULT NULL,
  `idveiculo` int DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `valor_peca` float DEFAULT NULL,
  KEY `FK_idpecas` (`idpecas`),
  KEY `FK_idordem` (`idordem`),
  KEY `FK_idveiculo` (`idveiculo`),
  CONSTRAINT `FK_idordem` FOREIGN KEY (`idordem`) REFERENCES `ordem` (`idordem`),
  CONSTRAINT `FK_idpecas` FOREIGN KEY (`idpecas`) REFERENCES `estoque` (`idpecas`),
  CONSTRAINT `FK_idveiculo` FOREIGN KEY (`idveiculo`) REFERENCES `veiculo` (`idveiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pecas_servico`
--

LOCK TABLES `pecas_servico` WRITE;
/*!40000 ALTER TABLE `pecas_servico` DISABLE KEYS */;
INSERT INTO `pecas_servico` VALUES (4,1,1,5,57.86),(6,2,2,2,20),(8,2,2,10,5),(7,3,3,1,35),(9,3,3,4,6),(1,4,4,4,475),(6,4,4,5,20),(10,4,4,7,8),(2,5,5,4,314.91),(9,5,5,16,6),(6,6,6,5,20),(8,6,6,20,5),(7,7,7,1,35),(5,7,7,1,455.57),(2,7,7,1,314.91),(1,8,8,2,475),(10,8,8,12,8),(4,8,8,3,57.86),(6,9,9,5,20),(10,9,9,24,8),(8,9,9,10,5),(9,9,9,18,6),(4,10,10,3,57.86),(10,11,11,20,8),(6,11,11,5,20),(7,12,12,1,35),(5,12,12,1,455.57);
/*!40000 ALTER TABLE `pecas_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pgt_ordem`
--

DROP TABLE IF EXISTS `pgt_ordem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pgt_ordem` (
  `idpagamento` int DEFAULT NULL,
  `idordem` int DEFAULT NULL,
  `status` enum('Pendente','Processando','Pago') DEFAULT NULL,
  KEY `FK_idpagamento_pgt` (`idpagamento`),
  KEY `FK_idordem_pgt` (`idordem`),
  CONSTRAINT `FK_idordem_pgt` FOREIGN KEY (`idordem`) REFERENCES `ordem` (`idordem`),
  CONSTRAINT `FK_idpagamento_pgt` FOREIGN KEY (`idpagamento`) REFERENCES `pagamento` (`idpagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pgt_ordem`
--

LOCK TABLES `pgt_ordem` WRITE;
/*!40000 ALTER TABLE `pgt_ordem` DISABLE KEYS */;
INSERT INTO `pgt_ordem` VALUES (1,1,'Pago'),(2,2,'Pago'),(3,3,'Pago'),(4,4,'Processando'),(4,4,'Pago'),(5,5,'Processando'),(6,6,'Pago'),(7,7,'Pendente'),(8,8,'Pago'),(9,9,'Pendente'),(10,10,'Processando'),(11,11,'Pendente');
/*!40000 ALTER TABLE `pgt_ordem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servico` (
  `idveiculo` int DEFAULT NULL,
  `idordem` int DEFAULT NULL,
  `idequipe` int DEFAULT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  KEY `FK_idveiculo_serv` (`idveiculo`),
  KEY `FK_idordem_serv` (`idordem`),
  KEY `FK_idequipe_pgt` (`idequipe`),
  CONSTRAINT `FK_idequipe_pgt` FOREIGN KEY (`idequipe`) REFERENCES `equipe` (`idequipe`),
  CONSTRAINT `FK_idordem_serv` FOREIGN KEY (`idordem`) REFERENCES `ordem` (`idordem`),
  CONSTRAINT `FK_idveiculo_serv` FOREIGN KEY (`idveiculo`) REFERENCES `veiculo` (`idveiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico`
--

LOCK TABLES `servico` WRITE;
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
INSERT INTO `servico` VALUES (1,1,3,'Rangido no disco de freio',70),(2,2,2,'Revisão geral e troca de peças',60),(3,3,1,'Ar Condicionado não funcionando',140),(4,4,1,'Instabilidade por conta da suspensão',80),(5,5,3,'Revisão geral e troca de peças',60),(6,6,2,'Manutenção do radiador',40),(7,7,2,'Troca do ar, bateria e pneus',120),(8,8,1,'Reparo da caixa de macha',150),(9,9,3,'Reparo do motor',400),(10,10,3,'Reparo do disco de freio',40),(11,11,1,'Manutenção do motor',70),(12,12,3,'Troca de bateria e filtro de ar',70);
/*!40000 ALTER TABLE `servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculo` (
  `idveiculo` int NOT NULL AUTO_INCREMENT,
  `placa` varchar(45) NOT NULL,
  `cor` varchar(15) NOT NULL,
  `situacao` varchar(45) NOT NULL,
  `idcliente` int DEFAULT NULL,
  PRIMARY KEY (`idveiculo`),
  KEY `FK_idcliente` (`idcliente`),
  CONSTRAINT `FK_idcliente` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo`
--

LOCK TABLES `veiculo` WRITE;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
INSERT INTO `veiculo` VALUES (1,'AAA0001','Azul','Disco de Freio',1),(2,'BWS1410','Amarelo','Revisão Geral',5),(3,'PWD0807','Cinza','Ar Condicionado',4),(4,'OSU5022','Vermelho','Suspensão',2),(5,'ZSX9897','Verde Escuro','Revisão Geral',3),(6,'PWD0807','Cinza','Radiador',4),(7,'BSS0800','Branco','Ar Condicionado',6),(8,'OSU5022','Vermelho','Caixa de Macha',2),(9,'AAA0001','Azul','Motor',1),(10,'BWS1410','Amarelo','Disco de Freio',5),(11,'ZSX9897','Verde Escuro','Motor',3),(12,'BWS1410','Amarelo','Ar Condicionado',5);
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `company`
--

USE `company`;

--
-- Final view structure for view `dept_manager`
--

/*!50001 DROP VIEW IF EXISTS `dept_manager`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dept_manager` AS select `d`.`Dname` AS `Departamentos`,concat(`e`.`Fname`,' ',`e`.`Minit`,' ',`e`.`Lname`) AS `Gerente` from (`departament` `d` left join `employee` `e` on((`e`.`Ssn` = `d`.`Mgr_ssn`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_dep_manag`
--

/*!50001 DROP VIEW IF EXISTS `employee_dep_manag`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_dep_manag` AS select concat(`e`.`Fname`,' ',`e`.`Minit`,' ',`e`.`Lname`) AS `Empregados`,(case when (`dp`.`Essn` is null) then 'Não possui dependentes' else 'Possui dependente' end) AS `Situação de dependência`,(case when (`d`.`Mgr_ssn` is null) then 'Não é Gerente' else 'É Gerente' end) AS `Situação de gerencia` from ((`employee` `e` left join `departament` `d` on((`d`.`Mgr_ssn` = `e`.`Ssn`))) left join `dependent` `dp` on((`dp`.`Essn` = `e`.`Ssn`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_dept_local`
--

/*!50001 DROP VIEW IF EXISTS `employee_dept_local`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_dept_local` AS select `dl`.`Dlocation` AS `Localidade`,`d`.`Dname` AS `Departamento`,count(`e`.`Ssn`) AS `Quantidade` from ((`employee` `e` left join `departament` `d` on((`d`.`Dnumber` = `e`.`Dno`))) left join `dept_locations` `dl` on((`d`.`Dnumber` = `dl`.`Dnumber`))) group by `Localidade`,`Departamento` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `proj_dept_manager`
--

/*!50001 DROP VIEW IF EXISTS `proj_dept_manager`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `proj_dept_manager` AS select `p`.`Pname` AS `Projetos`,`d`.`Dname` AS `Departamentos`,concat(`e`.`Fname`,' ',`e`.`Minit`,' ',`e`.`Lname`) AS `Gerente` from ((`project` `p` left join `departament` `d` on((`p`.`Dnum` = `d`.`Dnumber`))) left join `employee` `e` on((`d`.`Mgr_ssn` = `e`.`Ssn`))) group by `Projetos`,`Departamentos` order by `Gerente` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `proj_group_employee`
--

/*!50001 DROP VIEW IF EXISTS `proj_group_employee`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `proj_group_employee` AS select `p`.`Pname` AS `Projetos`,count(`w`.`Essn`) AS `Empregados` from (`project` `p` left join `works_on` `w` on((`w`.`Pno` = `p`.`Pnumber`))) group by `Projetos` order by count(`w`.`Essn`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Current Database: `ecommerce`
--

USE `ecommerce`;

--
-- Final view structure for view `cliente_mais_200`
--

/*!50001 DROP VIEW IF EXISTS `cliente_mais_200`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cliente_mais_200` AS select `c`.`nome` AS `Cliente`,`pd`.`categoria` AS `Categoria`,sum(`pp`.`quantidade`) AS `Quantidade`,sum(`pd`.`valor`) AS `Valor`,sum(`p`.`frete`) AS `Frete`,sum(((`pp`.`quantidade` * `pd`.`valor`) + `p`.`frete`)) AS `Total` from (((`cliente` `c` left join `pedido` `p` on((`c`.`idcliente` = `p`.`C_idcliente`))) left join `rel_produto_pedido` `pp` on((`p`.`idpedido` = `pp`.`P_idpedido`))) left join `produto` `pd` on((`pp`.`PD_idproduto` = `pd`.`idproduto`))) group by `c`.`nome`,`pd`.`categoria` having (`Total` > 200) order by sum(((`pp`.`quantidade` * `pd`.`valor`) + `p`.`frete`)) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `count_prod_tercvendors`
--

/*!50001 DROP VIEW IF EXISTS `count_prod_tercvendors`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `count_prod_tercvendors` AS select `pd`.`descrição` AS `Mercadoria dos Terceiros`,sum(`dt`.`quantidade`) AS `Quantidade` from ((`produto` `pd` join `terceiro` `t`) join `disponibilizando_terc` `dt`) where ((`pd`.`idproduto` = `dt`.`PD_idproduto`) and (`t`.`idterceiro` = `dt`.`T_idterceiro`)) group by `pd`.`descrição` order by sum(`dt`.`quantidade`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `count_prod_vendors`
--

/*!50001 DROP VIEW IF EXISTS `count_prod_vendors`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `count_prod_vendors` AS select `pd`.`descrição` AS `Mercadoria dos Fornecedores`,sum(`d`.`quantidade`) AS `Quantidade` from ((`produto` `pd` join `fornecedor` `f`) join `disponibilizando` `d`) where ((`pd`.`idproduto` = `d`.`PD_idproduto`) and (`f`.`idfornecedor` = `d`.`F_idfornecedor`)) group by `pd`.`descrição` order by sum(`d`.`quantidade`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `esp_cliente_pedido`
--

/*!50001 DROP VIEW IF EXISTS `esp_cliente_pedido`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `esp_cliente_pedido` AS select `c`.`nome` AS `Cliente`,`p`.`descrição` AS `Produto`,`fp`.`tipo_pagamento` AS `Forma de Pagamento`,`p`.`status_pedido` AS `Status do Pedido` from ((`forma_pagamento` `fp` left join `pedido` `p` on((`p`.`idpedido` = `fp`.`idforma_pgt`))) left join `cliente` `c` on((`c`.`idcliente` = `p`.`C_idcliente`))) having (`c`.`nome` = 'Israel Evangelista') order by `p`.`status_pedido` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pedido_total`
--

/*!50001 DROP VIEW IF EXISTS `pedido_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pedido_total` AS select `p`.`descrição` AS `Pedido`,`pd`.`descrição` AS `Descrição`,`c`.`nome` AS `Comprador`,`pd`.`categoria` AS `categoria`,`pp`.`quantidade` AS `quantidade`,`pd`.`valor` AS `valor`,`p`.`frete` AS `frete`,((`pp`.`quantidade` * `pd`.`valor`) + `p`.`frete`) AS `Valor Total` from (((`cliente` `c` left join `pedido` `p` on((`c`.`idcliente` = `p`.`C_idcliente`))) left join `rel_produto_pedido` `pp` on((`p`.`idpedido` = `pp`.`P_idpedido`))) left join `produto` `pd` on((`pp`.`PD_idproduto` = `pd`.`idproduto`))) order by ((`pp`.`quantidade` * `pd`.`valor`) + `p`.`frete`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pedidos_status_forma`
--

/*!50001 DROP VIEW IF EXISTS `pedidos_status_forma`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pedidos_status_forma` AS select `p`.`descrição` AS `Pedido`,`c`.`nome` AS `Cliente`,`fp`.`tipo_pagamento` AS `Forma de Pagamento`,`p`.`status_pedido` AS `Status do Pedido` from ((`forma_pagamento` `fp` left join `pedido` `p` on((`p`.`idpedido` = `fp`.`idforma_pgt`))) left join `cliente` `c` on((`c`.`idcliente` = `p`.`C_idcliente`))) order by `c`.`nome` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Current Database: `first_example`
--

USE `first_example`;

--
-- Current Database: `oficina`
--

USE `oficina`;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-06 21:52:43
