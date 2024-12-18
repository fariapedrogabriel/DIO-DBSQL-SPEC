CREATE DATABASE  IF NOT EXISTS `ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecommerce`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idcliente` int NOT NULL AUTO_INCREMENT,
  `endereco` varchar(70) NOT NULL,
  `tipo_cliente` enum('PF','PJ') NOT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Rua Silva de Prata, 29, Carangola - Cidade das Flores','PF'),(2,'Rua Alemeda, 289, Centro - Cidade das Flores','PF'),(3,'Av Alemeda Vinha, 1009, Centro - Cidade das Flores','PF'),(4,'Rua Laranjeiras, 861, Centro - Cidade das Flores','PF'),(5,'Av Koller, 19, Centro - Cidade das Flores','PF'),(6,'Rua Alemeda das Flores, 28, Centro - Cidade das Flores','PF'),(7,'Rua das Rosas, 558, Centro - Cidade das Flores','PJ'),(8,'Av Koller, 500, Centro - Cidade das Flores','PJ');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_cliente` BEFORE UPDATE ON `cliente` FOR EACH ROW BEGIN
    -- Ação simples de atualização
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_delete_cliente` BEFORE DELETE ON `cliente` FOR EACH ROW BEGIN
    -- Ação simples de remoção
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cliente_pf`
--

