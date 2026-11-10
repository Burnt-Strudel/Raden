-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: banking_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `account_type` enum('regular','savings') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'regular',
  `balance` decimal(15,2) NOT NULL DEFAULT '0.00',
  `currency` enum('RUB','USD','EUR') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RUB',
  `status` enum('active','frozen','closed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_number` (`account_number`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'40817810000000000001',1,'regular',0.00,'RUB','closed','2026-11-06 14:43:18','2026-11-06 14:43:18'),(2,'40817810000000000002',1,'savings',0.00,'RUB','closed','2026-11-06 14:43:18','2026-11-06 14:43:18'),(3,'40817810000000000003',2,'regular',8500.00,'RUB','active','2026-11-06 14:43:18','2026-11-06 14:43:18'),(4,'40820810000008322471',1,'savings',0.00,'RUB','closed','2026-11-06 14:43:18','2026-11-06 14:43:18'),(5,'40820810000006682001',1,'savings',0.00,'RUB','closed','2026-11-06 14:43:18','2026-11-06 14:43:18'),(8,'40820810000003690241',1,'savings',0.00,'RUB','closed','2026-11-06 14:43:18','2026-11-06 14:43:18'),(9,'40817810000006414245',5,'regular',0.00,'RUB','closed','2026-11-06 14:43:18','2026-11-06 14:43:18'),(10,'40820810000001290871',1,'savings',0.00,'RUB','frozen','2026-11-06 14:43:18','2026-11-06 14:43:18'),(14,'40817810000005103277',7,'regular',0.00,'RUB','active','2026-11-06 14:43:18','2026-11-06 14:43:18'),(15,'40820810000005604037',7,'savings',0.00,'RUB','active','2026-11-06 14:43:18','2026-11-06 14:43:18'),(16,'40820810000005746911',1,'savings',0.00,'RUB','active','2026-11-06 14:43:18','2026-11-06 14:43:18');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `description` text COLLATE utf8mb4_unicode_ci,
  `processed_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `processed_by` (`processed_by`),
  CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`processed_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,1,'account_open','approved','Открытие накопительного счета',NULL,'2026-11-06 14:43:18'),(2,2,'card_issue','pending','Выпуск дебетовой карты',NULL,'2026-11-06 14:43:18'),(3,1,'account_open','approved','Открытие накопительного счета пользователя через приложение',NULL,'2026-11-06 14:43:18'),(4,1,'account_open','approved','Открытие накопительного счета пользователя через приложение',NULL,'2026-11-06 14:43:18'),(6,1,'account_open','approved','Открытие накопительного счета пользователя через приложение',NULL,'2026-11-06 14:43:18'),(7,1,'account_open','approved','Открытие накопительного счета пользователя через приложение',NULL,'2026-11-06 14:43:18'),(10,7,'account_open','approved','Открытие накопительного счета пользователя через приложение',NULL,'2026-11-06 14:43:18'),(11,1,'account_open','approved','Открытие накопительного счета пользователя через приложение',NULL,'2026-11-06 14:43:18');
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `passport_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `date_of_birth` date DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `passport_number` (`passport_number`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,1,'1234567890','Москва, ул. Ленина 10','1995-03-15','2026-11-06 14:43:18'),(2,2,'0987654321','Санкт-Петербург, Невский 25','1998-07-22','2026-11-06 14:43:18'),(3,3,'5432107896','Уфа, ул. Кирова 65\\2','2000-01-01','2026-11-06 14:43:18');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposits`
--

DROP TABLE IF EXISTS `deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deposits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `interest_rate` decimal(5,2) NOT NULL DEFAULT '5.00',
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('active','closed','matured') COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `deposits_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposits`
--

LOCK TABLES `deposits` WRITE;
/*!40000 ALTER TABLE `deposits` DISABLE KEYS */;
INSERT INTO `deposits` VALUES (1,4,0.00,5.00,'2026-06-24',NULL,'active','2026-11-06 14:43:18'),(2,5,0.00,5.00,'2026-06-24',NULL,'active','2026-11-06 14:43:18'),(4,8,0.00,5.00,'2026-06-24',NULL,'active','2026-11-06 14:43:18'),(5,10,0.00,5.00,'2026-06-25',NULL,'active','2026-11-06 14:43:18'),(8,15,0.00,5.00,'2026-09-07',NULL,'active','2026-11-06 14:43:18'),(9,16,0.00,5.00,'2026-09-16',NULL,'active','2026-11-06 14:43:18');
/*!40000 ALTER TABLE `deposits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `freeze_requests`
--

