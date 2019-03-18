-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: epet
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.16.04.2

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user',7,'add_user'),(20,'Can change user',7,'change_user'),(21,'Can delete user',7,'delete_user'),(22,'Can add goods',8,'add_goods'),(23,'Can change goods',8,'change_goods'),(24,'Can delete goods',8,'delete_goods'),(25,'Can add cart',9,'add_cart'),(26,'Can change cart',9,'change_cart'),(27,'Can delete cart',9,'delete_cart'),(28,'Can add order',10,'add_order'),(29,'Can change order',10,'change_order'),(30,'Can delete order',10,'delete_order'),(31,'Can add order goods',11,'add_ordergoods'),(32,'Can change order goods',11,'change_ordergoods'),(33,'Can delete order goods',11,'delete_ordergoods');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'pet','cart'),(8,'pet','goods'),(10,'pet','order'),(11,'pet','ordergoods'),(7,'pet','user'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-03-14 11:38:02.340600'),(2,'auth','0001_initial','2019-03-14 11:38:12.669963'),(3,'admin','0001_initial','2019-03-14 11:38:14.767764'),(4,'admin','0002_logentry_remove_auto_add','2019-03-14 11:38:14.881549'),(5,'contenttypes','0002_remove_content_type_name','2019-03-14 11:38:16.093825'),(6,'auth','0002_alter_permission_name_max_length','2019-03-14 11:38:16.892104'),(7,'auth','0003_alter_user_email_max_length','2019-03-14 11:38:17.588184'),(8,'auth','0004_alter_user_username_opts','2019-03-14 11:38:17.634608'),(9,'auth','0005_alter_user_last_login_null','2019-03-14 11:38:18.218455'),(10,'auth','0006_require_contenttypes_0002','2019-03-14 11:38:18.251990'),(11,'auth','0007_alter_validators_add_error_messages','2019-03-14 11:38:18.299163'),(12,'auth','0008_alter_user_username_max_length','2019-03-14 11:38:19.038681'),(13,'sessions','0001_initial','2019-03-14 11:38:19.588078'),(14,'pet','0001_initial','2019-03-14 15:52:38.300971'),(15,'pet','0002_goods','2019-03-15 03:00:07.061043'),(16,'pet','0003_cart','2019-03-17 12:20:44.968970'),(17,'pet','0004_auto_20190318_0132','2019-03-18 01:32:45.541373');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('ohsjyft0be34ulh02q0xosms43czrb2s','MzA0NzgyMjlkNDY5MGRlN2NjNjJmZDUzMGEyYzMxOTE1OWM2OGQzNTp7InRva2VuIjoiNjljZDczZDk3ZjdhYTZiMTJlZmZkNmI5M2EyYTU2MDEifQ==','2019-04-01 08:12:25.401251');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_cart`
--

DROP TABLE IF EXISTS `pet_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pet_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `isselect` tinyint(1) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pet_cart_goods_id_591809b0_fk_pet_goods_id` (`goods_id`),
  KEY `pet_cart_user_id_b8760e2a_fk_pet_user_id` (`user_id`),
  CONSTRAINT `pet_cart_goods_id_591809b0_fk_pet_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `pet_goods` (`id`),
  CONSTRAINT `pet_cart_user_id_b8760e2a_fk_pet_user_id` FOREIGN KEY (`user_id`) REFERENCES `pet_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_cart`
--

