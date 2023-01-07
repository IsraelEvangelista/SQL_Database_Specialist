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

-- Dump completed on 2023-01-06 21:39:20
