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
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Israel Evangelista','00744532101','Rua F','1986-03-15','i_ev@mail.com','(55)9998-9999'),(2,'Leidiane Evangelista','00847833105','Rua F','1986-03-08','l_ev@mail.com','(55)9999-9999'),(3,'Jefferson Santana','10449834707','Rua M','1987-11-03','j_ev@mail.com','(55)9997-9999'),(4,'Raquel Pinheiro','11774564120','Rua K','1986-03-15','r_ev@mail.com','(55)9996-9999'),(5,'Krishna Martins','55744602970','Rua Z','1971-03-11','m_ev@mail.com','(55)9995-9999'),(6,'Leide Alves','64781603371','Rua A','1952-02-24','ld_ev@mail.com','(55)9985-9999');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `disponibilizando`
--

LOCK TABLES `disponibilizando` WRITE;
/*!40000 ALTER TABLE `disponibilizando` DISABLE KEYS */;
INSERT INTO `disponibilizando` VALUES (2,1,20),(2,2,10),(2,3,25),(3,5,150),(1,6,5),(1,7,25),(3,8,80),(2,9,20),(2,10,20);
/*!40000 ALTER TABLE `disponibilizando` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `disponibilizando_terc`
--

LOCK TABLES `disponibilizando_terc` WRITE;
/*!40000 ALTER TABLE `disponibilizando_terc` DISABLE KEYS */;
INSERT INTO `disponibilizando_terc` VALUES (3,7,5),(4,9,20),(5,8,3),(5,7,42),(8,7,30),(8,8,12),(9,7,5),(10,7,5);
/*!40000 ALTER TABLE `disponibilizando_terc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,'Rua AAA, n. 100. Bairro ABC'),(2,'Rua BBB, n. 110. Bairro CBA');
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `forma_pagamento`
--

LOCK TABLES `forma_pagamento` WRITE;
/*!40000 ALTER TABLE `forma_pagamento` DISABLE KEYS */;
INSERT INTO `forma_pagamento` VALUES (1,'Cartão',1,1),(2,'Cartão',2,1),(3,'Boleto',3,2),(4,'PIX',4,5),(5,'PIX',5,3),(6,'Cartão',6,2),(7,'Cartão',7,4),(8,'PIX',8,1),(9,'Boleto',9,3),(10,'Boleto',10,6);
/*!40000 ALTER TABLE `forma_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'05004000005','Star Sports','Rua das Estrelas','(21)99513719','starsport@mail.com'),(2,'08004000202','Holandesas ME','Rua da Holanda','(21)99522173','avoado@mail.com'),(3,'09005500105','Rede Cupuaçu Ltda','Rua do Cupuaçu','(21)99555022','cupuacu@mail.com');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'Pendente','Mouse Gamer Pro',5,1),(2,'Enviado','Teclado',5,1),(3,'Processando','Mouse Pad',0,2),(4,'Entregue','Boneco Comandos em Ação',10,5),(5,'Enviado','Arroz Oriental Japa',30,3),(6,'Enviado','Sapatos de Corrida Sprint',25,2),(7,'Pendente','T-shirt - Sprint',7,4),(8,'Entregue','Bolachas Maria Refinada',0,1),(9,'Pendente','Calça Jeans - Legs',7,3),(10,'Pendente','Liquidificador - Spin Air',10,6);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Eletrônico','Mouse com tempo de respota alto',125),(2,'Eletrônico','Teclado Mecânico ultra fino',350),(3,'Eletrônico','Mouse Pad sorvete rosa',10),(4,'Brinquedos','Comandos em Ação Edição II',100),(5,'Alimentos','Arroz oriental 500g',12),(6,'Vestimenta','Sapato marca Sprint, modelo Wingboots',450),(7,'Vestimenta','Camisa corrida marca Sprint pequena',75),(8,'Alimentos','Biscoito Maria - 1kg, Edição Refinada',10),(9,'Vestimenta','Calça Jeans - Modelo Long Legs Azul',50),(10,'Eletrônico','Liquidificador Modelo Spin Air Preto',110);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `produto_estoque`
--

LOCK TABLES `produto_estoque` WRITE;
/*!40000 ALTER TABLE `produto_estoque` DISABLE KEYS */;
INSERT INTO `produto_estoque` VALUES (1,1,15),(2,2,10),(3,1,30),(4,1,2),(5,1,32),(6,2,5),(7,1,4),(8,2,86),(9,1,9),(10,1,10);
/*!40000 ALTER TABLE `produto_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rel_produto_pedido`
--

LOCK TABLES `rel_produto_pedido` WRITE;
/*!40000 ALTER TABLE `rel_produto_pedido` DISABLE KEYS */;
INSERT INTO `rel_produto_pedido` VALUES (1,1,1),(2,2,1),(3,3,2),(4,4,1),(5,5,3),(6,6,1),(7,7,2),(8,8,5),(9,9,2),(10,10,1);
/*!40000 ALTER TABLE `rel_produto_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `terceiro`
--

LOCK TABLES `terceiro` WRITE;
/*!40000 ALTER TABLE `terceiro` DISABLE KEYS */;
INSERT INTO `terceiro` VALUES (7,'01001000101','Zezé Distribuidora','Rua do zeze','(55)84576589','zeze@mail.com'),(8,'02002000201','Avoado Comércio','Rua do avoado','(55)99553254','avoado@mail.com'),(9,'01001000103','Brincalhão da Esquina ME','Rua do brincalhão','(55)96541000','brincahao@mail.com');
/*!40000 ALTER TABLE `terceiro` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-06 21:44:24