LOCK TABLES `pet_cart` WRITE;
/*!40000 ALTER TABLE `pet_cart` DISABLE KEYS */;
INSERT INTO `pet_cart` VALUES (20,1,1,4,11);
/*!40000 ALTER TABLE `pet_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_goods`
--

DROP TABLE IF EXISTS `pet_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pet_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `g_name` varchar(40) NOT NULL,
  `g_img` varchar(255) NOT NULL,
  `g_price` varchar(40) NOT NULL,
  `g_txt` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_goods`
--

LOCK TABLES `pet_goods` WRITE;
/*!40000 ALTER TABLE `pet_goods` DISABLE KEYS */;
INSERT INTO `pet_goods` VALUES (1,'风来客 幼犬营养骨棒 肌肉味！','../static/img/content/042654989973e6ebd06dfa49b39a76bd.jpg@!200w-c.jpg','58.4','嘘后水全球兽医推荐，真正从根源彻底清楚尿液气味！有效抑菌！'),(2,'悠润 宠物专用嘘水后抑菌不留味！','../static/img/content/db225e272a117b155ed226c123fadc82.jpg@!200w-c.jpg','38.4','狗狗会通过尿液来占领领地，并重覆在相同位置上加强尿液气味，所以狗狗尿后一定要迅速处理。嘘后水quanqiiu兽医推荐，真正从根源彻底清楚尿液气味！有效抑菌！'),(3,'英国MAG 优质配方海藻粉 美毛更出众','../static/img/content/363cae7c577b866e9e55c36b0edd08bf.jpg@!200w-c.jpg','109','狗狗会通过尿液来占领领地，并重覆在相同位置上加强尿液气味，所以狗狗尿后一定要迅速处理。嘘后水quanqiiu兽医推荐，真正从根源彻底清楚尿液气味！有效抑菌！'),(4,'七彩糖果 犬用缺口单碗 春绿小号','../static/img/content/ce7ba02dc4f7d5686adeafe7a1144d69.jpg@!200w-c.jpg','38.4','狗狗会通过尿液来占领领地，并重覆在相同位置上加强尿液气味，所以狗狗尿后一定要迅速处理。嘘后水quanqiiu兽医推荐，真正从根源彻底清楚尿液气味！有效抑菌！'),(5,'悠润 宠物专用嘘水抑菌不留味！','../static/img/content/ff3beb0bacad6eb7baee3226e0b2e351.jpg@!200w-c.jpg','38.4','狗狗会通过尿液来占领领地，并重覆在相同位置上加强尿液气味，所以狗狗尿后一定要迅速处理。嘘后水quanqiiu兽医推荐，真正从根源彻底清楚尿液气味！有效抑菌！'),(6,'悠润 宠物专用嘘水抑菌不留味！','../static/img/content/eeb9ca10fc25b12673304848a72f5b67.jpg@!200w-c.jpg','38.4','狗狗会通过尿液来占领领地，并重覆在相同位置上加强尿液气味，所以狗狗尿后一定要迅速处理。嘘后水quanqiiu兽医推荐，真正从根源彻底清楚尿液气味！有效抑菌！');
/*!40000 ALTER TABLE `pet_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_order`
--

DROP TABLE IF EXISTS `pet_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pet_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(256) NOT NULL,
  `status` int(11) NOT NULL,
  `createtime` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pet_order_user_id_19a602fd_fk_pet_user_id` (`user_id`),
  CONSTRAINT `pet_order_user_id_19a602fd_fk_pet_user_id` FOREIGN KEY (`user_id`) REFERENCES `pet_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_order`
--

LOCK TABLES `pet_order` WRITE;
/*!40000 ALTER TABLE `pet_order` DISABLE KEYS */;
INSERT INTO `pet_order` VALUES (58,'e3245521-fc39-512a-85e9-d7499ff72119',1,'2019-03-18 09:11:00.781109',11),(59,'1629517b-50ff-513a-b92a-bed34e74c6c5',1,'2019-03-18 09:11:04.341121',11),(60,'7c89121a-2982-51a0-aaf6-3d1be91695e4',1,'2019-03-18 09:17:22.331975',11),(61,'a666f85f-7d63-53db-8c8a-4ec2e67cbd21',1,'2019-03-18 09:17:24.234911',11),(62,'0aac9952-a55c-5db7-ad10-49813577e6aa',1,'2019-03-18 09:17:25.939293',11),(63,'43cbe658-a620-517e-a061-2430743af32e',1,'2019-03-18 09:25:35.893102',11),(64,'fb3b05ca-55ba-5962-92e4-040327ade5c2',1,'2019-03-18 09:25:40.324034',11),(65,'2d71d131-c063-54ec-a410-39280ebcc6f0',1,'2019-03-18 09:25:44.193175',11),(66,'ab02bdbc-c72b-5c21-b9cb-f29b0de69c20',1,'2019-03-18 09:25:47.500127',11),(67,'9d10f80d-8fd3-52c7-818c-fe6392d56fe6',1,'2019-03-18 09:25:59.292184',11);
/*!40000 ALTER TABLE `pet_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_ordergoods`
--

DROP TABLE IF EXISTS `pet_ordergoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pet_ordergoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pet_ordergoods_goods_id_66b26386_fk_pet_goods_id` (`goods_id`),
  KEY `pet_ordergoods_order_id_112f361b_fk_pet_order_id` (`order_id`),
  CONSTRAINT `pet_ordergoods_goods_id_66b26386_fk_pet_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `pet_goods` (`id`),
  CONSTRAINT `pet_ordergoods_order_id_112f361b_fk_pet_order_id` FOREIGN KEY (`order_id`) REFERENCES `pet_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_ordergoods`
--

LOCK TABLES `pet_ordergoods` WRITE;
/*!40000 ALTER TABLE `pet_ordergoods` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet_ordergoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_user`
--

DROP TABLE IF EXISTS `pet_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pet_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_tel` varchar(11) NOT NULL,
  `u_name` varchar(40) NOT NULL,
  `u_password` varchar(256) NOT NULL,
  `token` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_name` (`u_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_user`
--

LOCK TABLES `pet_user` WRITE;
/*!40000 ALTER TABLE `pet_user` DISABLE KEYS */;
INSERT INTO `pet_user` VALUES (1,'11111111111','1111','25d55ad283aa400af464c76d713c07ad','b1bcf8cd9d3d75309a505d9cbc8d1e19'),(2,'22222222222','4444','25d55ad283aa400af464c76d713c07ad','309d7d93faa030bef49d03859e260eff'),(3,'11111111111','liuxinfeng','25d55ad283aa400af464c76d713c07ad','6d34f22c2df0a64b14bd527bec34d7b4'),(5,'12345678999','zxyz','25d55ad283aa400af464c76d713c07ad','0daf8c4b4a1ad8f50a1d21a77b42c502'),(7,'13477398617','zzzz','25d55ad283aa400af464c76d713c07ad','5068fe58661536b700099eefe0e86987'),(8,'11111111111','5555','25d55ad283aa400af464c76d713c07ad','abb37bbab7e304ccab3284ae82e3e66c'),(9,'11111111111','zxfzxf','25d55ad283aa400af464c76d713c07ad','fc417ae82b3c6f542917d8a959d2a566'),(10,'11111111111','abcd','25d55ad283aa400af464c76d713c07ad','7f1dc352c1a9db14ec9b4895d91835c3'),(11,'11111111111','abcde','25d55ad283aa400af464c76d713c07ad','69cd73d97f7aa6b12effd6b93a2a5601');
/*!40000 ALTER TABLE `pet_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-18 17:57:10