DROP TABLE IF EXISTS `cliente_pf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_pf` (
  `idcliente` int NOT NULL,
  `primeiro_nome` varchar(15) NOT NULL,
  `sobrenome` varchar(15) DEFAULT NULL,
  `cpf` varchar(11) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  PRIMARY KEY (`idcliente`),
  UNIQUE KEY `cpf` (`cpf`),
  CONSTRAINT `cliente_pf_fk` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_pf`
--

LOCK TABLES `cliente_pf` WRITE;
/*!40000 ALTER TABLE `cliente_pf` DISABLE KEYS */;
INSERT INTO `cliente_pf` VALUES (1,'Maria','Silva','123456789','1990-06-10'),(2,'Matheus','Pimentel','987654321','1993-05-23'),(3,'Ricardo','Silva','456789123','1985-07-14'),(4,'Julia','França','789123456','1999-03-07'),(5,'Roberta','Assis','987612345','1985-10-22'),(6,'Isabela','Cruz','123459876','1993-05-23');
/*!40000 ALTER TABLE `cliente_pf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_pj`
--

DROP TABLE IF EXISTS `cliente_pj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_pj` (
  `idcliente` int NOT NULL,
  `razao_social` varchar(15) NOT NULL,
  `nome_fantasia` varchar(15) DEFAULT NULL,
  `cnpj` varchar(14) NOT NULL,
  `data_abertura` date DEFAULT NULL,
  PRIMARY KEY (`idcliente`),
  UNIQUE KEY `cnpj` (`cnpj`),
  CONSTRAINT `cliente_pj_fk` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_pj`
--

LOCK TABLES `cliente_pj` WRITE;
/*!40000 ALTER TABLE `cliente_pj` DISABLE KEYS */;
INSERT INTO `cliente_pj` VALUES (7,'JJ ELETRONICOS','Rosas Tech','12345678000134','2010-10-23'),(8,'BRINQ ROBERTA','Koller Toys','00100200300012','2020-01-01');
/*!40000 ALTER TABLE `cliente_pj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `iddepartamento` int NOT NULL AUTO_INCREMENT COMMENT 'Identificação única do departamento',
  `nome_departamento` varchar(50) NOT NULL,
  `localidade` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`iddepartamento`),
  KEY `idx_departamento_localidade` (`localidade`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'TI','São Paulo'),(2,'Recursos Humanos','Rio de Janeiro'),(3,'Marketing','Curitiba');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependente`
--

DROP TABLE IF EXISTS `dependente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependente` (
  `iddependente` int NOT NULL AUTO_INCREMENT,
  `nome_dependente` varchar(50) NOT NULL,
  `relacao` varchar(50) DEFAULT NULL,
  `empregado_idempregado` int DEFAULT NULL,
  PRIMARY KEY (`iddependente`),
  KEY `fk_dependente_empregado` (`empregado_idempregado`),
  CONSTRAINT `fk_dependente_empregado` FOREIGN KEY (`empregado_idempregado`) REFERENCES `empregado` (`idempregado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependente`
--

LOCK TABLES `dependente` WRITE;
/*!40000 ALTER TABLE `dependente` DISABLE KEYS */;
INSERT INTO `dependente` VALUES (1,'Maria Silva','Filha',1),(2,'Pedro Santos','Filho',2);
/*!40000 ALTER TABLE `dependente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empregado`
--

DROP TABLE IF EXISTS `empregado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empregado` (
  `idempregado` int NOT NULL AUTO_INCREMENT COMMENT 'Identificação única do funcionário',
  `nome_empregado` varchar(50) NOT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `salario` float DEFAULT NULL,
  `departamento_iddepartamento` int DEFAULT NULL,
  `gerente_idempregado` int DEFAULT NULL,
  PRIMARY KEY (`idempregado`),
  KEY `fk_gerente` (`gerente_idempregado`),
  KEY `idx_empregado_departamento_id` (`departamento_iddepartamento`),
  KEY `idx_empregado_nome` (`nome_empregado`),
  CONSTRAINT `fk_departamento` FOREIGN KEY (`departamento_iddepartamento`) REFERENCES `departamento` (`iddepartamento`),
  CONSTRAINT `fk_gerente` FOREIGN KEY (`gerente_idempregado`) REFERENCES `empregado` (`idempregado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empregado`
--

LOCK TABLES `empregado` WRITE;
/*!40000 ALTER TABLE `empregado` DISABLE KEYS */;
INSERT INTO `empregado` VALUES (1,'João Silva','Desenvolvedor',4500,1,NULL),(2,'Ana Santos','Analista',3800,1,NULL),(3,'Carlos Souza','Gerente RH',7000,2,NULL);
/*!40000 ALTER TABLE `empregado` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_empregado` BEFORE INSERT ON `empregado` FOR EACH ROW BEGIN
    -- Ação simples de inserção
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_salario_empregado` BEFORE UPDATE ON `empregado` FOR EACH ROW BEGIN
    -- Ação simples de atualização de salário
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `empregado_projeto`
--

DROP TABLE IF EXISTS `empregado_projeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empregado_projeto` (
  `idempregado` int NOT NULL COMMENT 'Identificação única do projeto, composta por idempregado e idprojeto',
  `idprojeto` int NOT NULL COMMENT 'Identificação única do projeto, composta por idempregado e idprojeto',
  `horas_trabalhadas` int DEFAULT NULL,
  PRIMARY KEY (`idempregado`,`idprojeto`),
  KEY `fk_projeto` (`idprojeto`),
  CONSTRAINT `fk_empregado` FOREIGN KEY (`idempregado`) REFERENCES `empregado` (`idempregado`),
  CONSTRAINT `fk_projeto` FOREIGN KEY (`idprojeto`) REFERENCES `projeto` (`idprojeto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empregado_projeto`
--

LOCK TABLES `empregado_projeto` WRITE;
/*!40000 ALTER TABLE `empregado_projeto` DISABLE KEYS */;
INSERT INTO `empregado_projeto` VALUES (1,1,20),(2,1,15),(3,2,10);
/*!40000 ALTER TABLE `empregado_projeto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `empregados_com_dependentes_e_gerentes`
--

DROP TABLE IF EXISTS `empregados_com_dependentes_e_gerentes`;
/*!50001 DROP VIEW IF EXISTS `empregados_com_dependentes_e_gerentes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `empregados_com_dependentes_e_gerentes` AS SELECT 
 1 AS `nome_empregado`,
 1 AS `cargo`,
 1 AS `e_gerente`,
 1 AS `nome_dependente`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `idestoque` int NOT NULL AUTO_INCREMENT,
  `local_estoque` varchar(45) NOT NULL,
  PRIMARY KEY (`idestoque`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,'Av Koller, 351, Centro - Cidade das Flores');
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `idfornecedor` int NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(45) NOT NULL,
  `cnpj` varchar(14) NOT NULL,
  PRIMARY KEY (`idfornecedor`),
  UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'ABC FORNEC','00100300400015');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `lista_departamentos_e_gerentes`
--

DROP TABLE IF EXISTS `lista_departamentos_e_gerentes`;
/*!50001 DROP VIEW IF EXISTS `lista_departamentos_e_gerentes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `lista_departamentos_e_gerentes` AS SELECT 
 1 AS `nome_departamento`,
 1 AS `gerente_nome`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `lista_projetos_departamentos_e_gerentes`
--

DROP TABLE IF EXISTS `lista_projetos_departamentos_e_gerentes`;
/*!50001 DROP VIEW IF EXISTS `lista_projetos_departamentos_e_gerentes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `lista_projetos_departamentos_e_gerentes` AS SELECT 
 1 AS `nome_projeto`,
 1 AS `nome_departamento`,
 1 AS `gerente_nome`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `numero_empregados_por_departamento`
--

DROP TABLE IF EXISTS `numero_empregados_por_departamento`;
/*!50001 DROP VIEW IF EXISTS `numero_empregados_por_departamento`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `numero_empregados_por_departamento` AS SELECT 
 1 AS `nome_departamento`,
 1 AS `localidade`,
 1 AS `numero_empregados`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idpedido` int NOT NULL AUTO_INCREMENT,
  `cliente_idcliente` int DEFAULT NULL,
  `status` enum('Em andamento','Processando','Enviado','Entregue') DEFAULT 'Em andamento',
  `descricao_pedido` varchar(45) DEFAULT NULL,
  `frete` float DEFAULT NULL,
  `pagamento` enum('Crédito','Boleto','Pix') NOT NULL,
  `codigo_rastreio` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idpedido`),
  KEY `pedido_fk` (`cliente_idcliente`),
  CONSTRAINT `pedido_fk` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1,'Entregue','compra via app',NULL,'Crédito','BR0010202'),(2,2,'Enviado','compra via site',14.5,'Pix',NULL),(3,3,'Processando',NULL,NULL,'Boleto',NULL),(4,4,NULL,NULL,NULL,'Crédito',NULL);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `idproduto` int NOT NULL AUTO_INCREMENT,
  `nome_produto` varchar(15) NOT NULL,
  `modelo` varchar(10) DEFAULT NULL,
  `infantil` tinyint(1) DEFAULT '0',
  `categoria` enum('Eletronico','Vestimenta','Brinquedos','Alimentos') DEFAULT NULL,
  `avaliacao` float DEFAULT NULL,
  `valor` float DEFAULT NULL,
  PRIMARY KEY (`idproduto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Fone de ouvido','Sony 01',0,'Eletronico',4,150),(2,'Barbie','Elsa',1,'Brinquedos',3,200),(3,'Body carters','azul',1,'Vestimenta',5,250),(4,'Microfone Vedo','Youtuber',0,'Eletronico',4,300);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_estoque`
--

DROP TABLE IF EXISTS `produto_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_estoque` (
  `estoque_idestoque` int NOT NULL,
  `produto_idproduto` int NOT NULL,
  PRIMARY KEY (`estoque_idestoque`,`produto_idproduto`),
  KEY `produto_estoque_fk2` (`produto_idproduto`),
  CONSTRAINT `produto_estoque_fk1` FOREIGN KEY (`estoque_idestoque`) REFERENCES `estoque` (`idestoque`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `produto_estoque_fk2` FOREIGN KEY (`produto_idproduto`) REFERENCES `produto` (`idproduto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_estoque`
--

LOCK TABLES `produto_estoque` WRITE;
/*!40000 ALTER TABLE `produto_estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_fornecedor`
--

DROP TABLE IF EXISTS `produto_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_fornecedor` (
  `fornecedor_idfornecedor` int NOT NULL,
  `produto_idproduto` int NOT NULL,
  PRIMARY KEY (`fornecedor_idfornecedor`,`produto_idproduto`),
  KEY `produto_fornecedor_fk2` (`produto_idproduto`),
  CONSTRAINT `produto_fornecedor_fk1` FOREIGN KEY (`fornecedor_idfornecedor`) REFERENCES `fornecedor` (`idfornecedor`),
  CONSTRAINT `produto_fornecedor_fk2` FOREIGN KEY (`produto_idproduto`) REFERENCES `produto` (`idproduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_fornecedor`
--

LOCK TABLES `produto_fornecedor` WRITE;
/*!40000 ALTER TABLE `produto_fornecedor` DISABLE KEYS */;
INSERT INTO `produto_fornecedor` VALUES (1,3);
/*!40000 ALTER TABLE `produto_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_pedido`
--

DROP TABLE IF EXISTS `produto_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_pedido` (
  `pedido_idpedido` int NOT NULL,
  `produto_idproduto` int NOT NULL,
  PRIMARY KEY (`pedido_idpedido`,`produto_idproduto`),
  KEY `produto_pedido_fk2` (`produto_idproduto`),
  CONSTRAINT `produto_pedido_fk1` FOREIGN KEY (`pedido_idpedido`) REFERENCES `pedido` (`idpedido`),
  CONSTRAINT `produto_pedido_fk2` FOREIGN KEY (`produto_idproduto`) REFERENCES `produto` (`idproduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_pedido`
--

LOCK TABLES `produto_pedido` WRITE;
/*!40000 ALTER TABLE `produto_pedido` DISABLE KEYS */;
INSERT INTO `produto_pedido` VALUES (1,1),(4,1),(1,2),(2,3),(3,4);
/*!40000 ALTER TABLE `produto_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_terceiro`
--

DROP TABLE IF EXISTS `produto_terceiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_terceiro` (
  `terceiro_idterceiro` int NOT NULL,
  `produto_idproduto` int NOT NULL,
  PRIMARY KEY (`terceiro_idterceiro`,`produto_idproduto`),
  KEY `produto_terceiro_fk2` (`produto_idproduto`),
  CONSTRAINT `produto_terceiro_fk1` FOREIGN KEY (`terceiro_idterceiro`) REFERENCES `vendedor_terceiro` (`idterceiro`),
  CONSTRAINT `produto_terceiro_fk2` FOREIGN KEY (`produto_idproduto`) REFERENCES `produto` (`idproduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_terceiro`
--

LOCK TABLES `produto_terceiro` WRITE;
/*!40000 ALTER TABLE `produto_terceiro` DISABLE KEYS */;
INSERT INTO `produto_terceiro` VALUES (1,2);
/*!40000 ALTER TABLE `produto_terceiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projeto`
--

DROP TABLE IF EXISTS `projeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projeto` (
  `idprojeto` int NOT NULL AUTO_INCREMENT COMMENT 'Identificação única do projeto',
  `nome_projeto` varchar(50) NOT NULL,
  `departamento_iddepartamento` int DEFAULT NULL,
  PRIMARY KEY (`idprojeto`),
  KEY `fk_projeto_departamento` (`departamento_iddepartamento`),
  CONSTRAINT `fk_projeto_departamento` FOREIGN KEY (`departamento_iddepartamento`) REFERENCES `departamento` (`iddepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projeto`
--

LOCK TABLES `projeto` WRITE;
/*!40000 ALTER TABLE `projeto` DISABLE KEYS */;
INSERT INTO `projeto` VALUES (1,'Sistema de Vendas',1),(2,'Campanha de Marketing',3);
/*!40000 ALTER TABLE `projeto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `projetos_com_maior_numero_de_empregados`
--

DROP TABLE IF EXISTS `projetos_com_maior_numero_de_empregados`;
/*!50001 DROP VIEW IF EXISTS `projetos_com_maior_numero_de_empregados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `projetos_com_maior_numero_de_empregados` AS SELECT 
 1 AS `nome_projeto`,
 1 AS `numero_empregados`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `vendedor_terceiro`
--

DROP TABLE IF EXISTS `vendedor_terceiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor_terceiro` (
  `idterceiro` int NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(45) NOT NULL,
  `cnpj` varchar(14) NOT NULL,
  `local_terceiro` varchar(70) NOT NULL,
  PRIMARY KEY (`idterceiro`),
  UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor_terceiro`
--

LOCK TABLES `vendedor_terceiro` WRITE;
/*!40000 ALTER TABLE `vendedor_terceiro` DISABLE KEYS */;
INSERT INTO `vendedor_terceiro` VALUES (1,'LOJA FELIZ','00300400500016','Rua Laranjeiras, 1001, Centro - Cidade das Flores');
/*!40000 ALTER TABLE `vendedor_terceiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ecommerce'
--

--
-- Dumping routines for database 'ecommerce'
--
/*!50003 DROP PROCEDURE IF EXISTS `manipular_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manipular_cliente`(
    IN p_idcliente INT,
    IN p_tipo_cliente ENUM('PF', 'PJ'),
    IN p_endereco VARCHAR(70),
    IN p_primeiro_nome VARCHAR(15),
    IN p_sobrenome VARCHAR(15),
    IN p_cpf VARCHAR(11),
    IN p_razao_social VARCHAR(15),
    IN p_cnpj VARCHAR(14),
    IN p_acao INT -- sendo 1 para inserção, 2 para atualização e 3 para exclusão
)
BEGIN
    DECLARE v_tipo_cliente ENUM('PF', 'PJ');
    
    -- Controle de ação e inserção de um novo cliente
    IF p_acao = 1 THEN
        INSERT INTO cliente (endereco, tipo_cliente)
        VALUES (p_endereco, p_tipo_cliente);
        
        -- Determinando o tipo de cliente para inserir nas tabelas específicas
        IF p_tipo_cliente = 'PF' THEN
            INSERT INTO cliente_pf (idcliente, primeiro_nome, sobrenome, cpf)
            VALUES (LAST_INSERT_ID(), p_primeiro_nome, p_sobrenome, p_cpf);
        ELSEIF p_tipo_cliente = 'PJ' THEN
            INSERT INTO cliente_pj (idcliente, razao_social, cnpj)
            VALUES (LAST_INSERT_ID(), p_razao_social, p_cnpj);
        END IF;
    
    ELSEIF p_acao = 2 THEN
        -- Atualizando da tabela cliente e dados do cliente
        UPDATE cliente 
        SET endereco = p_endereco
        WHERE idcliente = p_idcliente;
        
        -- Atualizando dados na tabela cliente_pf ou cliente_pj
        IF p_tipo_cliente = 'PF' THEN
            UPDATE cliente_pf 
            SET primeiro_nome = p_primeiro_nome, sobrenome = p_sobrenome, cpf = p_cpf
            WHERE idcliente = p_idcliente;
        ELSEIF p_tipo_cliente = 'PJ' THEN
            UPDATE cliente_pj 
            SET razao_social = p_razao_social, cnpj = p_cnpj
            WHERE idcliente = p_idcliente;
        END IF;
        
    ELSEIF p_acao = 3 THEN
        -- Excluindo de dados do cliente em tabelas específicas
        IF p_tipo_cliente = 'PF' THEN
            DELETE FROM cliente_pf WHERE idcliente = p_idcliente;
        ELSEIF p_tipo_cliente = 'PJ' THEN
            DELETE FROM cliente_pj WHERE idcliente = p_idcliente;
        END IF;
        
        -- Excluindo dados na tabela cliente
        DELETE FROM cliente WHERE idcliente = p_idcliente;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `empregados_com_dependentes_e_gerentes`
--

/*!50001 DROP VIEW IF EXISTS `empregados_com_dependentes_e_gerentes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `empregados_com_dependentes_e_gerentes` AS select `e`.`nome_empregado` AS `nome_empregado`,`e`.`cargo` AS `cargo`,(case when (`e`.`cargo` = 'Gerente') then 'Sim' else 'Não' end) AS `e_gerente`,`d`.`nome_dependente` AS `nome_dependente` from (`empregado` `e` join `dependente` `d` on((`d`.`empregado_idempregado` = `e`.`idempregado`))) where (`d`.`empregado_idempregado` is not null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lista_departamentos_e_gerentes`
--

/*!50001 DROP VIEW IF EXISTS `lista_departamentos_e_gerentes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `lista_departamentos_e_gerentes` AS select `d`.`nome_departamento` AS `nome_departamento`,`e`.`nome_empregado` AS `gerente_nome` from (`departamento` `d` left join `empregado` `e` on((`e`.`departamento_iddepartamento` = `d`.`iddepartamento`))) where (`e`.`cargo` = 'Gerente') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lista_projetos_departamentos_e_gerentes`
--

/*!50001 DROP VIEW IF EXISTS `lista_projetos_departamentos_e_gerentes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `lista_projetos_departamentos_e_gerentes` AS select `p`.`nome_projeto` AS `nome_projeto`,`d`.`nome_departamento` AS `nome_departamento`,`e`.`nome_empregado` AS `gerente_nome` from ((`projeto` `p` join `departamento` `d` on((`d`.`iddepartamento` = `p`.`departamento_iddepartamento`))) left join `empregado` `e` on((`e`.`departamento_iddepartamento` = `d`.`iddepartamento`))) where (`e`.`cargo` = 'Gerente') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `numero_empregados_por_departamento`
--

/*!50001 DROP VIEW IF EXISTS `numero_empregados_por_departamento`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `numero_empregados_por_departamento` AS select `d`.`nome_departamento` AS `nome_departamento`,`d`.`localidade` AS `localidade`,count(`e`.`idempregado`) AS `numero_empregados` from (`departamento` `d` left join `empregado` `e` on((`e`.`departamento_iddepartamento` = `d`.`iddepartamento`))) group by `d`.`iddepartamento` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `projetos_com_maior_numero_de_empregados`
--

/*!50001 DROP VIEW IF EXISTS `projetos_com_maior_numero_de_empregados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `projetos_com_maior_numero_de_empregados` AS select `p`.`nome_projeto` AS `nome_projeto`,count(`ep`.`idempregado`) AS `numero_empregados` from (`projeto` `p` left join `empregado_projeto` `ep` on((`ep`.`idprojeto` = `p`.`idprojeto`))) group by `p`.`idprojeto` order by `numero_empregados` desc */;
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

-- Dump completed on 2024-12-18 13:30:48