DROP TABLE IF EXISTS `freeze_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `freeze_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `user_id` int NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `requested_by_manager` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `freeze_requests_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  CONSTRAINT `freeze_requests_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freeze_requests`
--

LOCK TABLES `freeze_requests` WRITE;
/*!40000 ALTER TABLE `freeze_requests` DISABLE KEYS */;
INSERT INTO `freeze_requests` VALUES (1,1,1,'Подозрительная активность','approved',3,'2026-11-06 14:43:18'),(2,2,1,'Запрос пользователя на блокировку счета','rejected',3,'2026-11-06 14:43:18'),(3,10,1,'Запрос пользователя на блокировку счета','approved',3,'2026-11-06 14:43:18'),(4,2,1,'Запрос пользователя на блокировку счета','pending',NULL,'2026-11-06 14:43:18');
/*!40000 ALTER TABLE `freeze_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_history`
--

DROP TABLE IF EXISTS `operation_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operation_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transaction_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `action` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `transaction_id` (`transaction_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `operation_history_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`),
  CONSTRAINT `operation_history_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_history`
--

LOCK TABLES `operation_history` WRITE;
/*!40000 ALTER TABLE `operation_history` DISABLE KEYS */;
INSERT INTO `operation_history` VALUES (1,1,1,'Пополнение счета','Сумма: 5000 RUB','2026-11-06 14:43:18'),(2,3,1,'Перевод средств','Переведено 15000 RUB на счет 40817810000000000003','2026-11-06 14:43:18');
/*!40000 ALTER TABLE `operation_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `from_account_id` int DEFAULT NULL,
  `to_account_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `transaction_type` enum('deposit','withdrawal','transfer','interest','fee') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','completed','cancelled','rejected') COLLATE utf8mb4_unicode_ci DEFAULT 'completed',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `from_account_id` (`from_account_id`),
  KEY `to_account_id` (`to_account_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`from_account_id`) REFERENCES `accounts` (`id`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`to_account_id`) REFERENCES `accounts` (`id`),
  CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1,NULL,1,5000.00,'deposit','completed','Пополнение наличными','2026-11-06 14:43:18'),(2,NULL,1,1,3000.00,'withdrawal','completed','Снятие в банкомате','2026-11-06 14:43:18'),(3,1,3,1,15000.00,'transfer','completed','Перевод другу','2026-11-06 14:43:18'),(4,2,NULL,1,6000.00,'interest','completed','Начисление процентов по вкладу','2026-11-06 14:43:18'),(8,2,1,1,60000.00,'transfer','pending','[Ожидает одобрения (>10к)] Перевод клиенту на счет 40817810000000000001','2026-11-06 14:43:18'),(9,2,9,1,5000.00,'transfer','completed','Перевод клиенту на счет 40817810000006414245','2026-11-06 14:43:18'),(10,9,1,5,5000.00,'transfer','completed','Перевод клиенту на счет 40817810000000000001','2026-11-06 14:43:18'),(11,2,1,1,15000.00,'transfer','completed','[Ожидает одобрения (>10к)] Перевод клиенту на счет 40817810000000000001','2026-11-06 14:43:18'),(12,1,2,1,15000.00,'transfer','rejected','[Ожидает одобрения (>10к)] Перевод клиенту на счет 40817810000000000002','2026-11-06 14:43:18'),(15,2,1,1,50000.00,'transfer','completed','[Ожидает одобрения (>10к)] Перевод клиенту на счет 40817810000000000001','2026-11-06 14:43:18');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('client','manager') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'client',
  `status` enum('active','blocked','deleted') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'client1','qwe123','client1@example.com','+79161234567','Иван','Иванов','client','active','2026-11-06 14:43:18','2026-11-06 14:43:18'),(2,'client2','asd123','client2@example.com','+79162345678','Мария','Петрова','client','active','2026-11-06 14:43:18','2026-11-06 14:43:18'),(3,'manager1','manager','manager1@bank.ru','+79169876543','Алексей','Сидоров','manager','active','2026-11-06 14:43:18','2026-11-06 14:43:18'),(5,'ivan','qwerty123','ivan_289@bank.ru','+79998137494','Иван','Иванов','client','active','2026-11-06 14:43:18','2026-11-06 14:43:18'),(7,'qweqwe','qweqwe','qweqwe_978@bank.ru','+79993140045','qwe','qwe','client','active','2026-11-06 14:43:18','2026-11-06 14:43:18');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-10 15:21:03
