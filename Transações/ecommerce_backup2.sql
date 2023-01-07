-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
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
-- Dumping events for database 'ecommerce'
--

--
-- Dumping routines for database 'ecommerce'
--

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-06 21:32:45
