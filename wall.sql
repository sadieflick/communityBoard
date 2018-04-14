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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (19,'Really, that all sounds great. Did you guys get to go?? It all sounds like so much fun!','2018-04-13 21:14:08','2018-04-13 21:14:08',5,24),(20,'I\'m sorry to hear about that student, but really glad you\'re enjoying your program. It takes a lot of courage to go back to school.','2018-04-13 21:17:36','2018-04-13 21:17:36',7,25),(21,'Yeah, I agree with Sadie. Sounds like a great time. I hope you guys were able to make it all work out!','2018-04-13 21:18:23','2018-04-13 21:18:23',7,24),(22,'That\'s a bummer! Well our workout should cheer you up. I really hope you can make it on Saturday.','2018-04-13 21:21:50','2018-04-13 21:21:50',8,26),(24,'I bet you were really surprised. Although it is a very rigorous program. I can see how someone could get discouraged.','2018-04-13 21:23:03','2018-04-13 21:23:03',8,25),(25,'Wow, Florida Keys that\'s amazing!','2018-04-13 21:26:50','2018-04-13 21:26:50',8,24);
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (22,'To be successful, we need quiet time. We need to disconnect from the world. This is where I disconnected because I needed to get my mind straight. I needed to get my mind off all the problems and all the people telling me I was going to die, this wouldn’t work, that wouldn’t work, or this or that, until I was almost going crazy with it! I knew I had to get someplace where it was quiet, to think, and to sharpen my saw. And this was where that could happen.','2018-04-13 20:52:25','2018-04-13 20:52:25',5),(23,'Yesterday Lorelei slept the entire day. Around 430 I asked the nurse to check her labs (wasn’t supposed to be due for 5ish more hours) to make sure there wasn’t a crazy reason she was sleeping. When the labs came back consistent with her previous, I decided to finally just force her to wake her up. (Which is something I never do but this kid had slept almost 24 hours, through multiple respiratory therapies and exams. I needed to see how she would behave. I needed to see more than her eyes reacting when I shine a light in them.)','2018-04-13 20:59:58','2018-04-13 20:59:58',6),(24,'Once upon a time we were supposed to go on vacation…\r\n\r\nI spent all last week working a builder show in Orlando, FL. Our plan was to head to the Florida Keys Friday morning to camp and check the waterfront restaurant called Lorelei Restaurant & Cabana Bar off of Lorelei’s bucket list. (I mean, they even have a kids mermaid shirt that says “mermaid in training” – and little girl who can’t walk is definitely that!) Then we were going to be coming back to Orlando for 5 days of Disney World magic. We even had coveted reservations for Be Our Guest (because I hear the grey stuff is delicious!)','2018-04-13 21:08:06','2018-04-13 21:08:06',6),(25,'Today I went to class and there was this big commotion about a kid who had dropped out, because he had been over-stressed and couldn\'t handle it. Sometimes I think about wuitting, but then I realize I really love this stuff! The hours go by and I don\'t even notice. Honestly I\'m really enjoying myself, even though it\'s really hard work. I like helping people out as much as I can, and I don\'t think he really was able to reach out to anyone. I hope you all remember that people are here for you.','2018-04-13 21:13:19','2018-04-13 21:13:19',5),(26,'This is my first post. It\'s really daunting to put yourself out there... Anyway, I wanted to talk about my day. It was going great until I got hit by bird poop! I swear the birds around here really target people and go for it. Welp. Tomorrow\'s another day.','2018-04-13 21:16:47','2018-04-13 21:16:47',7),(27,'Hi everybody! I\'m super psyched about today\'s meet up at he park for some bootcamp exercises! Are you all as pumped as I am? I think we should all try to get there a little early since it might rain around 2. Well, see you there!','2018-04-13 21:20:36','2018-04-13 21:20:36',8),(28,'Wow that was really cool to get all your encouraging texts after my sprained ankle. But I think I should be healed enough by Saturday to go to the meet up. Fingers crossed.','2018-04-13 21:25:50','2018-04-13 21:25:50',8);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (5,'Sadie','Flick','sadie@sadie.com','$2b$12$EhB6QEgccPuEWkQrj2IOzO883tRxHOjm1mLA9UDWYmL8j7rhEajNi','2018-04-13 20:52:17','2018-04-13 20:52:17'),(6,'Michael','Forester','mike@mike.com','$2b$12$wjRLknuHwCgICIIF3cnMrOG.uWQrzIvLhU0YLsIvUgQE2JbLJRrHq','2018-04-13 20:53:28','2018-04-13 20:53:28'),(7,'Sam','Weiss','sam@sam.com','$2b$12$FKfR./6OdmJwhHbCAcPkkumAfsDflS9CWbt2hcWV6B96pdLFbmAB.','2018-04-13 21:15:21','2018-04-13 21:15:21'),(8,'Anna','Propas','anna@anna.com','$2b$12$SzsuQbeI1pXl4GsyXVk19.JSZqST/znGA.nKYGn837JpME0cDvRaW','2018-04-13 21:19:28','2018-04-13 21:19:28');
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

-- Dump completed on 2018-04-13 21:31:08
