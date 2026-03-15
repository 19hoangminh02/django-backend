-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: fashion_shop
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Sản phẩm trong giỏ',7,'add_cartitem'),(26,'Can change Sản phẩm trong giỏ',7,'change_cartitem'),(27,'Can delete Sản phẩm trong giỏ',7,'delete_cartitem'),(28,'Can view Sản phẩm trong giỏ',7,'view_cartitem'),(29,'Can add Đơn hàng',8,'add_order'),(30,'Can change Đơn hàng',8,'change_order'),(31,'Can delete Đơn hàng',8,'delete_order'),(32,'Can view Đơn hàng',8,'view_order'),(33,'Can add Giỏ hàng',9,'add_cart'),(34,'Can change Giỏ hàng',9,'change_cart'),(35,'Can delete Giỏ hàng',9,'delete_cart'),(36,'Can view Giỏ hàng',9,'view_cart'),(37,'Can add Danh mục',10,'add_category'),(38,'Can change Danh mục',10,'change_category'),(39,'Can delete Danh mục',10,'delete_category'),(40,'Can view Danh mục',10,'view_category'),(41,'Can add Lịch sử xem',11,'add_viewhistory'),(42,'Can change Lịch sử xem',11,'change_viewhistory'),(43,'Can delete Lịch sử xem',11,'delete_viewhistory'),(44,'Can view Lịch sử xem',11,'view_viewhistory'),(45,'Can add Sản phẩm',12,'add_product'),(46,'Can change Sản phẩm',12,'change_product'),(47,'Can delete Sản phẩm',12,'delete_product'),(48,'Can view Sản phẩm',12,'view_product'),(49,'Can add Biến thể sản phẩm',13,'add_productvariant'),(50,'Can change Biến thể sản phẩm',13,'change_productvariant'),(51,'Can delete Biến thể sản phẩm',13,'delete_productvariant'),(52,'Can view Biến thể sản phẩm',13,'view_productvariant'),(53,'Can add Thanh toán',14,'add_payment'),(54,'Can change Thanh toán',14,'change_payment'),(55,'Can delete Thanh toán',14,'delete_payment'),(56,'Can view Thanh toán',14,'view_payment'),(57,'Can add Chi tiết đơn hàng',15,'add_orderitem'),(58,'Can change Chi tiết đơn hàng',15,'change_orderitem'),(59,'Can delete Chi tiết đơn hàng',15,'delete_orderitem'),(60,'Can view Chi tiết đơn hàng',15,'view_orderitem'),(61,'Can add Sản phẩm yêu thích',16,'add_wishlist'),(62,'Can change Sản phẩm yêu thích',16,'change_wishlist'),(63,'Can delete Sản phẩm yêu thích',16,'delete_wishlist'),(64,'Can view Sản phẩm yêu thích',16,'view_wishlist'),(65,'Can add Mã giảm giá',17,'add_coupon'),(66,'Can change Mã giảm giá',17,'change_coupon'),(67,'Can delete Mã giảm giá',17,'delete_coupon'),(68,'Can view Mã giảm giá',17,'view_coupon');
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
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1200000$81l9LJ8GgJVCsjhCEGbmx7$6bm4SF0oDle9BzNZ8BMyBY+ytNN+OYsxRF0+LcqQL5k=','2026-03-13 12:49:11.882129',1,'admin','','','minh@gmail.com',1,1,'2026-01-09 06:34:54.650191'),(2,'pbkdf2_sha256$1200000$AeDTCRP4DvdY40Ft21K5bE$zbcK+s4k703wpZXKDpLD7ZnZMBPkacDiznXDYTCZtmw=','2026-03-13 12:48:50.257885',0,'minh','Minh','Bùi','minh@gmail.com',0,1,'2026-01-17 07:03:43.322574'),(3,'pbkdf2_sha256$1000000$KTLtlZYxrnjUTgNDNXwCL4$7eJ/a/AZkIrqoDHgUt5hytUlbWccwoJ6Fip4bLlaYK0=','2026-01-17 07:06:18.561168',0,'minh1','','','minh@gmail.com',0,1,'2026-01-17 07:06:18.227618'),(4,'pbkdf2_sha256$1000000$Bce76pR2XkeLiL7Iy8H3EG$GDj/fu8MQb/8UTJCxblW9Tu+M2xDZ0bREldsshirIdE=','2026-03-06 18:28:14.359957',0,'tester_user','','','tester_user@example.com',0,1,'2026-03-06 18:25:29.745098'),(5,'pbkdf2_sha256$1200000$5NGx70eGuZKyYJcC0KTyWq$G6WcMU5AHTDC/DPSDJ3mKFJpZFHZowWGjxCAHA7lMLQ=','2026-03-12 09:21:25.738568',0,'dLDoYJmvkSrtFevNTUR','','','wo.hey.a.b.138@gmail.com',0,1,'2026-03-12 09:21:24.127288'),(6,'pbkdf2_sha256$1200000$jN6HgngowOfCAeBuen9kdB$4vyK4MhcRgl5CMGBnM7BxclhjUYbBYy6mhu84Olpklw=','2026-03-12 09:58:50.123109',0,'minh2','','','minh2@gmail.com',0,1,'2026-03-12 09:58:48.419361');
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
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-01-09 09:43:39.475869','1','Áo thun',1,'[{\"added\": {}}]',10,1),(2,'2026-01-09 09:44:31.853511','1','Áo thun basic cotton',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o thun basic cotton - Size S - \\u0110\\u1ecf\"}}]',12,1),(3,'2026-01-09 09:45:02.117537','1','Áo thun basic cotton',3,'',12,1),(4,'2026-01-09 09:45:28.162911','1','Áo thun',3,'',10,1),(5,'2026-01-19 09:20:41.494439','2','Áo thun',1,'[{\"added\": {}}]',10,1),(6,'2026-01-19 09:21:52.464690','3','Quần jean',1,'[{\"added\": {}}]',10,1),(7,'2026-01-19 09:22:03.241741','4','Váy',1,'[{\"added\": {}}]',10,1),(8,'2026-01-19 09:22:10.955335','5','Áo khoác',1,'[{\"added\": {}}]',10,1),(9,'2026-01-19 09:22:17.921183','6','Phụ kiện',1,'[{\"added\": {}}]',10,1),(10,'2026-01-19 09:39:03.237177','5','Áo khoác',3,'',10,1),(11,'2026-01-19 09:39:03.237177','2','Áo thun',3,'',10,1),(12,'2026-01-19 09:39:03.237177','6','Phụ kiện',3,'',10,1),(13,'2026-01-19 09:39:03.237177','3','Quần jean',3,'',10,1),(14,'2026-01-19 09:39:03.237177','4','Váy',3,'',10,1),(15,'2026-01-25 19:08:49.202426','7','Đồ nam',1,'[{\"added\": {}}]',10,1),(16,'2026-01-25 19:08:56.430381','8','Đồ nữ',1,'[{\"added\": {}}]',10,1),(17,'2026-01-25 19:10:08.633256','9','Đồ nam > Áo thun nam',1,'[{\"added\": {}}]',10,1),(18,'2026-01-29 17:14:35.625594','2','Áo thun nam trắng basic',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o thun nam tr\\u1eafng basic - Size S - Tr\\u1eafng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o thun nam tr\\u1eafng basic - Size M - Tr\\u1eafng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o thun nam tr\\u1eafng basic - Size L - Tr\\u1eafng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o thun nam tr\\u1eafng basic - Size XL - Tr\\u1eafng\"}}]',12,1),(19,'2026-02-04 18:39:27.256457','2','Đơn #2 - minh',2,'[{\"changed\": {\"fields\": [\"Tr\\u1ea1ng th\\u00e1i\"]}}]',8,1),(20,'2026-03-03 10:10:36.037970','10','Đồ nam > Áo polo',1,'[{\"added\": {}}]',10,1),(21,'2026-03-03 10:11:16.894234','11','Đồ nam > Áo khoác nam',1,'[{\"added\": {}}]',10,1),(22,'2026-03-03 10:11:43.564508','12','Đồ nam > Quần nam',1,'[{\"added\": {}}]',10,1),(23,'2026-03-03 10:12:19.096537','13','Đồ nam > Phụ kiện nam',1,'[{\"added\": {}}]',10,1),(24,'2026-03-03 10:13:40.960362','14','Đồ nữ > Áo khoác nữ',1,'[{\"added\": {}}]',10,1),(25,'2026-03-03 10:13:46.707774','15','Đồ nữ > Áo thun nữ',1,'[{\"added\": {}}]',10,1),(26,'2026-03-03 10:14:19.952387','10','Đồ nam > Áo polo nam',2,'[{\"changed\": {\"fields\": [\"T\\u00ean danh m\\u1ee5c\"]}}]',10,1),(27,'2026-03-03 10:15:02.827289','16','Đồ nữ > Áo polo nữ',1,'[{\"added\": {}}]',10,1),(28,'2026-03-03 10:15:46.644068','17','Đồ nữ > Quần - váy nữ',1,'[{\"added\": {}}]',10,1),(29,'2026-03-03 10:16:01.927168','18','Đồ nữ > Phụ kiện nữ',1,'[{\"added\": {}}]',10,1),(30,'2026-03-06 17:58:47.112779','3','Áo thun form rộng',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o thun form r\\u1ed9ng - Size S - Tr\\u1eafng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o thun form r\\u1ed9ng - Size M - \\u0110en\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o thun form r\\u1ed9ng - Size L - \\u0110\\u1ecf\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o thun form r\\u1ed9ng - Size XL - X\\u00e1m\"}}]',12,1),(31,'2026-03-06 18:34:36.719873','4','Chân váy ngắn',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Ch\\u00e2n v\\u00e1y ng\\u1eafn - Size S - Tr\\u1eafng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Ch\\u00e2n v\\u00e1y ng\\u1eafn - Size M - Tr\\u1eafng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Ch\\u00e2n v\\u00e1y ng\\u1eafn - Size L - Tr\\u1eafng\"}}]',12,1),(32,'2026-03-06 18:37:31.587889','3','Áo thun form rộng',3,'',12,1),(33,'2026-03-06 18:38:49.044224','5','Áo thun form rộng',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o thun form r\\u1ed9ng - Size S - X\\u00e1m\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o thun form r\\u1ed9ng - Size M - X\\u00e1m\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o thun form r\\u1ed9ng - Size L - X\\u00e1m\"}}]',12,1),(34,'2026-03-07 09:37:10.289312','6','Áo sơ mi nữ tay dài',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o s\\u01a1 mi n\\u1eef tay d\\u00e0i - Size S - H\\u1ed3ng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o s\\u01a1 mi n\\u1eef tay d\\u00e0i - Size M - H\\u1ed3ng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o s\\u01a1 mi n\\u1eef tay d\\u00e0i - Size L - H\\u1ed3ng\"}}]',12,1),(35,'2026-03-07 09:38:07.792552','6','Áo sơ mi nữ tay dài',2,'[{\"changed\": {\"fields\": [\"Gi\\u00e1\"]}}]',12,1),(36,'2026-03-10 20:53:46.217527','7','Áo Khoác Dù Nam Transform Jacket Ver2 MOP 1089',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 Nam Transform Jacket Ver2 MOP 1089 - Size S - X\\u00e1m\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 Nam Transform Jacket Ver2 MOP 1089 - Size M - X\\u00e1m\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 Nam Transform Jacket Ver2 MOP 1089 - Size S - \\u0110en\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 Nam Transform Jacket Ver2 MOP 1089 - Size M - \\u0110en\"}}]',12,1),(37,'2026-03-11 09:18:05.456517','7','Áo Khoác Dù Nam Transform Jacket Ver2 MOP 1089',2,'[{\"changed\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 Nam Transform Jacket Ver2 MOP 1089 - Size S - X\\u00e1m\", \"fields\": [\"H\\u00ecnh \\u1ea3nh bi\\u1ebfn th\\u1ec3\"]}}, {\"changed\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 Nam Transform Jacket Ver2 MOP 1089 - Size M - X\\u00e1m\", \"fields\": [\"H\\u00ecnh \\u1ea3nh bi\\u1ebfn th\\u1ec3\"]}}, {\"changed\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 Nam Transform Jacket Ver2 MOP 1089 - Size S - \\u0110en\", \"fields\": [\"H\\u00ecnh \\u1ea3nh bi\\u1ebfn th\\u1ec3\"]}}]',12,1),(38,'2026-03-12 09:42:46.501806','8','Áo Khoác Thun Nam Interlock UV MOK 1073',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c Thun Nam Interlock UV MOK 1073 - Size S - Xanh d\\u01b0\\u01a1ng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c Thun Nam Interlock UV MOK 1073 - Size M - Xanh d\\u01b0\\u01a1ng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c Thun Nam Interlock UV MOK 1073 - Size L - Xanh d\\u01b0\\u01a1ng\"}}]',12,1),(39,'2026-03-12 09:44:25.430771','9','Áo Khoác Nam Anti UV By Color Ver 2.0 MOK 1075',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c Nam Anti UV By Color Ver 2.0 MOK 1075 - Size S - X\\u00e1m\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c Nam Anti UV By Color Ver 2.0 MOK 1075 - Size M - X\\u00e1m\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c Nam Anti UV By Color Ver 2.0 MOK 1075 - Size L - X\\u00e1m\"}}]',12,1),(40,'2026-03-12 09:49:01.502760','10','Áo Khoác Dù Nam Overshirt Nylon Logo CTX MOP 1092',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 Nam Overshirt Nylon Logo CTX MOP 1092 - Size S - \\u0110en\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 Nam Overshirt Nylon Logo CTX MOP 1092 - Size M - \\u0110en\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 Nam Overshirt Nylon Logo CTX MOP 1092 - Size L - \\u0110en\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 Nam Overshirt Nylon Logo CTX MOP 1092 - Size S - X\\u00e1m\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 Nam Overshirt Nylon Logo CTX MOP 1092 - Size M - X\\u00e1m\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 Nam Overshirt Nylon Logo CTX MOP 1092 - Size L - X\\u00e1m\"}}]',12,1),(41,'2026-03-12 09:53:29.781317','11','Áo Khoác Hoodie Nam Airlayer \"Chạm\" MOK 1078',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c Hoodie Nam Airlayer \\\"Ch\\u1ea1m\\\" MOK 1078 - Size M - \\u0110en\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c Hoodie Nam Airlayer \\\"Ch\\u1ea1m\\\" MOK 1078 - Size L - \\u0110en\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c Hoodie Nam Airlayer \\\"Ch\\u1ea1m\\\" MOK 1078 - Size M - H\\u1ed3ng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c Hoodie Nam Airlayer \\\"Ch\\u1ea1m\\\" MOK 1078 - Size L - H\\u1ed3ng\"}}]',12,1),(42,'2026-03-12 09:57:09.621680','12','Áo Khoác Dù Nam Glow Line MOP 1090',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 Nam Glow Line MOP 1090 - Size S - \\u0110en\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 Nam Glow Line MOP 1090 - Size M\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 Nam Glow Line MOP 1090 - Size L\"}}]',12,1),(43,'2026-03-12 09:58:23.869546','12','Áo Khoác Dù Nam Glow Line MOP 1090',2,'[{\"changed\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 Nam Glow Line MOP 1090 - Size S - \\u0110en\", \"fields\": [\"S\\u1ed1 l\\u01b0\\u1ee3ng t\\u1ed3n kho\"]}}, {\"changed\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 Nam Glow Line MOP 1090 - Size M\", \"fields\": [\"S\\u1ed1 l\\u01b0\\u1ee3ng t\\u1ed3n kho\"]}}, {\"changed\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 Nam Glow Line MOP 1090 - Size L\", \"fields\": [\"S\\u1ed1 l\\u01b0\\u1ee3ng t\\u1ed3n kho\"]}}]',12,1),(44,'2026-03-12 09:59:28.457588','12','Áo Khoác Dù Nam Glow Line MOP 1090',2,'[{\"changed\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 Nam Glow Line MOP 1090 - Size M - \\u0110en\", \"fields\": [\"M\\u00e0u s\\u1eafc\"]}}, {\"changed\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 Nam Glow Line MOP 1090 - Size L - \\u0110en\", \"fields\": [\"M\\u00e0u s\\u1eafc\"]}}]',12,1),(45,'2026-03-12 10:01:36.641903','13','Áo Hoodie Nam Double Face Zipper Pocket MHO 1027',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Hoodie Nam Double Face Zipper Pocket MHO 1027 - Size S - \\u0110en\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Hoodie Nam Double Face Zipper Pocket MHO 1027 - Size M - \\u0110en\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Hoodie Nam Double Face Zipper Pocket MHO 1027 - Size L - \\u0110en\"}}]',12,1),(46,'2026-03-12 10:03:16.178734','14','Áo Khoác Nam UV Pro Windbreaker MOK 1058',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c Nam UV Pro Windbreaker MOK 1058 - Size S - X\\u00e1m\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c Nam UV Pro Windbreaker MOK 1058 - Size M - X\\u00e1m\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c Nam UV Pro Windbreaker MOK 1058 - Size L - X\\u00e1m\"}}]',12,1),(47,'2026-03-12 10:12:10.206349','15','Áo Polo Nam Dệt Kim Relax Boxy MPO 1080',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo Nam D\\u1ec7t Kim Relax Boxy MPO 1080 - Size S - N\\u00e2u\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo Nam D\\u1ec7t Kim Relax Boxy MPO 1080 - Size M - N\\u00e2u\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo Nam D\\u1ec7t Kim Relax Boxy MPO 1080 - Size L - N\\u00e2u\"}}]',12,1),(48,'2026-03-12 10:14:25.060118','16','Áo Polo Nam Palf Nature Blend MPO 1077',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo Nam Palf Nature Blend MPO 1077 - Size S - Xanh d\\u01b0\\u01a1ng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo Nam Palf Nature Blend MPO 1077 - Size M - Xanh d\\u01b0\\u01a1ng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo Nam Palf Nature Blend MPO 1077 - Size L - Xanh d\\u01b0\\u01a1ng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo Nam Palf Nature Blend MPO 1077 - Size S - Xanh l\\u00e1\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo Nam Palf Nature Blend MPO 1077 - Size M - Xanh l\\u00e1\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo Nam Palf Nature Blend MPO 1077 - Size L - Xanh l\\u00e1\"}}]',12,1),(49,'2026-03-12 10:18:27.480368','17','Áo Polo Nam Morden Block Regular MPO 1086',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo Nam Morden Block Regular MPO 1086 - Size S - Xanh d\\u01b0\\u01a1ng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo Nam Morden Block Regular MPO 1086 - Size M - Xanh d\\u01b0\\u01a1ng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo Nam Morden Block Regular MPO 1086 - Size L - Xanh d\\u01b0\\u01a1ng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo Nam Morden Block Regular MPO 1086 - Size S - Tr\\u1eafng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo Nam Morden Block Regular MPO 1086 - Size M - Tr\\u1eafng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo Nam Morden Block Regular MPO 1086 - Size L - Tr\\u1eafng\"}}]',12,1),(50,'2026-03-12 10:21:01.018932','18','Áo Polo Nam Fresh Max MPO 1057',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo Nam Fresh Max MPO 1057 - Size S - \\u0110en\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo Nam Fresh Max MPO 1057 - Size M - \\u0110en\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo Nam Fresh Max MPO 1057 - Size L - \\u0110en\"}}]',12,1),(51,'2026-03-12 10:22:17.343111','19','Áo Polo Nam Regular Phối Màu MPO 1062',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo Nam Regular Ph\\u1ed1i M\\u00e0u MPO 1062 - Size S - N\\u00e2u\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo Nam Regular Ph\\u1ed1i M\\u00e0u MPO 1062 - Size M - N\\u00e2u\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo Nam Regular Ph\\u1ed1i M\\u00e0u MPO 1062 - Size L - N\\u00e2u\"}}]',12,1),(52,'2026-03-12 10:26:27.199395','20','Áo Polo Nam Fresh Max Ver 2.0 MPO 1075',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo Nam Fresh Max Ver 2.0 MPO 1075 - Size S - Xanh l\\u00e1\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo Nam Fresh Max Ver 2.0 MPO 1075 - Size M - Xanh l\\u00e1\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo Nam Fresh Max Ver 2.0 MPO 1075 - Size L - Xanh l\\u00e1\"}}]',12,1),(53,'2026-03-12 10:27:48.940692','21','Áo Thun Nam Sorona Fiber Green Ex MTS 1504',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Thun Nam Sorona Fiber Green Ex MTS 1504 - Size S - Tr\\u1eafng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Thun Nam Sorona Fiber Green Ex MTS 1504 - Size M - Tr\\u1eafng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Thun Nam Sorona Fiber Green Ex MTS 1504 - Size L - Tr\\u1eafng\"}}]',12,1),(54,'2026-03-12 10:30:08.430852','22','Áo Thun Nam Relax Phối Tay Dài MTS 1502',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Thun Nam Relax Ph\\u1ed1i Tay D\\u00e0i MTS 1502 - Size S - Tr\\u1eafng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Thun Nam Relax Ph\\u1ed1i Tay D\\u00e0i MTS 1502 - Size M - Tr\\u1eafng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Thun Nam Relax Ph\\u1ed1i Tay D\\u00e0i MTS 1502 - Size L - Tr\\u1eafng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Thun Nam Relax Ph\\u1ed1i Tay D\\u00e0i MTS 1502 - Size S - N\\u00e2u\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Thun Nam Relax Ph\\u1ed1i Tay D\\u00e0i MTS 1502 - Size M - N\\u00e2u\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Thun Nam Relax Ph\\u1ed1i Tay D\\u00e0i MTS 1502 - Size L - N\\u00e2u\"}}]',12,1),(55,'2026-03-12 10:33:17.560191','23','Túi Đeo Dọc Thêu Logo C-Couple TX MBA 1030',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"T\\u00fai \\u0110eo D\\u1ecdc Th\\u00eau Logo C-Couple TX MBA 1030 - Size S - \\u0110en\"}}]',12,1),(56,'2026-03-12 10:34:10.030693','24','Túi Đeo Chéo Phối Lưới + Dây Kéo Ép Seam MBA 1035',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"T\\u00fai \\u0110eo Ch\\u00e9o Ph\\u1ed1i L\\u01b0\\u1edbi + D\\u00e2y K\\u00e9o \\u00c9p Seam MBA 1035 - Size S - \\u0110en\"}}]',12,1),(57,'2026-03-12 10:36:25.122221','25','Nón UV Logo MHA 1061',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"N\\u00f3n UV Logo MHA 1061 - Size S - Xanh l\\u00e1\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"N\\u00f3n UV Logo MHA 1061 - Size S - Xanh d\\u01b0\\u01a1ng\"}}]',12,1),(58,'2026-03-12 10:39:04.075614','26','Quần Dài Nam Glow Line MPA 1015',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Qu\\u1ea7n D\\u00e0i Nam Glow Line MPA 1015 - Size S - Xanh l\\u00e1\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Qu\\u1ea7n D\\u00e0i Nam Glow Line MPA 1015 - Size M - Xanh l\\u00e1\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Qu\\u1ea7n D\\u00e0i Nam Glow Line MPA 1015 - Size L - Xanh l\\u00e1\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Qu\\u1ea7n D\\u00e0i Nam Glow Line MPA 1015 - Size S - \\u0110en\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Qu\\u1ea7n D\\u00e0i Nam Glow Line MPA 1015 - Size M - \\u0110en\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Qu\\u1ea7n D\\u00e0i Nam Glow Line MPA 1015 - Size L - \\u0110en\"}}]',12,1),(59,'2026-03-12 10:39:35.991711','26','Quần Dài Nam Glow Line MPA 1015',2,'[{\"changed\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Qu\\u1ea7n D\\u00e0i Nam Glow Line MPA 1015 - Size S - Xanh l\\u00e1\", \"fields\": [\"S\\u1ed1 l\\u01b0\\u1ee3ng t\\u1ed3n kho\"]}}, {\"changed\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Qu\\u1ea7n D\\u00e0i Nam Glow Line MPA 1015 - Size M - Xanh l\\u00e1\", \"fields\": [\"S\\u1ed1 l\\u01b0\\u1ee3ng t\\u1ed3n kho\"]}}, {\"changed\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Qu\\u1ea7n D\\u00e0i Nam Glow Line MPA 1015 - Size L - Xanh l\\u00e1\", \"fields\": [\"S\\u1ed1 l\\u01b0\\u1ee3ng t\\u1ed3n kho\"]}}, {\"changed\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Qu\\u1ea7n D\\u00e0i Nam Glow Line MPA 1015 - Size S - \\u0110en\", \"fields\": [\"S\\u1ed1 l\\u01b0\\u1ee3ng t\\u1ed3n kho\"]}}, {\"changed\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Qu\\u1ea7n D\\u00e0i Nam Glow Line MPA 1015 - Size M - \\u0110en\", \"fields\": [\"S\\u1ed1 l\\u01b0\\u1ee3ng t\\u1ed3n kho\"]}}, {\"changed\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Qu\\u1ea7n D\\u00e0i Nam Glow Line MPA 1015 - Size L - \\u0110en\", \"fields\": [\"S\\u1ed1 l\\u01b0\\u1ee3ng t\\u1ed3n kho\"]}}]',12,1),(60,'2026-03-12 10:40:34.318608','27','Quần Dài Nam Double Face Original MPA 1013',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Qu\\u1ea7n D\\u00e0i Nam Double Face Original MPA 1013 - Size S - N\\u00e2u\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Qu\\u1ea7n D\\u00e0i Nam Double Face Original MPA 1013 - Size M - N\\u00e2u\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Qu\\u1ea7n D\\u00e0i Nam Double Face Original MPA 1013 - Size L - N\\u00e2u\"}}]',12,1),(61,'2026-03-12 10:46:57.373248','28','Quần Dài Nam Relax Tapper MPA 1011',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Qu\\u1ea7n D\\u00e0i Nam Relax Tapper MPA 1011 - Size S - \\u0110en\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Qu\\u1ea7n D\\u00e0i Nam Relax Tapper MPA 1011 - Size M - \\u0110en\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Qu\\u1ea7n D\\u00e0i Nam Relax Tapper MPA 1011 - Size L - \\u0110en\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Qu\\u1ea7n D\\u00e0i Nam Relax Tapper MPA 1011 - Size S - X\\u00e1m\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Qu\\u1ea7n D\\u00e0i Nam Relax Tapper MPA 1011 - Size M - X\\u00e1m\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Qu\\u1ea7n D\\u00e0i Nam Relax Tapper MPA 1011 - Size L - X\\u00e1m\"}}]',12,1),(62,'2026-03-12 18:01:04.418406','29','Áo Khoác Dù Nữ Relax Boxy Cổ Cao WOP 2095',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 N\\u1eef Relax Boxy C\\u1ed5 Cao WOP 2095 - Size S - \\u0110en\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 N\\u1eef Relax Boxy C\\u1ed5 Cao WOP 2095 - Size M - \\u0110en\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 N\\u1eef Relax Boxy C\\u1ed5 Cao WOP 2095 - Size L - \\u0110en\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 N\\u1eef Relax Boxy C\\u1ed5 Cao WOP 2095 - Size S - Tr\\u1eafng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 N\\u1eef Relax Boxy C\\u1ed5 Cao WOP 2095 - Size M - Tr\\u1eafng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 N\\u1eef Relax Boxy C\\u1ed5 Cao WOP 2095 - Size L - Tr\\u1eafng\"}}]',12,1),(63,'2026-03-12 18:03:39.702979','30','Áo Khoác Dù Nữ Relax Cold Yarn FW25 WOP 2094',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 N\\u1eef Relax Cold Yarn FW25 WOP 2094 - Size S - \\u0110en\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 N\\u1eef Relax Cold Yarn FW25 WOP 2094 - Size M - \\u0110en\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 N\\u1eef Relax Cold Yarn FW25 WOP 2094 - Size L - \\u0110en\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 N\\u1eef Relax Cold Yarn FW25 WOP 2094 - Size S - X\\u00e1m\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 N\\u1eef Relax Cold Yarn FW25 WOP 2094 - Size M - X\\u00e1m\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 N\\u1eef Relax Cold Yarn FW25 WOP 2094 - Size L - X\\u00e1m\"}}]',12,1),(64,'2026-03-12 18:03:53.883365','30','Áo Khoác Dù Nữ Relax Cold Yarn FW25 WOP 2094',2,'[{\"changed\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c D\\u00f9 N\\u1eef Relax Cold Yarn FW25 WOP 2094 - Size S - X\\u00e1m\", \"fields\": [\"H\\u00ecnh \\u1ea3nh bi\\u1ebfn th\\u1ec3\"]}}]',12,1),(65,'2026-03-12 18:05:24.839175','31','Áo Khoác Thun Nữ Anti UV Original Ver 2.0 WOK 2076',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c Thun N\\u1eef Anti UV Original Ver 2.0 WOK 2076 - Size S - Xanh d\\u01b0\\u01a1ng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c Thun N\\u1eef Anti UV Original Ver 2.0 WOK 2076 - Size M - Xanh d\\u01b0\\u01a1ng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Kho\\u00e1c Thun N\\u1eef Anti UV Original Ver 2.0 WOK 2076 - Size L - Xanh d\\u01b0\\u01a1ng\"}}]',12,1),(66,'2026-03-12 18:08:16.693028','32','Áo Polo Nữ Basic Jersey Zip WPO 2083',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo N\\u1eef Basic Jersey Zip WPO 2083 - Size S - \\u0110en\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo N\\u1eef Basic Jersey Zip WPO 2083 - Size M - \\u0110en\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo N\\u1eef Basic Jersey Zip WPO 2083 - Size L - \\u0110en\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo N\\u1eef Basic Jersey Zip WPO 2083 - Size S - Tr\\u1eafng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo N\\u1eef Basic Jersey Zip WPO 2083 - Size M - Tr\\u1eafng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo N\\u1eef Basic Jersey Zip WPO 2083 - Size L - Tr\\u1eafng\"}}]',12,1),(67,'2026-03-12 18:09:37.557389','33','Áo Polo Nữ Relax Boxy Rib WTS 2463',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo N\\u1eef Relax Boxy Rib WTS 2463 - Size S - Xanh l\\u00e1\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo N\\u1eef Relax Boxy Rib WTS 2463 - Size M - Xanh l\\u00e1\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo N\\u1eef Relax Boxy Rib WTS 2463 - Size L - Xanh l\\u00e1\"}}]',12,1),(68,'2026-03-12 18:11:27.906928','34','Áo Polo Nữ Rib Cotton Slim Boxy FW25 WTS 2464',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo N\\u1eef Rib Cotton Slim Boxy FW25 WTS 2464 - Size S - X\\u00e1m\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo N\\u1eef Rib Cotton Slim Boxy FW25 WTS 2464 - Size M - X\\u00e1m\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Polo N\\u1eef Rib Cotton Slim Boxy FW25 WTS 2464 - Size L - X\\u00e1m\"}}]',12,1),(69,'2026-03-12 18:15:24.555301','35','Áo Thun Nữ Baby Tee WTS 2509',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Thun N\\u1eef Baby Tee WTS 2509 - Size S - N\\u00e2u\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Thun N\\u1eef Baby Tee WTS 2509 - Size M - N\\u00e2u\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Thun N\\u1eef Baby Tee WTS 2509 - Size L - N\\u00e2u\"}}]',12,1),(70,'2026-03-12 18:16:23.508871','36','Áo Thun Nữ Morden Stripe Relax WTS 2501',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Thun N\\u1eef Morden Stripe Relax WTS 2501 - Size S - N\\u00e2u\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Thun N\\u1eef Morden Stripe Relax WTS 2501 - Size M - N\\u00e2u\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"\\u00c1o Thun N\\u1eef Morden Stripe Relax WTS 2501 - Size L - N\\u00e2u\"}}]',12,1),(71,'2026-03-12 18:19:50.001277','37','Túi Chanel Classic Handbag Lambskin Sky Blue A01112-Y04059-NA104',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"T\\u00fai Chanel Classic Handbag Lambskin Sky Blue A01112-Y04059-NA104 - Size S - Xanh navy\"}}]',12,1),(72,'2026-03-12 18:21:05.393638','38','Túi Chanel Mini Flap Bag Metalic Lambskin A69900-B05133-NB812',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"T\\u00fai Chanel Mini Flap Bag Metalic Lambskin A69900-B05133-NB812 - Size S - N\\u00e2u\"}}]',12,1),(73,'2026-03-12 18:22:41.309611','39','Váy Nữ Mini Skirt Jean A Line WSK 2034',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"V\\u00e1y N\\u1eef Mini Skirt Jean A Line WSK 2034 - Size S - Xanh d\\u01b0\\u01a1ng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"V\\u00e1y N\\u1eef Mini Skirt Jean A Line WSK 2034 - Size M - Xanh d\\u01b0\\u01a1ng\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"V\\u00e1y N\\u1eef Mini Skirt Jean A Line WSK 2034 - Size L - Xanh d\\u01b0\\u01a1ng\"}}]',12,1),(74,'2026-03-12 18:24:20.364468','40','Chân Váy Dù Cargo Midi WSK 2032',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Ch\\u00e2n V\\u00e1y D\\u00f9 Cargo Midi WSK 2032 - Size S - Xanh l\\u00e1\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Ch\\u00e2n V\\u00e1y D\\u00f9 Cargo Midi WSK 2032 - Size M - Xanh l\\u00e1\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Ch\\u00e2n V\\u00e1y D\\u00f9 Cargo Midi WSK 2032 - Size L - Xanh l\\u00e1\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Ch\\u00e2n V\\u00e1y D\\u00f9 Cargo Midi WSK 2032 - Size S - \\u0110en\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Ch\\u00e2n V\\u00e1y D\\u00f9 Cargo Midi WSK 2032 - Size M - \\u0110en\"}}, {\"added\": {\"name\": \"Bi\\u1ebfn th\\u1ec3 s\\u1ea3n ph\\u1ea9m\", \"object\": \"Ch\\u00e2n V\\u00e1y D\\u00f9 Cargo Midi WSK 2032 - Size L - \\u0110en\"}}]',12,1);
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
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(9,'shop','cart'),(7,'shop','cartitem'),(10,'shop','category'),(17,'shop','coupon'),(8,'shop','order'),(15,'shop','orderitem'),(14,'shop','payment'),(12,'shop','product'),(13,'shop','productvariant'),(11,'shop','viewhistory'),(16,'shop','wishlist');
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
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-01-09 06:30:24.538330'),(2,'auth','0001_initial','2026-01-09 06:30:25.211236'),(3,'admin','0001_initial','2026-01-09 06:30:25.352948'),(4,'admin','0002_logentry_remove_auto_add','2026-01-09 06:30:25.364187'),(5,'admin','0003_logentry_add_action_flag_choices','2026-01-09 06:30:25.372006'),(6,'contenttypes','0002_remove_content_type_name','2026-01-09 06:30:25.482405'),(7,'auth','0002_alter_permission_name_max_length','2026-01-09 06:30:25.550729'),(8,'auth','0003_alter_user_email_max_length','2026-01-09 06:30:25.566597'),(9,'auth','0004_alter_user_username_opts','2026-01-09 06:30:25.584442'),(10,'auth','0005_alter_user_last_login_null','2026-01-09 06:30:25.664991'),(11,'auth','0006_require_contenttypes_0002','2026-01-09 06:30:25.664991'),(12,'auth','0007_alter_validators_add_error_messages','2026-01-09 06:30:25.669174'),(13,'auth','0008_alter_user_username_max_length','2026-01-09 06:30:25.731289'),(14,'auth','0009_alter_user_last_name_max_length','2026-01-09 06:30:25.807901'),(15,'auth','0010_alter_group_name_max_length','2026-01-09 06:30:25.825677'),(16,'auth','0011_update_proxy_permissions','2026-01-09 06:30:25.830631'),(17,'auth','0012_alter_user_first_name_max_length','2026-01-09 06:30:25.902367'),(18,'sessions','0001_initial','2026-01-09 06:30:25.946653'),(19,'shop','0001_initial','2026-01-09 09:30:26.042927'),(20,'shop','0002_category_parent_alter_category_name_and_more','2026-01-20 01:47:30.113529'),(21,'shop','0003_add_sepay_payment_fields','2026-02-04 17:16:30.028473'),(22,'shop','0004_add_wishlist_model','2026-02-04 19:10:20.751624'),(23,'shop','0005_productvariant_image','2026-03-10 06:36:02.098687'),(24,'shop','0006_coupon_order_address_order_discount_order_fullname_and_more','2026-03-11 19:54:35.975745'),(25,'shop','0007_delete_wishlist','2026-03-13 12:47:43.342257');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `django_session` VALUES ('1o12pgfii7gg26rovr5wnht2qxl29omc','.eJxVjDsOwyAQRO9CHSH-WCnT5wxoYdngJALJ2JWVu8dILpJy3ryZnQXY1hK2npcwI7syxS6_LEJ65ToKfEJ9NJ5aXZc58qHws-383jC_b6f7d1Cgl2PtyaFwlGwCQjKG0oRaWDJgzZE8Gi8HiRYVaaMzSQWQJie1VSJm9vkCBD04Wg:1vxNTs:WhL72zXxaGnnKeaUCamwWXGGCaNNCgA8ulEyBLQAMRw','2026-03-17 11:00:00.141652'),('75r1a6l1ll8f4vqylg1b4a933b64rd7c','.eJxVjEsOwjAMBe-SNYpKnDg2S_acIXKcQAqolfpZIe4OlbqA7ZuZ9zJJ1qWlda5T6os5GWcOv1sWfdRhA-Uuw220Og7L1Ge7KXans72MpT7Pu_t30GRu31qOSspQGMkjRkIGBIrQBXYuC1UNlLPHyC6AeK_cdQEjhCtBVmDz_gCs9zZM:1w0Gsg:SJC-F_KbS6RiO_VMNkGci5YlPwvZ40rHNLF-RCciEYA','2026-03-25 10:33:34.115565'),('c995c7rhexnv7fdu2cr626oj6hy3pjzw','.eJxVjEsOwjAMBe-SNYpKnDg2S_acIXKcQAqolfpZIe4OlbqA7ZuZ9zJJ1qWlda5T6os5GWcOv1sWfdRhA-Uuw220Og7L1Ge7KXans72MpT7Pu_t30GRu31qOSspQGMkjRkIGBIrQBXYuC1UNlLPHyC6AeK_cdQEjhCtBVmDz_gCs9zZM:1w0FgT:4Mszq2Xul5WUYwkj9XzsgFLpa9leEEQqXu9EaMIkkgQ','2026-03-25 09:16:53.258372'),('de7wddrri0fr643r6wpe05da7tqsf0d7','.eJxVjEEOwiAQRe_C2hApHSgu3fcMzTAzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn3y0iPaTsgO9YblVTLesyR70r-qBNj5XleT3cv4OMLX_raCn0LmAMgAmpA_DOgRFm6MEJJ3BJPBpr0fuOPA1goxgECGexMqj3B_AmOBY:1w0c60:BEiyR1avZxoW4oyXmbqEQQzGnOekKTWKM8b-Ajk256I','2026-03-26 09:12:44.508476'),('dp4yk5ihjxh1dljbjuyngt3b3chh2sy2','.eJxVjDsOwjAQBe_iGll2_NulpM8ZrLW94ABypDipEHeHSCmgfTPzXiLStta4dV7iVMRZOHH63RLlB7cdlDu12yzz3NZlSnJX5EG7HOfCz8vh_h1U6vVbK07WKn1FZNTMPiBbyAQOvNE-DIRMphibAyqtrIdAPAAYJhcSehDvD88ENww:1w0cEP:69L2PvtKxt_x2dzsnPi2C8nTcE9OdZ2LRJ0Wbk4D54A','2026-03-26 09:21:25.754634'),('jqg0bner89aak6ggrtnfo7srmpef99um','.eJxVjEsOwjAMBe-SNYpKnDg2S_acIXKcQAqolfpZIe4OlbqA7ZuZ9zJJ1qWlda5T6os5GWcOv1sWfdRhA-Uuw220Og7L1Ge7KXans72MpT7Pu_t30GRu31qOSspQGMkjRkIGBIrQBXYuC1UNlLPHyC6AeK_cdQEjhCtBVmDz_gCs9zZM:1w0N2I:0pYPlenEB9-2QD-MhpqeDwUowPMfkvCJsQamn_c3U5c','2026-03-25 17:07:54.201926'),('oc47wjau9h2vxbe9ocnjblismjqkrhpz','.eJxVjEsOwjAMBe-SNYpKnDg2S_acIXKcQAqolfpZIe4OlbqA7ZuZ9zJJ1qWlda5T6os5GWcOv1sWfdRhA-Uuw220Og7L1Ge7KXans72MpT7Pu_t30GRu31qOSspQGMkjRkIGBIrQBXYuC1UNlLPHyC6AeK_cdQEjhCtBVmDz_gCs9zZM:1vzv0n:P_0yhaKmKIBzLzWIKvUtHC7NBdV7pTBFHH7fSnygiA8','2026-03-24 11:12:29.688984'),('ofxemxz4p5lrtz6xpwe5xdebtau02k00','.eJxVjEsOwjAMBe-SNYpKnDg2S_acIXKcQAqolfpZIe4OlbqA7ZuZ9zJJ1qWlda5T6os5GWcOv1sWfdRhA-Uuw220Og7L1Ge7KXans72MpT7Pu_t30GRu31qOSspQGMkjRkIGBIrQBXYuC1UNlLPHyC6AeK_cdQEjhCtBVmDz_gCs9zZM:1w0EwG:y27_vSw8fcNFhEt9eE1VY6hHwpS46t2kkRyYc-auOBI','2026-03-25 08:29:08.331554'),('q5bo9tb365yk5s8jo3st0ck1ggy86667','.eJxVjEEOwiAQRe_C2hCYDgVcuvcMZIBBqoYmpV0Z765NutDtf-_9lwi0rTVsnZcwZXEWWpx-t0jpwW0H-U7tNss0t3WZotwVedAur3Pm5-Vw_w4q9fqtGQtjHDyw4uTA2NFmZJONM7kgEI5aK1U8JiKFg9WkCnoojgC00yzeH-EaN2k:1vyZyj:cPHkSPnD6ZEiFbx4V4ARazYYyUiRjPi9_VDcstFZ3I0','2026-03-20 18:32:49.467850'),('qqq749fc3t92sz85xuwm0btqxvss6uq4','e30:1vh0LX:oAuqNEQBTrujvawy6_wA156ozHS5xsxtVedHzr1qxgA','2026-01-31 07:03:43.685363'),('rma126abd55b5hrp6hhsnctg3147y289','.eJxVjDsOwjAQBe_iGlnB629Kek6AkLVeLyQQEil2KsTdSaQU0L6ZN28RcaldXArPsc-iFUocfreE9ORxA_mB432SNI117pPcFLnTIs9T5uG0u3-BDku3vvFIngLkYL221nkbwIJ30JigVELPZHxK2rqgDKDWFJrGWAfm5iERhDVaeGCqnCPhXGNf-VVEexEKxPXzBWwxQCo:1w04Cn:qp4i-Btr-4sCtBItOGVCk9V9_vrYbg-b1FGsupji5sE','2026-03-24 21:01:29.889800'),('ulhrf36eez62jckrshp7od5yva7ehkde','.eJxVjEEOwiAQRe_C2hCYDgVcuvcMZIBBqoYmpV0Z765NutDtf-_9lwi0rTVsnZcwZXEWWpx-t0jpwW0H-U7tNss0t3WZotwVedAur3Pm5-Vw_w4q9fqtGQtjHDyw4uTA2NFmZJONM7kgEI5aK1U8JiKFg9WkCnoojgC00yzeH-EaN2k:1vzqjk:9Kdz-vvia5z9J06e06hM5XMk7KOzMhoaQ7D-Y22XGaQ','2026-03-24 06:38:36.924575'),('w3eugngdykrpov08jmo09283zjk8j7nt','.eJxVjEEOwiAQRe_C2hCYDgVcuvcMZIBBqoYmpV0Z765NutDtf-_9lwi0rTVsnZcwZXEWWpx-t0jpwW0H-U7tNss0t3WZotwVedAur3Pm5-Vw_w4q9fqtGQtjHDyw4uTA2NFmZJONM7kgEI5aK1U8JiKFg9WkCnoojgC00yzeH-EaN2k:1vnipL:u9Jyxg0-Y2MXbaKNyJh-Mxy0NKvCX2NBfByGogCZ7Ls','2026-02-18 19:46:15.983516'),('ybe1gwmfa6yw5nh6lnxgj41td9z97rn9','.eJxVjEEOwiAQRe_C2hApHSgu3fcMzTAzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn3y0iPaTsgO9YblVTLesyR70r-qBNj5XleT3cv4OMLX_raCn0LmAMgAmpA_DOgRFm6MEJJ3BJPBpr0fuOPA1goxgECGexMqj3B_AmOBY:1w11x1:DYZ0jcrwxvGvyXVA8trPoZFzNkM8oGAf50mrzyGlCE8','2026-03-27 12:49:11.890069'),('z0zesjzyskqid7rx84q0nlscpn8o61x9','.eJxVjEEOgjAQRe8ya9O0wrSVpXtPYEwzTKeCIiS0rIx3FxIWuv3v_feGQEvpwpJlDn2EBmo4_G4t8VPGDcQHjfdJ8TSWuW_VpqidZnWZogzn3f0LdJS79Z2MY0zGktaRk_OtJqerI5I_raDSpvbGOhK05Kwhl5C144hskdhbXKNZBuEiMTDNJfRFXhmaKxiE2-cLtqlBUA:1vyb6p:YYM14UFOphbw3Gm3BpQ4GI10-aeXVeBfY-hRBUfPa2I','2026-03-20 19:45:15.895702');
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_cartitem`
--

LOCK TABLES `shop_cartitem` WRITE;
/*!40000 ALTER TABLE `shop_cartitem` DISABLE KEYS */;
INSERT INTO `shop_cartitem` VALUES (15,1,'2026-03-06 19:44:52.462992',4,5,13);
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
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `shop_coupon`
--

DROP TABLE IF EXISTS `shop_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_coupon` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `discount_type` varchar(10) NOT NULL,
  `discount_value` decimal(10,0) NOT NULL,
  `max_discount` decimal(10,0) DEFAULT NULL,
  `min_order_value` decimal(10,0) NOT NULL,
  `usage_limit` int unsigned NOT NULL,
  `used_count` int unsigned NOT NULL,
  `expires_at` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  CONSTRAINT `shop_coupon_chk_1` CHECK ((`usage_limit` >= 0)),
  CONSTRAINT `shop_coupon_chk_2` CHECK ((`used_count` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_coupon`
--

LOCK TABLES `shop_coupon` WRITE;
/*!40000 ALTER TABLE `shop_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_coupon` ENABLE KEYS */;
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
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` decimal(10,0) NOT NULL,
  `fullname` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_fee` decimal(10,0) NOT NULL,
  `coupon_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_order_user_id_00aba627_fk_auth_user_id` (`user_id`),
  KEY `shop_order_coupon_id_b64bb177_fk_shop_coupon_id` (`coupon_id`),
  CONSTRAINT `shop_order_coupon_id_b64bb177_fk_shop_coupon_id` FOREIGN KEY (`coupon_id`) REFERENCES `shop_coupon` (`id`),
  CONSTRAINT `shop_order_user_id_00aba627_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_order`
--

LOCK TABLES `shop_order` WRITE;
/*!40000 ALTER TABLE `shop_order` DISABLE KEYS */;
INSERT INTO `shop_order` VALUES (1,1250000,'paid','2026-01-29 18:53:46.715742','2026-01-29 18:54:41.731314',2,'',0,'','','qr_code','',0,NULL),(2,250000,'paid','2026-02-04 16:18:03.333478','2026-02-04 18:39:27.254463',2,'',0,'','','qr_code','',0,NULL),(3,250000,'paid','2026-02-04 18:38:13.541202','2026-02-04 18:38:27.849856',2,'',0,'','','qr_code','',0,NULL),(4,848000,'pending','2026-03-06 20:19:28.724773','2026-03-06 20:19:28.724773',2,'',0,'','','qr_code','',0,NULL),(5,399000,'pending','2026-03-10 19:22:40.730243','2026-03-10 19:22:40.730290',2,'',0,'','','qr_code','',0,NULL),(6,199000,'pending','2026-03-10 20:27:30.805944','2026-03-10 20:27:30.805996',2,'',0,'','','qr_code','',0,NULL),(7,199000,'paid','2026-03-10 20:43:09.629286','2026-03-10 20:43:15.339288',2,'',0,'','','qr_code','',0,NULL),(8,199000,'pending','2026-03-10 20:46:13.892401','2026-03-10 20:46:13.892440',2,'',0,'','','qr_code','',0,NULL),(9,1299000,'paid','2026-03-10 21:06:18.853328','2026-03-10 21:06:27.055509',2,'',0,'','','qr_code','',0,NULL),(10,1299000,'paid','2026-03-11 18:58:30.857656','2026-03-11 18:58:48.444166',2,'',0,'','','qr_code','',0,NULL),(11,798000,'pending','2026-03-11 19:04:58.451212','2026-03-11 19:04:58.451247',2,'',0,'','','qr_code','',0,NULL),(12,1299000,'pending','2026-03-11 19:55:04.788761','2026-03-11 19:55:04.788802',2,'Đong tháp, Đong tháp, Đong tháp',0,'aa','','qr_code','123',0,NULL),(13,229000,'pending','2026-03-11 19:56:33.873938','2026-03-11 19:56:33.873982',2,'Đong tháp, Đong tháp, Đong tháp',0,'m','','qr_code','123',30000,NULL),(14,229000,'paid','2026-03-11 20:11:36.142889','2026-03-11 20:26:23.326423',2,'ddd, ddd, ddd',0,'aaa','','qr_code','1111',30000,NULL),(15,529000,'processing','2026-03-12 10:15:18.480781','2026-03-12 10:15:18.480825',2,'đồng tháp, đồng tháp, đồng tháp',0,'Minh Bùi','','cod','123',30000,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_orderitem`
--

LOCK TABLES `shop_orderitem` WRITE;
/*!40000 ALTER TABLE `shop_orderitem` DISABLE KEYS */;
INSERT INTO `shop_orderitem` VALUES (1,2,250000,1,2,2),(2,1,250000,1,2,4),(3,2,250000,1,2,5),(4,1,250000,2,2,2),(5,1,250000,3,2,5),(6,1,250000,4,2,3),(7,1,399000,4,4,10),(8,1,199000,4,5,13),(9,1,399000,5,4,10),(10,1,199000,6,6,16),(11,1,199000,7,5,13),(12,1,199000,8,5,13),(13,1,1299000,9,7,21),(14,1,1299000,10,7,19),(15,2,399000,11,4,11),(16,1,1299000,12,7,20),(17,1,199000,13,6,17),(18,1,199000,14,6,16),(19,1,499000,15,16,56);
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
  `method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `order_id` bigint NOT NULL,
  `paid_at` datetime(6) DEFAULT NULL,
  `reference_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`),
  UNIQUE KEY `reference_code` (`reference_code`),
  CONSTRAINT `shop_payment_order_id_20828773_fk_shop_order_id` FOREIGN KEY (`order_id`) REFERENCES `shop_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_payment`
--

LOCK TABLES `shop_payment` WRITE;
/*!40000 ALTER TABLE `shop_payment` DISABLE KEYS */;
INSERT INTO `shop_payment` VALUES (1,'qr_code','completed','2026-01-29 18:53:46.725242',1,NULL,NULL,NULL),(2,'qr_code','pending','2026-02-04 16:18:03.361861',2,NULL,NULL,NULL),(3,'qr_code','completed','2026-02-04 18:38:13.556259',3,'2026-02-04 18:38:27.843684','DH3',NULL),(4,'qr_code','pending','2026-03-06 20:19:28.742915',4,NULL,'DH4',NULL),(5,'cod','pending','2026-03-10 19:22:40.750076',5,NULL,'DH5',NULL),(6,'cod','pending','2026-03-10 20:27:30.812901',6,NULL,'DH6',NULL),(7,'cod','completed','2026-03-10 20:43:09.634406',7,'2026-03-10 20:43:15.327663','DH7',NULL),(8,'cod','pending','2026-03-10 20:46:13.899716',8,NULL,'DH8',NULL),(9,'qr_code','completed','2026-03-10 21:06:18.858803',9,'2026-03-10 21:06:27.044115','DH9',NULL),(10,'qr_code','completed','2026-03-11 18:58:30.866906',10,'2026-03-11 18:58:48.432518','DH10',NULL),(11,'qr_code','pending','2026-03-11 19:04:58.454448',11,NULL,'DH11',NULL),(12,'qr_code','pending','2026-03-11 19:55:04.799998',12,NULL,'DH12',NULL),(13,'qr_code','pending','2026-03-11 19:56:33.879240',13,NULL,'DH13',NULL),(14,'qr_code','completed','2026-03-11 20:11:36.150460',14,'2026-03-11 20:26:23.324125','DH14','44960814'),(15,'cod','pending','2026-03-12 10:15:18.485682',15,NULL,NULL,NULL);
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
  `name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_product_category_id_14d7eea8_fk_shop_category_id` (`category_id`),
  CONSTRAINT `shop_product_category_id_14d7eea8_fk_shop_category_id` FOREIGN KEY (`category_id`) REFERENCES `shop_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product`
--

LOCK TABLES `shop_product` WRITE;
/*!40000 ALTER TABLE `shop_product` DISABLE KEYS */;
INSERT INTO `shop_product` VALUES (2,'Áo thun nam trắng basic',250000,'Áo thun nam chất liệu cotton 100%   \r\nThoáng mát, form regular fit  \r\nPhù hợp đi làm, đi chơi','products/ao_thun_trang.jpg',1,'2026-01-29 17:14:35.588578','2026-01-29 17:14:35.588578',9),(4,'Chân váy ngắn',399000,'Chân Váy Ngắn Nữ Thời Trang – Dễ Phối Đồ\r\n\r\n✔ Thiết kế dáng váy ngắn trẻ trung\r\n✔ Chất vải mềm, mặc thoải mái\r\n✔ Tôn dáng, dễ phối đồ\r\n✔ Phù hợp đi học, đi chơi, dạo phố\r\n\r\n? Mix đẹp với áo thun, áo croptop, áo sơ mi','products/chan_vay_ngan.jpg',1,'2026-03-06 18:34:36.715127','2026-03-06 18:34:36.715698',17),(5,'Áo thun form rộng',199000,'ÁO THUN FORM RỘNG OVERSIZE – CHẤT COTTON MỀM MÁT\r\n\r\n✔ Form rộng thời trang, mặc thoải mái\r\n✔ Chất vải cotton mềm, thoáng khí\r\n✔ Thiết kế basic dễ phối đồ\r\n✔ Phù hợp nam và nữ\r\n\r\n? Phù hợp mặc đi học, đi chơi, dạo phố\r\n? Dễ phối với quần jean, short, jogger','products/aothunformrong1_ucYYJo5.jpg',1,'2026-03-06 18:38:49.037932','2026-03-06 18:38:49.037932',9),(6,'Áo sơ mi nữ tay dài',199000,'Áo Sơ Mi Nữ Tay Dài – Thanh Lịch, Dễ Phối Đồ\r\n\r\n✔ Thiết kế tay dài thanh lịch, thời trang\r\n✔ Chất vải mềm mại, thoáng mát\r\n✔ Form áo tôn dáng, mặc thoải mái\r\n✔ Phù hợp đi học, đi làm, dạo phố\r\n\r\n? Mix đẹp với chân váy, quần jean, quần tây','products/ao_so_mi_nu_tay_dai.jpg',1,'2026-03-07 09:37:10.283294','2026-03-07 09:38:07.792552',15),(7,'Áo Khoác Dù Nam Transform Jacket Ver2 MOP 1089',1299000,'Áo Khoác Dù Nam Transform Jacket Ver2 MOP 1089 là sự đột phá về thiết kế đa năng với chất liệu vải dù dệt gân từ sợi Cold Yarn (100% Poly), giúp giảm nhiệt độ từ 3-5°C so với môi trường bên ngoài. Phiên bản cải tiến này được may một lớp siêu nhẹ, tích hợp khả năng tháo ráp nón và tay nhanh chóng để biến hóa từ áo khoác thành áo sơ mi, mang lại hai phong cách riêng biệt chỉ trong một sản phẩm.','products/Áo_Khoác_Dù_Nam_Transform_Jacket_Ver2_MOP_1089.jpg',1,'2026-03-10 20:53:46.209264','2026-03-11 09:18:05.444202',11),(8,'Áo Khoác Thun Nam Interlock UV MOK 1073',759000,'Áo Khoác Thun Nam Interlock UV MOK 1073. Áo khoác thun Interlock UV nam được thiết kế với chất liệu Interlock UV mới giúp áo đứng form, với cấu trúc dệt đặc trưng giúp chống UV UPF 50++, tạo hiệu ứng Wicking thấm hút mồ hôi nhanh và công nghệ Tech Dry hỗ trợ khô ráo tức thì. Thiết kế dây kéo 2 đầu linh hoạt, bao tay chống nắng, cùng đường rã đô định hình vai và thoải mái khi vận động. Áo được trang bị túi ngoài có khóa kéo tiện dụng và hai túi trong đa năng, đáp ứng mọi nhu cầu cất giữ khi di chuyển. \r\n\r\nÁo khoác thun Interlock UV nam mang đến tinh thần thoải mái, linh hoạt, bảo vệ tối ưu, phù hợp cho những ngày năng động và nhiều hoạt động ngoài trời.\r\n\r\n    Chất liệu: Interlock UV, 95% Polyester + 5%SP, 280gsm\r\n    Form dáng: Regular\r\n    Màu sắc: Xanh Đậm Deep Rive, Xám Đậm Stone Blue, Đen\r\n    Sản xuất: Việt Nam','products/Áo_Khoác_Thun_Nam_Interlock_UV_MOK_1073.jpg',1,'2026-03-12 09:42:46.483442','2026-03-12 09:42:46.483485',11),(9,'Áo Khoác Nam Anti UV By Color Ver 2.0 MOK 1075',729000,'Áo Khoác Nam Anti UV By Color Ver 2.0 MOK 1075 được làm từ chất liệu Tricot UV cao cấp (60% Cotton + 40% Polyester, 230 GSM) mang đến cảm giác mềm mại, thoáng mát và bền màu. Thiết kế form relax dễ mặc, phối cùng bảng màu thời trang: nam có Xám High Rise, Nâu Tree House; nữ có Xám High Rise, Hồng Mauve Orchid, Tím Nhạt Orchid. \r\n \r\nSản phẩm nổi bật với kết cấu vải 2 lớp: mặt trong cotton thấm hút mồ hôi, mặt ngoài polyester chống tia UV hiệu quả nhờ kiểu dệt lỗ thoáng khí. Điểm nhấn là form rã phối eo tôn dáng, phối màu năng động, túi dây kéo tiện dụng, tay áo xỏ ngón và bo dài bảo vệ mu bàn tay. Đây là lựa chọn lý tưởng cho những ai yêu thích sự năng động, thoải mái và bảo vệ tối ưu dưới nắng – sở hữu ngay để cảm nhận sự khác biệt!\r\n\r\n    Chất liệu: Tricot UV, 60% Cotton + 40% Polyester – 230 GSM. \r\n    Form dáng: Relax\r\n    Màu sắc: Xám Night Rise, Nâu Tree House\r\n    Sản xuất: Việt Nam','products/Áo_Khoác_Nam_Anti_UV_By_Color_Ver_2.0_MOK_1075.jpg',1,'2026-03-12 09:44:25.422933','2026-03-12 09:44:25.422980',11),(10,'Áo Khoác Dù Nam Overshirt Nylon Logo CTX MOP 1092',649000,'Áo Khoác Dù Nam Overshirt Nylon Logo CTX MOP 1092  được làm từ chất liệu Dù 86% Recycle Nylon, 14% Spandex với định lượng 165 GSM, mang lại cảm giác mát nhẹ, thoáng khí và có độ co giãn tự nhiên. Thiết kế form Relax rộng rãi, thoải mái, cùng bảng màu thời thượng: Đen – Xám nhạt – Xám đậm, dễ phối và ứng dụng cho nhiều hoàn cảnh. \r\n\r\nĐiểm nhấn của sản phẩm nằm ở kiểu dáng overshirt kết hợp phong cách sơ mi khoác, vừa tối giản vừa hiện đại, giúp người mặc dễ dàng mix & match với nhiều loại trang phục khác nhau. Nhờ chất liệu dù nylon nhẹ, áo mang đến sự đa dụng trong nhu cầu khoác nhẹ thời trang, phù hợp cả đi làm, đi chơi hay dạo phố hàng ngày. \r\n\r\nSở hữu ngay Áo Khoác Overshirt Nylon để nâng cấp phong cách thường nhật của bạn với một item vừa tiện lợi vừa chuẩn xu hướng. Đặt hàng hôm nay để trải nghiệm sự linh hoạt và tinh tế trong từng chi tiết!\r\n\r\n    Chất liệu:  DÙ 86% RECYCLE NYLON, 14% SPANDEX - 165GSM\r\n    Form: Relax\r\n    Màu sắc: Đen, Xám\r\n    Sản xuất: Việt Nam','products/Áo_Khoác_Dù_Nam_Overshirt_Nylon_Logo_CTX_MOP_1092_đen.jpg',1,'2026-03-12 09:49:01.480069','2026-03-12 09:49:01.480111',11),(11,'Áo Khoác Hoodie Nam Airlayer \"Chạm\" MOK 1078',729000,'Áo Khoác Hoodie Nam Airlayer \"Chạm\" MOK 1078  Thiết kế từ thun 2 da (80% polyester, 15% Cotton, 5% spandex, 300gsm), áo mang lại cảm giác đứng form nhưng vẫn co giãn thoải mái. Form oversize lai suôn boxy hiện đại, dễ phối cùng nhiều phong cách. Bảng màu đa dạng: Nam (Đen, Xám Gỗ Teak, Hồng Magenta) – Nữ (Đen, Xám Gỗ Teak, Hồng Magenta, Tím Lily). \r\n\r\nĐiểm nhấn nổi bật nằm ở thiết kế hoodie ZIP thời trang với chất liệu airlayer chuẩn form, cùng chi tiết in cao thông điệp “CHẠM”,  “tìm sự tĩnh lặng – chỉ cần chạm và cảm nhận”, mang lại cảm giác vừa cá tính vừa ý nghĩa.\r\n\r\nChất liệu:  D80% POLYESTER, 15% COTTON, 5% SPANDEX 305 GSM\r\nForm: Oversize Lai Suôn\r\nMàu sắc: Đen, Hồng \r\nSản xuất: Việt Nam','products/Áo_Khoác_Hoodie_Nam_Airlayer_Chạm_MOK_1078_đen.jpg',1,'2026-03-12 09:53:29.770245','2026-03-12 09:53:29.770298',11),(12,'Áo Khoác Dù Nam Glow Line MOP 1090',729000,'Áo Khoác Dù Nam Glow Line MOP 1090 được làm từ chất liệu dù nhăn 100% nylon, định lượng 120 GSM, mang đến cảm giác nhẹ, thoáng và chống gió hiệu quả. Thiết kế form relax dành cho nam và relax boxy thời thượng dành cho nữ, với lựa chọn màu sắc đa dạng: Nam gồm màu Đen và Xanh ô liu Olivine, nữ gồm màu Hồng Pale và Xanh ô liu Olivine, dễ dàng mix-match cho nhiều phong cách.\r\n\r\n \r\n\r\nĐiểm nhấn của sản phẩm nằm ở chi tiết đường cắt may phối hiện đại được nhấn nhá với đường viền phản quang độc đáo, tạo điểm sáng nổi bật cả ban ngày lẫn ban đêm. Logo X in phản quang phía sau, cùng 2 túi dây kéo mặt trước, 1 túi bên trong có lót lưới thoáng khí và con chặn ở lai giúp điều chỉnh độ rộng linh hoạt. Đây không chỉ là một chiếc áo khoác mà còn là item hoàn hảo để tạo điểm nhấn phong cách trong mọi hoạt động.\r\n\r\n    Chất liệu: Dù nhăn 100% POLYESTER\r\n    Form: Relax\r\n    Hệ túi: 2 túi ngoài có dây kéo + 1 túi trong\r\n    Màu sắc: Đen\r\n    Sản xuất: Việt Nam','products/Áo_Khoác_Dù_Nam_Glow_Line_MOP_1090_đen.jpg',1,'2026-03-12 09:57:09.614504','2026-03-12 09:59:28.451511',11),(13,'Áo Hoodie Nam Double Face Zipper Pocket MHO 1027',659000,'Áo Hoodie Double Face Zipper Pocket MHO 1027 được may từ chất liệu thun double face 60% Cotton – 40% Polyester, 320gsm, mang đến cảm giác mềm mại nhưng vẫn giữ form chắc chắn. Thiết kế form oversize lai suôn – boxy thời thượng, với hai lựa chọn màu sắc: Be Nâu ấm áp và Đen cá tính, phù hợp nhiều phong cách. Điểm nhấn nổi bật nằm ở túi cách điệu dây kéo mổ cong độc đáo cùng chi tiết in typo “Styling your Experience”, tạo nét hiện đại và khác biệt cho người mặc. Đây là item vừa thoải mái, vừa phong cách để bạn tự tin xuống phối. Sở hữu ngay chiếc Hoodie này để nâng tầm outfit và khẳng định cá tính riêng của bạn!\r\n\r\n \r\n\r\n    Chất liệu: Thun Double Face 60% Cotton + 40% Poly 320GSM\r\n    Form dáng: Oversize lai suông boxy\r\n    Màu sắc: Đen,\r\n    Sản xuất: Việt Nam','products/Áo_Hoodie_Nam_Double_Face_Zipper_Pocket_MHO_1027.jpg',1,'2026-03-12 10:01:36.634985','2026-03-12 10:01:36.635067',11),(14,'Áo Khoác Nam UV Pro Windbreaker MOK 1058',659000,'Áo Khoác Nam UV Pro Windbreaker MOK 1058 Sản phẩm được làm từ 100% sợi polyester tái chế nên rất bền chắc, nhanh khô, độ bền màu cao,có khả năng chống nắng vượt trội với chỉ số UPF 50++ và khả năng kháng tia UV tới 98%, nhờ tính chất kháng tia UV tự nhiên của sợi polyester cùng kiểu dệt 2 lớp cải tiến:\r\n\r\n+ Lớp ngoài dệt chặt tạo rào cản đầu tiên chống lại tia UV.\r\n\r\n+ Lớp trong với cấu trúc vòng sợi đặc biệt tạo độ xốp, nhẹ ,mềm mại, co giãn , tăng cường khả năng kháng tia UV và giúp áo thoáng mát. \r\nThoải mái vận động và chống nắng hiệu quả, cản gió tối ưu với áo khoác 100% polyester tái chế. Đây chắc chắn là item hoàn hảo cho những chuyến trải nghiệm hoặc hoạt động ngoài trời: \r\n\r\n+ Áo có lỗ thoát khí 2 bên sườn giúp thoáng khí.\r\n\r\n+ Bo tay làm bằng vải thun co giãn 4 chiều có xỏ ngón, bo dài tới mu bàn tay tăng độ che phủ tay.\r\n\r\n+ Thiết kế 2 túi dây kéo an toàn thân trước, 2 túi trong tiện lợi đựng đồ.\r\n\r\n+ Logo in phản quang thân trước và sau.\r\n\r\n    Chất liệu: 100% Recycle Poly.\r\n    Form dáng: Regular \r\n    Màu sắc: Xám,\r\n    Sản xuất: Việt Nam','products/Áo_Khoác_Nam_UV_Pro_Windbreaker_MOK_1058.jpg',1,'2026-03-12 10:03:16.171586','2026-03-12 10:03:16.171635',11),(15,'Áo Polo Nam Dệt Kim Relax Boxy MPO 1080',429000,'Áo Polo Nam Dệt Kim Relax Boxy MPO 1080 với hiệu ứng texture len striped tạo chiều sâu bề mặt, mang đến cảm giác hiện đại và khác biệt nhưng vẫn giữ tinh thần tối giản. Thiết kế Relax Boxy cho phom dáng rộng vừa, thoải mái, dễ ứng dụng trong nhiều phong cách thường ngày.\r\n\r\nChất liệu dệt kim 320 GSM, thành phần 95% Polyester, 5% Spandex giúp áo đứng form, bề mặt rõ nét, đồng thời có độ co giãn nhẹ cho cảm giác linh hoạt khi vận động. Chi tiết logo cách điệu ở tay áo là điểm nhấn tinh tế, đủ nổi bật để tạo dấu ấn cá nhân. Bảng màu trung tính, dễ phối đồ, phù hợp tinh thần Urban Casual.\r\n\r\n \r\n\r\n    Chất liệu: Vải Texture code 2311, 95% POLY 5% SPANDEX 320 gsm  \r\n    Form: Relax Boxy\r\n    Màu sắc: Nâu\r\n    Sản xuất: Việt Nam','products/Áo_Polo_Nam_Dệt_Kim_Relax_Boxy_MPO_1080.jpg',1,'2026-03-12 10:12:10.193156','2026-03-12 10:12:10.193221',10),(16,'Áo Polo Nam Palf Nature Blend MPO 1077',499000,'Áo Polo Nam Palf Nature Blend MPO 1077. Được làm từ chất liệu Pique PALF 90% cotton – 10% sợi dứa 210 GSM, mang đến bề mặt thoáng khí, mềm mại và giữ form tốt. Thiết kế form Regular vai Relax cùng phiên bản Regular Plus rộng rãi hơn giúp người mặc thoải mái trong mọi hoạt động.\r\n\r\nChất liệu sợi dứa PALF nổi bật với khả năng kháng khuẩn tự nhiên, thấm hút nhanh và thoát hơi hiệu quả, giữ cơ thể luôn khô thoáng. Ba màu Be Chateau – Xanh Đậm Moonlit Ocean – Xanh Lá Rain Forest dễ phối, phù hợp nhiều phong cách. Sở hữu ngay để trải nghiệm sự thoải mái và mát nhẹ đặc trưng từ chất liệu sợi dứa tự nhiên!\r\n\r\n    Chất liệu: PIQUE PALF (DỨA) 90%C, 10% PALF 210GSM\r\n    Form dáng: Regular Vai relax\r\n    Màu sắc: Xanh Đậm Moonlit Ocean, Xanh Lá Rain Forest\r\n    Sản xuất: Việt Nam','products/Áo_Polo_Nam_Palf_Nature_Blend_MPO_1077_xanh_biển.jpg',1,'2026-03-12 10:14:25.041353','2026-03-12 10:14:25.041405',10),(17,'Áo Polo Nam Morden Block Regular MPO 1086',499000,'Áo Polo Nam Morden Block Regular MPO 1086 mang đến diện mạo khỏe khoắn và đầy nam tính cho phái mạnh nhờ thiết kế rã phối màu thông minh tại vai và tay áo. Sản phẩm sử dụng chất liệu vải 60% Cotton, 35% Poly, 5% Spandex với định lượng 200 GSM, vừa đảm bảo sự thoáng mát, thấm hút mồ hôi tốt của cotton, vừa có độ bền và khả năng giữ phom dáng ưu việt.\r\n\r\nVới thiết kế phom Regular chuẩn mực, áo tạo nên đường nét mạnh mẽ nhưng vẫn đảm bảo sự thoải mái trong mọi hoạt động. Điểm nhấn tinh tế nằm ở chi tiết logo CTX thêu tỉ mỉ tệp màu vải tại tay áo, kết hợp cùng bảng phối màu hiện đại như Trắng và Xanh Đậm Sargasso. Đây chính là món đồ đa năng, dễ dàng mix-match để bạn tự tin sải bước từ môi trường công sở đến những buổi gặp gỡ bạn bè.\r\n\r\n    Chất liệu: VẢI CODE, 64% COTTON, 34% POLY, 2% Spandex\r\n    Form: Regular \r\n    Màu sắc: Xanh đậm, Trắng\r\n    Sản xuất: Việt Nam&nb','products/Áo_Polo_Nam_Morden_Block_Regular_MPO_1086_xanh.jpg',1,'2026-03-12 10:18:27.464406','2026-03-12 10:18:27.464451',10),(18,'Áo Polo Nam Fresh Max MPO 1057',299000,'Áo Polo Nam Fresh Max MPO 1057 Mẫu áo polo đem lại sự trẻ trung, năng động. Dễ dàng phối với nhiều phong cách khác nhau nhờ bộ màu trầm ấm, tôn da phù hợp với đại đa số người Việt Nam. Thiết kế bo cổ, bo tay dệt sọc kết hợp hiệu ứng độc đáo, trụ áo 2 nút. Chất liệu có độ co dãn, thoáng mát, thấm hút tốt, mềm, nhẹ.\r\n\r\n    Chất liệu: Cá sấu PE Cool - FOB 95% PE COOL + 5% SPANDEX, 222gr\r\n    Form: Regular \r\n    Màu sắc: Đen\r\n    Sản xuất: Việt Nam','products/Áo_Polo_Nam_Fresh_Max_MPO_1057.jpg',1,'2026-03-12 10:21:00.983810','2026-03-12 10:21:00.983855',10),(19,'Áo Polo Nam Regular Phối Màu MPO 1062',299000,'Áo Polo Nam Regular Phối Màu MPO 1062 với trụ 2 nút bấm và phom dáng Regular tôn lên vẻ nam tính, là lựa chọn hoàn hảo cho những ai yêu thích phong cách nam tính lịch lãm. Đặc biệt với 5% Spandex giúp sản phẩm có độ co dãn thoải mái, độ bền cao giúp mọi hoạt động hàng ngày trở nên dễ dàng hơn bao giờ hết.\r\n\r\n    Chất liệu: PICQUE 4C, 60%COTTON, 35%POLY, 5%SPANDES\r\n    Form: Regular \r\n    Màu sắc: Nâu Deep Taupe, \r\n    Sản xuất: Việt Nam','products/Áo_Polo_Nam_Regular_Phối_Màu_MPO_1062.jpg',1,'2026-03-12 10:22:17.338353','2026-03-12 10:22:17.338396',10),(20,'Áo Polo Nam Fresh Max Ver 2.0 MPO 1075',499000,'Áo Polo Nam Fresh Max Ver 2.0 MPO 1075 được làm từ chất liệu Pique Cool 95% Polyester và 5% Spandex, mang lại cảm giác mát nhẹ, co giãn linh hoạt và thấm hút tốt, giúp người mặc luôn thoải mái suốt cả ngày. Thiết kế form Regular chuẩn dáng cùng bảng màu hiện đại: Đen – Xanh ô liu Olivine – Đỏ Berry, dễ dàng phối đồ và phù hợp với nhiều phong cách khác nhau.\r\n\r\nĐiểm nhấn của sản phẩm nằm ở thiết kế bo cổ và tay áo kiểu mới, được phối sọc tinh tế tạo nét hiện đại và khác biệt. Chất liệu Pique Cool không chỉ mát mẻ mà còn mang lại diện mạo trẻ trung, năng động. Đây là lựa chọn lý tưởng cho các hoạt động thường ngày như đi chơi, du lịch hay dạo phố. Sở hữu ngay Áo Polo Cool Nam để trải nghiệm cảm giác mát lạnh và phong cách chuẩn năng động. Đặt hàng hôm nay để làm mới tủ đồ và tự tin xuất hiện trong mọi khoảnh khắc! \r\n\r\n    Chất liệu: PICQUE COOL 95% POLYESTER + 5% SPANDEX\r\n    Form: Regular \r\n    Màu sắc: Xanh ô liu Olivine\r\n    Sản xuất: Việt Nam&nb\r\n\r\n##\r\n\r\n    Phối cùng quần jean, kaki... tạo nên set đồ năng động.\r\n    Mặc đi học, đi làm, đi chơi.','products/Áo_Polo_Nam_Fresh_Max_Ver_2.0_MPO_1075.jpg',1,'2026-03-12 10:26:27.193265','2026-03-12 10:26:27.193311',10),(21,'Áo Thun Nam Sorona Fiber Green Ex MTS 1504',249000,'Áo Thun Nam Sorona Fiber Green Ex MTS 1504 hướng đến thời trang bền vững với chất liệu vải Sorona cao cấp, thành phần từ bột ngô tự nhiên, không chỉ mang lại bề mặt vải mềm mại, thoáng mát mà còn cực kỳ thân thiện với môi trường. \r\n\r\nÁo được thiết kế theo phom dáng Regular vừa vặn, tôn dáng người mặc một cách tự nhiên và thoải mái nhất. Điểm nhấn tinh tế của sản phẩm nằm ở chi tiết logo silicon trong suốt được in tỉ mỉ tại tay áo, kết hợp cùng kỹ thuật chạy móc xích vai và cổ áo bo rib tạo nên sự chắc chắn cho áo. \r\n\r\n \r\n\r\n    Chất liệu: Vải Sorona 79.36%c, 20.64%poly\r\n    Form dáng: Regular\r\n    Màu sắc: Trắng,\r\n    Sản xuất: Việt Nam','products/Áo_Thun_Nam_Sorona_Fiber_Green_Ex_MTS_1504.jpg',1,'2026-03-12 10:27:48.937427','2026-03-12 10:27:48.937462',9),(22,'Áo Thun Nam Relax Phối Tay Dài MTS 1502',399000,'Áo Thun Nam Relax Phối Tay Dài MTS 1502 mang đến một diện mạo đầy phá cách và đậm chất streetwear với thiết kế giả hai lớp độc đáo. Điểm nhấn ấn tượng nhất chính là phần tay dài phối vải waffle mới lạ, tạo sự tương phản về bề mặt chất liệu và mang lại vẻ ngoài năng động cho người mặc.\r\n\r\nSản phẩm sử dụng chất liệu vải APH 100% Cotton, đảm bảo sự thông thoáng và thoải mái tuyệt đối trong suốt ngày dài. Form dáng Relax khỏe khoắn, hiện đại được nâng tầm nhờ các chi tiết đồ họa tinh xảo như logo CTX in cao nổi bật ở ngực trái và cụm chữ in phối hợp kỹ thuật in lụa cùng in nổi phồng khổ lớn phía sau thân áo, tạo hiệu ứng thị giác 3D cực kỳ bắt mắt.\r\n\r\nVới bảng màu thông dụng gồm Nâu Cocoa và Trắng dễ phối đồ, kết hợp cùng các chi tiết nhãn kẹp tay áo và chỉ may tiệp màu tinh tế, đây chính là item không thể bỏ qua cho những tín đồ yêu thích phong cách trẻ trung và thời thượng.\r\n\r\n \r\n\r\n    Chấ liệu: 100% Polyester, 240gsm \r\n    Form dáng: Relax\r\n    Màu sắc: Trắng, Nâu Moca\r\n    Sản xuất: Việt Nam','products/Áo_Thun_Nam_Relax_Phối_Tay_Dài_MTS_1502_trắng.jpg',1,'2026-03-12 10:30:08.398079','2026-03-12 10:30:08.398128',9),(23,'Túi Đeo Dọc Thêu Logo C-Couple TX MBA 1030',199000,'Túi Đeo Dọc Thêu Logo C-Couple TX MBA 1030\r\n\r\n    Chất liệu: Thành phần 100% Polyester\r\n    Form: Túi dọc \r\n    Màu Sắc : Đen\r\n    Giới tính: Unisex. \r\n    Sản xuất : Việt Nam','products/Túi_Đeo_Dọc_Thêu_Logo_C-Couple_TX_MBA_1030.jpg',1,'2026-03-12 10:33:17.557321','2026-03-12 10:33:17.557365',13),(24,'Túi Đeo Chéo Phối Lưới + Dây Kéo Ép Seam MBA 1035',300000,'Túi Đeo Chéo Phối Lưới + Dây Kéo Ép Seam MBA 1035\r\n\r\n    Chất liệu: Thành phần 100% Polyester\r\n    Form: Túi chéo\r\n    Màu Sắc : Đen\r\n    Giới tính: Unisex. \r\n    Sản xuất : Việt Na','products/men_den_25248f6823a14fe7b7d78408511899fd_master.jpg',1,'2026-03-12 10:34:10.028033','2026-03-12 10:34:10.028103',13),(25,'Nón UV Logo MHA 1061',199000,'Nón UV Logo MHA 1061. Nón UV được làm từ chất liệu thun Tricot UV cao cấp với thành phần 60% Polyester và 40% Cotton, nón UV Logo Phản Quang mang lại cảm giác mềm mại, co giãn tốt và khả năng chống tia UV hiệu quả. \r\n\r\nBộ màu thời thượng phù hợp với nhiều phong cách và sở thích khác nhau. Điểm nhấn nổi bật là form nón 6 múi trẻ trung cùng chi tiết logo phản quang, giúp bạn nổi bật khi đi chơi, du lịch hay dạo phố. Đừng bỏ lỡ chiếc nón đa năng vừa đẹp, vừa bảo vệ tốt này – nhanh tay sở hữu ngay hôm nay!\r\n\r\n    Chất liệu: THUN TRICOT UV 60%POLYESTER + 40%COTTON\r\n    Form: 6 múi\r\n    Màu sắc: Xanh Lá Đậm Gulf Coast,  Xanh Đậm\r\n    Sản xuất: Việt Nam','products/Nón_UV_Logo_MHA_1061_xanh_lá.jpg',1,'2026-03-12 10:36:25.116925','2026-03-12 10:36:25.116972',13),(26,'Quần Dài Nam Glow Line MPA 1015',499000,'Quần Dài Nam Glow Line MPA 1015. Được làm từ chất liệu vải dù 100% nylon, 120 GSM, nhẹ và thoáng, phù hợp cho cả vận động và mặc thường ngày. Thiết kế form wide leg phóng khoáng dành cho nữ và form Straight dành cho nam mang đến cảm giác thoải mái, dễ phối cùng nhiều kiểu áo. Bảng màu đa dạng Đen, Xanh ô liu Olivine, Hồng Pale, đáp ứng nhiều lựa chọn phong cách. Điểm nhấn nằm ở chi tiết đường viền phản quang độc đáo chạy dọc hai bên sườn, tạo hiệu ứng nổi bật khi di chuyển. Thiết kế thêm logo X tinh tế ở bên hông, phần thân sau tối giản giúp tổng thể hài hòa nhưng vẫn cá tính. Đây là item must-have – quần wide leg vừa năng động, vừa hợp xu hướng.\r\n\r\n \r\n\r\n    Chất liệu: Dù nhăn 100% Nylon\r\n    Form dáng: Straight\r\n    Màu sắc: Đen, Xanh Olivine\r\n    Sản xuất: Việt Nam','products/Quần_Dài_Nam_Glow_Line_MPA_1015_xanh_lá.jpg',1,'2026-03-12 10:39:04.064497','2026-03-12 10:39:35.981669',12),(27,'Quần Dài Nam Double Face Original MPA 1013',499000,'Quần Dài Nam Double Face Original MPA 1013. Quần dài Double Face Original Slogan được làm từ thun double face C/P, với thành phần 40% cotton và 60% polyester, mang lại sự mềm mại, co giãn tốt và bền bỉ trong suốt quá trình sử dụng. Sản phẩm có hai màu sắc dễ dàng phối hợp: đen và nâu, tạo nên phong cách đơn giản nhưng hiện đại, phù hợp với nhiều loại trang phục khác nhau. Với thiết kế form straight, sweatpants này mang lại sự thoải mái và tự do vận động, phù hợp cho cả các hoạt động thể thao lẫn thời trang thường ngày. Thêm ngay chiếc quần này vào tủ đồ của bạn để nâng cao phong cách và sự thoải mái.\r\n\r\n    Chất liệu: THUN DOUBLE FACE C/P 40%COTTON + 60%POLY 300GSM\r\n    Form dáng: STRAIGHT\r\n    Màu sắc: Đen, Nâu\r\n    Sản xuất: Việt Nam','products/Quần_Dài_Nam_Double_Face_Original_MPA_1013.jpg',1,'2026-03-12 10:40:34.313502','2026-03-12 10:40:34.313548',12),(28,'Quần Dài Nam Relax Tapper MPA 1011',549000,'Quần Dài Nam Chinos Relax MPA 1011. Quần dài nam Chinos được may từ chất liệu khakis bền chắc, mang lại cảm giác thoải mái, đứng dáng và dễ vận động. Sản phẩm có 3 màu cơ bản: be, xám và đen, dễ phối cùng nhiều kiểu áo cho cả đi làm lẫn dạo phố. Thiết kế form Relax Taper với phần đùi rộng rải thoải mái, ống quần thu gọn, độ dài vừa chạm mắt cá chân giúp tôn dáng, tạo cảm giác trẻ trung, năng động. Điểm cộng tiện lợi là lưng quần có dây rút, linh hoạt trong mọi hoạt động. Sở hữu ngay để hoàn thiện phong cách smart-casual hiện đại mỗi ngày!\r\n\r\n    Chất liệu: KHAKI\r\n    Form dáng: RELAX TAPPER\r\n    Màu sắc: Đen, xám\r\n    Sản xuất: Việt Nam','products/Quần_Dài_Nam_Relax_Tapper_MPA_1011_đen.jpg',1,'2026-03-12 10:46:57.356455','2026-03-12 10:46:57.356503',12),(29,'Áo Khoác Dù Nữ Relax Boxy Cổ Cao WOP 2095',699000,'Áo Khoác Dù Nữ Relax Boxy Cổ Cao WOP 2095 |. Áo khoác dù được thiết kế theo phong cách đơn giản nhưng phóng khoáng, dễ dàng phối đồ trong nhiều hoàn cảnh từ đi học, đi làm đến du lịch. Form boxy thoải mái mang đến cảm giác hiện đại, trẻ trung mà vẫn giữ được sự tinh gọn, thời thượng đặc trưng của Couple TX.\r\n\r\nSản phẩm sử dụng chất liệu dù mỏng trượt nước, hỗ trợ bảo vệ người mặc trước những cơn mưa nhẹ hoặc thời tiết ẩm. Độ co giãn nhẹ, trọng lượng nhẹ chỉ 95 gsm, cùng với chất liệu 94% nylon recycle, 6% spandex giúp vận động linh hoạt, mang lại cảm giác thoáng mát, dễ dàng mặc suốt cả ngày.\r\n\r\nĐiểm nhấn của áo nằm ở hình in phối màu hiện đại, tạo nét năng động và cá tính mà vẫn hài hòa với tổng thể tối giản. Đây là lựa chọn lý tưởng dành cho những cô nàng yêu thích phong cách thời trang tiện dụng nhưng vẫn muốn nổi bật một cách tinh tế.\r\n\r\n    Chất liệu: 94% nylon recycle, 6% spandex, 95gsm.\r\n    Form dáng: Relax Boxy\r\n    Màu sắc: Đen, Trắng\r\n    Sản xuất: Việt Nam','products/Áo_Khoác_Dù_Nữ_Relax_Boxy_Cổ_Cao_WOP_2095_đen.jpg',1,'2026-03-12 18:01:04.400877','2026-03-12 18:01:04.400940',14),(30,'Áo Khoác Dù Nữ Relax Cold Yarn FW25 WOP 2094',949000,'Áo Khoác Dù Nữ Relax Cold Yarn FW25 WOP 2094 được làm từ 100% Polyester Cold Yarn(140 GSM), mang lại cảm giác nhẹ, mát và thoáng khí vượt trội. Thiết kế form relax unisex trẻ trung với hai gam màu Đen và Xám High-Rise dễ phối đồ. Áo khoác 1 lớp có nón tiện dụng, hai túi dây kéo an toàn, thân sau in logo X và lai áo có dây rút tùy chỉnh độ ôm. \r\nĐặc biệt, chất liệu Cold Yarn loại sợi dệt gân công nghệ cao có khả năng giảm nhiệt độ bề mặt vải so với môi trường bên ngoài, giúp người mặc luôn cảm nhận được sự mát lạnh  khi chạm vào. Chất liệu này không chỉ thoáng khí, nhẹ và nhanh khô, mà còn hạn chế bám bụi và nhăn vải, mang lại cảm giác dễ chịu, thoải mái suốt cả ngày. Sở hữu ngay để trải nghiệm sự mát nhẹ và linh hoạt chuẩn phong cách FW25!\r\n\r\nChất liệu:  DÙ 100%POLYESTER COLD YARN 140GSM\r\nForm: Relax\r\nMàu sắc: Đen, Xám High - Rise\r\nSản xuất: Việt Nam','products/Áo_Khoác_Dù_Nữ_Relax_Cold_Yarn_FW25_WOP_2094_đen.jpg',1,'2026-03-12 18:03:39.695197','2026-03-12 18:03:53.876841',14),(31,'Áo Khoác Thun Nữ Anti UV Original Ver 2.0 WOK 2076',999000,'Áo khoác Thun Nữ Anti UV Original Ver2 WOK 2076 được làm từ chất liệu TRICOT UV gồm 60% Cotton + 40% Polyester cùng 230gsm, với 5 lựa chọn màu sắc cho nam và nữ. Thiết kế nổi bật với kết cấu vải 2 lớp: mặt trong là cotton mềm mại thấm hút mồ hôi, mặt ngoài là polyester dệt lỗ thoáng khí và tăng khả năng chống tia UV lên đến 98% cùng UPF 50++. Sản phẩm tiện ích với 2 túi dây kéo an toàn phía trước, 2 túi lớn bên trong, tay áo xỏ ngón cùng phần bo dài che mu bàn tay. Logo silicon UV ở thân trước, logo thương hiệu được phản quang ở thân sau giúp an toàn hơn khi di chuyển buổi tối. Đây chính là lựa chọn hoàn hảo cho những ai tìm kiếm một chiếc áo khoác chống nắng, thoáng mát và thời trang – hãy sở hữu ngay để đồng hành cùng bạn trên mọi hành trình!\r\n\r\n    Chất liệu: 60% Cotton + 40% Polyester – 230% GSM.\r\n    Form dáng: Regular \r\n    Màu sắc:  Xanh Dương Đậm, \r\n    Sản xuất: Việt Nam','products/Áo_Khoác_Thun_Nữ_Anti_UV_Original_Ver_2.0_WOK_2076.jpg',1,'2026-03-12 18:05:24.832341','2026-03-12 18:05:24.832414',14),(32,'Áo Polo Nữ Basic Jersey Zip WPO 2083',397000,'Áo Basic Jersey Zip WOP 2083 mang tinh thần tối giản hiện đại với thiết kế khóa dây kéo kim loại làm điểm nhấn, tạo cảm giác mới mẻ, năng động nhưng vẫn giữ được sự gọn gàng và thanh lịch. Phom Regular Boxy cân đối, vai hơi slim nhẹ giúp tổng thể tôn dáng vừa đủ, dễ mặc và không kén vóc dáng.\r\n\r\nSản phẩm sử dụng chất liệu jersey với thành phần 94% Cotton – 6% Spandex (200gsm), mang lại cảm giác mềm mại, thoáng mát và co giãn nhẹ, phù hợp cho các hoạt động thường ngày. Bề mặt vải có đường sọc ẩn tinh tế, tạo hiệu ứng đứng form và tăng chiều sâu thị giác cho áo..\r\n\r\nThiết kế cổ không trụ, lá cổ gọn gàng, kết hợp khóa kéo bạc răng mảnh với 2 đầu khóa giúp linh hoạt điều chỉnh phong cách – từ kín đáo đến phóng khoáng. Thân sau trơn tối giản, hoàn thiện bằng nhãn kẹp sườn như một chi tiết nhận diện tinh tế.\r\n\r\n \r\n\r\n    Chấ liệu: 94% COT, 6% SPX 200gsm\r\n    Form dáng: Regular Boxy\r\n    Màu sắc: Trắng, Đen\r\n    Sản xuất: Việt Nam','products/Áo_Polo_Nữ_Basic_Jersey_Zip_WPO_2083_đen.jpg',1,'2026-03-12 18:08:16.680957','2026-03-12 18:08:16.681009',16),(33,'Áo Polo Nữ Relax Boxy Rib WTS 2463',399000,'Áo Polo Nữ Relax Boxy Rib WTS 2463  được làm từ 93% Cotton và 7% Spandex, mang lại cảm giác mềm mại, co giãn và thoáng mát. Thiết kế form relax boxy hiện đại, dễ phối cùng nhiều phong cách, với ba gam màu trẻ trung: Xanh, Hồng và Tím. \r\n\r\nĐiểm nhấn nằm ở chất vải rib thời trang, cổ trụ không nút và lá bo cuốn biên cách điệu, tạo nét nữ tính nhưng vẫn năng động. Một item hoàn hảo cho nàng yêu thích sự thoải mái, thanh lịch và hiện đại – sở hữu ngay để nâng tầm phong cách mỗi ngày!\r\n\r\n    Chất liệu: 93% COTTON 7% SPANDEX -  135CM\r\n    Form dáng: Relax Boxy\r\n    Màu sắc: Xanh\r\n    Sản xuất: Việt Nam','products/Áo_Polo_Nữ_Relax_Boxy_Rib_WTS_2463.jpg',1,'2026-03-12 18:09:37.551252','2026-03-12 18:09:37.551302',16),(34,'Áo Polo Nữ Rib Cotton Slim Boxy FW25 WTS 2464',379000,'Áo Polo Nữ Rib Cotton Slim Boxy FW25 WTS 2464 được làm từ chất liệu Rib Cotton gồm 46% Rayon, 46% Cotton và 8% Spandex với định lượng 260 GSM, mang lại cảm giác mềm mại, co giãn nhẹ và thoáng mát khi mặc. Thiết kế form Slim Boxy ôm nhẹ vừa vặn, cùng bảng màu thanh lịch: Xám trắng – Xanh ngọc – Tím, phù hợp cho nhiều phong cách từ năng động đến nữ tính.\r\n\r\nĐiểm nhấn nổi bật của sản phẩm nằm ở thiết kế cổ áo nhẹ nhàng kết hợp hàng nút cài tinh tế, tạo điểm nhấn duyên dáng mà không cầu kỳ. Chất vải rib cotton mềm mại giúp áo vừa tôn dáng, vừa mang đến sự thoải mái trong suốt ngày dài. Đây là lựa chọn hoàn hảo cho những cô nàng yêu thích phong cách tối giản, hiện đại và tinh tế.\r\n\r\nSở hữu ngay Áo Polo Nữ Rib Cotton Slim Boxy Có Cổ Cài Nút FW25 để làm mới tủ đồ với một item vừa thanh lịch vừa ứng dụng cao. Đặt hàng ngay hôm nay để cảm nhận sự mềm mại và phong cách chuẩn mùa FW25!\r\n\r\n \r\n\r\n    Chất liệu: 46% RAYON + 46% COTTON + 8%SPANDEX, 260 GSM\r\n    Form dáng: Slim Boxy\r\n    Màu sắc: Xám trắng\r\n    Sản xuất: Việt Nam','products/Áo_Polo_Nữ_Rib_Cotton_Slim_Boxy_FW25_WTS_2464.jpg',1,'2026-03-12 18:11:27.901912','2026-03-12 18:11:27.901956',16),(35,'Áo Thun Nữ Baby Tee WTS 2509',249000,'Áo Thun Nữ Baby Tee WTS 2501 được thiết kế với form ôm gọn, tôn dáng, phù hợp cho phong cách trẻ trung và năng động.\r\n\r\nSản phẩm sử dụng chất liệu 100% Cotton, mang lại cảm giác mềm mại nhưng vẫn đủ độ dày và đứng form khi mặc. Chất vải thoáng khí, thấm hút tốt, phù hợp mặc hàng ngày.\r\n\r\nThiết kế tối giản, dễ phối cùng quần jeans, chân váy hoặc quần ống rộng, phù hợp cho nhiều hoàn cảnh từ đi học, đi làm đến dạo phố.\r\n\r\n \r\n\r\n    Chấ liệu: 100% cotton \r\n    Form dáng: Baby tee \r\n    Màu sắc:  Nâu\r\n    Sản xuất: Việt Nam','products/Áo_Thun_Nữ_Baby_Tee_WTS_2509.jpg',1,'2026-03-12 18:15:24.546417','2026-03-12 18:15:24.546473',15),(36,'Áo Thun Nữ Morden Stripe Relax WTS 2501',299000,'Áo Thun Nữ Morden Stripe Relax WTS 2501. Áo Modern Stripe Relax mang tinh thần casual hiện đại vào tủ đồ của phái mạnh với thiết kế kẻ sọc kinh điển và form Relax phóng khoáng. Được dệt từ chất liệu 100% Polyester định lượng 240GSM, áo không chỉ bền bỉ, giữ form tốt mà còn mang lại cảm giác thoải mái, dễ dàng di chuyển trong mọi hoạt động hàng ngày. Với bảng màu đa dạng gồm Đen, Xám và Cam Đất, đây là lựa chọn linh hoạt để bạn tự tin phối đồ cho những buổi dạo phố hay làm việc tại văn phòng\r\n\r\n    Chấ liệu: 95% Polyester + 5% Spandex, 230gsm \r\n    Form dáng: Regular Boxy\r\n    Màu sắc: Nâu\r\n    Sản xuất: Việt Nam\r\n\r\n##\r\n\r\n    Style năng động khi phối với các dòng trang phục như quần dài, quần short.\r\n    Các dịp đi làm, đi chơi hoặc đi du lịch.','products/Áo_Thun_Nữ_Morden_Stripe_Relax_WTS_2501.jpg',1,'2026-03-12 18:16:23.497875','2026-03-12 18:16:23.497919',15),(37,'Túi Chanel Classic Handbag Lambskin Sky Blue A01112-Y04059-NA104',273000000,'Túi Chanel Classic Handbag Lambskin Sky Blue A01112-Y04059-NA104 là một trong những mẫu túi biểu tượng của nhà mốt Chanel, nổi bật với thiết kế Classic Flap thanh lịch và màu xanh da trời (Sky Blue) nhẹ nhàng, sang trọng. Đây là mẫu túi được nhiều tín đồ thời trang yêu thích nhờ sự kết hợp giữa phong cách cổ điển và vẻ hiện đại tinh tế.\r\n\r\nMô tả sản phẩm\r\n\r\nChất liệu: Da cừu cao cấp (Lambskin) mềm mịn, bề mặt bóng nhẹ và sang trọng.\r\n\r\nMàu sắc: Sky Blue (xanh da trời thanh lịch).\r\n\r\nThiết kế:\r\n\r\nHọa tiết quilted hình quả trám đặc trưng của Chanel.\r\n\r\nKhóa xoay Double-C mang tính biểu tượng ở mặt trước.\r\n\r\nDây xích kim loại đan da có thể đeo vai hoặc đeo chéo.\r\n\r\nKích thước khoảng: 15.5 × 25.5 × 6.5 cm (size Medium Classic)','products/Túi_Chanel_Classic_Handbag_Lambskin_Sky_Blue_A01112-Y04059-NA104.png',1,'2026-03-12 18:19:49.997394','2026-03-12 18:19:49.997446',18),(38,'Túi Chanel Mini Flap Bag Metalic Lambskin A69900-B05133-NB812',270000000,'Túi Chanel Mini Flap Bag Metallic Lambskin A69900-B05133-NB812 là mẫu túi mini mang phong cách cổ điển đặc trưng của Chanel, nổi bật với chất liệu da cừu Metallic Lambskin sang trọng và thiết kế nhỏ gọn tinh tế. Đây là phiên bản Mini Classic Flap được nhiều tín đồ thời trang yêu thích nhờ vẻ ngoài thanh lịch nhưng vẫn hiện đại.\r\n\r\nMô tả sản phẩm\r\n\r\nChất liệu: Da cừu Metallic Lambskin cao cấp, mềm mại với bề mặt ánh kim sang trọng.\r\n\r\nMàu sắc: Metallic Blue (xanh ánh kim nổi bật).\r\n\r\nThiết kế:\r\n\r\nHọa tiết quilted hình quả trám đặc trưng của Chanel.\r\n\r\nKhóa xoay Double-C kim loại ở mặt trước tạo điểm nhấn sang trọng.\r\n\r\nDây xích kim loại đan da có thể đeo vai hoặc đeo chéo.','products/Túi_Chanel_Mini_Flap_Bag_Metalic_Lambskin_A69900-B05133-NB812.jpg',1,'2026-03-12 18:21:05.379436','2026-03-12 18:21:05.379482',18),(39,'Váy Nữ Mini Skirt Jean A Line WSK 2034',599000,'Váy Nữ Mini Skirt Jean A Line WSK 2034 . Mẫu chân váy đa năng giúp tôn dáng người mặc nhờ form chữ A che khuyết điểm phần hông và eo tốt, cùng với form mini sẽ tạo cảm giác chân dài hơn, đem lại sự phóng khoáng, năng động. Form dáng A ch khuyết điểm và tôn dáng người mặc tốt.\r\n\r\n    Chất liệu: Jean 67,3% cotton + 24% polyester + 7,3% recycled ﬁber + 1,4% spandex\r\n    Form:  A Line.\r\n    Màu sắc:  Xanh Nhạt.\r\n    Sản xuất: Việt Nam','products/Váy_Nữ_Mini_Skirt_Jean_A_Line_WSK_2034.jpg',1,'2026-03-12 18:22:41.305625','2026-03-12 18:22:41.305664',17),(40,'Chân Váy Dù Cargo Midi WSK 2032',599000,'Chân Váy Dù Cargo Midi FW25 WSK 2032  được làm từ vải dù nhăn 100% Nylon, mang lại cảm giác nhẹ, thoáng và giữ form tốt. Thiết kế dáng A-line dài chạm mắt cá, vừa bay bổng, nữ tính vừa năng động, cá tính. \r\n\r\nĐiểm nhấn là hai túi hộp có nắp tăng tính tiện dụng và phong cách, cùng đường xẻ nhẹ phía sau giúp di chuyển linh hoạt hơn. Với hai gam màu Đen và Xanh Ô liu Olivine, chiếc váy là lựa chọn hoàn hảo cho nàng yêu thích phong cách cargo hiện đại và thời thượng – sở hữu ngay để hoàn thiện outfit mùa mới!\r\n\r\nSở hữu ngay Chân Váy Dù Cargo Midi FW25 để làm mới tủ đồ của bạn với một item vừa tiện dụng vừa hợp xu hướng.\r\n\r\n    Chất liệu:  DÙ NHĂN 100% NYLON\r\n    Form: A LINE\r\n    Màu sắc: Đen, Xanh Ô Liu Olivine\r\n    Sản xuất: Việt Nam','products/Chân_Váy_Dù_Cargo_Midi_WSK_2032.jpg',1,'2026-03-12 18:24:20.357576','2026-03-12 18:24:20.357612',17);
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
  `size` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int unsigned NOT NULL,
  `is_available` tinyint(1) NOT NULL,
  `product_id` bigint NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_productvariant_product_id_size_color_79555036_uniq` (`product_id`,`size`,`color`),
  CONSTRAINT `shop_productvariant_product_id_3268ff6d_fk_shop_product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`),
  CONSTRAINT `shop_productvariant_chk_1` CHECK ((`stock` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_productvariant`
--

LOCK TABLES `shop_productvariant` WRITE;
/*!40000 ALTER TABLE `shop_productvariant` DISABLE KEYS */;
INSERT INTO `shop_productvariant` VALUES (2,'S','white',17,1,2,NULL),(3,'M','white',19,1,2,NULL),(4,'L','white',19,1,2,NULL),(5,'XL','white',17,1,2,NULL),(10,'S','white',98,1,4,''),(11,'M','white',98,1,4,''),(12,'L','white',100,1,4,NULL),(13,'S','gray',97,1,5,''),(14,'M','gray',100,1,5,NULL),(15,'L','gray',100,1,5,NULL),(16,'S','pink',98,1,6,''),(17,'M','pink',99,1,6,''),(18,'L','pink',100,1,6,NULL),(19,'S','gray',9,1,7,'products/variants/Áo_Khoác_Dù_Nam_Transform_Jacket_Ver2_MOP_1089_xam.jpg'),(20,'M','gray',9,1,7,'products/variants/Áo_Khoác_Dù_Nam_Transform_Jacket_Ver2_MOP_1089_xam_UpdwHZq.jpg'),(21,'S','black',9,1,7,'products/variants/Áo_Khoác_Dù_Nam_Transform_Jacket_Ver2_MOP_1089.jpg'),(22,'M','black',10,1,7,''),(23,'S','blue',10,1,8,''),(24,'M','blue',10,1,8,''),(25,'L','blue',10,1,8,''),(26,'S','gray',10,1,9,''),(27,'M','gray',10,1,9,''),(28,'L','gray',10,1,9,''),(29,'S','black',10,1,10,''),(30,'M','black',10,1,10,''),(31,'L','black',10,1,10,''),(32,'S','gray',10,1,10,'products/variants/Áo_Khoác_Dù_Nam_Overshirt_Nylon_Logo_CTX_MOP_1092_xám.jpg'),(33,'M','gray',10,1,10,'products/variants/Áo_Khoác_Dù_Nam_Overshirt_Nylon_Logo_CTX_MOP_1092_xám_taLwrwa.jpg'),(34,'L','gray',10,1,10,'products/variants/Áo_Khoác_Dù_Nam_Overshirt_Nylon_Logo_CTX_MOP_1092_xám_Gp4MOx4.jpg'),(35,'M','black',10,1,11,''),(36,'L','black',10,1,11,''),(37,'M','pink',10,1,11,'products/variants/Áo_Khoác_Hoodie_Nam_Airlayer_Chạm_MOK_1078_hồng.jpg'),(38,'L','pink',10,1,11,''),(39,'S','black',10,1,12,''),(40,'M','black',10,1,12,''),(41,'L','black',10,1,12,''),(42,'S','black',10,1,13,''),(43,'M','black',10,1,13,''),(44,'L','black',10,1,13,''),(45,'S','gray',10,1,14,''),(46,'M','gray',10,1,14,''),(47,'L','gray',10,1,14,''),(48,'S','brown',10,1,15,''),(49,'M','brown',10,1,15,''),(50,'L','brown',10,1,15,''),(51,'S','blue',10,1,16,''),(52,'M','blue',10,1,16,''),(53,'L','blue',10,1,16,''),(54,'S','green',10,1,16,'products/variants/Áo_Polo_Nam_Palf_Nature_Blend_MPO_1077_xanh_lá.jpg'),(55,'M','green',10,1,16,''),(56,'L','green',9,1,16,''),(57,'S','blue',10,1,17,''),(58,'M','blue',10,1,17,''),(59,'L','blue',10,1,17,''),(60,'S','white',10,1,17,'products/variants/Áo_Polo_Nam_Morden_Block_Regular_MPO_1086_trang.jpg'),(61,'M','white',10,1,17,''),(62,'L','white',10,1,17,''),(63,'S','black',10,1,18,''),(64,'M','black',10,1,18,''),(65,'L','black',10,1,18,''),(66,'S','brown',10,1,19,''),(67,'M','brown',101,1,19,''),(68,'L','brown',10,1,19,''),(69,'S','green',10,1,20,''),(70,'M','green',10,1,20,''),(71,'L','green',10,1,20,''),(72,'S','white',10,1,21,''),(73,'M','white',10,1,21,''),(74,'L','white',10,1,21,''),(75,'S','white',10,1,22,''),(76,'M','white',10,1,22,''),(77,'L','white',10,1,22,''),(78,'S','brown',10,1,22,'products/variants/Áo_Thun_Nam_Relax_Phối_Tay_Dài_MTS_1502_nâu.jpg'),(79,'M','brown',10,1,22,''),(80,'L','brown',10,1,22,''),(81,'S','black',10,1,23,''),(82,'S','black',10,1,24,''),(83,'S','green',10,1,25,''),(84,'S','blue',10,1,25,'products/variants/Nón_UV_Logo_MHA_1061_xanh_biển.jpg'),(85,'S','green',10,1,26,''),(86,'M','green',10,1,26,''),(87,'L','green',10,1,26,''),(88,'S','black',10,1,26,'products/variants/Quần_Dài_Nam_Glow_Line_MPA_1015_đen.jpg'),(89,'M','black',10,1,26,''),(90,'L','black',10,1,26,''),(91,'S','brown',10,1,27,''),(92,'M','brown',10,1,27,''),(93,'L','brown',10,1,27,''),(94,'S','black',10,1,28,''),(95,'M','black',10,1,28,''),(96,'L','black',10,1,28,''),(97,'S','gray',10,1,28,'products/variants/Quần_Dài_Nam_Relax_Tapper_MPA_1011_xám.jpg'),(98,'M','gray',10,1,28,''),(99,'L','gray',10,1,28,''),(100,'S','black',10,1,29,''),(101,'M','black',10,1,29,''),(102,'L','black',10,1,29,''),(103,'S','white',10,1,29,'products/variants/Áo_Khoác_Dù_Nữ_Relax_Boxy_Cổ_Cao_WOP_2095_trắng.jpg'),(104,'M','white',10,1,29,''),(105,'L','white',10,1,29,''),(106,'S','black',10,1,30,''),(107,'M','black',10,1,30,''),(108,'L','black',10,1,30,''),(109,'S','gray',10,1,30,'products/variants/Áo_Khoác_Dù_Nữ_Relax_Cold_Yarn_FW25_WOP_2094_xám.jpg'),(110,'M','gray',10,1,30,''),(111,'L','gray',10,1,30,''),(112,'S','blue',10,1,31,''),(113,'M','blue',10,1,31,''),(114,'L','blue',10,1,31,''),(115,'S','black',10,1,32,''),(116,'M','black',10,1,32,''),(117,'L','black',10,1,32,''),(118,'S','white',10,1,32,'products/variants/Áo_Polo_Nữ_Basic_Jersey_Zip_WPO_2083_trắng.jpg'),(119,'M','white',10,1,32,''),(120,'L','white',10,1,32,''),(121,'S','green',10,1,33,''),(122,'M','green',10,1,33,''),(123,'L','green',10,1,33,''),(124,'S','gray',10,1,34,''),(125,'M','gray',10,1,34,''),(126,'L','gray',0,1,34,''),(127,'S','brown',10,1,35,''),(128,'M','brown',10,1,35,''),(129,'L','brown',10,1,35,''),(130,'S','brown',10,1,36,''),(131,'M','brown',10,1,36,''),(132,'L','brown',10,1,36,''),(133,'S','navy',10,1,37,''),(134,'S','brown',10,1,38,''),(135,'S','blue',10,1,39,''),(136,'M','blue',10,1,39,''),(137,'L','blue',10,1,39,''),(138,'S','green',10,1,40,''),(139,'M','green',10,1,40,''),(140,'L','green',10,1,40,''),(141,'S','black',10,1,40,'products/variants/Chân_Váy_Dù_Cargo_Midi_WSK_2032_đen.jpg'),(142,'M','black',10,1,40,''),(143,'L','black',10,1,40,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_viewhistory`
--

LOCK TABLES `shop_viewhistory` WRITE;
/*!40000 ALTER TABLE `shop_viewhistory` DISABLE KEYS */;
INSERT INTO `shop_viewhistory` VALUES (1,'2026-01-29 17:14:42.259785',2,1),(2,'2026-01-29 17:15:11.006588',2,2),(3,'2026-01-29 17:17:45.083347',2,2),(4,'2026-01-29 18:11:28.843226',2,1),(5,'2026-01-29 18:11:56.501446',2,2),(6,'2026-01-29 18:12:08.278894',2,2),(7,'2026-01-29 18:16:29.923725',2,2),(8,'2026-01-29 18:16:43.330389',2,2),(9,'2026-01-29 18:16:53.734868',2,2),(10,'2026-01-29 18:48:34.453123',2,1),(11,'2026-01-29 18:48:50.154102',2,2),(12,'2026-01-29 18:49:02.103963',2,2),(13,'2026-01-29 18:51:04.868608',2,2),(14,'2026-01-29 18:51:47.996987',2,2),(15,'2026-01-29 18:51:56.728822',2,2),(16,'2026-01-29 18:58:25.106661',2,2),(17,'2026-01-29 18:58:35.407166',2,2),(18,'2026-01-29 19:27:28.076094',2,2),(19,'2026-01-29 19:35:49.834621',2,2),(20,'2026-01-29 19:36:04.110089',2,2),(21,'2026-01-29 19:36:22.347132',2,2),(22,'2026-01-29 19:36:55.187606',2,2),(23,'2026-01-29 20:05:18.372512',2,2),(24,'2026-01-29 20:05:26.471830',2,2),(25,'2026-02-04 16:17:19.939252',2,2),(26,'2026-02-24 18:20:38.370760',2,1),(27,'2026-02-24 18:24:52.052435',2,2),(28,'2026-02-24 18:27:08.231107',2,2),(29,'2026-02-24 18:45:53.288508',2,1),(30,'2026-02-24 19:13:11.755907',2,1),(46,'2026-03-06 18:36:35.643756',4,2),(49,'2026-03-06 18:39:03.444038',5,2),(50,'2026-03-06 19:04:10.538282',5,4),(51,'2026-03-06 19:10:48.866585',5,4),(52,'2026-03-06 19:27:44.099323',4,2),(53,'2026-03-06 19:44:18.549904',5,4),(54,'2026-03-06 19:49:56.049571',2,1),(55,'2026-03-06 20:17:26.215902',5,1),(56,'2026-03-06 20:19:44.184777',4,2),(57,'2026-03-07 08:19:35.764579',4,2),(58,'2026-03-07 08:22:15.777191',4,2),(59,'2026-03-07 09:33:53.875207',4,2),(60,'2026-03-07 09:34:11.192551',4,2),(61,'2026-03-07 09:38:29.846230',6,1),(62,'2026-03-10 06:28:54.469983',5,1),(63,'2026-03-10 06:29:09.506383',5,2),(64,'2026-03-10 06:29:14.736733',2,2),(65,'2026-03-10 06:29:18.304130',6,2),(66,'2026-03-10 06:29:21.991052',4,2),(67,'2026-03-10 06:29:27.721105',2,2),(68,'2026-03-10 06:38:25.308762',6,2),(69,'2026-03-10 19:58:17.119133',5,2),(70,'2026-03-10 19:58:28.073605',2,2),(71,'2026-03-10 19:59:54.496630',5,1),(72,'2026-03-10 20:01:03.699797',5,2),(73,'2026-03-10 20:01:09.730742',2,2),(74,'2026-03-10 20:01:13.791491',6,2),(75,'2026-03-10 20:01:17.527990',4,2),(76,'2026-03-10 20:25:38.991948',5,2),(77,'2026-03-10 20:27:01.139159',6,2),(78,'2026-03-10 20:27:50.670373',5,2),(79,'2026-03-10 20:31:16.567134',5,2),(80,'2026-03-10 20:42:26.704467',5,2),(81,'2026-03-10 20:42:43.624061',5,2),(82,'2026-03-10 20:45:57.485849',5,2),(83,'2026-03-10 20:54:20.305352',7,2),(84,'2026-03-10 21:01:38.796972',7,2),(85,'2026-03-10 21:03:26.371600',7,2),(86,'2026-03-10 21:05:44.858936',7,2),(87,'2026-03-10 21:05:53.594137',7,2),(88,'2026-03-10 21:06:55.744513',5,2),(89,'2026-03-11 08:19:51.359343',7,1),(90,'2026-03-11 08:20:10.207570',7,2),(91,'2026-03-11 08:20:24.364359',5,2),(92,'2026-03-11 08:28:50.021425',7,1),(93,'2026-03-11 08:29:11.562977',7,2),(94,'2026-03-11 08:29:56.212016',6,2),(95,'2026-03-11 08:56:20.641331',7,2),(96,'2026-03-11 08:57:10.026205',7,1),(97,'2026-03-11 09:03:29.289552',7,2),(98,'2026-03-11 09:16:09.840847',7,2),(99,'2026-03-11 09:16:18.606168',7,2),(100,'2026-03-11 09:16:57.127403',7,2),(101,'2026-03-11 09:18:23.658570',7,2),(102,'2026-03-11 18:57:59.260669',7,2),(103,'2026-03-11 19:04:32.817468',4,2),(104,'2026-03-11 19:09:08.226801',7,2),(105,'2026-03-11 19:09:22.185506',2,2),(106,'2026-03-11 19:09:31.213717',2,2),(107,'2026-03-11 19:53:26.823678',7,2),(108,'2026-03-11 19:56:15.106969',6,2),(109,'2026-03-11 20:11:19.091079',6,2),(110,'2026-03-12 09:49:22.692865',7,1),(111,'2026-03-12 09:53:35.950461',11,1),(112,'2026-03-12 09:54:00.310976',11,2),(113,'2026-03-12 09:57:47.277312',12,2),(114,'2026-03-12 09:58:56.395490',12,6),(115,'2026-03-12 10:14:46.676321',16,2);
/*!40000 ALTER TABLE `shop_viewhistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-13 12:51:31
