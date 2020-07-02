-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: localhost    Database: db_logitech
-- ------------------------------------------------------
-- Server version	8.0.20-0ubuntu0.20.04.1

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(1500) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'kim@gmail.com','##123abc','성환','김','2020-06-29'),(2,'lee123@gmail.com','$2b$12$rUQVXeryav.teEEEABKSxeZoyLwabqZV/6QVdhl5Fqh6dEPecRZ56','종민','이','2020-06-30'),(3,'hello2@gmail.com','$2b$12$/pH1pf5Jf7CkF66b9254nOoRzx.XJTUo6xx1xUVbMknQ9zyHQgItK','Hello','Hi','2020-06-30'),(4,'testtest@gmail.com','$2b$12$vDT7AU3M19HO8oz2csBVbOUCfp6YxEd10O9jQxuQ6Kgsz6JgPhQEK','승현','손','2020-06-30'),(5,'testtest1@gmail.com','$2b$12$PLBOItgWlZBtrDaAyPHXI.YWOoYIjMLbjk2SFCxnD1FxK8bSAju.2','ㅇㅇ','ㅇㅇ','2020-06-30'),(6,'testtest5434@gmail.com','$2b$12$cr.Xe8L8Hdwa01cwTaD0bOfq6vUbLP4SAO2Rxb7h8rjBreaSC738i','ㅇㄴ','ㅇㄴ','2020-06-30'),(7,'jeeinkim1219@gmail.com','$2b$12$QlF/Bpxb0FnyKB0rXm6ei.rrvFs0wPUmHd4Y4Ti1UiHmasT/ctKuu','Jeein','Kim','2020-06-30'),(8,'testtest254345@gmail.com','$2b$12$gCD1FNK2haY4j2mv.4d2U.R9eJPd./TLnxH6ajdx3OwmrEZg/pNCm','e','e','2020-06-30'),(9,'testtest2545@gmail.com','$2b$12$btet0bsv7jHQ6vzogpT1a.yB6DSsAI0gJcEz9qPRcKt9yGEpu/dPy','e','e','2020-06-30'),(10,'testtest77@gmail.com','$2b$12$HSiRO2SQ4wTRS7L3Xgd1Te1.jHoI4VCspFDHfjg6m.tKmut/MuSEq','es','ds','2020-06-30');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can view permission',1,'view_permission'),(5,'Can add group',2,'add_group'),(6,'Can change group',2,'change_group'),(7,'Can delete group',2,'delete_group'),(8,'Can view group',2,'view_group'),(9,'Can add user',3,'add_user'),(10,'Can change user',3,'change_user'),(11,'Can delete user',3,'delete_user'),(12,'Can view user',3,'view_user'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add main menu',6,'add_mainmenu'),(22,'Can change main menu',6,'change_mainmenu'),(23,'Can delete main menu',6,'delete_mainmenu'),(24,'Can view main menu',6,'view_mainmenu'),(25,'Can add product category',7,'add_productcategory'),(26,'Can change product category',7,'change_productcategory'),(27,'Can delete product category',7,'delete_productcategory'),(28,'Can view product category',7,'view_productcategory'),(29,'Can add color',8,'add_color'),(30,'Can change color',8,'change_color'),(31,'Can delete color',8,'delete_color'),(32,'Can view color',8,'view_color'),(33,'Can add filter category',9,'add_filtercategory'),(34,'Can change filter category',9,'change_filtercategory'),(35,'Can delete filter category',9,'delete_filtercategory'),(36,'Can view filter category',9,'view_filtercategory'),(37,'Can add filter list',10,'add_filterlist'),(38,'Can change filter list',10,'change_filterlist'),(39,'Can delete filter list',10,'delete_filterlist'),(40,'Can view filter list',10,'view_filterlist'),(41,'Can add product',11,'add_product'),(42,'Can change product',11,'change_product'),(43,'Can delete product',11,'delete_product'),(44,'Can view product',11,'view_product'),(45,'Can add product sub category',12,'add_productsubcategory'),(46,'Can change product sub category',12,'change_productsubcategory'),(47,'Can delete product sub category',12,'delete_productsubcategory'),(48,'Can view product sub category',12,'view_productsubcategory'),(49,'Can add product list thumbnail',13,'add_productlistthumbnail'),(50,'Can change product list thumbnail',13,'change_productlistthumbnail'),(51,'Can delete product list thumbnail',13,'delete_productlistthumbnail'),(52,'Can view product list thumbnail',13,'view_productlistthumbnail'),(53,'Can add product filter',14,'add_productfilter'),(54,'Can change product filter',14,'change_productfilter'),(55,'Can delete product filter',14,'delete_productfilter'),(56,'Can view product filter',14,'view_productfilter'),(57,'Can add product image',15,'add_productimage'),(58,'Can change product image',15,'change_productimage'),(59,'Can delete product image',15,'delete_productimage'),(60,'Can view product image',15,'view_productimage'),(61,'Can add product video',16,'add_productvideo'),(62,'Can change product video',16,'change_productvideo'),(63,'Can delete product video',16,'delete_productvideo'),(64,'Can view product video',16,'view_productvideo'),(65,'Can add product teaser',17,'add_productteaser'),(66,'Can change product teaser',17,'change_productteaser'),(67,'Can delete product teaser',17,'delete_productteaser'),(68,'Can view product teaser',17,'view_productteaser'),(69,'Can add product specification',18,'add_productspecification'),(70,'Can change product specification',18,'change_productspecification'),(71,'Can delete product specification',18,'delete_productspecification'),(72,'Can view product specification',18,'view_productspecification'),(73,'Can add product description',19,'add_productdescription'),(74,'Can change product description',19,'change_productdescription'),(75,'Can delete product description',19,'delete_productdescription'),(76,'Can view product description',19,'view_productdescription'),(77,'Can add recommend product',20,'add_recommendproduct'),(78,'Can change recommend product',20,'change_recommendproduct'),(79,'Can delete recommend product',20,'delete_recommendproduct'),(80,'Can view recommend product',20,'view_recommendproduct'),(81,'Can add product price',21,'add_productprice'),(82,'Can change product price',21,'change_productprice'),(83,'Can delete product price',21,'delete_productprice'),(84,'Can view product price',21,'view_productprice'),(85,'Can add account',22,'add_account'),(86,'Can change account',22,'change_account'),(87,'Can delete account',22,'delete_account'),(88,'Can view account',22,'view_account'),(89,'Can add order status',23,'add_orderstatus'),(90,'Can change order status',23,'change_orderstatus'),(91,'Can delete order status',23,'delete_orderstatus'),(92,'Can view order status',23,'view_orderstatus'),(93,'Can add user order',24,'add_userorder'),(94,'Can change user order',24,'change_userorder'),(95,'Can delete user order',24,'delete_userorder'),(96,'Can view user order',24,'view_userorder'),(97,'Can add order item',25,'add_orderitem'),(98,'Can change order item',25,'change_orderitem'),(99,'Can delete order item',25,'delete_orderitem'),(100,'Can view order item',25,'view_orderitem'),(101,'Can add user product',26,'add_userproduct'),(102,'Can change user product',26,'change_userproduct'),(103,'Can delete user product',26,'delete_userproduct'),(104,'Can view user product',26,'view_userproduct'),(105,'Can add user delivery address',27,'add_userdeliveryaddress'),(106,'Can change user delivery address',27,'change_userdeliveryaddress'),(107,'Can delete user delivery address',27,'delete_userdeliveryaddress'),(108,'Can view user delivery address',27,'view_userdeliveryaddress');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `color_image` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES (1,'그라파이트 토날','https://www.logitech.com/assets/65123/24/wireless-mouse-m590-multi-device-silent.jpg'),(2,'그라파이트','https://www.logitech.com/assets/65122/26/wireless-mouse-m585-multi-device.jpg'),(3,'파란색/검은색','https://www.logitech.com/assets/64193/29/m170-reliable-wireless-connectivity.png'),(5,'블랙','https://www.logitech.com/assets/52362/17/bluetooth-multi-device-keyboard-k480.png'),(6,'미드 그레이 토날','https://www.logitech.com/assets/65123/25/wireless-mouse-m590-multi-device-silent.jpg'),(7,'회색','https://www.logitech.com/assets/65122/24/wireless-mouse-m585-multi-device.jpg'),(8,'회색/검은색','https://www.logitech.com/assets/64193/30/m170-reliable-wireless-connectivity.png'),(9,'터키블루','https://www.logitech.com/assets/65477/26/wireless-ultra-portable-m187-refresh.jpg'),(10,'흰색','https://www.logitech.com/assets/52362/18/bluetooth-multi-device-keyboard-k480.png'),(11,'루비','https://www.logitech.com/assets/65123/26/wireless-mouse-m590-multi-device-silent.jpg'),(13,'빨간색/검은색','https://www.logitech.com/assets/64193/31/m170-reliable-wireless-connectivity.png'),(14,'레드','https://www.logitech.com/assets/65477/65/wireless-ultra-portable-m187-refresh.jpg'),(15,'','');
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (22,'account','account'),(26,'account','userproduct'),(2,'auth','group'),(1,'auth','permission'),(3,'auth','user'),(25,'cart','orderitem'),(23,'cart','orderstatus'),(27,'cart','userdeliveryaddress'),(24,'cart','userorder'),(4,'contenttypes','contenttype'),(8,'product','color'),(9,'product','filtercategory'),(10,'product','filterlist'),(6,'product','mainmenu'),(11,'product','product'),(7,'product','productcategory'),(19,'product','productdescription'),(14,'product','productfilter'),(15,'product','productimage'),(13,'product','productlistthumbnail'),(21,'product','productprice'),(18,'product','productspecification'),(12,'product','productsubcategory'),(17,'product','productteaser'),(16,'product','productvideo'),(20,'product','recommendproduct'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-06-26 07:20:52.458644'),(2,'contenttypes','0002_remove_content_type_name','2020-06-26 07:20:52.667324'),(3,'auth','0001_initial','2020-06-26 07:20:53.126117'),(4,'auth','0002_alter_permission_name_max_length','2020-06-26 07:20:54.760666'),(5,'auth','0003_alter_user_email_max_length','2020-06-26 07:20:54.802152'),(6,'auth','0004_alter_user_username_opts','2020-06-26 07:20:54.862347'),(7,'auth','0005_alter_user_last_login_null','2020-06-26 07:20:55.063931'),(8,'auth','0006_require_contenttypes_0002','2020-06-26 07:20:55.079244'),(9,'auth','0007_alter_validators_add_error_messages','2020-06-26 07:20:55.146843'),(10,'auth','0008_alter_user_username_max_length','2020-06-26 07:20:55.391770'),(11,'auth','0009_alter_user_last_name_max_length','2020-06-26 07:20:55.572414'),(12,'auth','0010_alter_group_name_max_length','2020-06-26 07:20:55.700436'),(13,'auth','0011_update_proxy_permissions','2020-06-26 07:20:55.757338'),(14,'product','0001_initial','2020-06-26 07:20:55.943988'),(15,'product','0002_auto_20200625_2022','2020-06-26 07:20:56.775759'),(16,'product','0003_auto_20200625_2131','2020-06-26 07:20:57.782631'),(17,'product','0004_auto_20200625_2330','2020-06-26 07:20:58.067864'),(18,'product','0005_auto_20200625_2346','2020-06-26 07:20:58.642822'),(19,'product','0006_remove_productlistthumbnail_color','2020-06-26 07:20:58.820352'),(20,'product','0007_productimage','2020-06-26 07:20:58.946209'),(21,'product','0008_productdescription_productspecification_productteaser_productvideo','2020-06-26 07:20:59.773069'),(22,'sessions','0001_initial','2020-06-26 07:21:00.445607'),(23,'product','0009_product_filter_list','2020-06-26 08:47:44.049777'),(24,'product','0010_auto_20200626_1802','2020-06-26 09:16:40.322099'),(25,'product','0011_auto_20200626_1816','2020-06-26 09:16:40.586350'),(26,'product','0012_productprice','2020-06-29 10:05:24.398406'),(27,'account','0001_initial','2020-06-29 12:32:39.218747'),(28,'product','0012_auto_20200628_1531','2020-06-29 12:32:39.872683'),(29,'product','0013_merge_20200629_2132','2020-06-29 12:32:39.893836'),(30,'account','0002_auto_20200629_2133','2020-06-29 12:33:53.004863'),(31,'cart','0001_initial','2020-06-29 12:33:53.328010'),(32,'cart','0002_auto_20200630_1414','2020-06-30 05:14:54.956284'),(33,'cart','0003_orderitem_product_color','2020-06-30 10:38:59.871604'),(34,'account','0003_userproduct','2020-06-30 13:54:32.545671'),(35,'account','0004_account_product_price','2020-07-01 01:43:13.119661'),(36,'product','0014_productprice_user','2020-07-01 01:43:13.197515'),(37,'cart','0004_auto_20200701_2050','2020-07-01 11:50:30.759057'),(38,'account','0005_remove_account_product_price','2020-07-02 01:45:28.331847'),(39,'cart','0005_auto_20200702_1045','2020-07-02 01:45:29.345427'),(40,'product','0015_remove_productprice_user','2020-07-02 01:45:29.770385'),(41,'cart','0006_auto_20200702_1307','2020-07-02 04:07:24.281393'),(42,'cart','0007_auto_20200702_1404','2020-07-02 05:04:38.805522');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_categories`
--

DROP TABLE IF EXISTS `filter_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `sub_category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `filter_categories_sub_category_id_c54cd600_fk_product_s` (`sub_category_id`),
  CONSTRAINT `filter_categories_sub_category_id_c54cd600_fk_product_s` FOREIGN KEY (`sub_category_id`) REFERENCES `product_sub_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_categories`
--

LOCK TABLES `filter_categories` WRITE;
/*!40000 ALTER TABLE `filter_categories` DISABLE KEYS */;
INSERT INTO `filter_categories` VALUES (1,'컬렉션',1),(2,'크기 및 핏',1),(3,'플랫폼',1),(4,'연결',1),(5,'기능',1),(6,'고급 스크롤 유형',1),(7,'작업 및 용도',1),(8,'컬렉션',3),(9,'타이핑 느낌',3),(10,'키보드 레이아웃 크기',3),(11,'연결',3),(12,'플랫폼',3),(13,'기능',3);
/*!40000 ALTER TABLE `filter_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_lists`
--

DROP TABLE IF EXISTS `filter_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_lists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filter_name` varchar(50) DEFAULT NULL,
  `filter_category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filter_lists_filter_category_id_dbb9a96b_fk_filter_categories_id` (`filter_category_id`),
  CONSTRAINT `filter_lists_filter_category_id_dbb9a96b_fk_filter_categories_id` FOREIGN KEY (`filter_category_id`) REFERENCES `filter_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_lists`
--

LOCK TABLES `filter_lists` WRITE;
/*!40000 ALTER TABLE `filter_lists` DISABLE KEYS */;
INSERT INTO `filter_lists` VALUES (1,'MX 퍼포먼스',1),(2,'인체공학 제품군',1),(3,'멀티 디바이스',1),(4,'무선',1),(5,'비즈니스용',1),(6,'게이밍 마우스',1),(7,'소형 / 휴대용',1),(8,'대형',2),(9,'양손잡이',2),(10,'Windows',3),(11,'Mac',3),(12,'Chrome',3),(13,'표면',3),(14,'Linux',3),(15,'USB 수신기',4),(16,'USB Unifying 수신기',4),(17,'Bluetooth',4),(18,'Bluetooth + USB 수신기',4),(19,'유선',4),(20,'충전식',5),(21,'조용한 클릭',5),(22,'이지-스위치 기술',5),(23,'플로우 테크놀로지',5),(24,'다크필드 트레킹',5),(25,'프로그래밍이 가능한 버튼',5),(26,'초고속 스크롤',6),(27,'틸트 휠',6),(28,'MagSpeed 마그네틱 스크롤',6),(29,'엄지손가락 휠',6),(30,'이메일',7),(31,'웹 브라우저',7),(32,'텍스트 편집',7),(33,'스프레드시트 탐색',7),(34,'사진, 비디오, 음악 편집',7),(35,'3D 창작, 소프트웨어 개발',7),(36,'MX',8),(37,'멀티 디바이스',8),(38,'무선',8),(39,'노트북 같은 키',9),(40,'딥 프로파일 키',9),(41,'풀 사이즈 숫자 키패드',10),(42,'컴팩트형 숫자 키패드',10),(43,'미니멀한 레이아웃',10),(44,'USB 수신기',11),(45,'Bluetooth',11),(46,'Bluetooth + USB 수신기',11),(47,'Windows',12),(48,'Mac',12),(49,'Linux',12),(50,'Chrome',12),(51,'표면',12),(52,'Android',12),(53,'iOS',12),(54,'충전식',13),(55,'저소음 키',13),(56,'프로그래밍 가능한 키',13),(57,'Easy-Switch 기술',13),(58,'백라이트 키보드',13),(59,'손바닥 받침대',13),(60,'거실 키보드 방향 패드',13),(61,'미디어 키',13),(62,'전화기 스탠드',13);
/*!40000 ALTER TABLE `filter_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_menus`
--

DROP TABLE IF EXISTS `main_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_menus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_menus`
--

LOCK TABLES `main_menus` WRITE;
/*!40000 ALTER TABLE `main_menus` DISABLE KEYS */;
INSERT INTO `main_menus` VALUES (1,'제품'),(2,'솔루션'),(3,'비즈니스'),(4,'지원');
/*!40000 ALTER TABLE `main_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_price_id` int DEFAULT NULL,
  `product_quantity` int DEFAULT NULL,
  `product_color_id` int DEFAULT NULL,
  `user_order_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_product_price_id_369e8953_fk_product_prices_id` (`product_price_id`),
  KEY `order_items_product_color_id_a6667aa5_fk_colors_id` (`product_color_id`),
  KEY `order_items_user_order_id_834439aa_fk_user_orders_id` (`user_order_id`),
  CONSTRAINT `order_items_product_color_id_a6667aa5_fk_colors_id` FOREIGN KEY (`product_color_id`) REFERENCES `colors` (`id`),
  CONSTRAINT `order_items_product_price_id_369e8953_fk_product_prices_id` FOREIGN KEY (`product_price_id`) REFERENCES `product_prices` (`id`),
  CONSTRAINT `order_items_user_order_id_834439aa_fk_user_orders_id` FOREIGN KEY (`user_order_id`) REFERENCES `user_orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (24,1,3,11,8),(25,1,3,1,8),(26,1,3,1,8),(27,6,4,15,8),(28,1,7,6,8),(29,1,3,6,8),(30,1,7,6,8),(31,1,1,6,8),(32,6,4,15,8),(33,6,4,15,8),(34,6,7,15,8),(35,1,9,6,8);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (1,'in cart'),(2,'ordered');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `menu_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_categories_menu_id_054ffee6_fk_main_menus_id` (`menu_id`),
  CONSTRAINT `product_categories_menu_id_054ffee6_fk_main_menus_id` FOREIGN KEY (`menu_id`) REFERENCES `main_menus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (1,'마우스 + 키보드',1),(2,'프레젠테이션 리모컨',1),(3,'모바일 장치',1),(4,'스트리밍',1),(5,'홈 보안 카메라',1),(6,'헤드셋',1),(7,'비디오 협업',1),(8,'logitech G',1);
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_descriptions`
--

DROP TABLE IF EXISTS `product_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_descriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(16000) DEFAULT NULL,
  `order` int DEFAULT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_descriptions_product_id_b3b9f1aa_fk_products_id` (`product_id`),
  CONSTRAINT `product_descriptions_product_id_b3b9f1aa_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_descriptions`
--

LOCK TABLES `product_descriptions` WRITE;
/*!40000 ALTER TABLE `product_descriptions` DISABLE KEYS */;
INSERT INTO `product_descriptions` VALUES (1,'<section aria-label=\"주요 기능\" class=\"product-key-features\">\n<div class=\"container\">\n<h6 class=\"product-key-features-title\">주요 기능</h6>\n<ul class=\"key-features-ctn\">\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-left\">\n<div class=\"key-features-media\">\n<a class=\"action image-opens-vidplayer play-video-btn\" href=\"https://assets.logitech.comhttps://www.youtube.com/watch?v=0rs6WMN0uUE\" role=\"button\" target=\"\" title=\"비디오 재생\">\n<img alt=\"M590 with 2 computer on the back\" class=\"video-poster\" src=\"https://assets.logitech.com/assets/65123/19/wireless-mouse-m590-multi-device-silent.jpg\"/>\n<span aria-hidden=\"true\" class=\"logi-icon-play-circled\" role=\"presentation\"></span>\n</a>\n</div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3>쉽고 편리한 멀티 컴퓨터 환경</h3>\n<p>여러 대의 컴퓨터를 하나의 마우스와 키보드로 엮어주는 Logitech FLOW 기술로 M590의 잠재력을 끌어올리세요. 최대 두 컴퓨터 넘나들며 마우스 커서를 움직일 수 있으며 텍스트나 이미지, 혹은 파일들을 다른 컴퓨터로 복사/붙여넣기 할 수 있습니다.<a class=\"footnote\">1</a><br/><br/><img alt=\"\" height=\"32\" id=\"65123-27-0-1\" src=\"https://assets.logitech.com/assets/65123/27/wireless-mouse-m590-multi-device-silent.png\" width=\"74\"/></p>\n<p class=\"text-link\"><a alt=\"Flow 멀티-디바이스 제어 더 알아보기\" class=\"logi-icon-chevron-right\" href=\"https://assets.logitech.com/ko-kr/page/flow-multi-device-control\" target=\"\"><span>Flow 멀티-디바이스 제어 더 알아보기</span></a> </p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-right\">\n<div class=\"key-features-media\">\n<img alt=\"Silent icon with M590\" class=\"media-img\" src=\"https://assets.logitech.com/assets/65123/20/wireless-mouse-m590-multi-device-silent.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3>조용한 클릭을 즐기세요</h3>\n<p>90%이상의 소음은 줄이고 클릭감은 그대로 살린 M590으로 소음없는 쾌적한 환경을 즐기십시오. 고급 재질의 마우스 피트와 고무 휠은 빠른 탐색과 조용한 스크롤을 선사합니다.</p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-left\">\n<div class=\"key-features-media\">\n<img alt=\"A hand holding M590 on the working desk\" class=\"media-img\" src=\"https://assets.logitech.com/assets/65123/21/wireless-mouse-m590-multi-device-silent.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3>초정밀 휠 스크롤</h3>\n<p>초정밀 스크롤 휠로 긴 웹페이지도 쉽고 빠르고 부드럽게 스크롤 할 수 있습니다.</p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-right\">\n<div class=\"key-features-media\">\n<img alt=\"M590 on Desk\" class=\"media-img\" src=\"https://assets.logitech.com/assets/65123/22/wireless-mouse-m590-multi-device-silent.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3>2개의 엄지손가락 버튼</h3>\n<p>두 개의 엄지손가락 버튼으로 더 쉽고 간단하게 컨트롤 할 수 있습니다. 웹페이지 앞으로/뒤로 가기 뿐만 아니라, Mac OS X 및 Windows<sup>®</sup> 모두 지원하는 Logitech Options<sup>™</sup> 소프트웨어를 다운로드하여 원하는 기능으로 설정할 수 있습니다.</p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-left\">\n<div class=\"key-features-media\">\n<img alt=\"M590 with 2years battery icon\" class=\"media-img\" src=\"https://assets.logitech.com/assets/65123/23/wireless-mouse-m590-multi-device-silent.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3>2년의 배터리 수명</h3>\n<p>효율적인 전력관리로 1개의 AA 건전지로 2년간 사용할 수 있습니다. 자동 절전모드, 전원 온/오프 스위치 및 배터리 표시등으로 배터리 걱정이 없습니다.<a class=\"footnote\">2</a></p>\n</div>\n</div>\n</li>\n</ul>\n</div>\n</section>',1,1),(2,'<section aria-label=\"주요 기능\" class=\"product-key-features\">\n<div class=\"container\">\n<h6 class=\"product-key-features-title\">주요 기능</h6>\n<ul class=\"key-features-ctn\">\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-left\">\n<div class=\"key-features-media\">\n<a class=\"action image-opens-vidplayer play-video-btn\" href=\"https://assets.logitech.comhttps://www.youtube.com/watch?v=0rs6WMN0uUE\" role=\"button\" target=\"\" title=\"비디오 재생\">\n<img alt=\"M585 with two computer\" class=\"video-poster\" src=\"https://assets.logitech.com/assets/65122/19/wireless-mouse-m585-multi-device.jpg\"/>\n<span aria-hidden=\"true\" class=\"logi-icon-play-circled\" role=\"presentation\"></span>\n</a>\n</div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3>Logitech FLOW</h3>\n<p>PC와 Mac처럼 운영체제가 전혀 다른 두 컴퓨터 사이를 자유럽게 이동하고, 텍스트나 파일을 복사/붙여넣기 할 수 있습니다.<a class=\"footnote\">1</a></p>\n<p class=\"text-link\"><a alt=\"Logitech Flow 더 알아보기\" class=\"logi-icon-chevron-right\" href=\"https://assets.logitech.com/ko-kr/page/flow-multi-device-control\" target=\"\"><span>Logitech Flow 더 알아보기</span></a> </p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-right\">\n<div class=\"key-features-media\">\n<img alt=\"M585 Multi-Device\" class=\"media-img\" src=\"https://assets.logitech.com/assets/65122/20/wireless-mouse-m585-multi-device.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3>초정밀 스크롤 휠</h3>\n<p>초정밀 스크롤 휠로 긴 웹페이지도 쉽고 빠르고 부드럽게 스크롤 할 수 있습니다.</p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-left\">\n<div class=\"key-features-media\">\n<img alt=\"M585 Multi-Device\" class=\"media-img\" src=\"https://assets.logitech.com/assets/65122/21/wireless-mouse-m585-multi-device.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3>2개의 엄지손가락 버튼</h3>\n<p>두 개의 엄지손가락 버튼으로 더 쉽고 간단하게 컨트롤 할 수 있습니다. 웹페이지 앞으로/뒤로 가기 뿐만 아니라, Mac OS X 및 Windows<sup>®</sup> 모두 지원하는 Logitech Options<sup>™</sup> 소프트웨어를 다운로드하여 원하는 기능으로 설정할 수 있습니다.</p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-right\">\n<div class=\"key-features-media\">\n<img alt=\"M585 Multi-Device 24 Month battery\" class=\"media-img\" src=\"https://assets.logitech.com/assets/65122/22/wireless-mouse-m585-multi-device.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3>24개월의 배터리 수명</h3>\n<p>효율적인 전력관리로 1개의 AA 건전지로 2년간 사용할 수 있습니다. 자동 절전모드, 전원 온/오프 스위치 및 배터리 표시등으로 배터리 걱정이 없습니다.<a class=\"footnote\">2</a></p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-left\">\n<div class=\"key-features-media\">\n<img alt=\"M585 Multi-Device\" class=\"media-img\" src=\"https://assets.logitech.com/assets/65122/23/wireless-mouse-m585-multi-device.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3>손에 딱 맞는 디자인</h3>\n<p>손에 꼭 맞는 돔 형태의 디자인으로 장시간 사용해도 편안합니다.</p>\n</div>\n</div>\n</li>\n</ul>\n</div>\n</section>',1,2),(3,'<section aria-label=\"주요 기능\" class=\"product-key-features\">\n<div class=\"container\">\n<h6 class=\"product-key-features-title\">주요 기능</h6>\n<ul class=\"key-features-ctn\">\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-left\">\n<div class=\"key-features-media\">\n<img alt=\"\" class=\"media-img\" src=\"https://assets.logitech.com/assets/64193/m170-reliable-wireless-connectivity.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3> 안정적인 무선 연결</h3>\n<p><p>최대 10미터 떨어진 거리에서도 강력하고 안정적인 2.4Ghz 무선 연결을 지원합니다. 지연이나 끊김 없이 원활한 사용이 가능합니다.</p>\n<p>컴퓨터 사용 조건과 환경에 따라 무선 연결 범위의 편차가 존재할 수 있습니다.</p></p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-right\">\n<div class=\"key-features-media\">\n<img alt=\"\" class=\"media-img\" src=\"https://assets.logitech.com/assets/64193/2/m170-reliable-wireless-connectivity.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3> 12개월의 배터리 수명</h3>\n<p><p>배터리 교체 없이 최대 1년간 사용이 가능합니다. 배터리 수명을 연장하려면 사용하지 않을 때 켜기/끄기 스위치를 사용해 전원을 꺼두십시오.</p>\n<p>배터리 수명은 컴퓨터 사용 조건과 마우스 사용 방식에 따라 약간의 차이가 날 수 있습니다.</p></p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-left\">\n<div class=\"key-features-media\">\n<img alt=\"\" class=\"media-img\" src=\"https://assets.logitech.com/assets/64193/3/m170-reliable-wireless-connectivity.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3> 플러그 앤 플레이 연결</h3>\n<p>M170/M171 무선 마우스는 진정한 플러그 앤 플레이를 실현합니다. 수신기를 컴퓨터의 USB 포트에 꽂기만 하면 바로 사용이 가능합니다. 사용을 위해 마우스를 페어링하거나 소프트웨어를 다운로드할 필요가 없습니다.<a class=\"footnote\">1</a></p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-right\">\n<div class=\"key-features-media\">\n<img alt=\"\" class=\"media-img\" src=\"https://assets.logitech.com/assets/64193/4/m170-reliable-wireless-connectivity.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3> 편안함과 이동성</h3>\n<p>마우스의 디자인은 장시간 동안 편안하게 사용할 수 있도록 손을 효과적으로 지탱해줍니다. 입체적인 디자인과 좌/우 버튼 재지정 기능 덕분에 오른손잡이와 왼손잡이 모두 M170/M171 마우스를 사용할 수 있습니다.</p>\n</div>\n</div>\n</li>\n</ul>\n</div>\n</section>',1,3),(4,'<section aria-label=\"주요 기능\" class=\"product-key-features\">\n<div class=\"container\">\n<h6 class=\"product-key-features-title\">주요 기능</h6>\n<ul class=\"key-features-ctn\">\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-left\">\n<div class=\"key-features-media\">\n<img alt=\"\" class=\"media-img\" src=\"https://assets.logitech.com/assets/65477/48/wireless-ultra-portable-m187-refresh.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3>언제 어디서든 휴대가 간편한 초소형</h3>\n<p>주머니에 들어가는 컴팩트한 디자인으로 노트북과 함께 어디든지 간편하게 휴대할 수 있습니다.</p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-right\">\n<div class=\"key-features-media\">\n<img alt=\"\" class=\"media-img\" src=\"https://assets.logitech.com/assets/65477/49/wireless-ultra-portable-m187-refresh.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3>안정적인 무선 연결</h3>\n<p>더 이상 선이 필요하지 않습니다. 지연이나 끊김 없는 무선의 편리함을 즐겨보십시오(최대 10미터)</p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-left\">\n<div class=\"key-features-media\">\n<img alt=\"\" class=\"media-img\" src=\"https://assets.logitech.com/assets/65477/45/wireless-ultra-portable-m187-refresh.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3>초소형 나노 수신기</h3>\n<p>초소형의 나노 수신기는 USB 포트에 꽂아둔 채 이동이 가능하여, 분실이나 파손의 염려가 없습니다. 또한 마우스 안에는 수신기를 보관할 수 있는 별도의 공간이 있습니다.</p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-right\">\n<div class=\"key-features-media\">\n<img alt=\"\" class=\"media-img\" src=\"https://assets.logitech.com/assets/65477/50/wireless-ultra-portable-m187-refresh.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3>로지텍의 신뢰성</h3>\n<p>전 세계 마우스 시장의 리더 로지텍이 최고의 품질과 신뢰성을 보장합니다. 3년 제한 하드웨어 보증 서비스를 누리십시오.</p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-left\">\n<div class=\"key-features-media\">\n<img alt=\"\" class=\"media-img\" src=\"https://assets.logitech.com/assets/65477/51/wireless-ultra-portable-m187-refresh.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3>모든 운영 체제와 호환</h3>\n<p>Windows<sup>®</sup>, Mac, Chrome<sup>®</sup>, Linux<sup>®</sup>와 호환됩니다. 기존 컴퓨터와 앞으로 출시될 컴퓨터 어디에서나 믿고 사용할수 있습니다.</p>\n</div>\n</div>\n</li>\n</ul>\n</div>\n</section>',1,4),(5,'<section aria-label=\"주요 기능\" class=\"product-key-features\">\n<div class=\"container\">\n<h6 class=\"product-key-features-title\">주요 기능</h6>\n<ul class=\"key-features-ctn\">\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-left\">\n<div class=\"key-features-media\">\n<img alt=\"\" class=\"media-img\" src=\"https://assets.logitech.com/assets/64704/m720-triathlon-mouse.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3> 이지-스위치 기능</h3>\n<p>마우스를 각기 다른 3대의 컴퓨터와 페어링한 뒤, 엄지손가락 하단에 위치한 버튼을 눌러 기기 간의 원활한 전환이 가능합니다. 3개의 숫자 LED 인디케이터로 현재 연결된 기기를 직관적으로 확인할 수 있습니다.</p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-right\">\n<div class=\"key-features-media\">\n<img alt=\"\" class=\"media-img\" src=\"https://assets.logitech.com/assets/64704/2/m720-triathlon-mouse.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3> 초고속 스크롤링</h3>\n<p>초고속 스크롤 휠을 사용하여 긴 문서와 웹페이지를 빠르게 넘나들며 필요한 정보를 탐색하십시오. 보다 정밀한 탐색이 가능한 클릭 투 클릭 방식의 스크롤로 언제든지 전환이 가능합니다.</p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-left\">\n<div class=\"key-features-media\">\n<img alt=\"\" class=\"media-img\" src=\"https://assets.logitech.com/assets/64704/3/m720-triathlon-mouse.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3> 우수한 내구성의 입체적인 디자인</h3>\n<p>최대 1000만 번의 클릭을 견딜 수 있는 M720의 튼튼한 내구성은 마치 강인한 육상선수와도 같습니다. 오른손잡이를 위해 디자인된 이 풀사이즈의 마우스는 부드러운 촉감의 고무그립으로 편안한 그립감을 선사합니다.</p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-right\">\n<div class=\"key-features-media\">\n<img alt=\"\" class=\"media-img\" src=\"https://assets.logitech.com/assets/64704/24/m720-triathlon-mouse.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3> 쉽고 편리한 멀티 컴퓨터 환경</h3>\n<p>여러 대의 컴퓨터를 하나의 마우스와 키보드로 엮어주는 Logitech FLOW 기술로 M720의 잠재력을 끌어올리세요. 최대 세 대의 컴퓨터를 넘나들며 마우스 커서를 움직일 수 있으며 텍스트나 이미지, 혹은 파일들을 다른 컴퓨터로 복사/붙여넣기 할 수 있습니다.\n<a class=\"footnote\">1</a><br/><br/><img alt=\"\" height=\"32\" id=\"64704-23-0-1\" src=\"https://assets.logitech.com/assets/64704/23/m720-triathlon-mouse.png\" width=\"74\"/></p>\n<p class=\"text-link\"><a alt=\"Flow 멀티 디바이스 제어 더 알아보기\" class=\"logi-icon-chevron-right\" href=\"https://assets.logitech.com/ko-kr/page/flow-multi-device-control\" target=\"\"><span>Flow 멀티 디바이스 제어 더 알아보기</span></a></p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-left\">\n<div class=\"key-features-media\">\n<img alt=\"\" class=\"media-img\" src=\"https://assets.logitech.com/assets/64704/4/m720-triathlon-mouse.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3> 24개월의 배터리 수명</h3>\n<p>AA 배터리 하나만으로 24개월동안 배터리 교체 없이 마우스를 사용할 수 있습니다. 전원 스위치로 보다 효율적인 전원 관리가 가능하며 배터리 부족 시 LED를 통해 쉽게 확인할 수 있습니다.<a class=\"footnote\">2</a></p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-right\">\n<div class=\"key-features-media\">\n<img alt=\"\" class=\"media-img\" src=\"https://assets.logitech.com/assets/64704/5/m720-triathlon-mouse.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3> 다양한 커스터마이징</h3>\n<p>Logitech Options<sup>™</sup> 소프트웨어를 다운로드하여 Mac OS X 및 Windows<sup>®</sup>에서 사용할 수 있는 풍부한 기능을 모두 활용해 보십시오. 소프트웨어의 단계별 지침을 따라 버튼에 다양한 기능을 할당해 보십시오. 추가 정보 란에서 각종 질문에 대한 답변을 찾아볼 수 있습니다.</p>\n</div>\n</div>\n</li>\n</ul>\n</div>\n</section>',1,5),(6,'<section aria-label=\"주요 기능\" class=\"product-key-features\">\n<div class=\"container\">\n<h6 class=\"product-key-features-title\">주요 기능</h6>\n<ul class=\"key-features-ctn\">\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-left\">\n<div class=\"key-features-media\">\n<img alt=\"\" class=\"media-img\" src=\"https://assets.logitech.com/assets/65530/17/m110-and-b110-silent-mouse.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3>90% 이상 소음 제거</h3>\n<p>클릭음을 90% 이상 감소시키면서 동일한 클릭감을 주는 무소음 마우스로 고요한 작업 환경을 체험해 보십시오. 고급 소재의 마우스 피트와 고무 휠은 부드럽고 조용한 글라이드와 스크롤을 보여드립니다.<a class=\"footnote\">1</a></p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-right\">\n<div class=\"key-features-media\">\n<img alt=\"\" class=\"media-img\" src=\"https://assets.logitech.com/assets/65530/19/m110-and-b110-silent-mouse.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3>간편한 설치와 사용</h3>\n<p>설치가 빠르고 간단합니다. 번거로운 설치 과정이나 소프트웨어 없이 USB 포트에 케이블을 꽂으면 바로 사용이 가능합니다.</p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-left\">\n<div class=\"key-features-media\">\n<img alt=\"\" class=\"media-img\" src=\"https://assets.logitech.com/assets/65530/21/m110-and-b110-silent-mouse.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3>풀 사이즈의 편안함. 양손형 디자인</h3>\n<p>풀 사이즈의 양손 모두을 위한 대칭형 디자인으로 누구나 오랜 시간 편하게 사용할 수 있습니다. 부드러운 곡선 설계는 손가락을 편안하게 받쳐줍니다.</p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-right\">\n<div class=\"key-features-media\">\n<img alt=\"\" class=\"media-img\" src=\"https://assets.logitech.com/assets/65530/22/m110-and-b110-silent-mouse.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3>QUIET MARK 인증</h3>\n<p>로지텍은 세계 최초로 <a href=\"https://assets.logitech.comhttps://www.quietmark.com/\" target=\"_blank\">Quiet Mark</a> 인증을 받은 유일한 마우스 제조업체입니다. 영국 노이즈 감소 협회의 국제 인증 마크가 노이즈 감소 효과를 보장합니다.</p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-left\">\n<div class=\"key-features-media\">\n<img alt=\"\" class=\"media-img\" src=\"https://assets.logitech.com/assets/65530/24/m110-and-b110-silent-mouse.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3>로지텍의 신뢰성</h3>\n<p>전 세계 마우스 시장의 리더 로지텍이 최고의 품질과 신뢰성을 보장합니다. 3년 제한 하드웨어 보증 서비스를 누리십시오.</p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-right\">\n<div class=\"key-features-media\">\n<img alt=\"\" class=\"media-img\" src=\"https://assets.logitech.com/assets/65530/29/m110-and-b110-silent-mouse.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3>터치패드 그 이상</h3>\n<p>뛰어난 반응성의 옵티컬 트래킹으로 커서를 정확하고 매끄럽게 제어할 수 있습니다. 터치패드보다 효율적으로 문서를 편집하고 인터넷을 탐색할 수 있습니다.</p>\n</div>\n</div>\n</li>\n</ul>\n</div>\n</section>',1,6),(7,'<section aria-label=\"주요 기능\" class=\"product-key-features\">\n<div class=\"container\">\n<h6 class=\"product-key-features-title\">주요 기능</h6>\n<ul class=\"key-features-ctn\">\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-left\">\n<div class=\"key-features-media\">\n<img alt=\"\" class=\"media-img\" src=\"https://assets.logitech.com/assets/64492/k780-multi-device-keyboard.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3> 타이핑 및 장치 간 전환</h3>\n<p>컴퓨터에서 보고서를 타이핑하는중, 간단하게 이지 스위치 버튼을 터치하는 것만으로 휴대폰 또는 태블릿으로 전환해 타이핑을 계속할 수 있습니다.<br>\n<br/>\nWindows<sup>®</sup>, Mac, Android<sup>®</sup> 및 iOS(iPhone 및 iPad)호환되는 이 범용 키보드는 연결된 장치의 유형을 인식하며 모든 키가 예상되는 위치에 정확히 배열되어 있습니다.<a class=\"footnote\">1</a></br></p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-right\">\n<div class=\"key-features-media\">\n<img alt=\"\" class=\"media-img\" src=\"https://assets.logitech.com/assets/64492/2/k780-multi-device-keyboard.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3> 모든 기능이 완비된 풀사이즈의 조용한 키보드</h3>\n<p>Logitech PerfectStroke<sup>™</sup> 키 시스템을 사용하여 조용하고 부드러우며 익숙한 타이핑<br/>\n<br/>\n세심히 디자인된 커다란 입체형 키, 편리한 숫자 패드, 자주 이용하는 바로가기 키를 모두 포함한 튼튼한 설계</p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-left\">\n<div class=\"key-features-media\">\n<img alt=\"\" class=\"media-img\" src=\"https://assets.logitech.com/assets/64492/3/k780-multi-device-keyboard.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3> 통합 고무 그립으로 모바일 기기를 지탱</h3>\n<p>스마트폰에서 12\" iPad Pro까지 편안한 읽기 각도와 범위 내에서 다양한 기기를 지탱해 줍니다.<br/>\n<br/>\n책상 공간을 깨끗하고 깔끔하게 유지할 수 있습니다.<a class=\"footnote\">2</a></p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-right\">\n<div class=\"key-features-media\">\n<img alt=\"\" class=\"media-img\" src=\"https://assets.logitech.com/assets/64492/4/k780-multi-device-keyboard.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3> 안정적, 편리성</h3>\n<p>미리 설치되어 있는 AAA 배터리 2개로 24개월 수명 유지, 자동 슬립, 온/오프 버튼, 배터리 상태 표시등<br/>\n<br/>\n무선 커넥터에 대한 2개 옵션 지원: Logitech Unifying<sup>™</sup> USB 수신기 또는 <em>Bluetooth</em><sup>®</sup> Smart 기술.<a class=\"footnote\">3</a></p>\n</div>\n</div>\n</li>\n</ul>\n</div>\n</section>',1,7),(8,'<div class=\"additional-features-rows business\">\n<div class=\"additional-features-header\">\n<h6 class=\"product-key-features-title\">주요 기능</h6>\n</div>\n<div class=\"container\">\n<div class=\"additional-features-body\">\n<div class=\"additional-features-list\">\n<div class=\"additional-features-item\">\n<div class=\"feature-media-ctn\">\n<img alt=\"K480 with Macbook, monitor with Windows display, iPhone and tablet\" src=\"https://assets.logitech.com/assets/52362/3/bluetooth-multi-device-keyboard-k480.jpg\"/>\n</div>\n<h3>최대 3대까지 디바이스 동시 연결</h3>\n<div class=\"feature-content\">\n<p>스마트폰이나 태블릿과 함께 사용하는 새로운 유형의 컴퓨터 키보드.<br>- <em>Bluetooth</em> 무선<br/>\n- 다양한 플랫폼과 호환<br/><a class=\"footnote\">1</a></br></p>\n</div>\n</div>\n<div class=\"additional-features-item\">\n<div class=\"feature-media-ctn\">\n<img alt=\"K480 Easy-Switch dial\" src=\"https://assets.logitech.com/assets/52362/5/bluetooth-multi-device-keyboard-k480.jpg\"/>\n</div>\n<h3>장치 간의 간편한 전환</h3>\n<div class=\"feature-content\">\n<p>이지 스위치 다이얼만 돌리면 연결된 3개의 <em>Bluetooth</em> 무선 장치 중 하나를 선택할 수 있습니다.</p>\n</div>\n</div>\n<div class=\"additional-features-item\">\n<div class=\"feature-media-ctn\">\n<img alt=\"K480 Windows and Mac keys\" src=\"https://assets.logitech.com/assets/52362/7/bluetooth-multi-device-keyboard-k480.jpg\"/>\n</div>\n<h3>Windows 및 Mac. Android 및 iOS</h3>\n<div class=\"feature-content\">\n<p>모든 OS에 적합한 키 레이아웃이 적용되어 편리하게 사용할 수 있습니다.<br/>\n- Windows, Mac 또는 Chrome 컴퓨터용<br/>\n- Android 또는 iOS 모바일 장치용.<br/>\n<br/></p>\n</div>\n</div>\n<div class=\"additional-features-item\">\n<div class=\"feature-media-ctn\">\n<img alt=\"Keyboard side view\" src=\"https://assets.logitech.com/assets/52362/9/bluetooth-multi-device-keyboard-k480.jpg\"/>\n</div>\n<h3>편안한 타이핑</h3>\n<div class=\"feature-content\">\n<p>통합 거치대를 통해 휴대폰이나 태블릿을 가장 편안한 각도로 유지할 수 있습니다.<a class=\"footnote\">2</a></p>\n</div>\n</div>\n<div class=\"additional-features-item\">\n<h3>K480 설치 설명서</h3>\n<div class=\"feature-content\">\n<p>이미 k480이 있으십니까?\n\n\n\n\n<a href=\"https://assets.logitech.com/ko-kr/manuals/k480-immersion-guide\" target=\"_blank\">여기서</a> 온라인 설치 설명서 참조</p>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>',1,8),(9,'<div class=\"additional-features-rows business\">\n<div class=\"additional-features-header\">\n<h6 class=\"product-key-features-title\">주요 기능</h6>\n</div>\n<div class=\"container\">\n<div class=\"additional-features-body\">\n<div class=\"additional-features-list\">\n<div class=\"additional-features-item\">\n<h3>전원 표시등</h3>\n<div class=\"feature-content\">\n<p>배터리의 불편함을 말끔히 해소. 태양광으로 키보드를 충전하고 사용할 수 있습니다. 실내에서도 가능합니다.</p>\n<p class=\"text-link\">\n<a alt=\"비디오 시청\" class=\"logi-icon-chevron-right\" href=\"https://assets.logitech.comhttps://www.youtube.com/watch?v=jI5BlVBNe2c\" target=\"_blank\"><span>비디오 시청</span></a>\n</p>\n</div>\n</div>\n<div class=\"additional-features-item\">\n<h3>유선형 디자인</h3>\n<div class=\"feature-content\">\n<p>이 세련된 키보드 덕분에 책상을 보다 멋지게 꾸밀 수 있습니다.</p>\n</div>\n</div>\n<div class=\"additional-features-item\">\n<h3>편안한 타이핑</h3>\n<div class=\"feature-content\">\n<p>노트북에서 타이핑하는 느낌과 거의 비슷하면서도 더 편안합니다.</p>\n</div>\n</div>\n<div class=\"additional-features-item\">\n<h3>전원 모니터 앱</h3>\n<div class=\"feature-content\">\n<p>배터리 전원이 얼마나 남았는지 알고 싶으십니까? 또는 책상 램프에서 어느 정도의 전원을 얻고 있는지 궁금하십니까? 로지텍 Solar App을 통해 알 수 있습니다.</p>\n<p class=\"text-link\">\n<a alt=\"로지텍 Solar App에 대한 추가 정보\" class=\"logi-icon-chevron-right\" href=\"https://assets.logitech.com/ko-kr/68/8603\" target=\"\"><span>로지텍 Solar App에 대한 추가 정보</span></a>\n</p>\n</div>\n</div>\n<div class=\"additional-features-item\">\n<h3>하나의 무선 수신기에 6개 장치 연결 가능</h3>\n<div class=\"feature-content\">\n<p>초소형 로지텍 Unifying 수신기를 노트북에 꽂아둔 채로 이동이 가능합니다. 장치를 더 추가할 수도 있습니다. 간편한 설치. 자유로운 이동. 다양한 장치 추가. 로지텍 Unifying 수신기에 대한 추가 정보.</p>\n<p class=\"text-link\">\n<a alt=\"Unifying에 대한 추가 정보\" class=\"logi-icon-chevron-right\" href=\"https://assets.logitech.com/ko-kr/promotions/6072\" target=\"\"><span>Unifying에 대한 추가 정보</span></a>\n</p>\n<p class=\"text-link\">\n<a alt=\"Unifying 소프트웨어 다운로드\" class=\"logi-icon-chevron-right\" href=\"https://assets.logitech.com/ko-kr/support/6254?section=downloads\" target=\"\"><span>Unifying 소프트웨어 다운로드</span></a>\n</p>\n</div>\n</div>\n<div class=\"additional-features-item\">\n<h3>빛으로 작동하는 키보드</h3>\n<div class=\"feature-content\">\n<p>번거로운 배터리 교체 작업이 전혀 필요 없습니다. 이 키보드는 빛만 있으면 자체 충전되며 완전히 깜깜한 곳에서도 3개월 이상 충전된 상태를 유지합니다. 번거롭게 배터리를 교체해야 하는 시대는 지난 것입니다.</p>\n</div>\n</div>\n<div class=\"additional-features-item\">\n<h3>7.5mm(1/3인치)에 불과한 두께</h3>\n<div class=\"feature-content\">\n<p>세련된 라인, 얇은 두께의 이 유선형 키보드는 노트북과 함께 사용하든 데스크탑과 함께 사용하든 작업공간을 더욱 돋보이게 합니다.</p>\n</div>\n</div>\n<div class=\"additional-features-item\">\n<h3>좋은 터치감</h3>\n<div class=\"feature-content\">\n<p>일반 키보드, 노트북 및 Logitech의 오목한 키 캡 디자인 같은 장점만을 결합했으므로 몇 시간씩 작업을 계속해도 빠르고 조용한 좋은 터치감을 유지할 수 있습니다.</p>\n</div>\n</div>\n<div class=\"additional-features-item\">\n<h3>고급 2.4GHz 무선 연결 기술</h3>\n<div class=\"feature-content\">\n<p>지연, 중단, 간섭이 거의 제거된 원거리 무선 연결을 통해 편안한 소파 등 원하는 곳 어디서나 엔터테인먼트를 즐기거나 작업할 수 있습니다.</p>\n</div>\n</div>\n<div class=\"additional-features-item\">\n<h3>Logitech Solar App</h3>\n<div class=\"feature-content\">\n<p>배터리 잔량과 충전 필요 여부를 알려주며, 조도계를 통해 필요한 광원의 양을 표시해주어 더욱 편리합니다.</p>\n</div>\n</div>\n<div class=\"additional-features-item\">\n<h3>Logitech Unifying 수신기</h3>\n<div class=\"feature-content\">\n<p>크기가 매우 작기 때문에 노트북에 장착한 상태로 사용할 수 있습니다. 또한 USB 수신기 여러 개를 복잡하게 연결할 필요 없이 호환되는 무선 마우스나 키보드를 손쉽게 추가할 수 있습니다.</p>\n<p class=\"text-link\">\n<a alt=\"Unifying 수신기에 대해 자세히 알아보십시오.\" class=\"logi-icon-chevron-right\" href=\"https://assets.logitech.com/ko-kr/promotions/6072\" target=\"\"><span>Unifying 수신기에 대해 자세히 알아보십시오.</span></a>\n</p>\n</div>\n</div>\n<div class=\"additional-features-item\">\n<h3>간단한 플러그 앤 플레이 방식</h3>\n<div class=\"feature-content\">\n<p>설치가 간단합니다. 무선 수신기를 컴퓨터의 USB 포트에 연결하기만 하면 소프트웨어 없이도 바로 키보드를 사용할 수 있습니다.</p>\n</div>\n</div>\n<div class=\"additional-features-item\">\n<h3>작은 출발, 밟은 미래</h3>\n<div class=\"feature-content\">\n<p>PVC를 사용하지 않은(PVC-free) 구조에서 완전히 재활용 가능한 상자에 이르기까지 이 키보드는 탄소 배출량을 최소화하도록 설계되었습니다.</p>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>',1,9),(10,'<div class=\"additional-features-rows business\">\n<div class=\"additional-features-header\">\n<h6 class=\"product-key-features-title\">주요 기능</h6>\n</div>\n<div class=\"container\">\n<div class=\"additional-features-body\">\n<div class=\"additional-features-list\">\n<div class=\"additional-features-item\">\n<div class=\"feature-media-ctn\">\n<img alt=\"\" src=\"https://assets.logitech.com/assets/53658/3/wireless-touch-keyboard-k400-plus.jpg\"/>\n</div>\n<h3>편안한 제어를 위해 설계</h3>\n<div class=\"feature-content\">\n<p>PC-TV 엔터테인먼트가 힘든 일이 되어서는 안 됩니다. 소파에 기대어 편안하게 TV에 연결된 컴퓨터를 탐색할 수 있습니다.</p>\n</div>\n</div>\n<div class=\"additional-features-item\">\n<div class=\"feature-media-ctn\">\n<img alt=\"\" src=\"https://assets.logitech.com/assets/53658/5/wireless-touch-keyboard-k400-plus.jpg\"/>\n</div>\n<h3>터치패드가 있는 통합 무선 키보드</h3>\n<div class=\"feature-content\">\n<p>선이 복잡하게 얽혀 있는 별도의 키보드나 마우스 없이 PC-TV 엔터테인먼트를 원활하게 제어할 수 있습니다.편안하고 조용한 키와 대형(3.5인치) 키패드는 탐색을 손쉽게 만들어줍니다.</p>\n</div>\n</div>\n<div class=\"additional-features-item\">\n<div class=\"feature-media-ctn\">\n<img alt=\"\" src=\"https://assets.logitech.com/assets/53658/7/wireless-touch-keyboard-k400-plus.jpg\"/>\n</div>\n<h3>10미터(33피트) 무선 범위</h3>\n<div class=\"feature-content\">\n<p>지연이나 끊김 없이 비디오를 시청하고, 웹을 검색하거나 친구와 채팅하는 등 다채로운 기능을 누릴 수 있습니다.<ul>\n<li>대형 공간에서도 빠른 반응과 문제 없는 연결을 경험할 수 있습니다. </li>\n<li>무선 범위는 작동 환경 및 컴퓨터 설정에 따라 다를 수 있습니다.</li>\n</ul></p>\n</div>\n</div>\n<div class=\"additional-features-item\">\n<div class=\"feature-media-ctn\">\n<img alt=\"\" src=\"https://assets.logitech.com/assets/53658/9/wireless-touch-keyboard-k400-plus.jpg\"/>\n</div>\n<h3>미디어 지원 TV 키보드</h3>\n<div class=\"feature-content\">\n<p>K400 플러스는 즉시 편안하게 사용이 가능합니다. 편안한 미디어 상호 작용을 위해 레이아웃이 디자인되었습니다.<ul>\n<li>볼륨 컨트롤와 화살표 키에 쉽게 접근할 수 있습니다.</li>\n<li>두 번째 왼쪽 클릭 버튼을 이용하면 양손으로 탐색하여 선택이 가능합니다.</li>\n<li>Windows<sup>®</sup> 및 Android<sup>™</sup> 사용자를 위한 바로가기.</li>\n<li>별도의 구성 없이 단축키가 바로 작동합니다.</li>\n</ul></p>\n</div>\n</div>\n<div class=\"additional-features-item\">\n<div class=\"feature-media-ctn\">\n<img alt=\"\" src=\"https://assets.logitech.com/assets/53658/11/wireless-touch-keyboard-k400-plus.jpg\"/>\n</div>\n<h3>플러그 앤 플레이 설정</h3>\n<div class=\"feature-content\">\n<p>K400 플러스 설치는 매우 간단합니다. 소형 Unifying 수신기를 USB 포트에 꽂기만 하면 바로 사용을 시작할 수 있습니다.키보드 수신기를 사용해 최대 6대의 Unifying 장치를 컴퓨터에 연결할 수 있습니다.</p>\n<p class=\"text-link\">\n<a alt=\"Unifying 소프트웨어에 대한 추가 정보 및 다운로드\" class=\"logi-icon-chevron-right\" href=\"https://assets.logitech.com/ko-kr/promotions/6072\" target=\"\"><span>Unifying 소프트웨어에 대한 추가 정보 및 다운로드</span></a>\n</p>\n</div>\n</div>\n<div class=\"additional-features-item\">\n<div class=\"feature-media-ctn\">\n<img alt=\"\" src=\"https://assets.logitech.com/assets/53658/13/wireless-touch-keyboard-k400-plus.jpg\"/>\n</div>\n<h3>18개월의 배터리 수명</h3>\n<div class=\"feature-content\">\n<p>이 키보드에 배터리가 필요하다는 사실을 잊어버릴 것입니다.<ul>\n<li>실제로 배터리를 교체하는 일이 말끔히 사라집니다.</li>\n<li>켜기/끄기 스위치로 배터리 수명을 한층 더 연장할 수 있습니다.</li>\n<li>배터리 수명은 하루 2시간 동안 사용하여 독립적으로 테스트되었습니다. 실제 배터리 수명은 사용, 설정 및 환경 조건에 따라 달라집니다.</li>\n</ul></p>\n</div>\n</div>\n<div class=\"additional-features-item\">\n<div class=\"feature-media-ctn\">\n<img alt=\"\" src=\"https://assets.logitech.com/assets/53658/15/wireless-touch-keyboard-k400-plus.jpg\"/>\n</div>\n<h3>여러 운영 체제에서 작동</h3>\n<div class=\"feature-content\">\n<p>Windows<sup>®</sup> 7, Windows 8, Windows 10 이상, Android<sup>™</sup> 5.0 이상 및 Chrome OS<sup>™</sup>에서 사용할 수 있도록 설계되었습니다.</p>\n</div>\n</div>\n<div class=\"additional-features-item\">\n<div class=\"feature-media-ctn\">\n<img alt=\"\" src=\"https://assets.logitech.com/assets/53658/17/wireless-touch-keyboard-k400-plus.jpg\"/>\n</div>\n<h3>커스터마이징 가능한 컨트롤</h3>\n<div class=\"feature-content\">\n<p>K400 플러스를 그대로 사용하거나 Logitech Options<sup>™</sup> 소프트웨어를 사용해 키와 터치패드 설정을 원하는 대로 구성할 수 있습니다.</p>\n<p class=\"text-link\">\n<a alt=\"무선 터치 K400 플러스 키보드 더 알아보기\" class=\"logi-icon-chevron-right\" href=\"https://assets.logitech.comhttp://support.logitech.com/ko-kr/product/11928#download\" target=\"_blank\"><span>무선 터치 K400 플러스 키보드 더 알아보기</span></a>\n</p>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>',1,10),(11,'<section aria-label=\"주요 기능\" class=\"product-key-features\">\n<div class=\"container\">\n<h6 class=\"product-key-features-title\">주요 기능</h6>\n<ul class=\"key-features-ctn\">\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-left\">\n<div class=\"key-features-media\">\n<img alt=\"\" class=\"media-img\" src=\"https://assets.logitech.com/assets/64879/38/k375s-multidevice-keyboard.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3> 타이핑 및 장치 간 전환</h3>\n<p>컴퓨터에서 타이핑을 시작한 다음, 이지 스위치 버튼을 터치하는 것만으로 휴대폰 또는 태블릿으로 전환할 수 있습니다. K375s 멀티-디바이스는 Windows<sup>®</sup>, Mac, Chrome<sup>™</sup>, Android<sup>®</sup>, iOS를 포함하여 널리 이용되는 브랜드와 운영 체제에서 작동합니다.<a class=\"footnote\">1</a></p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-right\">\n<div class=\"key-features-media\">\n<img alt=\"\" class=\"media-img\" src=\"https://assets.logitech.com/assets/64879/2/k375s-multidevice-keyboard.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3> 소음이 적고 편안한 타이핑</h3>\n<p>익숙한 레이아웃에 오목한 키가 자리잡고 있는 풀사이즈 키보드는 장시간 사용에도 편안한 타이핑을 제공합니다. 10-키 숫자 패드는 작업 속도를 높여주고, 기울기 다리는 두 가지의 타이핑 각도를 제공합니다.</p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-left\">\n<div class=\"key-features-media\">\n<img alt=\"\" class=\"media-img\" src=\"https://assets.logitech.com/assets/64879/36/k375s-multidevice-keyboard.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3> 범용 휴대폰 및 태블릿 스탠드</h3>\n<p>휴대폰 또는 태블릿을 위한 이 공간 절약형 스탠드로 책상을 깔끔하게 정리할 수 있습니다. 타이핑하는 데 완벽한 각도로 다양한 종류의 장치를 확실히 고정시켜 줍니다. 미끄럼 방지 고무 구조는 이동식 화면을 안정적으로 유지해주며, 휴대폰 또는 태블릿 홈 키에 손쉽게 액세스할 수 있도록 디자인되었습니다..<a class=\"footnote\">2</a></p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-right\">\n<div class=\"key-features-media\">\n<img alt=\"\" class=\"media-img\" src=\"https://assets.logitech.com/assets/64879/4/k375s-multidevice-keyboard.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3> 튼튼한 내구성과 편리성</h3>\n<p>K375s 멀티-디바이스는 액체 유입 방지<a class=\"footnote\">3a</a> 설계로 되어 있으며 내구성이 튼튼합니다. 24개월 배터리 수명<a class=\"footnote\">3b</a> 과 자동 슬립 및 켜기/끄기 스위치는 장시간 사용에도 편리함을 선사합니다.</p>\n</div>\n</div>\n</li>\n<li class=\"key-features-item\">\n<div class=\"key-features-media-ctn pull-left\">\n<div class=\"key-features-media\">\n<img alt=\"\" class=\"media-img\" src=\"https://assets.logitech.com/assets/64879/37/k375s-multidevice-keyboard.jpg\">\n</img></div>\n</div>\n<div class=\"key-features-copy-ctn\">\n<div class=\"key-features-copy\">\n<h3> 안정적인 무선 연결</h3>\n<p>작은 로지텍 Unifying 수신기를 사용해 컴퓨터에 연결하고, <em>Bluetooth</em><sup>®</sup> Smart 기술을 통해 휴대폰 또는 태블릿에 연결할 수 있습니다. 무선 K375s는 빠른 데이터 전송, 무선 암호화와 함께 최대 10미터 범위의 무선 기능을 지원하며 지연이나 끊김이 없습니다.<a class=\"footnote\">4</a></p>\n</div>\n</div>\n</li>\n</ul>\n</div>\n</section>',1,11);
/*!40000 ALTER TABLE `product_descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_filters`
--

DROP TABLE IF EXISTS `product_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_filters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filter_list_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_filters_filter_list_id_606624cd_fk_filter_lists_id` (`filter_list_id`),
  KEY `product_filters_product_id_d21183d8_fk_products_id` (`product_id`),
  CONSTRAINT `product_filters_filter_list_id_606624cd_fk_filter_lists_id` FOREIGN KEY (`filter_list_id`) REFERENCES `filter_lists` (`id`),
  CONSTRAINT `product_filters_product_id_d21183d8_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_filters`
--

LOCK TABLES `product_filters` WRITE;
/*!40000 ALTER TABLE `product_filters` DISABLE KEYS */;
INSERT INTO `product_filters` VALUES (1,3,1),(2,4,1),(3,5,1),(4,7,1),(5,10,1),(6,11,1),(7,13,1),(8,14,1),(9,15,1),(10,16,1),(11,17,1),(12,18,1),(13,21,1),(14,22,1),(15,23,1),(16,25,1),(17,27,1),(18,30,1),(19,31,1),(20,32,1),(21,33,1),(22,34,1),(23,3,2),(24,4,2),(25,7,2),(26,10,2),(27,11,2),(28,13,2),(29,14,2),(30,15,2),(31,16,2),(32,17,2),(33,18,2),(34,22,2),(35,23,2),(36,25,2),(37,27,2),(38,30,2),(39,31,2),(40,32,2),(41,33,2),(42,34,2),(43,4,3),(44,7,3),(45,9,3),(46,10,3),(47,11,3),(48,12,3),(49,13,3),(50,14,3),(51,15,3),(52,30,3),(53,31,3),(54,32,3),(55,4,4),(56,7,4),(57,9,4),(58,10,4),(59,11,4),(60,12,4),(61,13,4),(62,14,4),(63,15,4),(64,30,4),(65,31,4),(66,32,4),(67,3,5),(68,4,5),(69,5,5),(70,8,5),(71,10,5),(72,11,5),(73,13,5),(74,14,5),(75,15,5),(76,16,5),(77,17,5),(78,18,5),(79,22,5),(80,23,5),(81,25,5),(82,26,5),(83,27,5),(84,30,5),(85,31,5),(86,32,5),(87,33,5),(88,34,5),(89,8,6),(90,9,6),(91,10,6),(92,11,6),(93,12,6),(94,13,6),(95,14,6),(96,19,6),(97,21,6),(98,30,6),(99,31,6),(100,32,6),(101,37,7),(102,38,7),(103,39,7),(104,42,7),(105,44,7),(106,45,7),(107,46,7),(108,47,7),(109,48,7),(110,49,7),(111,50,7),(112,51,7),(113,55,7),(114,56,7),(115,57,7),(116,62,7),(117,37,8),(118,38,8),(119,39,8),(120,42,8),(121,44,8),(122,45,8),(123,46,8),(124,47,8),(125,48,8),(126,49,8),(127,50,8),(128,51,8),(129,57,8),(130,62,8),(131,38,9),(132,40,9),(133,44,9),(134,60,9),(135,61,9),(136,38,10),(137,39,10),(138,41,10),(139,44,10),(140,48,10),(141,61,10),(142,36,11),(143,37,11),(144,38,11),(145,39,11),(146,41,11),(147,44,11),(148,45,11),(149,46,11),(150,47,11),(151,48,11),(152,49,11),(153,51,11),(154,52,11),(155,53,11),(156,54,11),(157,55,11),(158,56,11),(159,57,11),(160,58,11),(161,59,11),(162,61,11),(163,37,12),(164,38,12),(165,40,12),(166,41,12),(167,44,12),(168,45,12),(169,46,12),(170,48,12),(171,57,12),(172,62,12);
/*!40000 ALTER TABLE `product_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(10000) DEFAULT NULL,
  `order` int DEFAULT NULL,
  `color_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_color_id_9a6ab018_fk_colors_id` (`color_id`),
  KEY `product_images_product_id_28ebf5f0_fk_products_id` (`product_id`),
  CONSTRAINT `product_images_color_id_9a6ab018_fk_colors_id` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`),
  CONSTRAINT `product_images_product_id_28ebf5f0_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,'https://assets.logitech.com/assets/65123/wireless-mouse-m590-multi-device-silent.png',1,1,1),(2,'https://assets.logitech.com/assets/65123/2/wireless-mouse-m590-multi-device-silent.png',1,1,1),(3,'https://assets.logitech.com/assets/65123/3/wireless-mouse-m590-multi-device-silent.png',1,1,1),(4,'https://assets.logitech.com/assets/65123/4/wireless-mouse-m590-multi-device-silent.png',1,1,1),(5,'https://assets.logitech.com/assets/65122/wireless-mouse-m585-multi-device.png',1,2,2),(6,'https://assets.logitech.com/assets/65122/2/wireless-mouse-m585-multi-device.png',1,2,2),(7,'https://assets.logitech.com/assets/65122/3/wireless-mouse-m585-multi-device.png',1,2,2),(8,'https://assets.logitech.com/assets/65122/4/wireless-mouse-m585-multi-device.png',1,2,2),(9,'https://assets.logitech.com/assets/64193/32/m170-reliable-wireless-connectivity.png',1,3,3),(10,'https://assets.logitech.com/assets/64193/33/m170-reliable-wireless-connectivity.png',1,3,3),(11,'https://assets.logitech.com/assets/64193/34/m170-reliable-wireless-connectivity.png',1,3,3),(12,'https://assets.logitech.com/assets/64193/35/m170-reliable-wireless-connectivity.png',1,3,3),(13,'https://assets.logitech.com/assets/65477/wireless-ultra-portable-m187-refresh.png',1,5,4),(14,'https://assets.logitech.com/assets/65477/2/wireless-ultra-portable-m187-refresh.png',1,5,4),(15,'https://assets.logitech.com/assets/65477/3/wireless-ultra-portable-m187-refresh.png',1,5,4),(16,'https://assets.logitech.com/assets/65477/4/wireless-ultra-portable-m187-refresh.png',1,5,4),(17,'https://assets.logitech.com/assets/64704/6/m720-triathlon-mouse.png',1,15,5),(18,'https://assets.logitech.com/assets/64704/7/m720-triathlon-mouse.png',1,15,5),(19,'https://assets.logitech.com/assets/64704/8/m720-triathlon-mouse.png',1,15,5),(20,'https://assets.logitech.com/assets/64704/9/m720-triathlon-mouse.png',1,15,5),(21,'https://assets.logitech.com/assets/64704/15/m720-triathlon-mouse.jpg',1,15,5),(22,'https://assets.logitech.com/assets/65530/m110-and-b110-silent-mouse.png',1,15,6),(23,'https://assets.logitech.com/assets/65530/2/m110-and-b110-silent-mouse.png',1,15,6),(24,'https://assets.logitech.com/assets/65530/3/m110-and-b110-silent-mouse.png',1,15,6),(25,'https://assets.logitech.com/assets/65530/4/m110-and-b110-silent-mouse.png',1,15,6),(26,'https://assets.logitech.com/assets/64492/9/k780-multi-device-keyboard.png',1,15,7),(27,'https://assets.logitech.com/assets/64492/12/k780-multi-device-keyboard.png',1,15,7),(28,'https://assets.logitech.com/assets/64492/13/k780-multi-device-keyboard.png',1,15,7),(29,'https://assets.logitech.com/assets/64492/14/k780-multi-device-keyboard.png',1,15,7),(30,'https://assets.logitech.com/assets/54261/bluetooth-multi-device-keyboard-k480.png',1,5,8),(31,'https://assets.logitech.com/assets/54263/bluetooth-multi-device-keyboard-k480.png',1,5,8),(32,'https://assets.logitech.com/assets/54264/bluetooth-multi-device-keyboard-k480.png',1,5,8),(33,'https://assets.logitech.com/assets/54265/bluetooth-multi-device-keyboard-k480.png',1,5,8),(34,'https://assets.logitech.com/assets/55143/k750-gallery.png',1,15,9),(35,'https://assets.logitech.com/assets/55144/k750-gallery.png',1,15,9),(36,'https://assets.logitech.com/assets/55145/k750-gallery.png',1,15,9),(37,'https://assets.logitech.com/assets/55146/k750-gallery.png',1,15,9),(38,'https://assets.logitech.com/assets/54246/wireless-touch-keyboard-k400-plus.png',1,15,10),(39,'https://assets.logitech.com/assets/54248/wireless-touch-keyboard-k400-plus.jpg',1,15,10),(40,'https://assets.logitech.com/assets/54249/wireless-touch-keyboard-k400-plus.jpg',1,15,10),(41,'https://assets.logitech.com/assets/54252/wireless-touch-keyboard-k400-plus.png',1,15,10),(42,'https://assets.logitech.com/assets/64879/21/k375s-multidevice-keyboard.png',1,15,11),(43,'https://assets.logitech.com/assets/64879/22/k375s-multidevice-keyboard.png',1,15,11),(44,'https://assets.logitech.com/assets/64879/23/k375s-multidevice-keyboard.png',1,15,11),(45,'https://assets.logitech.com/assets/65123/5/wireless-mouse-m590-multi-device-silent.png',2,6,1),(46,'https://assets.logitech.com/assets/65123/6/wireless-mouse-m590-multi-device-silent.png',2,6,1),(47,'https://assets.logitech.com/assets/65123/7/wireless-mouse-m590-multi-device-silent.png',2,6,1),(48,'https://assets.logitech.com/assets/65123/8/wireless-mouse-m590-multi-device-silent.png',2,6,1),(49,'https://assets.logitech.com/assets/65122/5/wireless-mouse-m585-multi-device.png',2,7,2),(50,'https://assets.logitech.com/assets/65122/6/wireless-mouse-m585-multi-device.png',2,7,2),(51,'https://assets.logitech.com/assets/65122/7/wireless-mouse-m585-multi-device.png',2,7,2),(52,'https://assets.logitech.com/assets/65122/8/wireless-mouse-m585-multi-device.png',2,7,2),(53,'https://assets.logitech.com/assets/64193/8/m170-reliable-wireless-connectivity.png',2,8,3),(54,'https://assets.logitech.com/assets/64193/33/m170-reliable-wireless-connectivity.png',2,8,3),(55,'https://assets.logitech.com/assets/64193/34/m170-reliable-wireless-connectivity.png',2,8,3),(56,'https://assets.logitech.com/assets/64193/35/m170-reliable-wireless-connectivity.png',2,8,3),(57,'https://assets.logitech.com/assets/65477/5/wireless-ultra-portable-m187-refresh.png',2,9,4),(58,'https://assets.logitech.com/assets/65477/6/wireless-ultra-portable-m187-refresh.png',2,9,4),(59,'https://assets.logitech.com/assets/65477/7/wireless-ultra-portable-m187-refresh.png',2,9,4),(60,'https://assets.logitech.com/assets/65477/8/wireless-ultra-portable-m187-refresh.png',2,9,4),(61,'https://assets.logitech.com/assets/65722/5/new-gallery-and-glamour-image.png',2,10,8),(62,'https://assets.logitech.com/assets/65722/6/new-gallery-and-glamour-image.png',2,10,8),(63,'https://assets.logitech.com/assets/65722/7/new-gallery-and-glamour-image.png',2,10,8),(64,'https://assets.logitech.com/assets/65722/8/new-gallery-and-glamour-image.png',2,10,8),(65,'https://assets.logitech.com/assets/65123/9/wireless-mouse-m590-multi-device-silent.png',3,11,1),(66,'https://assets.logitech.com/assets/65123/10/wireless-mouse-m590-multi-device-silent.png',3,11,1),(67,'https://assets.logitech.com/assets/65123/11/wireless-mouse-m590-multi-device-silent.png',3,11,1),(68,'https://assets.logitech.com/assets/65123/12/wireless-mouse-m590-multi-device-silent.png',3,11,1),(69,'https://assets.logitech.com/assets/65123/9/wireless-mouse-m590-multi-device-silent.png',3,11,2),(70,'https://assets.logitech.com/assets/65123/10/wireless-mouse-m590-multi-device-silent.png',3,11,2),(71,'https://assets.logitech.com/assets/65123/11/wireless-mouse-m590-multi-device-silent.png',3,11,2),(72,'https://assets.logitech.com/assets/65123/12/wireless-mouse-m590-multi-device-silent.png',3,11,2),(73,'https://assets.logitech.com/assets/64193/9/m170-reliable-wireless-connectivity.png',3,13,3),(74,'https://assets.logitech.com/assets/64193/33/m170-reliable-wireless-connectivity.png',3,13,3),(75,'https://assets.logitech.com/assets/64193/34/m170-reliable-wireless-connectivity.png',3,13,3),(76,'https://assets.logitech.com/assets/64193/35/m170-reliable-wireless-connectivity.png',3,13,3),(77,'https://assets.logitech.com/assets/65477/56/wireless-ultra-portable-m187-refresh.png',3,14,4),(78,'https://assets.logitech.com/assets/65477/57/wireless-ultra-portable-m187-refresh.png',3,14,4),(79,'https://assets.logitech.com/assets/65477/58/wireless-ultra-portable-m187-refresh.png',3,14,4),(80,'https://assets.logitech.com/assets/65477/59/wireless-ultra-portable-m187-refresh.png',3,14,4);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_list_thumbnails`
--

DROP TABLE IF EXISTS `product_list_thumbnails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_list_thumbnails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `thumbnail_image` varchar(1000) DEFAULT NULL,
  `thumbnail_background_color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_list_thumbnails_product_id_206a0a34` (`product_id`),
  CONSTRAINT `product_list_thumbnails_product_id_206a0a34_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_list_thumbnails`
--

LOCK TABLES `product_list_thumbnails` WRITE;
/*!40000 ALTER TABLE `product_list_thumbnails` DISABLE KEYS */;
INSERT INTO `product_list_thumbnails` VALUES (1,1,'https://www.logitech.com/assets/65123/13/wireless-mouse-m590-multi-device-silent.png','#00ead0'),(2,2,'https://www.logitech.com/assets/65122/13/wireless-mouse-m585-multi-device.png','#ff7f2c'),(3,3,'https://www.logitech.com/assets/64193/17/m170-reliable-wireless-connectivity.png','#814efa'),(4,4,'https://www.logitech.com/assets/65477/31/wireless-ultra-portable-m187-refresh.png','#ff2947'),(5,5,'https://www.logitech.com/assets/64704/10/m720-triathlon-mouse.png','#dcfd00'),(6,6,'https://www.logitech.com/assets/65530/32/m110-and-b110-silent-mouse.png','#814efa'),(7,7,'https://www.logitech.com/assets/64492/10/k780-multi-device-keyboard.png','#dcfd00'),(8,8,'https://www.logitech.com/assets/52404/7/bluetooth-multi-device-keyboard-k480.png','#00b8fc'),(9,9,'https://www.logitech.com/assets/46890/2/glamour-image-lg-emea.png','#00ead0'),(10,10,'https://www.logitech.com/assets/53731/7/wireless-touch-keyboard-k400-plus.png','#814efa'),(11,11,'https://www.logitech.com/assets/64879/30/k375s-multidevice-keyboard.png','#ff7f2c'),(12,12,'https://www.logitech.com/assets/65781/196/mx-keys.png','#ff7f2c');
/*!40000 ALTER TABLE `product_list_thumbnails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_prices`
--

DROP TABLE IF EXISTS `product_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_prices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` int DEFAULT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_prices_product_id_46988f16_fk_products_id` (`product_id`),
  CONSTRAINT `product_prices_product_id_46988f16_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_prices`
--

LOCK TABLES `product_prices` WRITE;
/*!40000 ALTER TABLE `product_prices` DISABLE KEYS */;
INSERT INTO `product_prices` VALUES (1,33000,1),(2,32000,2),(3,12600,3),(4,11500,4),(5,50900,5),(6,8900,6),(7,61850,7),(8,30500,8),(9,75000,9),(10,42960,10),(11,31900,11),(12,139000,12);
/*!40000 ALTER TABLE `product_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_specifications`
--

DROP TABLE IF EXISTS `product_specifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_specifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `specification` varchar(16000) DEFAULT NULL,
  `order` int DEFAULT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_specifications_product_id_17d3589e_fk_products_id` (`product_id`),
  CONSTRAINT `product_specifications_product_id_17d3589e_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_specifications`
--

LOCK TABLES `product_specifications` WRITE;
/*!40000 ALTER TABLE `product_specifications` DISABLE KEYS */;
INSERT INTO `product_specifications` VALUES (1,'<div class=\"tabs\">\n<div class=\"tabs hidden-xs\">\n<!-- Nav tabs -->\n<div class=\"specs-header\">\n<h6>사양 및 세부 정보</h6>\n</div>\n</div>\n<!-- panel content -->\n<div aria-multiselectable=\"true\" class=\"panel-group\" id=\"spec-accordion\" role=\"tablist\">\n<div class=\"panel panel-default\">\n<div class=\"panel-heading visible-xs\" id=\"heading-one\" role=\"tab\">\n<h4 class=\"panel-title\">\n<a aria-controls=\"collapse-one\" aria-expanded=\"true\" data-parent=\"#spec-accordion\" data-toggle=\"collapse\" href=\"https://assets.logitech.com#collapse-one\" role=\"button\">\n\n	                                사양 및 세부 정보 <span aria-hidden=\"true\" class=\"more-less glyphicon glyphicon-minus text-right\"></span>\n</a>\n</h4>\n</div>\n<div aria-expanded=\"true\" aria-labelledby=\"collapse-one\" class=\"panel-collapse collapse in\" id=\"collapse-one\" role=\"tabpanel\">\n<div class=\"panel-body tab-pane\">\n<ul class=\"tabs-list\" data-col=\"3\">\n<li class=\"tab-content-item clearfix\">\n<h3>규격</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<ul>\n<div class=\"cell-group\">\n<h4>마우스</h4>\n<ul>\n<li>높이 x 너비 x 깊이:</li>\n<li>103 mm x 64 mm x 40 mm</li>\n</ul>\n</div>\n<div class=\"cell-group\">\n<ul>\n<li>배터리 포함 무게: 101 g</li>\n</ul>\n</div>\n<div class=\"cell-group\">\n<p></p><h4>Unifying 수신기</h4>\n<ul>\n<li>높이 x 너비 x 깊이:</li>\n<li>14.4 mm x 18.7 mm x 6.1 mm</li>\n</ul>\n</div>\n<div class=\"cell-group\">\n<ul>\n<li>무게: 1.8 g</li>\n</ul>\n</div>\n<!-- lists -->\n</ul>\n</div>\n<!-- general content -->\n<h3>시스템 요구사항</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<ul>\n<p>\n											Windows | Mac | Chrome<sup>®</sup> OS | Linux<sup>®</sup> | iPadOs | Surface™와 호환\n											\n										</p>\n<h4>수신기</h4>\n<p>\n<div>필수: 사용 가능한 USB 포트 </div>\n<div>Windows 10 이상, Windows 8, Windows 7 </div>\n<div>macOS 10.10 이상 </div>\n<div>Chrome OS </div>\n<div>Linux Kernel 2.6+</div>\n</p>\n<h4><em>Bluetooth<sup>®</sup></em></h4>\n<p>\n<div>\n<div>필수: <em>Bluetooth</em> 저에너지 기술 </div>\n<div>Windows 10 이상, Windows 8 </div>\n<div>macOS 10.10 이상 </div>\n<div>Chrome OS </div>\n<div>Android™ 5.0 이상 </div>\n<div>Linux Kernel 2.6+ </div>\n<div>iPadOS 13.1 이상<a class=\"footnote\" href=\"https://assets.logitech.com#footnote3\">3</a></div>\n</div>\n</p>\n</ul>\n</div>\n<!-- footnote -->\n</div>\n</li>\n<li class=\"tab-content-item clearfix\">\n<!-- general content -->\n<h3>사양</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<p>\n										연결 유형:\n										<em>Bluetooth</em> Smart 및 2.4 GHz 무선 연결\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										무선 범위:\n										10m*<br>\n<span class=\"disclaimer\"><em>* 사용 및 컴퓨터 작업 환경에 따라 달라질 수 있습니다.</em></span>\n</br></p>\n</div>\n<div class=\"cell-group\">\n<p>\n										배터리 세부 정보:\n										AA 1개\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										배터리 수명:\n										2년*<br>\n<span class=\"disclaimer\"><em>* 사용 및 컴퓨터 작업 환경에 따라 달라질 수 있습니다.</em></span>\n</br></p>\n</div>\n<div class=\"cell-group\">\n<p>\n										센서:\n										로지텍 고급 옵티컬 센서\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										센서 해상도:\n										1000dpi\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										스크롤 휠:\n										예\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										버튼 수:\n										7\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										버튼:\n										휠 클릭을 지원하는 틸트 휠, 이지 스위치 버튼\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										제스처 기능 (Windows):\n										예\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										제스처 기능 (Mac):\n										예\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										옵션 소프트웨어:\n										Logitech Options 및 Logitech Flow\n										\n									</p>\n</div>\n<!-- footnote -->\n</div>\n</li>\n<li class=\"tab-content-item clearfix\">\n<!-- general content -->\n<h3>보증 정보</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<p>1년 제한 하드웨어 보증</p>\n<!-- lists -->\n<!-- footnote -->\n</div>\n<!-- general content -->\n<h3>패키지 내용물</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<p>\n							\n							M590 Mouse<br>\nAA 배터리 1개(설치되어 있음)<br/>\nUSB 수신기<br/>\n사용 설명서\n							</br></p>\n</div>\n<!-- footnote -->\n</div>\n<!-- general content -->\n<h3>제품 번호</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<p><span class=\"name\">그라파이트 토날:</span> PN: 910-005200</p>\n<p><span class=\"name\">미드 그레이 토날:</span> PN: 910-005201</p>\n<p><span class=\"name\">루비:</span> PN: 910-005202</p>\n<!-- lists -->\n</div>\n</li>\n</ul>\n</div>\n</div>\n</div>\n</div><!-- panel-group -->\n</div>, <div class=\"tabs hidden-xs\">\n<!-- Nav tabs -->\n<div class=\"specs-header\">\n<h6>사양 및 세부 정보</h6>\n</div>\n</div>',1,1),(2,'<div class=\"tabs\">\n<div class=\"tabs hidden-xs\">\n<!-- Nav tabs -->\n<div class=\"specs-header\">\n<h6>사양 및 세부 정보</h6>\n</div>\n</div>\n<!-- panel content -->\n<div aria-multiselectable=\"true\" class=\"panel-group\" id=\"spec-accordion\" role=\"tablist\">\n<div class=\"panel panel-default\">\n<div class=\"panel-heading visible-xs\" id=\"heading-one\" role=\"tab\">\n<h4 class=\"panel-title\">\n<a aria-controls=\"collapse-one\" aria-expanded=\"true\" data-parent=\"#spec-accordion\" data-toggle=\"collapse\" href=\"https://assets.logitech.com#collapse-one\" role=\"button\">\n\n	                                사양 및 세부 정보 <span aria-hidden=\"true\" class=\"more-less glyphicon glyphicon-minus text-right\"></span>\n</a>\n</h4>\n</div>\n<div aria-expanded=\"true\" aria-labelledby=\"collapse-one\" class=\"panel-collapse collapse in\" id=\"collapse-one\" role=\"tabpanel\">\n<div class=\"panel-body tab-pane\">\n<ul class=\"tabs-list\" data-col=\"3\">\n<li class=\"tab-content-item clearfix\">\n<h3>규격</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<ul>\n<div class=\"cell-group\">\n<ul>\n<li>\n<span class=\"name\">높이 x 너비 x 깊이:</span>\n<span class=\"value\">103 mm x 64 mm x 40 mm</span>\n</li>\n</ul>\n</div>\n<div class=\"cell-group\">\n<ul>\n<li>\n<span class=\"name\">무게:</span>\n<span class=\"value\">101 g</span>\n</li>\n</ul>\n</div>\n<!-- lists -->\n</ul>\n</div>\n<!-- general content -->\n<h3>시스템 요구사항</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<ul>\n<p>\n											Windows | Mac | Chrome<sup>®</sup> OS | Linux<sup>®</sup> | iPadOs | Surface™와 호환\n											\n										</p>\n<h4>수신기</h4>\n<p>\n											필수: 사용 가능한 USB 포트<br>\nWindows 10 이상, Windows 8, Windows 7<br/>\nmacOS 10.10 이상<br/>\nChrome OS<br/>\nLinux Kernel 2.6+<br/>\n</br></p>\n<h4><em>Bluetooth</em></h4>\n<p>\n											필수: <em>Bluetooth</em> 저에너지 기술<br/>\nWindows 10 이상, Windows 8<br/>\nmacOS 10.10 이상<br/>\nChrome OS<br/>\nAndroid™ 5.0 이상<br/>\nLinux Kernel 2.6+<br/>\niPadOS 13.1 이상<a class=\"footnote\" href=\"https://assets.logitech.com#footnote3\">3</a><br/>\n</p>\n</ul>\n</div>\n<!-- footnote -->\n</div>\n</li>\n<li class=\"tab-content-item clearfix\">\n<!-- general content -->\n<h3>사양</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<p>\n										연결 유형:\n										<em>Bluetooth</em> Smart 및 2.4GHz 무선 연결\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										무선 범위:\n										10m*<br/>\n<span class=\"disclaimer\">*사용 및 컴퓨터 작업 환경에 따라 달라질 수 있습니다.</span>\n</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										표시등 (LED:\n										배터리와 연결상태 표시등 / 연결채널 LED)\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										전원연결:\n										전원 온/오프 스위치\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										배터리 세부 정보:\n										AA 1개\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										배터리 수명:\n										24개월*<br/>\n<span class=\"disclaimer\">*배터리 수명은 사용자 및 컴퓨터 작업 환경에 따라 다를 수 있습니다.</span>\n</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										DPI(최소/최대):\n										1000±\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										센서:\n										로지텍 고급 옵티컬 센서\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										센서 해상도:\n										1000dpi\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										휠:\n										미니 래칫 4D 옵티컬\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										버튼:\n										휠 클릭을 지원하는 틸트 휠, 이지 스위치 버튼\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										제스처 기능 (Windows):\n										예\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										제스처 기능 (Mac):\n										예\n										\n									</p>\n</div>\n<!-- footnote -->\n</div>\n</li>\n<li class=\"tab-content-item clearfix\">\n<!-- general content -->\n<h3>보증 정보</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<p>1년 제한 하드웨어 보증</p>\n<!-- lists -->\n<!-- footnote -->\n</div>\n<!-- general content -->\n<h3>패키지 내용물</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<p>\n							\n							무선 마우스<br/>\nUnifying 수신기 <br/>\nAA 배터리 1개(설치되어 있음)<br/>\n사용 설명서\n							</p>\n</div>\n<!-- footnote -->\n</div>\n<!-- general content -->\n<h3>제품 번호</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<p><span class=\"name\">그라파이트:</span> PN: 910-005111</p>\n<p><span class=\"name\">회색:</span> PN: 910-005112</p>\n<p><span class=\"name\">루비:</span> PN: 910-005298</p>\n<!-- lists -->\n</div>\n</li>\n</ul>\n</div>\n</div>\n</div>\n</div><!-- panel-group -->\n</div>, <div class=\"tabs hidden-xs\">\n<!-- Nav tabs -->\n<div class=\"specs-header\">\n<h6>사양 및 세부 정보</h6>\n</div>\n</div>',1,2),(3,'<div class=\"tabs\">\n<div class=\"tabs hidden-xs\">\n<!-- Nav tabs -->\n<div class=\"specs-header\">\n<h6>사양 및 세부 정보</h6>\n</div>\n</div>\n<!-- panel content -->\n<div aria-multiselectable=\"true\" class=\"panel-group\" id=\"spec-accordion\" role=\"tablist\">\n<div class=\"panel panel-default\">\n<div class=\"panel-heading visible-xs\" id=\"heading-one\" role=\"tab\">\n<h4 class=\"panel-title\">\n<a aria-controls=\"collapse-one\" aria-expanded=\"true\" data-parent=\"#spec-accordion\" data-toggle=\"collapse\" href=\"https://assets.logitech.com#collapse-one\" role=\"button\">\n\n	                                사양 및 세부 정보 <span aria-hidden=\"true\" class=\"more-less glyphicon glyphicon-minus text-right\"></span>\n</a>\n</h4>\n</div>\n<div aria-expanded=\"true\" aria-labelledby=\"collapse-one\" class=\"panel-collapse collapse in\" id=\"collapse-one\" role=\"tabpanel\">\n<div class=\"panel-body tab-pane\">\n<ul class=\"tabs-list\" data-col=\"3\">\n<li class=\"tab-content-item clearfix\">\n<h3>규격</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<ul>\n<div class=\"cell-group\">\n<ul>\n<li>\n<span class=\"name\">마우스(높이 x 너비 x 깊이):</span>\n<span class=\"value\">97.7 mm(3.85인치) x 61.5 mm(2.42인치) x 35.2 mm(1.39인치)</span>\n</li>\n</ul>\n</div>\n<div class=\"cell-group\">\n<ul>\n<li>\n<span class=\"name\">마우스 무게:</span>\n<span class=\"value\">70.5 g(2.49 oz), 배터리 포함<br>\n<p> </p></br></span>\n</li>\n</ul>\n</div>\n<div class=\"cell-group\">\n<ul>\n<li>\n<span class=\"name\">나노 수신기(높이 x 너비 x 깊이):</span>\n<span class=\"value\">6.6 mm(0.24인치) x 14.4 mm(0.57인치) x 18.7 mm(0.74인치)</span>\n</li>\n</ul>\n</div>\n<div class=\"cell-group\">\n<ul>\n<li>\n<span class=\"name\">나노 수신기 무게:</span>\n<span class=\"value\">2.0 g(0.07 oz)</span>\n</li>\n</ul>\n</div>\n<!-- lists -->\n</ul>\n</div>\n<!-- general content -->\n<h3>시스템 요구사항</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<ul>\n<p>\n											Windows® 7, Windows 8, Windows 10 이상<br/>\nChrome OS™<br/>\nLinux® kernel 2.6 이상<br/>\nUSB 포트\n											\n										</p>\n</ul>\n</div>\n<!-- footnote -->\n</div>\n</li>\n<li class=\"tab-content-item clearfix\">\n<!-- general content -->\n<h3>사양</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<p>\n										연결 유형:\n										2.4 Ghz 무선\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										무선 범위:\n										10 m(32 ft)\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										배터리:\n										AA 1개\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										배터리 수명:\n										1년\n										\n									</p>\n</div>\n<!-- footnote -->\n</div>\n</li>\n<li class=\"tab-content-item clearfix\">\n<!-- general content -->\n<h3>패키지 내용물</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<p>\n							\n							마우스<br/>\n수신기<br/>\n사용 설명서\n							</p>\n</div>\n<!-- footnote -->\n</div>\n<!-- general content -->\n<h3>보증 정보</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<p>1년 제한 하드웨어 보증</p>\n<!-- lists -->\n<!-- footnote -->\n</div>\n<!-- general content -->\n<h3>제품 번호</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<p><span class=\"name\">파란색/검은색:</span> PN: 910-004661</p>\n<p><span class=\"name\">회색/검은색:</span> PN: 910-004660</p>\n<p><span class=\"name\">빨간색/검은색:</span> PN: 910-004662</p>\n<!-- lists -->\n</div>\n</li>\n</ul>\n</div>\n</div>\n</div>\n</div><!-- panel-group -->\n</div>, <div class=\"tabs hidden-xs\">\n<!-- Nav tabs -->\n<div class=\"specs-header\">\n<h6>사양 및 세부 정보</h6>\n</div>\n</div>',1,3),(4,'<div class=\"tabs\">\n<div class=\"tabs hidden-xs\">\n<!-- Nav tabs -->\n<div class=\"specs-header\">\n<h6>사양 및 세부 정보</h6>\n</div>\n</div>\n<!-- panel content -->\n<div aria-multiselectable=\"true\" class=\"panel-group\" id=\"spec-accordion\" role=\"tablist\">\n<div class=\"panel panel-default\">\n<div class=\"panel-heading visible-xs\" id=\"heading-one\" role=\"tab\">\n<h4 class=\"panel-title\">\n<a aria-controls=\"collapse-one\" aria-expanded=\"true\" data-parent=\"#spec-accordion\" data-toggle=\"collapse\" href=\"https://assets.logitech.com#collapse-one\" role=\"button\">\n\n	                                사양 및 세부 정보 <span aria-hidden=\"true\" class=\"more-less glyphicon glyphicon-minus text-right\"></span>\n</a>\n</h4>\n</div>\n<div aria-expanded=\"true\" aria-labelledby=\"collapse-one\" class=\"panel-collapse collapse in\" id=\"collapse-one\" role=\"tabpanel\">\n<div class=\"panel-body tab-pane\">\n<ul class=\"tabs-list\" data-col=\"3\">\n<li class=\"tab-content-item clearfix\">\n<h3>규격</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<ul>\n<div class=\"cell-group\">\n<h4>마우스</h4>\n<ul>\n<li>높이 x 너비 x 깊이:</li>\n<li>81.9mm x 49.4mm x 31.8mm</li>\n</ul>\n</div>\n<div class=\"cell-group\">\n<ul>\n<li>배터리 포함 무게: 51.9g</li>\n</ul>\n</div>\n<div class=\"cell-group\">\n<p></p><h4>수신기</h4>\n<ul>\n<li>높이 x 너비 x 깊이:</li>\n<li>14.4mm x 18.7mm x 6.1mm</li>\n</ul>\n</div>\n<div class=\"cell-group\">\n<ul>\n<li>무게: 1.8g</li>\n</ul>\n</div>\n<!-- lists -->\n</ul>\n</div>\n<!-- general content -->\n<h3>시스템 요구사항</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<ul>\n<p>\n<ul style=\"padding-bottom:0px; margin-bottom:0px;\">\n<li>Windows<sup>®</sup> 10 or later, Windows 8, Windows 7</li>\n<li>Mac OS X 10.10 이상</li>\n<li>Chrome OS<sup>™</sup></li>\n<li>Linux<sup>®</sup> Kernel 2.6 이상</li>\n<li>USB 포트</li>\n</ul>\n</p>\n</ul>\n</div>\n<!-- footnote -->\n</div>\n</li>\n<li class=\"tab-content-item clearfix\">\n<!-- general content -->\n<h3>사양</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<p>\n										센서 기술:\n										고급 옵티컬 트래킹\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										센서 해상도:\n										1000\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										버튼 수:\n										3\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										스크롤 휠(Y/N):\n										있음\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										배터리 수명:\n										(6개월 배터리 수명)\n										<a class=\"footnote\">1</a>\n</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										배터리 유형:\n										AAA 배터리 1개\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										무선 작동 거리:\n										약 10m<a class=\"footnote\">1</a>\n</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										무선 기술:\n										고급 2.4 GHz 무선 연결\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										인터페이스:\n										USB 수신기\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										제품 원산지:\n										중국\n										\n									</p>\n</div>\n<!-- footnote -->\n</div>\n</li>\n<li class=\"tab-content-item clearfix\">\n<!-- general content -->\n<h3>패키지 내용물</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<p>\n<ul style=\"padding-bottom:0px; margin-bottom:0px;\">\n<li>마우스</li>\n<li>수신기</li>\n<li>AAA 배터리 1개(설치되어 있음)</li>\n<li>사용 설명서</li>\n</ul>\n</p>\n</div>\n<!-- footnote -->\n</div>\n<!-- general content -->\n<h3>보증 정보</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<p>3년 제한 하드웨어 보증</p>\n<!-- lists -->\n<!-- footnote -->\n</div>\n<!-- general content -->\n<h3>제품 번호</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<p><span class=\"name\">블랙:</span> PN: 910-005374</p>\n<p><span class=\"name\">터키블루:</span> PN: 910-005376</p>\n<p><span class=\"name\">레드:</span> PN: 910-005375</p>\n<!-- lists -->\n</div>\n</li>\n</ul>\n</div>\n</div>\n</div>\n</div><!-- panel-group -->\n</div>, <div class=\"tabs hidden-xs\">\n<!-- Nav tabs -->\n<div class=\"specs-header\">\n<h6>사양 및 세부 정보</h6>\n</div>\n</div>',1,4),(5,'<div class=\"tabs\">\n<div class=\"tabs hidden-xs\">\n<!-- Nav tabs -->\n<div class=\"specs-header\">\n<h6>사양 및 세부 정보</h6>\n</div>\n</div>\n<!-- panel content -->\n<div aria-multiselectable=\"true\" class=\"panel-group\" id=\"spec-accordion\" role=\"tablist\">\n<div class=\"panel panel-default\">\n<div class=\"panel-heading visible-xs\" id=\"heading-one\" role=\"tab\">\n<h4 class=\"panel-title\">\n<a aria-controls=\"collapse-one\" aria-expanded=\"true\" data-parent=\"#spec-accordion\" data-toggle=\"collapse\" href=\"https://assets.logitech.com#collapse-one\" role=\"button\">\n\n	                                사양 및 세부 정보 <span aria-hidden=\"true\" class=\"more-less glyphicon glyphicon-minus text-right\"></span>\n</a>\n</h4>\n</div>\n<div aria-expanded=\"true\" aria-labelledby=\"collapse-one\" class=\"panel-collapse collapse in\" id=\"collapse-one\" role=\"tabpanel\">\n<div class=\"panel-body tab-pane\">\n<ul class=\"tabs-list\" data-col=\"3\">\n<li class=\"tab-content-item clearfix\">\n<h3>규격</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<ul>\n<div class=\"cell-group\">\n<ul>\n<li>마우스(높이 x 너비 x 깊이): 115mm x 74mm x 45mm</li>\n</ul>\n</div>\n<div class=\"cell-group\">\n<ul>\n<li>무게: 135g<br>\n<br/></br></li>\n</ul>\n</div>\n<div class=\"cell-group\">\n<ul>\n<li>나노 수신기(높이 x 너비 x 깊이): 14.4mm x 18.7mm x 6.1mm</li>\n</ul>\n</div>\n<div class=\"cell-group\">\n<ul>\n<li>무게: 18g</li>\n</ul>\n</div>\n<!-- lists -->\n</ul>\n</div>\n<!-- general content -->\n<h3>시스템 요구사항</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<ul>\n<p>\n											Windows | Mac | Chrome<sup>®</sup> OS | Linux<sup>®</sup> | iPadOs | Surface™와 호환\n											\n										</p>\n<h4>수신기</h4>\n<p>\n											필수: 사용 가능한 USB 포트<br>\nWindows 10 이상, Windows 8, Windows 7<br/>\nmacOS 10.10 이상 <br/>\nChrome OS Linux Kernel 2.6+\n											\n										</br></p>\n<h4><em>Bluetooth</em></h4>\n<p>\n											필수:<em> Bluetooth</em> 저에너지 기술<br/>\nWindows 10 이상, Windows 8<br/>\nmacOS 10.10 이상 <br/>\nChrome OS<br/>\nAndroid™ 5.0 이상<br/>\nLinux Kernel 2.6+<br/>\niPadOS 13.1 이상<a class=\"footnote\" href=\"https://assets.logitech.com#footnote3\">3</a>\n</p>\n</ul>\n</div>\n<!-- footnote -->\n</div>\n</li>\n<li class=\"tab-content-item clearfix\">\n<!-- general content -->\n<h3>사양</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<p>\n										연결 유형:\n										<em>Bluetooth</em> Smart 및 2.4GHz 무선 연결\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										무선 범위:\n										10m<a class=\"footnote\">2</a>\n</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										표시등(LED:\n										배터리 LED\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										연결/전원:\n										있음, 켜기/끄기 스위치\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										배터리 세부 정보:\n										AA 1개\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										배터리 수명:\n										24개월<a class=\"footnote\">2</a>\n</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										DPI(최소/최대):\n										1000±\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										센서 기술:\n										로지텍 고급 옵티컬 트래킹\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										센서 해상도:\n										1000dpi\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										스크롤 휠:\n										3G Core\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										버튼 수:\n										8\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										표준 및 특수 단추:\n										가운데 클릭을 포함한 틸트 휠\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										제스처 지원(Windows):\n										있음\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										제스처 지원(Mac):\n										있음\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										옵션 소프트웨어:\n										Logitech Options 및 Logitech Flow\n										\n									</p>\n</div>\n<!-- footnote -->\n</div>\n</li>\n<li class=\"tab-content-item clearfix\">\n<!-- general content -->\n<h3>패키지 내용물</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<p>\n							\n							무선 마우스<br/>\nUnifying 수신기<br/>\nAA 배터리 1개(설치되어 있음)<br/>\n사용 설명서\n							</p>\n</div>\n<!-- footnote -->\n</div>\n<!-- general content -->\n<h3>보증 정보</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<p>1년 제한 하드웨어 보증</p>\n<!-- lists -->\n<!-- footnote -->\n</div>\n<!-- general content -->\n<h3>제품 번호</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<p> PN: 910-004793</p>\n<!-- lists -->\n</div>\n</li>\n</ul>\n</div>\n</div>\n</div>\n</div><!-- panel-group -->\n</div>, <div class=\"tabs hidden-xs\">\n<!-- Nav tabs -->\n<div class=\"specs-header\">\n<h6>사양 및 세부 정보</h6>\n</div>\n</div>',1,5),(6,'<div class=\"tabs\">\n<div class=\"tabs hidden-xs\">\n<!-- Nav tabs -->\n<div class=\"specs-header\">\n<h6>사양 및 세부 정보</h6>\n</div>\n</div>\n<!-- panel content -->\n<div aria-multiselectable=\"true\" class=\"panel-group\" id=\"spec-accordion\" role=\"tablist\">\n<div class=\"panel panel-default\">\n<div class=\"panel-heading visible-xs\" id=\"heading-one\" role=\"tab\">\n<h4 class=\"panel-title\">\n<a aria-controls=\"collapse-one\" aria-expanded=\"true\" data-parent=\"#spec-accordion\" data-toggle=\"collapse\" href=\"https://assets.logitech.com#collapse-one\" role=\"button\">\n\n	                                사양 및 세부 정보 <span aria-hidden=\"true\" class=\"more-less glyphicon glyphicon-minus text-right\"></span>\n</a>\n</h4>\n</div>\n<div aria-expanded=\"true\" aria-labelledby=\"collapse-one\" class=\"panel-collapse collapse in\" id=\"collapse-one\" role=\"tabpanel\">\n<div class=\"panel-body tab-pane\">\n<ul class=\"tabs-list\" data-col=\"3\">\n<li class=\"tab-content-item clearfix\">\n<h3>규격</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<ul>\n<div class=\"cell-group\">\n<h4>마우스</h4>\n<ul>\n<li>높이 x 너비 x 깊이:</li>\n<li>112.96 mm x 61.7 mm x 38.4 mm</li>\n</ul>\n</div>\n<div class=\"cell-group\">\n<ul>\n<li>배터리 포함 무게: 85 g</li>\n</ul>\n</div>\n<div class=\"cell-group\">\n<ul>\n<li>케이블 길이: 180 cm</li>\n</ul>\n</div>\n<!-- lists -->\n</ul>\n</div>\n<!-- general content -->\n<h3>시스템 요구사항</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<ul>\n<ul>\n<li>\n											Windows<sup>®</sup> 10 이상, Windows 8, Windows 7<br>\nmacOS X 10.5 이상<br/>\nChrome OS<sup>™<br/>\n</sup> Linux Kernel 2.6+2<br/>\nUSB 연결: 사용 가능한 USB 포트 필요.\n											\n										</br></li>\n</ul>\n</ul>\n</div>\n<!-- footnote -->\n</div>\n</li>\n<li class=\"tab-content-item clearfix\">\n<!-- general content -->\n<h3>사양</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<p>\n										연결 유형:\n										유선\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										DPI(최소/최대):\n										1000±\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										트래킹 기술:\n										옵티컬\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										센서 해상도:\n										1000 dpi\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										스크롤 휠:\n										있음\n										\n									</p>\n</div>\n<div class=\"cell-group\">\n<p>\n										버튼 수:\n										3\n										\n									</p>\n</div>\n<!-- footnote -->\n</div>\n</li>\n<li class=\"tab-content-item clearfix\">\n<!-- general content -->\n<h3>패키지 내용물</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<ul><li>\n							\n							\n							마우스  케이블 포함<br/>\n사용 설명서\n							</li></ul>\n</div>\n<!-- footnote -->\n</div>\n<!-- general content -->\n<h3>보증 정보</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<p>3년 제한 하드웨어 보증</p>\n<!-- lists -->\n<!-- footnote -->\n</div>\n<!-- general content -->\n<h3>제품 번호</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<p><span class=\"name\">검은색:</span> PN: 910-005496</p>\n<!-- lists -->\n</div>\n</li>\n</ul>\n</div>\n</div>\n</div>\n</div><!-- panel-group -->\n</div>, <div class=\"tabs hidden-xs\">\n<!-- Nav tabs -->\n<div class=\"specs-header\">\n<h6>사양 및 세부 정보</h6>\n</div>\n</div>',1,6),(7,'<div class=\"tabs\">\n<div class=\"tabs hidden-xs\">\n<!-- Nav tabs -->\n<div class=\"specs-header\">\n<h6>사양 및 세부 정보</h6>\n</div>\n</div>\n<!-- panel content -->\n<div aria-multiselectable=\"true\" class=\"panel-group\" id=\"spec-accordion\" role=\"tablist\">\n<div class=\"panel panel-default\">\n<div class=\"panel-heading visible-xs\" id=\"heading-one\" role=\"tab\">\n<h4 class=\"panel-title\">\n<a aria-controls=\"collapse-one\" aria-expanded=\"true\" data-parent=\"#spec-accordion\" data-toggle=\"collapse\" href=\"https://assets.logitech.com#collapse-one\" role=\"button\">\n\n\n사양 및 세부 정보 <span aria-hidden=\"true\" class=\"more-less glyphicon glyphicon-minus text-right\"></span>\n</a>\n</h4>\n</div>\n<div aria-expanded=\"true\" aria-labelledby=\"collapse-one\" class=\"panel-collapse collapse in\" id=\"collapse-one\" role=\"tabpanel\">\n<div class=\"panel-body tab-pane\">\n<ul class=\"tabs-list\" data-col=\"3\">\n<li class=\"tab-content-item clearfix\">\n<h3>규격</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<ul>\n<div class=\"cell-group\">\n<ul>\n<li>높이 x 너비 x 깊이:</li>\n<li>158 mm x 380 mm x 전방 8 mm, 후방 22 mm</li>\n</ul>\n</div>\n<div class=\"cell-group\">\n<ul>\n<li>무게: 875 g</li>\n</ul>\n</div>\n<!-- lists -->\n</ul>\n</div>\n<!-- general content -->\n<h3>시스템 요구사항</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<ul>\n<h4>외부 키보드를 지원하는 컴퓨터, 휴대전화, 태블릿.</h4>\n<ul>\n<li>\nWindows<sup>®</sup> 7, Windows 8, Windows 10 이상<br/>\nAndroid<sup>™</sup> 5.0 이상<br/>\nMac OS X 10.10 이상<br/>\niOS 5 이상<br/>\nChrome OS<sup>™</sup><br/>\n<br/>\nUSB 연결: 사용 가능한 USB 포트 필요.<br/>\n<em>블루투스</em> 연결: <em>필요한 키보드 지원을 포함한 Bluetooth </em>Smart 지원 장치(HID 프로파일).\n\n</li>\n</ul>\n</ul>\n</div>\n<!-- footnote -->\n</div>\n</li>\n<li class=\"tab-content-item clearfix\">\n<!-- general content -->\n<h3>사양</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<h4>연결 유형</h4>\n<ul>\n<li>\nLogitech Unifying 프로토콜(2.4GHz)<br/>\n<em>Bluetooth</em> Smart 기술\n\n</li>\n</ul>\n</div>\n<div class=\"cell-group\">\n<p>\n무선 범위:\n&gt;33 ft / 10m 무선 범위\n<a class=\"footnote\">4</a>\n</p>\n</div>\n<div class=\"cell-group\">\n<h4>소프트웨어 지원</h4>\n<ul>\n<li>\nMac용 Logitech Options(OS X 10.8 이상)<br/>\nWindows용 Logitech Options(Windows 7, Windows 8 이상)<br/>\nLogitech Flow\n\n</li>\n</ul>\n</div>\n<div class=\"cell-group\">\n<p>\n제공되는 응용 프로그램(출시 기준):\nLogitech Options 2.1\n\n</p>\n</div>\n<div class=\"cell-group\">\n<h4>표시등(LED)</h4>\n<ul>\n<li>\n<em>블루투스</em> 채널 LED 3개<br/>\n배터리 표시등 로지텍\n\n</li>\n</ul>\n</div>\n<div class=\"cell-group\">\n<p>\n배터리:\nAAA 2개\n\n</p>\n</div>\n<div class=\"cell-group\">\n<p>\n배터리 수명(충전식 아님):\n24개월\n\n</p>\n</div>\n<div class=\"cell-group\">\n<h4>특수 키</h4>\n<ul>\n<li>\n단축키(예: 홈, 검색, 뒤로, 앱 전환, 상황별 메뉴 등), 이지-스위치\n\n</li>\n</ul>\n</div>\n<div class=\"cell-group\">\n<p>\n연결/전원:\n온/오프 스위치\n\n</p>\n</div>\n<div class=\"cell-group\">\n<h4>태블릿 커버 및 스탠드</h4>\n<ul>\n<li>\n스마트 기기 스탠드 최대 11.3 mm 두께<br/>\niPad Pro(12\"), 수평, 최대 크기 및 무게\n\n</li>\n</ul>\n</div>\n<!-- footnote -->\n</div>\n</li>\n<li class=\"tab-content-item clearfix\">\n<!-- general content -->\n<h3>패키지 내용물</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<p>\n\n키보드<br/>\nAAA 배터리 2개(설치되어 있음)<br/>\nUSB 수신기<br/>\n사용 설명서\n</p>\n</div>\n<!-- footnote -->\n</div>\n<!-- general content -->\n<h3>보증 정보</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<p>1년 제한 하드웨어 보증</p>\n<!-- lists -->\n<!-- footnote -->\n</div>\n<!-- general content -->\n<h3>제품 번호</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<p><span class=\"name\">흰색:</span> PN: 920-008030</p>\n<!-- lists -->\n</div>\n</li>\n</ul>\n</div>\n</div>\n</div>\n</div><!-- panel-group -->\n</div>, <div class=\"tabs hidden-xs\">\n<!-- Nav tabs -->\n<div class=\"specs-header\">\n<h6>사양 및 세부 정보</h6>\n</div>\n</div>',1,7),(8,'<div class=\"tabs\">\n<div class=\"tabs hidden-xs\">\n<!-- Nav tabs -->\n<div class=\"specs-header\">\n<h6>사양 및 세부 정보</h6>\n</div>\n</div>\n<!-- panel content -->\n<div aria-multiselectable=\"true\" class=\"panel-group\" id=\"spec-accordion\" role=\"tablist\">\n<div class=\"panel panel-default\">\n<div class=\"panel-heading visible-xs\" id=\"heading-one\" role=\"tab\">\n<h4 class=\"panel-title\">\n<a aria-controls=\"collapse-one\" aria-expanded=\"true\" data-parent=\"#spec-accordion\" data-toggle=\"collapse\" href=\"https://assets.logitech.com#collapse-one\" role=\"button\">\n\n\n사양 및 세부 정보 <span aria-hidden=\"true\" class=\"more-less glyphicon glyphicon-minus text-right\"></span>\n</a>\n</h4>\n</div>\n<div aria-expanded=\"true\" aria-labelledby=\"collapse-one\" class=\"panel-collapse collapse in\" id=\"collapse-one\" role=\"tabpanel\">\n<div class=\"panel-body tab-pane\">\n<ul class=\"tabs-list\" data-col=\"3\">\n<li class=\"tab-content-item clearfix\">\n<h3>규격</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<ul>\n<div class=\"cell-group\">\n<ul>\n<li>깊이: 20 mm</li>\n</ul>\n</div>\n<div class=\"cell-group\">\n<ul>\n<li>너비: 299 mm</li>\n</ul>\n</div>\n<div class=\"cell-group\">\n<ul>\n<li>높이: 195 mm</li>\n</ul>\n</div>\n<div class=\"cell-group\">\n<ul>\n<li>무게: 820 g</li>\n</ul>\n</div>\n<!-- lists -->\n<div class=\"cell-group\">\n<p>\n<button class=\"modal-button\" data-target=\"#dimensions-model-mob\" data-toggle=\"modal\">이미지 보기</button>\n</p>\n</div>\n</ul>\n</div>\n<!-- general content -->\n<h3>시스템 요구사항</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<ul>\n<h4>외장 키보드(HID 프로필)를 지원하는 <em>Bluetooth</em> 무선 컴퓨터 또는 모바일 장치.</h4>\n<p>\n<ul>\n<li>PC: Windows® 7, Windows 8, Windows 10</li>\n<li>Mac: Mac OS X 이상</li>\n<li>Chrome OS™</li>\n<li>iPad 또는 iPhone: iOS 5 이상</li>\n<li>Android™ 태블릿 또는 스마트폰: Android 3.2 이상.</li>\n</ul>\n<p>인터넷 연결(옵션 소프트웨어 다운로드용)</p>\n</p>\n<h4>온라인 K480 가이드, <a href=\"https://assets.logitech.com/ko-kr/manuals/k480-immersion-guide\" target=\"_blank\">여기에서</a> 확인하십시오.</h4>\n</ul>\n</div>\n<!-- footnote -->\n</div>\n</li>\n<li class=\"tab-content-item clearfix\">\n<!-- general content -->\n<h3>사양</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<ul>\n<li>\n<span class=\"value\">\n<ul>\n<li>흰색 및 검은색으로 제공.</li>\n<li>Bluetooth 범위: 최대 10 m (33 ft)</li>\n<li>배터리 수명: 2년</li>\n<li>전원 켜기/끄기 스위치</li>\n<li>배터리 수명 표시등</li>\n</ul>\n</span>\n</li>\n</ul>\n</div>\n<!-- footnote -->\n</div>\n</li>\n<li class=\"tab-content-item clearfix\">\n<!-- general content -->\n<h3>패키지 내용물</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<p>\n<ul>\n<li>키보드</li>\n<li>AAA 배터리 2개(설치되어 있음)</li>\n<li>사용 설명서</li>\n</ul>\n</p>\n</div>\n<!-- footnote -->\n</div>\n<!-- general content -->\n<h3>보증 정보</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<p>1년 제한 하드웨어 보증</p>\n<!-- lists -->\n<!-- footnote -->\n</div>\n<!-- general content -->\n<h3>제품 번호</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<p><span class=\"name\">블랙:</span> PN: 920-006376</p>\n<p><span class=\"name\">흰색:</span> PN: 920-006377</p>\n<!-- lists -->\n</div>\n</li>\n</ul>\n</div>\n</div>\n</div>\n</div><!-- panel-group -->\n</div>, <div class=\"tabs hidden-xs\">\n<!-- Nav tabs -->\n<div class=\"specs-header\">\n<h6>사양 및 세부 정보</h6>\n</div>\n</div>',1,8),(9,'<div class=\"tabs\">\n<div class=\"tabs hidden-xs\">\n<!-- Nav tabs -->\n<div class=\"specs-header\">\n<h6>사양 및 세부 정보</h6>\n</div>\n</div>\n<!-- panel content -->\n<div aria-multiselectable=\"true\" class=\"panel-group\" id=\"spec-accordion\" role=\"tablist\">\n<div class=\"panel panel-default\">\n<div class=\"panel-heading visible-xs\" id=\"heading-one\" role=\"tab\">\n<h4 class=\"panel-title\">\n<a aria-controls=\"collapse-one\" aria-expanded=\"true\" data-parent=\"#spec-accordion\" data-toggle=\"collapse\" href=\"https://assets.logitech.com#collapse-one\" role=\"button\">\n\n\n사양 및 세부 정보 <span aria-hidden=\"true\" class=\"more-less glyphicon glyphicon-minus text-right\"></span>\n</a>\n</h4>\n</div>\n<div aria-expanded=\"true\" aria-labelledby=\"collapse-one\" class=\"panel-collapse collapse in\" id=\"collapse-one\" role=\"tabpanel\">\n<div class=\"panel-body tab-pane\">\n<ul class=\"tabs-list\" data-col=\"3\">\n<li class=\"tab-content-item clearfix\">\n<!-- general content -->\n<h3>시스템 요구사항</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<ul>\n<h4>Windows 기반 PC</h4>\n<p>\n<ul>\n<li>Windows<sup>®</sup> XP, Windows Vista<sup>®</sup> , Windows 7, Windows 8, Windows 10</li>\n<li>USB 포트</li>\n<li>햇빛 및/또는 실내 조명 광원</li>\n</ul>\n</p>\n</ul>\n</div>\n<!-- footnote -->\n</div>\n</li>\n<li class=\"tab-content-item clearfix\">\n<!-- general content -->\n<h3>패키지 내용물</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<p>\n<ul>\n<li>키보드</li>\n<li>Logitech Unifying 수신기</li>\n</ul>\n</p>\n</div>\n<!-- footnote -->\n</div>\n<!-- general content -->\n<h3>보증 정보</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<p>3년 제한 하드웨어 보증</p>\n<!-- lists -->\n<!-- footnote -->\n</div>\n<!-- general content -->\n<h3>제품 번호</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<p> PN: 920-004633</p>\n<!-- lists -->\n</div>\n</li>\n</ul>\n</div>\n</div>\n</div>\n</div><!-- panel-group -->\n</div>, <div class=\"tabs hidden-xs\">\n<!-- Nav tabs -->\n<div class=\"specs-header\">\n<h6>사양 및 세부 정보</h6>\n</div>\n</div>',1,9),(10,'<div class=\"tabs\">\n<div class=\"tabs hidden-xs\">\n<!-- Nav tabs -->\n<div class=\"specs-header\">\n<h6>사양 및 세부 정보</h6>\n</div>\n</div>\n<!-- panel content -->\n<div aria-multiselectable=\"true\" class=\"panel-group\" id=\"spec-accordion\" role=\"tablist\">\n<div class=\"panel panel-default\">\n<div class=\"panel-heading visible-xs\" id=\"heading-one\" role=\"tab\">\n<h4 class=\"panel-title\">\n<a aria-controls=\"collapse-one\" aria-expanded=\"true\" data-parent=\"#spec-accordion\" data-toggle=\"collapse\" href=\"https://assets.logitech.com#collapse-one\" role=\"button\">\n\n\n사양 및 세부 정보 <span aria-hidden=\"true\" class=\"more-less glyphicon glyphicon-minus text-right\"></span>\n</a>\n</h4>\n</div>\n<div aria-expanded=\"true\" aria-labelledby=\"collapse-one\" class=\"panel-collapse collapse in\" id=\"collapse-one\" role=\"tabpanel\">\n<div class=\"panel-body tab-pane\">\n<ul class=\"tabs-list\" data-col=\"3\">\n<li class=\"tab-content-item clearfix\">\n<h3>규격</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<ul>\n<div class=\"cell-group\">\n<h4>전체</h4>\n<ul>\n</ul>\n</div>\n<div class=\"cell-group\">\n<ul>\n<li>높이: 139.9mm(5.5인치)</li>\n</ul>\n</div>\n<div class=\"cell-group\">\n<ul>\n<li>너비: 354.3mm(14.0인치)</li>\n</ul>\n</div>\n<div class=\"cell-group\">\n<ul>\n<li>깊이: 23.5mm(1.0인치)</li>\n</ul>\n</div>\n<div class=\"cell-group\">\n<ul>\n<li>무게: 380g(배터리 포함)</li>\n</ul>\n</div>\n<div class=\"cell-group\">\n<h4><p> </p></h4>\n<ul>\n</ul>\n</div>\n<div class=\"cell-group\">\n<h4>터치패드</h4>\n<ul>\n</ul>\n</div>\n<div class=\"cell-group\">\n<ul>\n<li>높이: 76mm(3.0인치)</li>\n</ul>\n</div>\n<div class=\"cell-group\">\n<ul>\n<li>너비: 47mm(2.0인치)</li>\n</ul>\n</div>\n<!-- lists -->\n<div class=\"cell-group\">\n<p>\n<button class=\"modal-button\" data-target=\"#dimensions-model-mob\" data-toggle=\"modal\">이미지 보기</button>\n</p>\n</div>\n</ul>\n</div>\n<!-- general content -->\n<h3>시스템 요구사항</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<ul>\n<p>\n<strong>OS/플랫폼 지원</strong>\n<ul>\n<li>Windows<sup>®</sup> 7, Windows 8, Windows 10 이상</li>\n<li>Android<sup>™</sup> 5.0 이상</li>\n<li>Chrome OS<sup>™</sup></li>\n<li>USB 포트</li>\n</ul>\n</p>\n</ul>\n</div>\n<!-- footnote -->\n</div>\n</li>\n<li class=\"tab-content-item clearfix\">\n<!-- general content -->\n<h3>사양</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<p>\n연결 유형:\n로지텍 Unifying 프로토콜(2.4GHz)\n\n</p>\n</div>\n<div class=\"cell-group\">\n<p>\n특수 키:\n음소거, 볼륨 줄이기, 볼륨 높이기\n\n</p>\n</div>\n<div class=\"cell-group\">\n<p>\n연결/전원:\n켜기/끄기 스위치\n\n</p>\n</div>\n<div class=\"cell-group\">\n<p>\n배터리 정보:\nAA 2개\n\n</p>\n</div>\n<div class=\"cell-group\">\n<p>\n배터리 수명(충전 불가):\n최대 18개월\n\n</p>\n</div>\n<div class=\"cell-group\">\n<p>\n키 수명:\n최대 500만번의 키 입력\n\n</p>\n</div>\n<div class=\"cell-group\">\n<p>\n타이핑 소음:\n모든 키에 대해 55dBA 이내\n\n</p>\n</div>\n<div class=\"cell-group\">\n<p>\n무선 범위:\n10m(33피트)\n\n</p>\n</div>\n<!-- footnote -->\n</div>\n</li>\n<li class=\"tab-content-item clearfix\">\n<!-- general content -->\n<h3>패키지 내용물</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<p>\n<ul>\n<li>무선 터치 키보드</li>\n<li>Unifying 수신기</li>\n<li>AA 배터리 2개(설치되어 있음)</li>\n<li>사용 설명서</li>\n</ul>\n</p>\n</div>\n<!-- footnote -->\n</div>\n<!-- general content -->\n<h3>보증 정보</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<p>1년 제한 하드웨어 보증</p>\n<!-- lists -->\n<!-- footnote -->\n</div>\n<!-- general content -->\n<h3>제품 번호</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<p><span class=\"name\">블랙:</span> PN: 920-007171</p>\n<!-- lists -->\n</div>\n</li>\n</ul>\n</div>\n</div>\n</div>\n</div><!-- panel-group -->\n</div>, <div class=\"tabs hidden-xs\">\n<!-- Nav tabs -->\n<div class=\"specs-header\">\n<h6>사양 및 세부 정보</h6>\n</div>\n</div>',1,10),(11,'<div class=\"tabs\">\n<div class=\"tabs hidden-xs\">\n<!-- Nav tabs -->\n<div class=\"specs-header\">\n<h6>사양 및 세부 정보</h6>\n</div>\n</div>\n<!-- panel content -->\n<div aria-multiselectable=\"true\" class=\"panel-group\" id=\"spec-accordion\" role=\"tablist\">\n<div class=\"panel panel-default\">\n<div class=\"panel-heading visible-xs\" id=\"heading-one\" role=\"tab\">\n<h4 class=\"panel-title\">\n<a aria-controls=\"collapse-one\" aria-expanded=\"true\" data-parent=\"#spec-accordion\" data-toggle=\"collapse\" href=\"https://assets.logitech.com#collapse-one\" role=\"button\">\n\n\n사양 및 세부 정보 <span aria-hidden=\"true\" class=\"more-less glyphicon glyphicon-minus text-right\"></span>\n</a>\n</h4>\n</div>\n<div aria-expanded=\"true\" aria-labelledby=\"collapse-one\" class=\"panel-collapse collapse in\" id=\"collapse-one\" role=\"tabpanel\">\n<div class=\"panel-body tab-pane\">\n<ul class=\"tabs-list\" data-col=\"3\">\n<li class=\"tab-content-item clearfix\">\n<h3>규격</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<ul>\n<div class=\"cell-group\">\n<ul>\n<li>높이 x 너비 x 깊이:</li>\n<li>20.5mm x 435.5mm x 137.5mm</li>\n</ul>\n</div>\n<div class=\"cell-group\">\n<ul>\n<li>무게: 475g(AAA 배터리 2개 포함)</li>\n</ul>\n</div>\n<div class=\"cell-group\">\n<ul>\n<li>무게: 425g(배터리 불포함)</li>\n</ul>\n</div>\n<!-- lists -->\n</ul>\n</div>\n<!-- general content -->\n<h3>시스템 요구사항</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<ul>\n<h4>외부 키보드를 지원하는 컴퓨터, 휴대폰, 태블릿(HID급)</h4>\n<ul>\n<li>\n<ul>\n<li>Windows<sup>®</sup> 7, Windows 8, Windows 10 이상</li>\n<li>Android 5.0</li>\n<li>Mac OS X 10.10 이상</li>\n<li>iOS 5 이상</li>\n<li>Chrome OS™</li>\n</ul>\n</li>\n</ul>\n<p>\n<strong>USB 연결: </strong>사용 가능한 USB 포트 필요.\n\n</p>\n<p>\n<strong><em>Bluetooth</em> 연결: </strong><em>필요한 키보드 지원을 포함한 Bluetooth</em> Smart 지원 장치<em>(Bluetooth</em> HID).\n\n</p>\n</ul>\n</div>\n<!-- footnote -->\n</div>\n</li>\n<li class=\"tab-content-item clearfix\">\n<!-- general content -->\n<h3>사양</h3>\n<div class=\"feature-content clearfix\">\n<!-- content description -->\n<!-- lists -->\n<div class=\"cell-group\">\n<p>\n연결 유형:\n<ul>\n<li>로지텍 Unifying 프로토콜(2.4GHz)</li>\n<li><em>Bluetooth</em> Smart 기술</li>\n</ul>\n</p>\n</div>\n<div class=\"cell-group\">\n<p>\n무선 범위:\n10미터 무선 범위 무선 연결 범위는 컴퓨터 사용 환경과 조건에 따라 다를 수 있습니다.</p></div></div></li></ul></div></div></div></div></div>, <div class=\"tabs hidden-xs\">\n<!-- Nav tabs -->\n<div class=\"specs-header\">\n<h6>사양 및 세부 정보</h6>\n</div>\n</div>',1,11);
/*!40000 ALTER TABLE `product_specifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_sub_categories`
--

DROP TABLE IF EXISTS `product_sub_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_sub_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_sub_categori_category_id_02724cf8_fk_product_c` (`category_id`),
  CONSTRAINT `product_sub_categori_category_id_02724cf8_fk_product_c` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_sub_categories`
--

LOCK TABLES `product_sub_categories` WRITE;
/*!40000 ALTER TABLE `product_sub_categories` DISABLE KEYS */;
INSERT INTO `product_sub_categories` VALUES (1,'마우스',1),(2,'콤보',1),(3,'키보드',1),(4,'iPad 키보드',1),(5,'태블릿 키보드',1),(6,'Spotlight',2),(7,'전체 프레젠테이션 리모컨',2),(8,'iPad 키보드',3),(9,'iPad 케이스',3),(10,'iPad 액세서리',3),(11,'태블릿 키보드',3),(12,'스마트폰 액세서리',3),(13,'StreamCam',4),(14,'웹캠',4),(15,'Circle View Camera',5),(16,'유선 헤드셋',6),(17,'무선 헤드셋',6),(18,'Bluetooth 스피커',6),(19,'컴퓨터 스피커',6),(20,'컨퍼런스 카메라',7),(21,'회의실 솔루션',7),(22,'데스크 솔루션',7),(23,'액세서리',7),(24,'웹캠',7),(25,'게이밍 마우스',8),(26,'게이밍 마우스 패드',8),(27,'게이밍 키보드',8),(28,'게이밍 오디오',8),(29,'스트리밍 기어',8),(30,'드라이빙',8),(31,'게임패드',8);
/*!40000 ALTER TABLE `product_sub_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_teasers`
--

DROP TABLE IF EXISTS `product_teasers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_teasers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `teaser` varchar(16000) DEFAULT NULL,
  `order` int DEFAULT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_teasers_product_id_cdb9ba85_fk_products_id` (`product_id`),
  CONSTRAINT `product_teasers_product_id_cdb9ba85_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_teasers`
--

LOCK TABLES `product_teasers` WRITE;
/*!40000 ALTER TABLE `product_teasers` DISABLE KEYS */;
INSERT INTO `product_teasers` VALUES (1,'<section aria-label=\"Product Teaser\" class=\"product-teaser\">\n<div class=\"container\">\n<div class=\"teaser-copy-ctn\">\n<h3 class=\"teaser-title\">은밀하게 FLOW하게</h3>\n<p class=\"teaser-overview\">M590 멀티디바이스 무소음 마우스로 소음 없이 효율적으로 일하십시오. Logitech FLOW 기능을 사용하면 하나의 마우스로 두 대의 컴퓨터 사이를 자유롭게 이동하고, 한 컴퓨터에서 다른 컴퓨터로 복사/붙여넣기 하는 마법 같은 일이 가능해집니다. 90% 이상의 소음의 감소시킨 이 마우스로 소음없는 쾌적한 환경을 경험하십시오.</p>\n</div>\n</div> <!-- .container -->\n</section>',1,1),(2,'<section aria-label=\"Product Teaser\" class=\"product-teaser\">\n<div class=\"container\">\n<div class=\"teaser-copy-ctn\">\n<h3 class=\"teaser-title\">혁신적인 멀티태스킹 기능</h3>\n<p class=\"teaser-overview\">M585 Multi-Device로 업무 환경을 혁신적으로 바꿔보세요. FLOW 기능를 사용하면 한 대의 마우스로 두 대의 컴퓨터 사이를 자유롭게 이동하고 한 컴퓨터에서 다른 컴퓨터로 복사/붙여넣기 하는 마법 같은 일이 가능해집니다. 초정밀 스크롤 휠, 5개의 프로그래밍 가능한 버튼, 2년의 배터리 수명, 손에 딱 맞는 편안한 그립감, 뛰어난 옵티컬 트래킹 및 이중 연결(<em>Bluetooth</em><sup>®</sup> 또는 2.4GHz 로지텍 Unifying<sup>™</sup>)로 스마트하게 컨트롤 할 수 있습니다.</p>\n</div>\n</div> <!-- .container -->\n</section>',1,2),(3,'<section aria-label=\"Product Teaser\" class=\"product-teaser\">\n<div class=\"container\">\n<div class=\"teaser-copy-ctn\">\n<h3 class=\"teaser-title\">무선 미니 마우스 M187</h3>\n<p class=\"teaser-overview\">로지텍 무선 미니 마우스 M187. 주머니에 쏙 들어가는 작은 크기로 노트북과 함께 휴대하기 좋습니다. 설치도 간단합니다. 초소형 나노 수신기를 꽂기만 하면 바로 사용 가능합니다. 노트북의 터치패드보다 훨씬 정확한 컨트롤과 무선의 자유를 함께 즐겨보십시오.</p>\n</div>\n</div> <!-- .container -->\n</section>',1,4),(4,'<section aria-label=\"Product Teaser\" class=\"product-teaser\">\n<div class=\"container\">\n<div class=\"teaser-copy-ctn\">\n<h3 class=\"teaser-title\">내구성, 다목적성, 편안함</h3>\n<p class=\"teaser-overview\">M720 Triathlon 마우스로 보다 성공적이고 효율적인 멀티-디바이스 작업을 경험해보십시오.  3개의 컴퓨터 간을 자유로이 전환하며 초고속 스크롤링으로 문서와 웹 페이지 간을 신속히 이동함으로써 작업 속도를 향상시킬 수 있습니다. 이 Bluetooth<sup>®</sup> 및 Unifying 겸용 마우스는 AA 배터리 하나만으로 24개월 동안 지속되는 놀라운 배터리 수명을 보여줍니다. 손에 꼭 맞는 풀사이즈의 입체적 디자인으로 편안한 사용이 가능합니다.</p>\n</div>\n</div> <!-- .container -->\n</section>',1,5),(5,'<section aria-label=\"Product Teaser\" class=\"product-teaser\">\n<div class=\"container\">\n<div class=\"teaser-copy-ctn\">\n<h3 class=\"teaser-title\">조용한 클릭을 즐기세요</h3>\n<p class=\"teaser-overview\">소음 없는 쾌적한 작업 환경을 경험해 보십시오. 90% 이상의 소음을 감소시킨 이 마우스는 시끄러운 클릭음 없이도 동일한 클릭감을 선사합니다. <a class=\"footnote\">1</a>  부드럽고 조용한 스크롤 휠은 고요한 작업환경을 완성합니다. 획기적으로 소음을 감소시킨 이 조용한 마우스는 여러분의 건강한 작업환경과 효율성을 보장합니다. 짜증나는 클릭음과 작별하십시오. 가족과 친구들 또한 환영할 것입니다.</p>\n</div>\n</div> <!-- .container -->\n</section>',1,6),(6,'<section aria-label=\"Product Teaser\" class=\"product-teaser\">\n<div class=\"container\">\n<div class=\"teaser-copy-ctn\">\n<h3 class=\"teaser-title\">데스크탑 키보드의 개념을 재정의하다</h3>\n<p class=\"teaser-overview\">K780 멀티-디바이스 키보드는 세련되고 모던한 디자인의 컴퓨터 키보드로 숫자 패드를 포함한 키보드의 모든 기능이 탑재되어 있습니다. 컴퓨터는 물론 스마트폰, 태블릿을 비롯한 모든 기기와 완벽히 호환됩니다.\n<br> <br>\n편안하고 조용한 타이핑을 즐길 수 있으며 텍스트를 입력하고자 하는 기기를 간편히 전환할 수 있습니다.<a class=\"footnote\">1</a> PC, Mac, Chrome OS, Android 및 iOS에서 작동합니다.</br></br></p>\n</div>\n</div> <!-- .container -->\n</section>',1,7),(7,'<section aria-label=\"Product Teaser\" class=\"product-teaser\">\n<div class=\"container\">\n<div class=\"teaser-copy-ctn\">\n<h3 class=\"teaser-title\">컴퓨터에서 보고서를 입력한 다음, 휴대폰에서 메시지를 입력할 수 있습니다</h3>\n<p class=\"teaser-overview\">컴퓨터 키보드가 마땅히 갖추어야 할 기능을 생각해 보십시오. 바로 익숙하고 편안한 타이핑이 가능해야 합니다. 이제 휴대폰과 태블릿에서도 동일한 컴퓨터 키보드를 사용할 수 있다고 상상해 보십시오. 책상에서 사용하는 모든 화면에 적합한 K375s 멀티-디바이스, 풀사이즈 키보드 및 스탠드 콤보의 이면에 숨겨져 있는 컨셉과 디자인이 바로 이것입니다.<style type=\"text/css\">\nh1.product-details-name {\ntext-transform: none !important;\n}\n</style></p>\n</div>\n</div> <!-- .container -->\n</section>',1,11);
/*!40000 ALTER TABLE `product_teasers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_videos`
--

DROP TABLE IF EXISTS `product_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_videos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `video` varchar(16000) DEFAULT NULL,
  `order` int DEFAULT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_videos_product_id_2cb4a827_fk_products_id` (`product_id`),
  CONSTRAINT `product_videos_product_id_2cb4a827_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_videos`
--

LOCK TABLES `product_videos` WRITE;
/*!40000 ALTER TABLE `product_videos` DISABLE KEYS */;
INSERT INTO `product_videos` VALUES (1,'https://www.youtube.com/watch?v=iSGrlp0cgrI',1,5);
/*!40000 ALTER TABLE `product_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `sub_category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_sub_category_id_f08b7711_fk_product_sub_categories_id` (`sub_category_id`),
  CONSTRAINT `products_sub_category_id_f08b7711_fk_product_sub_categories_id` FOREIGN KEY (`sub_category_id`) REFERENCES `product_sub_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'M590 MULTI-DEVICE SILENT','파워 유저를 위한 무소음 무선 마우스',1),(2,'M585 MULTI-DEVICE','멀티 태스킹 마우스',1),(3,'M171','Wireless Mouse',1),(4,'무선 미니 마우스 M187','주머니에 쏙, 컴팩트한 디자인',1),(5,'M720 TRIATHLON','멀티-디바이스 무선 마우스',1),(6,'M110 SILENT','무소음 유선 마우스, 풀사이즈의 편안함',1),(7,'K780 Multi-Device Wireless Keyboard','하나의 키보드로 컴퓨터, 휴대폰, 태블릿 등 다양한 디바이스를 동시 연결\n키보드에 필요한 모든 기능 탑재',3),(8,'블루투스 멀티 디바이스 키보드 K480','블루투스 멀티 디바이스 키보드 K480',3),(9,'무선 솔라 키보드 K750r','무선 솔라 키보드 K750r',3),(10,'Wireless Touch Keyboard K400 Plus','Wireless Touch Keyboard K400 Plus',3),(11,'K375s MULTI-DEVICE','무선 키보드와 스탠드 콤보',3),(12,'MX KEYS 키보드','MX KEYS 키보드',3);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommend_products`
--

DROP TABLE IF EXISTS `recommend_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommend_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `recommend_product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recommend_products_product_id_78feb778_fk_products_id` (`product_id`),
  KEY `recommend_products_recommend_product_id_7216ec94_fk_products_id` (`recommend_product_id`),
  CONSTRAINT `recommend_products_product_id_78feb778_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `recommend_products_recommend_product_id_7216ec94_fk_products_id` FOREIGN KEY (`recommend_product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommend_products`
--

LOCK TABLES `recommend_products` WRITE;
/*!40000 ALTER TABLE `recommend_products` DISABLE KEYS */;
INSERT INTO `recommend_products` VALUES (1,1,7),(2,1,5),(3,1,10),(4,2,10),(5,2,5),(6,2,7),(7,4,3),(8,4,9),(9,4,10),(10,3,7),(11,3,3),(12,3,9),(13,5,9),(14,5,3),(15,5,7),(16,6,1),(17,6,10),(18,6,9),(19,7,5),(20,7,3),(21,7,10),(22,9,5),(23,9,1),(24,9,2),(25,8,7),(26,8,5),(27,8,2),(28,10,5),(29,10,2),(30,10,4),(31,11,3),(32,11,4),(33,11,6),(34,12,7),(35,12,5),(36,12,1);
/*!40000 ALTER TABLE `recommend_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_deilivery_address`
--

DROP TABLE IF EXISTS `user_deilivery_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_deilivery_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(1000) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_deilivery_address_user_id_b6c50739_fk_accounts_id` (`user_id`),
  CONSTRAINT `user_deilivery_address_user_id_b6c50739_fk_accounts_id` FOREIGN KEY (`user_id`) REFERENCES `accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_deilivery_address`
--

LOCK TABLES `user_deilivery_address` WRITE;
/*!40000 ALTER TABLE `user_deilivery_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_deilivery_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_orders`
--

DROP TABLE IF EXISTS `user_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `discount` decimal(4,2) DEFAULT NULL,
  `final_price` decimal(30,2) DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  `order_time` date NOT NULL,
  `order_status_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_orders_order_status_id_3a1574c5_fk_order_status_id` (`order_status_id`),
  KEY `user_orders_user_id_4ac01712_fk_accounts_id` (`user_id`),
  KEY `user_orders_address_id_679b6859` (`address_id`),
  CONSTRAINT `user_orders_address_id_679b6859_fk_user_deilivery_address_id` FOREIGN KEY (`address_id`) REFERENCES `user_deilivery_address` (`id`),
  CONSTRAINT `user_orders_order_status_id_3a1574c5_fk_order_status_id` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`id`),
  CONSTRAINT `user_orders_user_id_4ac01712_fk_accounts_id` FOREIGN KEY (`user_id`) REFERENCES `accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_orders`
--

LOCK TABLES `user_orders` WRITE;
/*!40000 ALTER TABLE `user_orders` DISABLE KEYS */;
INSERT INTO `user_orders` VALUES (8,NULL,NULL,NULL,'2020-07-02',1,2);
/*!40000 ALTER TABLE `user_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_products`
--

DROP TABLE IF EXISTS `user_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `registered_product_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_products_registered_product_id_7bb6e35f_fk_products_id` (`registered_product_id`),
  KEY `user_products_user_id_4d06e14b_fk_accounts_id` (`user_id`),
  CONSTRAINT `user_products_registered_product_id_7bb6e35f_fk_products_id` FOREIGN KEY (`registered_product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `user_products_user_id_4d06e14b_fk_accounts_id` FOREIGN KEY (`user_id`) REFERENCES `accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_products`
--

LOCK TABLES `user_products` WRITE;
/*!40000 ALTER TABLE `user_products` DISABLE KEYS */;
INSERT INTO `user_products` VALUES (1,6,2);
/*!40000 ALTER TABLE `user_products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-02 16:41:11
