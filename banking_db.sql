-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: banking_db
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'40817810000000000001',1,'regular',60000.00,'RUB','active','2026-06-24 17:03:02','2026-06-25 05:40:43'),(2,'40817810000000000002',1,'savings',50000.00,'RUB','active','2026-05-25 00:37:02','2026-06-25 05:40:43'),(3,'40817810000000000003',2,'regular',8500.00,'RUB','active','2026-06-24 17:03:02','2026-06-24 17:03:02'),(4,'40820810000008322471',1,'savings',0.00,'RUB','closed','2026-06-24 23:38:53','2026-06-24 23:42:39'),(5,'40820810000006682001',1,'savings',0.00,'RUB','closed','2026-06-24 23:53:21','2026-06-25 00:32:39'),(6,'40817810000007547894',4,'regular',50000.00,'RUB','active','2026-06-25 00:02:08','2026-06-25 00:40:43'),(7,'40820810000004242264',4,'savings',5000.00,'RUB','active','2026-06-25 00:09:07','2026-06-25 00:40:43'),(8,'40820810000003690241',1,'savings',0.00,'RUB','closed','2026-06-25 00:35:20','2026-06-25 00:39:42'),(9,'40817810000006414245',5,'regular',0.00,'RUB','closed','2026-06-25 05:07:52','2026-06-25 05:24:50'),(10,'40820810000001290871',1,'savings',0.00,'RUB','frozen','2026-06-25 10:58:03','2026-06-25 10:59:50'),(11,'40817810000003796236',6,'regular',0.00,'RUB','closed','2026-06-25 11:01:08','2026-06-25 11:05:18'),(12,'40820810000004444896',6,'savings',0.00,'RUB','closed','2026-06-25 11:02:09','2026-06-25 11:05:15'),(13,'40820810000008315266',6,'savings',0.00,'RUB','active','2026-06-25 11:05:31','2026-06-25 11:05:31'),(14,'40817810000005103277',7,'regular',0.00,'RUB','active','2026-09-07 13:00:10','2026-09-07 13:00:10'),(15,'40820810000005604037',7,'savings',0.00,'RUB','active','2026-09-07 13:00:28','2026-09-07 13:00:28');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,1,'account_open','approved','Открытие накопительного счета','2026-06-24 17:03:02',NULL),(2,2,'card_issue','pending','Выпуск дебетовой карты','2026-06-24 17:03:02',NULL),(3,1,'account_open','approved','Открытие накопительного счета пользователя через приложение','2026-06-24 23:38:53',NULL),(4,1,'account_open','approved','Открытие накопительного счета пользователя через приложение','2026-06-24 23:53:21',NULL),(5,4,'account_open','approved','Открытие накопительного счета пользователя через приложение','2026-06-25 00:09:07',NULL),(6,1,'account_open','approved','Открытие накопительного счета пользователя через приложение','2026-06-25 00:35:20',NULL),(7,1,'account_open','approved','Открытие накопительного счета пользователя через приложение','2026-06-25 10:58:02',NULL),(8,6,'account_open','approved','Открытие накопительного счета пользователя через приложение','2026-06-25 11:02:09',NULL),(9,6,'account_open','approved','Открытие накопительного счета пользователя через приложение','2026-06-25 11:05:31',NULL),(10,7,'account_open','approved','Открытие накопительного счета пользователя через приложение','2026-09-07 13:00:27',NULL);
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,1,'1234567890','Москва, ул. Ленина 10','1995-03-15','2026-06-24 17:03:02'),(2,2,'0987654321','Санкт-Петербург, Невский 25','1998-07-22','2026-06-24 17:03:02'),(3,3,'5432107896','Уфа, ул. Кирова 65\\2','2000-01-01','2026-08-09 14:31:02');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `deposits`
--

