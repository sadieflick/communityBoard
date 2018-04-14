-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: wall
-- ------------------------------------------------------
-- Server version	5.7.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_table1_users_idx` (`user_id`),
  KEY `fk_table1_messages1_idx` (`message_id`),
  CONSTRAINT `fk_table1_messages1` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'okay, here\'s my comment','2018-04-13 16:46:03','2018-04-13 16:46:03',2,19),(2,'Hi everybody, this is a craaaaazy comment','2018-04-13 17:34:18','2018-04-13 17:34:18',2,19),(3,'something something message yada ydad ydaada','2018-04-13 17:43:48','2018-04-13 17:43:48',2,19),(4,'asdflkjasdflkjasdlfkjasdlkfjasdlkfjalsdkfjlaksdjf','2018-04-13 17:44:40','2018-04-13 17:44:40',2,19),(5,'sdkfjhsdkfjhsdkfjhsdkjfhskdjhfksjdhfkjshdfkjshdkjfhksjdfhjkhsdf','2018-04-13 17:49:16','2018-04-13 17:49:16',2,19),(6,'asdlkjfitfdfkjhsdfjh','2018-04-13 18:06:10','2018-04-13 18:06:10',2,19),(7,'asdlkjasdlkjasldkjasldkjalskdjlaksdj','2018-04-13 18:15:56','2018-04-13 18:15:56',2,19),(8,'asdflkjk','2018-04-13 18:17:10','2018-04-13 18:17:10',2,19),(9,'asdlkjgjgjjgjjgjjgj','2018-04-13 18:21:54','2018-04-13 18:21:54',2,19),(10,'asdflkjasdfkj','2018-04-13 18:22:57','2018-04-13 18:22:57',2,19),(11,'asdlfkjasdfkjhasdkfjhkjashdf','2018-04-13 18:25:37','2018-04-13 18:25:37',2,19),(12,'asdlfkjsadflkjasdflkj','2018-04-13 18:27:48','2018-04-13 18:27:48',2,19),(13,'fasldkffkjjjfjf','2018-04-13 18:32:41','2018-04-13 18:32:41',2,19),(14,'asdlfkfl','2018-04-13 18:34:13','2018-04-13 18:34:13',2,19),(15,'So this is what democracy looks like. I am very tired and  I don\'t really want to type, but it looks like  i have to.','2018-04-13 19:31:47','2018-04-13 19:31:47',2,19),(16,'Hi everybody. My name is Sadie.','2018-04-13 19:33:05','2018-04-13 19:33:05',2,15);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_messages_users1_idx` (`user_id`),
  CONSTRAINT `fk_messages_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'hello','2018-04-13 11:32:57','2018-04-13 11:32:57',2),(2,'Hello my name is Lola.','2018-04-13 11:36:59','2018-04-13 11:36:59',2),(3,'Hello my name is sadie','2018-04-13 11:38:34','2018-04-13 11:38:34',2),(4,'Today is a great day for coding.','2018-04-13 11:40:50','2018-04-13 11:40:50',2),(5,'THis is yet another message','2018-04-13 11:41:29','2018-04-13 11:41:29',2),(6,'This is a test of the message list.','2018-04-13 12:50:00','2018-04-13 12:50:00',2),(7,'This is a test message.','2018-04-13 13:23:08','2018-04-13 13:23:08',2),(8,'This is yet another test message to see if it\'s passing anything into the page.','2018-04-13 13:28:46','2018-04-13 13:28:46',2),(9,'Sadie is cool.','2018-04-13 13:32:17','2018-04-13 13:32:17',2),(10,'Sadie is super super super cool.','2018-04-13 13:33:50','2018-04-13 13:33:50',2),(11,'THis may be my last test.... we shall seeeee..','2018-04-13 13:34:50','2018-04-13 13:34:50',2),(12,'This is getting somewhere maybe.','2018-04-13 13:40:47','2018-04-13 13:40:47',2),(13,'This is a test to end all tests...','2018-04-13 14:00:21','2018-04-13 14:00:21',2),(14,'And testing once more. Hi honey!','2018-04-13 14:01:13','2018-04-13 14:01:13',2),(15,'This is a new message!','2018-04-13 14:48:57','2018-04-13 14:48:57',2),(16,'testing order.','2018-04-13 14:49:33','2018-04-13 14:49:33',2),(17,'This is so cool. Love you mom!','2018-04-13 15:13:25','2018-04-13 15:13:25',3),(18,'Testing everything under the sun','2018-04-13 16:41:25','2018-04-13 16:41:25',2),(19,'Posting my message','2018-04-13 16:44:46','2018-04-13 16:44:46',2),(20,'asdflkjfkfkkfkf','2018-04-13 18:37:07','2018-04-13 18:37:07',2);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Sadie','Flick','sadieflick@gmail.com','$2b$12$h5taasz9YTySoHawVM4/LOTtCsmJz7KvC689w1GbhOk4sR9M8ITzW','2018-04-13 07:59:46','2018-04-13 07:59:46'),(2,'Carmencita','Valerio','valerioce1@gmail.com','$2b$12$yJ12UT3ICvaxC6AAee5WdO2Au3F.xrczphswXvj4Vq8ogDadSwF52','2018-04-13 08:04:08','2018-04-13 08:04:08'),(3,'Samantha','Flick','samiflick@gmail.com','$2b$12$IBLZpaMVmCa0BbVvp6vEsuYqHh/.81O986WbPnnmhPqukUQlRuMOS','2018-04-13 15:13:07','2018-04-13 15:13:07');
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

-- Dump completed on 2018-04-13 19:36:32
