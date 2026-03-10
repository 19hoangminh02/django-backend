-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: fashion_shop_db
-- ------------------------------------------------------
-- Server version	8.4.6

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Sản phẩm trong giỏ',7,'add_cartitem'),(26,'Can change Sản phẩm trong giỏ',7,'change_cartitem'),(27,'Can delete Sản phẩm trong giỏ',7,'delete_cartitem'),(28,'Can view Sản phẩm trong giỏ',7,'view_cartitem'),(29,'Can add Đơn hàng',8,'add_order'),(30,'Can change Đơn hàng',8,'change_order'),(31,'Can delete Đơn hàng',8,'delete_order'),(32,'Can view Đơn hàng',8,'view_order'),(33,'Can add Giỏ hàng',9,'add_cart'),(34,'Can change Giỏ hàng',9,'change_cart'),(35,'Can delete Giỏ hàng',9,'delete_cart'),(36,'Can view Giỏ hàng',9,'view_cart'),(37,'Can add Danh mục',10,'add_category'),(38,'Can change Danh mục',10,'change_category'),(39,'Can delete Danh mục',10,'delete_category'),(40,'Can view Danh mục',10,'view_category'),(41,'Can add Lịch sử xem',11,'add_viewhistory'),(42,'Can change Lịch sử xem',11,'change_viewhistory'),(43,'Can delete Lịch sử xem',11,'delete_viewhistory'),(44,'Can view Lịch sử xem',11,'view_viewhistory'),(45,'Can add Sản phẩm',12,'add_product'),(46,'Can change Sản phẩm',12,'change_product'),(47,'Can delete Sản phẩm',12,'delete_product'),(48,'Can view Sản phẩm',12,'view_product'),(49,'Can add Biến thể sản phẩm',13,'add_productvariant'),(50,'Can change Biến thể sản phẩm',13,'change_productvariant'),(51,'Can delete Biến thể sản phẩm',13,'delete_productvariant'),(52,'Can view Biến thể sản phẩm',13,'view_productvariant'),(53,'Can add Thanh toán',14,'add_payment'),(54,'Can change Thanh toán',14,'change_payment'),(55,'Can delete Thanh toán',14,'delete_payment'),(56,'Can view Thanh toán',14,'view_payment'),(57,'Can add Chi tiết đơn hàng',15,'add_orderitem'),(58,'Can change Chi tiết đơn hàng',15,'change_orderitem'),(59,'Can delete Chi tiết đơn hàng',15,'delete_orderitem'),(60,'Can view Chi tiết đơn hàng',15,'view_orderitem'),(61,'Can add Sản phẩm yêu thích',16,'add_wishlist'),(62,'Can change Sản phẩm yêu thích',16,'change_wishlist'),(63,'Can delete Sản phẩm yêu thích',16,'delete_wishlist'),(64,'Can view Sản phẩm yêu thích',16,'view_wishlist');
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
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$k8yu4hU8pWAvcBxrPK6d3p$G8ceGPHQYs3LpjqABgm1cH3pKq0NPCjE5WNegCYUQl8=','2026-03-10 06:38:36.919757',1,'admin','','','minh@gmail.com',1,1,'2026-01-09 06:34:54.650191'),(2,'pbkdf2_sha256$1000000$L6xKwHB5a92BMGpRgG12Lv$NrmHLdg+TGdc2sy0Lp6SFSXSbUqmnmvvH8RHeYtNJlM=','2026-03-10 06:29:04.574232',0,'minh','','','minh@gmail.com',0,1,'2026-01-17 07:03:43.322574'),(3,'pbkdf2_sha256$1000000$KTLtlZYxrnjUTgNDNXwCL4$7eJ/a/AZkIrqoDHgUt5hytUlbWccwoJ6Fip4bLlaYK0=','2026-01-17 07:06:18.561168',0,'minh1','','','minh@gmail.com',0,1,'2026-01-17 07:06:18.227618'),(4,'pbkdf2_sha256$1000000$Bce76pR2XkeLiL7Iy8H3EG$GDj/fu8MQb/8UTJCxblW9Tu+M2xDZ0bREldsshirIdE=','2026-03-06 18:28:14.359957',0,'tester_user','','','tester_user@example.com',0,1,'2026-03-06 18:25:29.745098');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-01-09 09:43:39.475869','1','Áo thun',1,'[{\"added\": {}}]',10,1),(2,'2026-01-09 09:44:31.853511','1','Áo thun basic cotton',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o thun basic cotton - Size S - \\u0110\\u1ecf\"}}]',12,1),(3,'2026-01-09 09:45:02.117537','1','Áo thun basic cotton',3,'',12,1),(4,'2026-01-09 09:45:28.162911','1','Áo thun',3,'',10,1),(5,'2026-01-19 09:20:41.494439','2','Áo thun',1,'[{\"added\": {}}]',10,1),(6,'2026-01-19 09:21:52.464690','3','Quần jean',1,'[{\"added\": {}}]',10,1),(7,'2026-01-19 09:22:03.241741','4','Váy',1,'[{\"added\": {}}]',10,1),(8,'2026-01-19 09:22:10.955335','5','Áo khoác',1,'[{\"added\": {}}]',10,1),(9,'2026-01-19 09:22:17.921183','6','Phụ kiện',1,'[{\"added\": {}}]',10,1),(10,'2026-01-19 09:39:03.237177','5','Áo khoác',3,'',10,1),(11,'2026-01-19 09:39:03.237177','2','Áo thun',3,'',10,1),(12,'2026-01-19 09:39:03.237177','6','Phụ kiện',3,'',10,1),(13,'2026-01-19 09:39:03.237177','3','Quần jean',3,'',10,1),(14,'2026-01-19 09:39:03.237177','4','Váy',3,'',10,1),(15,'2026-01-25 19:08:49.202426','7','Đồ nam',1,'[{\"added\": {}}]',10,1),(16,'2026-01-25 19:08:56.430381','8','Đồ nữ',1,'[{\"added\": {}}]',10,1),(17,'2026-01-25 19:10:08.633256','9','Đồ nam > Áo thun nam',1,'[{\"added\": {}}]',10,1),(18,'2026-01-29 17:14:35.625594','2','Áo thun nam trắng basic',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o thun nam tr\\u1eafng basic - Size S - Tr\\u1eafng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o thun nam tr\\u1eafng basic - Size M - Tr\\u1eafng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o thun nam tr\\u1eafng basic - Size L - Tr\\u1eafng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o thun nam tr\\u1eafng basic - Size XL - Tr\\u1eafng\"}}]',12,1),(19,'2026-02-04 18:39:27.256457','2','Đơn #2 - minh',2,'[{\"changed\": {\"fields\": [\"Tr\\u1ea1ng th\\u00e1i\"]}}]',8,1),(20,'2026-03-03 10:10:36.037970','10','Đồ nam > Áo polo',1,'[{\"added\": {}}]',10,1),(21,'2026-03-03 10:11:16.894234','11','Đồ nam > Áo khoác nam',1,'[{\"added\": {}}]',10,1),(22,'2026-03-03 10:11:43.564508','12','Đồ nam > Quần nam',1,'[{\"added\": {}}]',10,1),(23,'2026-03-03 10:12:19.096537','13','Đồ nam > Phụ kiện nam',1,'[{\"added\": {}}]',10,1),(24,'2026-03-03 10:13:40.960362','14','Đồ nữ > Áo khoác nữ',1,'[{\"added\": {}}]',10,1),(25,'2026-03-03 10:13:46.707774','15','Đồ nữ > Áo thun nữ',1,'[{\"added\": {}}]',10,1),(26,'2026-03-03 10:14:19.952387','10','Đồ nam > Áo polo nam',2,'[{\"changed\": {\"fields\": [\"T\\u00ean danh m\\u1ee5c\"]}}]',10,1),(27,'2026-03-03 10:15:02.827289','16','Đồ nữ > Áo polo nữ',1,'[{\"added\": {}}]',10,1),(28,'2026-03-03 10:15:46.644068','17','Đồ nữ > Quần - váy nữ',1,'[{\"added\": {}}]',10,1),(29,'2026-03-03 10:16:01.927168','18','Đồ nữ > Phụ kiện nữ',1,'[{\"added\": {}}]',10,1),(30,'2026-03-06 17:58:47.112779','3','Áo thun form rộng',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o thun form r\\u1ed9ng - Size S - Tr\\u1eafng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o thun form r\\u1ed9ng - Size M - \\u0110en\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o thun form r\\u1ed9ng - Size L - \\u0110\\u1ecf\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o thun form r\\u1ed9ng - Size XL - X\\u00e1m\"}}]',12,1),(31,'2026-03-06 18:34:36.719873','4','Chân váy ngắn',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Ch\\u00e2n v\\u00e1y ng\\u1eafn - Size S - Tr\\u1eafng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Ch\\u00e2n v\\u00e1y ng\\u1eafn - Size M - Tr\\u1eafng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Ch\\u00e2n v\\u00e1y ng\\u1eafn - Size L - Tr\\u1eafng\"}}]',12,1),(32,'2026-03-06 18:37:31.587889','3','Áo thun form rộng',3,'',12,1),(33,'2026-03-06 18:38:49.044224','5','Áo thun form rộng',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o thun form r\\u1ed9ng - Size S - X\\u00e1m\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o thun form r\\u1ed9ng - Size M - X\\u00e1m\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o thun form r\\u1ed9ng - Size L - X\\u00e1m\"}}]',12,1),(34,'2026-03-07 09:37:10.289312','6','Áo sơ mi nữ tay dài',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o s\\u01a1 mi n\\u1eef tay d\\u00e0i - Size S - H\\u1ed3ng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o s\\u01a1 mi n\\u1eef tay d\\u00e0i - Size M - H\\u1ed3ng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o s\\u01a1 mi n\\u1eef tay d\\u00e0i - Size L - H\\u1ed3ng\"}}]',12,1),(35,'2026-03-07 09:38:07.792552','6','Áo sơ mi nữ tay dài',2,'[{\"changed\": {\"fields\": [\"Gi\\u00e1\"]}}]',12,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(9,'shop','cart'),(7,'shop','cartitem'),(10,'shop','category'),(8,'shop','order'),(15,'shop','orderitem'),(14,'shop','payment'),(12,'shop','product'),(13,'shop','productvariant'),(11,'shop','viewhistory'),(16,'shop','wishlist');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-01-09 06:30:24.538330'),(2,'auth','0001_initial','2026-01-09 06:30:25.211236'),(3,'admin','0001_initial','2026-01-09 06:30:25.352948'),(4,'admin','0002_logentry_remove_auto_add','2026-01-09 06:30:25.364187'),(5,'admin','0003_logentry_add_action_flag_choices','2026-01-09 06:30:25.372006'),(6,'contenttypes','0002_remove_content_type_name','2026-01-09 06:30:25.482405'),(7,'auth','0002_alter_permission_name_max_length','2026-01-09 06:30:25.550729'),(8,'auth','0003_alter_user_email_max_length','2026-01-09 06:30:25.566597'),(9,'auth','0004_alter_user_username_opts','2026-01-09 06:30:25.584442'),(10,'auth','0005_alter_user_last_login_null','2026-01-09 06:30:25.664991'),(11,'auth','0006_require_contenttypes_0002','2026-01-09 06:30:25.664991'),(12,'auth','0007_alter_validators_add_error_messages','2026-01-09 06:30:25.669174'),(13,'auth','0008_alter_user_username_max_length','2026-01-09 06:30:25.731289'),(14,'auth','0009_alter_user_last_name_max_length','2026-01-09 06:30:25.807901'),(15,'auth','0010_alter_group_name_max_length','2026-01-09 06:30:25.825677'),(16,'auth','0011_update_proxy_permissions','2026-01-09 06:30:25.830631'),(17,'auth','0012_alter_user_first_name_max_length','2026-01-09 06:30:25.902367'),(18,'sessions','0001_initial','2026-01-09 06:30:25.946653'),(19,'shop','0001_initial','2026-01-09 09:30:26.042927'),(20,'shop','0002_category_parent_alter_category_name_and_more','2026-01-20 01:47:30.113529'),(21,'shop','0003_add_sepay_payment_fields','2026-02-04 17:16:30.028473'),(22,'shop','0004_add_wishlist_model','2026-02-04 19:10:20.751624'),(23,'shop','0005_productvariant_image','2026-03-10 06:36:02.098687');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1o12pgfii7gg26rovr5wnht2qxl29omc','.eJxVjDsOwyAQRO9CHSH-WCnT5wxoYdngJALJ2JWVu8dILpJy3ryZnQXY1hK2npcwI7syxS6_LEJ65ToKfEJ9NJ5aXZc58qHws-383jC_b6f7d1Cgl2PtyaFwlGwCQjKG0oRaWDJgzZE8Gi8HiRYVaaMzSQWQJie1VSJm9vkCBD04Wg:1vxNTs:WhL72zXxaGnnKeaUCamwWXGGCaNNCgA8ulEyBLQAMRw','2026-03-17 11:00:00.141652'),('q5bo9tb365yk5s8jo3st0ck1ggy86667','.eJxVjEEOwiAQRe_C2hCYDgVcuvcMZIBBqoYmpV0Z765NutDtf-_9lwi0rTVsnZcwZXEWWpx-t0jpwW0H-U7tNss0t3WZotwVedAur3Pm5-Vw_w4q9fqtGQtjHDyw4uTA2NFmZJONM7kgEI5aK1U8JiKFg9WkCnoojgC00yzeH-EaN2k:1vyZyj:cPHkSPnD6ZEiFbx4V4ARazYYyUiRjPi9_VDcstFZ3I0','2026-03-20 18:32:49.467850'),('qqq749fc3t92sz85xuwm0btqxvss6uq4','e30:1vh0LX:oAuqNEQBTrujvawy6_wA156ozHS5xsxtVedHzr1qxgA','2026-01-31 07:03:43.685363'),('ulhrf36eez62jckrshp7od5yva7ehkde','.eJxVjEEOwiAQRe_C2hCYDgVcuvcMZIBBqoYmpV0Z765NutDtf-_9lwi0rTVsnZcwZXEWWpx-t0jpwW0H-U7tNss0t3WZotwVedAur3Pm5-Vw_w4q9fqtGQtjHDyw4uTA2NFmZJONM7kgEI5aK1U8JiKFg9WkCnoojgC00yzeH-EaN2k:1vzqjk:9Kdz-vvia5z9J06e06hM5XMk7KOzMhoaQ7D-Y22XGaQ','2026-03-24 06:38:36.924575'),('w3eugngdykrpov08jmo09283zjk8j7nt','.eJxVjEEOwiAQRe_C2hCYDgVcuvcMZIBBqoYmpV0Z765NutDtf-_9lwi0rTVsnZcwZXEWWpx-t0jpwW0H-U7tNss0t3WZotwVedAur3Pm5-Vw_w4q9fqtGQtjHDyw4uTA2NFmZJONM7kgEI5aK1U8JiKFg9WkCnoojgC00yzeH-EaN2k:1vnipL:u9Jyxg0-Y2MXbaKNyJh-Mxy0NKvCX2NBfByGogCZ7Ls','2026-02-18 19:46:15.983516'),('z0zesjzyskqid7rx84q0nlscpn8o61x9','.eJxVjEEOgjAQRe8ya9O0wrSVpXtPYEwzTKeCIiS0rIx3FxIWuv3v_feGQEvpwpJlDn2EBmo4_G4t8VPGDcQHjfdJ8TSWuW_VpqidZnWZogzn3f0LdJS79Z2MY0zGktaRk_OtJqerI5I_raDSpvbGOhK05Kwhl5C144hskdhbXKNZBuEiMTDNJfRFXhmaKxiE2-cLtqlBUA:1vyb6p:YYM14UFOphbw3Gm3BpQ4GI10-aeXVeBfY-hRBUfPa2I','2026-03-20 19:45:15.895702');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_cart`
--

DROP TABLE IF EXISTS `shop_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `shop_cart_user_id_27925ac6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_cart`
--

LOCK TABLES `shop_cart` WRITE;
/*!40000 ALTER TABLE `shop_cart` DISABLE KEYS */;
INSERT INTO `shop_cart` VALUES (1,'2026-01-19 07:59:18.559661',2),(2,'2026-01-19 14:49:09.153099',1),(4,'2026-03-06 18:28:43.912890',4);
/*!40000 ALTER TABLE `shop_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_cartitem`
--

DROP TABLE IF EXISTS `shop_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_cartitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `added_at` datetime(6) NOT NULL,
  `cart_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `variant_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_cartitem_cart_id_product_id_variant_id_1e12b429_uniq` (`cart_id`,`product_id`,`variant_id`),
  KEY `shop_cartitem_product_id_09e4b7dd_fk_shop_product_id` (`product_id`),
  KEY `shop_cartitem_variant_id_51135d0d_fk_shop_productvariant_id` (`variant_id`),
  CONSTRAINT `shop_cartitem_cart_id_6bf1447e_fk_shop_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `shop_cart` (`id`),
  CONSTRAINT `shop_cartitem_product_id_09e4b7dd_fk_shop_product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`),
  CONSTRAINT `shop_cartitem_variant_id_51135d0d_fk_shop_productvariant_id` FOREIGN KEY (`variant_id`) REFERENCES `shop_productvariant` (`id`),
  CONSTRAINT `shop_cartitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_cartitem`