LOCK TABLES `deposits` WRITE;
/*!40000 ALTER TABLE `deposits` DISABLE KEYS */;
INSERT INTO `deposits` VALUES (1,4,0.00,5.00,'2026-06-24',NULL,'active','2026-06-24 23:38:53'),(2,5,0.00,5.00,'2026-06-24',NULL,'active','2026-06-24 23:53:21'),(3,7,0.00,5.00,'2026-06-24',NULL,'active','2026-06-25 00:09:07'),(4,8,0.00,5.00,'2026-06-24',NULL,'active','2026-06-25 00:35:20'),(5,10,0.00,5.00,'2026-06-25',NULL,'active','2026-06-25 10:58:03'),(6,12,0.00,5.00,'2026-06-25',NULL,'active','2026-06-25 11:02:09'),(7,13,0.00,5.00,'2026-06-25',NULL,'active','2026-06-25 11:05:31'),(8,15,0.00,5.00,'2026-09-07',NULL,'active','2026-09-07 13:00:28');
/*!40000 ALTER TABLE `deposits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `freeze_requests`
--

LOCK TABLES `freeze_requests` WRITE;
/*!40000 ALTER TABLE `freeze_requests` DISABLE KEYS */;
INSERT INTO `freeze_requests` VALUES (1,1,1,'Подозрительная активность','approved',3,'2026-06-24 17:03:02'),(2,2,1,'Запрос пользователя на блокировку счета','rejected',3,'2026-06-24 23:42:43'),(3,10,1,'Запрос пользователя на блокировку счета','approved',3,'2026-06-25 10:58:54'),(4,2,1,'Запрос пользователя на блокировку счета','pending',NULL,'2026-06-25 11:19:08');
/*!40000 ALTER TABLE `freeze_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `operation_history`
--

LOCK TABLES `operation_history` WRITE;
/*!40000 ALTER TABLE `operation_history` DISABLE KEYS */;
INSERT INTO `operation_history` VALUES (1,1,1,'Пополнение счета','Сумма: 5000 RUB','2026-06-24 17:03:02'),(2,3,1,'Перевод средств','Переведено 15000 RUB на счет 40817810000000000003','2026-06-24 17:03:02');
/*!40000 ALTER TABLE `operation_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1,NULL,1,5000.00,'deposit','completed','Пополнение наличными','2026-06-24 17:03:02'),(2,NULL,1,1,3000.00,'withdrawal','completed','Снятие в банкомате','2026-06-24 17:03:02'),(3,1,3,1,15000.00,'transfer','completed','Перевод другу','2026-06-24 17:03:02'),(4,2,NULL,1,6000.00,'interest','completed','Начисление процентов по вкладу','2026-06-24 17:03:02'),(5,1,6,1,5000.00,'transfer','completed','Перевод клиенту на счет 40817810000007547894','2026-06-25 00:34:52'),(6,2,6,1,50000.00,'transfer','completed','[Ожидает одобрения (>10к)] Перевод клиенту на счет 40817810000007547894','2026-06-25 00:39:59'),(7,6,7,4,5000.00,'transfer','completed','Перевод клиенту на счет 40820810000004242264','2026-06-25 00:40:43'),(8,2,1,1,60000.00,'transfer','pending','[Ожидает одобрения (>10к)] Перевод клиенту на счет 40817810000000000001','2026-06-25 00:41:57'),(9,2,9,1,5000.00,'transfer','completed','Перевод клиенту на счет 40817810000006414245','2026-06-25 05:17:29'),(10,9,1,5,5000.00,'transfer','completed','Перевод клиенту на счет 40817810000000000001','2026-06-25 05:24:31'),(11,2,1,1,15000.00,'transfer','completed','[Ожидает одобрения (>10к)] Перевод клиенту на счет 40817810000000000001','2026-06-25 05:37:30'),(12,1,2,1,15000.00,'transfer','rejected','[Ожидает одобрения (>10к)] Перевод клиенту на счет 40817810000000000002','2026-06-25 10:58:39');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'client1','qwe123','client1@example.com','+79161234567','Иван','Иванов','client','active','2026-06-24 17:03:02','2026-06-24 17:06:01'),(2,'client2','asd123','client2@example.com','+79162345678','Мария','Петрова','client','active','2026-06-24 17:03:02','2026-06-24 17:06:01'),(3,'manager1','manager','manager1@bank.ru','+79169876543','Алексей','Сидоров','manager','active','2026-06-24 17:03:02','2026-06-24 17:06:01'),(4,'aidares','qwerty','','','Радмир','Сальманов','client','active','2026-06-25 00:02:08','2026-06-25 00:02:08'),(5,'ivan','qwerty123','ivan_289@bank.ru','+79998137494','Иван','Иванов','client','active','2026-06-25 05:07:52','2026-06-25 05:07:52'),(6,'qwe','qwe12345','qwe_778@bank.ru','+79999477860','Радмир','Сальманов','client','active','2026-06-25 11:01:08','2026-06-25 11:01:08'),(7,'qweqwe','qweqwe','qweqwe_978@bank.ru','+79993140045','qwe','qwe','client','active','2026-09-07 13:00:09','2026-09-07 13:00:09');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'banking_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-10 11:29:52
