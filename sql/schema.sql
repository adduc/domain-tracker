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
-- Table structure for table `dt_domain`
--

DROP TABLE IF EXISTS `dt_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dt_domain` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) NOT NULL,
  `last_checked` date NOT NULL,
  `expiration_date` date NOT NULL,
  `raw_whois` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dt_domain_dns`
--

DROP TABLE IF EXISTS `dt_domain_dns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dt_domain_dns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `record_type_id` int(10) unsigned NOT NULL,
  `record` varchar(45) NOT NULL,
  `domain_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dt_domain_dns_dt_domain1_idx` (`domain_id`),
  KEY `fk_dt_domain_dns_dt_record_type1_idx` (`record_type_id`),
  CONSTRAINT `fk_dt_domain_dns_dt_domain1` FOREIGN KEY (`domain_id`) REFERENCES `dt_domain` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dt_domain_dns_dt_record_type1` FOREIGN KEY (`record_type_id`) REFERENCES `dt_record_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dt_domain_dns_user`
--

DROP TABLE IF EXISTS `dt_domain_dns_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dt_domain_dns_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain_dns_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `visibility_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_table1_dt_domain_dns1_idx` (`domain_dns_id`),
  KEY `fk_table1_dt_user1_idx` (`user_id`),
  KEY `fk_table1_dt_visibility1_idx` (`visibility_id`),
  CONSTRAINT `fk_table1_dt_domain_dns1` FOREIGN KEY (`domain_dns_id`) REFERENCES `dt_domain_dns` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_dt_user1` FOREIGN KEY (`user_id`) REFERENCES `dt_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_dt_visibility1` FOREIGN KEY (`visibility_id`) REFERENCES `dt_visibility` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dt_domain_user`
--

DROP TABLE IF EXISTS `dt_domain_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dt_domain_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `visibility_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dt_domain_user_dt_user1_idx` (`user_id`),
  KEY `fk_dt_domain_user_dt_domain1_idx` (`domain_id`),
  KEY `fk_dt_domain_user_dt_visibility1_idx` (`visibility_id`),
  CONSTRAINT `fk_dt_domain_user_dt_domain1` FOREIGN KEY (`domain_id`) REFERENCES `dt_domain` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dt_domain_user_dt_user1` FOREIGN KEY (`user_id`) REFERENCES `dt_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dt_domain_user_dt_visibility1` FOREIGN KEY (`visibility_id`) REFERENCES `dt_visibility` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dt_domain_user_event`
--

DROP TABLE IF EXISTS `dt_domain_user_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dt_domain_user_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain_user_id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `detentation_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dt_domain_user_event_dt_event1_idx` (`event_id`),
  KEY `fk_dt_domain_user_event_dt_domain_user1_idx` (`domain_user_id`),
  CONSTRAINT `fk_dt_domain_user_event_dt_event1` FOREIGN KEY (`event_id`) REFERENCES `dt_event` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dt_domain_user_event_dt_domain_user1` FOREIGN KEY (`domain_user_id`) REFERENCES `dt_domain_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dt_event`
--

DROP TABLE IF EXISTS `dt_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dt_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sample Events:\n* Domain Expiration\n* Whois Change';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dt_event_user`
--

DROP TABLE IF EXISTS `dt_event_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dt_event_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `detentation_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dt_alert_user_dt_user1_idx` (`user_id`),
  KEY `fk_dt_event_user_dt_event1_idx` (`event_id`),
  CONSTRAINT `fk_dt_alert_user_dt_user1` FOREIGN KEY (`user_id`) REFERENCES `dt_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dt_event_user_dt_event1` FOREIGN KEY (`event_id`) REFERENCES `dt_event` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dt_item_type`
--

DROP TABLE IF EXISTS `dt_item_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dt_item_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dt_log`
--

DROP TABLE IF EXISTS `dt_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dt_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_type_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `item_type_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_1` varchar(255) DEFAULT NULL,
  `data_2` varchar(255) DEFAULT NULL,
  `data_3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dt_log_dt_item_type1_idx` (`item_type_id`),
  KEY `fk_dt_log_dt_user1_idx` (`user_id`),
  KEY `fk_dt_log_dt_log_type1_idx` (`log_type_id`),
  CONSTRAINT `fk_dt_log_dt_item_type1` FOREIGN KEY (`item_type_id`) REFERENCES `dt_item_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dt_log_dt_user1` FOREIGN KEY (`user_id`) REFERENCES `dt_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dt_log_dt_log_type1` FOREIGN KEY (`log_type_id`) REFERENCES `dt_log_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dt_log_type`
--

DROP TABLE IF EXISTS `dt_log_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dt_log_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dt_record_type`
--

DROP TABLE IF EXISTS `dt_record_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dt_record_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dt_relationship`
--

DROP TABLE IF EXISTS `dt_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dt_relationship` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dt_relationship_user`
--

DROP TABLE IF EXISTS `dt_relationship_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dt_relationship_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `relationship_id` int(10) unsigned NOT NULL,
  `from_user_id` int(10) unsigned NOT NULL,
  `to_user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dt_relationship_user_dt_user1_idx` (`from_user_id`),
  KEY `fk_dt_relationship_user_dt_user2_idx` (`to_user_id`),
  KEY `fk_dt_relationship_user_dt_relationship1_idx` (`relationship_id`),
  CONSTRAINT `fk_dt_relationship_user_dt_user1` FOREIGN KEY (`from_user_id`) REFERENCES `dt_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dt_relationship_user_dt_user2` FOREIGN KEY (`to_user_id`) REFERENCES `dt_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dt_relationship_user_dt_relationship1` FOREIGN KEY (`relationship_id`) REFERENCES `dt_relationship` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dt_user`
--

DROP TABLE IF EXISTS `dt_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dt_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `default_visibility_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dt_user_dt_visibility1_idx` (`default_visibility_id`),
  CONSTRAINT `fk_dt_user_dt_visibility1` FOREIGN KEY (`default_visibility_id`) REFERENCES `dt_visibility` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