--

LOCK TABLES `shop_cartitem` WRITE;
/*!40000 ALTER TABLE `shop_cartitem` DISABLE KEYS */;
INSERT INTO `shop_cartitem` VALUES (15,1,'2026-03-06 19:44:52.462992',4,5,13),(18,1,'2026-03-07 09:34:15.907859',1,4,10);
/*!40000 ALTER TABLE `shop_cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_category`
--

DROP TABLE IF EXISTS `shop_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_category_name_parent_id_914f4785_uniq` (`name`,`parent_id`),
  KEY `shop_category_parent_id_901626c9_fk_shop_category_id` (`parent_id`),
  CONSTRAINT `shop_category_parent_id_901626c9_fk_shop_category_id` FOREIGN KEY (`parent_id`) REFERENCES `shop_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_category`
--

LOCK TABLES `shop_category` WRITE;
/*!40000 ALTER TABLE `shop_category` DISABLE KEYS */;
INSERT INTO `shop_category` VALUES (7,'Đồ nam','2026-01-25 19:08:49.186592',NULL),(8,'Đồ nữ','2026-01-25 19:08:56.430381',NULL),(9,'Áo thun nam','2026-01-25 19:10:08.633256',7),(10,'Áo polo nam','2026-03-03 10:10:36.017965',7),(11,'Áo khoác nam','2026-03-03 10:11:16.888036',7),(12,'Quần nam','2026-03-03 10:11:43.564508',7),(13,'Phụ kiện nam','2026-03-03 10:12:19.096537',7),(14,'Áo khoác nữ','2026-03-03 10:13:40.960362',8),(15,'Áo thun nữ','2026-03-03 10:13:46.706774',8),(16,'Áo polo nữ','2026-03-03 10:15:02.827289',8),(17,'Quần - váy nữ','2026-03-03 10:15:46.644068',8),(18,'Phụ kiện nữ','2026-03-03 10:16:01.927168',8);
/*!40000 ALTER TABLE `shop_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_order`
--

DROP TABLE IF EXISTS `shop_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `total_price` decimal(10,0) NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_order_user_id_00aba627_fk_auth_user_id` (`user_id`),
  CONSTRAINT `shop_order_user_id_00aba627_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_order`
--

LOCK TABLES `shop_order` WRITE;
/*!40000 ALTER TABLE `shop_order` DISABLE KEYS */;
INSERT INTO `shop_order` VALUES (1,1250000,'paid','2026-01-29 18:53:46.715742','2026-01-29 18:54:41.731314',2),(2,250000,'paid','2026-02-04 16:18:03.333478','2026-02-04 18:39:27.254463',2),(3,250000,'paid','2026-02-04 18:38:13.541202','2026-02-04 18:38:27.849856',2),(4,848000,'pending','2026-03-06 20:19:28.724773','2026-03-06 20:19:28.724773',2);
/*!40000 ALTER TABLE `shop_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_orderitem`
--

DROP TABLE IF EXISTS `shop_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_orderitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `variant_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_orderitem_order_id_2f1b00cf_fk_shop_order_id` (`order_id`),
  KEY `shop_orderitem_product_id_48153f22_fk_shop_product_id` (`product_id`),
  KEY `shop_orderitem_variant_id_4a4f9eb9_fk_shop_productvariant_id` (`variant_id`),
  CONSTRAINT `shop_orderitem_order_id_2f1b00cf_fk_shop_order_id` FOREIGN KEY (`order_id`) REFERENCES `shop_order` (`id`),
  CONSTRAINT `shop_orderitem_product_id_48153f22_fk_shop_product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`),
  CONSTRAINT `shop_orderitem_variant_id_4a4f9eb9_fk_shop_productvariant_id` FOREIGN KEY (`variant_id`) REFERENCES `shop_productvariant` (`id`),
  CONSTRAINT `shop_orderitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_orderitem`
--

LOCK TABLES `shop_orderitem` WRITE;
/*!40000 ALTER TABLE `shop_orderitem` DISABLE KEYS */;
INSERT INTO `shop_orderitem` VALUES (1,2,250000,1,2,2),(2,1,250000,1,2,4),(3,2,250000,1,2,5),(4,1,250000,2,2,2),(5,1,250000,3,2,5),(6,1,250000,4,2,3),(7,1,399000,4,4,10),(8,1,199000,4,5,13);
/*!40000 ALTER TABLE `shop_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_payment`
--

DROP TABLE IF EXISTS `shop_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_payment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `method` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `order_id` bigint NOT NULL,
  `paid_at` datetime(6) DEFAULT NULL,
  `reference_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`),
  UNIQUE KEY `reference_code` (`reference_code`),
  CONSTRAINT `shop_payment_order_id_20828773_fk_shop_order_id` FOREIGN KEY (`order_id`) REFERENCES `shop_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_payment`
--

LOCK TABLES `shop_payment` WRITE;
/*!40000 ALTER TABLE `shop_payment` DISABLE KEYS */;
INSERT INTO `shop_payment` VALUES (1,'qr_code','completed','2026-01-29 18:53:46.725242',1,NULL,NULL,NULL),(2,'qr_code','pending','2026-02-04 16:18:03.361861',2,NULL,NULL,NULL),(3,'qr_code','completed','2026-02-04 18:38:13.556259',3,'2026-02-04 18:38:27.843684','DH3',NULL),(4,'qr_code','pending','2026-03-06 20:19:28.742915',4,NULL,'DH4',NULL);
/*!40000 ALTER TABLE `shop_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_product`
--

DROP TABLE IF EXISTS `shop_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_product_category_id_14d7eea8_fk_shop_category_id` (`category_id`),
  CONSTRAINT `shop_product_category_id_14d7eea8_fk_shop_category_id` FOREIGN KEY (`category_id`) REFERENCES `shop_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product`
--

LOCK TABLES `shop_product` WRITE;
/*!40000 ALTER TABLE `shop_product` DISABLE KEYS */;
INSERT INTO `shop_product` VALUES (2,'Áo thun nam trắng basic',250000,'Áo thun nam chất liệu cotton 100%   \r\nThoáng mát, form regular fit  \r\nPhù hợp đi làm, đi chơi','products/ao_thun_trang.jpg',1,'2026-01-29 17:14:35.588578','2026-01-29 17:14:35.588578',9),(4,'Chân váy ngắn',399000,'Chân Váy Ngắn Nữ Thời Trang – Dễ Phối Đồ\r\n\r\n✔ Thiết kế dáng váy ngắn trẻ trung\r\n✔ Chất vải mềm, mặc thoải mái\r\n✔ Tôn dáng, dễ phối đồ\r\n✔ Phù hợp đi học, đi chơi, dạo phố\r\n\r\n? Mix đẹp với áo thun, áo croptop, áo sơ mi','products/chan_vay_ngan.jpg',1,'2026-03-06 18:34:36.715127','2026-03-06 18:34:36.715698',17),(5,'Áo thun form rộng',199000,'ÁO THUN FORM RỘNG OVERSIZE – CHẤT COTTON MỀM MÁT\r\n\r\n✔ Form rộng thời trang, mặc thoải mái\r\n✔ Chất vải cotton mềm, thoáng khí\r\n✔ Thiết kế basic dễ phối đồ\r\n✔ Phù hợp nam và nữ\r\n\r\n? Phù hợp mặc đi học, đi chơi, dạo phố\r\n? Dễ phối với quần jean, short, jogger','products/aothunformrong1_ucYYJo5.jpg',1,'2026-03-06 18:38:49.037932','2026-03-06 18:38:49.037932',9),(6,'Áo sơ mi nữ tay dài',199000,'Áo Sơ Mi Nữ Tay Dài – Thanh Lịch, Dễ Phối Đồ\r\n\r\n✔ Thiết kế tay dài thanh lịch, thời trang\r\n✔ Chất vải mềm mại, thoáng mát\r\n✔ Form áo tôn dáng, mặc thoải mái\r\n✔ Phù hợp đi học, đi làm, dạo phố\r\n\r\n? Mix đẹp với chân váy, quần jean, quần tây','products/ao_so_mi_nu_tay_dai.jpg',1,'2026-03-07 09:37:10.283294','2026-03-07 09:38:07.792552',15);
/*!40000 ALTER TABLE `shop_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_productvariant`
--

DROP TABLE IF EXISTS `shop_productvariant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_productvariant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `size` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int unsigned NOT NULL,
  `is_available` tinyint(1) NOT NULL,
  `product_id` bigint NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_productvariant_product_id_size_color_79555036_uniq` (`product_id`,`size`,`color`),
  CONSTRAINT `shop_productvariant_product_id_3268ff6d_fk_shop_product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`),
  CONSTRAINT `shop_productvariant_chk_1` CHECK ((`stock` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_productvariant`
--

LOCK TABLES `shop_productvariant` WRITE;
/*!40000 ALTER TABLE `shop_productvariant` DISABLE KEYS */;
INSERT INTO `shop_productvariant` VALUES (2,'S','white',17,1,2,NULL),(3,'M','white',19,1,2,NULL),(4,'L','white',19,1,2,NULL),(5,'XL','white',17,1,2,NULL),(10,'S','white',99,1,4,NULL),(11,'M','white',100,1,4,NULL),(12,'L','white',100,1,4,NULL),(13,'S','gray',99,1,5,NULL),(14,'M','gray',100,1,5,NULL),(15,'L','gray',100,1,5,NULL),(16,'S','pink',100,1,6,NULL),(17,'M','pink',100,1,6,NULL),(18,'L','pink',100,1,6,NULL);
/*!40000 ALTER TABLE `shop_productvariant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_viewhistory`
--

DROP TABLE IF EXISTS `shop_viewhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_viewhistory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `viewed_at` datetime(6) NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_viewhistory_product_id_9e861b23_fk_shop_product_id` (`product_id`),
  KEY `shop_viewhistory_user_id_0a37fe96_fk_auth_user_id` (`user_id`),
  CONSTRAINT `shop_viewhistory_product_id_9e861b23_fk_shop_product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`),
  CONSTRAINT `shop_viewhistory_user_id_0a37fe96_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_viewhistory`
--

LOCK TABLES `shop_viewhistory` WRITE;
/*!40000 ALTER TABLE `shop_viewhistory` DISABLE KEYS */;
INSERT INTO `shop_viewhistory` VALUES (1,'2026-01-29 17:14:42.259785',2,1),(2,'2026-01-29 17:15:11.006588',2,2),(3,'2026-01-29 17:17:45.083347',2,2),(4,'2026-01-29 18:11:28.843226',2,1),(5,'2026-01-29 18:11:56.501446',2,2),(6,'2026-01-29 18:12:08.278894',2,2),(7,'2026-01-29 18:16:29.923725',2,2),(8,'2026-01-29 18:16:43.330389',2,2),(9,'2026-01-29 18:16:53.734868',2,2),(10,'2026-01-29 18:48:34.453123',2,1),(11,'2026-01-29 18:48:50.154102',2,2),(12,'2026-01-29 18:49:02.103963',2,2),(13,'2026-01-29 18:51:04.868608',2,2),(14,'2026-01-29 18:51:47.996987',2,2),(15,'2026-01-29 18:51:56.728822',2,2),(16,'2026-01-29 18:58:25.106661',2,2),(17,'2026-01-29 18:58:35.407166',2,2),(18,'2026-01-29 19:27:28.076094',2,2),(19,'2026-01-29 19:35:49.834621',2,2),(20,'2026-01-29 19:36:04.110089',2,2),(21,'2026-01-29 19:36:22.347132',2,2),(22,'2026-01-29 19:36:55.187606',2,2),(23,'2026-01-29 20:05:18.372512',2,2),(24,'2026-01-29 20:05:26.471830',2,2),(25,'2026-02-04 16:17:19.939252',2,2),(26,'2026-02-24 18:20:38.370760',2,1),(27,'2026-02-24 18:24:52.052435',2,2),(28,'2026-02-24 18:27:08.231107',2,2),(29,'2026-02-24 18:45:53.288508',2,1),(30,'2026-02-24 19:13:11.755907',2,1),(46,'2026-03-06 18:36:35.643756',4,2),(49,'2026-03-06 18:39:03.444038',5,2),(50,'2026-03-06 19:04:10.538282',5,4),(51,'2026-03-06 19:10:48.866585',5,4),(52,'2026-03-06 19:27:44.099323',4,2),(53,'2026-03-06 19:44:18.549904',5,4),(54,'2026-03-06 19:49:56.049571',2,1),(55,'2026-03-06 20:17:26.215902',5,1),(56,'2026-03-06 20:19:44.184777',4,2),(57,'2026-03-07 08:19:35.764579',4,2),(58,'2026-03-07 08:22:15.777191',4,2),(59,'2026-03-07 09:33:53.875207',4,2),(60,'2026-03-07 09:34:11.192551',4,2),(61,'2026-03-07 09:38:29.846230',6,1),(62,'2026-03-10 06:28:54.469983',5,1),(63,'2026-03-10 06:29:09.506383',5,2),(64,'2026-03-10 06:29:14.736733',2,2),(65,'2026-03-10 06:29:18.304130',6,2),(66,'2026-03-10 06:29:21.991052',4,2),(67,'2026-03-10 06:29:27.721105',2,2),(68,'2026-03-10 06:38:25.308762',6,2);
/*!40000 ALTER TABLE `shop_viewhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_wishlist`
--

DROP TABLE IF EXISTS `shop_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_wishlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `added_at` datetime(6) NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_wishlist_user_id_product_id_cc6abffc_uniq` (`user_id`,`product_id`),
  KEY `shop_wishlist_product_id_0fc70568_fk_shop_product_id` (`product_id`),
  CONSTRAINT `shop_wishlist_product_id_0fc70568_fk_shop_product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`),
  CONSTRAINT `shop_wishlist_user_id_131c4a81_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_wishlist`
--

LOCK TABLES `shop_wishlist` WRITE;
/*!40000 ALTER TABLE `shop_wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-10 18:06:10
