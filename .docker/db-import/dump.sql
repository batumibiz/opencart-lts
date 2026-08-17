/*M!999999\- enable the sandbox mode */
-- MariaDB dump 10.19-11.8.8-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: opencart
-- ------------------------------------------------------
-- Server version	12.3.2-MariaDB-ubu2404

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `oc_address`
--

DROP TABLE IF EXISTS `oc_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `company` varchar(60) DEFAULT NULL,
  `address_1` varchar(128) DEFAULT NULL,
  `address_2` varchar(128) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `country_id` int(11) DEFAULT 0,
  `zone_id` int(11) DEFAULT 0,
  `custom_field` text DEFAULT NULL,
  `default` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_address`
--


--
-- Table structure for table `oc_address_format`
--

DROP TABLE IF EXISTS `oc_address_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_address_format` (
  `address_format_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `address_format` text DEFAULT NULL,
  PRIMARY KEY (`address_format_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_address_format`
--

INSERT INTO `oc_address_format` VALUES
(1,'Address Format','{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}');

--
-- Table structure for table `oc_antispam`
--

DROP TABLE IF EXISTS `oc_antispam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_antispam` (
  `antispam_id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`antispam_id`),
  KEY `keyword` (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_antispam`
--


--
-- Table structure for table `oc_api`
--

DROP TABLE IF EXISTS `oc_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_api` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `key` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_api`
--

INSERT INTO `oc_api` VALUES
(1,'Default','35674cf3debd95a8a20ee67257d80a1eb5c6edd772bf5c00e906d6f6f909fe2538884207bf74bc1283a6873222ab2ba12c90390b404a56935e35fbec4deeba8bddd9d0722dae28e2a274ff8148d83a676f9cbadd8e3c46c2f989b783e230e516c7ce754c4ccb04c1cfab036f34b5e76a86c49bd923b9191f507fdf8b3c44ce32',1,'2026-07-24 01:34:09','2026-07-24 01:34:09');

--
-- Table structure for table `oc_api_history`
--

DROP TABLE IF EXISTS `oc_api_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_api_history` (
  `api_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) DEFAULT NULL,
  `call` varchar(32) DEFAULT NULL,
  `ip` varchar(40) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`api_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_api_history`
--


--
-- Table structure for table `oc_api_ip`
--

DROP TABLE IF EXISTS `oc_api_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_api_ip` (
  `api_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) DEFAULT NULL,
  `ip` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`api_ip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_api_ip`
--


--
-- Table structure for table `oc_article`
--

DROP TABLE IF EXISTS `oc_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) DEFAULT 0,
  `author` varchar(64) DEFAULT NULL,
  `rating` int(11) DEFAULT 0,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_article`
--


--
-- Table structure for table `oc_article_comment`
--

DROP TABLE IF EXISTS `oc_article_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_article_comment` (
  `article_comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT 0,
  `customer_id` int(11) DEFAULT 0,
  `author` varchar(64) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `rating` int(11) DEFAULT 0,
  `ip` varchar(40) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`article_comment_id`),
  KEY `article_id` (`article_id`),
  KEY `customer_id` (`customer_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_article_comment`
--


--
-- Table structure for table `oc_article_description`
--

DROP TABLE IF EXISTS `oc_article_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_article_description` (
  `article_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `tag` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`article_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_article_description`
--


--
-- Table structure for table `oc_article_rating`
--

DROP TABLE IF EXISTS `oc_article_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_article_rating` (
  `article_rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_comment_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT 0,
  `customer_id` int(11) DEFAULT 0,
  `rating` tinyint(1) DEFAULT 0,
  `ip` varchar(40) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`article_rating_id`),
  KEY `article_comment_id` (`article_comment_id`),
  KEY `article_id` (`article_id`),
  KEY `store_id` (`store_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_article_rating`
--


--
-- Table structure for table `oc_article_to_layout`
--

DROP TABLE IF EXISTS `oc_article_to_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_article_to_layout` (
  `article_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `layout_id` int(11) DEFAULT 0,
  PRIMARY KEY (`article_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_article_to_layout`
--


--
-- Table structure for table `oc_article_to_store`
--

DROP TABLE IF EXISTS `oc_article_to_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_article_to_store` (
  `article_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`article_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_article_to_store`
--


--
-- Table structure for table `oc_attribute`
--

DROP TABLE IF EXISTS `oc_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) DEFAULT 0,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_attribute`
--

INSERT INTO `oc_attribute` VALUES
(1,6,1),
(2,6,5),
(3,6,3),
(4,3,1),
(5,3,2),
(6,3,3),
(7,3,4),
(8,3,5),
(9,3,6),
(10,3,7),
(11,3,8);

--
-- Table structure for table `oc_attribute_description`
--

DROP TABLE IF EXISTS `oc_attribute_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_attribute_description`
--

INSERT INTO `oc_attribute_description` VALUES
(1,1,'Description'),
(2,1,'No. of Cores'),
(3,1,'Clockspeed'),
(4,1,'test 1'),
(5,1,'test 2'),
(6,1,'test 3'),
(7,1,'test 4'),
(8,1,'test 5'),
(9,1,'test 6'),
(10,1,'test 7'),
(11,1,'test 8');

--
-- Table structure for table `oc_attribute_group`
--

DROP TABLE IF EXISTS `oc_attribute_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_attribute_group`
--

INSERT INTO `oc_attribute_group` VALUES
(3,2),
(4,1),
(5,3),
(6,4);

--
-- Table structure for table `oc_attribute_group_description`
--

DROP TABLE IF EXISTS `oc_attribute_group_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_attribute_group_description`
--

INSERT INTO `oc_attribute_group_description` VALUES
(3,1,'Memory'),
(4,1,'Technical'),
(5,1,'Motherboard'),
(6,1,'Processor');

--
-- Table structure for table `oc_banner`
--

DROP TABLE IF EXISTS `oc_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_banner`
--

INSERT INTO `oc_banner` VALUES
(6,'HP Products',1),
(7,'Home Page Slideshow',1),
(8,'Manufacturers',1);

--
-- Table structure for table `oc_banner_image`
--

DROP TABLE IF EXISTS `oc_banner_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`banner_image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_banner_image`
--

INSERT INTO `oc_banner_image` VALUES
(79,7,1,'iPhone 6','index.php?route=product/product&amp;path=57&amp;product_id=49','catalog/demo/banners/iPhone6.jpg',0),
(80,7,1,'MacBookAir','','catalog/demo/banners/MacBookAir.jpg',0),
(87,6,1,'HP Banner','index.php?route=product/manufacturer.info&amp;manufacturer_id=7','catalog/demo/compaq_presario.jpg',0),
(88,8,1,'Harley Davidson','','catalog/demo/manufacturer/harley.png',0),
(89,8,1,'Dell','','catalog/demo/manufacturer/dell.png',0),
(90,8,1,'Disney','','catalog/demo/manufacturer/disney.png',0),
(91,8,1,'Coca Cola','','catalog/demo/manufacturer/cocacola.png',0),
(92,8,1,'Burger King','','catalog/demo/manufacturer/burgerking.png',0),
(93,8,1,'Canon','','catalog/demo/manufacturer/canon.png',0),
(94,8,1,'NFL','','catalog/demo/manufacturer/nfl.png',0),
(95,8,1,'RedBull','','catalog/demo/manufacturer/redbull.png',0),
(96,8,1,'Sony','','catalog/demo/manufacturer/sony.png',0),
(97,8,1,'Starbucks','','catalog/demo/manufacturer/starbucks.png',0),
(98,8,1,'Nintendo','','catalog/demo/manufacturer/nintendo.png',0);

--
-- Table structure for table `oc_cart`
--

DROP TABLE IF EXISTS `oc_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT 0,
  `customer_id` int(11) DEFAULT 0,
  `session_id` varchar(32) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `subscription_plan_id` int(11) DEFAULT 0,
  `option` text DEFAULT NULL,
  `quantity` int(5) DEFAULT NULL,
  `override` text DEFAULT NULL,
  `price` decimal(15,4) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `cart_id` (`customer_id`,`session_id`,`product_id`,`subscription_plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_cart`
--


--
-- Table structure for table `oc_category`
--

DROP TABLE IF EXISTS `oc_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT 0,
  `sort_order` int(3) DEFAULT 0,
  `status` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_category`
--

INSERT INTO `oc_category` VALUES
(17,'',0,4,1),
(18,'catalog/demo/hp_2.jpg',0,2,1),
(20,'catalog/demo/compaq_presario.jpg',0,1,1),
(24,'',0,5,1),
(25,'',0,3,1),
(26,'',20,1,1),
(27,'',20,2,1),
(28,'',25,1,1),
(29,'',25,1,1),
(30,'',25,1,1),
(31,'',25,1,1),
(32,'',25,1,1),
(33,'',0,6,1),
(34,'catalog/demo/ipod_touch_4.jpg',0,7,1),
(35,'',28,0,1),
(36,'',28,0,1),
(37,'',34,0,1),
(38,'',34,0,1),
(39,'',34,0,1),
(40,'',34,0,1),
(41,'',34,0,1),
(42,'',34,0,1),
(43,'',34,0,1),
(44,'',34,0,1),
(45,'',18,0,1),
(46,'',18,0,1),
(47,'',34,0,1),
(48,'',34,0,1),
(49,'',34,0,1),
(50,'',34,0,1),
(51,'',34,0,1),
(52,'',34,0,1),
(53,'',34,0,1),
(54,'',34,0,1),
(55,'',34,0,1),
(56,'',34,0,1),
(57,'',0,3,1),
(58,'',52,0,1);

--
-- Table structure for table `oc_category_description`
--

DROP TABLE IF EXISTS `oc_category_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_category_description`
--

INSERT INTO `oc_category_description` VALUES
(17,1,'Software','','Software','',''),
(18,1,'Laptops &amp; Notebooks','&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n','Laptops &amp; Notebooks','',''),
(20,1,'Desktops','&lt;p&gt;\r\n	Example of category description text&lt;/p&gt;\r\n','Desktops','Example of category description',''),
(24,1,'Phones &amp; PDAs','','Phones &amp; PDAs','',''),
(25,1,'Components','','Components','',''),
(26,1,'PC','','PC','',''),
(27,1,'Mac','','Mac','',''),
(28,1,'Monitors','','Monitors','',''),
(29,1,'Mice and Trackballs','','Mice and Trackballs','',''),
(30,1,'Printers','','Printers','',''),
(31,1,'Scanners','','Scanners','',''),
(32,1,'Web Cameras','','Web Cameras','',''),
(33,1,'Cameras','','Cameras','',''),
(34,1,'MP3 Players','&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n','MP3 Players','',''),
(35,1,'test 1','','test 1','',''),
(36,1,'test 2','','test 2','',''),
(37,1,'test 5','','test 5','',''),
(38,1,'test 4','','test 4','',''),
(39,1,'test 6','','test 6','',''),
(40,1,'test 7','','test 7','',''),
(41,1,'test 8','','test 8','',''),
(42,1,'test 9','','test 9','',''),
(43,1,'test 11','','test 11','',''),
(44,1,'test 12','','test 12','',''),
(45,1,'Windows','','Windows','',''),
(46,1,'Macs','','Macs','',''),
(47,1,'test 15','','test 15','',''),
(48,1,'test 16','','test 16','',''),
(49,1,'test 17','','test 17','',''),
(50,1,'test 18','','test 18','',''),
(51,1,'test 19','','test 19','',''),
(52,1,'test 20','','test 20','',''),
(53,1,'test 21','','test 21','',''),
(54,1,'test 22','','test 22','',''),
(55,1,'test 23','','test 23','',''),
(56,1,'test 24','','test 24','',''),
(57,1,'Tablets','','Tablets','',''),
(58,1,'test 25','','test 25','','');

--
-- Table structure for table `oc_category_filter`
--

DROP TABLE IF EXISTS `oc_category_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_category_filter`
--


--
-- Table structure for table `oc_category_path`
--

DROP TABLE IF EXISTS `oc_category_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_category_path`
--

INSERT INTO `oc_category_path` VALUES
(17,17,0),
(18,18,0),
(20,20,0),
(24,24,0),
(25,25,0),
(26,20,0),
(26,26,1),
(27,20,0),
(27,27,1),
(28,25,0),
(28,28,1),
(29,25,0),
(29,29,1),
(30,25,0),
(30,30,1),
(31,25,0),
(31,31,1),
(32,25,0),
(32,32,1),
(33,33,0),
(34,34,0),
(35,25,0),
(35,28,1),
(35,35,2),
(36,25,0),
(36,28,1),
(36,36,2),
(37,34,0),
(37,37,1),
(38,34,0),
(38,38,1),
(39,34,0),
(39,39,1),
(40,34,0),
(40,40,1),
(41,34,0),
(41,41,1),
(42,34,0),
(42,42,1),
(43,34,0),
(43,43,1),
(44,34,0),
(44,44,1),
(45,18,0),
(45,45,1),
(46,18,0),
(46,46,1),
(47,34,0),
(47,47,1),
(48,34,0),
(48,48,1),
(49,34,0),
(49,49,1),
(50,34,0),
(50,50,1),
(51,34,0),
(51,51,1),
(52,34,0),
(52,52,1),
(53,34,0),
(53,53,1),
(54,34,0),
(54,54,1),
(55,34,0),
(55,55,1),
(56,34,0),
(56,56,1),
(57,57,0),
(58,34,0),
(58,52,1),
(58,58,2);

--
-- Table structure for table `oc_category_to_layout`
--

DROP TABLE IF EXISTS `oc_category_to_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `layout_id` int(11) DEFAULT 0,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_category_to_layout`
--


--
-- Table structure for table `oc_category_to_store`
--

DROP TABLE IF EXISTS `oc_category_to_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_category_to_store`
--

INSERT INTO `oc_category_to_store` VALUES
(17,0),
(18,0),
(20,0),
(24,0),
(25,0),
(26,0),
(27,0),
(28,0),
(29,0),
(30,0),
(31,0),
(32,0),
(33,0),
(34,0),
(35,0),
(36,0),
(37,0),
(38,0),
(39,0),
(40,0),
(41,0),
(42,0),
(43,0),
(44,0),
(45,0),
(46,0),
(47,0),
(48,0),
(49,0),
(50,0),
(51,0),
(52,0),
(53,0),
(54,0),
(55,0),
(56,0),
(57,0),
(58,0);

--
-- Table structure for table `oc_country`
--

DROP TABLE IF EXISTS `oc_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `iso_code_2` varchar(2) DEFAULT NULL,
  `iso_code_3` varchar(3) DEFAULT NULL,
  `address_format_id` int(11) DEFAULT 0,
  `postcode_required` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_country`
--

INSERT INTO `oc_country` VALUES
(1,'AF','AFG',1,0,1),
(2,'AL','ALB',1,0,1),
(3,'DZ','DZA',1,0,1),
(4,'AS','ASM',1,0,1),
(5,'AD','AND',1,0,1),
(6,'AO','AGO',1,0,1),
(7,'AI','AIA',1,0,1),
(8,'AQ','ATA',1,0,1),
(9,'AG','ATG',1,0,1),
(10,'AR','ARG',1,0,1),
(11,'AM','ARM',1,0,1),
(12,'AW','ABW',1,0,1),
(13,'AU','AUS',1,0,1),
(14,'AT','AUT',1,0,1),
(15,'AZ','AZE',1,0,1),
(16,'BS','BHS',1,0,1),
(17,'BH','BHR',1,0,1),
(18,'BD','BGD',1,0,1),
(19,'BB','BRB',1,0,1),
(20,'BY','BLR',1,0,1),
(21,'BE','BEL',1,0,1),
(22,'BZ','BLZ',1,0,1),
(23,'BJ','BEN',1,0,1),
(24,'BM','BMU',1,0,1),
(25,'BT','BTN',1,0,1),
(26,'BO','BOL',1,0,1),
(27,'BA','BIH',1,0,1),
(28,'BW','BWA',1,0,1),
(29,'BV','BVT',1,0,1),
(30,'BR','BRA',1,0,1),
(31,'IO','IOT',1,0,1),
(32,'BN','BRN',1,0,1),
(33,'BG','BGR',1,0,1),
(34,'BF','BFA',1,0,1),
(35,'BI','BDI',1,0,1),
(36,'KH','KHM',1,0,1),
(37,'CM','CMR',1,0,1),
(38,'CA','CAN',1,0,1),
(39,'CV','CPV',1,0,1),
(40,'KY','CYM',1,0,1),
(41,'CF','CAF',1,0,1),
(42,'TD','TCD',1,0,1),
(43,'CL','CHL',1,0,1),
(44,'CN','CHN',1,0,1),
(45,'CX','CXR',1,0,1),
(46,'CC','CCK',1,0,1),
(47,'CO','COL',1,0,1),
(48,'KM','COM',1,0,1),
(49,'CG','COG',1,0,1),
(50,'CK','COK',1,0,1),
(51,'CR','CRI',1,0,1),
(52,'CI','CIV',1,0,1),
(53,'HR','HRV',1,0,1),
(54,'CU','CUB',1,0,1),
(55,'CY','CYP',1,0,1),
(56,'CZ','CZE',1,0,1),
(57,'DK','DNK',1,0,1),
(58,'DJ','DJI',1,0,1),
(59,'DM','DMA',1,0,1),
(60,'DO','DOM',1,0,1),
(61,'TL','TLS',1,0,1),
(62,'EC','ECU',1,0,1),
(63,'EG','EGY',1,0,1),
(64,'SV','SLV',1,0,1),
(65,'GQ','GNQ',1,0,1),
(66,'ER','ERI',1,0,1),
(67,'EE','EST',1,0,1),
(68,'ET','ETH',1,0,1),
(69,'FK','FLK',1,0,1),
(70,'FO','FRO',1,0,1),
(71,'FJ','FJI',1,0,1),
(72,'FI','FIN',1,0,1),
(74,'FR','FRA',1,1,1),
(75,'GF','GUF',1,0,1),
(76,'PF','PYF',1,0,1),
(77,'TF','ATF',1,0,1),
(78,'GA','GAB',1,0,1),
(79,'GM','GMB',1,0,1),
(80,'GE','GEO',1,0,1),
(81,'DE','DEU',1,1,1),
(82,'GH','GHA',1,0,1),
(83,'GI','GIB',1,0,1),
(84,'GR','GRC',1,0,1),
(85,'GL','GRL',1,0,1),
(86,'GD','GRD',1,0,1),
(87,'GP','GLP',1,0,1),
(88,'GU','GUM',1,0,1),
(89,'GT','GTM',1,0,1),
(90,'GN','GIN',1,0,1),
(91,'GW','GNB',1,0,1),
(92,'GY','GUY',1,0,1),
(93,'HT','HTI',1,0,1),
(94,'HM','HMD',1,0,1),
(95,'HN','HND',1,0,1),
(96,'HK','HKG',1,0,1),
(97,'HU','HUN',1,0,1),
(98,'IS','ISL',1,0,1),
(99,'IN','IND',1,0,1),
(100,'ID','IDN',1,0,1),
(101,'IR','IRN',1,0,1),
(102,'IQ','IRQ',1,0,1),
(103,'IE','IRL',1,0,1),
(104,'IL','ISR',1,0,1),
(105,'IT','ITA',1,0,1),
(106,'JM','JAM',1,0,1),
(107,'JP','JPN',1,0,1),
(108,'JO','JOR',1,0,1),
(109,'KZ','KAZ',1,0,1),
(110,'KE','KEN',1,0,1),
(111,'KI','KIR',1,0,1),
(112,'KP','PRK',1,0,1),
(113,'KR','KOR',1,0,1),
(114,'KW','KWT',1,0,1),
(115,'KG','KGZ',1,0,1),
(116,'LA','LAO',1,0,1),
(117,'LV','LVA',1,0,1),
(118,'LB','LBN',1,0,1),
(119,'LS','LSO',1,0,1),
(120,'LR','LBR',1,0,1),
(121,'LY','LBY',1,0,1),
(122,'LI','LIE',1,0,1),
(123,'LT','LTU',1,0,1),
(124,'LU','LUX',1,0,1),
(125,'MO','MAC',1,0,1),
(126,'MK','MKD',1,0,1),
(127,'MG','MDG',1,0,1),
(128,'MW','MWI',1,0,1),
(129,'MY','MYS',1,0,1),
(130,'MV','MDV',1,0,1),
(131,'ML','MLI',1,0,1),
(132,'MT','MLT',1,0,1),
(133,'MH','MHL',1,0,1),
(134,'MQ','MTQ',1,0,1),
(135,'MR','MRT',1,0,1),
(136,'MU','MUS',1,0,1),
(137,'YT','MYT',1,0,1),
(138,'MX','MEX',1,0,1),
(139,'FM','FSM',1,0,1),
(140,'MD','MDA',1,0,1),
(141,'MC','MCO',1,0,1),
(142,'MN','MNG',1,0,1),
(143,'MS','MSR',1,0,1),
(144,'MA','MAR',1,0,1),
(145,'MZ','MOZ',1,0,1),
(146,'MM','MMR',1,0,1),
(147,'NA','NAM',1,0,1),
(148,'NR','NRU',1,0,1),
(149,'NP','NPL',1,0,1),
(150,'NL','NLD',1,0,1),
(151,'AN','ANT',1,0,1),
(152,'NC','NCL',1,0,1),
(153,'NZ','NZL',1,0,1),
(154,'NI','NIC',1,0,1),
(155,'NE','NER',1,0,1),
(156,'NG','NGA',1,0,1),
(157,'NU','NIU',1,0,1),
(158,'NF','NFK',1,0,1),
(159,'MP','MNP',1,0,1),
(160,'NO','NOR',1,0,1),
(161,'OM','OMN',1,0,1),
(162,'PK','PAK',1,0,1),
(163,'PW','PLW',1,0,1),
(164,'PA','PAN',1,0,1),
(165,'PG','PNG',1,0,1),
(166,'PY','PRY',1,0,1),
(167,'PE','PER',1,0,1),
(168,'PH','PHL',1,0,1),
(169,'PN','PCN',1,0,1),
(170,'PL','POL',1,0,1),
(171,'PT','PRT',1,0,1),
(172,'PR','PRI',1,0,1),
(173,'QA','QAT',1,0,1),
(174,'RE','REU',1,0,1),
(175,'RO','ROM',1,0,1),
(176,'RU','RUS',1,0,1),
(177,'RW','RWA',1,0,1),
(178,'KN','KNA',1,0,1),
(179,'LC','LCA',1,0,1),
(180,'VC','VCT',1,0,1),
(181,'WS','WSM',1,0,1),
(182,'SM','SMR',1,0,1),
(183,'ST','STP',1,0,1),
(184,'SA','SAU',1,0,1),
(185,'SN','SEN',1,0,1),
(186,'SC','SYC',1,0,1),
(187,'SL','SLE',1,0,1),
(188,'SG','SGP',1,0,1),
(189,'SK','SVK',1,0,1),
(190,'SI','SVN',1,0,1),
(191,'SB','SLB',1,0,1),
(192,'SO','SOM',1,0,1),
(193,'ZA','ZAF',1,0,1),
(194,'GS','SGS',1,0,1),
(195,'ES','ESP',1,0,1),
(196,'LK','LKA',1,0,1),
(197,'SH','SHN',1,0,1),
(198,'PM','SPM',1,0,1),
(199,'SD','SDN',1,0,1),
(200,'SR','SUR',1,0,1),
(201,'SJ','SJM',1,0,1),
(202,'SZ','SWZ',1,0,1),
(203,'SE','SWE',1,1,1),
(204,'CH','CHE',1,0,1),
(205,'SY','SYR',1,0,1),
(206,'TW','TWN',1,0,1),
(207,'TJ','TJK',1,0,1),
(208,'TZ','TZA',1,0,1),
(209,'TH','THA',1,0,1),
(210,'TG','TGO',1,0,1),
(211,'TK','TKL',1,0,1),
(212,'TO','TON',1,0,1),
(213,'TT','TTO',1,0,1),
(214,'TN','TUN',1,0,1),
(215,'TR','TUR',1,0,1),
(216,'TM','TKM',1,0,1),
(217,'TC','TCA',1,0,1),
(218,'TV','TUV',1,0,1),
(219,'UG','UGA',1,0,1),
(220,'UA','UKR',1,0,1),
(221,'AE','ARE',1,0,1),
(222,'GB','GBR',1,1,1),
(223,'US','USA',1,0,1),
(224,'UM','UMI',1,0,1),
(225,'UY','URY',1,0,1),
(226,'UZ','UZB',1,0,1),
(227,'VU','VUT',1,0,1),
(228,'VA','VAT',1,0,1),
(229,'VE','VEN',1,0,1),
(230,'VN','VNM',1,0,1),
(231,'VG','VGB',1,0,1),
(232,'VI','VIR',1,0,1),
(233,'WF','WLF',1,0,1),
(234,'EH','ESH',1,0,1),
(235,'YE','YEM',1,0,1),
(237,'CD','COD',1,0,1),
(238,'ZM','ZMB',1,0,1),
(239,'ZW','ZWE',1,0,1),
(242,'ME','MNE',1,0,1),
(243,'RS','SRB',1,0,1),
(244,'AX','ALA',1,0,1),
(245,'BQ','BES',1,0,1),
(246,'CW','CUW',1,0,1),
(247,'PS','PSE',1,0,1),
(248,'SS','SSD',1,0,1),
(249,'BL','BLM',1,0,1),
(250,'MF','MAF',1,0,1),
(251,'IC','ICA',1,0,1),
(252,'AC','ASC',1,0,1),
(253,'XK','UNK',1,0,1),
(254,'IM','IMN',1,0,1),
(255,'TA','SHN',1,0,1),
(256,'GG','GGY',1,0,1),
(257,'JE','JEY',1,0,1);

--
-- Table structure for table `oc_country_description`
--

DROP TABLE IF EXISTS `oc_country_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_country_description` (
  `country_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`country_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_country_description`
--

INSERT INTO `oc_country_description` VALUES
(244,1,'Aaland Islands'),
(1,1,'Afghanistan'),
(2,1,'Albania'),
(3,1,'Algeria'),
(4,1,'American Samoa'),
(5,1,'Andorra'),
(6,1,'Angola'),
(7,1,'Anguilla'),
(8,1,'Antarctica'),
(9,1,'Antigua and Barbuda'),
(10,1,'Argentina'),
(11,1,'Armenia'),
(12,1,'Aruba'),
(252,1,'Ascension Island (British)'),
(13,1,'Australia'),
(14,1,'Austria'),
(15,1,'Azerbaijan'),
(17,1,'Bahrain'),
(18,1,'Bangladesh'),
(19,1,'Barbados'),
(20,1,'Belarus'),
(21,1,'Belgium'),
(22,1,'Belize'),
(23,1,'Benin'),
(24,1,'Bermuda'),
(25,1,'Bhutan'),
(26,1,'Bolivia'),
(245,1,'Bonaire, Sint Eustatius and Saba'),
(27,1,'Bosnia and Herzegovina'),
(28,1,'Botswana'),
(29,1,'Bouvet Island'),
(30,1,'Brazil'),
(31,1,'British Indian Ocean Territory'),
(32,1,'Brunei'),
(33,1,'Bulgaria'),
(34,1,'Burkina Faso'),
(35,1,'Burundi'),
(36,1,'Cambodia'),
(37,1,'Cameroon'),
(38,1,'Canada'),
(251,1,'Canary Islands'),
(39,1,'Cape Verde'),
(40,1,'Cayman Islands'),
(41,1,'Central African Republic'),
(42,1,'Chad'),
(43,1,'Chile'),
(44,1,'China'),
(45,1,'Christmas Island'),
(46,1,'Cocos (Keeling) Islands'),
(47,1,'Colombia'),
(48,1,'Comoros'),
(49,1,'Congo'),
(50,1,'Cook Islands'),
(51,1,'Costa Rica'),
(52,1,'Cote D\'Ivoire'),
(53,1,'Croatia'),
(54,1,'Cuba'),
(246,1,'Curacao'),
(55,1,'Cyprus'),
(56,1,'Czech Republic'),
(237,1,'Democratic Republic of the Congo'),
(57,1,'Denmark'),
(58,1,'Djibouti'),
(59,1,'Dominica'),
(60,1,'Dominican Republic'),
(62,1,'Ecuador'),
(63,1,'Egypt'),
(64,1,'El Salvador'),
(65,1,'Equatorial Guinea'),
(66,1,'Eritrea'),
(67,1,'Estonia'),
(202,1,'Eswatini'),
(68,1,'Ethiopia'),
(69,1,'Falkland Islands (Malvinas)'),
(70,1,'Faroe Islands'),
(71,1,'Fiji'),
(72,1,'Finland'),
(74,1,'France, Metropolitan'),
(75,1,'French Guiana'),
(76,1,'French Polynesia'),
(77,1,'French Southern Territories'),
(78,1,'Gabon'),
(80,1,'Georgia'),
(81,1,'Germany'),
(82,1,'Ghana'),
(83,1,'Gibraltar'),
(84,1,'Greece'),
(85,1,'Greenland'),
(86,1,'Grenada'),
(87,1,'Guadeloupe'),
(88,1,'Guam'),
(89,1,'Guatemala'),
(256,1,'Guernsey'),
(90,1,'Guinea'),
(91,1,'Guinea-Bissau'),
(92,1,'Guyana'),
(93,1,'Haiti'),
(94,1,'Heard and Mc Donald Islands'),
(95,1,'Honduras'),
(96,1,'Hong Kong'),
(97,1,'Hungary'),
(98,1,'Iceland'),
(99,1,'India'),
(100,1,'Indonesia'),
(101,1,'Iran (Islamic Republic of)'),
(102,1,'Iraq'),
(103,1,'Ireland'),
(254,1,'Isle of Man'),
(104,1,'Israel'),
(105,1,'Italy'),
(106,1,'Jamaica'),
(107,1,'Japan'),
(257,1,'Jersey'),
(108,1,'Jordan'),
(109,1,'Kazakhstan'),
(110,1,'Kenya'),
(111,1,'Kiribati'),
(253,1,'Kosovo, Republic of'),
(114,1,'Kuwait'),
(115,1,'Kyrgyzstan'),
(116,1,'Lao People\'s Democratic Republic (the)'),
(117,1,'Latvia'),
(118,1,'Lebanon'),
(119,1,'Lesotho'),
(120,1,'Liberia'),
(121,1,'Libya'),
(122,1,'Liechtenstein'),
(123,1,'Lithuania'),
(124,1,'Luxembourg'),
(125,1,'Macau'),
(127,1,'Madagascar'),
(128,1,'Malawi'),
(129,1,'Malaysia'),
(130,1,'Maldives'),
(131,1,'Mali'),
(132,1,'Malta'),
(133,1,'Marshall Islands'),
(134,1,'Martinique'),
(135,1,'Mauritania'),
(136,1,'Mauritius'),
(137,1,'Mayotte'),
(138,1,'Mexico'),
(139,1,'Micronesia, Federated States of'),
(140,1,'Moldova, Republic of'),
(141,1,'Monaco'),
(142,1,'Mongolia'),
(242,1,'Montenegro'),
(143,1,'Montserrat'),
(144,1,'Morocco'),
(145,1,'Mozambique'),
(146,1,'Myanmar'),
(147,1,'Namibia'),
(148,1,'Nauru'),
(149,1,'Nepal'),
(150,1,'Netherlands'),
(151,1,'Netherlands Antilles'),
(152,1,'New Caledonia'),
(153,1,'New Zealand'),
(154,1,'Nicaragua'),
(155,1,'Niger'),
(156,1,'Nigeria'),
(157,1,'Niue'),
(158,1,'Norfolk Island'),
(112,1,'North Korea'),
(126,1,'North Macedonia'),
(159,1,'Northern Mariana Islands'),
(160,1,'Norway'),
(247,1,'Occupied Palestinian Territory'),
(161,1,'Oman'),
(162,1,'Pakistan'),
(163,1,'Palau'),
(164,1,'Panama'),
(165,1,'Papua New Guinea'),
(166,1,'Paraguay'),
(167,1,'Peru'),
(168,1,'Philippines'),
(169,1,'Pitcairn'),
(170,1,'Poland'),
(171,1,'Portugal'),
(172,1,'Puerto Rico'),
(173,1,'Qatar'),
(215,1,'Republic of Türkiye'),
(174,1,'Reunion'),
(175,1,'Romania'),
(176,1,'Russian Federation (the)'),
(177,1,'Rwanda'),
(178,1,'Saint Kitts and Nevis'),
(179,1,'Saint Lucia'),
(180,1,'Saint Vincent and the Grenadines'),
(181,1,'Samoa'),
(182,1,'San Marino'),
(183,1,'Sao Tome and Principe'),
(184,1,'Saudi Arabia'),
(185,1,'Senegal'),
(243,1,'Serbia'),
(186,1,'Seychelles'),
(187,1,'Sierra Leone'),
(188,1,'Singapore'),
(189,1,'Slovak Republic'),
(190,1,'Slovenia'),
(191,1,'Solomon Islands'),
(192,1,'Somalia'),
(193,1,'South Africa'),
(194,1,'South Georgia & South Sandwich Islands'),
(113,1,'South Korea'),
(248,1,'South Sudan'),
(195,1,'Spain'),
(196,1,'Sri Lanka'),
(249,1,'St. Barthelemy'),
(197,1,'St. Helena'),
(250,1,'St. Martin (French part)'),
(198,1,'St. Pierre and Miquelon'),
(199,1,'Sudan'),
(200,1,'Suriname'),
(201,1,'Svalbard and Jan Mayen Islands'),
(203,1,'Sweden'),
(204,1,'Switzerland'),
(205,1,'Syrian Arab Republic'),
(206,1,'Taiwan'),
(207,1,'Tajikistan'),
(208,1,'Tanzania, United Republic of'),
(209,1,'Thailand'),
(16,1,'The Bahamas'),
(79,1,'The Gambia'),
(61,1,'Timor-Leste'),
(210,1,'Togo'),
(211,1,'Tokelau'),
(212,1,'Tonga'),
(213,1,'Trinidad and Tobago'),
(255,1,'Tristan da Cunha'),
(214,1,'Tunisia'),
(216,1,'Turkmenistan'),
(217,1,'Turks and Caicos Islands'),
(218,1,'Tuvalu'),
(219,1,'Uganda'),
(220,1,'Ukraine'),
(221,1,'United Arab Emirates'),
(222,1,'United Kingdom'),
(223,1,'United States'),
(224,1,'United States Minor Outlying Islands'),
(225,1,'Uruguay'),
(226,1,'Uzbekistan'),
(227,1,'Vanuatu'),
(228,1,'Vatican City State (Holy See)'),
(229,1,'Venezuela'),
(230,1,'Viet Nam'),
(231,1,'Virgin Islands (British)'),
(232,1,'Virgin Islands (U.S.)'),
(233,1,'Wallis and Futuna Islands'),
(234,1,'Western Sahara'),
(235,1,'Yemen'),
(238,1,'Zambia'),
(239,1,'Zimbabwe');

--
-- Table structure for table `oc_coupon`
--

DROP TABLE IF EXISTS `oc_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `discount` decimal(15,4) DEFAULT NULL,
  `logged` tinyint(1) DEFAULT 0,
  `shipping` tinyint(1) DEFAULT 0,
  `total` decimal(15,4) DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `uses_total` int(11) DEFAULT 0,
  `uses_customer` int(11) DEFAULT 0,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_coupon`
--

INSERT INTO `oc_coupon` VALUES
(1,'-10% Discount','2222','P',10.0000,0,0,0.0000,'2014-01-01','2020-01-01',10,10,0,'2009-01-27 13:55:03'),
(2,'Free Shipping','3333','P',0.0000,0,1,100.0000,'2014-01-01','2014-02-01',10,10,0,'2009-03-14 21:13:53'),
(3,'-10.00 Discount','1111','F',10.0000,0,0,10.0000,'2014-01-01','2020-01-01',100000,10000,0,'2009-03-14 21:15:18');

--
-- Table structure for table `oc_coupon_category`
--

DROP TABLE IF EXISTS `oc_coupon_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_coupon_category`
--


--
-- Table structure for table `oc_coupon_history`
--

DROP TABLE IF EXISTS `oc_coupon_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT 0,
  `customer_id` int(11) DEFAULT 0,
  `amount` decimal(15,4) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_coupon_history`
--


--
-- Table structure for table `oc_coupon_product`
--

DROP TABLE IF EXISTS `oc_coupon_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_coupon_product`
--


--
-- Table structure for table `oc_cron`
--

DROP TABLE IF EXISTS `oc_cron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_cron` (
  `cron_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(128) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `cycle` varchar(12) DEFAULT NULL,
  `action` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`cron_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_cron`
--

INSERT INTO `oc_cron` VALUES
(1,'currency','Updates currency conversion values.','day','cron/currency',1,'2014-09-25 14:40:00','2014-09-25 14:40:00'),
(2,'gdpr','Deletes and send emails to customers who have requested their GPDR data to be deleted.','day','cron/gdpr',1,'2014-09-25 14:40:00','2014-09-25 14:40:00'),
(3,'subscription','Processes subscriptions by creating new orders, charging customers and sending mails to customers telling them that their subscription has been processed.','day','cron/subscription',0,'2014-09-25 14:40:00','2014-09-25 14:40:00');

--
-- Table structure for table `oc_currency`
--

DROP TABLE IF EXISTS `oc_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL,
  `code` varchar(3) DEFAULT NULL,
  `symbol_left` varchar(12) DEFAULT NULL,
  `symbol_right` varchar(12) DEFAULT NULL,
  `decimal_place` int(1) DEFAULT 2,
  `value` double(15,8) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_currency`
--

INSERT INTO `oc_currency` VALUES
(1,'Pound Sterling','GBP','£','',2,0.74892907,1,'2026-07-24 11:17:28'),
(2,'US Dollar','USD','$','',2,1.00000000,1,'2026-07-24 11:17:28'),
(3,'Euro','EUR','','€',2,0.87780899,1,'2026-07-24 11:17:28'),
(4,'Hong Kong Dollar','HKD','HK$','',2,7.84129213,0,'2026-07-24 11:17:28'),
(5,'Indian Rupee','INR','₹','',2,96.58137289,0,'2026-07-24 11:17:28'),
(6,'Russian Ruble','RUB','','₽',2,56.40360000,0,'2018-02-16 12:00:00'),
(7,'Chinese Yuan Renminbi','CNY','¥','',2,6.77027739,0,'2026-07-24 11:17:28'),
(8,'Australian Dollar','AUD','$','',2,1.43003862,0,'2026-07-24 11:17:28');

--
-- Table structure for table `oc_custom_field`
--

DROP TABLE IF EXISTS `oc_custom_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `validation` varchar(255) DEFAULT NULL,
  `location` varchar(10) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_custom_field`
--

INSERT INTO `oc_custom_field` VALUES
(1,'select','','','account',0,1),
(2,'radio','','','account',0,2),
(3,'checkbox','','','account',0,3),
(4,'text','','','account',0,4),
(5,'textarea','','','account',0,5),
(6,'file','','','account',0,6),
(7,'date','','','account',0,7),
(8,'time','','','account',0,8),
(9,'datetime','','','account',0,9),
(11,'checkbox','','','address',0,3),
(12,'time','','','address',0,8),
(13,'date','','','address',0,7),
(14,'datetime','','','address',0,9),
(15,'file','','','address',0,6),
(16,'radio','','','address',0,2),
(17,'select','','','address',0,1),
(18,'text','','','address',0,4),
(19,'textarea','','','address',0,5),
(20,'checkbox','','','affiliate',0,3),
(21,'date','','','affiliate',0,8),
(22,'datetime','','','affiliate',0,9),
(23,'file','','','affiliate',0,6),
(24,'radio','','','affiliate',0,2),
(25,'select','','','affiliate',0,1),
(26,'text','','','affiliate',0,4),
(27,'textarea','','','affiliate',0,5),
(28,'time','','','affiliate',0,8);

--
-- Table structure for table `oc_custom_field_customer_group`
--

DROP TABLE IF EXISTS `oc_custom_field_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_custom_field_customer_group`
--

INSERT INTO `oc_custom_field_customer_group` VALUES
(1,1,1),
(2,1,1),
(3,1,1),
(4,1,1),
(5,1,1),
(6,1,1),
(7,1,1),
(8,1,1),
(9,1,1),
(11,1,1),
(12,1,1),
(13,1,1),
(14,1,1),
(15,1,1),
(16,1,1),
(17,1,1),
(18,1,1),
(19,1,1),
(20,1,1),
(21,1,1),
(22,1,1),
(23,1,1),
(24,1,1),
(25,1,1),
(26,1,1),
(27,1,1),
(28,1,1);

--
-- Table structure for table `oc_custom_field_description`
--

DROP TABLE IF EXISTS `oc_custom_field_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_custom_field_description`
--

INSERT INTO `oc_custom_field_description` VALUES
(1,1,'Select'),
(2,1,'Radio'),
(3,1,'Checkbox'),
(4,1,'Text'),
(5,1,'Textarea'),
(6,1,'File'),
(7,1,'Date'),
(8,1,'Time'),
(9,1,'Date &amp; Time'),
(11,1,'Checkbox'),
(12,1,'Time'),
(13,1,'Date'),
(14,1,'Date &amp; Time'),
(15,1,'File'),
(16,1,'Radio'),
(17,1,'Select'),
(18,1,'Text'),
(19,1,'Textarea'),
(20,1,'Checkbox'),
(21,1,'Date'),
(22,1,'Date &amp; Time'),
(23,1,'File'),
(24,1,'Radio'),
(25,1,'Select'),
(26,1,'Text'),
(27,1,'Textarea'),
(28,1,'Time');

--
-- Table structure for table `oc_custom_field_value`
--

DROP TABLE IF EXISTS `oc_custom_field_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) DEFAULT NULL,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_custom_field_value`
--

INSERT INTO `oc_custom_field_value` VALUES
(1,1,1),
(2,1,2),
(3,1,3),
(4,2,1),
(5,2,2),
(6,2,3),
(7,3,1),
(8,3,2),
(9,3,3),
(20,11,1),
(21,11,2),
(22,11,3),
(32,16,1),
(33,16,2),
(34,16,3),
(35,17,1),
(36,17,2),
(37,17,3),
(38,20,1),
(39,20,2),
(40,20,3),
(41,24,1),
(42,24,2),
(43,24,3),
(44,25,0),
(45,25,0),
(46,25,0);

--
-- Table structure for table `oc_custom_field_value_description`
--

DROP TABLE IF EXISTS `oc_custom_field_value_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_custom_field_value_description`
--

INSERT INTO `oc_custom_field_value_description` VALUES
(1,1,1,'Test 1'),
(2,1,1,'test 2'),
(3,1,1,'Test 3'),
(4,1,2,'Test 1'),
(5,1,2,'Test 2'),
(6,1,2,'Test 3'),
(7,1,3,'Test 1'),
(8,1,3,'Test 2'),
(9,1,3,'Test 3'),
(20,1,11,'Test 1'),
(21,1,11,'Test 2'),
(22,1,11,'Test 3'),
(32,1,16,'Test 1'),
(33,1,16,'Test 2'),
(34,1,16,'Test 3'),
(35,1,17,'Test 1'),
(36,1,17,'Test 2'),
(37,1,17,'Test 3'),
(38,1,20,'Test 1'),
(39,1,20,'Test 2'),
(40,1,20,'Test 3'),
(41,1,24,'Test 1'),
(42,1,24,'Test 2'),
(43,1,24,'Test 3'),
(44,1,25,'Test 1'),
(45,1,25,'Test 2'),
(46,1,25,'Test 3');

--
-- Table structure for table `oc_customer`
--

DROP TABLE IF EXISTS `oc_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) DEFAULT 0,
  `store_id` int(11) DEFAULT 0,
  `language_id` int(11) DEFAULT 0,
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `email` varchar(96) DEFAULT NULL,
  `telephone` varchar(32) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `custom_field` text DEFAULT NULL,
  `newsletter` tinyint(1) DEFAULT 0,
  `ip` varchar(40) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `safe` tinyint(1) DEFAULT 0,
  `commenter` tinyint(1) DEFAULT 0,
  `token` text DEFAULT NULL,
  `code` varchar(40) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer`
--

INSERT INTO `oc_customer` VALUES
(1,1,0,1,'John','Doe','customer@example.com','000 000 000','$2y$12$gaBZNj.zQ/txi0OqiSvRZeMjvY8vTrIVTGX4TRWjbitBmhSn6qVoe','[]',0,'172.18.0.1',1,0,0,NULL,NULL,'2026-07-24 11:18:11');

--
-- Table structure for table `oc_customer_activity`
--

DROP TABLE IF EXISTS `oc_customer_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_customer_activity` (
  `customer_activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `key` varchar(64) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `ip` varchar(40) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_activity`
--

INSERT INTO `oc_customer_activity` VALUES
(1,1,'register','{\"customer_id\":1,\"name\":\"John Doe\"}','172.18.0.1','2026-07-24 11:18:11');

--
-- Table structure for table `oc_customer_affiliate`
--

DROP TABLE IF EXISTS `oc_customer_affiliate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_customer_affiliate` (
  `customer_id` int(11) NOT NULL,
  `company` varchar(60) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `tracking` varchar(64) DEFAULT NULL,
  `balance` decimal(15,4) DEFAULT NULL,
  `commission` decimal(4,2) DEFAULT 0.00,
  `tax` varchar(64) DEFAULT NULL,
  `payment_method` varchar(6) DEFAULT NULL,
  `cheque` varchar(100) DEFAULT NULL,
  `paypal` varchar(64) DEFAULT NULL,
  `bank_name` varchar(64) DEFAULT NULL,
  `bank_branch_number` varchar(64) DEFAULT NULL,
  `bank_swift_code` varchar(64) DEFAULT NULL,
  `bank_account_name` varchar(64) DEFAULT NULL,
  `bank_account_number` varchar(64) DEFAULT NULL,
  `custom_field` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_affiliate`
--


--
-- Table structure for table `oc_customer_affiliate_report`
--

DROP TABLE IF EXISTS `oc_customer_affiliate_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_customer_affiliate_report` (
  `customer_affiliate_report_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT 0,
  `ip` varchar(40) DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_affiliate_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_affiliate_report`
--


--
-- Table structure for table `oc_customer_approval`
--

DROP TABLE IF EXISTS `oc_customer_approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_customer_approval` (
  `customer_approval_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `type` varchar(9) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_approval_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_approval`
--


--
-- Table structure for table `oc_customer_authorize`
--

DROP TABLE IF EXISTS `oc_customer_authorize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_customer_authorize` (
  `customer_authorize_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `token` varchar(96) DEFAULT NULL,
  `total` int(1) DEFAULT 0,
  `ip` varchar(40) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  `date_expire` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_authorize_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_authorize`
--


--
-- Table structure for table `oc_customer_group`
--

DROP TABLE IF EXISTS `oc_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) DEFAULT 0,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_group`
--

INSERT INTO `oc_customer_group` VALUES
(1,0,1),
(2,0,2),
(3,1,3);

--
-- Table structure for table `oc_customer_group_description`
--

DROP TABLE IF EXISTS `oc_customer_group_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_group_description`
--

INSERT INTO `oc_customer_group_description` VALUES
(1,1,'Default','Default customer group'),
(2,1,'Retail','Retail customers'),
(3,1,'Wholesale','Wholesale customers');

--
-- Table structure for table `oc_customer_history`
--

DROP TABLE IF EXISTS `oc_customer_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_history`
--


--
-- Table structure for table `oc_customer_ip`
--

DROP TABLE IF EXISTS `oc_customer_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT 0,
  `ip` varchar(40) DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_ip`
--

INSERT INTO `oc_customer_ip` VALUES
(1,1,0,'172.18.0.1','','2026-07-24 11:18:11');

--
-- Table structure for table `oc_customer_login`
--

DROP TABLE IF EXISTS `oc_customer_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) DEFAULT NULL,
  `ip` varchar(40) DEFAULT NULL,
  `total` int(4) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_login`
--


--
-- Table structure for table `oc_customer_online`
--

DROP TABLE IF EXISTS `oc_customer_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) DEFAULT 0,
  `url` text DEFAULT NULL,
  `referer` text DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_online`
--


--
-- Table structure for table `oc_customer_reward`
--

DROP TABLE IF EXISTS `oc_customer_reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT 0,
  `order_id` int(11) DEFAULT 0,
  `description` text DEFAULT NULL,
  `points` int(8) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_reward`
--


--
-- Table structure for table `oc_customer_search`
--

DROP TABLE IF EXISTS `oc_customer_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_customer_search` (
  `customer_search_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT 0,
  `language_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT 0,
  `keyword` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category` tinyint(1) DEFAULT NULL,
  `description` tinyint(1) DEFAULT NULL,
  `products` int(11) DEFAULT NULL,
  `ip` varchar(40) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_search_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_search`
--


--
-- Table structure for table `oc_customer_token`
--

DROP TABLE IF EXISTS `oc_customer_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_customer_token` (
  `customer_token_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `code` text DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_token`
--


--
-- Table structure for table `oc_customer_transaction`
--

DROP TABLE IF EXISTS `oc_customer_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT 0,
  `description` text DEFAULT NULL,
  `amount` decimal(15,4) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_transaction`
--


--
-- Table structure for table `oc_customer_wishlist`
--

DROP TABLE IF EXISTS `oc_customer_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `product_id` int(11) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_id`,`store_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_wishlist`
--


--
-- Table structure for table `oc_download`
--

DROP TABLE IF EXISTS `oc_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(160) DEFAULT NULL,
  `mask` varchar(128) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`download_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_download`
--


--
-- Table structure for table `oc_download_description`
--

DROP TABLE IF EXISTS `oc_download_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_download_description`
--


--
-- Table structure for table `oc_download_report`
--

DROP TABLE IF EXISTS `oc_download_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_download_report` (
  `download_report_id` int(11) NOT NULL AUTO_INCREMENT,
  `download_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT 0,
  `ip` varchar(40) DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`download_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_download_report`
--


--
-- Table structure for table `oc_event`
--

DROP TABLE IF EXISTS `oc_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(128) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `trigger` text DEFAULT NULL,
  `action` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `sort_order` int(3) DEFAULT 1,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_event`
--

INSERT INTO `oc_event` VALUES
(1,'activity_customer_add','Adds new customer entry in the activity log.','catalog/model/account/customer.addCustomer/after','event/activity.addCustomer',1,1),
(2,'activity_customer_edit','Adds edit customer entry in the activity log.','catalog/model/account/customer.editCustomer/after','event/activity.editCustomer',1,1),
(3,'activity_customer_password','Adds edit password entry in the activity log.','catalog/model/account/customer.editPassword/after','event/activity.editPassword',1,1),
(4,'activity_customer_forgotten','Adds forgotten password entry in the activity log.','catalog/model/account/customer.addToken/after','event/activity.forgotten',1,1),
(5,'activity_customer_login','Adds edit customer entry in the activity log.','catalog/model/account/customer.deleteLoginAttempts/after','event/activity.login',1,1),
(6,'activity_customer_transaction','Adds edit customer entry in the activity log.','catalog/model/account/customer.addTransaction/after','event/activity.addTransaction',1,1),
(7,'activity_address_add','Adds new address entry in the activity log.','catalog/model/account/address.addAddress/after','event/activity.addAddress',1,1),
(8,'activity_address_edit','Adds edit address entry in the activity log.','catalog/model/account/address.editAddress/after','event/activity.editAddress',1,1),
(9,'activity_address_delete','Adds delete address entry in the activity log.','catalog/model/account/address.deleteAddress/after','event/activity.deleteAddress',1,1),
(10,'activity_affiliate_add','Adds new affiliate entry in the activity log.','catalog/model/account/affiliate.addAffiliate/after','event/activity.addAffiliate',1,1),
(11,'activity_affiliate_edit','Adds edit affiliate entry in the activity log.','catalog/model/account/affiliate.editAffiliate/after','event/activity.editAffiliate',1,1),
(12,'activity_order_add','Adds new order entry in the activity log.','catalog/model/checkout/order.addHistory/before','event/activity.addHistory',1,1),
(13,'activity_return_add','Adds new return entry in the activity log.','catalog/model/account/returns.addReturn/after','event/activity.addReturn',1,1),
(14,'mail_customer_add','Sends mail to newly registered customers.','catalog/model/account/customer.addCustomer/after','mail/register',1,1),
(15,'mail_customer_alert','Sends alert mail to store owner when a new customer registers.','catalog/model/account/customer.addCustomer/after','mail/register.alert',1,1),
(16,'mail_customer_transaction','Sends mail to the customer when their transaction balance is updated.','catalog/model/account/customer.addTransaction/after','mail/transaction',1,1),
(17,'mail_customer_forgotten','Sends mail to customers who have forgotten their password.','catalog/model/account/customer.addToken/after','mail/forgotten',1,1),
(18,'mail_customer_authorize','Sends mail login code to customers email to authorize login from a new device.','catalog/controller/account/authorize.send/after','mail/authorize',1,1),
(19,'mail_customer_authorize_reset','Sends reset link to user who`s account is locked out after 3 wrong authorize code login attempts.','catalog/model/account/customer.addToken/after','mail/authorize.reset',1,1),
(20,'mail_affiliate_add','Sends mail to newly registered affiliates.','catalog/model/account/affiliate.addAffiliate/after','mail/affiliate',1,1),
(21,'mail_affiliate_alert','Sends mail to new customers.','catalog/model/account/affiliate.addAffiliate/after','mail/affiliate.alert',1,1),
(22,'mail_order','Sends mail to customer when they make an order.','catalog/model/checkout/order.addHistory/before','mail/order',1,1),
(23,'mail_order_alert','Sends alert mail to new store owner when a new order is made.','catalog/model/checkout/order.addHistory/before','mail/order.alert',1,1),
(24,'mail_gdpr','Sends mail to customers who have requested their data exported or deleted.','catalog/model/account/gdpr.addGdpr/after','mail/gdpr',1,1),
(25,'mail_gdpr_delete','Sends mail to customers to let them know their GDPR data has been deleted.','catalog/model/account/gdpr.editStatus/after','mail/gdpr.remove',1,1),
(26,'mail_review','Sends mail to store owner that a new review has been submitted.','catalog/model/catalog/review.addReview/after','mail/review',1,1),
(27,'mail_subscription','Sends mail to store owner that a new subscription has been created.','catalog/model/checkout/subscription.addSubscription/after','mail/subscription',1,1),
(28,'statistics_review_add','Updates review statistics when a new review is added.','catalog/model/catalog/review.addReview/after','event/statistics.addReview',1,1),
(29,'statistics_return_add','Updates return statistics when a new return is added.','catalog/model/account/returns.addReturn/after','event/statistics.addReturn',1,1),
(30,'statistics_return_delete','Updates return statistics when a return is deleted.','admin/model/sale/returns.deleteReturn/after','event/statistics.deleteReturn',1,1),
(31,'statistics_order_history','Updates order status statistics when a order has been updated.','catalog/model/checkout/order.addHistory/before','event/statistics.addHistory',1,1),
(32,'admin_currency_add','Updates currencies when a new currency is added.','admin/model/localisation/currency.addCurrency/after','event/currency',1,1),
(33,'admin_currency_edit','Updates currencies when a currency is edited.','admin/model/localisation/currency.editCurrency/after','event/currency',1,1),
(34,'admin_currency_setting','Updates currencies when settings are saved.','admin/model/setting/setting.editSetting/after','event/currency',1,1),
(35,'admin_mail_gdpr','Sends approval or denial mail to customer who requested GDPR data export or deletion.','admin/model/customer/gdpr.editStatus/after','mail/gdpr',1,1),
(36,'admin_mail_affiliate_approve','Sends mail to the affiliate when their account is approved.','admin/model/customer/customer_approval.approveAffiliate/after','mail/affiliate.approve',1,1),
(37,'admin_mail_affiliate_deny','Sends mail to the affiliate when their account is denied.','admin/model/customer/customer_approval.denyAffiliate/after','mail/affiliate.deny',1,1),
(38,'admin_mail_customer_approve','Sends mail to the customer when their account is approved.','admin/model/customer/customer_approval.approveCustomer/after','mail/customer.approve',1,1),
(39,'admin_mail_customer_deny','Sends mail to the customer when their account is denied.','admin/model/customer/customer_approval.denyCustomer/after','mail/customer.deny',1,1),
(40,'admin_mail_customer_transaction','Sends mail to the customer when their transaction balance is updated.','admin/model/customer/customer.addTransaction/after','mail/transaction',1,1),
(41,'admin_mail_reward','Sends mail to the customer when their reward balance is updated.','admin/model/customer/customer.addReward/after','mail/reward',1,1),
(42,'admin_mail_return','Sends mail to customer when their return status is changed.','admin/model/sale/returns.addHistory/after','mail/returns',1,1),
(43,'admin_mail_user_forgotten','Sends mail to users who have forgotten their password.','admin/model/user/user.addToken/after','mail/forgotten',1,1),
(44,'admin_mail_user_authorize','Sends mail login code to users email to authorize login from a new device.','admin/controller/common/authorize.send/after','mail/authorize',1,1),
(45,'admin_mail_user_authorize_reset','Sends reset link to user who`s account is locked out after 3 wrong authorize code login attempts.','admin/model/user/user.addToken/after','mail/authorize.reset',1,1);

--
-- Table structure for table `oc_extension`
--

DROP TABLE IF EXISTS `oc_extension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `extension` varchar(255) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `code` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_extension`
--

INSERT INTO `oc_extension` VALUES
(1,'opencart','currency','ecb'),
(2,'opencart','module','featured'),
(3,'opencart','module','banner'),
(4,'opencart','payment','cod'),
(5,'opencart','payment','free_checkout'),
(6,'opencart','module','category'),
(7,'opencart','module','account'),
(8,'opencart','module','topic'),
(9,'opencart','shipping','flat'),
(10,'opencart','theme','basic'),
(11,'opencart','total','credit'),
(12,'opencart','total','shipping'),
(13,'opencart','total','sub_total'),
(14,'opencart','total','tax'),
(15,'opencart','total','total'),
(16,'opencart','total','handling'),
(17,'opencart','total','low_order_fee'),
(18,'opencart','total','coupon'),
(19,'opencart','total','reward'),
(20,'opencart','dashboard','activity'),
(21,'opencart','dashboard','sale'),
(22,'opencart','dashboard','recent'),
(23,'opencart','dashboard','order'),
(24,'opencart','dashboard','online'),
(25,'opencart','dashboard','map'),
(26,'opencart','dashboard','customer'),
(27,'opencart','dashboard','chart'),
(28,'opencart','report','sale_coupon'),
(29,'opencart','report','customer_search'),
(30,'opencart','report','customer_transaction'),
(31,'opencart','report','product_purchased'),
(32,'opencart','report','product_viewed'),
(33,'opencart','report','sale_return'),
(34,'opencart','report','sale_order'),
(35,'opencart','report','sale_shipping'),
(36,'opencart','report','sale_tax'),
(37,'opencart','report','customer_activity'),
(38,'opencart','report','customer_order'),
(39,'opencart','report','customer_reward'),
(40,'opencart','report','marketing'),
(41,'opencart','report','subscription'),
(42,'opencart','report','customer');

--
-- Table structure for table `oc_extension_install`
--

DROP TABLE IF EXISTS `oc_extension_install`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_extension_install` (
  `extension_install_id` int(11) NOT NULL AUTO_INCREMENT,
  `extension_id` int(11) DEFAULT 0,
  `extension_download_id` int(11) DEFAULT 0,
  `name` varchar(128) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`extension_install_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_extension_install`
--

INSERT INTO `oc_extension_install` VALUES
(1,0,0,'OpenCart Default Extensions','This extension contains all the default extensions for modules, currencies, payment methods, shipping methods, anti-fraud, themes, order totals and reports.','opencart','2.1.1','OpenCart Ltd','http://www.opencart.com',1,'2026-08-17 17:27:39');

--
-- Table structure for table `oc_extension_path`
--

DROP TABLE IF EXISTS `oc_extension_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_extension_path` (
  `extension_path_id` int(11) NOT NULL AUTO_INCREMENT,
  `extension_install_id` int(11) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`extension_path_id`),
  KEY `path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=396 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_extension_path`
--

INSERT INTO `oc_extension_path` VALUES
(1,1,'opencart'),
(2,1,'opencart/admin'),
(3,1,'opencart/admin/controller'),
(4,1,'opencart/admin/controller/analytics'),
(5,1,'opencart/admin/controller/analytics/index.html'),
(6,1,'opencart/admin/controller/captcha'),
(7,1,'opencart/admin/controller/captcha/basic.php'),
(8,1,'opencart/admin/controller/currency'),
(9,1,'opencart/admin/controller/currency/ecb.php'),
(10,1,'opencart/admin/controller/currency/fixer.php'),
(11,1,'opencart/admin/controller/dashboard'),
(12,1,'opencart/admin/controller/dashboard/activity.php'),
(13,1,'opencart/admin/controller/dashboard/chart.php'),
(14,1,'opencart/admin/controller/dashboard/customer.php'),
(15,1,'opencart/admin/controller/dashboard/map.php'),
(16,1,'opencart/admin/controller/dashboard/online.php'),
(17,1,'opencart/admin/controller/dashboard/order.php'),
(18,1,'opencart/admin/controller/dashboard/recent.php'),
(19,1,'opencart/admin/controller/dashboard/sale.php'),
(20,1,'opencart/admin/controller/feed'),
(21,1,'opencart/admin/controller/feed/index.html'),
(22,1,'opencart/admin/controller/fraud'),
(23,1,'opencart/admin/controller/fraud/ip.php'),
(24,1,'opencart/admin/controller/module'),
(25,1,'opencart/admin/controller/module/account.php'),
(26,1,'opencart/admin/controller/module/banner.php'),
(27,1,'opencart/admin/controller/module/bestseller.php'),
(28,1,'opencart/admin/controller/module/category.php'),
(29,1,'opencart/admin/controller/module/featured.php'),
(30,1,'opencart/admin/controller/module/filter.php'),
(31,1,'opencart/admin/controller/module/html.php'),
(32,1,'opencart/admin/controller/module/information.php'),
(33,1,'opencart/admin/controller/module/latest.php'),
(34,1,'opencart/admin/controller/module/special.php'),
(35,1,'opencart/admin/controller/module/store.php'),
(36,1,'opencart/admin/controller/payment'),
(37,1,'opencart/admin/controller/payment/bank_transfer.php'),
(38,1,'opencart/admin/controller/payment/cheque.php'),
(39,1,'opencart/admin/controller/payment/cod.php'),
(40,1,'opencart/admin/controller/payment/free_checkout.php'),
(41,1,'opencart/admin/controller/report'),
(42,1,'opencart/admin/controller/report/customer.php'),
(43,1,'opencart/admin/controller/report/customer_activity.php'),
(44,1,'opencart/admin/controller/report/customer_order.php'),
(45,1,'opencart/admin/controller/report/customer_reward.php'),
(46,1,'opencart/admin/controller/report/customer_search.php'),
(47,1,'opencart/admin/controller/report/subscription.php'),
(48,1,'opencart/admin/controller/report/customer_transaction.php'),
(49,1,'opencart/admin/controller/report/marketing.php'),
(50,1,'opencart/admin/controller/report/product_purchased.php'),
(51,1,'opencart/admin/controller/report/product_viewed.php'),
(52,1,'opencart/admin/controller/report/sale_coupon.php'),
(53,1,'opencart/admin/controller/report/sale_order.php'),
(54,1,'opencart/admin/controller/report/sale_return.php'),
(55,1,'opencart/admin/controller/report/sale_shipping.php'),
(56,1,'opencart/admin/controller/report/sale_tax.php'),
(57,1,'opencart/admin/controller/shipping'),
(58,1,'opencart/admin/controller/shipping/flat.php'),
(59,1,'opencart/admin/controller/shipping/free.php'),
(60,1,'opencart/admin/controller/shipping/item.php'),
(61,1,'opencart/admin/controller/shipping/pickup.php'),
(62,1,'opencart/admin/controller/shipping/weight.php'),
(63,1,'opencart/admin/controller/theme'),
(64,1,'opencart/admin/controller/theme/basic.php'),
(65,1,'opencart/admin/controller/total'),
(66,1,'opencart/admin/controller/total/coupon.php'),
(67,1,'opencart/admin/controller/total/credit.php'),
(68,1,'opencart/admin/controller/total/handling.php'),
(69,1,'opencart/admin/controller/total/low_order_fee.php'),
(70,1,'opencart/admin/controller/total/reward.php'),
(71,1,'opencart/admin/controller/total/shipping.php'),
(72,1,'opencart/admin/controller/total/sub_total.php'),
(73,1,'opencart/admin/controller/total/tax.php'),
(74,1,'opencart/admin/controller/total/total.php'),
(75,1,'opencart/admin/language'),
(76,1,'opencart/admin/language/en-gb'),
(77,1,'opencart/admin/language/en-gb/captcha'),
(78,1,'opencart/admin/language/en-gb/captcha/basic.php'),
(79,1,'opencart/admin/language/en-gb/currency'),
(80,1,'opencart/admin/language/en-gb/currency/ecb.php'),
(81,1,'opencart/admin/language/en-gb/currency/fixer.php'),
(82,1,'opencart/admin/language/en-gb/dashboard'),
(83,1,'opencart/admin/language/en-gb/dashboard/activity.php'),
(84,1,'opencart/admin/language/en-gb/dashboard/chart.php'),
(85,1,'opencart/admin/language/en-gb/dashboard/customer.php'),
(86,1,'opencart/admin/language/en-gb/dashboard/map.php'),
(87,1,'opencart/admin/language/en-gb/dashboard/online.php'),
(88,1,'opencart/admin/language/en-gb/dashboard/order.php'),
(89,1,'opencart/admin/language/en-gb/dashboard/recent.php'),
(90,1,'opencart/admin/language/en-gb/dashboard/sale.php'),
(91,1,'opencart/admin/language/en-gb/fraud'),
(92,1,'opencart/admin/language/en-gb/fraud/ip.php'),
(93,1,'opencart/admin/language/en-gb/module'),
(94,1,'opencart/admin/language/en-gb/module/account.php'),
(95,1,'opencart/admin/language/en-gb/module/banner.php'),
(96,1,'opencart/admin/language/en-gb/module/bestseller.php'),
(97,1,'opencart/admin/language/en-gb/module/category.php'),
(98,1,'opencart/admin/language/en-gb/module/featured.php'),
(99,1,'opencart/admin/language/en-gb/module/filter.php'),
(100,1,'opencart/admin/language/en-gb/module/html.php'),
(101,1,'opencart/admin/language/en-gb/module/information.php'),
(102,1,'opencart/admin/language/en-gb/module/latest.php'),
(103,1,'opencart/admin/language/en-gb/module/special.php'),
(104,1,'opencart/admin/language/en-gb/module/store.php'),
(105,1,'opencart/admin/language/en-gb/payment'),
(106,1,'opencart/admin/language/en-gb/payment/bank_transfer.php'),
(107,1,'opencart/admin/language/en-gb/payment/cheque.php'),
(108,1,'opencart/admin/language/en-gb/payment/cod.php'),
(109,1,'opencart/admin/language/en-gb/payment/free_checkout.php'),
(110,1,'opencart/admin/language/en-gb/report'),
(111,1,'opencart/admin/language/en-gb/report/customer.php'),
(112,1,'opencart/admin/language/en-gb/report/customer_activity.php'),
(113,1,'opencart/admin/language/en-gb/report/customer_order.php'),
(114,1,'opencart/admin/language/en-gb/report/customer_reward.php'),
(115,1,'opencart/admin/language/en-gb/report/customer_search.php'),
(116,1,'opencart/admin/language/en-gb/report/subscription.php'),
(117,1,'opencart/admin/language/en-gb/report/customer_transaction.php'),
(118,1,'opencart/admin/language/en-gb/report/marketing.php'),
(119,1,'opencart/admin/language/en-gb/report/product_purchased.php'),
(120,1,'opencart/admin/language/en-gb/report/product_viewed.php'),
(121,1,'opencart/admin/language/en-gb/report/sale_coupon.php'),
(122,1,'opencart/admin/language/en-gb/report/sale_order.php'),
(123,1,'opencart/admin/language/en-gb/report/sale_return.php'),
(124,1,'opencart/admin/language/en-gb/report/sale_shipping.php'),
(125,1,'opencart/admin/language/en-gb/report/sale_tax.php'),
(126,1,'opencart/admin/language/en-gb/shipping'),
(127,1,'opencart/admin/language/en-gb/shipping/flat.php'),
(128,1,'opencart/admin/language/en-gb/shipping/free.php'),
(129,1,'opencart/admin/language/en-gb/shipping/item.php'),
(130,1,'opencart/admin/language/en-gb/shipping/pickup.php'),
(131,1,'opencart/admin/language/en-gb/shipping/weight.php'),
(132,1,'opencart/admin/language/en-gb/theme'),
(133,1,'opencart/admin/language/en-gb/theme/basic.php'),
(134,1,'opencart/admin/language/en-gb/total'),
(135,1,'opencart/admin/language/en-gb/total/coupon.php'),
(136,1,'opencart/admin/language/en-gb/total/credit.php'),
(137,1,'opencart/admin/language/en-gb/total/handling.php'),
(138,1,'opencart/admin/language/en-gb/total/low_order_fee.php'),
(139,1,'opencart/admin/language/en-gb/total/reward.php'),
(140,1,'opencart/admin/language/en-gb/total/shipping.php'),
(141,1,'opencart/admin/language/en-gb/total/sub_total.php'),
(142,1,'opencart/admin/language/en-gb/total/tax.php'),
(143,1,'opencart/admin/language/en-gb/total/total.php'),
(144,1,'opencart/admin/model'),
(145,1,'opencart/admin/model/dashboard'),
(146,1,'opencart/admin/model/dashboard/map.php'),
(147,1,'opencart/admin/model/fraud'),
(148,1,'opencart/admin/model/fraud/ip.php'),
(149,1,'opencart/admin/model/module'),
(150,1,'opencart/admin/model/module/bestseller.php'),
(151,1,'opencart/admin/model/report'),
(152,1,'opencart/admin/model/report/activity.php'),
(153,1,'opencart/admin/model/report/coupon.php'),
(154,1,'opencart/admin/model/report/customer.php'),
(155,1,'opencart/admin/model/report/subscription.php'),
(156,1,'opencart/admin/model/report/customer_transaction.php'),
(157,1,'opencart/admin/model/report/marketing.php'),
(158,1,'opencart/admin/model/report/product_purchased.php'),
(159,1,'opencart/admin/model/report/product_viewed.php'),
(160,1,'opencart/admin/model/report/returns.php'),
(161,1,'opencart/admin/model/report/sale.php'),
(162,1,'opencart/admin/view'),
(163,1,'opencart/admin/view/image'),
(164,1,'opencart/admin/view/image/basic.png'),
(165,1,'opencart/admin/view/template'),
(166,1,'opencart/admin/view/template/captcha'),
(167,1,'opencart/admin/view/template/captcha/basic.twig'),
(168,1,'opencart/admin/view/template/currency'),
(169,1,'opencart/admin/view/template/currency/ecb.twig'),
(170,1,'opencart/admin/view/template/currency/fixer.twig'),
(171,1,'opencart/admin/view/template/dashboard'),
(172,1,'opencart/admin/view/template/dashboard/activity_form.twig'),
(173,1,'opencart/admin/view/template/dashboard/activity_info.twig'),
(174,1,'opencart/admin/view/template/dashboard/chart_form.twig'),
(175,1,'opencart/admin/view/template/dashboard/chart_info.twig'),
(176,1,'opencart/admin/view/template/dashboard/customer_form.twig'),
(177,1,'opencart/admin/view/template/dashboard/customer_info.twig'),
(178,1,'opencart/admin/view/template/dashboard/map_form.twig'),
(179,1,'opencart/admin/view/template/dashboard/map_info.twig'),
(180,1,'opencart/admin/view/template/dashboard/online_form.twig'),
(181,1,'opencart/admin/view/template/dashboard/online_info.twig'),
(182,1,'opencart/admin/view/template/dashboard/order_form.twig'),
(183,1,'opencart/admin/view/template/dashboard/order_info.twig'),
(184,1,'opencart/admin/view/template/dashboard/recent_form.twig'),
(185,1,'opencart/admin/view/template/dashboard/recent_info.twig'),
(186,1,'opencart/admin/view/template/dashboard/sale_form.twig'),
(187,1,'opencart/admin/view/template/dashboard/sale_info.twig'),
(188,1,'opencart/admin/view/template/fraud'),
(189,1,'opencart/admin/view/template/fraud/ip.twig'),
(190,1,'opencart/admin/view/template/fraud/ip_ip.twig'),
(191,1,'opencart/admin/view/template/module'),
(192,1,'opencart/admin/view/template/module/account.twig'),
(193,1,'opencart/admin/view/template/module/banner.twig'),
(194,1,'opencart/admin/view/template/module/bestseller.twig'),
(195,1,'opencart/admin/view/template/module/bestseller_report.twig'),
(196,1,'opencart/admin/view/template/module/category.twig'),
(197,1,'opencart/admin/view/template/module/featured.twig'),
(198,1,'opencart/admin/view/template/module/filter.twig'),
(199,1,'opencart/admin/view/template/module/html.twig'),
(200,1,'opencart/admin/view/template/module/information.twig'),
(201,1,'opencart/admin/view/template/module/latest.twig'),
(202,1,'opencart/admin/view/template/module/special.twig'),
(203,1,'opencart/admin/view/template/module/store.twig'),
(204,1,'opencart/admin/view/template/payment'),
(205,1,'opencart/admin/view/template/payment/bank_transfer.twig'),
(206,1,'opencart/admin/view/template/payment/cheque.twig'),
(207,1,'opencart/admin/view/template/payment/cod.twig'),
(208,1,'opencart/admin/view/template/payment/free_checkout.twig'),
(209,1,'opencart/admin/view/template/payment/order.twig'),
(210,1,'opencart/admin/view/template/report'),
(211,1,'opencart/admin/view/template/report/affiliate.twig'),
(212,1,'opencart/admin/view/template/report/affiliate_form.twig'),
(213,1,'opencart/admin/view/template/report/customer.twig'),
(214,1,'opencart/admin/view/template/report/customer_activity.twig'),
(215,1,'opencart/admin/view/template/report/customer_activity_form.twig'),
(216,1,'opencart/admin/view/template/report/customer_activity_list.twig'),
(217,1,'opencart/admin/view/template/report/customer_form.twig'),
(218,1,'opencart/admin/view/template/report/customer_list.twig'),
(219,1,'opencart/admin/view/template/report/customer_order.twig'),
(220,1,'opencart/admin/view/template/report/customer_order_form.twig'),
(221,1,'opencart/admin/view/template/report/customer_order_list.twig'),
(222,1,'opencart/admin/view/template/report/customer_reward.twig'),
(223,1,'opencart/admin/view/template/report/customer_reward_form.twig'),
(224,1,'opencart/admin/view/template/report/customer_reward_list.twig'),
(225,1,'opencart/admin/view/template/report/customer_search.twig'),
(226,1,'opencart/admin/view/template/report/customer_search_form.twig'),
(227,1,'opencart/admin/view/template/report/customer_search_list.twig'),
(228,1,'opencart/admin/view/template/report/subscription.twig'),
(229,1,'opencart/admin/view/template/report/subscription_form.twig'),
(230,1,'opencart/admin/view/template/report/subscription_list.twig'),
(231,1,'opencart/admin/view/template/report/customer_transaction.twig'),
(232,1,'opencart/admin/view/template/report/customer_transaction_form.twig'),
(233,1,'opencart/admin/view/template/report/customer_transaction_list.twig'),
(234,1,'opencart/admin/view/template/report/marketing.twig'),
(235,1,'opencart/admin/view/template/report/marketing_form.twig'),
(236,1,'opencart/admin/view/template/report/marketing_list.twig'),
(237,1,'opencart/admin/view/template/report/product_purchased.twig'),
(238,1,'opencart/admin/view/template/report/product_purchased_form.twig'),
(239,1,'opencart/admin/view/template/report/product_purchased_list.twig'),
(240,1,'opencart/admin/view/template/report/product_viewed.twig'),
(241,1,'opencart/admin/view/template/report/product_viewed_form.twig'),
(242,1,'opencart/admin/view/template/report/product_viewed_list.twig'),
(243,1,'opencart/admin/view/template/report/sale_coupon.twig'),
(244,1,'opencart/admin/view/template/report/sale_coupon_form.twig'),
(245,1,'opencart/admin/view/template/report/sale_coupon_list.twig'),
(246,1,'opencart/admin/view/template/report/sale_order.twig'),
(247,1,'opencart/admin/view/template/report/sale_order_form.twig'),
(248,1,'opencart/admin/view/template/report/sale_order_list.twig'),
(249,1,'opencart/admin/view/template/report/sale_return.twig'),
(250,1,'opencart/admin/view/template/report/sale_return_form.twig'),
(251,1,'opencart/admin/view/template/report/sale_return_list.twig'),
(252,1,'opencart/admin/view/template/report/sale_shipping.twig'),
(253,1,'opencart/admin/view/template/report/sale_shipping_form.twig'),
(254,1,'opencart/admin/view/template/report/sale_shipping_list.twig'),
(255,1,'opencart/admin/view/template/report/sale_tax.twig'),
(256,1,'opencart/admin/view/template/report/sale_tax_form.twig'),
(257,1,'opencart/admin/view/template/report/sale_tax_list.twig'),
(258,1,'opencart/admin/view/template/shipping'),
(259,1,'opencart/admin/view/template/shipping/flat.twig'),
(260,1,'opencart/admin/view/template/shipping/free.twig'),
(261,1,'opencart/admin/view/template/shipping/item.twig'),
(262,1,'opencart/admin/view/template/shipping/pickup.twig'),
(263,1,'opencart/admin/view/template/shipping/weight.twig'),
(264,1,'opencart/admin/view/template/theme'),
(265,1,'opencart/admin/view/template/theme/basic.twig'),
(266,1,'opencart/admin/view/template/total'),
(267,1,'opencart/admin/view/template/total/coupon.twig'),
(268,1,'opencart/admin/view/template/total/credit.twig'),
(269,1,'opencart/admin/view/template/total/handling.twig'),
(270,1,'opencart/admin/view/template/total/low_order_fee.twig'),
(271,1,'opencart/admin/view/template/total/reward.twig'),
(272,1,'opencart/admin/view/template/total/shipping.twig'),
(273,1,'opencart/admin/view/template/total/sub_total.twig'),
(274,1,'opencart/admin/view/template/total/tax.twig'),
(275,1,'opencart/admin/view/template/total/total.twig'),
(276,1,'opencart/catalog'),
(277,1,'opencart/catalog/controller'),
(278,1,'opencart/catalog/controller/captcha'),
(279,1,'opencart/catalog/controller/captcha/basic.php'),
(280,1,'opencart/catalog/controller/currency'),
(281,1,'opencart/catalog/controller/currency/ecb.php'),
(282,1,'opencart/catalog/controller/currency/fixer.php'),
(283,1,'opencart/catalog/controller/module'),
(284,1,'opencart/catalog/controller/module/account.php'),
(285,1,'opencart/catalog/controller/module/banner.php'),
(286,1,'opencart/catalog/controller/module/bestseller.php'),
(287,1,'opencart/catalog/controller/module/category.php'),
(288,1,'opencart/catalog/controller/module/featured.php'),
(289,1,'opencart/catalog/controller/module/filter.php'),
(290,1,'opencart/catalog/controller/module/html.php'),
(291,1,'opencart/catalog/controller/module/information.php'),
(292,1,'opencart/catalog/controller/module/latest.php'),
(293,1,'opencart/catalog/controller/module/special.php'),
(294,1,'opencart/catalog/controller/module/store.php'),
(295,1,'opencart/catalog/controller/payment'),
(296,1,'opencart/catalog/controller/payment/bank_transfer.php'),
(297,1,'opencart/catalog/controller/payment/cheque.php'),
(298,1,'opencart/catalog/controller/payment/cod.php'),
(299,1,'opencart/catalog/controller/payment/free_checkout.php'),
(300,1,'opencart/catalog/controller/total'),
(301,1,'opencart/catalog/controller/total/coupon.php'),
(302,1,'opencart/catalog/controller/total/reward.php'),
(303,1,'opencart/catalog/controller/total/shipping.php'),
(304,1,'opencart/catalog/language'),
(305,1,'opencart/catalog/language/de-de'),
(306,1,'opencart/catalog/language/de-de/module'),
(307,1,'opencart/catalog/language/de-de/module/featured.php'),
(308,1,'opencart/catalog/language/de-de/payment'),
(309,1,'opencart/catalog/language/de-de/payment/cod.php'),
(310,1,'opencart/catalog/language/en-gb'),
(311,1,'opencart/catalog/language/en-gb/captcha'),
(312,1,'opencart/catalog/language/en-gb/captcha/basic.php'),
(313,1,'opencart/catalog/language/en-gb/module'),
(314,1,'opencart/catalog/language/en-gb/module/account.php'),
(315,1,'opencart/catalog/language/en-gb/module/bestseller.php'),
(316,1,'opencart/catalog/language/en-gb/module/category.php'),
(317,1,'opencart/catalog/language/en-gb/module/featured.php'),
(318,1,'opencart/catalog/language/en-gb/module/filter.php'),
(319,1,'opencart/catalog/language/en-gb/module/information.php'),
(320,1,'opencart/catalog/language/en-gb/module/latest.php'),
(321,1,'opencart/catalog/language/en-gb/module/special.php'),
(322,1,'opencart/catalog/language/en-gb/module/store.php'),
(323,1,'opencart/catalog/language/en-gb/payment'),
(324,1,'opencart/catalog/language/en-gb/payment/bank_transfer.php'),
(325,1,'opencart/catalog/language/en-gb/payment/cheque.php'),
(326,1,'opencart/catalog/language/en-gb/payment/cod.php'),
(327,1,'opencart/catalog/language/en-gb/payment/free_checkout.php'),
(328,1,'opencart/catalog/language/en-gb/shipping'),
(329,1,'opencart/catalog/language/en-gb/shipping/flat.php'),
(330,1,'opencart/catalog/language/en-gb/shipping/free.php'),
(331,1,'opencart/catalog/language/en-gb/shipping/item.php'),
(332,1,'opencart/catalog/language/en-gb/shipping/pickup.php'),
(333,1,'opencart/catalog/language/en-gb/shipping/weight.php'),
(334,1,'opencart/catalog/language/en-gb/total'),
(335,1,'opencart/catalog/language/en-gb/total/coupon.php'),
(336,1,'opencart/catalog/language/en-gb/total/credit.php'),
(337,1,'opencart/catalog/language/en-gb/total/handling.php'),
(338,1,'opencart/catalog/language/en-gb/total/low_order_fee.php'),
(339,1,'opencart/catalog/language/en-gb/total/reward.php'),
(340,1,'opencart/catalog/language/en-gb/total/shipping.php'),
(341,1,'opencart/catalog/language/en-gb/total/sub_total.php'),
(342,1,'opencart/catalog/language/en-gb/total/total.php'),
(343,1,'opencart/catalog/model'),
(344,1,'opencart/catalog/model/fraud'),
(345,1,'opencart/catalog/model/fraud/ip.php'),
(346,1,'opencart/catalog/model/module'),
(347,1,'opencart/catalog/model/module/bestseller.php'),
(348,1,'opencart/catalog/model/module/latest.php'),
(349,1,'opencart/catalog/model/payment'),
(350,1,'opencart/catalog/model/payment/bank_transfer.php'),
(351,1,'opencart/catalog/model/payment/cheque.php'),
(352,1,'opencart/catalog/model/payment/cod.php'),
(353,1,'opencart/catalog/model/payment/free_checkout.php'),
(354,1,'opencart/catalog/model/shipping'),
(355,1,'opencart/catalog/model/shipping/flat.php'),
(356,1,'opencart/catalog/model/shipping/free.php'),
(357,1,'opencart/catalog/model/shipping/item.php'),
(358,1,'opencart/catalog/model/shipping/pickup.php'),
(359,1,'opencart/catalog/model/shipping/weight.php'),
(360,1,'opencart/catalog/model/total'),
(361,1,'opencart/catalog/model/total/coupon.php'),
(362,1,'opencart/catalog/model/total/credit.php'),
(363,1,'opencart/catalog/model/total/handling.php'),
(364,1,'opencart/catalog/model/total/low_order_fee.php'),
(365,1,'opencart/catalog/model/total/reward.php'),
(366,1,'opencart/catalog/model/total/shipping.php'),
(367,1,'opencart/catalog/model/total/sub_total.php'),
(368,1,'opencart/catalog/model/total/tax.php'),
(369,1,'opencart/catalog/model/total/total.php'),
(370,1,'opencart/catalog/view'),
(371,1,'opencart/catalog/view/template'),
(372,1,'opencart/catalog/view/template/captcha'),
(373,1,'opencart/catalog/view/template/captcha/basic.twig'),
(374,1,'opencart/catalog/view/template/module'),
(375,1,'opencart/catalog/view/template/module/account.twig'),
(376,1,'opencart/catalog/view/template/module/banner.twig'),
(377,1,'opencart/catalog/view/template/module/bestseller.twig'),
(378,1,'opencart/catalog/view/template/module/category.twig'),
(379,1,'opencart/catalog/view/template/module/featured.twig'),
(380,1,'opencart/catalog/view/template/module/filter.twig'),
(381,1,'opencart/catalog/view/template/module/html.twig'),
(382,1,'opencart/catalog/view/template/module/information.twig'),
(383,1,'opencart/catalog/view/template/module/latest.twig'),
(384,1,'opencart/catalog/view/template/module/special.twig'),
(385,1,'opencart/catalog/view/template/module/store.twig'),
(386,1,'opencart/catalog/view/template/payment'),
(387,1,'opencart/catalog/view/template/payment/bank_transfer.twig'),
(388,1,'opencart/catalog/view/template/payment/cheque.twig'),
(389,1,'opencart/catalog/view/template/payment/cod.twig'),
(390,1,'opencart/catalog/view/template/payment/free_checkout.twig'),
(391,1,'opencart/catalog/view/template/total'),
(392,1,'opencart/catalog/view/template/total/coupon.twig'),
(393,1,'opencart/catalog/view/template/total/reward.twig'),
(394,1,'opencart/catalog/view/template/total/shipping.twig'),
(395,1,'opencart/install.json');

--
-- Table structure for table `oc_filter`
--

DROP TABLE IF EXISTS `oc_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) DEFAULT NULL,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filter`
--


--
-- Table structure for table `oc_filter_description`
--

DROP TABLE IF EXISTS `oc_filter_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filter_description`
--


--
-- Table structure for table `oc_filter_group`
--

DROP TABLE IF EXISTS `oc_filter_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filter_group`
--


--
-- Table structure for table `oc_filter_group_description`
--

DROP TABLE IF EXISTS `oc_filter_group_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filter_group_description`
--


--
-- Table structure for table `oc_gdpr`
--

DROP TABLE IF EXISTS `oc_gdpr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_gdpr` (
  `gdpr_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT 0,
  `language_id` int(11) DEFAULT NULL,
  `code` varchar(40) DEFAULT NULL,
  `email` varchar(96) DEFAULT NULL,
  `action` varchar(6) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`gdpr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_gdpr`
--


--
-- Table structure for table `oc_geo_zone`
--

DROP TABLE IF EXISTS `oc_geo_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_geo_zone`
--

INSERT INTO `oc_geo_zone` VALUES
(3,'UK VAT Zone','UK VAT'),
(4,'UK Shipping','UK Shipping Zones');

--
-- Table structure for table `oc_identifier`
--

DROP TABLE IF EXISTS `oc_identifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_identifier` (
  `identifier_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `code` varchar(48) DEFAULT NULL,
  `validation` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`identifier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_identifier`
--

INSERT INTO `oc_identifier` VALUES
(1,'Stock Keeping Unit','SKU',NULL,1),
(2,'Universal Product Code','UPC',NULL,1),
(3,'European Article Number','EAN',NULL,1),
(4,'Japanese Article Number','JAN',NULL,1),
(5,'International Standard Book Number','ISBN',NULL,1),
(6,'Manufacturer Part Number','MPN',NULL,1);

--
-- Table structure for table `oc_information`
--

DROP TABLE IF EXISTS `oc_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) DEFAULT 0,
  `status` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`information_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_information`
--

INSERT INTO `oc_information` VALUES
(1,3,1),
(2,1,1),
(3,4,1),
(4,2,1);

--
-- Table structure for table `oc_information_description`
--

DROP TABLE IF EXISTS `oc_information_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_information_description`
--

INSERT INTO `oc_information_description` VALUES
(1,1,'About Us','&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n','About Us','',''),
(2,1,'Terms &amp; Conditions','&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n','Terms &amp; Conditions','',''),
(3,1,'Privacy Policy','&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n','Privacy Policy','',''),
(4,1,'Delivery Information','&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n','Delivery Information','','');

--
-- Table structure for table `oc_information_to_layout`
--

DROP TABLE IF EXISTS `oc_information_to_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `layout_id` int(11) DEFAULT 0,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_information_to_layout`
--


--
-- Table structure for table `oc_information_to_store`
--

DROP TABLE IF EXISTS `oc_information_to_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_information_to_store`
--

INSERT INTO `oc_information_to_store` VALUES
(1,0),
(2,0),
(3,0),
(4,0);

--
-- Table structure for table `oc_language`
--

DROP TABLE IF EXISTS `oc_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `code` varchar(5) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `sort_order` int(3) DEFAULT 0,
  `status` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_language`
--

INSERT INTO `oc_language` VALUES
(1,'English','en-gb','en-gb,en',NULL,1,1);

--
-- Table structure for table `oc_layout`
--

DROP TABLE IF EXISTS `oc_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_layout`
--

INSERT INTO `oc_layout` VALUES
(1,'Home'),
(2,'Product'),
(3,'Category'),
(4,'Default'),
(5,'Manufacturer'),
(6,'Account'),
(7,'Checkout'),
(8,'Contact'),
(9,'Sitemap'),
(10,'Affiliate'),
(11,'Information'),
(12,'Compare'),
(13,'Search'),
(14,'Blog');

--
-- Table structure for table `oc_layout_module`
--

DROP TABLE IF EXISTS `oc_layout_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) DEFAULT 0,
  `code` varchar(64) DEFAULT NULL,
  `position` varchar(14) DEFAULT NULL,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`layout_module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_layout_module`
--

INSERT INTO `oc_layout_module` VALUES
(1,10,'opencart.account','column_right',1),
(2,6,'opencart.account','column_right',1),
(3,1,'opencart.featured.2','content_top',2),
(4,3,'opencart.banner.1','column_left',2),
(5,1,'opencart.banner.3','content_top',1),
(6,1,'opencart.banner.4','content_bottom',1),
(7,3,'opencart.category','column_left',1),
(8,14,'opencart.topic','column_left',1);

--
-- Table structure for table `oc_layout_route`
--

DROP TABLE IF EXISTS `oc_layout_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT 0,
  `route` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_layout_route`
--

INSERT INTO `oc_layout_route` VALUES
(1,6,0,'account/%'),
(2,6,0,'information/gdpr'),
(3,10,0,'affiliate/%'),
(4,3,0,'product/category'),
(5,1,0,'common/home'),
(6,2,0,'product/product'),
(7,11,0,'information/information'),
(8,7,0,'checkout/%'),
(9,8,0,'information/contact'),
(10,9,0,'information/sitemap'),
(11,4,0,''),
(12,5,0,'product/manufacturer'),
(13,12,0,'product/compare'),
(14,13,0,'product/search'),
(15,14,0,'cms/blog'),
(16,14,0,'cms/blog.info');

--
-- Table structure for table `oc_length_class`
--

DROP TABLE IF EXISTS `oc_length_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) DEFAULT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_length_class`
--

INSERT INTO `oc_length_class` VALUES
(1,1.00000000),
(2,10.00000000),
(3,0.39370000);

--
-- Table structure for table `oc_length_class_description`
--

DROP TABLE IF EXISTS `oc_length_class_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) DEFAULT NULL,
  `unit` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_length_class_description`
--

INSERT INTO `oc_length_class_description` VALUES
(1,1,'Centimeter','cm'),
(2,1,'Millimeter','mm'),
(3,1,'Inch','in');

--
-- Table structure for table `oc_location`
--

DROP TABLE IF EXISTS `oc_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `telephone` varchar(32) DEFAULT NULL,
  `geocode` varchar(32) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_location`
--


--
-- Table structure for table `oc_manufacturer`
--

DROP TABLE IF EXISTS `oc_manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_manufacturer`
--

INSERT INTO `oc_manufacturer` VALUES
(5,'HTC','catalog/demo/htc_logo.jpg',0),
(6,'Palm','catalog/demo/palm_logo.jpg',0),
(7,'Hewlett-Packard','catalog/demo/hp_logo.jpg',0),
(8,'Apple','catalog/demo/apple_logo.jpg',0),
(9,'Canon','catalog/demo/canon_logo.jpg',0),
(10,'Sony','catalog/demo/sony_logo.jpg',0);

--
-- Table structure for table `oc_manufacturer_to_layout`
--

DROP TABLE IF EXISTS `oc_manufacturer_to_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_manufacturer_to_layout` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `layout_id` int(11) DEFAULT 0,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_manufacturer_to_layout`
--


--
-- Table structure for table `oc_manufacturer_to_store`
--

DROP TABLE IF EXISTS `oc_manufacturer_to_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_manufacturer_to_store`
--

INSERT INTO `oc_manufacturer_to_store` VALUES
(5,0),
(6,0),
(7,0),
(8,0),
(9,0),
(10,0);

--
-- Table structure for table `oc_marketing`
--

DROP TABLE IF EXISTS `oc_marketing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `clicks` int(5) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`marketing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_marketing`
--


--
-- Table structure for table `oc_marketing_report`
--

DROP TABLE IF EXISTS `oc_marketing_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_marketing_report` (
  `marketing_report_id` int(11) NOT NULL AUTO_INCREMENT,
  `marketing_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT 0,
  `ip` varchar(40) DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`marketing_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_marketing_report`
--


--
-- Table structure for table `oc_modification`
--

DROP TABLE IF EXISTS `oc_modification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_modification` (
  `modification_id` int(11) NOT NULL AUTO_INCREMENT,
  `extension_install_id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL,
  `version` varchar(32) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `xml` mediumtext DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`modification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_modification`
--


--
-- Table structure for table `oc_module`
--

DROP TABLE IF EXISTS `oc_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `setting` text DEFAULT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_module`
--

INSERT INTO `oc_module` VALUES
(1,'Category Banner','opencart.banner','{\"name\":\"Category Banner\",\"banner_id\":\"6\",\"effect\":\"fade\",\"items\":\"1\",\"controls\":\"0\",\"indicators\":\"0\",\"interval\":\"5000\",\"width\":\"200\",\"height\":\"180\",\"status\":\"1\"}'),
(2,'Featured','opencart.featured','{\"name\":\"Featured\",\"product_name\":\"\",\"product\":[\"43\",\"40\",\"42\",\"30\"],\"axis\":\"horizontal\",\"limit\":\"4\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}'),
(3,'Homepage Slideshow','opencart.banner','{\"name\":\"Homepage Slideshow\",\"banner_id\":\"7\",\"effect\":\"slide\",\"items\":\"1\",\"controls\":\"1\",\"indicators\":\"1\",\"interval\":\"5000\",\"width\":\"1140\",\"height\":\"380\",\"status\":\"1\"}'),
(4,'Homepage Manufacturers','opencart.banner','{\"name\":\"Homepage Manufacturers\",\"banner_id\":\"8\",\"effect\":\"slide\",\"items\":\"5\",\"controls\":\"1\",\"indicators\":\"1\",\"interval\":\"5000\",\"width\":\"130\",\"height\":\"100\",\"status\":\"1\"}');

--
-- Table structure for table `oc_notification`
--

DROP TABLE IF EXISTS `oc_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_notification` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `status` tinyint(11) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notification`
--


--
-- Table structure for table `oc_option`
--

DROP TABLE IF EXISTS `oc_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) DEFAULT NULL,
  `validation` varchar(255) DEFAULT NULL,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_option`
--

INSERT INTO `oc_option` VALUES
(1,'radio',NULL,1),
(2,'checkbox',NULL,2),
(4,'text',NULL,3),
(5,'select',NULL,4),
(6,'textarea',NULL,5),
(7,'file',NULL,6),
(8,'date',NULL,7),
(9,'time',NULL,8),
(10,'datetime',NULL,9),
(11,'select',NULL,10),
(12,'date',NULL,11);

--
-- Table structure for table `oc_option_description`
--

DROP TABLE IF EXISTS `oc_option_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_option_description`
--

INSERT INTO `oc_option_description` VALUES
(1,1,'Radio'),
(2,1,'Checkbox'),
(4,1,'Text'),
(5,1,'Select'),
(6,1,'Textarea'),
(7,1,'File'),
(8,1,'Date'),
(9,1,'Time'),
(10,1,'Date &amp; Time'),
(11,1,'Size'),
(12,1,'Delivery Date');

--
-- Table structure for table `oc_option_value`
--

DROP TABLE IF EXISTS `oc_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`option_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_option_value`
--

INSERT INTO `oc_option_value` VALUES
(23,2,'',1),
(24,2,'',2),
(31,1,'',2),
(32,1,'',1),
(39,5,'',1),
(40,5,'',2),
(41,5,'',3),
(42,5,'',4),
(43,1,'',3),
(44,2,'',3),
(45,2,'',4),
(46,11,'',1),
(47,11,'',2),
(48,11,'',3);

--
-- Table structure for table `oc_option_value_description`
--

DROP TABLE IF EXISTS `oc_option_value_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`),
  KEY `option_id` (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_option_value_description`
--

INSERT INTO `oc_option_value_description` VALUES
(23,1,2,'Checkbox 1'),
(24,1,2,'Checkbox 2'),
(31,1,1,'Medium'),
(32,1,1,'Small'),
(39,1,5,'Red'),
(40,1,5,'Blue'),
(41,1,5,'Green'),
(42,1,5,'Yellow'),
(43,1,1,'Large'),
(44,1,2,'Checkbox 3'),
(45,1,2,'Checkbox 4'),
(46,1,11,'Small'),
(47,1,11,'Medium'),
(48,1,11,'Large');

--
-- Table structure for table `oc_order`
--

DROP TABLE IF EXISTS `oc_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_id` int(11) DEFAULT 0,
  `invoice_no` int(11) DEFAULT 0,
  `invoice_prefix` varchar(26) DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `store_id` int(11) DEFAULT 0,
  `store_name` varchar(64) DEFAULT NULL,
  `store_url` varchar(255) DEFAULT NULL,
  `customer_id` int(11) DEFAULT 0,
  `customer_group_id` int(11) DEFAULT 0,
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `email` varchar(96) DEFAULT NULL,
  `telephone` varchar(32) DEFAULT NULL,
  `custom_field` text DEFAULT NULL,
  `payment_address_id` int(11) DEFAULT 0,
  `payment_firstname` varchar(32) DEFAULT NULL,
  `payment_lastname` varchar(32) DEFAULT NULL,
  `payment_company` varchar(60) DEFAULT NULL,
  `payment_address_1` varchar(128) DEFAULT NULL,
  `payment_address_2` varchar(128) DEFAULT NULL,
  `payment_city` varchar(128) DEFAULT NULL,
  `payment_postcode` varchar(10) DEFAULT NULL,
  `payment_country` varchar(128) DEFAULT NULL,
  `payment_country_id` int(11) DEFAULT 0,
  `payment_zone` varchar(128) DEFAULT NULL,
  `payment_zone_id` int(11) DEFAULT 0,
  `payment_address_format` text DEFAULT NULL,
  `payment_custom_field` text DEFAULT NULL,
  `payment_method` text DEFAULT NULL,
  `shipping_address_id` int(11) DEFAULT NULL,
  `shipping_firstname` varchar(32) DEFAULT NULL,
  `shipping_lastname` varchar(32) DEFAULT NULL,
  `shipping_company` varchar(60) DEFAULT NULL,
  `shipping_address_1` varchar(128) DEFAULT NULL,
  `shipping_address_2` varchar(128) DEFAULT NULL,
  `shipping_city` varchar(128) DEFAULT NULL,
  `shipping_postcode` varchar(10) DEFAULT NULL,
  `shipping_country` varchar(128) DEFAULT NULL,
  `shipping_country_id` int(11) DEFAULT 0,
  `shipping_zone` varchar(128) DEFAULT NULL,
  `shipping_zone_id` int(11) DEFAULT 0,
  `shipping_address_format` text DEFAULT NULL,
  `shipping_custom_field` text DEFAULT NULL,
  `shipping_method` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `total` decimal(15,4) DEFAULT 0.0000,
  `order_status_id` int(11) DEFAULT 0,
  `affiliate_id` int(11) DEFAULT 0,
  `commission` decimal(15,4) DEFAULT NULL,
  `marketing_id` int(11) DEFAULT 0,
  `tracking` varchar(64) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `language_code` varchar(5) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `currency_code` varchar(3) DEFAULT NULL,
  `currency_value` decimal(15,8) DEFAULT 1.00000000,
  `ip` varchar(40) DEFAULT NULL,
  `forwarded_ip` varchar(40) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `accept_language` varchar(255) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `email` (`email`),
  KEY `order_status_id` (`order_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_order`
--


--
-- Table structure for table `oc_order_history`
--

DROP TABLE IF EXISTS `oc_order_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `order_status_id` int(11) DEFAULT 0,
  `notify` tinyint(1) DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`order_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_order_history`
--


--
-- Table structure for table `oc_order_option`
--

DROP TABLE IF EXISTS `oc_order_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `order_product_id` int(11) DEFAULT NULL,
  `product_option_id` int(11) DEFAULT NULL,
  `product_option_value_id` int(11) DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_order_option`
--


--
-- Table structure for table `oc_order_product`
--

DROP TABLE IF EXISTS `oc_order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `master_id` int(11) DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `model` varchar(64) DEFAULT NULL,
  `quantity` int(4) DEFAULT 1,
  `price` decimal(15,4) DEFAULT 0.0000,
  `total` decimal(15,4) DEFAULT 0.0000,
  `tax` decimal(15,4) DEFAULT 0.0000,
  `reward` int(8) DEFAULT 0,
  PRIMARY KEY (`order_product_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_order_product`
--


--
-- Table structure for table `oc_order_status`
--

DROP TABLE IF EXISTS `oc_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_order_status`
--

INSERT INTO `oc_order_status` VALUES
(1,1,'Pending'),
(2,1,'Processing'),
(3,1,'Shipped'),
(5,1,'Complete'),
(7,1,'Canceled'),
(8,1,'Denied'),
(9,1,'Canceled Reversal'),
(10,1,'Failed'),
(11,1,'Refunded'),
(12,1,'Reversed'),
(13,1,'Chargeback'),
(14,1,'Expired'),
(15,1,'Processed'),
(16,1,'Voided');

--
-- Table structure for table `oc_order_subscription`
--

DROP TABLE IF EXISTS `oc_order_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_order_subscription` (
  `order_subscription_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_product_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(4) DEFAULT 1,
  `subscription_plan_id` int(11) DEFAULT NULL,
  `trial_price` decimal(10,4) DEFAULT NULL,
  `trial_tax` decimal(15,4) DEFAULT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') DEFAULT NULL,
  `trial_cycle` smallint(6) DEFAULT NULL,
  `trial_duration` smallint(6) DEFAULT NULL,
  `trial_status` tinyint(1) DEFAULT 0,
  `price` decimal(10,4) DEFAULT NULL,
  `tax` decimal(15,4) DEFAULT NULL,
  `frequency` enum('day','week','semi_month','month','year') DEFAULT NULL,
  `cycle` smallint(6) DEFAULT 1,
  `duration` smallint(6) DEFAULT 0,
  PRIMARY KEY (`order_subscription_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_order_subscription`
--


--
-- Table structure for table `oc_order_total`
--

DROP TABLE IF EXISTS `oc_order_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `value` decimal(15,4) DEFAULT 0.0000,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`order_total_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_order_total`
--


--
-- Table structure for table `oc_product`
--

DROP TABLE IF EXISTS `oc_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `master_id` int(11) DEFAULT 0,
  `model` varchar(64) DEFAULT NULL,
  `location` varchar(128) DEFAULT NULL,
  `variant` text DEFAULT '',
  `override` text DEFAULT '',
  `quantity` int(4) DEFAULT 0,
  `stock_status_id` int(11) DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT 0,
  `shipping` tinyint(1) DEFAULT 1,
  `price` decimal(15,4) DEFAULT 0.0000,
  `points` int(8) DEFAULT 0,
  `tax_class_id` int(11) DEFAULT 0,
  `date_available` date DEFAULT NULL,
  `weight` decimal(15,8) DEFAULT 0.00000000,
  `weight_class_id` int(11) DEFAULT 0,
  `length` decimal(15,8) DEFAULT 0.00000000,
  `width` decimal(15,8) DEFAULT 0.00000000,
  `height` decimal(15,8) DEFAULT 0.00000000,
  `length_class_id` int(11) DEFAULT 0,
  `subtract` tinyint(1) DEFAULT 1,
  `minimum` int(11) DEFAULT 1,
  `rating` int(1) DEFAULT 0,
  `sort_order` int(11) DEFAULT 0,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product`
--

INSERT INTO `oc_product` VALUES
(28,0,'Product 1','','','',939,7,'catalog/demo/htc_touch_hd_1.jpg',5,1,100.0000,200,9,'2009-02-03',146.40000000,2,0.00000000,0.00000000,0.00000000,1,1,1,0,0,1,'2009-02-03 16:06:50','2011-09-30 01:05:39'),
(29,0,'Product 2','','','',999,6,'catalog/demo/palm_treo_pro_1.jpg',6,1,279.9900,0,9,'2009-02-03',133.00000000,2,0.00000000,0.00000000,0.00000000,3,1,1,0,0,1,'2009-02-03 16:42:17','2011-09-30 01:06:08'),
(30,0,'Product 3','','','',7,6,'catalog/demo/canon_eos_5d_1.jpg',9,1,100.0000,0,9,'2009-02-03',0.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,0,0,1,'2009-02-03 16:59:00','2011-09-30 01:05:23'),
(31,0,'Product 4','','','',1000,6,'catalog/demo/nikon_d300_1.jpg',0,1,80.0000,0,9,'2009-02-03',0.00000000,1,0.00000000,0.00000000,0.00000000,3,1,1,0,0,1,'2009-02-03 17:00:10','2011-09-30 01:06:00'),
(32,0,'Product 5','','','',999,6,'catalog/demo/ipod_touch_1.jpg',8,1,100.0000,0,9,'2009-02-03',5.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,0,0,1,'2009-02-03 17:07:26','2011-09-30 01:07:22'),
(33,0,'Product 6','','','',1000,6,'catalog/demo/samsung_syncmaster_941bw.jpg',0,1,200.0000,0,9,'2009-02-03',5.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,0,1,'2009-02-03 17:08:31','2011-09-30 01:06:29'),
(34,0,'Product 7','','','',1000,6,'catalog/demo/ipod_shuffle_1.jpg',8,1,100.0000,0,9,'2009-02-03',5.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,0,1,'2009-02-03 18:07:54','2011-09-30 01:07:17'),
(35,0,'Product 8','','','',1000,5,'',0,0,100.0000,0,9,'2009-02-03',5.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,0,0,1,'2009-02-03 18:08:31','2011-09-30 01:06:17'),
(36,0,'Product 9','','','',994,6,'catalog/demo/ipod_nano_1.jpg',8,0,100.0000,100,9,'2009-02-03',5.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,0,1,'2009-02-03 18:09:19','2011-09-30 01:07:12'),
(40,0,'product 11','','','',970,5,'catalog/demo/iphone_1.jpg',8,1,101.0000,0,9,'2009-02-03',10.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,0,0,1,'2009-02-03 21:07:12','2011-09-30 01:06:53'),
(41,0,'Product 14','','','',977,5,'catalog/demo/imac_1.jpg',8,1,100.0000,0,9,'2009-02-03',5.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,0,0,1,'2009-02-03 21:07:26','2011-09-30 01:06:44'),
(42,0,'Product 15','','','',990,5,'catalog/demo/apple_cinema_30.jpg',8,1,100.0000,400,9,'2009-02-04',12.50000000,1,1.00000000,2.00000000,3.00000000,1,1,2,0,0,1,'2009-02-03 21:07:37','2011-09-30 00:46:19'),
(43,0,'Product 16','','','',929,5,'catalog/demo/macbook_1.jpg',8,0,500.0000,0,9,'2009-02-03',0.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,0,1,'2009-02-03 21:07:49','2011-09-30 01:05:46'),
(44,0,'Product 17','','','',1000,5,'catalog/demo/macbook_air_1.jpg',8,1,1000.0000,0,9,'2009-02-03',0.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,0,1,'2009-02-03 21:08:00','2011-09-30 01:05:53'),
(45,0,'Product 18','','','',998,5,'catalog/demo/macbook_pro_1.jpg',8,1,2000.0000,0,100,'2009-02-03',0.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,0,1,'2009-02-03 21:08:17','2011-09-15 22:22:01'),
(46,0,'Product 19','','','',1000,5,'catalog/demo/sony_vaio_1.jpg',10,1,1000.0000,0,9,'2009-02-03',0.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,0,1,'2009-02-03 21:08:29','2011-09-30 01:06:39'),
(47,0,'Product 21','','','',1000,5,'catalog/demo/hp_1.jpg',7,1,100.0000,400,9,'2009-02-03',1.00000000,1,0.00000000,0.00000000,0.00000000,1,0,1,0,0,1,'2009-02-03 21:08:40','2011-09-30 01:05:28'),
(48,0,'product 20','test 2','','',995,5,'catalog/demo/ipod_classic_1.jpg',8,1,100.0000,0,9,'2009-02-08',1.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,0,1,'2009-02-08 17:21:51','2011-09-30 01:07:06'),
(49,0,'SAM1','','','',0,8,'catalog/demo/samsung_tab_1.jpg',0,1,199.9900,0,9,'2011-04-25',0.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,0,1,1,'2011-04-26 08:57:34','2011-09-30 01:06:23');

--
-- Table structure for table `oc_product_attribute`
--

DROP TABLE IF EXISTS `oc_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text DEFAULT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_attribute`
--

INSERT INTO `oc_product_attribute` VALUES
(42,3,1,'100mhz'),
(43,2,1,'1'),
(43,4,1,'8gb'),
(47,2,1,'4'),
(47,4,1,'16GB');

--
-- Table structure for table `oc_product_code`
--

DROP TABLE IF EXISTS `oc_product_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_product_code` (
  `product_code_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `code` varchar(48) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_code_id`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_code`
--


--
-- Table structure for table `oc_product_description`
--

DROP TABLE IF EXISTS `oc_product_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `tag` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_description`
--

INSERT INTO `oc_product_description` VALUES
(28,1,'HTC Touch HD','&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&amp;quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm&amp;reg; MSM 7201A&amp;trade; 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO&amp;trade; 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth&amp;reg; 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi&amp;reg;: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB&amp;trade; (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD&amp;trade; memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n','','	 HTC Touch HD','',''),
(29,1,'Palm Treo Pro','&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n','','Palm Treo Pro','',''),
(30,1,'Canon EOS 5D','&lt;p&gt;\r\n	Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably \'chunkier\'). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR\'s, an important difference when compared to the latter is that the EOS 5D doesn\'t have any environmental seals. While Canon don\'t specifically refer to the EOS 5D as a \'professional\' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they\'ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n','','Canon EOS 5D','',''),
(31,1,'Nikon D300','&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon&amp;#39;s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Similar to the D3, the D300 features Nikon&amp;#39;s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera&amp;#39;s new features. The D300 features a new 51-point autofocus system with Nikon&amp;#39;s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera&amp;#39;s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon&amp;#39;s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;','','Nikon D300','',''),
(32,1,'iPod Touch','&lt;p&gt;\r\n	&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br /&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br /&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br /&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n','','iPod Touch','',''),
(33,1,'Samsung SyncMaster 941BW','&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n','','Samsung SyncMaster 941BW','',''),
(34,1,'iPod Shuffle','&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n','','iPod Shuffle','',''),
(35,1,'Product 8','&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n','','Product 8','',''),
(36,1,'iPod Nano','&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n','','iPod Nano','',''),
(40,1,'iPhone','&lt;p class=&quot;intro&quot;&gt;\r\n	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n','','iPhone','',''),
(41,1,'iMac','&lt;div&gt;\r\n	Just when you thought iMac had everything, now there&acute;s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife &acute;08, and it&acute;s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n','','iMac','',''),
(42,1,'Apple Cinema 30&quot;','&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there\'s no limit to what you can achieve. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it\'s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple\'s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170° horizontal; 170° vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50° to 95° F (10° to 35° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40° to 116° F (-40° to 47° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO \'03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n','','Apple Cinema 30','',''),
(43,1,'MacBook','&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n','','MacBook','',''),
(44,1,'MacBook Air','&lt;div&gt;\r\n	MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don&amp;rsquo;t lose inches and pounds overnight. It&amp;rsquo;s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n','','MacBook Air','',''),
(45,1,'MacBook Pro','&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;','','MacBook Pro','',''),
(46,1,'Sony VAIO','&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n','','Sony VAIO','',''),
(47,1,'HP LP3065','&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n','','HP LP3065','',''),
(48,1,'iPod Classic','&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;','','iPod Classic','',''),
(49,1,'Samsung Galaxy Tab 10.1','&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n','','Samsung Galaxy Tab 10.1','','');

--
-- Table structure for table `oc_product_discount`
--

DROP TABLE IF EXISTS `oc_product_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `quantity` int(4) DEFAULT 0,
  `priority` int(5) DEFAULT 1,
  `price` decimal(15,4) DEFAULT 0.0000,
  `type` char(1) DEFAULT 'P',
  `special` tinyint(1) DEFAULT 0,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=441 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_discount`
--

INSERT INTO `oc_product_discount` VALUES
(438,42,1,10,1,88.0000,'P',0,'0000-00-00','0000-00-00'),
(439,42,1,20,1,77.0000,'P',0,'0000-00-00','0000-00-00'),
(440,42,1,30,1,66.0000,'P',0,'0000-00-00','0000-00-00');

--
-- Table structure for table `oc_product_filter`
--

DROP TABLE IF EXISTS `oc_product_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_filter`
--


--
-- Table structure for table `oc_product_image`
--

DROP TABLE IF EXISTS `oc_product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`product_image_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2352 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_image`
--

INSERT INTO `oc_product_image` VALUES
(1968,43,'catalog/demo/macbook_3.jpg',0),
(1969,43,'catalog/demo/macbook_2.jpg',0),
(1970,43,'catalog/demo/macbook_4.jpg',0),
(1971,43,'catalog/demo/macbook_5.jpg',0),
(1972,44,'catalog/demo/macbook_air_3.jpg',0),
(1973,44,'catalog/demo/macbook_air_2.jpg',0),
(1974,44,'catalog/demo/macbook_air_4.jpg',0),
(1975,45,'catalog/demo/macbook_pro_4.jpg',0),
(1976,45,'catalog/demo/macbook_pro_3.jpg',0),
(1977,45,'catalog/demo/macbook_pro_2.jpg',0),
(1978,40,'catalog/demo/iphone_4.jpg',0),
(1979,40,'catalog/demo/iphone_3.jpg',0),
(1980,40,'catalog/demo/iphone_5.jpg',0),
(1981,40,'catalog/demo/iphone_2.jpg',0),
(1982,40,'catalog/demo/iphone_6.jpg',0),
(1983,31,'catalog/demo/nikon_d300_5.jpg',0),
(1984,31,'catalog/demo/nikon_d300_4.jpg',0),
(1985,31,'catalog/demo/nikon_d300_2.jpg',0),
(1986,31,'catalog/demo/nikon_d300_3.jpg',0),
(1987,29,'catalog/demo/palm_treo_pro_2.jpg',0),
(1988,29,'catalog/demo/palm_treo_pro_3.jpg',0),
(1989,48,'catalog/demo/ipod_classic_2.jpg',0),
(1990,48,'catalog/demo/ipod_classic_3.jpg',0),
(1991,48,'catalog/demo/ipod_classic_4.jpg',0),
(1992,46,'catalog/demo/sony_vaio_3.jpg',0),
(1993,46,'catalog/demo/sony_vaio_2.jpg',0),
(1994,46,'catalog/demo/sony_vaio_4.jpg',0),
(1995,46,'catalog/demo/sony_vaio_5.jpg',0),
(1998,36,'catalog/demo/ipod_nano_3.jpg',0),
(1999,36,'catalog/demo/ipod_nano_2.jpg',0),
(2000,36,'catalog/demo/ipod_nano_4.jpg',0),
(2001,36,'catalog/demo/ipod_nano_5.jpg',0),
(2002,34,'catalog/demo/ipod_shuffle_3.jpg',0),
(2003,34,'catalog/demo/ipod_shuffle_2.jpg',0),
(2004,34,'catalog/demo/ipod_shuffle_4.jpg',0),
(2005,34,'catalog/demo/ipod_shuffle_5.jpg',0),
(2006,32,'catalog/demo/ipod_touch_4.jpg',0),
(2007,32,'catalog/demo/ipod_touch_3.jpg',0),
(2008,32,'catalog/demo/ipod_touch_2.jpg',0),
(2009,32,'catalog/demo/ipod_touch_5.jpg',0),
(2010,32,'catalog/demo/ipod_touch_6.jpg',0),
(2011,32,'catalog/demo/ipod_touch_7.jpg',0),
(2034,28,'catalog/demo/htc_touch_hd_3.jpg',0),
(2035,28,'catalog/demo/htc_touch_hd_2.jpg',0),
(2313,42,'catalog/demo/canon_eos_5d_2.jpg',0),
(2314,42,'catalog/demo/canon_eos_5d_1.jpg',0),
(2315,42,'catalog/demo/compaq_presario.jpg',0),
(2316,42,'catalog/demo/hp_1.jpg',0),
(2317,42,'catalog/demo/canon_logo.jpg',0),
(2320,47,'catalog/demo/hp_2.jpg',0),
(2321,47,'catalog/demo/hp_3.jpg',0),
(2322,49,'catalog/demo/samsung_tab_2.jpg',0),
(2323,49,'catalog/demo/samsung_tab_3.jpg',0),
(2324,49,'catalog/demo/samsung_tab_4.jpg',0),
(2325,49,'catalog/demo/samsung_tab_5.jpg',0),
(2326,49,'catalog/demo/samsung_tab_6.jpg',0),
(2327,49,'catalog/demo/samsung_tab_7.jpg',0),
(2344,30,'catalog/demo/canon_eos_5d_3.jpg',0),
(2345,30,'catalog/demo/canon_eos_5d_2.jpg',0),
(2350,41,'catalog/demo/imac_2.jpg',0),
(2351,41,'catalog/demo/imac_3.jpg',0);

--
-- Table structure for table `oc_product_option`
--

DROP TABLE IF EXISTS `oc_product_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `required` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`product_option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_option`
--

INSERT INTO `oc_product_option` VALUES
(208,42,4,'test',1),
(209,42,6,'',1),
(217,42,5,'',1),
(218,42,1,'',1),
(219,42,8,'2011-02-20',1),
(220,42,10,'2011-02-20 22:25',1),
(221,42,9,'22:25',1),
(222,42,7,'',1),
(223,42,2,'',1),
(224,35,11,'',1),
(225,47,12,'2011-04-22',1),
(226,30,5,'',1);

--
-- Table structure for table `oc_product_option_value`
--

DROP TABLE IF EXISTS `oc_product_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `option_value_id` int(11) DEFAULT 0,
  `quantity` int(3) DEFAULT 0,
  `subtract` tinyint(1) DEFAULT 0,
  `price` decimal(15,4) DEFAULT NULL,
  `price_prefix` varchar(1) DEFAULT NULL,
  `points` int(8) DEFAULT 0,
  `points_prefix` varchar(1) DEFAULT NULL,
  `weight` decimal(15,8) DEFAULT NULL,
  `weight_prefix` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_option_value`
--

INSERT INTO `oc_product_option_value` VALUES
(1,217,42,5,41,100,0,1.0000,'+',0,'+',1.00000000,'+'),
(2,217,42,5,42,200,1,2.0000,'+',0,'+',2.00000000,'+'),
(3,217,42,5,40,300,0,3.0000,'+',0,'+',3.00000000,'+'),
(4,217,42,5,39,92,1,4.0000,'+',0,'+',4.00000000,'+'),
(5,218,42,1,32,96,1,10.0000,'+',1,'+',10.00000000,'+'),
(6,218,42,1,31,146,1,20.0000,'+',2,'-',20.00000000,'+'),
(7,218,42,1,43,300,1,30.0000,'+',3,'+',30.00000000,'+'),
(8,223,42,2,23,48,1,10.0000,'+',0,'+',10.00000000,'+'),
(9,223,42,2,24,194,1,20.0000,'+',0,'+',20.00000000,'+'),
(10,223,42,2,44,2696,1,30.0000,'+',0,'+',30.00000000,'+'),
(11,223,42,2,45,3998,1,40.0000,'+',0,'+',40.00000000,'+'),
(12,224,35,11,46,0,1,5.0000,'+',0,'+',0.00000000,'+'),
(13,224,35,11,47,10,1,10.0000,'+',0,'+',0.00000000,'+'),
(14,224,35,11,48,15,1,15.0000,'+',0,'+',0.00000000,'+'),
(15,226,30,5,39,2,1,0.0000,'+',0,'+',0.00000000,'+'),
(16,226,30,5,40,5,1,0.0000,'+',0,'+',0.00000000,'+');

--
-- Table structure for table `oc_product_related`
--

DROP TABLE IF EXISTS `oc_product_related`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_related`
--

INSERT INTO `oc_product_related` VALUES
(40,42),
(41,42),
(42,40),
(42,41);

--
-- Table structure for table `oc_product_report`
--

DROP TABLE IF EXISTS `oc_product_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_product_report` (
  `product_report_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT 0,
  `ip` varchar(40) DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`product_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_report`
--


--
-- Table structure for table `oc_product_reward`
--

DROP TABLE IF EXISTS `oc_product_reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT 0,
  `customer_group_id` int(11) DEFAULT 0,
  `points` int(8) DEFAULT 0,
  PRIMARY KEY (`product_reward_id`)
) ENGINE=InnoDB AUTO_INCREMENT=546 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_reward`
--

INSERT INTO `oc_product_reward` VALUES
(329,43,1,600),
(331,44,1,700),
(333,45,1,800),
(335,40,1,0),
(337,31,1,0),
(339,29,1,0),
(343,48,1,0),
(345,33,1,0),
(347,46,1,0),
(351,36,1,0),
(353,34,1,0),
(355,32,1,0),
(379,28,1,400),
(425,35,1,0),
(515,42,1,100),
(519,47,1,300),
(521,49,1,1000),
(539,30,1,200),
(545,41,1,0);

--
-- Table structure for table `oc_product_subscription`
--

DROP TABLE IF EXISTS `oc_product_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_product_subscription` (
  `product_id` int(11) NOT NULL,
  `subscription_plan_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `trial_price` decimal(10,4) DEFAULT NULL,
  `price` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`subscription_plan_id`,`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_subscription`
--


--
-- Table structure for table `oc_product_to_category`
--

DROP TABLE IF EXISTS `oc_product_to_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_to_category`
--

INSERT INTO `oc_product_to_category` VALUES
(43,18),
(44,18),
(45,18),
(46,18),
(47,18),
(28,20),
(29,20),
(30,20),
(33,20),
(35,20),
(40,20),
(42,20),
(43,20),
(44,20),
(46,20),
(47,20),
(48,20),
(28,24),
(29,24),
(40,24),
(41,27),
(33,28),
(42,28),
(30,33),
(31,33),
(32,34),
(34,34),
(36,34),
(48,34),
(49,57);

--
-- Table structure for table `oc_product_to_download`
--

DROP TABLE IF EXISTS `oc_product_to_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_to_download`
--


--
-- Table structure for table `oc_product_to_layout`
--

DROP TABLE IF EXISTS `oc_product_to_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `layout_id` int(11) DEFAULT 0,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_to_layout`
--


--
-- Table structure for table `oc_product_to_store`
--

DROP TABLE IF EXISTS `oc_product_to_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_to_store`
--

INSERT INTO `oc_product_to_store` VALUES
(28,0),
(29,0),
(30,0),
(31,0),
(32,0),
(33,0),
(34,0),
(35,0),
(36,0),
(40,0),
(41,0),
(42,0),
(43,0),
(44,0),
(45,0),
(46,0),
(47,0),
(48,0),
(49,0);

--
-- Table structure for table `oc_product_viewed`
--

DROP TABLE IF EXISTS `oc_product_viewed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_product_viewed` (
  `product_id` int(11) NOT NULL,
  `viewed` int(11) DEFAULT 0,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_viewed`
--


--
-- Table structure for table `oc_return`
--

DROP TABLE IF EXISTS `oc_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT 0,
  `customer_id` int(11) DEFAULT 0,
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `email` varchar(96) DEFAULT NULL,
  `telephone` varchar(32) DEFAULT NULL,
  `product_id` int(11) DEFAULT 0,
  `product` varchar(255) DEFAULT NULL,
  `model` varchar(64) DEFAULT NULL,
  `quantity` int(4) DEFAULT 0,
  `opened` tinyint(1) DEFAULT 0,
  `return_reason_id` int(11) DEFAULT 0,
  `return_action_id` int(11) DEFAULT 0,
  `return_status_id` int(11) DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_ordered` date DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_return`
--


--
-- Table structure for table `oc_return_action`
--

DROP TABLE IF EXISTS `oc_return_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_return_action`
--

INSERT INTO `oc_return_action` VALUES
(1,1,'Waiting for return'),
(2,1,'Credit Issued'),
(3,1,'Replacement Sent'),
(4,1,'Refunded');

--
-- Table structure for table `oc_return_history`
--

DROP TABLE IF EXISTS `oc_return_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) DEFAULT NULL,
  `return_status_id` int(11) DEFAULT 0,
  `notify` tinyint(1) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_return_history`
--


--
-- Table structure for table `oc_return_reason`
--

DROP TABLE IF EXISTS `oc_return_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_return_reason`
--

INSERT INTO `oc_return_reason` VALUES
(1,1,'Dead On Arrival'),
(2,1,'Received Wrong Item'),
(3,1,'Order Error'),
(4,1,'Faulty, please supply details'),
(5,1,'Other, please supply details');

--
-- Table structure for table `oc_return_status`
--

DROP TABLE IF EXISTS `oc_return_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_return_status`
--

INSERT INTO `oc_return_status` VALUES
(1,1,'Pending'),
(2,1,'Awaiting Products'),
(3,1,'Complete');

--
-- Table structure for table `oc_review`
--

DROP TABLE IF EXISTS `oc_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT 0,
  `customer_id` int(11) DEFAULT 0,
  `author` varchar(64) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `rating` int(1) DEFAULT 0,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_review`
--


--
-- Table structure for table `oc_seo_url`
--

DROP TABLE IF EXISTS `oc_seo_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_seo_url` (
  `seo_url_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT 0,
  `language_id` int(11) DEFAULT NULL,
  `key` varchar(64) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `keyword` varchar(768) DEFAULT NULL,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`seo_url_id`),
  KEY `store` (`store_id`),
  KEY `language` (`language_id`),
  KEY `keyword` (`keyword`),
  KEY `query` (`key`,`value`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_seo_url`
--

INSERT INTO `oc_seo_url` VALUES
(1,0,1,'product_id','47','hp-lp3065',1),
(2,0,1,'product_id','48','ipod-classic',1),
(3,0,1,'product_id','28','htc-touch-hd',1),
(4,0,1,'product_id','43','macbook',1),
(5,0,1,'product_id','44','macbook-air',1),
(6,0,1,'product_id','45','macbook-pro',1),
(7,0,1,'product_id','30','canon-eos-5d',1),
(8,0,1,'product_id','31','nikon-d300',1),
(9,0,1,'product_id','29','palm-treo-pro',1),
(10,0,1,'product_id','35','product-8',1),
(11,0,1,'product_id','49','samsung-galaxy-tab-10-1',1),
(12,0,1,'product_id','33','samsung-syncmaster-941bw',1),
(13,0,1,'product_id','46','sony-vaio',1),
(14,0,1,'product_id','41','imac',1),
(15,0,1,'product_id','40','iphone',1),
(16,0,1,'product_id','36','ipod-nano',1),
(17,0,1,'product_id','34','ipod-shuffle',1),
(18,0,1,'product_id','32','ipod-touch',1),
(19,0,1,'product_id','50','apple-4',1),
(20,0,1,'product_id','42','apple-cinema',1),
(21,0,1,'manufacturer_id','5','htc',0),
(22,0,1,'manufacturer_id','7','hewlett-packard',0),
(23,0,1,'manufacturer_id','6','palm',0),
(24,0,1,'manufacturer_id','10','sony',0),
(25,0,1,'manufacturer_id','9','canon',0),
(26,0,1,'manufacturer_id','8','apple',0),
(27,0,1,'path','30','printer',0),
(28,0,1,'path','20_27','desktops/mac',0),
(29,0,1,'path','20_26','desktops/pc',0),
(30,0,1,'path','25','component',0),
(31,0,1,'path','25_29','component/mouse',0),
(32,0,1,'path','33','cameras',0),
(33,0,1,'path','25_28','component/monitor',0),
(34,0,1,'path','25_28_35','component/monitor/test-1',0),
(35,0,1,'path','25_28_36','component/monitor/test-2',0),
(36,0,1,'path','25_30','component/printers',0),
(37,0,1,'path','25_31','component/scanner',0),
(38,0,1,'path','25_32','component/web-camera',0),
(39,0,1,'path','20','desktops',0),
(40,0,1,'path','18','laptop-notebook',0),
(41,0,1,'path','18_46','laptop-notebook/macs',0),
(42,0,1,'path','18_45','laptop-notebook/windows',0),
(43,0,1,'path','34','mp3-players',0),
(44,0,1,'path','34_43','mp3-players/test-11',0),
(45,0,1,'path','34_44','mp3-players/test-12',0),
(46,0,1,'path','34_47','mp3-players/test-15',0),
(47,0,1,'path','34_48','mp3-players/test-16',0),
(48,0,1,'path','34_49','mp3-players/test-17',0),
(49,0,1,'path','34_50','mp3-players/test-18',0),
(50,0,1,'path','34_51','mp3-players/test-19',0),
(51,0,1,'path','34_52','mp3-players/test-20',0),
(52,0,1,'path','34_52_58','mp3-players/test-20/test-25',0),
(53,0,1,'path','34_53','mp3-players/test-21',0),
(54,0,1,'path','34_54','mp3-players/test-22',0),
(55,0,1,'path','34_55','mp3-players/test-23',0),
(56,0,1,'path','34_56','mp3-players/test-24',0),
(57,0,1,'path','34_38','mp3-players/test-4',0),
(58,0,1,'path','34_37','mp3-players/test-5',0),
(59,0,1,'path','34_39','mp3-players/test-6',0),
(60,0,1,'path','34_40','mp3-players/test-7',0),
(61,0,1,'path','34_41','mp3-players/test-8',0),
(62,0,1,'path','34_42','mp3-players/test-9',0),
(63,0,1,'path','24','smartphone',0),
(64,0,1,'path','17','software',0),
(65,0,1,'path','57','tablet',0),
(66,0,1,'information_id','1','about-us',0),
(67,0,1,'information_id','2','terms',0),
(68,0,1,'information_id','4','delivery',0),
(69,0,1,'information_id','3','privacy',0),
(70,0,1,'language','en-gb','en-gb',-2),
(71,0,1,'route','information/information.info','info',0),
(72,0,1,'route','information/information','information',-1),
(73,0,1,'route','product/product','product',-1),
(74,0,1,'route','product/category','catalog',-1),
(75,0,1,'route','product/manufacturer','brands',-1),
(76,0,1,'route','product/manufacturer.info','brand',-2),
(77,0,1,'route','cms/blog','blog',-1),
(78,0,1,'route','cms/blog.info','article',-1);

--
-- Table structure for table `oc_session`
--

DROP TABLE IF EXISTS `oc_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_session` (
  `session_id` varchar(32) NOT NULL,
  `data` text DEFAULT NULL,
  `expire` datetime DEFAULT NULL,
  PRIMARY KEY (`session_id`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_session`
--


--
-- Table structure for table `oc_setting`
--

DROP TABLE IF EXISTS `oc_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT 0,
  `code` varchar(128) DEFAULT NULL,
  `key` varchar(128) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `serialized` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=366 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_setting`
--

INSERT INTO `oc_setting` VALUES
(133,0,'currency_ecb','currency_ecb_status','1',0),
(134,0,'dashboard_activity','dashboard_activity_status','1',0),
(135,0,'dashboard_activity','dashboard_activity_sort_order','7',0),
(136,0,'dashboard_sale','dashboard_sale_status','1',0),
(137,0,'dashboard_sale','dashboard_sale_width','3',0),
(138,0,'dashboard_chart','dashboard_chart_status','1',0),
(139,0,'dashboard_chart','dashboard_chart_width','6',0),
(140,0,'dashboard_customer','dashboard_customer_status','1',0),
(141,0,'dashboard_customer','dashboard_customer_width','3',0),
(142,0,'dashboard_map','dashboard_map_status','1',0),
(143,0,'dashboard_map','dashboard_map_width','6',0),
(144,0,'dashboard_online','dashboard_online_status','1',0),
(145,0,'dashboard_online','dashboard_online_width','3',0),
(146,0,'dashboard_order','dashboard_order_sort_order','1',0),
(147,0,'dashboard_order','dashboard_order_status','1',0),
(148,0,'dashboard_order','dashboard_order_width','3',0),
(149,0,'dashboard_sale','dashboard_sale_sort_order','2',0),
(150,0,'dashboard_customer','dashboard_customer_sort_order','3',0),
(151,0,'dashboard_online','dashboard_online_sort_order','4',0),
(152,0,'dashboard_map','dashboard_map_sort_order','5',0),
(153,0,'dashboard_chart','dashboard_chart_sort_order','6',0),
(154,0,'dashboard_recent','dashboard_recent_status','1',0),
(155,0,'dashboard_recent','dashboard_recent_sort_order','8',0),
(156,0,'dashboard_activity','dashboard_activity_width','4',0),
(157,0,'dashboard_recent','dashboard_recent_width','8',0),
(158,0,'developer','developer_sass','1',0),
(159,0,'module_category','module_category_status','1',0),
(160,0,'module_account','module_account_status','1',0),
(161,0,'module_topic','module_topic_status','1',0),
(162,0,'payment_free_checkout','payment_free_checkout_status','1',0),
(163,0,'payment_free_checkout','payment_free_checkout_order_status_id','1',0),
(164,0,'payment_free_checkout','payment_free_checkout_sort_order','1',0),
(165,0,'payment_cod','payment_cod_sort_order','5',0),
(166,0,'payment_cod','payment_cod_total','0.01',0),
(167,0,'payment_cod','payment_cod_order_status_id','1',0),
(168,0,'payment_cod','payment_cod_geo_zone_id','0',0),
(169,0,'payment_cod','payment_cod_status','1',0),
(170,0,'report_customer_activity','report_customer_activity_status','1',0),
(171,0,'report_customer_activity','report_customer_activity_sort_order','1',0),
(172,0,'report_customer_order','report_customer_order_status','1',0),
(173,0,'report_customer_order','report_customer_order_sort_order','2',0),
(174,0,'report_customer_reward','report_customer_reward_status','1',0),
(175,0,'report_customer_reward','report_customer_reward_sort_order','3',0),
(176,0,'report_customer_search','report_customer_search_status','1',0),
(177,0,'report_customer_search','report_customer_search_sort_order','4',0),
(178,0,'report_customer_transaction','report_customer_transaction_status','1',0),
(179,0,'report_customer_transaction','report_customer_transaction_sort_order','5',0),
(180,0,'report_customer','report_customer_status','1',0),
(181,0,'report_customer','report_customer_sort_order','6',0),
(182,0,'report_sale_tax','report_sale_tax_status','1',0),
(183,0,'report_sale_tax','report_sale_tax_sort_order','8',0),
(184,0,'report_sale_shipping','report_sale_shipping_status','1',0),
(185,0,'report_sale_shipping','report_sale_shipping_sort_order','9',0),
(186,0,'report_sale_return','report_sale_return_status','1',0),
(187,0,'report_sale_return','report_sale_return_sort_order','10',0),
(188,0,'report_sale_order','report_sale_order_status','1',0),
(189,0,'report_sale_order','report_sale_order_sort_order','11',0),
(190,0,'report_sale_coupon','report_sale_coupon_status','1',0),
(191,0,'report_sale_coupon','report_sale_coupon_sort_order','12',0),
(192,0,'report_product_viewed','report_product_viewed_status','1',0),
(193,0,'report_product_viewed','report_product_viewed_sort_order','13',0),
(194,0,'report_product_purchased','report_product_purchased_status','1',0),
(195,0,'report_product_purchased','report_product_purchased_sort_order','14',0),
(196,0,'report_marketing','report_marketing_status','1',0),
(197,0,'report_marketing','report_marketing_sort_order','15',0),
(198,0,'report_subscription','report_subscription_status','1',0),
(199,0,'report_subscription','report_subscription_sort_order','16',0),
(200,0,'shipping_flat','shipping_flat_sort_order','1',0),
(201,0,'shipping_flat','shipping_flat_status','1',0),
(202,0,'shipping_flat','shipping_flat_geo_zone_id','0',0),
(203,0,'shipping_flat','shipping_flat_tax_class_id','9',0),
(204,0,'shipping_flat','shipping_flat_cost','5.00',0),
(205,0,'theme_basic','theme_basic_status','1',0),
(206,0,'total_shipping','total_shipping_sort_order','3',0),
(207,0,'total_sub_total','total_sub_total_sort_order','1',0),
(208,0,'total_sub_total','total_sub_total_status','1',0),
(209,0,'total_tax','total_tax_sort_order','5',0),
(210,0,'total_tax','total_tax_status','1',0),
(211,0,'total_total','total_total_sort_order','9',0),
(212,0,'total_total','total_total_status','1',0),
(213,0,'total_credit','total_credit_sort_order','7',0),
(214,0,'total_credit','total_credit_status','1',0),
(215,0,'total_reward','total_reward_sort_order','2',0),
(216,0,'total_reward','total_reward_status','1',0),
(217,0,'total_shipping','total_shipping_status','1',0),
(218,0,'total_shipping','total_shipping_estimator','1',0),
(219,0,'total_coupon','total_coupon_sort_order','4',0),
(220,0,'total_coupon','total_coupon_status','1',0),
(222,0,'config','config_name','Your Store',0),
(223,0,'config','config_theme','basic',0),
(224,0,'config','config_layout_id','4',0),
(225,0,'config','config_logo','catalog/opencart-logo.png',0),
(226,0,'config','config_icon','catalog/opencart.ico',0),
(227,0,'config','config_description','{\"1\":{\"meta_title\":\"Your Store\",\"meta_description\":\"\",\"meta_keyword\":\"\"}}',1),
(228,0,'config','config_owner','Your Name',0),
(229,0,'config','config_address','Address 1',0),
(230,0,'config','config_geocode','',0),
(231,0,'config','config_email','user@example.com',0),
(232,0,'config','config_telephone','123456789',0),
(233,0,'config','config_image','',0),
(234,0,'config','config_open','',0),
(235,0,'config','config_comment','',0),
(236,0,'config','config_country_id','222',0),
(237,0,'config','config_zone_id','3563',0),
(238,0,'config','config_timezone','UTC',0),
(239,0,'config','config_language_catalog','en-gb',0),
(240,0,'config','config_language_admin','en-gb',0),
(241,0,'config','config_currency','USD',0),
(242,0,'config','config_currency_engine','ecb',0),
(243,0,'config','config_currency_auto','1',0),
(244,0,'config','config_length_class_id','1',0),
(245,0,'config','config_weight_class_id','1',0),
(246,0,'config','config_product_description_length','100',0),
(247,0,'config','config_pagination','10',0),
(248,0,'config','config_product_count','1',0),
(249,0,'config','config_pagination_admin','10',0),
(250,0,'config','config_autocomplete_limit','5',0),
(251,0,'config','config_product_report_status','0',0),
(252,0,'config','config_product_search','and',0),
(253,0,'config','config_product_search_admin','and',0),
(254,0,'config','config_product_filters','and',0),
(255,0,'config','config_review_status','1',0),
(256,0,'config','config_review_purchased','0',0),
(257,0,'config','config_review_guest','1',0),
(258,0,'config','config_article_description_length','600',0),
(259,0,'config','config_comment_status','0',0),
(260,0,'config','config_comment_approve','0',0),
(261,0,'config','config_comment_interval','',0),
(262,0,'config','config_cookie_id','0',0),
(263,0,'config','config_gdpr_id','0',0),
(264,0,'config','config_gdpr_limit','180',0),
(265,0,'config','config_tax','1',0),
(266,0,'config','config_tax_default','shipping',0),
(267,0,'config','config_tax_customer','shipping',0),
(268,0,'config','config_customer_online','1',0),
(269,0,'config','config_customer_online_expire','1',0),
(270,0,'config','config_customer_activity','1',0),
(271,0,'config','config_customer_search','1',0),
(272,0,'config','config_customer_group_id','1',0),
(273,0,'config','config_customer_group_display','[\"1\"]',1),
(274,0,'config','config_customer_price','0',0),
(275,0,'config','config_telephone_display','1',0),
(276,0,'config','config_telephone_required','1',0),
(277,0,'config','config_account_id','2',0),
(278,0,'config','config_2fa','0',0),
(279,0,'config','config_login_attempts','5',0),
(280,0,'config','config_password_length','6',0),
(281,0,'config','config_invoice_prefix','INV-2026-00',0),
(282,0,'config','config_cart_weight','1',0),
(283,0,'config','config_checkout_guest','1',0),
(284,0,'config','config_checkout_payment_address','0',0),
(285,0,'config','config_checkout_shipping_address','0',0),
(286,0,'config','config_checkout_id','0',0),
(287,0,'config','config_order_status_id','1',0),
(288,0,'config','config_processing_status','[\"5\",\"1\",\"2\",\"12\",\"3\"]',1),
(289,0,'config','config_complete_status','[\"5\",\"3\"]',1),
(290,0,'config','config_failed_status_id','7',0),
(291,0,'config','config_void_status_id','16',0),
(292,0,'config','config_fraud_status_id','8',0),
(293,0,'config','config_api_id','1',0),
(294,0,'config','config_subscription_status_id','1',0),
(295,0,'config','config_subscription_active_status_id','2',0),
(296,0,'config','config_subscription_expired_status_id','3',0),
(297,0,'config','config_subscription_suspended_status_id','4',0),
(298,0,'config','config_subscription_canceled_status_id','5',0),
(299,0,'config','config_subscription_failed_status_id','6',0),
(300,0,'config','config_subscription_denied_status_id','7',0),
(301,0,'config','config_stock_display','0',0),
(302,0,'config','config_stock_warning','0',0),
(303,0,'config','config_stock_checkout','0',0),
(304,0,'config','config_stock_status_id','7',0),
(305,0,'config','config_affiliate_status','1',0),
(306,0,'config','config_affiliate_group_id','1',0),
(307,0,'config','config_affiliate_approval','0',0),
(308,0,'config','config_affiliate_auto','0',0),
(309,0,'config','config_affiliate_commission','5',0),
(310,0,'config','config_affiliate_expire','',0),
(311,0,'config','config_affiliate_id','4',0),
(312,0,'config','config_return_status_id','2',0),
(313,0,'config','config_return_id','0',0),
(314,0,'config','config_captcha','',0),
(315,0,'config','config_captcha_page','[\"review\",\"contact\"]',1),
(316,0,'config','config_image_default_width','150',0),
(317,0,'config','config_image_default_height','150',0),
(318,0,'config','config_image_category_width','300',0),
(319,0,'config','config_image_category_height','300',0),
(320,0,'config','config_image_thumb_width','500',0),
(321,0,'config','config_image_thumb_height','500',0),
(322,0,'config','config_image_popup_width','800',0),
(323,0,'config','config_image_popup_height','800',0),
(324,0,'config','config_image_product_width','250',0),
(325,0,'config','config_image_product_height','250',0),
(326,0,'config','config_image_additional_width','74',0),
(327,0,'config','config_image_additional_height','74',0),
(328,0,'config','config_image_related_width','250',0),
(329,0,'config','config_image_related_height','250',0),
(330,0,'config','config_image_article_width','1140',0),
(331,0,'config','config_image_article_height','380',0),
(332,0,'config','config_image_topic_width','1140',0),
(333,0,'config','config_image_topic_height','380',0),
(334,0,'config','config_image_compare_width','90',0),
(335,0,'config','config_image_compare_height','90',0),
(336,0,'config','config_image_wishlist_width','47',0),
(337,0,'config','config_image_wishlist_height','47',0),
(338,0,'config','config_image_cart_width','47',0),
(339,0,'config','config_image_cart_height','47',0),
(340,0,'config','config_image_location_width','268',0),
(341,0,'config','config_image_location_height','268',0),
(342,0,'config','config_mail_engine','',0),
(343,0,'config','config_mail_parameter','',0),
(344,0,'config','config_mail_smtp_hostname','',0),
(345,0,'config','config_mail_smtp_username','',0),
(346,0,'config','config_mail_smtp_password','',0),
(347,0,'config','config_mail_smtp_port','25',0),
(348,0,'config','config_mail_smtp_timeout','5',0),
(349,0,'config','config_mail_alert','[\"order\"]',1),
(350,0,'config','config_mail_alert_email','',0),
(351,0,'config','config_maintenance','0',0),
(352,0,'config','config_session_expire','86400',0),
(353,0,'config','config_session_samesite','Strict',0),
(354,0,'config','config_seo_url','0',0),
(355,0,'config','config_compression','0',0),
(356,0,'config','config_user_2fa','0',0),
(357,0,'config','config_2fa_expire','90',0),
(358,0,'config','config_user_password_length','',0),
(359,0,'config','config_shared','0',0),
(360,0,'config','config_file_max_size','20',0),
(361,0,'config','config_file_ext_allowed','zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\nwebp\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nmp4\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc',0),
(362,0,'config','config_file_mime_allowed','text/plain\r\nimage/png\r\nimage/webp\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\napplication/x-zip\r\napplication/x-zip-compressed\r\napplication/rar\r\napplication/x-rar\r\napplication/x-rar-compressed\r\napplication/octet-stream\r\naudio/mpeg\r\nvideo/mp4\r\nvideo/quicktime\r\napplication/pdf',0),
(363,0,'config','config_error_display','1',0),
(364,0,'config','config_error_log','1',0),
(365,0,'config','config_error_filename','error.log',0);

--
-- Table structure for table `oc_startup`
--

DROP TABLE IF EXISTS `oc_startup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_startup` (
  `startup_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `action` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`startup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_startup`
--


--
-- Table structure for table `oc_statistics`
--

DROP TABLE IF EXISTS `oc_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_statistics` (
  `statistics_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL,
  `value` decimal(15,4) DEFAULT NULL,
  PRIMARY KEY (`statistics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_statistics`
--

INSERT INTO `oc_statistics` VALUES
(1,'order_sale',0.0000),
(2,'order_processing',0.0000),
(3,'order_complete',0.0000),
(4,'order_other',0.0000),
(5,'returns',0.0000),
(6,'product',0.0000),
(7,'review',0.0000);

--
-- Table structure for table `oc_stock_status`
--

DROP TABLE IF EXISTS `oc_stock_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_stock_status`
--

INSERT INTO `oc_stock_status` VALUES
(5,1,'Out Of Stock'),
(6,1,'2-3 Days'),
(7,1,'In Stock'),
(8,1,'Pre-Order');

--
-- Table structure for table `oc_store`
--

DROP TABLE IF EXISTS `oc_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_store`
--


--
-- Table structure for table `oc_subscription`
--

DROP TABLE IF EXISTS `oc_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_subscription` (
  `subscription_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT 0,
  `store_id` int(11) DEFAULT 0,
  `customer_id` int(11) DEFAULT NULL,
  `payment_address_id` int(11) DEFAULT 0,
  `payment_method` text DEFAULT NULL,
  `shipping_address_id` int(11) DEFAULT 0,
  `shipping_method` text DEFAULT NULL,
  `subscription_plan_id` int(11) DEFAULT 0,
  `trial_price` decimal(10,4) DEFAULT NULL,
  `trial_tax` decimal(10,4) DEFAULT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') DEFAULT NULL,
  `trial_cycle` smallint(6) DEFAULT 0,
  `trial_duration` smallint(6) DEFAULT 0,
  `trial_remaining` smallint(6) DEFAULT 0,
  `trial_status` tinyint(1) DEFAULT 0,
  `price` decimal(10,4) DEFAULT NULL,
  `tax` decimal(10,4) DEFAULT NULL,
  `frequency` enum('day','week','semi_month','month','year') DEFAULT NULL,
  `cycle` smallint(6) DEFAULT 0,
  `duration` smallint(6) DEFAULT 0,
  `remaining` smallint(6) DEFAULT 0,
  `date_next` datetime DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `subscription_status_id` int(11) DEFAULT 0,
  `language` varchar(5) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`subscription_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_subscription`
--


--
-- Table structure for table `oc_subscription_history`
--

DROP TABLE IF EXISTS `oc_subscription_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_subscription_history` (
  `subscription_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_id` int(11) DEFAULT NULL,
  `subscription_status_id` int(11) DEFAULT 0,
  `notify` tinyint(1) DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`subscription_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_subscription_history`
--


--
-- Table structure for table `oc_subscription_log`
--

DROP TABLE IF EXISTS `oc_subscription_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_subscription_log` (
  `subscription_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_id` int(11) DEFAULT NULL,
  `code` varchar(128) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`subscription_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_subscription_log`
--


--
-- Table structure for table `oc_subscription_option`
--

DROP TABLE IF EXISTS `oc_subscription_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_subscription_option` (
  `subscription_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_id` int(11) DEFAULT NULL,
  `subscription_product_id` int(11) DEFAULT NULL,
  `product_option_id` int(11) DEFAULT NULL,
  `product_option_value_id` int(11) DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`subscription_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_subscription_option`
--


--
-- Table structure for table `oc_subscription_plan`
--

DROP TABLE IF EXISTS `oc_subscription_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_subscription_plan` (
  `subscription_plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `trial_frequency` enum('day','week','semi_month','month','year') DEFAULT NULL,
  `trial_duration` int(10) DEFAULT 0,
  `trial_cycle` int(10) DEFAULT 0,
  `trial_status` tinyint(4) DEFAULT 0,
  `frequency` enum('day','week','semi_month','month','year') DEFAULT NULL,
  `duration` int(10) DEFAULT 0,
  `cycle` int(10) DEFAULT 0,
  `status` tinyint(1) DEFAULT 0,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`subscription_plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_subscription_plan`
--

INSERT INTO `oc_subscription_plan` VALUES
(1,NULL,0,0,0,'day',0,1,1,0),
(2,NULL,0,0,0,'month',10,1,1,0),
(3,NULL,0,0,0,'day',0,1,1,0);

--
-- Table structure for table `oc_subscription_plan_description`
--

DROP TABLE IF EXISTS `oc_subscription_plan_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_subscription_plan_description` (
  `subscription_plan_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subscription_plan_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_subscription_plan_description`
--

INSERT INTO `oc_subscription_plan_description` VALUES
(1,1,'Daily'),
(2,1,'Weekly'),
(3,1,'Monthly');

--
-- Table structure for table `oc_subscription_product`
--

DROP TABLE IF EXISTS `oc_subscription_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_subscription_product` (
  `subscription_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT 0,
  `order_product_id` int(11) DEFAULT 0,
  `product_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `quantity` int(4) DEFAULT 0,
  `trial_price` decimal(10,4) DEFAULT NULL,
  `trial_tax` decimal(15,4) DEFAULT 0.0000,
  `price` decimal(10,4) DEFAULT NULL,
  `tax` decimal(15,4) DEFAULT 0.0000,
  PRIMARY KEY (`subscription_product_id`),
  KEY `subscription_id` (`subscription_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_subscription_product`
--


--
-- Table structure for table `oc_subscription_status`
--

DROP TABLE IF EXISTS `oc_subscription_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_subscription_status` (
  `subscription_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`subscription_status_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_subscription_status`
--

INSERT INTO `oc_subscription_status` VALUES
(1,1,'Pending'),
(2,1,'Active'),
(3,1,'Expired'),
(4,1,'Suspended'),
(5,1,'Cancelled'),
(6,1,'Failed'),
(7,1,'Denied');

--
-- Table structure for table `oc_tax_class`
--

DROP TABLE IF EXISTS `oc_tax_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_tax_class`
--

INSERT INTO `oc_tax_class` VALUES
(9,'Taxable Goods','Taxed goods'),
(10,'Downloadable Products','Downloadable');

--
-- Table structure for table `oc_tax_rate`
--

DROP TABLE IF EXISTS `oc_tax_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) DEFAULT 0,
  `name` varchar(32) DEFAULT NULL,
  `rate` decimal(15,4) DEFAULT 0.0000,
  `type` char(1) DEFAULT NULL,
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_tax_rate`
--

INSERT INTO `oc_tax_rate` VALUES
(86,3,'VAT (20%)',20.0000,'P'),
(87,3,'Eco Tax (-2.00)',2.0000,'F');

--
-- Table structure for table `oc_tax_rate_to_customer_group`
--

DROP TABLE IF EXISTS `oc_tax_rate_to_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_tax_rate_to_customer_group`
--

INSERT INTO `oc_tax_rate_to_customer_group` VALUES
(86,1),
(87,1);

--
-- Table structure for table `oc_tax_rule`
--

DROP TABLE IF EXISTS `oc_tax_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `based` varchar(10) DEFAULT NULL,
  `priority` int(5) DEFAULT 1,
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_tax_rule`
--

INSERT INTO `oc_tax_rule` VALUES
(120,10,87,'store',0),
(121,10,86,'payment',1),
(127,9,87,'shipping',2),
(128,9,86,'shipping',1);

--
-- Table structure for table `oc_theme`
--

DROP TABLE IF EXISTS `oc_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_theme` (
  `theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT 0,
  `route` varchar(64) DEFAULT NULL,
  `code` mediumtext DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_theme`
--


--
-- Table structure for table `oc_topic`
--

DROP TABLE IF EXISTS `oc_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) DEFAULT 0,
  `status` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_topic`
--


--
-- Table structure for table `oc_topic_description`
--

DROP TABLE IF EXISTS `oc_topic_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_topic_description` (
  `topic_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`topic_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_topic_description`
--


--
-- Table structure for table `oc_topic_to_layout`
--

DROP TABLE IF EXISTS `oc_topic_to_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_topic_to_layout` (
  `topic_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `layout_id` int(11) DEFAULT 0,
  PRIMARY KEY (`topic_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_topic_to_layout`
--


--
-- Table structure for table `oc_topic_to_store`
--

DROP TABLE IF EXISTS `oc_topic_to_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_topic_to_store` (
  `topic_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`topic_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_topic_to_store`
--


--
-- Table structure for table `oc_translation`
--

DROP TABLE IF EXISTS `oc_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_translation` (
  `translation_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT 0,
  `language_id` int(11) DEFAULT NULL,
  `route` varchar(64) DEFAULT NULL,
  `key` varchar(64) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`translation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_translation`
--


--
-- Table structure for table `oc_upload`
--

DROP TABLE IF EXISTS `oc_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_upload`
--


--
-- Table structure for table `oc_user`
--

DROP TABLE IF EXISTS `oc_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) DEFAULT 0,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `email` varchar(96) DEFAULT NULL,
  `image` varchar(255) DEFAULT '',
  `ip` varchar(40) DEFAULT '',
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user`
--

INSERT INTO `oc_user` VALUES
(1,1,'admin','$2y$12$8s15VVFE3xg8CCJr2oLtVe35B0OsNI4xlMbtmgKgiJvPGTMKlo/TC','John','Doe','admin@example.com','','172.18.0.1',1,'2026-07-24 01:34:09');

--
-- Table structure for table `oc_user_authorize`
--

DROP TABLE IF EXISTS `oc_user_authorize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_user_authorize` (
  `user_authorize_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(96) DEFAULT NULL,
  `total` int(1) DEFAULT 0,
  `ip` varchar(40) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  `date_expire` datetime DEFAULT NULL,
  PRIMARY KEY (`user_authorize_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_authorize`
--


--
-- Table structure for table `oc_user_group`
--

DROP TABLE IF EXISTS `oc_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `permission` text DEFAULT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_group`
--

INSERT INTO `oc_user_group` VALUES
(1,'Administrator','{\"access\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/filter_group\",\"catalog\\/identifier\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/review\",\"catalog\\/subscription_plan\",\"cms\\/antispam\",\"cms\\/article\",\"cms\\/comment\",\"cms\\/topic\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/security\",\"customer\\/address\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"customer\\/gdpr\",\"design\\/banner\",\"design\\/layout\",\"design\\/seo_url\",\"design\\/theme\",\"design\\/translation\",\"error\\/exception\",\"event\\/modification\",\"extension\\/analytics\",\"extension\\/captcha\",\"extension\\/currency\",\"extension\\/dashboard\",\"extension\\/feed\",\"extension\\/fraud\",\"extension\\/language\",\"extension\\/marketplace\",\"extension\\/module\",\"extension\\/other\",\"extension\\/payment\",\"extension\\/report\",\"extension\\/shipping\",\"extension\\/theme\",\"extension\\/total\",\"localisation\\/address_format\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/subscription_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/authorize\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/gdpr\",\"mail\\/returns\",\"mail\\/reward\",\"mail\\/subscription\",\"mail\\/transaction\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/api\",\"marketplace\\/cron\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/modification\",\"marketplace\\/promotion\",\"marketplace\\/startup\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/returns\",\"sale\\/subscription\",\"setting\\/setting\",\"setting\\/store\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/notification\",\"tool\\/upgrade\",\"tool\\/upload\",\"user\\/api\",\"user\\/profile\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/opencart\\/api\\/coupon\",\"extension\\/opencart\\/api\\/reward\",\"extension\\/opencart\\/captcha\\/basic\",\"extension\\/opencart\\/currency\\/ecb\",\"extension\\/opencart\\/currency\\/fixer\",\"extension\\/opencart\\/dashboard\\/activity\",\"extension\\/opencart\\/dashboard\\/chart\",\"extension\\/opencart\\/dashboard\\/customer\",\"extension\\/opencart\\/dashboard\\/map\",\"extension\\/opencart\\/dashboard\\/online\",\"extension\\/opencart\\/dashboard\\/order\",\"extension\\/opencart\\/dashboard\\/recent\",\"extension\\/opencart\\/dashboard\\/sale\",\"extension\\/opencart\\/fraud\\/ddos\",\"extension\\/opencart\\/fraud\\/ip\",\"extension\\/opencart\\/module\\/account\",\"extension\\/opencart\\/module\\/banner\",\"extension\\/opencart\\/module\\/bestseller\",\"extension\\/opencart\\/module\\/blog\",\"extension\\/opencart\\/module\\/category\",\"extension\\/opencart\\/module\\/featured\",\"extension\\/opencart\\/module\\/filter\",\"extension\\/opencart\\/module\\/html\",\"extension\\/opencart\\/module\\/information\",\"extension\\/opencart\\/module\\/latest\",\"extension\\/opencart\\/module\\/special\",\"extension\\/opencart\\/module\\/store\",\"extension\\/opencart\\/module\\/topic\",\"extension\\/opencart\\/payment\\/bank_transfer\",\"extension\\/opencart\\/payment\\/cheque\",\"extension\\/opencart\\/payment\\/cod\",\"extension\\/opencart\\/payment\\/free_checkout\",\"extension\\/opencart\\/report\\/customer\",\"extension\\/opencart\\/report\\/customer_activity\",\"extension\\/opencart\\/report\\/customer_order\",\"extension\\/opencart\\/report\\/customer_reward\",\"extension\\/opencart\\/report\\/customer_search\",\"extension\\/opencart\\/report\\/customer_transaction\",\"extension\\/opencart\\/report\\/marketing\",\"extension\\/opencart\\/report\\/product_purchased\",\"extension\\/opencart\\/report\\/product_viewed\",\"extension\\/opencart\\/report\\/sale_coupon\",\"extension\\/opencart\\/report\\/sale_order\",\"extension\\/opencart\\/report\\/sale_return\",\"extension\\/opencart\\/report\\/sale_shipping\",\"extension\\/opencart\\/report\\/sale_tax\",\"extension\\/opencart\\/report\\/subscription\",\"extension\\/opencart\\/shipping\\/flat\",\"extension\\/opencart\\/shipping\\/free\",\"extension\\/opencart\\/shipping\\/item\",\"extension\\/opencart\\/shipping\\/pickup\",\"extension\\/opencart\\/shipping\\/weight\",\"extension\\/opencart\\/theme\\/basic\",\"extension\\/opencart\\/total\\/coupon\",\"extension\\/opencart\\/total\\/credit\",\"extension\\/opencart\\/total\\/handling\",\"extension\\/opencart\\/total\\/low_order_fee\",\"extension\\/opencart\\/total\\/reward\",\"extension\\/opencart\\/total\\/shipping\",\"extension\\/opencart\\/total\\/sub_total\",\"extension\\/opencart\\/total\\/tax\",\"extension\\/opencart\\/total\\/total\"],\"modify\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/filter_group\",\"catalog\\/identifier\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/review\",\"catalog\\/subscription_plan\",\"cms\\/antispam\",\"cms\\/article\",\"cms\\/comment\",\"cms\\/topic\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/security\",\"customer\\/address\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"customer\\/gdpr\",\"design\\/banner\",\"design\\/layout\",\"design\\/seo_url\",\"design\\/theme\",\"design\\/translation\",\"error\\/exception\",\"event\\/modification\",\"extension\\/analytics\",\"extension\\/captcha\",\"extension\\/currency\",\"extension\\/dashboard\",\"extension\\/feed\",\"extension\\/fraud\",\"extension\\/language\",\"extension\\/marketplace\",\"extension\\/module\",\"extension\\/other\",\"extension\\/payment\",\"extension\\/report\",\"extension\\/shipping\",\"extension\\/theme\",\"extension\\/total\",\"localisation\\/address_format\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/subscription_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/authorize\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/gdpr\",\"mail\\/returns\",\"mail\\/reward\",\"mail\\/subscription\",\"mail\\/transaction\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/api\",\"marketplace\\/cron\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/modification\",\"marketplace\\/promotion\",\"marketplace\\/startup\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/returns\",\"sale\\/subscription\",\"setting\\/setting\",\"setting\\/store\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/notification\",\"tool\\/upgrade\",\"tool\\/upload\",\"user\\/api\",\"user\\/profile\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/opencart\\/api\\/coupon\",\"extension\\/opencart\\/api\\/reward\",\"extension\\/opencart\\/captcha\\/basic\",\"extension\\/opencart\\/currency\\/ecb\",\"extension\\/opencart\\/currency\\/fixer\",\"extension\\/opencart\\/dashboard\\/activity\",\"extension\\/opencart\\/dashboard\\/chart\",\"extension\\/opencart\\/dashboard\\/customer\",\"extension\\/opencart\\/dashboard\\/map\",\"extension\\/opencart\\/dashboard\\/online\",\"extension\\/opencart\\/dashboard\\/order\",\"extension\\/opencart\\/dashboard\\/recent\",\"extension\\/opencart\\/dashboard\\/sale\",\"extension\\/opencart\\/fraud\\/ddos\",\"extension\\/opencart\\/fraud\\/ip\",\"extension\\/opencart\\/module\\/account\",\"extension\\/opencart\\/module\\/banner\",\"extension\\/opencart\\/module\\/bestseller\",\"extension\\/opencart\\/module\\/blog\",\"extension\\/opencart\\/module\\/category\",\"extension\\/opencart\\/module\\/featured\",\"extension\\/opencart\\/module\\/filter\",\"extension\\/opencart\\/module\\/html\",\"extension\\/opencart\\/module\\/information\",\"extension\\/opencart\\/module\\/latest\",\"extension\\/opencart\\/module\\/special\",\"extension\\/opencart\\/module\\/store\",\"extension\\/opencart\\/module\\/topic\",\"extension\\/opencart\\/payment\\/bank_transfer\",\"extension\\/opencart\\/payment\\/cheque\",\"extension\\/opencart\\/payment\\/cod\",\"extension\\/opencart\\/payment\\/free_checkout\",\"extension\\/opencart\\/report\\/customer\",\"extension\\/opencart\\/report\\/customer_activity\",\"extension\\/opencart\\/report\\/customer_order\",\"extension\\/opencart\\/report\\/customer_reward\",\"extension\\/opencart\\/report\\/customer_search\",\"extension\\/opencart\\/report\\/customer_transaction\",\"extension\\/opencart\\/report\\/marketing\",\"extension\\/opencart\\/report\\/product_purchased\",\"extension\\/opencart\\/report\\/product_viewed\",\"extension\\/opencart\\/report\\/sale_coupon\",\"extension\\/opencart\\/report\\/sale_order\",\"extension\\/opencart\\/report\\/sale_return\",\"extension\\/opencart\\/report\\/sale_shipping\",\"extension\\/opencart\\/report\\/sale_tax\",\"extension\\/opencart\\/report\\/subscription\",\"extension\\/opencart\\/shipping\\/flat\",\"extension\\/opencart\\/shipping\\/free\",\"extension\\/opencart\\/shipping\\/item\",\"extension\\/opencart\\/shipping\\/pickup\",\"extension\\/opencart\\/shipping\\/weight\",\"extension\\/opencart\\/theme\\/basic\",\"extension\\/opencart\\/total\\/coupon\",\"extension\\/opencart\\/total\\/credit\",\"extension\\/opencart\\/total\\/handling\",\"extension\\/opencart\\/total\\/low_order_fee\",\"extension\\/opencart\\/total\\/reward\",\"extension\\/opencart\\/total\\/shipping\",\"extension\\/opencart\\/total\\/sub_total\",\"extension\\/opencart\\/total\\/tax\",\"extension\\/opencart\\/total\\/total\"]}'),
(2,'Demonstration',''),
(3,'Marketing',''),
(4,'Product Data Entry',''),
(5,'Order Processing',''),
(6,'Accounting',''),
(7,'Customer Service',''),
(8,'Analysis',''),
(9,'Content WritIng','');

--
-- Table structure for table `oc_user_login`
--

DROP TABLE IF EXISTS `oc_user_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_user_login` (
  `user_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(40) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`user_login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_login`
--

INSERT INTO `oc_user_login` VALUES
(1,1,'172.18.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0','2026-07-24 01:34:25'),
(2,1,'172.18.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0','2026-07-24 11:16:47'),
(3,1,'172.18.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0','2026-07-24 21:30:21'),
(4,1,'172.18.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0','2026-08-13 13:23:06');

--
-- Table structure for table `oc_user_token`
--

DROP TABLE IF EXISTS `oc_user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_user_token` (
  `user_token_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `code` text DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`user_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_token`
--


--
-- Table structure for table `oc_weight_class`
--

DROP TABLE IF EXISTS `oc_weight_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) DEFAULT 0.00000000,
  PRIMARY KEY (`weight_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_weight_class`
--

INSERT INTO `oc_weight_class` VALUES
(1,1.00000000),
(2,1000.00000000),
(3,2.20460000),
(4,35.27400000);

--
-- Table structure for table `oc_weight_class_description`
--

DROP TABLE IF EXISTS `oc_weight_class_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) DEFAULT NULL,
  `unit` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_weight_class_description`
--

INSERT INTO `oc_weight_class_description` VALUES
(1,1,'Kilogram','kg'),
(2,1,'Gram','g'),
(3,1,'Pound ','lb'),
(4,1,'Ounce','oz');

--
-- Table structure for table `oc_zone`
--

DROP TABLE IF EXISTS `oc_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4474 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_zone`
--

INSERT INTO `oc_zone` VALUES
(1,1,'BDS',1),
(2,1,'BDG',1),
(3,1,'BGL',1),
(4,1,'BAL',1),
(5,1,'BAM',1),
(6,1,'FRA',1),
(7,1,'FYB',1),
(8,1,'GHA',1),
(9,1,'GHO',1),
(10,1,'HEL',1),
(11,1,'HER',1),
(12,1,'JOW',1),
(13,1,'KAB',1),
(14,1,'KAN',1),
(15,1,'KAP',1),
(16,1,'KHO',1),
(17,1,'KNR',1),
(18,1,'KDZ',1),
(19,1,'LAG',1),
(20,1,'LOW',1),
(21,1,'NAN',1),
(22,1,'NIM',1),
(23,1,'NUR',1),
(24,1,'ORU',1),
(25,1,'PIA',1),
(26,1,'PKA',1),
(27,1,'PAR',1),
(28,1,'SAM',1),
(29,1,'SAR',1),
(30,1,'TAK',1),
(31,1,'WAR',1),
(32,1,'ZAB',1),
(33,2,'BR',1),
(34,2,'BU',1),
(35,2,'DL',1),
(36,2,'DV',1),
(37,2,'DI',1),
(38,2,'DR',1),
(39,2,'EL',1),
(40,2,'ER',1),
(41,2,'FR',1),
(42,2,'GJ',1),
(43,2,'GR',1),
(44,2,'HA',1),
(45,2,'KA',1),
(46,2,'KB',1),
(47,2,'KC',1),
(48,2,'KO',1),
(49,2,'KR',1),
(50,2,'KU',1),
(51,2,'LB',1),
(52,2,'LE',1),
(53,2,'LU',1),
(54,2,'MM',1),
(55,2,'MK',1),
(56,2,'MT',1),
(57,2,'MR',1),
(58,2,'PQ',1),
(59,2,'PR',1),
(60,2,'PG',1),
(61,2,'PU',1),
(62,2,'SH',1),
(63,2,'SK',1),
(64,2,'SR',1),
(65,2,'TE',1),
(66,2,'TP',1),
(67,2,'TR',1),
(68,2,'VL',1),
(69,3,'01',1),
(70,3,'44',1),
(71,3,'46',1),
(72,3,'16',1),
(73,3,'23',1),
(74,3,'05',1),
(75,3,'08',1),
(76,3,'06',1),
(77,3,'07',1),
(78,3,'09',1),
(79,3,'34',1),
(80,3,'10',1),
(81,3,'35',1),
(82,3,'02',1),
(83,3,'26',1),
(84,3,'17',1),
(85,3,'32',1),
(86,3,'39',1),
(87,3,'36',1),
(88,3,'47',1),
(89,3,'24',1),
(90,3,'33',1),
(91,3,'18',1),
(92,3,'40',1),
(93,3,'03',1),
(94,3,'29',1),
(95,3,'26',1),
(96,3,'43',1),
(97,3,'27',1),
(98,3,'28',1),
(99,3,'45',1),
(100,3,'31',1),
(101,3,'30',1),
(102,3,'04',1),
(103,3,'48',1),
(104,3,'20',1),
(105,3,'19',1),
(106,3,'22',1),
(107,3,'21',1),
(108,3,'41',1),
(109,3,'11',1),
(110,3,'12',1),
(111,3,'14',1),
(112,3,'37',1),
(113,3,'42',1),
(114,3,'38',1),
(115,3,'15',1),
(116,3,'13',1),
(117,4,'E',1),
(118,4,'M',1),
(119,4,'R',1),
(120,4,'S',1),
(121,4,'W',1),
(122,5,'ALV',1),
(123,5,'CAN',1),
(124,5,'ENC',1),
(125,5,'ESE',1),
(126,5,'LMA',1),
(127,5,'ORD',1),
(128,5,'SJL',1),
(129,6,'BGO',1),
(130,6,'BGU',1),
(131,6,'BIE',1),
(132,6,'CAB',1),
(133,6,'CCU',1),
(134,6,'CNO',1),
(135,6,'CUS',1),
(136,6,'CNN',1),
(137,6,'HUA',1),
(138,6,'HUI',1),
(139,6,'LUA',1),
(140,6,'LNO',1),
(141,6,'LSU',1),
(142,6,'MAL',1),
(143,6,'MOX',1),
(144,6,'NAM',1),
(145,6,'UIG',1),
(146,6,'ZAI',1),
(147,9,'ASG',1),
(148,9,'ASJ',1),
(149,9,'ASM',1),
(150,9,'ASL',1),
(151,9,'ASR',1),
(152,9,'ASH',1),
(153,9,'BAR',1),
(154,9,'RED',1),
(155,10,'AN',1),
(156,10,'B',1),
(157,10,'K',1),
(158,10,'H',1),
(159,10,'U',1),
(160,10,'X',1),
(161,10,'W',1),
(162,10,'C',1),
(163,10,'E',1),
(164,10,'P',1),
(165,10,'Y',1),
(166,10,'L',1),
(167,10,'F',1),
(168,10,'M',1),
(169,10,'N',1),
(170,10,'Q',1),
(171,10,'R',1),
(172,10,'A',1),
(173,10,'J',1),
(174,10,'D',1),
(175,10,'Z',1),
(176,10,'S',1),
(177,10,'G',1),
(178,10,'V',1),
(179,10,'T',1),
(180,11,'AGT',1),
(181,11,'ARR',1),
(182,11,'ARM',1),
(183,11,'GEG',1),
(184,11,'KOT',1),
(185,11,'LOR',1),
(186,11,'SHI',1),
(187,11,'SYU',1),
(188,11,'TAV',1),
(189,11,'VAY',1),
(190,11,'YER',1),
(191,13,'ACT',1),
(192,13,'NSW',1),
(193,13,'NT',1),
(194,13,'QLD',1),
(195,13,'SA',1),
(196,13,'TAS',1),
(197,13,'VIC',1),
(198,13,'WA',1),
(199,14,'1',1),
(200,14,'2',1),
(201,14,'3',1),
(202,14,'4',1),
(203,14,'5',1),
(204,14,'6',1),
(205,14,'7',1),
(206,14,'8',1),
(207,14,'9',1),
(208,15,'AB',1),
(209,15,'ABS',1),
(210,15,'AGC',1),
(211,15,'AGM',1),
(212,15,'AGS',1),
(213,15,'AGA',1),
(214,15,'AGU',1),
(215,15,'AST',1),
(216,15,'BA',1),
(217,15,'BAB',1),
(218,15,'BAL',1),
(219,15,'BAR',1),
(220,15,'BEY',1),
(221,15,'BIL',1),
(222,15,'CAB',1),
(223,15,'CAL',1),
(224,15,'CUL',1),
(225,15,'DAS',1),
(226,15,'DAV',1),
(227,15,'FUZ',1),
(228,15,'GA',1),
(229,15,'GAD',1),
(230,15,'GOR',1),
(231,15,'GOY',1),
(232,15,'HAC',1),
(233,15,'IMI',1),
(234,15,'ISM',1),
(235,15,'KAL',1),
(236,15,'KUR',1),
(237,15,'LA',1),
(238,15,'LAC',1),
(239,15,'LAN',1),
(240,15,'LER',1),
(241,15,'MAS',1),
(242,15,'MI',1),
(243,15,'NA',1),
(244,15,'NEF',1),
(245,15,'OGU',1),
(246,15,'ORD',1),
(247,15,'QAB',1),
(248,15,'QAX',1),
(249,15,'QAZ',1),
(250,15,'QOB',1),
(251,15,'QBA',1),
(252,15,'QBI',1),
(253,15,'QUS',1),
(254,15,'SA',1),
(255,15,'SAT',1),
(256,15,'SAB',1),
(257,15,'SAD',1),
(258,15,'SAH',1),
(259,15,'SAK',1),
(260,15,'SAL',1),
(261,15,'SM',1),
(262,15,'SMI',1),
(263,15,'SKR',1),
(264,15,'SMX',1),
(265,15,'SAR',1),
(266,15,'SIY',1),
(267,15,'SS',1),
(268,15,'SUS',1),
(269,15,'TAR',1),
(270,15,'TOV',1),
(271,15,'UCA',1),
(272,15,'XA',1),
(273,15,'XAC',1),
(274,15,'XAN',1),
(275,15,'XIZ',1),
(276,15,'XCI',1),
(277,15,'XVD',1),
(278,15,'YAR',1),
(279,15,'YEV',1),
(280,15,'ZAN',1),
(281,15,'ZAQ',1),
(282,15,'ZAR',1),
(283,15,'NX',1),
(284,16,'ACK',1),
(285,16,'BER',1),
(286,16,'BIM',1),
(287,16,'BLK',1),
(288,16,'CAT',1),
(289,16,'CAB',1),
(290,16,'CAN',1),
(291,16,'CEL',1),
(292,16,'FRE',1),
(293,16,'CRO',1),
(294,16,'EGB',1),
(295,16,'EXU',1),
(296,16,'GRD',1),
(297,16,'HAR',1),
(298,16,'HOP',1),
(299,16,'INA',1),
(300,16,'LNG',1),
(301,16,'MAN',1),
(302,16,'MAY',1),
(303,16,'MOO',1),
(304,16,'NAB',1),
(305,16,'NAN',1),
(306,16,'NEL',1),
(307,16,'RAG',1),
(308,16,'RUM',1),
(309,16,'SAL',1),
(310,16,'SAB',1),
(311,16,'SAN',1),
(312,16,'SEL',1),
(313,16,'SWE',1),
(314,16,'WGB',1),
(315,17,'CAP',1),
(316,17,'CEN',1),
(317,17,'MUH',1),
(318,17,'NOR',1),
(319,17,'SOU',1),
(320,18,'BAR',1),
(321,18,'CHI',1),
(322,18,'DHA',1),
(323,18,'KHU',1),
(324,18,'RAJ',1),
(325,18,'SYL',1),
(326,19,'CC',1),
(327,19,'AND',1),
(328,19,'GEO',1),
(329,19,'JAM',1),
(330,19,'JOH',1),
(331,19,'JOS',1),
(332,19,'LUC',1),
(333,19,'MIC',1),
(334,19,'PET',1),
(335,19,'PHI',1),
(336,19,'THO',1),
(337,20,'BR',1),
(338,20,'HO',1),
(339,20,'HM',1),
(340,20,'HR',1),
(341,20,'MA',1),
(342,20,'MI',1),
(343,20,'VI',1),
(344,21,'VAN',1),
(345,21,'WBR',1),
(346,21,'WHT',1),
(347,21,'WLG',1),
(348,21,'VLI',1),
(349,21,'WLX',1),
(350,21,'WNA',1),
(351,21,'VOV',1),
(352,21,'VBR',1),
(353,21,'VWV',1),
(354,22,'BZ',1),
(355,22,'CY',1),
(356,22,'CR',1),
(357,22,'OW',1),
(358,22,'SC',1),
(359,22,'TO',1),
(360,23,'AL',1),
(361,23,'AK',1),
(362,23,'AQ',1),
(363,23,'BO',1),
(364,23,'CO',1),
(365,23,'DO',1),
(366,23,'KO',1),
(367,23,'LI',1),
(368,23,'MO',1),
(369,23,'OU',1),
(370,23,'PL',1),
(371,23,'ZO',1),
(372,24,'DS',1),
(373,24,'HC',1),
(374,24,'HA',1),
(375,24,'PG',1),
(376,24,'PB',1),
(377,24,'GC',1),
(378,24,'SG',1),
(379,24,'SA',1),
(380,24,'SM',1),
(381,24,'SH',1),
(382,24,'WA',1),
(383,25,'BUM',1),
(384,25,'CHU',1),
(385,25,'DAG',1),
(386,25,'GAS',1),
(387,25,'HAA',1),
(388,25,'LHU',1),
(389,25,'MON',1),
(390,25,'PAR',1),
(391,25,'PEM',1),
(392,25,'PUN',1),
(393,25,'SJO',1),
(394,25,'SAT',1),
(395,25,'SAR',1),
(396,25,'THI',1),
(397,25,'TRG',1),
(398,25,'TRY',1),
(399,25,'TRO',1),
(400,25,'TSI',1),
(401,25,'WPH',1),
(402,25,'ZHE',1),
(403,26,'BEN',1),
(404,26,'CHU',1),
(405,26,'COC',1),
(406,26,'LPZ',1),
(407,26,'ORU',1),
(408,26,'PAN',1),
(409,26,'POT',1),
(410,26,'SCZ',1),
(411,26,'TAR',1),
(412,27,'BRO',1),
(413,27,'FUS',1),
(414,27,'FPO',1),
(415,27,'FTU',1),
(416,27,'FZE',1),
(417,27,'FBP',1),
(418,27,'FSB',1),
(419,27,'FHN',1),
(420,27,'FZH',1),
(421,27,'FSA',1),
(422,27,'FZA',1),
(423,27,'SBL',1),
(424,27,'SDO',1),
(425,27,'SBI',1),
(426,27,'SVL',1),
(427,27,'SSR',1),
(428,27,'SFO',1),
(429,27,'STR',1),
(430,28,'CE',1),
(431,28,'GH',1),
(432,28,'KD',1),
(433,28,'KT',1),
(434,28,'KW',1),
(435,28,'NG',1),
(436,28,'NE',1),
(437,28,'NW',1),
(438,28,'SE',1),
(439,28,'SO',1),
(440,30,'AC',1),
(441,30,'AL',1),
(442,30,'AP',1),
(443,30,'AM',1),
(444,30,'BA',1),
(445,30,'CE',1),
(446,30,'DF',1),
(447,30,'ES',1),
(448,30,'GO',1),
(449,30,'MA',1),
(450,30,'MT',1),
(451,30,'MS',1),
(452,30,'MG',1),
(453,30,'PA',1),
(454,30,'PB',1),
(455,30,'PR',1),
(456,30,'PE',1),
(457,30,'PI',1),
(458,30,'RJ',1),
(459,30,'RN',1),
(460,30,'RS',1),
(461,30,'RO',1),
(462,30,'RR',1),
(463,30,'SC',1),
(464,30,'SP',1),
(465,30,'SE',1),
(466,30,'TO',1),
(467,31,'PB',1),
(468,31,'SI',1),
(469,31,'NI',1),
(470,31,'TB',1),
(471,31,'EA',1),
(472,31,'DI',1),
(473,31,'EG',1),
(474,31,'DG',1),
(475,32,'BEL',1),
(476,32,'BRM',1),
(477,32,'TEM',1),
(478,32,'TUT',1),
(479,33,'',1),
(480,33,'',1),
(481,33,'',1),
(482,33,'',1),
(483,33,'',1),
(484,33,'',1),
(485,33,'',1),
(486,33,'',1),
(487,33,'',1),
(488,33,'',1),
(489,33,'',1),
(490,33,'',1),
(491,33,'',1),
(492,33,'',1),
(493,33,'',1),
(494,33,'',1),
(495,33,'',1),
(496,33,'',1),
(497,33,'',1),
(498,33,'',1),
(499,33,'',1),
(500,33,'',1),
(501,33,'',1),
(502,33,'',1),
(503,33,'',1),
(504,33,'',1),
(505,33,'',1),
(506,34,'BAL',1),
(507,34,'BAM',1),
(508,34,'BAN',1),
(509,34,'BAZ',1),
(510,34,'BOR',1),
(511,34,'BLG',1),
(512,34,'BOK',1),
(513,34,'COM',1),
(514,34,'GAN',1),
(515,34,'GNA',1),
(516,34,'GOU',1),
(517,34,'HOU',1),
(518,34,'IOA',1),
(519,34,'KAD',1),
(520,34,'KEN',1),
(521,34,'KOD',1),
(522,34,'KOP',1),
(523,34,'KOS',1),
(524,34,'KOL',1),
(525,34,'KOT',1),
(526,34,'KOW',1),
(527,34,'LER',1),
(528,34,'LOR',1),
(529,34,'MOU',1),
(530,34,'NAH',1),
(531,34,'NAM',1),
(532,34,'NAY',1),
(533,34,'NOU',1),
(534,34,'OUB',1),
(535,34,'OUD',1),
(536,34,'PAS',1),
(537,34,'PON',1),
(538,34,'SAG',1),
(539,34,'SAM',1),
(540,34,'SEN',1),
(541,34,'SIS',1),
(542,34,'SOM',1),
(543,34,'SOR',1),
(544,34,'TAP',1),
(545,34,'TUY',1),
(546,34,'YAG',1),
(547,34,'YAT',1),
(548,34,'ZIR',1),
(549,34,'ZOD',1),
(550,34,'ZOW',1),
(551,35,'BB',1),
(552,35,'BJ',1),
(553,35,'BR',1),
(554,35,'CA',1),
(555,35,'CI',1),
(556,35,'GI',1),
(557,35,'KR',1),
(558,35,'KY',1),
(559,35,'KI',1),
(560,35,'MA',1),
(561,35,'MU',1),
(562,35,'MY',1),
(563,35,'MW',1),
(564,35,'NG',1),
(565,35,'RT',1),
(566,35,'RY',1),
(567,36,'PP',1),
(568,36,'PS',1),
(569,36,'PA',1),
(570,36,'KB',1),
(571,36,'BM',1),
(572,36,'BA',1),
(573,36,'KM',1),
(574,36,'KN',1),
(575,36,'KU',1),
(576,36,'KO',1),
(577,36,'KT',1),
(578,36,'KP',1),
(579,36,'KL',1),
(580,36,'KK',1),
(581,36,'KR',1),
(582,36,'MK',1),
(583,36,'OM',1),
(584,36,'PU',1),
(585,36,'PR',1),
(586,36,'PG',1),
(587,36,'RK',1),
(588,36,'SI',1),
(589,36,'ST',1),
(590,36,'SR',1),
(591,36,'TK',1),
(592,37,'ADA',1),
(593,37,'CEN',1),
(594,37,'EST',1),
(595,37,'EXN',1),
(596,37,'LIT',1),
(597,37,'NOR',1),
(598,37,'NOT',1),
(599,37,'OUE',1),
(600,37,'SUD',1),
(601,37,'SOU',1),
(602,38,'AB',1),
(603,38,'BC',1),
(604,38,'MB',1),
(605,38,'NB',1),
(606,38,'NL',1),
(607,38,'NT',1),
(608,38,'NS',1),
(609,38,'NU',1),
(610,38,'ON',1),
(611,38,'PE',1),
(612,38,'QC',1),
(613,38,'SK',1),
(614,38,'YT',1),
(615,39,'BV',1),
(616,39,'BR',1),
(617,39,'CS',1),
(618,39,'MA',1),
(619,39,'MO',1),
(620,39,'PA',1),
(621,39,'PN',1),
(622,39,'PR',1),
(623,39,'RG',1),
(624,39,'SL',1),
(625,39,'CA',1),
(626,39,'CR',1),
(627,39,'SD',1),
(628,39,'SF',1),
(629,39,'SN',1),
(630,39,'SV',1),
(631,39,'TA',1),
(632,40,'CR',1),
(633,40,'EA',1),
(634,40,'ML',1),
(635,40,'ST',1),
(636,40,'SP',1),
(637,40,'SK',1),
(638,40,'WD',1),
(639,40,'WN',1),
(640,41,'BBA',1),
(641,41,'BKO',1),
(642,41,'HKO',1),
(643,41,'HMB',1),
(644,41,'KEM',1),
(645,41,'LOB',1),
(646,41,'MKD',1),
(647,41,'MBO',1),
(648,41,'NMM',1),
(649,41,'OMP',1),
(650,41,'OUK',1),
(651,41,'OUH',1),
(652,41,'OPE',1),
(653,41,'VAK',1),
(654,41,'NGR',1),
(655,41,'SMB',1),
(656,41,'BAN',1),
(657,42,'BA',1),
(658,42,'BI',1),
(659,42,'BE',1),
(660,42,'CB',1),
(661,42,'GU',1),
(662,42,'KA',1),
(663,42,'LA',1),
(664,42,'LC',1),
(665,42,'LR',1),
(666,42,'MK',1),
(667,42,'MC',1),
(668,42,'OU',1),
(669,42,'SA',1),
(670,42,'TA',1),
(671,43,'AI',1),
(672,43,'AN',1),
(673,43,'AR',1),
(674,43,'AT',1),
(675,43,'BI',1),
(676,43,'CO',1),
(677,43,'LI',1),
(678,43,'LL',1),
(679,43,'MA',1),
(680,43,'ML',1),
(681,43,'RM',1),
(682,43,'TA',1),
(683,43,'VS',1),
(684,44,'AN',1),
(685,44,'BE',1),
(686,44,'CH',1),
(687,44,'FU',1),
(688,44,'GA',1),
(689,44,'GU',1),
(690,44,'GX',1),
(691,44,'GZ',1),
(692,44,'HA',1),
(693,44,'HB',1),
(694,44,'HL',1),
(695,44,'HE',1),
(696,44,'HK',1),
(697,44,'HU',1),
(698,44,'HN',1),
(699,44,'IM',1),
(700,44,'JI',1),
(701,44,'JX',1),
(702,44,'JL',1),
(703,44,'LI',1),
(704,44,'MA',1),
(705,44,'NI',1),
(706,44,'SH',1),
(707,44,'SA',1),
(708,44,'SG',1),
(709,44,'SX',1),
(710,44,'SI',1),
(711,44,'TI',1),
(712,44,'XI',1),
(713,44,'YU',1),
(714,44,'ZH',1),
(715,46,'D',1),
(716,46,'H',1),
(717,46,'O',1),
(718,46,'S',1),
(719,46,'W',1),
(720,47,'AMA',1),
(721,47,'ANT',1),
(722,47,'ARA',1),
(723,47,'ATL',1),
(724,47,'DC',1),
(725,47,'BOL',1),
(726,47,'BOY',1),
(727,47,'CAL',1),
(728,47,'CAQ',1),
(729,47,'CAS',1),
(730,47,'CAU',1),
(731,47,'CES',1),
(732,47,'CHO',1),
(733,47,'COR',1),
(734,47,'CUN',1),
(735,47,'GNA',1),
(736,47,'GJR',1),
(737,47,'GUV',1),
(738,47,'HUI',1),
(739,47,'MAG',1),
(740,47,'MET',1),
(741,47,'NAR',1),
(742,47,'NSA',1),
(743,47,'PUT',1),
(744,47,'QUI',1),
(745,47,'RIS',1),
(746,47,'SAP',1),
(747,47,'SAN',1),
(748,47,'SUC',1),
(749,47,'TOL',1),
(750,47,'VAC',1),
(751,47,'VAU',1),
(752,47,'VID',1),
(753,48,'G',1),
(754,48,'A',1),
(755,48,'M',1),
(756,49,'BO',1),
(757,49,'BR',1),
(758,49,'CU',1),
(759,49,'CO',1),
(760,49,'KO',1),
(761,49,'LE',1),
(762,49,'LI',1),
(763,49,'NI',1),
(764,49,'PL',1),
(765,49,'PO',1),
(766,49,'SA',1),
(767,50,'PU',1),
(768,50,'RK',1),
(769,50,'MK',1),
(770,50,'PE',1),
(771,50,'NI',1),
(772,50,'SU',1),
(773,50,'PA',1),
(774,50,'AI',1),
(775,50,'MA',1),
(776,50,'TA',1),
(777,50,'MT',1),
(778,50,'AT',1),
(779,50,'MU',1),
(780,50,'RR',1),
(781,50,'MG',1),
(782,51,'AL',1),
(783,51,'CA',1),
(784,51,'GU',1),
(785,51,'HE',1),
(786,51,'LI',1),
(787,51,'PU',1),
(788,51,'SJ',1),
(789,52,'ABE',1),
(790,52,'ABI',1),
(791,52,'ABO',1),
(792,52,'ADI',1),
(793,52,'ADZ',1),
(794,52,'AGB',1),
(795,52,'AGN',1),
(796,52,'ALE',1),
(797,52,'BOC',1),
(798,52,'BAN',1),
(799,52,'BEO',1),
(800,52,'BIA',1),
(801,52,'BDK',1),
(802,52,'BGN',1),
(803,52,'BFL',1),
(804,52,'BKE',1),
(805,52,'BNA',1),
(806,52,'BDL',1),
(807,52,'DKL',1),
(808,52,'DBU',1),
(809,52,'DAL',1),
(810,52,'DAN',1),
(811,52,'DAO',1),
(812,52,'DIM',1),
(813,52,'DIV',1),
(814,52,'DUE',1),
(815,52,'FER',1),
(816,52,'GAG',1),
(817,52,'GBA',1),
(818,52,'GLA',1),
(819,52,'GUI',1),
(820,52,'ISS',1),
(821,52,'JAC',1),
(822,52,'KAT',1),
(823,52,'KOR',1),
(824,52,'LAK',1),
(825,52,'MAN',1),
(826,52,'MKN',1),
(827,52,'MBA',1),
(828,52,'ODI',1),
(829,52,'OUM',1),
(830,52,'SAK',1),
(831,52,'SPE',1),
(832,52,'SAS',1),
(833,52,'SEG',1),
(834,52,'SIN',1),
(835,52,'SOU',1),
(836,52,'TAB',1),
(837,52,'TAN',1),
(838,52,'TIE',1),
(839,52,'TIN',1),
(840,52,'TIA',1),
(841,52,'TBA',1),
(842,52,'TLP',1),
(843,52,'TMD',1),
(844,52,'VAV',1),
(845,52,'YAM',1),
(846,52,'ZUE',1),
(847,53,'BB',1),
(848,53,'GZ',1),
(849,53,'DN',1),
(850,53,'IS',1),
(851,53,'KA',1),
(852,53,'KK',1),
(853,53,'KZ',1),
(854,53,'LS',1),
(855,53,'ME',1),
(856,53,'OB',1),
(857,53,'PS',1),
(858,53,'PG',1),
(859,53,'SK',1),
(860,53,'SM',1),
(861,53,'BP',1),
(862,53,'SD',1),
(863,53,'VA',1),
(864,53,'VP',1),
(865,53,'VS',1),
(866,53,'ZA',1),
(867,53,'ZG',1),
(868,54,'CA',1),
(869,54,'CD',1),
(870,54,'CI',1),
(871,54,'CH',1),
(872,54,'GR',1),
(873,54,'GU',1),
(874,54,'HO',1),
(875,54,'IJ',1),
(876,54,'LH',1),
(877,54,'LT',1),
(878,54,'MA',1),
(879,54,'PR',1),
(880,54,'SS',1),
(881,54,'SC',1),
(882,54,'VC',1),
(883,55,'F',1),
(884,55,'K',1),
(885,55,'A',1),
(886,55,'I',1),
(887,55,'N',1),
(888,55,'P',1),
(889,56,'U',1),
(890,56,'C',1),
(891,56,'B',1),
(892,56,'K',1),
(893,56,'H',1),
(894,56,'L',1),
(895,56,'T',1),
(896,56,'M',1),
(897,56,'E',1),
(898,56,'P',1),
(899,56,'A',1),
(900,56,'S',1),
(901,56,'J',1),
(902,56,'Z',1),
(903,57,'81',1),
(904,57,'82',1),
(905,57,'83',1),
(906,57,'FO',1),
(907,57,'84',1),
(908,57,'85',1),
(919,58,'S',1),
(920,58,'K',1),
(921,58,'J',1),
(922,58,'O',1),
(923,58,'T',1),
(924,59,'AND',1),
(925,59,'DAV',1),
(926,59,'GEO',1),
(927,59,'JOH',1),
(928,59,'JOS',1),
(929,59,'LUK',1),
(930,59,'MAR',1),
(931,59,'PAT',1),
(932,59,'PAU',1),
(933,59,'PET',1),
(934,60,'DN',1),
(935,60,'AZ',1),
(936,60,'BC',1),
(937,60,'BH',1),
(938,60,'DJ',1),
(939,60,'DU',1),
(940,60,'EL',1),
(941,60,'SY',1),
(942,60,'ET',1),
(943,60,'HM',1),
(944,60,'IN',1),
(945,60,'AL',1),
(946,60,'RO',1),
(947,60,'VE',1),
(948,60,'MT',1),
(949,60,'MN',1),
(950,60,'MC',1),
(951,60,'MP',1),
(952,60,'PD',1),
(953,60,'PR',1),
(954,60,'PP',1),
(955,60,'SL',1),
(956,60,'SM',1),
(957,60,'SH',1),
(958,60,'SC',1),
(959,60,'JO',1),
(960,60,'SJ',1),
(961,60,'PM',1),
(962,60,'SA',1),
(963,60,'ST',1),
(964,60,'SD',1),
(965,60,'VA',1),
(966,61,'AL',1),
(967,61,'AN',1),
(968,61,'BA',1),
(969,61,'BO',1),
(970,61,'CO',1),
(971,61,'DI',1),
(972,61,'ER',1),
(973,61,'LA',1),
(974,61,'LI',1),
(975,61,'MT',1),
(976,61,'MF',1),
(977,61,'OE',1),
(978,61,'VI',1),
(979,62,'AZU',1),
(980,62,'BOL',1),
(981,62,'CAN',1),
(982,62,'CAR',1),
(983,62,'CHI',1),
(984,62,'COT',1),
(985,62,'EOR',1),
(986,62,'ESM',1),
(987,62,'GPS',1),
(988,62,'GUA',1),
(989,62,'IMB',1),
(990,62,'LOJ',1),
(991,62,'LRO',1),
(992,62,'MAN',1),
(993,62,'MSA',1),
(994,62,'NAP',1),
(995,62,'ORE',1),
(996,62,'PAS',1),
(997,62,'PIC',1),
(998,62,'SUC',1),
(999,62,'TUN',1),
(1000,62,'ZCH',1),
(1001,63,'DHY',1),
(1002,63,'BAM',1),
(1003,63,'BHY',1),
(1004,63,'FYM',1),
(1005,63,'GBY',1),
(1006,63,'IDR',1),
(1007,63,'IML',1),
(1008,63,'JZH',1),
(1009,63,'MFY',1),
(1010,63,'MNY',1),
(1011,63,'QHR',1),
(1012,63,'QLY',1),
(1013,63,'WJD',1),
(1014,63,'SHQ',1),
(1015,63,'SWY',1),
(1016,63,'ASW',1),
(1017,63,'ASY',1),
(1018,63,'BSW',1),
(1019,63,'BSD',1),
(1020,63,'DMY',1),
(1021,63,'JNS',1),
(1022,63,'KSH',1),
(1023,63,'MAT',1),
(1024,63,'QIN',1),
(1025,63,'SHS',1),
(1026,63,'SUH',1),
(1027,64,'AH',1),
(1028,64,'CA',1),
(1029,64,'CH',1),
(1030,64,'CU',1),
(1031,64,'LB',1),
(1032,64,'PZ',1),
(1033,64,'UN',1),
(1034,64,'MO',1),
(1035,64,'SM',1),
(1036,64,'SS',1),
(1037,64,'SV',1),
(1038,64,'SA',1),
(1039,64,'SO',1),
(1040,64,'US',1),
(1041,65,'AN',1),
(1042,65,'BN',1),
(1043,65,'BS',1),
(1044,65,'CS',1),
(1045,65,'KN',1),
(1046,65,'LI',1),
(1047,65,'WN',1),
(1048,66,'MA',1),
(1049,66,'KE',1),
(1050,66,'DK',1),
(1051,66,'SK',1),
(1052,66,'DE',1),
(1053,66,'BR',1),
(1054,67,'HA',1),
(1055,67,'HI',1),
(1056,67,'IV',1),
(1057,67,'JA',1),
(1058,67,'JO',1),
(1059,67,'LV',1),
(1060,67,'LA',1),
(1061,67,'PA',1),
(1062,67,'PO',1),
(1063,67,'RA',1),
(1064,67,'SA',1),
(1065,67,'TA',1),
(1066,67,'VA',1),
(1067,67,'VI',1),
(1068,67,'VO',1),
(1069,68,'AF',1),
(1070,68,'AH',1),
(1071,68,'BG',1),
(1072,68,'GB',1),
(1073,68,'HR',1),
(1074,68,'OR',1),
(1075,68,'SM',1),
(1076,68,'SN',1),
(1077,68,'TG',1),
(1078,68,'AA',1),
(1079,68,'DD',1),
(1080,71,'C',1),
(1081,71,'N',1),
(1082,71,'E',1),
(1083,71,'W',1),
(1084,71,'R',1),
(1085,72,'AL',1),
(1086,72,'ES',1),
(1087,72,'IS',1),
(1088,72,'LS',1),
(1089,72,'LA',1),
(1090,72,'OU',1),
(1114,74,'01',1),
(1115,74,'02',1),
(1116,74,'03',1),
(1117,74,'04',1),
(1118,74,'05',1),
(1119,74,'06',1),
(1120,74,'07',1),
(1121,74,'08',1),
(1122,74,'09',1),
(1123,74,'10',1),
(1124,74,'11',1),
(1125,74,'12',1),
(1126,74,'13',1),
(1127,74,'14',1),
(1128,74,'15',1),
(1129,74,'16',1),
(1130,74,'17',1),
(1131,74,'18',1),
(1132,74,'19',1),
(1133,74,'2A',1),
(1134,74,'2B',1),
(1135,74,'21',1),
(1136,74,'22',1),
(1137,74,'23',1),
(1138,74,'24',1),
(1139,74,'25',1),
(1140,74,'26',1),
(1141,74,'27',1),
(1142,74,'28',1),
(1143,74,'29',1),
(1144,74,'30',1),
(1145,74,'31',1),
(1146,74,'32',1),
(1147,74,'33',1),
(1148,74,'34',1),
(1149,74,'35',1),
(1150,74,'36',1),
(1151,74,'37',1),
(1152,74,'38',1),
(1153,74,'39',1),
(1154,74,'40',1),
(1155,74,'41',1),
(1156,74,'42',1),
(1157,74,'43',1),
(1158,74,'44',1),
(1159,74,'45',1),
(1160,74,'46',1),
(1161,74,'47',1),
(1162,74,'48',1),
(1163,74,'49',1),
(1164,74,'50',1),
(1165,74,'51',1),
(1166,74,'52',1),
(1167,74,'53',1),
(1168,74,'54',1),
(1169,74,'55',1),
(1170,74,'56',1),
(1171,74,'57',1),
(1172,74,'58',1),
(1173,74,'59',1),
(1174,74,'60',1),
(1175,74,'61',1),
(1176,74,'62',1),
(1177,74,'63',1),
(1178,74,'64',1),
(1179,74,'65',1),
(1180,74,'66',1),
(1181,74,'67',1),
(1182,74,'68',1),
(1183,74,'69',1),
(1184,74,'70',1),
(1185,74,'71',1),
(1186,74,'72',1),
(1187,74,'73',1),
(1188,74,'74',1),
(1189,74,'75',1),
(1190,74,'76',1),
(1191,74,'77',1),
(1192,74,'78',1),
(1193,74,'79',1),
(1194,74,'80',1),
(1195,74,'81',1),
(1196,74,'82',1),
(1197,74,'83',1),
(1198,74,'84',1),
(1199,74,'85',1),
(1200,74,'86',1),
(1201,74,'87',1),
(1202,74,'88',1),
(1203,74,'89',1),
(1204,74,'90',1),
(1205,74,'91',1),
(1206,74,'92',1),
(1207,74,'93',1),
(1208,74,'94',1),
(1209,74,'95',1),
(1210,76,'M',1),
(1211,76,'T',1),
(1212,76,'I',1),
(1213,76,'V',1),
(1214,76,'S',1),
(1215,77,'C',1),
(1216,77,'K',1),
(1217,77,'A',1),
(1218,77,'P',1),
(1219,77,'D',1),
(1220,78,'ES',1),
(1221,78,'HO',1),
(1222,78,'MO',1),
(1223,78,'NG',1),
(1224,78,'NY',1),
(1225,78,'OI',1),
(1226,78,'OL',1),
(1227,78,'OM',1),
(1228,78,'WN',1),
(1229,79,'BJ',1),
(1230,79,'BS',1),
(1231,79,'BR',1),
(1232,79,'JA',1),
(1233,79,'KA',1),
(1234,79,'KE',1),
(1235,79,'KU',1),
(1236,79,'MA',1),
(1237,79,'LR',1),
(1238,79,'CR',1),
(1239,79,'NB',1),
(1240,79,'UR',1),
(1241,79,'WE',1),
(1242,80,'AB',1),
(1243,80,'AJ',1),
(1244,80,'TB',1),
(1245,80,'GU',1),
(1246,80,'IM',1),
(1247,80,'KA',1),
(1248,80,'KK',1),
(1249,80,'MM',1),
(1250,80,'RL',1),
(1251,80,'SZ',1),
(1252,80,'SJ',1),
(1253,80,'SK',1),
(1254,81,'BW',1),
(1255,81,'BY',1),
(1256,81,'BE',1),
(1257,81,'BB',1),
(1258,81,'HB',1),
(1259,81,'HH',1),
(1260,81,'HE',1),
(1261,81,'MV',1),
(1262,81,'NI',1),
(1263,81,'NW',1),
(1264,81,'RP',1),
(1265,81,'SL',1),
(1266,81,'SN',1),
(1267,81,'ST',1),
(1268,81,'SH',1),
(1269,81,'TH',1),
(1270,82,'AS',1),
(1271,82,'BA',1),
(1272,82,'CE',1),
(1273,82,'EA',1),
(1274,82,'GA',1),
(1275,82,'NO',1),
(1276,82,'UE',1),
(1277,82,'UW',1),
(1278,82,'VO',1),
(1279,82,'WE',1),
(1280,84,'AT',1),
(1281,84,'CN',1),
(1282,84,'CM',1),
(1283,84,'CR',1),
(1284,84,'EM',1),
(1285,84,'EP',1),
(1286,84,'II',1),
(1287,84,'NA',1),
(1288,84,'PP',1),
(1289,84,'SA',1),
(1290,84,'TH',1),
(1291,84,'WG',1),
(1292,84,'WM',1),
(1293,85,'A',1),
(1294,85,'T',1),
(1295,85,'K',1),
(1296,86,'A',1),
(1297,86,'D',1),
(1298,86,'G',1),
(1299,86,'J',1),
(1300,86,'M',1),
(1301,86,'P',1),
(1302,86,'C',1),
(1303,86,'Q',1),
(1304,89,'AV',1),
(1305,89,'BV',1),
(1306,89,'CM',1),
(1307,89,'CQ',1),
(1308,89,'PE',1),
(1309,89,'PR',1),
(1310,89,'QC',1),
(1311,89,'ES',1),
(1312,89,'GU',1),
(1313,89,'HU',1),
(1314,89,'IZ',1),
(1315,89,'JA',1),
(1316,89,'JU',1),
(1317,89,'QZ',1),
(1318,89,'RE',1),
(1319,89,'ST',1),
(1320,89,'SM',1),
(1321,89,'SR',1),
(1322,89,'SO',1),
(1323,89,'SU',1),
(1324,89,'TO',1),
(1325,89,'ZA',1),
(1326,90,'CNK',1),
(1327,90,'BYL',1),
(1328,90,'BFA',1),
(1329,90,'BOK',1),
(1330,90,'COY',1),
(1331,90,'DBL',1),
(1332,90,'DLB',1),
(1333,90,'DGR',1),
(1334,90,'DBR',1),
(1335,90,'FRN',1),
(1336,90,'FRC',1),
(1337,90,'FRI',1),
(1338,90,'GAO',1),
(1339,90,'GCD',1),
(1340,90,'KNK',1),
(1341,90,'KRN',1),
(1342,90,'KND',1),
(1343,90,'KSD',1),
(1344,90,'KBA',1),
(1345,90,'KDA',1),
(1346,90,'KRA',1),
(1347,90,'LAB',1),
(1348,90,'LLM',1),
(1349,90,'LOL',1),
(1350,90,'MCT',1),
(1351,90,'MAL',1),
(1352,90,'MAM',1),
(1353,90,'MAN',1),
(1354,90,'NZR',1),
(1355,90,'PIT',1),
(1356,90,'SIG',1),
(1357,90,'TLM',1),
(1358,90,'TOG',1),
(1359,90,'YOM',1),
(1360,91,'BF',1),
(1361,91,'BB',1),
(1362,91,'BS',1),
(1363,91,'BL',1),
(1364,91,'CA',1),
(1365,91,'GA',1),
(1366,91,'OI',1),
(1367,91,'QU',1),
(1368,91,'TO',1),
(1369,92,'BW',1),
(1370,92,'CM',1),
(1371,92,'DM',1),
(1372,92,'EC',1),
(1373,92,'EW',1),
(1374,92,'MB',1),
(1375,92,'PM',1),
(1376,92,'PI',1),
(1377,92,'UD',1),
(1378,92,'UT',1),
(1379,93,'AR',1),
(1380,93,'CE',1),
(1381,93,'GA',1),
(1382,93,'ND',1),
(1383,93,'NE',1),
(1384,93,'NO',1),
(1385,93,'OU',1),
(1386,93,'SD',1),
(1387,93,'SE',1),
(1388,94,'F',1),
(1389,94,'M',1),
(1390,94,'S',1),
(1391,94,'H',1),
(1392,95,'AT',1),
(1393,95,'CH',1),
(1394,95,'CL',1),
(1395,95,'CM',1),
(1396,95,'CP',1),
(1397,95,'CR',1),
(1398,95,'PA',1),
(1399,95,'FM',1),
(1400,95,'GD',1),
(1401,95,'IN',1),
(1402,95,'IB',1),
(1403,95,'PZ',1),
(1404,95,'LE',1),
(1405,95,'OC',1),
(1406,95,'OL',1),
(1407,95,'SB',1),
(1408,95,'VA',1),
(1409,95,'YO',1),
(1410,96,'HCW',1),
(1411,96,'HEA',1),
(1412,96,'HSO',1),
(1413,96,'HWC',1),
(1414,96,'KKC',1),
(1415,96,'KKT',1),
(1416,96,'KSS',1),
(1417,96,'KWT',1),
(1418,96,'KYT',1),
(1419,96,'NIS',1),
(1420,96,'NKT',1),
(1421,96,'NNO',1),
(1422,96,'NSK',1),
(1423,96,'NST',1),
(1424,96,'NTP',1),
(1425,96,'NTW',1),
(1426,96,'NTM',1),
(1427,96,'NYL',1),
(1467,98,'AL',1),
(1468,98,'HF',1),
(1469,98,'NE',1),
(1470,98,'NV',1),
(1471,98,'SL',1),
(1472,98,'SN',1),
(1473,98,'VF',1),
(1474,98,'VL',1),
(1475,99,'AN',1),
(1476,99,'AP',1),
(1477,99,'AR',1),
(1478,99,'AS',1),
(1479,99,'BR',1),
(1480,99,'CH',1),
(1481,99,'DH',1),
(1483,99,'DL',1),
(1484,99,'GA',1),
(1485,99,'GJ',1),
(1486,99,'HR',1),
(1487,99,'HP',1),
(1488,99,'JK',1),
(1489,99,'KA',1),
(1490,99,'KL',1),
(1491,99,'LD',1),
(1492,99,'MP',1),
(1493,99,'MH',1),
(1494,99,'MN',1),
(1495,99,'ML',1),
(1496,99,'MZ',1),
(1497,99,'NL',1),
(1498,99,'OR',1),
(1499,99,'PY',1),
(1500,99,'PB',1),
(1501,99,'RJ',1),
(1502,99,'SK',1),
(1503,99,'TN',1),
(1504,99,'TR',1),
(1505,99,'UP',1),
(1506,99,'WB',1),
(1507,100,'AC',1),
(1508,100,'BA',1),
(1509,100,'BT',1),
(1510,100,'BE',1),
(1511,100,'BD',1),
(1512,100,'GO',1),
(1513,100,'JK',1),
(1514,100,'JA',1),
(1515,100,'JB',1),
(1516,100,'JT',1),
(1517,100,'JI',1),
(1518,100,'KB',1),
(1519,100,'KS',1),
(1520,100,'KT',1),
(1521,100,'KI',1),
(1522,100,'BB',1),
(1523,100,'LA',1),
(1524,100,'MA',1),
(1525,100,'MU',1),
(1526,100,'NB',1),
(1527,100,'NT',1),
(1528,100,'PA',1),
(1529,100,'RI',1),
(1530,100,'SN',1),
(1531,100,'ST',1),
(1532,100,'SG',1),
(1533,100,'SA',1),
(1534,100,'SB',1),
(1535,100,'SS',1),
(1536,100,'SU',1),
(1537,100,'YO',1),
(1538,101,'TEH',1),
(1539,101,'QOM',1),
(1540,101,'MKZ',1),
(1541,101,'QAZ',1),
(1542,101,'GIL',1),
(1543,101,'ARD',1),
(1544,101,'ZAN',1),
(1545,101,'EAZ',1),
(1546,101,'WEZ',1),
(1547,101,'KRD',1),
(1548,101,'HMD',1),
(1549,101,'KRM',1),
(1550,101,'ILM',1),
(1551,101,'LRS',1),
(1552,101,'KZT',1),
(1553,101,'CMB',1),
(1554,101,'KBA',1),
(1555,101,'BSH',1),
(1556,101,'FAR',1),
(1557,101,'HRM',1),
(1558,101,'SBL',1),
(1559,101,'KRB',1),
(1560,101,'YZD',1),
(1561,101,'EFH',1),
(1562,101,'SMN',1),
(1563,101,'MZD',1),
(1564,101,'GLS',1),
(1565,101,'NKH',1),
(1566,101,'RKH',1),
(1567,101,'SKH',1),
(1568,102,'BD',1),
(1569,102,'SD',1),
(1570,102,'DY',1),
(1571,102,'WS',1),
(1572,102,'MY',1),
(1573,102,'BA',1),
(1574,102,'DQ',1),
(1575,102,'MU',1),
(1576,102,'QA',1),
(1577,102,'BB',1),
(1578,102,'KB',1),
(1579,102,'NJ',1),
(1580,102,'AB',1),
(1581,102,'NN',1),
(1582,102,'DH',1),
(1583,102,'AL',1),
(1584,102,'KI',1),
(1585,102,'SL',1),
(1586,103,'CA',1),
(1587,103,'CV',1),
(1588,103,'CL',1),
(1589,103,'CO',1),
(1590,103,'DO',1),
(1591,103,'DU',1),
(1592,103,'GA',1),
(1593,103,'KE',1),
(1594,103,'KI',1),
(1595,103,'KL',1),
(1596,103,'LA',1),
(1597,103,'LE',1),
(1598,103,'LI',1),
(1599,103,'LO',1),
(1600,103,'LU',1),
(1601,103,'MA',1),
(1602,103,'ME',1),
(1603,103,'MO',1),
(1604,103,'OF',1),
(1605,103,'RO',1),
(1606,103,'SL',1),
(1607,103,'TI',1),
(1608,103,'WA',1),
(1609,103,'WE',1),
(1610,103,'WX',1),
(1611,103,'WI',1),
(1612,104,'BS',1),
(1613,104,'BH',1),
(1614,104,'EA',1),
(1615,104,'GA',1),
(1616,104,'HA',1),
(1617,104,'JM',1),
(1618,104,'JE',1),
(1619,104,'NE',1),
(1620,104,'SE',1),
(1621,104,'SH',1),
(1622,104,'TA',1),
(1643,106,'CLA',1),
(1644,106,'HAN',1),
(1645,106,'KIN',1),
(1646,106,'MAN',1),
(1647,106,'POR',1),
(1648,106,'AND',1),
(1649,106,'ANN',1),
(1650,106,'CAT',1),
(1651,106,'ELI',1),
(1652,106,'JAM',1),
(1653,106,'MAR',1),
(1654,106,'THO',1),
(1655,106,'TRL',1),
(1656,106,'WML',1),
(1657,107,'AI',1),
(1658,107,'AK',1),
(1659,107,'AO',1),
(1660,107,'CH',1),
(1661,107,'EH',1),
(1662,107,'FK',1),
(1663,107,'FU',1),
(1664,107,'FS',1),
(1665,107,'GI',1),
(1666,107,'GU',1),
(1667,107,'HI',1),
(1668,107,'HO',1),
(1669,107,'HY',1),
(1670,107,'IB',1),
(1671,107,'IS',1),
(1672,107,'IW',1),
(1673,107,'KA',1),
(1674,107,'KG',1),
(1675,107,'KN',1),
(1676,107,'KO',1),
(1677,107,'KU',1),
(1678,107,'KY',1),
(1679,107,'MI',1),
(1680,107,'MY',1),
(1681,107,'MZ',1),
(1682,107,'NA',1),
(1683,107,'NG',1),
(1684,107,'NR',1),
(1685,107,'NI',1),
(1686,107,'OI',1),
(1687,107,'OK',1),
(1688,107,'ON',1),
(1689,107,'OS',1),
(1690,107,'SA',1),
(1691,107,'SI',1),
(1692,107,'SH',1),
(1693,107,'SM',1),
(1694,107,'SZ',1),
(1695,107,'TO',1),
(1696,107,'TS',1),
(1697,107,'TK',1),
(1698,107,'TT',1),
(1699,107,'TY',1),
(1700,107,'WA',1),
(1701,107,'YA',1),
(1702,107,'YM',1),
(1703,107,'YN',1),
(1704,108,'AM',1),
(1705,108,'AJ',1),
(1706,108,'AA',1),
(1707,108,'AB',1),
(1708,108,'AK',1),
(1709,108,'AL',1),
(1710,108,'AT',1),
(1711,108,'AZ',1),
(1712,108,'IR',1),
(1713,108,'JA',1),
(1714,108,'MA',1),
(1715,108,'MD',1),
(1716,109,'AL',1),
(1717,109,'AC',1),
(1718,109,'AM',1),
(1719,109,'AQ',1),
(1720,109,'AS',1),
(1721,109,'AT',1),
(1722,109,'BA',1),
(1723,109,'BY',1),
(1724,109,'MA',1),
(1725,109,'ON',1),
(1726,109,'PA',1),
(1727,109,'QA',1),
(1728,109,'QO',1),
(1729,109,'QY',1),
(1730,109,'SH',1),
(1731,109,'SO',1),
(1732,109,'ZH',1),
(1733,110,'CE',1),
(1734,110,'CO',1),
(1735,110,'EA',1),
(1736,110,'NA',1),
(1737,110,'NE',1),
(1738,110,'NY',1),
(1739,110,'RV',1),
(1740,110,'WE',1),
(1741,111,'AG',1),
(1742,111,'AM',1),
(1743,111,'AK',1),
(1744,111,'AO',1),
(1745,111,'BA',1),
(1746,111,'BE',1),
(1747,111,'bT',1),
(1748,111,'KA',1),
(1749,111,'KR',1),
(1750,111,'KU',1),
(1751,111,'MI',1),
(1752,111,'MN',1),
(1753,111,'ME',1),
(1754,111,'NI',1),
(1755,111,'NO',1),
(1756,111,'ON',1),
(1757,111,'TT',1),
(1758,111,'TR',1),
(1759,111,'TM',1),
(1760,111,'TW',1),
(1761,111,'TE',1),
(1762,112,'CHA',1),
(1763,112,'HAB',1),
(1764,112,'HAN',1),
(1765,112,'HWB',1),
(1766,112,'HWN',1),
(1767,112,'KAN',1),
(1768,112,'PYB',1),
(1769,112,'PYN',1),
(1770,112,'YAN',1),
(1771,112,'NAJ',1),
(1772,112,'PYO',1),
(1788,114,'AL',1),
(1789,114,'AA',1),
(1790,114,'AF',1),
(1791,114,'AJ',1),
(1792,114,'HA',1),
(1793,115,'GB',1),
(1794,115,'B',1),
(1795,115,'C',1),
(1796,115,'J',1),
(1797,115,'N',1),
(1798,115,'O',1),
(1799,115,'T',1),
(1800,115,'Y',1),
(1801,116,'VT',1),
(1802,116,'AT',1),
(1803,116,'BK',1),
(1804,116,'BL',1),
(1805,116,'CH',1),
(1806,116,'HO',1),
(1807,116,'KH',1),
(1808,116,'LM',1),
(1809,116,'LP',1),
(1810,116,'OU',1),
(1811,116,'PH',1),
(1812,116,'SL',1),
(1813,116,'SV',1),
(1814,116,'VI',1),
(1815,116,'XA',1),
(1816,116,'XE',1),
(1817,116,'XI',1),
(1818,116,'XN',1),
(1852,119,'BE',1),
(1853,119,'BB',1),
(1854,119,'LE',1),
(1855,119,'MF',1),
(1856,119,'MS',1),
(1857,119,'MH',1),
(1858,119,'MK',1),
(1859,119,'QN',1),
(1860,119,'QT',1),
(1861,119,'TT',1),
(1862,120,'BI',1),
(1863,120,'BG',1),
(1864,120,'GB',1),
(1865,120,'CM',1),
(1866,120,'GG',1),
(1867,120,'GK',1),
(1868,120,'LO',1),
(1869,120,'MG',1),
(1870,120,'ML',1),
(1871,120,'MS',1),
(1872,120,'NB',1),
(1873,120,'RC',1),
(1874,120,'SN',1),
(1875,121,'AJ',1),
(1876,121,'AZ',1),
(1877,121,'FA',1),
(1878,121,'JA',1),
(1879,121,'JU',1),
(1880,121,'KH',1),
(1881,121,'KU',1),
(1882,121,'NK',1),
(1883,121,'AS',1),
(1884,121,'AW',1),
(1885,121,'ZA',1),
(1886,121,'BA',1),
(1887,121,'DA',1),
(1888,121,'GD',1),
(1889,121,'GY',1),
(1890,121,'MI',1),
(1891,121,'MZ',1),
(1892,121,'SB',1),
(1893,121,'SW',1),
(1894,121,'SU',1),
(1895,121,'TL',1),
(1896,121,'TH',1),
(1897,121,'TU',1),
(1898,121,'YA',1),
(1899,121,'ZL',1),
(1900,122,'V',1),
(1901,122,'A',1),
(1902,122,'B',1),
(1903,122,'N',1),
(1904,122,'E',1),
(1905,122,'M',1),
(1906,122,'T',1),
(1907,122,'R',1),
(1908,122,'G',1),
(1909,122,'L',1),
(1910,122,'P',1),
(1911,123,'AL',1),
(1912,123,'KA',1),
(1913,123,'KL',1),
(1914,123,'MA',1),
(1915,123,'PA',1),
(1916,123,'SI',1),
(1917,123,'TA',1),
(1918,123,'TE',1),
(1919,123,'UT',1),
(1920,123,'VI',1),
(1921,124,'DD',1),
(1922,124,'DC',1),
(1923,124,'DR',1),
(1924,124,'DV',1),
(1925,124,'DW',1),
(1926,124,'GG',1),
(1927,124,'GE',1),
(1928,124,'GR',1),
(1929,124,'LL',1),
(1930,124,'LC',1),
(1931,124,'LE',1),
(1932,124,'LM',1),
(1933,125,'OLF',1),
(1934,125,'ANT',1),
(1935,125,'LAZ',1),
(1936,125,'CAT',1),
(1937,125,'LAW',1),
(1938,127,'AN',1),
(1939,127,'AS',1),
(1940,127,'FN',1),
(1941,127,'MJ',1),
(1942,127,'TM',1),
(1943,127,'TL',1),
(1944,128,'BLK',1),
(1945,128,'BLT',1),
(1946,128,'CKW',1),
(1947,128,'CRD',1),
(1948,128,'CTP',1),
(1949,128,'DDZ',1),
(1950,128,'DWA',1),
(1951,128,'KRG',1),
(1952,128,'KSG',1),
(1953,128,'LKM',1),
(1954,128,'LLG',1),
(1955,128,'MCG',1),
(1956,128,'MGC',1),
(1957,128,'MCH',1),
(1958,128,'MLJ',1),
(1959,128,'MWZ',1),
(1960,128,'MZM',1),
(1961,128,'NTU',1),
(1962,128,'NKB',1),
(1963,128,'NKH',1),
(1964,128,'NSJ',1),
(1965,128,'NTI',1),
(1966,128,'PHL',1),
(1967,128,'RMP',1),
(1968,128,'SLM',1),
(1969,128,'THY',1),
(1970,128,'ZBA',1),
(1971,129,'MY-01',1),
(1972,129,'MY-02',1),
(1973,129,'MY-03',1),
(1974,129,'MY-15',1),
(1975,129,'MY-04',1),
(1976,129,'MY-05',1),
(1977,129,'MY-06',1),
(1978,129,'MY-08',1),
(1979,129,'MY-09',1),
(1980,129,'MY-07',1),
(1981,129,'MY-12',1),
(1982,129,'MY-13',1),
(1983,129,'MY-10',1),
(1984,129,'MY-11',1),
(1985,129,'MY-14',1),
(1986,130,'THU',1),
(1987,130,'THD',1),
(1988,130,'MLU',1),
(1989,130,'MLD',1),
(1990,130,'MAU',1),
(1991,130,'MAD',1),
(1992,130,'FAA',1),
(1993,130,'MAA',1),
(1994,130,'AAU',1),
(1995,130,'AAD',1),
(1996,130,'FEA',1),
(1997,130,'MUA',1),
(1998,130,'NAU',1),
(1999,130,'NAD',1),
(2000,130,'KLH',1),
(2001,130,'HDH',1),
(2002,130,'HAU',1),
(2003,130,'HAD',1),
(2004,130,'FMU',1),
(2005,130,'ADD',1),
(2006,131,'GA',1),
(2007,131,'KY',1),
(2008,131,'KD',1),
(2009,131,'KL',1),
(2010,131,'MP',1),
(2011,131,'SG',1),
(2012,131,'SK',1),
(2013,131,'TB',1),
(2014,131,'CD',1),
(2015,132,'ATT',1),
(2016,132,'BAL',1),
(2017,132,'BGU',1),
(2018,132,'BKK',1),
(2019,132,'BRZ',1),
(2020,132,'BOR',1),
(2021,132,'DIN',1),
(2022,132,'FGU',1),
(2023,132,'FLO',1),
(2024,132,'GDJ',1),
(2025,132,'GZR',1),
(2026,132,'GRG',1),
(2027,132,'GXQ',1),
(2028,132,'HMR',1),
(2029,132,'IKL',1),
(2030,132,'ISL',1),
(2031,132,'KLK',1),
(2032,132,'KRK',1),
(2033,132,'LIJ',1),
(2034,132,'LUQ',1),
(2035,132,'MRS',1),
(2036,132,'MKL',1),
(2037,132,'MXL',1),
(2038,132,'MDN',1),
(2039,132,'MEL',1),
(2040,132,'MGR',1),
(2041,132,'MST',1),
(2042,132,'MQA',1),
(2043,132,'MSI',1),
(2044,132,'MTF',1),
(2045,132,'NAX',1),
(2046,132,'PAO',1),
(2047,132,'PEM',1),
(2048,132,'PIE',1),
(2049,132,'QOR',1),
(2050,132,'QRE',1),
(2051,132,'RAB',1),
(2052,132,'SAF',1),
(2053,132,'SGI',1),
(2054,132,'SLU',1),
(2055,132,'SPB',1),
(2056,132,'SGW',1),
(2057,132,'SVE',1),
(2058,132,'SIG',1),
(2059,132,'SLM',1),
(2060,132,'SWQ',1),
(2061,132,'TXB',1),
(2062,132,'TRX',1),
(2063,132,'VLT',1),
(2064,132,'XGJ',1),
(2065,132,'ZBR',1),
(2066,132,'ZBG',1),
(2067,132,'ZJT',1),
(2068,132,'ZRQ',1),
(2069,132,'FNT',1),
(2070,132,'GHJ',1),
(2071,132,'GHR',1),
(2072,132,'GHS',1),
(2073,132,'KRC',1),
(2074,132,'MUN',1),
(2075,132,'NAD',1),
(2076,132,'QAL',1),
(2077,132,'VIC',1),
(2078,132,'SLA',1),
(2079,132,'SNT',1),
(2080,132,'ZAG',1),
(2081,132,'XEW',1),
(2082,132,'ZEB',1),
(2083,133,'ALG',1),
(2084,133,'ALL',1),
(2085,133,'ALK',1),
(2086,133,'ARN',1),
(2087,133,'AUR',1),
(2088,133,'BKR',1),
(2089,133,'BKN',1),
(2090,133,'BKK',1),
(2091,133,'EBN',1),
(2092,133,'ENT',1),
(2093,133,'EKB',1),
(2094,133,'JBT',1),
(2095,133,'JLT',1),
(2096,133,'JEM',1),
(2097,133,'KIL',1),
(2098,133,'KWJ',1),
(2099,133,'LAE',1),
(2100,133,'LIB',1),
(2101,133,'LKP',1),
(2102,133,'MJR',1),
(2103,133,'MLP',1),
(2104,133,'MJT',1),
(2105,133,'MIL',1),
(2106,133,'NMK',1),
(2107,133,'NAM',1),
(2108,133,'RGL',1),
(2109,133,'RGK',1),
(2110,133,'TOK',1),
(2111,133,'UJA',1),
(2112,133,'UJL',1),
(2113,133,'UTK',1),
(2114,133,'WTH',1),
(2115,133,'WTJ',1),
(2116,135,'AD',1),
(2117,135,'AS',1),
(2118,135,'BR',1),
(2119,135,'DN',1),
(2120,135,'GO',1),
(2121,135,'GM',1),
(2122,135,'HC',1),
(2123,135,'HG',1),
(2124,135,'IN',1),
(2125,135,'TA',1),
(2126,135,'TZ',1),
(2127,135,'TR',1),
(2128,135,'NO',1),
(2129,136,'BR',1),
(2130,136,'CU',1),
(2131,136,'PU',1),
(2132,136,'QB',1),
(2133,136,'VP',1),
(2134,136,'AG',1),
(2135,136,'CC',1),
(2136,136,'RO',1),
(2137,136,'BL',1),
(2138,136,'FL',1),
(2139,136,'GP',1),
(2140,136,'MO',1),
(2141,136,'PA',1),
(2142,136,'PW',1),
(2143,136,'PL',1),
(2144,136,'RR',1),
(2145,136,'SA',1),
(2146,138,'BCN',1),
(2147,138,'BCS',1),
(2148,138,'CAM',1),
(2149,138,'CHP',1),
(2150,138,'CHH',1),
(2151,138,'COA',1),
(2152,138,'COL',1),
(2153,138,'CMX',1),
(2154,138,'DUR',1),
(2155,138,'GUA',1),
(2156,138,'GRO',1),
(2157,138,'HID',1),
(2158,138,'JAL',1),
(2159,138,'MEX',1),
(2160,138,'MIC',1),
(2161,138,'MOR',1),
(2162,138,'NAY',1),
(2163,138,'NLE',1),
(2164,138,'OAX',1),
(2165,138,'PUE',1),
(2166,138,'QUE',1),
(2167,138,'ROO',1),
(2168,138,'SLP',1),
(2169,138,'SIN',1),
(2170,138,'SON',1),
(2171,138,'TAB',1),
(2172,138,'TAM',1),
(2173,138,'TLA',1),
(2174,138,'VER',1),
(2175,138,'YUC',1),
(2176,138,'ZAC',1),
(2177,139,'C',1),
(2178,139,'K',1),
(2179,139,'P',1),
(2180,139,'Y',1),
(2181,140,'GA',1),
(2182,140,'CU',1),
(2183,140,'BA',1),
(2184,140,'CA',1),
(2185,140,'ED',1),
(2186,140,'LA',1),
(2187,140,'OR',1),
(2188,140,'SO',1),
(2189,140,'TI',1),
(2190,140,'UN',1),
(2191,140,'SN',1),
(2192,141,'FV',1),
(2193,141,'LC',1),
(2194,141,'MV',1),
(2195,141,'MC',1),
(2196,142,'1',1),
(2197,142,'035',1),
(2198,142,'037',1),
(2199,142,'039',1),
(2200,142,'041',1),
(2201,142,'043',1),
(2202,142,'046',1),
(2203,142,'047',1),
(2204,142,'049',1),
(2205,142,'051',1),
(2206,142,'053',1),
(2207,142,'055',1),
(2208,142,'057',1),
(2209,142,'059',1),
(2210,142,'061',1),
(2211,142,'063',1),
(2212,142,'064',1),
(2213,142,'065',1),
(2214,142,'067',1),
(2215,142,'069',1),
(2216,142,'071',1),
(2217,142,'073',1),
(2218,143,'A',1),
(2219,143,'G',1),
(2220,143,'P',1),
(2221,144,'AGD',1),
(2222,144,'HOC',1),
(2223,144,'AZI',1),
(2224,144,'BME',1),
(2225,144,'BSL',1),
(2226,144,'BLM',1),
(2227,144,'CBL',1),
(2228,144,'CHA',1),
(2229,144,'EJA',1),
(2230,144,'EKS',1),
(2231,144,'ERA',1),
(2232,144,'ESS',1),
(2233,144,'FES',1),
(2234,144,'FIG',1),
(2235,144,'GLM',1),
(2236,144,'IFR',1),
(2237,144,'KEN',1),
(2238,144,'KHM',1),
(2239,144,'KHN',1),
(2240,144,'KHO',1),
(2241,144,'LYN',1),
(2242,144,'LAR',1),
(2243,144,'MRK',1),
(2244,144,'MKN',1),
(2245,144,'NAD',1),
(2246,144,'ORZ',1),
(2247,144,'OUJ',1),
(2248,144,'RSA',1),
(2249,144,'SAF',1),
(2250,144,'SET',1),
(2251,144,'SKA',1),
(2252,144,'TGR',1),
(2253,144,'TAN',1),
(2254,144,'TAO',1),
(2255,144,'TRD',1),
(2256,144,'TAT',1),
(2257,144,'TAZ',1),
(2258,144,'TET',1),
(2259,144,'TIZ',1),
(2260,144,'ADK',1),
(2261,144,'BJD',1),
(2262,144,'ESM',1),
(2263,145,'CD',1),
(2264,145,'GZ',1),
(2265,145,'IN',1),
(2266,145,'MN',1),
(2267,145,'MC',1),
(2268,145,'MP',1),
(2269,145,'NA',1),
(2270,145,'NI',1),
(2271,145,'SO',1),
(2272,145,'TE',1),
(2273,145,'ZA',1),
(2274,146,'AY',1),
(2275,146,'BG',1),
(2276,146,'MG',1),
(2277,146,'MD',1),
(2278,146,'SG',1),
(2279,146,'TN',1),
(2280,146,'YG',1),
(2281,146,'CH',1),
(2282,146,'KC',1),
(2283,146,'KH',1),
(2284,146,'KN',1),
(2285,146,'MN',1),
(2286,146,'RK',1),
(2287,146,'SH',1),
(2288,147,'CA',1),
(2289,147,'ER',1),
(2290,147,'HA',1),
(2291,147,'KR',1),
(2292,147,'KV',1),
(2293,147,'KH',1),
(2294,147,'KU',1),
(2295,147,'OW',1),
(2296,147,'OK',1),
(2297,147,'OT',1),
(2298,147,'ON',1),
(2299,147,'OO',1),
(2300,147,'OJ',1),
(2301,148,'AO',1),
(2302,148,'AA',1),
(2303,148,'AT',1),
(2304,148,'AI',1),
(2305,148,'BA',1),
(2306,148,'BO',1),
(2307,148,'BU',1),
(2308,148,'DE',1),
(2309,148,'EW',1),
(2310,148,'IJ',1),
(2311,148,'ME',1),
(2312,148,'NI',1),
(2313,148,'UA',1),
(2314,148,'YA',1),
(2315,149,'BA',1),
(2316,149,'BH',1),
(2317,149,'DH',1),
(2318,149,'GA',1),
(2319,149,'JA',1),
(2320,149,'KA',1),
(2321,149,'KO',1),
(2322,149,'LU',1),
(2323,149,'MA',1),
(2324,149,'ME',1),
(2325,149,'NA',1),
(2326,149,'RA',1),
(2327,149,'SA',1),
(2328,149,'SE',1),
(2329,150,'DR',1),
(2330,150,'FL',1),
(2331,150,'FR',1),
(2332,150,'GE',1),
(2333,150,'GR',1),
(2334,150,'LI',1),
(2335,150,'NB',1),
(2336,150,'NH',1),
(2337,150,'OV',1),
(2338,150,'UT',1),
(2339,150,'ZE',1),
(2340,150,'ZH',1),
(2341,152,'L',1),
(2342,152,'N',1),
(2343,152,'S',1),
(2344,153,'AUK',1),
(2345,153,'BOP',1),
(2346,153,'CAN',1),
(2347,153,'COR',1),
(2348,153,'GIS',1),
(2349,153,'FIO',1),
(2350,153,'HKB',1),
(2351,153,'MBH',1),
(2352,153,'MWT',1),
(2353,153,'MCM',1),
(2354,153,'NSN',1),
(2355,153,'NTL',1),
(2356,153,'OTA',1),
(2357,153,'STL',1),
(2358,153,'TKI',1),
(2359,153,'WGN',1),
(2360,153,'WKO',1),
(2361,153,'WAI',1),
(2362,153,'WTC',1),
(2363,154,'AN',1),
(2364,154,'AS',1),
(2365,154,'BO',1),
(2366,154,'CA',1),
(2367,154,'CI',1),
(2368,154,'CO',1),
(2369,154,'ES',1),
(2370,154,'GR',1),
(2371,154,'JI',1),
(2372,154,'LE',1),
(2373,154,'MD',1),
(2374,154,'MN',1),
(2375,154,'MS',1),
(2376,154,'MT',1),
(2377,154,'NS',1),
(2378,154,'RS',1),
(2379,154,'RI',1),
(2380,155,'AG',1),
(2381,155,'DF',1),
(2382,155,'DS',1),
(2383,155,'MA',1),
(2384,155,'NM',1),
(2385,155,'TH',1),
(2386,155,'TL',1),
(2387,155,'ZD',1),
(2388,156,'AB',1),
(2389,156,'CT',1),
(2390,156,'AD',1),
(2391,156,'AK',1),
(2392,156,'AN',1),
(2393,156,'BC',1),
(2394,156,'BY',1),
(2395,156,'BN',1),
(2396,156,'BO',1),
(2397,156,'CR',1),
(2398,156,'DE',1),
(2399,156,'EB',1),
(2400,156,'ED',1),
(2401,156,'EK',1),
(2402,156,'EN',1),
(2403,156,'GO',1),
(2404,156,'IM',1),
(2405,156,'JI',1),
(2406,156,'KD',1),
(2407,156,'KN',1),
(2408,156,'KT',1),
(2409,156,'KE',1),
(2410,156,'KO',1),
(2411,156,'KW',1),
(2412,156,'LA',1),
(2413,156,'NA',1),
(2414,156,'NI',1),
(2415,156,'OG',1),
(2416,156,'ONG',1),
(2417,156,'OS',1),
(2418,156,'OY',1),
(2419,156,'PL',1),
(2420,156,'RI',1),
(2421,156,'SO',1),
(2422,156,'TA',1),
(2423,156,'YO',1),
(2424,156,'ZA',1),
(2425,159,'N',1),
(2426,159,'R',1),
(2427,159,'S',1),
(2428,159,'T',1),
(2429,160,'AK',1),
(2430,160,'AA',1),
(2431,160,'BU',1),
(2432,160,'FM',1),
(2433,160,'HM',1),
(2434,160,'HL',1),
(2435,160,'MR',1),
(2436,160,'NT',1),
(2437,160,'NL',1),
(2438,160,'OF',1),
(2439,160,'OP',1),
(2440,160,'OL',1),
(2441,160,'RL',1),
(2442,160,'ST',1),
(2443,160,'SJ',1),
(2444,160,'SV',1),
(2445,160,'TM',1),
(2446,160,'TR',1),
(2447,160,'VA',1),
(2448,160,'VF',1),
(2449,161,'DA',1),
(2450,161,'BA',1),
(2451,161,'WU',1),
(2452,161,'SH',1),
(2453,161,'ZA',1),
(2454,161,'MA',1),
(2455,161,'MU',1),
(2456,161,'ZU',1),
(2457,162,'B',1),
(2458,162,'T',1),
(2459,162,'I',1),
(2460,162,'N',1),
(2461,162,'P',1),
(2462,162,'S',1),
(2463,163,'AM',1),
(2464,163,'AR',1),
(2465,163,'AN',1),
(2466,163,'HA',1),
(2467,163,'KA',1),
(2468,163,'KO',1),
(2469,163,'ME',1),
(2470,163,'NA',1),
(2471,163,'NG',1),
(2472,163,'ND',1),
(2473,163,'NT',1),
(2474,163,'NC',1),
(2475,163,'NR',1),
(2476,163,'NW',1),
(2477,163,'PE',1),
(2478,163,'SO',1),
(2479,164,'BT',1),
(2480,164,'CH',1),
(2481,164,'CC',1),
(2482,164,'CL',1),
(2483,164,'DA',1),
(2484,164,'HE',1),
(2485,164,'LS',1),
(2486,164,'PA',1),
(2487,164,'SB',1),
(2488,164,'VG',1),
(2489,165,'BV',1),
(2490,165,'CE',1),
(2491,165,'CH',1),
(2492,165,'EH',1),
(2493,165,'EB',1),
(2494,165,'ES',1),
(2495,165,'EN',1),
(2496,165,'GU',1),
(2497,165,'MD',1),
(2498,165,'MN',1),
(2499,165,'MB',1),
(2500,165,'MR',1),
(2501,165,'NC',1),
(2502,165,'NI',1),
(2503,165,'NO',1),
(2504,165,'SA',1),
(2505,165,'SH',1),
(2506,165,'WE',1),
(2507,165,'WH',1),
(2508,165,'WB',1),
(2509,166,'AG',1),
(2510,166,'AN',1),
(2511,166,'AM',1),
(2512,166,'AS',1),
(2513,166,'BO',1),
(2514,166,'CG',1),
(2515,166,'CZ',1),
(2516,166,'CN',1),
(2517,166,'CE',1),
(2518,166,'CC',1),
(2519,166,'CD',1),
(2520,166,'GU',1),
(2521,166,'IT',1),
(2522,166,'MI',1),
(2523,166,'NE',1),
(2524,166,'PA',1),
(2525,166,'PH',1),
(2526,166,'SP',1),
(2527,167,'AM',1),
(2528,167,'AN',1),
(2529,167,'AP',1),
(2530,167,'AR',1),
(2531,167,'AY',1),
(2532,167,'CJ',1),
(2533,167,'CL',1),
(2534,167,'CU',1),
(2535,167,'HV',1),
(2536,167,'HO',1),
(2537,167,'IC',1),
(2538,167,'JU',1),
(2539,167,'LD',1),
(2540,167,'LY',1),
(2541,167,'LI',1),
(2542,167,'LO',1),
(2543,167,'MD',1),
(2544,167,'MO',1),
(2545,167,'PA',1),
(2546,167,'PI',1),
(2547,167,'PU',1),
(2548,167,'SM',1),
(2549,167,'TA',1),
(2550,167,'TU',1),
(2551,167,'UC',1),
(2552,168,'ABR',1),
(2553,168,'ANO',1),
(2554,168,'ASU',1),
(2555,168,'AKL',1),
(2556,168,'ALB',1),
(2557,168,'ANT',1),
(2558,168,'APY',1),
(2559,168,'AUR',1),
(2560,168,'BAS',1),
(2561,168,'BTA',1),
(2562,168,'BTE',1),
(2563,168,'BTG',1),
(2564,168,'BLR',1),
(2565,168,'BEN',1),
(2566,168,'BOL',1),
(2567,168,'BUK',1),
(2568,168,'BUL',1),
(2569,168,'CAG',1),
(2570,168,'CNO',1),
(2571,168,'CSU',1),
(2572,168,'CAM',1),
(2573,168,'CAP',1),
(2574,168,'CAT',1),
(2575,168,'CAV',1),
(2576,168,'CEB',1),
(2577,168,'CMP',1),
(2578,168,'DNO',1),
(2579,168,'DSU',1),
(2580,168,'DOR',1),
(2581,168,'ESA',1),
(2582,168,'GUI',1),
(2583,168,'IFU',1),
(2584,168,'INO',1),
(2585,168,'ISU',1),
(2586,168,'ILO',1),
(2587,168,'ISA',1),
(2588,168,'KAL',1),
(2589,168,'LAG',1),
(2590,168,'LNO',1),
(2591,168,'LSU',1),
(2592,168,'UNI',1),
(2593,168,'LEY',1),
(2594,168,'MAG',1),
(2595,168,'MRN',1),
(2596,168,'MSB',1),
(2597,168,'MIC',1),
(2598,168,'MIR',1),
(2599,168,'MSC',1),
(2600,168,'MOR',1),
(2601,168,'MOP',1),
(2602,168,'NOC',1),
(2603,168,'NOR',1),
(2604,168,'NCT',1),
(2605,168,'NSM',1),
(2606,168,'NEC',1),
(2607,168,'NVZ',1),
(2608,168,'PLW',1),
(2609,168,'PMP',1),
(2610,168,'PNG',1),
(2611,168,'QZN',1),
(2612,168,'QRN',1),
(2613,168,'RIZ',1),
(2614,168,'ROM',1),
(2615,168,'SMR',1),
(2616,168,'SRG',1),
(2617,168,'SQJ',1),
(2618,168,'SRS',1),
(2619,168,'SCO',1),
(2620,168,'SLE',1),
(2621,168,'SKU',1),
(2622,168,'SLU',1),
(2623,168,'SNO',1),
(2624,168,'SSU',1),
(2625,168,'TAR',1),
(2626,168,'TAW',1),
(2627,168,'ZBL',1),
(2628,168,'ZNO',1),
(2629,168,'ZSU',1),
(2630,168,'ZSI',1),
(2631,170,'DO',1),
(2632,170,'KP',1),
(2633,170,'LO',1),
(2634,170,'LL',1),
(2635,170,'LU',1),
(2636,170,'ML',1),
(2637,170,'MZ',1),
(2638,170,'OP',1),
(2639,170,'PP',1),
(2640,170,'PL',1),
(2641,170,'PM',1),
(2642,170,'SL',1),
(2643,170,'SW',1),
(2644,170,'WM',1),
(2645,170,'WP',1),
(2646,170,'ZA',1),
(2647,198,'P',1),
(2648,198,'M',1),
(2649,171,'20',1),
(2650,171,'01',1),
(2651,171,'02',1),
(2652,171,'03',1),
(2653,171,'04',1),
(2654,171,'05',1),
(2655,171,'06',1),
(2656,171,'07',1),
(2657,171,'08',1),
(2658,171,'09',1),
(2659,171,'10',1),
(2660,171,'11',1),
(2661,171,'30',1),
(2662,171,'12',1),
(2663,171,'13',1),
(2664,171,'14',1),
(2665,171,'15',1),
(2666,171,'16',1),
(2667,171,'17',1),
(2668,171,'VI',1),
(2669,173,'DW',1),
(2670,173,'GW',1),
(2671,173,'JM',1),
(2672,173,'KR',1),
(2673,173,'WK',1),
(2674,173,'RN',1),
(2675,173,'JB',1),
(2676,173,'MS',1),
(2677,173,'UD',1),
(2678,173,'UL',1),
(2679,175,'AB',1),
(2680,175,'AR',1),
(2681,175,'AG',1),
(2682,175,'BC',1),
(2683,175,'BH',1),
(2684,175,'BN',1),
(2685,175,'BT',1),
(2686,175,'BV',1),
(2687,175,'BR',1),
(2688,175,'B',1),
(2689,175,'BZ',1),
(2690,175,'CS',1),
(2691,175,'CL',1),
(2692,175,'CJ',1),
(2693,175,'CT',1),
(2694,175,'CV',1),
(2695,175,'DB',1),
(2696,175,'DJ',1),
(2697,175,'GL',1),
(2698,175,'GR',1),
(2699,175,'GJ',1),
(2700,175,'HR',1),
(2701,175,'HD',1),
(2702,175,'IL',1),
(2703,175,'IS',1),
(2704,175,'IF',1),
(2705,175,'MM',1),
(2706,175,'MH',1),
(2707,175,'MS',1),
(2708,175,'NT',1),
(2709,175,'OT',1),
(2710,175,'PH',1),
(2711,175,'SM',1),
(2712,175,'SJ',1),
(2713,175,'SB',1),
(2714,175,'SV',1),
(2715,175,'TR',1),
(2716,175,'TM',1),
(2717,175,'TL',1),
(2718,175,'VS',1),
(2719,175,'VL',1),
(2720,175,'VN',1),
(2809,177,'BU',1),
(2810,177,'BY',1),
(2811,177,'CY',1),
(2812,177,'GK',1),
(2813,177,'GS',1),
(2814,177,'GT',1),
(2815,177,'KG',1),
(2816,177,'KY',1),
(2817,177,'KR',1),
(2818,177,'KV',1),
(2819,177,'RU',1),
(2820,177,'UM',1),
(2821,178,'CCN',1),
(2822,178,'SAS',1),
(2823,178,'SGB',1),
(2824,178,'SGG',1),
(2825,178,'SJW',1),
(2826,178,'SJC',1),
(2827,178,'SJF',1),
(2828,178,'SMC',1),
(2829,178,'CAP',1),
(2830,178,'CHA',1),
(2831,178,'SPB',1),
(2832,178,'STL',1),
(2833,178,'STM',1),
(2834,178,'TPP',1),
(2835,179,'AR',1),
(2836,179,'CA',1),
(2837,179,'CH',1),
(2838,179,'DA',1),
(2839,179,'DE',1),
(2840,179,'GI',1),
(2841,179,'LA',1),
(2842,179,'MI',1),
(2843,179,'PR',1),
(2844,179,'SO',1),
(2845,179,'VF',1),
(2846,180,'C',1),
(2847,180,'R',1),
(2848,180,'A',1),
(2849,180,'D',1),
(2850,180,'G',1),
(2851,180,'P',1),
(2852,181,'AN',1),
(2853,181,'AI',1),
(2854,181,'AT',1),
(2855,181,'FA',1),
(2856,181,'GE',1),
(2857,181,'GF',1),
(2858,181,'PA',1),
(2859,181,'SA',1),
(2860,181,'TU',1),
(2861,181,'VF',1),
(2862,181,'VS',1),
(2863,182,'AC',1),
(2864,182,'BM',1),
(2865,182,'CH',1),
(2866,182,'DO',1),
(2867,182,'FA',1),
(2868,182,'FI',1),
(2869,182,'MO',1),
(2870,182,'SM',1),
(2871,182,'SE',1),
(2872,183,'S',1),
(2873,183,'P',1),
(2874,184,'BH',1),
(2875,184,'HS',1),
(2876,184,'JF',1),
(2877,184,'MD',1),
(2878,184,'QS',1),
(2879,184,'RD',1),
(2880,184,'AQ',1),
(2881,184,'AS',1),
(2882,184,'HL',1),
(2883,184,'JZ',1),
(2884,184,'ML',1),
(2885,184,'NR',1),
(2886,184,'TB',1),
(2887,185,'DA',1),
(2888,185,'DI',1),
(2889,185,'FA',1),
(2890,185,'KA',1),
(2891,185,'KO',1),
(2892,185,'LO',1),
(2893,185,'MA',1),
(2894,185,'SL',1),
(2895,185,'TA',1),
(2896,185,'TH',1),
(2897,185,'ZI',1),
(2898,186,'AP',1),
(2899,186,'AB',1),
(2900,186,'AE',1),
(2901,186,'AL',1),
(2902,186,'AR',1),
(2903,186,'BL',1),
(2904,186,'BS',1),
(2905,186,'BV',1),
(2906,186,'BA',1),
(2907,186,'BO',1),
(2908,186,'CA',1),
(2909,186,'GL',1),
(2910,186,'GM',1),
(2911,186,'GP',1),
(2912,186,'DG',1),
(2913,186,'RA',1),
(2914,186,'MB',1),
(2915,186,'MF',1),
(2916,186,'PL',1),
(2917,186,'PR',1),
(2918,186,'PG',1),
(2919,186,'SL',1),
(2920,186,'TA',1),
(2921,187,'E',1),
(2922,187,'N',1),
(2923,187,'S',1),
(2924,187,'W',1),
(2925,189,'BC',1),
(2926,189,'BL',1),
(2927,189,'KI',1),
(2928,189,'NI',1),
(2929,189,'PV',1),
(2930,189,'TC',1),
(2931,189,'TA',1),
(2932,189,'ZI',1),
(2933,191,'CE',1),
(2934,191,'CH',1),
(2935,191,'GC',1),
(2936,191,'HO',1),
(2937,191,'IS',1),
(2938,191,'MK',1),
(2939,191,'ML',1),
(2940,191,'RB',1),
(2941,191,'TM',1),
(2942,191,'WE',1),
(2943,192,'AW',1),
(2944,192,'BK',1),
(2945,192,'BN',1),
(2946,192,'BR',1),
(2947,192,'BY',1),
(2948,192,'GA',1),
(2949,192,'GE',1),
(2950,192,'HI',1),
(2951,192,'JD',1),
(2952,192,'JH',1),
(2953,192,'MU',1),
(2954,192,'NU',1),
(2955,192,'SA',1),
(2956,192,'SD',1),
(2957,192,'SH',1),
(2958,192,'SL',1),
(2959,192,'TO',1),
(2960,192,'WG',1),
(2961,193,'EC',1),
(2962,193,'FS',1),
(2963,193,'GP',1),
(2964,193,'KZN',1),
(2965,193,'LP',1),
(2966,193,'MP',1),
(2967,193,'NW',1),
(2968,193,'NC',1),
(2969,193,'WC',1),
(2970,195,'C',1),
(2971,195,'VI',1),
(2972,195,'AB',1),
(2973,195,'A',1),
(2974,195,'AL',1),
(2975,195,'O',1),
(2976,195,'AV',1),
(2977,195,'BA',1),
(2978,195,'IB',1),
(2979,195,'B',1),
(2980,195,'BU',1),
(2981,195,'CC',1),
(2982,195,'CA',1),
(2983,195,'S',1),
(2984,195,'CS',1),
(2985,195,'CE',1),
(2986,195,'CR',1),
(2987,195,'CO',1),
(2988,195,'CU',1),
(2989,195,'GI',1),
(2990,195,'GR',1),
(2991,195,'GU',1),
(2992,195,'SS',1),
(2993,195,'H',1),
(2994,195,'HU',1),
(2995,195,'J',1),
(2996,195,'LO',1),
(2997,195,'GC',1),
(2998,195,'CL',1),
(2999,195,'L',1),
(3000,195,'LU',1),
(3001,195,'M',1),
(3002,195,'MA',1),
(3003,195,'ML',1),
(3004,195,'MU',1),
(3005,195,'NA',1),
(3006,195,'OR',1),
(3007,195,'P',1),
(3008,195,'PO',1),
(3009,195,'SA',1),
(3010,195,'TF',1),
(3011,195,'SG',1),
(3012,195,'SE',1),
(3013,195,'SO',1),
(3014,195,'T',1),
(3015,195,'TE',1),
(3016,195,'TO',1),
(3017,195,'V',1),
(3018,195,'VA',1),
(3019,195,'BI',1),
(3020,195,'ZA',1),
(3021,195,'Z',1),
(3022,196,'CE',1),
(3023,196,'EA',1),
(3024,196,'NC',1),
(3025,196,'NO',1),
(3026,196,'NW',1),
(3027,196,'SA',1),
(3028,196,'SO',1),
(3029,196,'UV',1),
(3030,196,'WE',1),
(3032,197,'S',1),
(3034,199,'ANL',1),
(3035,199,'BAM',1),
(3036,199,'BRT',1),
(3037,199,'JZR',1),
(3038,199,'KRT',1),
(3039,199,'QDR',1),
(3040,199,'WDH',1),
(3041,199,'ANB',1),
(3042,199,'ANZ',1),
(3043,199,'ASH',1),
(3044,199,'BJA',1),
(3045,199,'GIS',1),
(3046,199,'GBG',1),
(3047,199,'GDA',1),
(3048,199,'GKU',1),
(3049,199,'JDA',1),
(3050,199,'JKU',1),
(3051,199,'JQL',1),
(3052,199,'KSL',1),
(3053,199,'NNL',1),
(3054,199,'SBG',1),
(3055,199,'SDA',1),
(3056,199,'SKU',1),
(3057,199,'SIS',1),
(3058,199,'SNR',1),
(3059,199,'WRB',1),
(3060,200,'BR',1),
(3061,200,'CM',1),
(3062,200,'CR',1),
(3063,200,'MA',1),
(3064,200,'NI',1),
(3065,200,'PA',1),
(3066,200,'PM',1),
(3067,200,'SA',1),
(3068,200,'SI',1),
(3069,200,'WA',1),
(3070,202,'H',1),
(3071,202,'L',1),
(3072,202,'M',1),
(3073,202,'S',1),
(3074,203,'K',1),
(3075,203,'W',1),
(3076,203,'X',1),
(3077,203,'I',1),
(3078,203,'N',1),
(3079,203,'Z',1),
(3080,203,'F',1),
(3081,203,'H',1),
(3082,203,'G',1),
(3083,203,'BD',1),
(3084,203,'T',1),
(3085,203,'E',1),
(3086,203,'M',1),
(3087,203,'D',1),
(3088,203,'AB',1),
(3089,203,'C',1),
(3090,203,'S',1),
(3091,203,'AC',1),
(3092,203,'Y',1),
(3093,203,'U',1),
(3094,203,'O',1),
(3095,204,'AG',1),
(3096,204,'AR',1),
(3097,204,'AI',1),
(3098,204,'BS',1),
(3099,204,'BL',1),
(3100,204,'BE',1),
(3101,204,'FR',1),
(3102,204,'GE',1),
(3103,204,'GL',1),
(3104,204,'GR',1),
(3105,204,'JU',1),
(3106,204,'LU',1),
(3107,204,'NE',1),
(3108,204,'NW',1),
(3109,204,'OW',1),
(3110,204,'SG',1),
(3111,204,'SH',1),
(3112,204,'SZ',1),
(3113,204,'SO',1),
(3114,204,'TG',1),
(3115,204,'TI',1),
(3116,204,'UR',1),
(3117,204,'VS',1),
(3118,204,'VD',1),
(3119,204,'ZG',1),
(3120,204,'ZH',1),
(3121,205,'HA',1),
(3122,205,'LA',1),
(3123,205,'QU',1),
(3124,205,'RQ',1),
(3125,205,'SU',1),
(3126,205,'DA',1),
(3127,205,'DZ',1),
(3128,205,'DI',1),
(3129,205,'HL',1),
(3130,205,'HM',1),
(3131,205,'HI',1),
(3132,205,'ID',1),
(3133,205,'RD',1),
(3134,205,'TA',1),
(3135,206,'CH',1),
(3136,206,'CI',1),
(3137,206,'HS',1),
(3138,206,'HL',1),
(3139,206,'IL',1),
(3140,206,'KH',1),
(3141,206,'KM',1),
(3142,206,'LC',1),
(3143,206,'ML',1),
(3144,206,'NT',1),
(3145,206,'PH',1),
(3146,206,'PT',1),
(3147,206,'TG',1),
(3148,206,'TA',1),
(3149,206,'TP',1),
(3150,206,'TT',1),
(3151,206,'TY',1),
(3152,206,'YL',1),
(3153,206,'CC',1),
(3154,206,'CL',1),
(3155,206,'HC',1),
(3156,206,'TH',1),
(3157,206,'TN',1),
(3158,206,'KC',1),
(3159,206,'TC',1),
(3160,207,'GB',1),
(3161,207,'KT',1),
(3162,207,'SU',1),
(3163,208,'AR',1),
(3164,208,'DS',1),
(3165,208,'DO',1),
(3166,208,'IR',1),
(3167,208,'KA',1),
(3168,208,'KI',1),
(3169,208,'KJ',1),
(3170,208,'LN',1),
(3171,208,'MY',1),
(3172,208,'MR',1),
(3173,208,'MB',1),
(3174,208,'MO',1),
(3175,208,'MT',1),
(3176,208,'MW',1),
(3177,208,'PN',1),
(3178,208,'PS',1),
(3179,208,'PW',1),
(3180,208,'RK',1),
(3181,208,'RV',1),
(3182,208,'SH',1),
(3183,208,'SI',1),
(3184,208,'TB',1),
(3185,208,'TN',1),
(3186,208,'ZC',1),
(3187,208,'ZN',1),
(3188,208,'ZU',1),
(3189,209,'37',1),
(3190,209,'15',1),
(3192,209,'10',1),
(3193,209,'31',1),
(3194,209,'24',1),
(3195,209,'18',1),
(3196,209,'36',1),
(3197,209,'22',1),
(3198,209,'50',1),
(3199,209,'57',1),
(3200,209,'20',1),
(3201,209,'86',1),
(3202,209,'46',1),
(3203,209,'62',1),
(3204,209,'71',1),
(3205,209,'40',1),
(3206,209,'81',1),
(3207,209,'52',1),
(3208,209,'51',1),
(3209,209,'42',1),
(3210,209,'1',1),
(3211,209,'55',1),
(3212,209,'44',1),
(3213,209,'49',1),
(3214,209,'26',1),
(3215,209,'73',1),
(3216,209,'48',1),
(3217,209,'30',1),
(3218,209,'60',1),
(3219,209,'80',1),
(3220,209,'55',1),
(3221,209,'96',1),
(3222,209,'39',1),
(3223,209,'43',1),
(3224,209,'12',1),
(3225,209,'13',1),
(3226,209,'94',1),
(3227,209,'82',1),
(3228,209,'93',1),
(3229,209,'Phayao',1),
(3230,209,'67',1),
(3231,209,'76',1),
(3232,209,'66',1),
(3233,209,'65',1),
(3234,209,'54',1),
(3235,209,'83',1),
(3236,209,'25',1),
(3237,209,'77',1),
(3238,209,'21',1),
(3239,209,'70',1),
(3240,209,'21',1),
(3241,209,'45',1),
(3242,209,'27',1),
(3243,209,'47',1),
(3244,209,'11',1),
(3245,209,'74',1),
(3246,209,'75',1),
(3247,209,'19',1),
(3248,209,'91',1),
(3249,209,'17',1),
(3250,209,'33',1),
(3251,209,'90',1),
(3252,209,'64',1),
(3253,209,'72',1),
(3254,209,'84',1),
(3255,209,'32',1),
(3256,209,'63',1),
(3257,209,'92',1),
(3258,209,'23',1),
(3259,209,'34',1),
(3260,209,'41',1),
(3261,209,'61',1),
(3262,209,'53',1),
(3263,209,'95',1),
(3264,209,'35',1),
(3265,210,'K',1),
(3266,210,'P',1),
(3267,210,'S',1),
(3268,210,'C',1),
(3269,210,'M',1),
(3270,211,'A',1),
(3271,211,'F',1),
(3272,211,'N',1),
(3273,212,'H',1),
(3274,212,'T',1),
(3275,212,'V',1),
(3276,213,'CT',1),
(3277,213,'DM',1),
(3278,213,'MR',1),
(3279,213,'PD',1),
(3280,213,'PT',1),
(3281,213,'SG',1),
(3282,213,'SL',1),
(3283,213,'SI',1),
(3284,213,'TP',1),
(3285,213,'PS',1),
(3286,213,'SF',1),
(3287,213,'AR',1),
(3288,213,'PF',1),
(3289,213,'CH',1),
(3290,213,'TO',1),
(3291,214,'AR',1),
(3292,214,'BJ',1),
(3293,214,'BA',1),
(3294,214,'BI',1),
(3295,214,'GB',1),
(3296,214,'GF',1),
(3297,214,'JE',1),
(3298,214,'KR',1),
(3299,214,'KS',1),
(3300,214,'KB',1),
(3301,214,'KF',1),
(3302,214,'MH',1),
(3303,214,'MN',1),
(3304,214,'ME',1),
(3305,214,'MO',1),
(3306,214,'NA',1),
(3307,214,'SF',1),
(3308,214,'SD',1),
(3309,214,'SL',1),
(3310,214,'SO',1),
(3311,214,'TA',1),
(3312,214,'TO',1),
(3313,214,'TU',1),
(3314,214,'ZA',1),
(3315,215,'TR-01',1),
(3316,215,'TR-02',1),
(3317,215,'TR-03',1),
(3318,215,'TR-04',1),
(3319,215,'TR-68',1),
(3320,215,'TR-05',1),
(3321,215,'TR-06',1),
(3322,215,'TR-07',1),
(3323,215,'TR-75',1),
(3324,215,'TR-08',1),
(3325,215,'TR-09',1),
(3326,215,'TR-10',1),
(3327,215,'TR-74',1),
(3328,215,'TR-72',1),
(3329,215,'TR-69',1),
(3330,215,'TR-11',1),
(3331,215,'TR-12',1),
(3332,215,'TR-13',1),
(3333,215,'TR-14',1),
(3334,215,'TR-15',1),
(3335,215,'TR-16',1),
(3336,215,'TR-17',1),
(3337,215,'TR-18',1),
(3338,215,'TR-19',1),
(3339,215,'TR-20',1),
(3340,215,'TR-21',1),
(3341,215,'TR-81',1),
(3342,215,'TR-22',1),
(3343,215,'TR-23',1),
(3344,215,'TR-24',1),
(3345,215,'TR-25',1),
(3346,215,'TR-26',1),
(3347,215,'TR-27',1),
(3348,215,'TR-28',1),
(3349,215,'TR-29',1),
(3350,215,'TR-30',1),
(3351,215,'TR-31',1),
(3352,215,'TR-76',1),
(3353,215,'TR-32',1),
(3354,215,'TR-34',1),
(3355,215,'TR-35',1),
(3356,215,'TR-46',1),
(3357,215,'TR-78',1),
(3358,215,'TR-70',1),
(3359,215,'TR-36',1),
(3360,215,'TR-37',1),
(3361,215,'TR-38',1),
(3362,215,'TR-79',1),
(3363,215,'TR-71',1),
(3364,215,'TR-39',1),
(3365,215,'TR-40',1),
(3366,215,'TR-41',1),
(3367,215,'TR-42',1),
(3368,215,'TR-43',1),
(3369,215,'TR-44',1),
(3370,215,'TR-45',1),
(3371,215,'TR-47',1),
(3372,215,'TR-33',1),
(3373,215,'TR-48',1),
(3374,215,'TR-49',1),
(3375,215,'TR-50',1),
(3376,215,'TR-51',1),
(3377,215,'TR-52',1),
(3378,215,'TR-80',1),
(3379,215,'TR-53',1),
(3380,215,'TR-54',1),
(3381,215,'TR-55',1),
(3382,215,'TR-63',1),
(3383,215,'TR-56',1),
(3384,215,'TR-57',1),
(3385,215,'TR-73',1),
(3386,215,'TR-58',1),
(3387,215,'TR-59',1),
(3388,215,'TR-60',1),
(3389,215,'TR-61',1),
(3390,215,'TR-62',1),
(3391,215,'TR-64',1),
(3392,215,'TR-65',1),
(3393,215,'TR-77',1),
(3394,215,'TR-66',1),
(3395,215,'TR-67',1),
(3396,216,'A',1),
(3397,216,'B',1),
(3398,216,'D',1),
(3399,216,'L',1),
(3400,216,'M',1),
(3401,217,'AC',1),
(3402,217,'DC',1),
(3403,217,'FC',1),
(3404,217,'LW',1),
(3405,217,'RC',1),
(3406,217,'PN',1),
(3407,217,'SL',1),
(3408,217,'GT',1),
(3409,217,'SC',1),
(3410,217,'EC',1),
(3411,217,'MC',1),
(3412,217,'NC',1),
(3413,217,'PR',1),
(3414,217,'WC',1),
(3415,218,'NMG',1),
(3416,218,'NLK',1),
(3417,218,'NTO',1),
(3418,218,'FUN',1),
(3419,218,'NME',1),
(3420,218,'NUI',1),
(3421,218,'NFT',1),
(3422,218,'NLL',1),
(3423,218,'VAI',1),
(3424,219,'KAL',1),
(3425,219,'KMP',1),
(3426,219,'KAY',1),
(3427,219,'KIB',1),
(3428,219,'LUW',1),
(3429,219,'MAS',1),
(3430,219,'MPI',1),
(3431,219,'MUB',1),
(3432,219,'MUK',1),
(3433,219,'NKS',1),
(3434,219,'RAK',1),
(3435,219,'SEM',1),
(3436,219,'WAK',1),
(3437,219,'BUG',1),
(3438,219,'BUS',1),
(3439,219,'IGA',1),
(3440,219,'JIN',1),
(3441,219,'KAB',1),
(3442,219,'KML',1),
(3443,219,'KPC',1),
(3444,219,'KTK',1),
(3445,219,'KUM',1),
(3446,219,'MAY',1),
(3447,219,'MBA',1),
(3448,219,'PAL',1),
(3449,219,'SIR',1),
(3450,219,'SOR',1),
(3451,219,'TOR',1),
(3452,219,'ADJ',1),
(3453,219,'APC',1),
(3454,219,'ARU',1),
(3455,219,'GUL',1),
(3456,219,'KIT',1),
(3457,219,'KOT',1),
(3458,219,'LIR',1),
(3459,219,'MRT',1),
(3460,219,'MOY',1),
(3461,219,'NAK',1),
(3462,219,'NEB',1),
(3463,219,'PAD',1),
(3464,219,'YUM',1),
(3465,219,'BUN',1),
(3466,219,'BSH',1),
(3467,219,'HOI',1),
(3468,219,'KBL',1),
(3469,219,'KAR',1),
(3470,219,'KAM',1),
(3471,219,'KAN',1),
(3472,219,'KAS',1),
(3473,219,'KBA',1),
(3474,219,'KIS',1),
(3475,219,'KYE',1),
(3476,219,'MSN',1),
(3477,219,'MBR',1),
(3478,219,'NTU',1),
(3479,219,'RUK',1),
(3480,220,'23',1),
(3481,220,'25',1),
(3482,220,'24',1),
(3483,220,'27',1),
(3484,220,'04',1),
(3485,220,'05',1),
(3486,220,'09',1),
(3487,220,'21',1),
(3488,220,'22',1),
(3489,220,'35',1),
(3490,220,'26',1),
(3491,220,'10',1),
(3492,220,'12',1),
(3493,220,'13',1),
(3494,220,'14',1),
(3495,220,'15',1),
(3496,220,'16',1),
(3497,220,'17',1),
(3498,220,'28',1),
(3499,220,'18',1),
(3500,220,'19',1),
(3501,220,'02',1),
(3502,220,'03',1),
(3503,220,'07',1),
(3504,220,'08',1),
(3505,220,'06',1),
(3506,221,'ADH',1),
(3507,221,'AJ',1),
(3508,221,'FU',1),
(3509,221,'SH',1),
(3510,221,'DU',1),
(3511,221,'RK',1),
(3512,221,'UQ',1),
(3513,222,'ABN',1),
(3514,222,'ABNS',1),
(3515,222,'ANG',1),
(3516,222,'AGS',1),
(3517,222,'ARY',1),
(3518,222,'BEDS',1),
(3519,222,'BERKS',1),
(3520,222,'BLA',1),
(3521,222,'BRI',1),
(3522,222,'BSTL',1),
(3523,222,'BUCKS',1),
(3524,222,'CAE',1),
(3525,222,'CAMBS',1),
(3526,222,'CDF',1),
(3527,222,'CARM',1),
(3528,222,'CDGN',1),
(3529,222,'CHES',1),
(3530,222,'CLACK',1),
(3531,222,'CON',1),
(3532,222,'CORN',1),
(3533,222,'DNBG',1),
(3534,222,'DERBY',1),
(3535,222,'DVN',1),
(3536,222,'DOR',1),
(3537,222,'DGL',1),
(3538,222,'DUND',1),
(3539,222,'DHM',1),
(3540,222,'ARYE',1),
(3541,222,'DUNBE',1),
(3542,222,'LOTE',1),
(3543,222,'RENE',1),
(3544,222,'ERYS',1),
(3545,222,'SXE',1),
(3546,222,'EDIN',1),
(3547,222,'ESX',1),
(3548,222,'FALK',1),
(3549,222,'FFE',1),
(3550,222,'FLINT',1),
(3551,222,'GLAS',1),
(3552,222,'GLOS',1),
(3553,222,'LDN',1),
(3554,222,'MCH',1),
(3555,222,'GDD',1),
(3556,222,'HANTS',1),
(3557,222,'HWR',1),
(3558,222,'HERTS',1),
(3559,222,'HLD',1),
(3560,222,'IVER',1),
(3561,222,'IOW',1),
(3562,222,'KNT',1),
(3563,222,'LANCS',1),
(3564,222,'LEICS',1),
(3565,222,'LINCS',1),
(3566,222,'MSY',1),
(3567,222,'MERT',1),
(3568,222,'MLOT',1),
(3569,222,'MMOUTH',1),
(3570,222,'MORAY',1),
(3571,222,'NPRTAL',1),
(3572,222,'NEWPT',1),
(3573,222,'NOR',1),
(3574,222,'ARYN',1),
(3575,222,'LANN',1),
(3576,222,'YSN',1),
(3577,222,'NHM',1),
(3578,222,'NLD',1),
(3579,222,'NOT',1),
(3580,222,'ORK',1),
(3581,222,'OFE',1),
(3582,222,'PEM',1),
(3583,222,'PERTH',1),
(3584,222,'PWS',1),
(3585,222,'REN',1),
(3586,222,'RHON',1),
(3587,222,'RUT',1),
(3588,222,'BOR',1),
(3589,222,'SHET',1),
(3590,222,'SPE',1),
(3591,222,'SOM',1),
(3592,222,'ARYS',1),
(3593,222,'LANS',1),
(3594,222,'YSS',1),
(3595,222,'SFD',1),
(3596,222,'STIR',1),
(3597,222,'SFK',1),
(3598,222,'SRY',1),
(3599,222,'SWAN',1),
(3600,222,'TORF',1),
(3601,222,'TWR',1),
(3602,222,'VGLAM',1),
(3603,222,'WARKS',1),
(3604,222,'WDUN',1),
(3605,222,'WLOT',1),
(3606,222,'WMD',1),
(3607,222,'SXW',1),
(3608,222,'YSW',1),
(3609,222,'WIL',1),
(3610,222,'WLT',1),
(3611,222,'WORCS',1),
(3612,222,'WRX',1),
(3613,223,'AL',1),
(3614,223,'AK',1),
(3615,223,'AS',1),
(3616,223,'AZ',1),
(3617,223,'AR',1),
(3618,223,'AF',1),
(3619,223,'AA',1),
(3620,223,'AC',1),
(3621,223,'AE',1),
(3622,223,'AM',1),
(3623,223,'AP',1),
(3624,223,'CA',1),
(3625,223,'CO',1),
(3626,223,'CT',1),
(3627,223,'DE',1),
(3628,223,'DC',1),
(3629,223,'FM',1),
(3630,223,'FL',1),
(3631,223,'GA',1),
(3632,223,'GU',1),
(3633,223,'HI',1),
(3634,223,'ID',1),
(3635,223,'IL',1),
(3636,223,'IN',1),
(3637,223,'IA',1),
(3638,223,'KS',1),
(3639,223,'KY',1),
(3640,223,'LA',1),
(3641,223,'ME',1),
(3642,223,'MH',1),
(3643,223,'MD',1),
(3644,223,'MA',1),
(3645,223,'MI',1),
(3646,223,'MN',1),
(3647,223,'MS',1),
(3648,223,'MO',1),
(3649,223,'MT',1),
(3650,223,'NE',1),
(3651,223,'NV',1),
(3652,223,'NH',1),
(3653,223,'NJ',1),
(3654,223,'NM',1),
(3655,223,'NY',1),
(3656,223,'NC',1),
(3657,223,'ND',1),
(3658,223,'MP',1),
(3659,223,'OH',1),
(3660,223,'OK',1),
(3661,223,'OR',1),
(3662,223,'PW',1),
(3663,223,'PA',1),
(3664,223,'PR',1),
(3665,223,'RI',1),
(3666,223,'SC',1),
(3667,223,'SD',1),
(3668,223,'TN',1),
(3669,223,'TX',1),
(3670,223,'UT',1),
(3671,223,'VT',1),
(3672,223,'VI',1),
(3673,223,'VA',1),
(3674,223,'WA',1),
(3675,223,'WV',1),
(3676,223,'WI',1),
(3677,223,'WY',1),
(3678,224,'BI',1),
(3679,224,'HI',1),
(3680,224,'JI',1),
(3681,224,'JA',1),
(3682,224,'KR',1),
(3683,224,'MA',1),
(3684,224,'NI',1),
(3685,224,'PA',1),
(3686,224,'WI',1),
(3687,225,'AR',1),
(3688,225,'CA',1),
(3689,225,'CL',1),
(3690,225,'CO',1),
(3691,225,'DU',1),
(3692,225,'FS',1),
(3693,225,'FA',1),
(3694,225,'LA',1),
(3695,225,'MA',1),
(3696,225,'MO',1),
(3697,225,'PA',1),
(3698,225,'RN',1),
(3699,225,'RV',1),
(3700,225,'RO',1),
(3701,225,'SL',1),
(3702,225,'SJ',1),
(3703,225,'SO',1),
(3704,225,'TA',1),
(3705,225,'TT',1),
(3706,226,'AN',1),
(3707,226,'BU',1),
(3708,226,'FA',1),
(3709,226,'JI',1),
(3710,226,'NG',1),
(3711,226,'NW',1),
(3712,226,'QA',1),
(3713,226,'QR',1),
(3714,226,'SA',1),
(3715,226,'SI',1),
(3716,226,'SU',1),
(3717,226,'TK',1),
(3718,226,'TO',1),
(3719,226,'XO',1),
(3720,227,'MA',1),
(3721,227,'PE',1),
(3722,227,'SA',1),
(3723,227,'SH',1),
(3724,227,'TA',1),
(3725,227,'TO',1),
(3726,229,'Z',1),
(3727,229,'B',1),
(3728,229,'C',1),
(3729,229,'D',1),
(3730,229,'E',1),
(3731,229,'F',1),
(3732,229,'G',1),
(3733,229,'H',1),
(3734,229,'Y',1),
(3735,229,'W',1),
(3736,229,'A',1),
(3737,229,'I',1),
(3738,229,'J',1),
(3739,229,'K',1),
(3740,229,'L',1),
(3741,229,'M',1),
(3742,229,'N',1),
(3743,229,'O',1),
(3744,229,'P',1),
(3745,229,'R',1),
(3746,229,'S',1),
(3747,229,'T',1),
(3748,229,'X',1),
(3749,229,'U',1),
(3750,229,'V',1),
(3751,230,'AG',1),
(3752,230,'BG',1),
(3753,230,'BK',1),
(3754,230,'BL',1),
(3755,230,'BC',1),
(3756,230,'BR',1),
(3757,230,'BN',1),
(3758,230,'BH',1),
(3759,230,'BU',1),
(3760,230,'BP',1),
(3761,230,'BT',1),
(3762,230,'CM',1),
(3763,230,'CT',1),
(3764,230,'CB',1),
(3765,230,'DL',1),
(3766,230,'DG',1),
(3767,230,'DN',1),
(3768,230,'DB',1),
(3769,230,'DI',1),
(3770,230,'DT',1),
(3771,230,'GL',1),
(3772,230,'HG',1),
(3773,230,'HD',1),
(3774,230,'HP',1),
(3775,230,'HM',1),
(3776,230,'HI',1),
(3777,230,'HT',1),
(3778,230,'HH',1),
(3779,230,'HB',1),
(3780,230,'HC',1),
(3781,230,'HU',1),
(3782,230,'HY',1),
(3783,232,'C',1),
(3784,232,'J',1),
(3785,232,'T',1),
(3786,233,'A',1),
(3787,233,'S',1),
(3788,233,'W',1),
(3789,235,'AB',1),
(3790,235,'AD',1),
(3791,235,'AM',1),
(3792,235,'BA',1),
(3793,235,'DA',1),
(3794,235,'DH',1),
(3795,235,'HD',1),
(3796,235,'HJ',1),
(3797,235,'HU',1),
(3798,235,'IB',1),
(3799,235,'JA',1),
(3800,235,'LA',1),
(3801,235,'MA',1),
(3802,235,'MR',1),
(3803,235,'MW',1),
(3804,235,'SD',1),
(3805,235,'SN',1),
(3806,235,'SH',1),
(3807,235,'TA',1),
(3812,237,'BC',1),
(3813,237,'BN',1),
(3814,237,'EQ',1),
(3815,237,'KA',1),
(3816,237,'KE',1),
(3817,237,'KN',1),
(3818,237,'KW',1),
(3819,237,'MA',1),
(3820,237,'NK',1),
(3821,237,'OR',1),
(3822,237,'SK',1),
(3823,238,'CE',1),
(3824,238,'CB',1),
(3825,238,'EA',1),
(3826,238,'LP',1),
(3827,238,'LK',1),
(3828,238,'NO',1),
(3829,238,'NW',1),
(3830,238,'SO',1),
(3831,238,'WE',1),
(3832,239,'BU',1),
(3833,239,'HA',1),
(3834,239,'ML',1),
(3835,239,'MC',1),
(3836,239,'ME',1),
(3837,239,'MW',1),
(3838,239,'MV',1),
(3839,239,'MN',1),
(3840,239,'MS',1),
(3841,239,'MD',1),
(3842,105,'AG',1),
(3843,105,'AL',1),
(3844,105,'AN',1),
(3845,105,'AO',1),
(3846,105,'AR',1),
(3847,105,'AP',1),
(3848,105,'AT',1),
(3849,105,'AV',1),
(3850,105,'BA',1),
(3851,105,'BL',1),
(3852,105,'BN',1),
(3853,105,'BG',1),
(3854,105,'BI',1),
(3855,105,'BO',1),
(3856,105,'BZ',1),
(3857,105,'BS',1),
(3858,105,'BR',1),
(3859,105,'CA',1),
(3860,105,'CL',1),
(3861,105,'CB',1),
(3863,105,'CE',1),
(3864,105,'CT',1),
(3865,105,'CZ',1),
(3866,105,'CH',1),
(3867,105,'CO',1),
(3868,105,'CS',1),
(3869,105,'CR',1),
(3870,105,'KR',1),
(3871,105,'CN',1),
(3872,105,'EN',1),
(3873,105,'FE',1),
(3874,105,'FI',1),
(3875,105,'FG',1),
(3876,105,'FC',1),
(3877,105,'FR',1),
(3878,105,'GE',1),
(3879,105,'GO',1),
(3880,105,'GR',1),
(3881,105,'IM',1),
(3882,105,'IS',1),
(3883,105,'AQ',1),
(3884,105,'SP',1),
(3885,105,'LT',1),
(3886,105,'LE',1),
(3887,105,'LC',1),
(3888,105,'LI',1),
(3889,105,'LO',1),
(3890,105,'LU',1),
(3891,105,'MC',1),
(3892,105,'MN',1),
(3893,105,'MS',1),
(3894,105,'MT',1),
(3896,105,'ME',1),
(3897,105,'MI',1),
(3898,105,'MO',1),
(3899,105,'NA',1),
(3900,105,'NO',1),
(3901,105,'NU',1),
(3904,105,'OR',1),
(3905,105,'PD',1),
(3906,105,'PA',1),
(3907,105,'PR',1),
(3908,105,'PV',1),
(3909,105,'PG',1),
(3910,105,'PU',1),
(3911,105,'PE',1),
(3912,105,'PC',1),
(3913,105,'PI',1),
(3914,105,'PT',1),
(3915,105,'PN',1),
(3916,105,'PZ',1),
(3917,105,'PO',1),
(3918,105,'RG',1),
(3919,105,'RA',1),
(3920,105,'RC',1),
(3921,105,'RE',1),
(3922,105,'RI',1),
(3923,105,'RN',1),
(3924,105,'RM',1),
(3925,105,'RO',1),
(3926,105,'SA',1),
(3927,105,'SS',1),
(3928,105,'SV',1),
(3929,105,'SI',1),
(3930,105,'SR',1),
(3931,105,'SO',1),
(3932,105,'TA',1),
(3933,105,'TE',1),
(3934,105,'TR',1),
(3935,105,'TO',1),
(3936,105,'TP',1),
(3937,105,'TN',1),
(3938,105,'TV',1),
(3939,105,'TS',1),
(3940,105,'UD',1),
(3941,105,'VA',1),
(3942,105,'VE',1),
(3943,105,'VB',1),
(3944,105,'VC',1),
(3945,105,'VR',1),
(3946,105,'VV',1),
(3947,105,'VI',1),
(3948,105,'VT',1),
(3949,222,'ANT',1),
(3950,222,'ARM',1),
(3951,222,'DOW',1),
(3952,222,'FER',1),
(3953,222,'LDY',1),
(3954,222,'TYR',1),
(3955,222,'CMA',1),
(3956,190,'1',1),
(3957,190,'2',1),
(3958,190,'3',1),
(3959,190,'4',1),
(3960,190,'5',1),
(3961,190,'6',1),
(3962,190,'7',1),
(3963,190,'8',1),
(3964,190,'9',1),
(3965,190,'10',1),
(3966,190,'11',1),
(3967,190,'12',1),
(3968,33,'',1),
(3969,101,'ALB',1),
(3970,21,'BRU',1),
(3971,138,'AG',1),
(3973,242,'01',1),
(3974,242,'02',1),
(3975,242,'03',1),
(3976,242,'04',1),
(3977,242,'05',1),
(3978,242,'06',1),
(3979,242,'07',1),
(3980,242,'08',1),
(3981,242,'09',1),
(3982,242,'10',1),
(3983,242,'11',1),
(3984,242,'12',1),
(3985,242,'13',1),
(3986,242,'14',1),
(3987,242,'15',1),
(3988,242,'16',1),
(3989,242,'17',1),
(3990,242,'18',1),
(3991,242,'19',1),
(3992,242,'20',1),
(3993,242,'21',1),
(3994,243,'00',1),
(3995,243,'01',1),
(3996,243,'02',1),
(3997,243,'03',1),
(3998,243,'04',1),
(3999,243,'05',1),
(4000,243,'06',1),
(4001,243,'07',1),
(4002,243,'08',1),
(4003,243,'09',1),
(4004,243,'10',1),
(4005,243,'11',1),
(4006,243,'12',1),
(4007,243,'13',1),
(4008,243,'14',1),
(4009,243,'15',1),
(4010,243,'16',1),
(4011,243,'17',1),
(4012,243,'18',1),
(4013,243,'19',1),
(4014,243,'20',1),
(4015,243,'21',1),
(4016,243,'22',1),
(4017,243,'23',1),
(4018,243,'24',1),
(4020,245,'BO',1),
(4021,245,'SA',1),
(4022,245,'SE',1),
(4023,248,'EC',1),
(4024,248,'EE',1),
(4025,248,'JG',1),
(4026,248,'LK',1),
(4027,248,'BN',1),
(4028,248,'UY',1),
(4029,248,'NU',1),
(4030,248,'WR',1),
(4031,248,'BW',1),
(4032,248,'EW',1),
(4035,129,'MY-16',1),
(4038,117,'002',1),
(4040,117,'003',1),
(4042,117,'004',1),
(4044,117,'005',1),
(4045,117,'006',1),
(4047,117,'007',1),
(4048,117,'008',1),
(4050,117,'008',1),
(4052,117,'010',1),
(4053,117,'011',1),
(4054,117,'012',1),
(4056,117,'013',1),
(4058,117,'014',1),
(4060,117,'015',1),
(4062,117,'016',1),
(4063,117,'017',1),
(4065,117,'018',1),
(4066,117,'019',1),
(4067,117,'020',1),
(4069,117,'021',1),
(4071,117,'022',1),
(4072,117,'023',1),
(4074,117,'024',1),
(4075,117,'DGV',1),
(4076,117,'025',1),
(4078,117,'026',1),
(4079,117,'027',1),
(4081,117,'028',1),
(4082,117,'029',1),
(4083,117,'030',1),
(4084,117,'031',1),
(4086,117,'032',1),
(4088,117,'033',1),
(4089,117,'034',1),
(4091,117,'035',1),
(4093,117,'036',1),
(4094,117,'037',1),
(4096,117,'038',1),
(4097,117,'039',1),
(4098,117,'040',1),
(4099,117,'JEL',1),
(4100,117,'041',1),
(4101,117,'JKB',1),
(4102,117,'042',1),
(4103,117,'JUR',1),
(4106,117,'043',1),
(4108,117,'044',1),
(4110,117,'046',1),
(4112,117,'047',1),
(4113,117,'048',1),
(4114,117,'049',1),
(4116,117,'050',1),
(4117,117,'051',1),
(4119,117,'052',1),
(4121,117,'053',1),
(4122,117,'LPX',1),
(4124,117,'054',1),
(4126,117,'055',1),
(4128,117,'056',1),
(4130,117,'057',1),
(4132,117,'058',1),
(4134,117,'059',1),
(4136,117,'060',1),
(4137,117,'061',1),
(4138,117,'062',1),
(4139,117,'063',1),
(4140,117,'064',1),
(4141,117,'065',1),
(4142,117,'066',1),
(4144,117,'067',1),
(4146,117,'068',1),
(4147,117,'069',1),
(4148,117,'070',1),
(4150,117,'071',1),
(4153,117,'072',1),
(4155,117,'073',1),
(4157,117,'074',1),
(4158,117,'075',1),
(4159,117,'076',1),
(4160,117,'REZ',1),
(4161,117,'077',1),
(4162,117,'078',1),
(4163,117,'RIX',1),
(4164,117,'079',1),
(4165,117,'080',1),
(4166,117,'081',1),
(4167,117,'082',1),
(4168,117,'083',1),
(4170,117,'084',1),
(4173,117,'086',1),
(4174,117,'085',1),
(4175,117,'087',1),
(4177,117,'088',1),
(4178,117,'0840201',1),
(4180,117,'089',1),
(4182,117,'090',1),
(4184,117,'091',1),
(4185,117,'092',1),
(4187,117,'093',1),
(4189,117,'094',1),
(4192,117,'095',1),
(4194,117,'096',1),
(4197,117,'097',1),
(4198,117,'098',1),
(4199,117,'099',1),
(4201,117,'100',1),
(4204,117,'101',1),
(4205,117,'VMR',1),
(4208,117,'102',1),
(4209,117,'103',1),
(4210,117,'104',1),
(4211,117,'105',1),
(4212,117,'VEN',1),
(4213,117,'106',1),
(4215,117,'107',1),
(4217,117,'108',1),
(4219,117,'109',1),
(4221,117,'110',1),
(4222,43,'AP',1),
(4223,43,'LR',1),
(4224,220,'63',1),
(4225,118,'LB-BR',1),
(4226,118,'LB-BE',1),
(4227,118,'LB-ML',1),
(4228,118,'LB-NB',1),
(4229,118,'LB-NR',1),
(4230,118,'LB-ST',1),
(4231,99,'TS',1),
(4232,44,'QH',1),
(4233,100,'PB',1),
(4234,100,'SR',1),
(4235,100,'KR',1),
(4236,105,'BT',1),
(4237,105,'FM',1),
(4238,105,'MB',1),
(4239,113,'11',1),
(4240,113,'26',1),
(4241,113,'27',1),
(4242,113,'30',1),
(4243,113,'29',1),
(4244,113,'28',1),
(4245,113,'31',1),
(4246,113,'43',1),
(4247,113,'44',1),
(4248,113,'42',1),
(4249,113,'41',1),
(4250,113,'47',1),
(4251,113,'48',1),
(4252,113,'45',1),
(4253,113,'46',1),
(4254,113,'49',1),
(4255,113,'50',1),
(4256,209,'14',1),
(4257,176,'RU-AD',1),
(4258,176,'RU-BA',1),
(4259,176,'RU-BU',1),
(4260,176,'RU-AL',1),
(4261,176,'RU-DA',1),
(4262,176,'RU-IN',1),
(4263,176,'RU-KB',1),
(4264,176,'RU-KL',1),
(4265,176,'RU-KC',1),
(4266,176,'RU-KR',1),
(4267,176,'RU-KO',1),
(4268,176,'RU-ME',1),
(4269,176,'RU-MO',1),
(4270,176,'RU-SA',1),
(4271,176,'RU-SE',1),
(4272,176,'RU-TA',1),
(4273,176,'RU-TY',1),
(4274,176,'RU-UD',1),
(4275,176,'RU-KK',1),
(4276,176,'RU-CE',1),
(4277,176,'RU-CU',1),
(4278,176,'RU-ALT',1),
(4279,176,'RU-KDA',1),
(4280,176,'RU-KYA',1),
(4281,176,'RU-PRI',1),
(4282,176,'RU-STA',1),
(4283,176,'RU-KHA',1),
(4284,176,'RU-AMU',1),
(4285,176,'RU-ARK',1),
(4286,176,'RU-AST',1),
(4287,176,'RU-BEL',1),
(4288,176,'RU-BRY',1),
(4289,176,'RU-VLA',1),
(4290,176,'RU-VGG',1),
(4291,176,'RU-VLG',1),
(4292,176,'RU-VOR',1),
(4293,176,'RU-IVA',1),
(4294,176,'RU-IRK',1),
(4295,176,'RU-KGD',1),
(4296,176,'RU-KLU',1),
(4297,176,'RU-KAM',1),
(4298,176,'RU-KEM',1),
(4299,176,'RU-KIR',1),
(4300,176,'RU-KOS',1),
(4301,176,'RU-KGN',1),
(4302,176,'RU-KRS',1),
(4303,176,'RU-LEN',1),
(4304,176,'RU-LIP',1),
(4305,176,'RU-MAG',1),
(4306,176,'RU-MOS',1),
(4307,176,'RU-MUR',1),
(4308,176,'RU-NIZ',1),
(4309,176,'RU-NGR',1),
(4310,176,'RU-NVS',1),
(4311,176,'RU-OMS',1),
(4312,176,'RU-ORE',1),
(4313,176,'RU-ORL',1),
(4314,176,'RU-PNZ',1),
(4315,176,'RU-PER',1),
(4316,176,'RU-PSK',1),
(4317,176,'RU-ROS',1),
(4318,176,'RU-RYA',1),
(4319,176,'RU-SAM',1),
(4320,176,'RU-SAR',1),
(4321,176,'RU-SAK',1),
(4322,176,'RU-SVE',1),
(4323,176,'RU-SMO',1),
(4324,176,'RU-TAM',1),
(4325,176,'RU-TVE',1),
(4326,176,'RU-TOM',1),
(4327,176,'RU-TUL',1),
(4328,176,'RU-TYU',1),
(4329,176,'RU-ULY',1),
(4330,176,'RU-CHE',1),
(4331,176,'RU-ZAB',1),
(4332,176,'RU-YAR',1),
(4333,176,'RU-MOW',1),
(4334,176,'RU-SPE',1),
(4335,176,'RU-YEV',1),
(4336,176,'RU-NEN',1),
(4337,176,'RU-KHM',1),
(4338,176,'RU-CHU',1),
(4339,176,'RU-YAN',1),
(4340,117,'001',1),
(4341,99,'CT',1),
(4342,99,'LA',1),
(4343,99,'UT',1),
(4439,105,'SO-E01',1),
(4440,105,'CO-E01',1),
(4441,84,'AO',1),
(4442,109,'ABA',1),
(4443,109,'JET',1),
(4444,109,'SHY',1),
(4445,109,'ULY',1),
(4446,97,'HU-BA',1),
(4447,97,'HU-BK',1),
(4448,97,'HU-BE',1),
(4449,97,'HU-BZ',1),
(4450,97,'HU-BU',1),
(4451,97,'HU-CS',1),
(4452,97,'HU-FE',1),
(4453,97,'HU-GS',1),
(4454,97,'HU-HB',1),
(4455,97,'HU-HE',1),
(4456,97,'HU-JN',1),
(4457,97,'HU-KE',1),
(4458,97,'HU-NO',1),
(4459,97,'HU-PE',1),
(4460,97,'HU-SO',1),
(4461,97,'HU-SZ',1),
(4462,97,'HU-TO',1),
(4463,97,'HU-VA',1),
(4464,97,'HU-VE',1),
(4465,97,'HU-ZA',1),
(4466,126,'MK001',1),
(4467,126,'MK002',1),
(4468,126,'MK003',1),
(4469,126,'MK004',1),
(4470,126,'MK005',1),
(4471,126,'MK006',1),
(4472,126,'MK007',1),
(4473,126,'MK008',1);

--
-- Table structure for table `oc_zone_description`
--

DROP TABLE IF EXISTS `oc_zone_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_zone_description` (
  `zone_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`zone_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_zone_description`
--

INSERT INTO `oc_zone_description` VALUES
(3507,1,'\'Ajman'),
(919,1,'\'Ali Sabih'),
(1704,1,'\'Amman'),
(2881,1,'\'Asir'),
(3034,1,'A\'ali an Nil'),
(2852,1,'A\'ana'),
(3095,1,'Aargau'),
(4442,1,'Abai'),
(1741,1,'Abaiang'),
(1742,1,'Abemama'),
(789,1,'Abengourou'),
(3513,1,'Aberdeen'),
(3514,1,'Aberdeenshire'),
(2388,1,'Abia'),
(790,1,'Abidjan'),
(1242,1,'Abkhazia'),
(791,1,'Aboisso'),
(2552,1,'Abra'),
(209,1,'Abseron'),
(3506,1,'Abu Dhabi'),
(2389,1,'Abuja Federal Capital Territory'),
(3789,1,'Abyan'),
(1507,1,'Aceh'),
(284,1,'Acklins'),
(2649,1,'Açores'),
(2863,1,'Acquaviva'),
(440,1,'Acre'),
(2449,1,'Ad Dakhiliyah'),
(2260,1,'Ad Dakhla'),
(3793,1,'Ad Dali'),
(1001,1,'Ad Daqahliyah'),
(2669,1,'Ad Dawhah'),
(2390,1,'Adamawa'),
(592,1,'Adamawa (Adamaoua)'),
(3790,1,'Adan'),
(3315,1,'Adana'),
(4053,1,'Ādažu novads'),
(1078,1,'Addis Ababa'),
(2005,1,'Addu'),
(1219,1,'Adelie Land'),
(792,1,'Adiake'),
(3316,1,'Adıyaman'),
(3452,1,'Adjumani'),
(69,1,'Adrar'),
(2116,1,'Adrar'),
(4257,1,'Adygea, Republic of'),
(793,1,'Adzope'),
(1069,1,'Afar'),
(3317,1,'Afyonkarahisar'),
(2380,1,'Agadez'),
(2221,1,'Agadir'),
(2134,1,'Agalega Islands'),
(794,1,'Agboville'),
(210,1,'AgcabAdi'),
(211,1,'Agdam'),
(212,1,'Agdas'),
(4340,1,'Aglonas novads'),
(795,1,'Agnibilekrou'),
(3842,1,'Agrigento'),
(3318,1,'Ağrı'),
(213,1,'Agstafa'),
(214,1,'Agsu'),
(3971,1,'Aguascalientes'),
(2553,1,'Agusan del Norte'),
(2554,1,'Agusan del Sur'),
(3396,1,'Ahal Welayaty'),
(1027,1,'Ahuachapan'),
(1085,1,'Ahvenanmaan lääni'),
(1657,1,'Aichi'),
(2853,1,'Aiga-i-le-Tai'),
(966,1,'Aileu'),
(2083,1,'Ailinginae'),
(2084,1,'Ailinglaplap'),
(2085,1,'Ailuk'),
(2463,1,'Aimeliik'),
(1114,1,'Ain'),
(70,1,'Ain Defla'),
(71,1,'Ain Temouchent'),
(967,1,'Ainaro'),
(2464,1,'Airai'),
(671,1,'Aisen del General Carlos Ibanez'),
(1115,1,'Aisne'),
(774,1,'Aitutaki'),
(2301,1,'Aiwo'),
(4038,1,'Aizkraukles novads'),
(4040,1,'Aizputes novads'),
(1243,1,'Ajaria'),
(1875,1,'Ajdabiya'),
(1705,1,'Ajlun'),
(2429,1,'Akershus'),
(1658,1,'Akita'),
(2555,1,'Aklan'),
(4042,1,'Aknīstes novads'),
(3319,1,'Aksaray'),
(2391,1,'Akwa Ibom'),
(1706,1,'Al \'Aqabah'),
(1788,1,'Al \'Asimah'),
(1876,1,'Al \'Aziziyah'),
(1789,1,'Al Ahmadi'),
(1580,1,'Al Anbar'),
(2874,1,'Al Bahah'),
(1002,1,'Al Bahr al Ahmar'),
(3035,1,'Al Bahr al Ahmar'),
(1707,1,'Al Balqa\''),
(1573,1,'Al Basrah'),
(2450,1,'Al Batinah'),
(3792,1,'Al Bayda'),
(1003,1,'Al Buhayrah'),
(3036,1,'Al Buhayrat'),
(1790,1,'Al Farwaniyah'),
(1877,1,'Al Fatih'),
(1004,1,'Al Fayyum'),
(3508,1,'Al Fujayrah'),
(1005,1,'Al Gharbiyah'),
(2670,1,'Al Ghuwayriyah'),
(3121,1,'Al Hasakah'),
(2222,1,'Al Hoceima'),
(3797,1,'Al Hudaydah'),
(2875,1,'Al Hudud ash Shamaliyah'),
(1006,1,'Al Iskandariyah'),
(1007,1,'Al Isma\'iliyah'),
(1878,1,'Al Jabal al Akhdar'),
(1791,1,'Al Jahra\''),
(2876,1,'Al Jawf'),
(3799,1,'Al Jawf'),
(3037,1,'Al Jazirah'),
(1008,1,'Al Jizah'),
(1879,1,'Al Jufrah'),
(2671,1,'Al Jumayliyah'),
(1708,1,'Al Karak'),
(1578,1,'Al Karbala'),
(3038,1,'Al Khartum'),
(2672,1,'Al Khawr'),
(1880,1,'Al Khums'),
(1881,1,'Al Kufrah'),
(3122,1,'Al Ladhiqiyah'),
(2877,1,'Al Madinah'),
(1709,1,'Al Mafraq'),
(3802,1,'Al Mahrah'),
(3803,1,'Al Mahwit'),
(1009,1,'Al Minufiyah'),
(1010,1,'Al Minya'),
(1575,1,'Al Muthanna'),
(3039,1,'Al Qadarif'),
(1576,1,'Al Qadisyah'),
(1011,1,'Al Qahirah'),
(1012,1,'Al Qalyubiyah'),
(2878,1,'Al Qasim'),
(3123,1,'Al Qunaytirah'),
(1013,1,'Al Wadi al Jadid'),
(3040,1,'Al Wahdah'),
(2673,1,'Al Wakrah'),
(2451,1,'Al Wusta'),
(3613,1,'Alabama'),
(441,1,'Alagoas'),
(782,1,'Alajuela'),
(3614,1,'Alaska'),
(2971,1,'Álava'),
(2679,1,'Alba'),
(2972,1,'Albacete'),
(2556,1,'Albay'),
(602,1,'Alberta'),
(3969,1,'Alborz'),
(796,1,'Alepe'),
(3843,1,'Alessandria'),
(72,1,'Alger'),
(208,1,'Ali Bayramli'),
(360,1,'Alibori'),
(2973,1,'Alicante'),
(1116,1,'Allier'),
(1716,1,'Almaty'),
(1717,1,'Almaty City'),
(2974,1,'Almeria'),
(3786,1,'Alo'),
(4044,1,'Alojas novads'),
(1117,1,'Alpes de Haute Provence'),
(1119,1,'Alpes Maritimes'),
(4045,1,'Alsungas novads'),
(1304,1,'Alta Verapaz'),
(4278,1,'Altai Krai'),
(4260,1,'Altai Republic'),
(2509,1,'Alto Paraguay'),
(2510,1,'Alto Parana'),
(4047,1,'Alūksnes novads'),
(1911,1,'Alytus'),
(2511,1,'Amambay'),
(442,1,'Amapá'),
(3320,1,'Amasya'),
(4048,1,'Amatas novads'),
(443,1,'Amazonas'),
(720,1,'Amazonas'),
(2527,1,'Amazonas'),
(3726,1,'Amazonas'),
(3401,1,'Ambergris Cays'),
(3615,1,'American Samoa'),
(1070,1,'Amhara'),
(3189,1,'Amnat Charoen'),
(3791,1,'Amran'),
(4284,1,'Amur Oblast'),
(3751,1,'An Giang'),
(1579,1,'An Najaf'),
(3041,1,'An Nil al Abyad'),
(3042,1,'An Nil al Azraq'),
(1882,1,'An Nuqat al Khams'),
(2302,1,'Anabar'),
(2392,1,'Anambra'),
(2528,1,'Ancash'),
(3844,1,'Ancona'),
(1475,1,'Andaman and Nicobar Islands'),
(1476,1,'Andhra Pradesh'),
(3706,1,'Andijon'),
(122,1,'Andorra la Vella'),
(3973,1,'Andrijevica'),
(2303,1,'Anetan'),
(3190,1,'Ang Thong'),
(2465,1,'Angaur'),
(3515,1,'Anglesey'),
(3516,1,'Angus'),
(684,1,'Anhui'),
(2304,1,'Anibare'),
(754,1,'Anjouan'),
(3321,1,'Ankara'),
(73,1,'Annaba'),
(2898,1,'Anse aux Pins'),
(2899,1,'Anse Boileau'),
(2900,1,'Anse Etoile'),
(2901,1,'Anse Louis'),
(2902,1,'Anse Royale'),
(2835,1,'Anse-la-Raye'),
(1049,1,'Anseba (Keren)'),
(3322,1,'Antalya'),
(1938,1,'Antananarivo'),
(155,1,'Antartida e Islas del Atlantico'),
(721,1,'Antioquia'),
(2557,1,'Antique'),
(672,1,'Antofagasta'),
(1939,1,'Antsiranana'),
(344,1,'Antwerpen'),
(3727,1,'Anzoategui'),
(1659,1,'Aomori'),
(3845,1,'Aosta'),
(3453,1,'Apac'),
(2558,1,'Apayao'),
(4050,1,'Apes novads'),
(3096,1,'Appenzell Ausserrhoden'),
(3097,1,'Appenzell Innerrhoden'),
(3728,1,'Apure'),
(2529,1,'Apurimac'),
(1718,1,'Aqmola'),
(1719,1,'Aqtobe'),
(3124,1,'Ar Raqqah'),
(2674,1,'Ar Rayyan'),
(2879,1,'Ar Riyad'),
(2680,1,'Arad'),
(180,1,'Aragatsotn'),
(3729,1,'Aragua'),
(1743,1,'Aranuka'),
(181,1,'Ararat'),
(722,1,'Arauca'),
(673,1,'Araucania'),
(1583,1,'Arbil'),
(1210,1,'Archipel des Marquises'),
(1211,1,'Archipel des Tuamotu'),
(1212,1,'Archipel des Tubuai'),
(1543,1,'Ardabil'),
(3323,1,'Ardahan'),
(1120,1,'Ardèche'),
(1121,1,'Ardennes'),
(2530,1,'Arequipa'),
(3846,1,'Arezzo'),
(2681,1,'Argeș'),
(3517,1,'Argyll and Bute'),
(2217,1,'Arhangay'),
(1995,1,'Ari Atoll Dheknu'),
(1994,1,'Ari Atoll Uthuru'),
(3291,1,'Ariana'),
(4222,1,'Arica y Parinacota'),
(1122,1,'Ariège'),
(3287,1,'Arima'),
(3616,1,'Arizona'),
(3617,1,'Arkansas'),
(4285,1,'Arkhangelsk Oblast'),
(182,1,'Armavir'),
(3618,1,'Armed Forces Africa'),
(3619,1,'Armed Forces Americas'),
(3620,1,'Armed Forces Canada'),
(3621,1,'Armed Forces Europe'),
(3622,1,'Armed Forces Middle East'),
(3623,1,'Armed Forces Pacific'),
(2086,1,'Arno'),
(1744,1,'Arorae'),
(1379,1,'Artibonite'),
(3687,1,'Artigas'),
(3324,1,'Artvin'),
(3454,1,'Arua'),
(1477,1,'Arunachal Pradesh'),
(3163,1,'Arusha'),
(1585,1,'As Sulaymaniyah'),
(3125,1,'As Suwayda'),
(1015,1,'As Suways'),
(3847,1,'Ascoli Piceno'),
(3043,1,'Ash Shamaliyah'),
(3509,1,'Ash Shāriqah'),
(1014,1,'Ash Sharqiyah'),
(2452,1,'Ash Sharqiyah'),
(2880,1,'Ash Sharqiyah (Eastern)'),
(1883,1,'Ash Shati\''),
(1270,1,'Ashanti Region'),
(2117,1,'Assaba'),
(1478,1,'Assam'),
(1720,1,'Astana City'),
(215,1,'Astara'),
(3848,1,'Asti'),
(4286,1,'Astrakhan Oblast'),
(2975,1,'Asturias'),
(2512,1,'Asuncion'),
(1016,1,'Aswan'),
(1017,1,'Asyut'),
(1710,1,'At Tafilah'),
(674,1,'Atacama'),
(3270,1,'Atafu'),
(361,1,'Atakora'),
(778,1,'Atiu'),
(723,1,'Atlantico'),
(2363,1,'Atlantico Norte'),
(2364,1,'Atlantico Sur'),
(1392,1,'Atlantida'),
(362,1,'Atlantique'),
(1802,1,'Attapu'),
(2015,1,'Attard'),
(1280,1,'Attica'),
(2854,1,'Atua'),
(1721,1,'Atyrau'),
(1123,1,'Aube'),
(4052,1,'Auces novads'),
(2344,1,'Auckland'),
(1124,1,'Aude'),
(2087,1,'Aur'),
(2559,1,'Aurora'),
(2430,1,'Aust-Agder'),
(191,1,'Australian Capital Territory'),
(1467,1,'Austurland'),
(1293,1,'Avannaa'),
(2650,1,'Aveiro'),
(3849,1,'Avellino'),
(1125,1,'Aveyron'),
(2976,1,'Ávila'),
(3483,1,'Avtonomna Respublika Krym'),
(1884,1,'Awbari'),
(2943,1,'Awdal'),
(2531,1,'Ayacucho'),
(3325,1,'Aydın'),
(2274,1,'Ayeyarwady'),
(2453,1,'Az Zahirah'),
(1711,1,'Az Zarqa\''),
(1885,1,'Az Zawiyah'),
(2223,1,'Azilal'),
(935,1,'Azua'),
(979,1,'Azuay'),
(3756,1,'Ba Ria-Vung Tau'),
(217,1,'BabAk'),
(1577,1,'Babil'),
(4054,1,'Babītes novads'),
(3752,1,'Bac Giang'),
(3753,1,'Bac Kan'),
(3754,1,'Bac Lieu'),
(3755,1,'Bac Ninh'),
(2682,1,'Bacău'),
(4447,1,'Bács-Kiskun'),
(2977,1,'Badajoz'),
(1,1,'Badakhshan'),
(1254,1,'Baden-Württemberg'),
(2,1,'Badghis'),
(1360,1,'Bafata Region'),
(1568,1,'Baghdad'),
(3,1,'Baghlan'),
(2315,1,'Bagmati'),
(2275,1,'Bago'),
(444,1,'Bahia'),
(3044,1,'Bahr al Jabal'),
(2903,1,'Baie Lazare'),
(2904,1,'Baie Sainte Anne'),
(2305,1,'Baiti'),
(2146,1,'Baja California'),
(2147,1,'Baja California Sur'),
(1305,1,'Baja Verapaz'),
(3678,1,'Baker Island'),
(216,1,'Baki'),
(2944,1,'Bakool'),
(1944,1,'Balaka'),
(218,1,'BalakAn'),
(4056,1,'Baldones novads'),
(506,1,'Bale'),
(2978,1,'Baleares'),
(1508,1,'Bali'),
(3326,1,'Balıkesir'),
(3397,1,'Balkan Welayaty'),
(4,1,'Balkh'),
(2457,1,'Balochistan'),
(2183,1,'Balti'),
(4058,1,'Baltinavas novads'),
(4060,1,'Balvu novads'),
(2016,1,'Balzan'),
(1902,1,'Balzers'),
(507,1,'Bam'),
(2014,1,'Bamako Capital District'),
(5,1,'Bamian'),
(640,1,'Bamingui-Bangoran'),
(2945,1,'Banaadir'),
(1745,1,'Banaba'),
(3813,1,'Bandundu'),
(1886,1,'Banghazi'),
(3192,1,'Bangkok'),
(798,1,'Bangolo'),
(656,1,'Bangui'),
(1018,1,'Bani Suwayf'),
(423,1,'Banja Luka'),
(1229,1,'Banjul'),
(2925,1,'Banskobystrický'),
(571,1,'Banteay Meanchey'),
(1509,1,'Banten'),
(508,1,'Banwa'),
(936,1,'Baoruco'),
(3974,1,'Bar'),
(937,1,'Barahona'),
(4446,1,'Baranya'),
(153,1,'Barbuda'),
(2979,1,'Barcelona'),
(219,1,'BArdA'),
(2946,1,'Bari'),
(3850,1,'Bari'),
(1369,1,'Barima-Waini'),
(3730,1,'Barinas'),
(320,1,'Barisal'),
(4236,1,'Barletta-Andria-Trani'),
(3327,1,'Bartın'),
(1181,1,'Bas Rhin'),
(3812,1,'Bas-Congo'),
(3099,1,'Basel-Landschaft'),
(3098,1,'Basel-Stadt'),
(4258,1,'Bashkortostan, Republic of'),
(2560,1,'Basilan'),
(1230,1,'Basse'),
(641,1,'Basse-Kotto'),
(2561,1,'Bataan'),
(2562,1,'Batanes'),
(2563,1,'Batangas'),
(657,1,'Batha'),
(1794,1,'Batken'),
(3328,1,'Batman'),
(74,1,'Batna'),
(572,1,'Battambang'),
(1722,1,'Batys Qazaqstan'),
(968,1,'Baucau'),
(2393,1,'Bauchi'),
(4062,1,'Bauskas novads'),
(2947,1,'Bay'),
(2345,1,'Bay of Plenty'),
(2216,1,'Bayan-Olgiy'),
(2215,1,'Bayanhongor'),
(3329,1,'Bayburt'),
(2394,1,'Bayelsa'),
(1255,1,'Bayern'),
(1723,1,'Bayqongyr City'),
(509,1,'Bazega'),
(1612,1,'Be\'er Sheva'),
(2129,1,'Beau Bassin-Rose Hill'),
(2905,1,'Beau Vallon'),
(75,1,'Bechar'),
(3518,1,'Bedfordshire'),
(685,1,'Beijing'),
(4225,1,'Beirut'),
(2651,1,'Beja'),
(3292,1,'Beja'),
(76,1,'Bejaia'),
(4226,1,'Bekaa'),
(4448,1,'Békés'),
(2906,1,'Bel Air'),
(2907,1,'Bel Ombre'),
(475,1,'Belait'),
(4287,1,'Belgorod Oblast'),
(3994,1,'Belgrade'),
(354,1,'Belize'),
(3851,1,'Belluno'),
(3293,1,'Ben Arous'),
(2225,1,'Ben Slimane'),
(3757,1,'Ben Tre'),
(3852,1,'Benevento'),
(1510,1,'Bengkulu'),
(129,1,'Bengo'),
(130,1,'Benguela'),
(2565,1,'Benguet'),
(403,1,'Beni'),
(2224,1,'Beni Mellal'),
(1071,1,'Benishangul-Gumaz'),
(2395,1,'Benue'),
(799,1,'Beoumi'),
(3975,1,'Berane'),
(33,1,'Berat'),
(1852,1,'Berea'),
(3853,1,'Bergamo'),
(3519,1,'Berkshire'),
(1256,1,'Berlin'),
(3100,1,'Bern'),
(285,1,'Berry Islands'),
(1746,1,'Beru'),
(4063,1,'Beverīnas novads'),
(1327,1,'Beyla'),
(220,1,'Beylaqan'),
(2316,1,'Bheri'),
(800,1,'Biankouma'),
(131,1,'Bie'),
(3854,1,'Biella'),
(1479,1,'Bihar'),
(2683,1,'Bihor'),
(425,1,'Bijeljina'),
(3976,1,'Bijelo Polje'),
(1613,1,'Bika\'at Hayarden'),
(2088,1,'Bikar'),
(2089,1,'Bikini'),
(221,1,'Bilasuvar'),
(3330,1,'Bilecik'),
(2564,1,'Biliran'),
(658,1,'Biltine'),
(286,1,'Bimini'),
(3331,1,'Bingöl'),
(3758,1,'Binh Dinh'),
(3759,1,'Binh Duong'),
(3760,1,'Binh Phuoc'),
(3761,1,'Binh Thuan'),
(675,1,'Bio-Bio'),
(1361,1,'Biombo Region'),
(2017,1,'Birgu'),
(2018,1,'Birkirkara'),
(2019,1,'Birzebbuga'),
(1793,1,'Bishkek'),
(77,1,'Biskra'),
(1362,1,'Bissau Region'),
(2684,1,'Bistrița-Năsăud'),
(3332,1,'Bitlis'),
(3294,1,'Bizerte'),
(3019,1,'Bizkaia'),
(847,1,'Bjelovarsko-bilogorska'),
(287,1,'Black Point'),
(2137,1,'Black River'),
(3520,1,'Blaenau Gwent'),
(479,1,'Blagoevgrad'),
(1945,1,'Blantyre'),
(3074,1,'Blekinge'),
(78,1,'Blida'),
(615,1,'Boa Vista'),
(2365,1,'Boaco'),
(969,1,'Bobonaro'),
(797,1,'Bocanda'),
(2479,1,'Bocas del Toro'),
(2306,1,'Boe'),
(1328,1,'Boffa'),
(724,1,'Bogota D.C.'),
(2566,1,'Bohol'),
(2090,1,'Bokak'),
(1329,1,'Boke'),
(1803,1,'Bokeo'),
(1363,1,'Bolama Region'),
(1804,1,'Bolikhamxai'),
(725,1,'Bolivar'),
(980,1,'Bolivar'),
(3731,1,'Bolivar'),
(3855,1,'Bologna'),
(3333,1,'Bolu'),
(3856,1,'Bolzano'),
(1862,1,'Bomi'),
(4020,1,'Bonaire'),
(801,1,'Bondoukou'),
(1863,1,'Bong'),
(802,1,'Bongouanou'),
(2513,1,'Boqueron'),
(4008,1,'Bor'),
(79,1,'Bordj Bou Arreridj'),
(2864,1,'Borgo Maggiore'),
(363,1,'Borgou'),
(659,1,'Borkou-Ennedi-Tibesti'),
(2020,1,'Bormla'),
(2396,1,'Borno'),
(4449,1,'Borsod-Abaúj-Zemplén'),
(417,1,'Bosanskopodrinjski Kanton'),
(2685,1,'Botoșani'),
(803,1,'Bouafle'),
(804,1,'Bouake'),
(1126,1,'Bouches du Rhône'),
(756,1,'Bouenza'),
(2489,1,'Bougainville'),
(510,1,'Bougouriba'),
(80,1,'Bouira'),
(2261,1,'Boujdour'),
(2226,1,'Boulemane'),
(511,1,'Boulgou'),
(512,1,'Boulkiemde'),
(81,1,'Boumerdes'),
(805,1,'Bouna'),
(806,1,'Boundiali'),
(726,1,'Boyaca'),
(345,1,'Brabant Wallon'),
(2652,1,'Braga'),
(2653,1,'Bragança'),
(2687,1,'Brăila'),
(2118,1,'Brakna'),
(1257,1,'Brandenburg'),
(4005,1,'Braničevo'),
(2686,1,'Brașov'),
(2926,1,'Bratislavský'),
(616,1,'Brava'),
(757,1,'Brazzaville'),
(412,1,'Brcko district'),
(1258,1,'Bremen'),
(3857,1,'Brescia'),
(337,1,'Brestskaya (Brest)'),
(3521,1,'Bridgend'),
(1231,1,'Brikama'),
(3858,1,'Brindisi'),
(3522,1,'Bristol'),
(603,1,'British Columbia'),
(4065,1,'Brocēnu novads'),
(861,1,'Brodsko-posavska'),
(3060,1,'Brokopondo'),
(1271,1,'Brong-Ahafo Region'),
(476,1,'Brunei and Muara'),
(3970,1,'Brussels-Capital Region'),
(4288,1,'Bryansk Oblast'),
(2307,1,'Buada'),
(551,1,'Bubanza'),
(3523,1,'Buckinghamshire'),
(2688,1,'București'),
(4450,1,'Budapest'),
(3977,1,'Budva'),
(156,1,'Buenos Aires'),
(3437,1,'Bugiri'),
(552,1,'Bujumbura'),
(2567,1,'Bukidnon'),
(2568,1,'Bulacan'),
(3832,1,'Bulawayo'),
(2214,1,'Bulgan'),
(34,1,'Bulqize'),
(383,1,'Bumthang'),
(3465,1,'Bundibugyo'),
(1019,1,'Bur Sa\'id'),
(3334,1,'Burdur'),
(480,1,'Burgas'),
(199,1,'Burgenland'),
(2980,1,'Burgos'),
(3193,1,'Buri Ram'),
(3335,1,'Bursa'),
(4066,1,'Burtnieku novads'),
(553,1,'Bururi'),
(4259,1,'Buryatia, Republic of'),
(4240,1,'Busan-gwangyeoksi'),
(1555,1,'Bushehr'),
(3466,1,'Bushenyi'),
(3438,1,'Busia'),
(2431,1,'Buskerud'),
(2809,1,'Butare'),
(1747,1,'Butaritari'),
(1853,1,'Butha-Buthe'),
(3707,1,'Buxoro'),
(2689,1,'Buzău'),
(2810,1,'Byumba'),
(3762,1,'Ca Mau'),
(2514,1,'Caaguazu'),
(2515,1,'Caazapa'),
(1028,1,'Cabanas'),
(132,1,'Cabinda'),
(2263,1,'Cabo Delgado'),
(222,1,'Cabrayil'),
(2981,1,'Cáceres'),
(1364,1,'Cacheu Region'),
(2982,1,'Cádiz'),
(3524,1,'Caerphilly'),
(2569,1,'Cagayan'),
(3859,1,'Cagliari'),
(2184,1,'Cahul'),
(2532,1,'Cajamarca'),
(2691,1,'Călărași'),
(727,1,'Caldas'),
(617,1,'Calheta de Sao Miguel'),
(3624,1,'California'),
(223,1,'Calilabab'),
(2533,1,'Callao'),
(3860,1,'Caltanissetta'),
(1127,1,'Calvados'),
(868,1,'Camaguey'),
(2570,1,'Camarines Norte'),
(2571,1,'Camarines Sur'),
(3525,1,'Cambridgeshire'),
(2572,1,'Camiguin'),
(2148,1,'Campeche'),
(3861,1,'Campobasso'),
(3763,1,'Can Tho'),
(3336,1,'Çanakkale'),
(981,1,'Cañar'),
(3688,1,'Canelones'),
(123,1,'Canillo'),
(2516,1,'Canindeyu'),
(3337,1,'Çankırı'),
(554,1,'Cankuzo'),
(2983,1,'Cantabria'),
(1128,1,'Cantal'),
(2346,1,'Canterbury'),
(3764,1,'Cao Bang'),
(1930,1,'Capellen'),
(315,1,'Capital'),
(2573,1,'Capiz'),
(2288,1,'Caprivi'),
(728,1,'Caqueta'),
(3732,1,'Carabobo'),
(2690,1,'Caraș-Severin'),
(2366,1,'Carazo'),
(982,1,'Carchi'),
(3526,1,'Cardiff'),
(2135,1,'Cargados Carajos Shoals (Saint Brandon Islands)'),
(1586,1,'Carlow'),
(3527,1,'Carmarthenshire'),
(4067,1,'Carnikavas novads'),
(1302,1,'Carriacou'),
(783,1,'Cartago'),
(2227,1,'Casablanca'),
(729,1,'Casanare'),
(2908,1,'Cascade'),
(3863,1,'Caserta'),
(2984,1,'Castellón'),
(2654,1,'Castelo Branco'),
(2836,1,'Castries'),
(288,1,'Cat Island'),
(157,1,'Catamarca'),
(2574,1,'Catanduanes'),
(3864,1,'Catania'),
(3865,1,'Catanzaro'),
(1936,1,'Cathedral Parish'),
(730,1,'Cauca'),
(1587,1,'Cavan'),
(2575,1,'Cavite'),
(355,1,'Cayo'),
(445,1,'Ceará'),
(2576,1,'Cebu'),
(316,1,'Central'),
(430,1,'Central'),
(1733,1,'Central'),
(2490,1,'Central'),
(2517,1,'Central'),
(2933,1,'Central'),
(3022,1,'Central'),
(3823,1,'Central'),
(1048,1,'Central (Maekel)'),
(289,1,'Central Abaco'),
(1410,1,'Central and Western Hong Kong Island'),
(290,1,'Central Andros'),
(3996,1,'Central Banat'),
(1080,1,'Central Division'),
(291,1,'Central Eleuthera'),
(4023,1,'Central Equatoria'),
(1281,1,'Central Greece'),
(1282,1,'Central Macedonia'),
(1272,1,'Central Region'),
(1238,1,'Central River'),
(3268,1,'Centrale'),
(593,1,'Centre'),
(1380,1,'Centre'),
(3528,1,'Ceredigion'),
(3689,1,'Cerro Largo'),
(731,1,'Cesar'),
(4071,1,'Cēsu novads'),
(4069,1,'Cesvaines novads'),
(3978,1,'Cetinje'),
(2985,1,'Ceuta'),
(3194,1,'Chachoengsao'),
(158,1,'Chaco'),
(1762,1,'Chagang-do'),
(3289,1,'Chaguanas'),
(1553,1,'Chahar Mahaal and Bakhtiari'),
(3195,1,'Chai Nat'),
(3196,1,'Chaiyaphum'),
(1029,1,'Chalatenango'),
(1805,1,'Champasak'),
(1480,1,'Chandigarh'),
(3135,1,'Chang-hua'),
(3197,1,'Chanthaburi'),
(2228,1,'Chaouen'),
(1129,1,'Charente'),
(1130,1,'Charente Maritime'),
(660,1,'Chari-Baguirmi'),
(2846,1,'Charlotte'),
(4276,1,'Chechen Republic'),
(4330,1,'Chelyabinsk Oblast'),
(1131,1,'Cher'),
(3480,1,'Cherkaska'),
(3481,1,'Chernihivska'),
(3482,1,'Chernivetska'),
(3529,1,'Cheshire'),
(4341,1,'Chhattisgarh'),
(3154,1,'Chi-lung'),
(3136,1,'Chia-i'),
(3153,1,'Chia-i city'),
(3198,1,'Chiang Mai'),
(3199,1,'Chiang Rai'),
(2149,1,'Chiapas'),
(1660,1,'Chiba'),
(2865,1,'Chiesanuova'),
(3866,1,'Chieti'),
(2150,1,'Chihuahua'),
(1946,1,'Chikwawa'),
(1306,1,'Chimaltenango'),
(983,1,'Chimborazo'),
(2491,1,'Chimbu'),
(2281,1,'Chin State'),
(2367,1,'Chinandega'),
(1307,1,'Chiquimula'),
(1947,1,'Chiradzulu'),
(2480,1,'Chiriqui'),
(2182,1,'Chisinau'),
(1948,1,'Chitipa'),
(321,1,'Chittagong'),
(82,1,'Chlef'),
(732,1,'Choco'),
(2837,1,'Choiseul'),
(2934,1,'Choiseul'),
(1393,1,'Choluteca'),
(3200,1,'Chon Buri'),
(686,1,'Chongqing'),
(2368,1,'Chontales'),
(326,1,'Christ Church'),
(2821,1,'Christ Church Nichola Town'),
(1795,1,'Chu'),
(159,1,'Chubut'),
(384,1,'Chukha'),
(4338,1,'Chukotka Autonomous Okrug'),
(3201,1,'Chumphon'),
(4246,1,'Chungcheongbuk-do'),
(4247,1,'Chungcheongnam-do'),
(404,1,'Chuquisaca'),
(2177,1,'Chuuk'),
(4277,1,'Chuvash Republic'),
(555,1,'Cibitoke'),
(4072,1,'Ciblas novads'),
(869,1,'Ciego de Avila'),
(870,1,'Cienfuegos'),
(2870,1,'Citta di San Marino'),
(292,1,'City of Freeport'),
(162,1,'Ciudad Autónoma de Buenos Aires'),
(871,1,'Ciudad de La Habana'),
(2986,1,'Ciudad Real'),
(3530,1,'Clackmannanshire'),
(1588,1,'Clare'),
(1643,1,'Clarendon Parish'),
(1922,1,'Clervaux'),
(2692,1,'Cluj'),
(2151,1,'Coahuila de Zaragoza'),
(1734,1,'Coast'),
(405,1,'Cochabamba'),
(2481,1,'Cocle'),
(2655,1,'Coimbra'),
(3733,1,'Cojedes'),
(2152,1,'Colima'),
(364,1,'Collines'),
(1394,1,'Colon'),
(2482,1,'Colon'),
(3690,1,'Colonia'),
(3625,1,'Colorado'),
(1395,1,'Comayagua'),
(3061,1,'Commewijne'),
(3867,1,'Como'),
(4440,1,'Como, Campione d’Italia and terretory Lake Lugano'),
(513,1,'Comoe'),
(2577,1,'Compostela'),
(1326,1,'Conakry'),
(2518,1,'Concepcion'),
(3626,1,'Connecticut'),
(2693,1,'Constanța'),
(83,1,'Constantine'),
(3531,1,'Conwy'),
(1396,1,'Copan'),
(3824,1,'Copperbelt'),
(676,1,'Coquimbo'),
(2519,1,'Cordillera'),
(160,1,'Cordoba'),
(733,1,'Cordoba'),
(2987,1,'Córdoba'),
(1589,1,'Cork'),
(3532,1,'Cornwall'),
(2347,1,'Coromandel'),
(3062,1,'Coronie'),
(356,1,'Corozal'),
(1132,1,'Corrèze'),
(161,1,'Corrientes'),
(1133,1,'Corse du Sud'),
(1397,1,'Cortes'),
(3338,1,'Çorum'),
(3868,1,'Cosenza'),
(1135,1,'Côte d\'or'),
(1136,1,'Côtes d\'Armor'),
(984,1,'Cotopaxi'),
(3949,1,'County Antrim'),
(3950,1,'County Armagh'),
(3951,1,'County Down'),
(3952,1,'County Fermanagh'),
(3953,1,'County Londonderry'),
(3954,1,'County Tyrone'),
(3276,1,'Couva/Tabaquite/Talparo'),
(970,1,'Cova Lima'),
(2694,1,'Covasna'),
(1330,1,'Coyah'),
(632,1,'Creek'),
(3869,1,'Cremona'),
(1283,1,'Crete'),
(1137,1,'Creuse'),
(293,1,'Crooked Island'),
(2397,1,'Cross River'),
(3870,1,'Crotone'),
(4451,1,'Csongrád-Csanád'),
(133,1,'Cuando-Cubango'),
(134,1,'Cuanza Norte'),
(135,1,'Cuanza Sul'),
(2988,1,'Cuenca'),
(2153,1,'Cuidad de Mexico'),
(224,1,'Culfa'),
(3955,1,'Cumbria'),
(734,1,'Cundinamarca'),
(136,1,'Cunene'),
(3871,1,'Cuneo'),
(2130,1,'Curepipe'),
(1030,1,'Cuscatlan'),
(2534,1,'Cusco'),
(758,1,'Cuvette'),
(759,1,'Cuvette-Ouest'),
(1370,1,'Cuyuni-Mazaruni'),
(2811,1,'Cyangugu'),
(3767,1,'Da Nang'),
(807,1,'Dabakala'),
(1331,1,'Dabola'),
(808,1,'Dabou'),
(1481,1,'Dadra and Nagar Haveli and Davan and Diu'),
(4241,1,'Daegu-gwangyeoksi'),
(4242,1,'Daejeon-gwangyeoksi'),
(385,1,'Dagana'),
(4074,1,'Dagdas novads'),
(4261,1,'Dagestan, Republic of'),
(1582,1,'Dahuk'),
(938,1,'Dajabon'),
(3765,1,'Dak Lak'),
(3766,1,'Dak Nong'),
(2887,1,'Dakar'),
(2119,1,'Dakhlet Nouadhibou'),
(1332,1,'Dalaba'),
(3075,1,'Dalarna'),
(809,1,'Daloa'),
(2695,1,'Dâmbovița'),
(810,1,'Danane'),
(472,1,'Danger Island'),
(3979,1,'Danilovgrad'),
(811,1,'Daoukro'),
(3164,1,'Dar es Salaam'),
(3126,1,'Dara'),
(2198,1,'Darhan uul'),
(2483,1,'Darien'),
(1887,1,'Darnah'),
(3398,1,'Dashhowuz Welayaty'),
(225,1,'Daskasan'),
(4075,1,'Daugavpils'),
(4076,1,'Daugavpils novads'),
(2838,1,'Dauphin'),
(226,1,'Davaci'),
(2578,1,'Davao del Norte'),
(2579,1,'Davao del Sur'),
(2580,1,'Davao Oriental'),
(3127,1,'Dayr az Zawr'),
(1949,1,'Dedza'),
(3627,1,'Delaware'),
(1483,1,'Delhi'),
(3402,1,'Dellis Cay'),
(2398,1,'Delta'),
(3734,1,'Delta Amacuro'),
(35,1,'Delvine'),
(1371,1,'Demerara-Mahaica'),
(3533,1,'Denbighshire'),
(2308,1,'Denigomodu'),
(3339,1,'Denizli'),
(2839,1,'Dennery'),
(3735,1,'Dependencias Federales'),
(3534,1,'Derbyshire'),
(1193,1,'Deux Sèvres'),
(36,1,'Devoll'),
(3535,1,'Devon'),
(372,1,'Devonshire'),
(322,1,'Dhaka'),
(3794,1,'Dhamar'),
(2317,1,'Dhawalagiri'),
(1574,1,'Dhi Qar'),
(37,1,'Diber'),
(474,1,'Diego Garcia'),
(3277,1,'Diego Martin'),
(1921,1,'Diekirch'),
(3768,1,'Dien Bien'),
(2381,1,'Diffa'),
(920,1,'Dikhil'),
(971,1,'Dili'),
(3128,1,'Dimashq'),
(812,1,'Dimbokro'),
(2021,1,'Dingli'),
(1333,1,'Dinguiraye'),
(2888,1,'Diourbel'),
(1079,1,'Dire Dawa'),
(715,1,'Direction Island'),
(3628,1,'District of Columbia'),
(3736,1,'Distrito Capital'),
(446,1,'Distrito Federal'),
(934,1,'Distrito Nacional'),
(813,1,'Divo'),
(1570,1,'Diyala'),
(3340,1,'Diyarbakır'),
(84,1,'Djelfa'),
(921,1,'Djibouti'),
(3484,1,'Dnipropetrovska'),
(4078,1,'Dobeles novads'),
(424,1,'Doboj'),
(481,1,'Dobrich'),
(3165,1,'Dodoma'),
(2696,1,'Dolj'),
(2631,1,'Dolnoslaskie'),
(2866,1,'Domagnano'),
(1590,1,'Donegal'),
(3485,1,'Donetska'),
(3769,1,'Dong Nai'),
(3770,1,'Dong Thap'),
(365,1,'Donga'),
(1138,1,'Dordogne'),
(2210,1,'Dornod'),
(2211,1,'Dornogov'),
(3536,1,'Dorset'),
(2382,1,'Dosso'),
(1139,1,'Doubs'),
(1950,1,'Dowa'),
(2329,1,'Drenthe'),
(1140,1,'Drôme'),
(939,1,'Duarte'),
(3510,1,'Dubai'),
(1591,1,'Dublin'),
(1334,1,'Dubreka'),
(849,1,'Dubrovačko-neretvanska'),
(814,1,'Duekoue'),
(3537,1,'Dumfries and Galloway'),
(1020,1,'Dumyat'),
(4079,1,'Dundagas novads'),
(3538,1,'Dundee'),
(2209,1,'DundgovL'),
(2154,1,'Durango'),
(3691,1,'Durazno'),
(4081,1,'Durbes novads'),
(3539,1,'Durham'),
(38,1,'Durres'),
(3341,1,'Düzce'),
(2208,1,'Dzavhan'),
(471,1,'Eagle Islands'),
(594,1,'East (Est)'),
(3540,1,'East Ayrshire'),
(1545,1,'East Azarbaijan'),
(1372,1,'East Berbice-Corentyne'),
(3410,1,'East Caicos'),
(3541,1,'East Dunbartonshire'),
(294,1,'East Grand Bahama'),
(3542,1,'East Lothian'),
(1284,1,'East Macedonia and Thrace'),
(2493,1,'East New Britain'),
(3543,1,'East Renfrewshire'),
(3544,1,'East Riding of Yorkshire'),
(2494,1,'East Sepik'),
(3545,1,'East Sussex'),
(117,1,'Eastern'),
(633,1,'Eastern'),
(1735,1,'Eastern'),
(2921,1,'Eastern'),
(3023,1,'Eastern'),
(3825,1,'Eastern'),
(2961,1,'Eastern Cape'),
(1082,1,'Eastern Division'),
(4024,1,'Eastern Equatoria'),
(2492,1,'Eastern Highlands'),
(1411,1,'Eastern Hong Kong Island'),
(1273,1,'Eastern Region'),
(2581,1,'Eastern Samar'),
(2091,1,'Ebon'),
(2399,1,'Ebonyi'),
(1927,1,'Echternach'),
(3546,1,'Edinburgh'),
(2185,1,'Edinet'),
(3342,1,'Edirne'),
(2400,1,'Edo'),
(473,1,'Egmont Islands'),
(1661,1,'Ehime'),
(1614,1,'Eilat and Arava'),
(2401,1,'Ekiti'),
(85,1,'El Bayadh'),
(2229,1,'El Jadida'),
(2230,1,'El Kelaa des Sraghna'),
(985,1,'El Oro'),
(86,1,'El Oued'),
(1398,1,'El Paraiso'),
(1308,1,'El Peten'),
(1309,1,'El Progreso'),
(1310,1,'El Quiche'),
(941,1,'El Seybo'),
(87,1,'El Tarf'),
(3343,1,'Elazığ'),
(39,1,'Elbasan'),
(940,1,'Elias Pina'),
(124,1,'Encamp'),
(2092,1,'Enewetak'),
(2495,1,'Enga'),
(4082,1,'Engures novads'),
(3872,1,'Enna'),
(163,1,'Entre Rios'),
(2402,1,'Enugu'),
(1285,1,'Epirus'),
(3814,1,'Equateur'),
(2231,1,'Er Rachidia'),
(4083,1,'Ērgļu novads'),
(2093,1,'Erikub'),
(972,1,'Ermera'),
(2289,1,'Erongo'),
(3344,1,'Erzincan'),
(3345,1,'Erzurum'),
(2262,1,'Es Smara'),
(125,1,'Escaldes-Engordany'),
(1931,1,'Esch-sur-Alzette'),
(1904,1,'Eschen'),
(1311,1,'Escuintla'),
(1561,1,'Esfahan'),
(3346,1,'Eskişehir'),
(986,1,'Esmeraldas'),
(942,1,'Espaillat'),
(447,1,'Espírito Santo'),
(2232,1,'Essaouira'),
(1373,1,'Essequibo Islands-West Demerara'),
(3547,1,'Essex'),
(1205,1,'Essonne'),
(2369,1,'Esteli'),
(1220,1,'Estuaire'),
(1086,1,'Etelä-Suomen lääni'),
(1141,1,'Eure'),
(1142,1,'Eure et Loir'),
(2656,1,'Évora'),
(2309,1,'Ewa'),
(595,1,'Extreme North (Extreme-Nord)'),
(295,1,'Exuma'),
(2855,1,'Fa\'asaleleaga'),
(1992,1,'Faadhippolhu'),
(2867,1,'Faetano'),
(3271,1,'Fakaofo'),
(3737,1,'Falcon'),
(3548,1,'Falkirk'),
(883,1,'Famagusta'),
(6,1,'Farah'),
(1335,1,'Faranah'),
(3708,1,'Farg\'ona'),
(2657,1,'Faro'),
(906,1,'Faroe Islands'),
(1556,1,'Fars'),
(7,1,'Faryab'),
(2889,1,'Fatick'),
(2458,1,'Federally Administered Tribal Areas'),
(3629,1,'Federated States Of Micronesia'),
(4452,1,'Fejér'),
(1996,1,'Felidhe Atoll'),
(815,1,'Ferkessedougou'),
(4237,1,'Fermo'),
(3873,1,'Ferrara'),
(2233,1,'Fes'),
(2022,1,'Fgura'),
(1940,1,'Fianarantsoa'),
(41,1,'Fier'),
(3549,1,'Fife'),
(2234,1,'Figuig'),
(1143,1,'Finistère'),
(2432,1,'Finnmark'),
(2349,1,'Fiordland'),
(2868,1,'Fiorentino'),
(3874,1,'Firenze'),
(2138,1,'Flacq'),
(1388,1,'Flat Island'),
(2330,1,'Flevoland'),
(3550,1,'Flintshire'),
(3692,1,'Flores'),
(2023,1,'Floriana'),
(3630,1,'Florida'),
(3693,1,'Florida'),
(428,1,'Foca'),
(3875,1,'Foggia'),
(2069,1,'Fontana'),
(2192,1,'Fontvieille'),
(1336,1,'Forecariah'),
(3876,1,'Forli-Cesena'),
(164,1,'Formosa'),
(1399,1,'Francisco Morazan'),
(2962,1,'Free State'),
(3403,1,'French Cay'),
(1337,1,'Fria'),
(3101,1,'Fribourg'),
(2331,1,'Friesland'),
(3877,1,'Frosinone'),
(2004,1,'Fua Mulaku'),
(687,1,'Fujian'),
(1662,1,'Fukui'),
(1663,1,'Fukuoka'),
(1664,1,'Fukushima'),
(3418,1,'Funafuti'),
(227,1,'Fuzuli'),
(3295,1,'Gabes'),
(482,1,'Gabrovo'),
(1365,1,'Gabu Region'),
(229,1,'Gadabay'),
(3296,1,'Gafsa'),
(2856,1,'Gaga\'emauga'),
(2857,1,'Gagaifomauga'),
(2181,1,'Gagauzia'),
(816,1,'Gagnoa'),
(987,1,'Galápagos'),
(2697,1,'Galați'),
(2948,1,'Galguduud'),
(1615,1,'Galil'),
(1592,1,'Galway'),
(1072,1,'Gambela'),
(1908,1,'Gamprin'),
(228,1,'Ganca'),
(2318,1,'Gandaki'),
(4248,1,'Gangwon-do'),
(688,1,'Gansu'),
(514,1,'Ganzourgou'),
(2006,1,'Gao'),
(1338,1,'Gaoual'),
(1144,1,'Gard'),
(2026,1,'Gargur'),
(4084,1,'Garkalnes novads'),
(386,1,'Gasa'),
(1053,1,'Gash-Barka (Barentu)'),
(2963,1,'Gauteng'),
(3076,1,'Gävleborg'),
(2027,1,'Gaxaq'),
(2264,1,'Gaza'),
(3347,1,'Gaziantep'),
(2949,1,'Gedo'),
(183,1,'Geghark\'unik\''),
(2332,1,'Gelderland'),
(3102,1,'Genève'),
(3878,1,'Genova'),
(3631,1,'Georgia'),
(1146,1,'Gers'),
(1888,1,'Ghadamis'),
(2070,1,'Ghajnsielem'),
(431,1,'Ghanzi'),
(2071,1,'Gharb'),
(3045,1,'Gharb al Istiwa\'iyah'),
(3046,1,'Gharb Bahr al Ghazal'),
(3047,1,'Gharb Darfur'),
(3048,1,'Gharb Kurdufan'),
(88,1,'Ghardaia'),
(1889,1,'Gharyan'),
(2072,1,'Ghasri'),
(8,1,'Ghazni'),
(9,1,'Ghowr'),
(3771,1,'Gia Lai'),
(1665,1,'Gifu'),
(2812,1,'Gikongoro'),
(1542,1,'Gilan'),
(3348,1,'Giresun'),
(2989,1,'Girona'),
(1147,1,'Gironde'),
(2348,1,'Gisborne'),
(2813,1,'Gisenyi'),
(2814,1,'Gitarama'),
(556,1,'Gitega'),
(2698,1,'Giurgiu'),
(42,1,'Gjirokaster'),
(2909,1,'Glacis'),
(3103,1,'Glarus'),
(3551,1,'Glasgow'),
(3552,1,'Gloucestershire'),
(515,1,'Gnagna'),
(1484,1,'Goa'),
(448,1,'Goiás'),
(1564,1,'Golestan'),
(2403,1,'Gombe'),
(230,1,'Goranboy'),
(3964,1,'Gorenjska'),
(2120,1,'Gorgol'),
(3966,1,'Goriška'),
(3879,1,'Gorizia'),
(2699,1,'Gorj'),
(3160,1,'Gorno-Badakhstan'),
(1512,1,'Gorontalo'),
(3077,1,'Gotland'),
(516,1,'Gourma'),
(2213,1,'Govi-Altay'),
(2212,1,'Govi-Sumber'),
(231,1,'Goycay'),
(1400,1,'Gracias a Dios'),
(848,1,'Grad Zagreb'),
(43,1,'Gramsh'),
(2370,1,'Granada'),
(2990,1,'Granada'),
(1864,1,'Grand Bassa'),
(1865,1,'Grand Cape Mount'),
(296,1,'Grand Cay'),
(1866,1,'Grand Gedeh'),
(1867,1,'Grand Kru'),
(2139,1,'Grand Port'),
(3408,1,'Grand Turk'),
(817,1,'Grand-Bassam'),
(818,1,'Grand-Lahou'),
(2910,1,'Grand\' Anse (on Mahe)'),
(2911,1,'Grand\' Anse (on Praslin)'),
(1381,1,'Grand\'Anse'),
(753,1,'Grande Comore'),
(872,1,'Granma'),
(3104,1,'Graubünden'),
(1274,1,'Greater Accra Region'),
(3553,1,'Greater London'),
(3554,1,'Greater Manchester'),
(2847,1,'Grenadines'),
(1926,1,'Grevenmacher'),
(4086,1,'Grobiņas novads'),
(2333,1,'Groningen'),
(2840,1,'Gros-Islet'),
(3880,1,'Grosseto'),
(2991,1,'Guadalajara'),
(2935,1,'Guadalcanal'),
(735,1,'Guainia'),
(2520,1,'Guaira'),
(736,1,'Guajira'),
(3632,1,'Guam'),
(784,1,'Guanacaste'),
(2155,1,'Guanajuato'),
(689,1,'Guangdong'),
(690,1,'Guangxi'),
(873,1,'Guantanamo'),
(2658,1,'Guarda'),
(3738,1,'Guarico'),
(1312,1,'Guatemala'),
(737,1,'Guaviare'),
(988,1,'Guayas'),
(2024,1,'Gudja'),
(1339,1,'Gueckedou'),
(89,1,'Guelma'),
(2235,1,'Guelmim'),
(661,1,'Guera'),
(2156,1,'Guerrero'),
(2121,1,'Guidimaka'),
(819,1,'Guiglo'),
(2582,1,'Guimaras'),
(2992,1,'Guipúzcoa'),
(691,1,'Guizhou'),
(1485,1,'Gujarat'),
(4088,1,'Gulbenes novads'),
(2496,1,'Gulf'),
(3455,1,'Gulu'),
(1666,1,'Gumma'),
(3349,1,'Gümüşhane'),
(1245,1,'Guria'),
(4243,1,'Gwangju-gwangyeoksi'),
(3555,1,'Gwynedd'),
(4249,1,'Gyeonggi-do'),
(4250,1,'Gyeongsangbuk-do'),
(4251,1,'Gyeongsangnam-do'),
(4453,1,'Győr-Moson-Sopron'),
(2025,1,'Gzira'),
(3772,1,'Ha Giang'),
(3775,1,'Ha Nam'),
(3776,1,'Ha Noi'),
(3777,1,'Ha Tay'),
(3778,1,'Ha Tinh'),
(3273,1,'Ha\'apai'),
(2882,1,'Ha\'il'),
(387,1,'Haa'),
(232,1,'Haciqabul'),
(2001,1,'Hadhdhunmathi'),
(3795,1,'Hadramawt'),
(3773,1,'Hai Duong'),
(3774,1,'Hai Phong'),
(1616,1,'Haifa'),
(692,1,'Hainan'),
(346,1,'Hainaut'),
(4454,1,'Hajdú-Bihar'),
(3796,1,'Hajjah'),
(3350,1,'Hakkari'),
(3129,1,'Halab'),
(3078,1,'Halland'),
(1548,1,'Hamadan'),
(3130,1,'Hamah'),
(1259,1,'Hamburg'),
(1763,1,'Hamgyong-bukto'),
(1764,1,'Hamgyong-namdo'),
(374,1,'Hamilton'),
(373,1,'Hamilton City'),
(3556,1,'Hampshire'),
(2028,1,'Hamrun'),
(1644,1,'Hanover Parish'),
(3833,1,'Harare'),
(297,1,'Harbour Island'),
(2290,1,'Hardap'),
(2700,1,'Harghita'),
(1073,1,'Hariai'),
(1054,1,'Harjumaa (Tallinn)'),
(1486,1,'Haryana'),
(44,1,'Has'),
(483,1,'Haskovo'),
(3351,1,'Hatay'),
(943,1,'Hato Mayor'),
(2466,1,'Hatohobei'),
(3781,1,'Hau Giang'),
(1182,1,'Haut Rhin'),
(643,1,'Haut-Mbomou'),
(1221,1,'Haut-Ogooue'),
(1134,1,'Haute Corse'),
(1145,1,'Haute Garonne'),
(1157,1,'Haute Loire'),
(1166,1,'Haute Marne'),
(1184,1,'Haute Saône'),
(1188,1,'Haute Savoie'),
(1201,1,'Haute Vienne'),
(642,1,'Haute-Kotto'),
(1179,1,'Hautes Pyrénées'),
(1118,1,'Hautes-Alpes'),
(1206,1,'Hauts de Seine'),
(3633,1,'Hawaii'),
(1792,1,'Hawalli'),
(2350,1,'Hawke\'s Bay'),
(1391,1,'Heard Island'),
(693,1,'Hebei'),
(2433,1,'Hedmark'),
(694,1,'Heilongjiang'),
(10,1,'Helmand'),
(695,1,'Henan'),
(2199,1,'Hentiy'),
(11,1,'Herat'),
(1148,1,'Hérault'),
(3980,1,'Herceg-Novi'),
(419,1,'Hercegovacko-neretvanski Kanton'),
(785,1,'Heredia'),
(3557,1,'Herefordshire'),
(2484,1,'Herrera'),
(3558,1,'Hertfordshire'),
(1260,1,'Hessen'),
(4455,1,'Heves'),
(3070,1,'Hhohho'),
(2157,1,'Hidalgo'),
(3559,1,'Highlands'),
(2950,1,'Hiiraan'),
(1055,1,'Hiiumaa (Kardla)'),
(1487,1,'Himachal Pradesh'),
(3131,1,'Hims'),
(1667,1,'Hiroshima'),
(3780,1,'Ho Chi Minh City'),
(3779,1,'Hoa Binh'),
(2122,1,'Hodh Ech Chargui'),
(2123,1,'Hodh El Gharbi'),
(1468,1,'Hofuoborgarsvaeoi'),
(3467,1,'Hoima'),
(1668,1,'Hokkaido'),
(874,1,'Holguin'),
(716,1,'Home Island'),
(338,1,'Homyel\'skaya (Homyel\')'),
(696,1,'Hong Kong'),
(2936,1,'Honiara'),
(298,1,'Hope Town'),
(339,1,'Horad Minsk'),
(2434,1,'Hordaland'),
(1557,1,'Hormozgan'),
(717,1,'Horsburgh Island'),
(1806,1,'Houaphan'),
(517,1,'Houet'),
(2201,1,'Hovd'),
(907,1,'Hovedstaden'),
(2200,1,'Hovsgol'),
(3679,1,'Howland Island'),
(340,1,'Hrodzyenskaya (Hrodna)'),
(3137,1,'Hsin-chu'),
(3155,1,'Hsin-chu'),
(3138,1,'Hua-lien'),
(137,1,'Huambo'),
(2535,1,'Huancavelica'),
(2536,1,'Huanuco'),
(697,1,'Hubei'),
(1313,1,'Huehuetenango'),
(2993,1,'Huelva'),
(2994,1,'Huesca'),
(138,1,'Huila'),
(738,1,'Huila'),
(698,1,'Hunan'),
(2701,1,'Hunedoara'),
(3782,1,'Hung Yen'),
(2003,1,'Huvadhu Atoll Dhekunu'),
(2002,1,'Huvadhu Atoll Uthuru'),
(1765,1,'Hwanghae-bukto'),
(1766,1,'Hwanghae-namdo'),
(1669,1,'Hyogo'),
(3139,1,'I-lan'),
(2702,1,'Ialomița'),
(2703,1,'Iași'),
(1670,1,'Ibaraki'),
(3798,1,'Ibb'),
(2537,1,'Ica'),
(1056,1,'Ida-Virumaa (Johvi)'),
(3634,1,'Idaho'),
(3132,1,'Idlib'),
(4089,1,'Iecavas novads'),
(2236,1,'Ifrane'),
(2583,1,'Ifugao'),
(3439,1,'Iganga'),
(3352,1,'Iğdır'),
(2310,1,'Ijuw'),
(2029,1,'Iklin'),
(4091,1,'Ikšķiles novads'),
(1550,1,'Ilam'),
(1217,1,'Ile Amsterdam'),
(1218,1,'Ile Saint-Paul'),
(1215,1,'Iles Crozet'),
(1213,1,'Iles du Vent'),
(1216,1,'Iles Kerguelen'),
(2341,1,'Iles Loyaute'),
(1214,1,'Iles Sous-le-Vent'),
(2704,1,'Ilfov'),
(1149,1,'Ille et Vilaine'),
(3635,1,'Illinois'),
(90,1,'Illizi'),
(2584,1,'Ilocos Norte'),
(2585,1,'Ilocos Sur'),
(2586,1,'Iloilo'),
(4093,1,'Ilūkstes novads'),
(989,1,'Imbabura'),
(1246,1,'Imereti'),
(233,1,'Imisli'),
(2404,1,'Imo'),
(3881,1,'Imperia'),
(299,1,'Inagua'),
(4244,1,'Incheon-gwangyeoksi'),
(2124,1,'Inchiri'),
(4094,1,'Inčukalna novads'),
(944,1,'Independencia'),
(3636,1,'Indiana'),
(1150,1,'Indre'),
(1151,1,'Indre et Loire'),
(4262,1,'Ingushetia, Republic of'),
(2265,1,'Inhambane'),
(699,1,'Inner Mongolia'),
(1401,1,'Intibuca'),
(3560,1,'Inverclyde'),
(518,1,'Ioba'),
(1286,1,'Ionian Islands'),
(3637,1,'Iowa'),
(1712,1,'Irbid'),
(3166,1,'Iringa'),
(4294,1,'Irkutsk Oblast'),
(2937,1,'Isabel'),
(2587,1,'Isabela'),
(1152,1,'Isére'),
(3882,1,'Isernia'),
(1671,1,'Ishikawa'),
(2030,1,'Isla'),
(875,1,'Isla de la Juventud'),
(2459,1,'Islamabad Capital Territory'),
(1419,1,'Islands New Territories'),
(1402,1,'Islas de la Bahia (Bay Islands)'),
(3561,1,'Isle of Wight'),
(234,1,'Ismayilli'),
(3353,1,'Isparta'),
(820,1,'Issia'),
(3354,1,'İstanbul'),
(850,1,'Istarska'),
(4467,1,'Istočen'),
(1087,1,'Itä-Suomen lääni'),
(2521,1,'Itapua'),
(3486,1,'Ivano-Frankivska'),
(4293,1,'Ivanovo Oblast'),
(1672,1,'Iwate'),
(1314,1,'Izabal'),
(3355,1,'İzmir'),
(2094,1,'Jabat'),
(4017,1,'Jablanica'),
(821,1,'Jacqueville'),
(2995,1,'Jaén'),
(1513,1,'Jakarta'),
(1796,1,'Jalal-Abad'),
(1315,1,'Jalapa'),
(2158,1,'Jalisco'),
(2095,1,'Jaluit'),
(1514,1,'Jambi'),
(1488,1,'Jammu and Kashmir'),
(3079,1,'Jämtland'),
(2319,1,'Janakpur'),
(1232,1,'Janjangbure'),
(3049,1,'Janub Darfur'),
(3050,1,'Janub Kurdufan'),
(1021,1,'Janub Sina\''),
(1713,1,'Jarash'),
(2675,1,'Jarayan al Batinah'),
(1057,1,'Jarvamaa (Paide)'),
(3680,1,'Jarvis Island'),
(4456,1,'Jász-Nagykun-Szolnok'),
(4096,1,'Jaunjelgavas novads'),
(4097,1,'Jaunpiebalgas novads'),
(4098,1,'Jaunpils novads'),
(1515,1,'Jawa Barat'),
(1516,1,'Jawa Tengah'),
(1517,1,'Jawa Timur'),
(1617,1,'Jehuda Mountains'),
(4254,1,'Jeju-teukbyeoljachido'),
(4101,1,'Jēkabpils'),
(4102,1,'Jēkabpils novads'),
(4099,1,'Jelgava'),
(4100,1,'Jelgavas novads'),
(2096,1,'Jemo'),
(3297,1,'Jendouba'),
(4252,1,'Jeollabuk-do'),
(4253,1,'Jeollanam-do'),
(1618,1,'Jerusalem'),
(4443,1,'Jetisu'),
(4335,1,'Jewish Autonomous Oblast'),
(700,1,'Jiangsu'),
(701,1,'Jiangxi'),
(2405,1,'Jigawa'),
(890,1,'Jihočeský'),
(891,1,'Jihomoravský'),
(91,1,'Jijel'),
(702,1,'Jilin'),
(3440,1,'Jinja'),
(2371,1,'Jinotega'),
(2883,1,'Jizan'),
(3709,1,'Jizzax'),
(1058,1,'Jogevamaa (Jogeva)'),
(3681,1,'Johnston Atoll'),
(1971,1,'Johor'),
(4025,1,'Jonglei'),
(3080,1,'Jönköping'),
(12,1,'Jowzjan'),
(2951,1,'Jubbada Dhexe'),
(2952,1,'Jubbada Hoose'),
(4469,1,'Jugoistočen'),
(3962,1,'Jugovzhodna Slovenija'),
(4468,1,'Jugozapaden'),
(165,1,'Jujuy'),
(2538,1,'Junin'),
(3051,1,'Junqali'),
(1153,1,'Jura'),
(3105,1,'Jura'),
(4103,1,'Jūrmala'),
(1316,1,'Jutiapa'),
(3468,1,'Kabale'),
(4263,1,'Kabardino-Balkar Republic'),
(3469,1,'Kabarole'),
(3441,1,'Kaberamaido'),
(13,1,'Kabul'),
(2282,1,'Kachin State'),
(519,1,'Kadiogo'),
(2406,1,'Kaduna'),
(1022,1,'Kafr ash Shaykh'),
(1673,1,'Kagawa'),
(3167,1,'Kagera'),
(1674,1,'Kagoshima'),
(3356,1,'Kahramanmaraş'),
(3298,1,'Kairouan'),
(1247,1,'Kakheti'),
(3424,1,'Kalangala'),
(3202,1,'Kalasin'),
(235,1,'Kalbacar'),
(1518,1,'Kalimantan Barat'),
(1519,1,'Kalimantan Selatan'),
(1520,1,'Kalimantan Tengah'),
(1521,1,'Kalimantan Timur'),
(1511,1,'Kalimantan Utara'),
(2588,1,'Kalinga'),
(4295,1,'Kaliningrad Oblast'),
(2031,1,'Kalkara'),
(3081,1,'Kalmar'),
(4264,1,'Kalmykia, Republic of'),
(4296,1,'Kaluga Oblast'),
(4297,1,'Kamchatka Krai'),
(3425,1,'Kampala'),
(3203,1,'Kamphaeng Phet'),
(573,1,'Kampong Cham'),
(574,1,'Kampong Chhnang'),
(576,1,'Kampong Som'),
(575,1,'Kampong Speu'),
(577,1,'Kampong Thom'),
(578,1,'Kampot'),
(3442,1,'Kamuli'),
(3470,1,'Kamwenge'),
(1675,1,'Kanagawa'),
(3204,1,'Kanchanaburi'),
(14,1,'Kandahar'),
(579,1,'Kandal'),
(4106,1,'Kandavas novads'),
(662,1,'Kanem'),
(1767,1,'Kangwon-do'),
(1233,1,'Kanifeng'),
(1340,1,'Kankan'),
(2407,1,'Kano'),
(3638,1,'Kansas'),
(1748,1,'Kanton'),
(421,1,'Kanton Sarajevo'),
(3471,1,'Kanungu'),
(3158,1,'Kao-hsiung city'),
(3140,1,'Kao-hsiung county'),
(580,1,'Kaoh Kong'),
(2890,1,'Kaolack'),
(3443,1,'Kapchorwa'),
(15,1,'Kapisa'),
(3265,1,'Kara'),
(3357,1,'Karabük'),
(4265,1,'Karachay-Cherkess Republic'),
(3358,1,'Karaman'),
(2291,1,'Karas'),
(484,1,'Kardjali'),
(4266,1,'Karelia, Republic of'),
(851,1,'Karlovačka'),
(892,1,'Karlovarský'),
(2320,1,'Karnali'),
(1489,1,'Karnataka'),
(200,1,'Kärnten'),
(1951,1,'Karonga'),
(3359,1,'Kars'),
(4108,1,'Kārsavas novads'),
(557,1,'Karuzi'),
(3818,1,'Kasai-Occidental'),
(3816,1,'Kasai-Oriental'),
(3472,1,'Kasese'),
(3052,1,'Kassala'),
(3299,1,'Kasserine'),
(3360,1,'Kastamonu'),
(1952,1,'Kasungu'),
(3444,1,'Katakwi'),
(3815,1,'Katanga'),
(822,1,'Katiola'),
(2408,1,'Katsina'),
(1912,1,'Kaunas'),
(45,1,'Kavaje'),
(2292,1,'Kavango'),
(2283,1,'Kayah State'),
(2467,1,'Kayangel'),
(558,1,'Kayanza'),
(2007,1,'Kayes'),
(2284,1,'Kayin State'),
(3361,1,'Kayseri'),
(3426,1,'Kayunga'),
(570,1,'Keb'),
(2409,1,'Kebbi'),
(3300,1,'Kebili'),
(1972,1,'Kedah'),
(3301,1,'Kef'),
(4117,1,'Ķeguma novads'),
(4119,1,'Ķekavas novads'),
(1973,1,'Kelantan'),
(4298,1,'Kemerovo Oblast'),
(644,1,'Kemo'),
(520,1,'Kenedougou'),
(2237,1,'Kenitra'),
(3562,1,'Kent'),
(3639,1,'Kentucky'),
(1522,1,'Kepulauan Bangka Belitung'),
(4235,1,'Kepulauan Riau'),
(1490,1,'Kerala'),
(2073,1,'Kercem'),
(1234,1,'Kerewan'),
(1559,1,'Kerman'),
(1549,1,'Kermanshah'),
(1341,1,'Kerouane'),
(1593,1,'Kerry'),
(432,1,'Kgalagadi'),
(433,1,'Kgatleng'),
(4283,1,'Khabarovsk Krai'),
(4275,1,'Khakassia, Republic of'),
(1807,1,'Khammouan'),
(4337,1,'Khanty–Mansi Autonomous Okrug – Yugra'),
(4224,1,'Kharkivska'),
(3161,1,'Khatlon'),
(2238,1,'Khemisset'),
(92,1,'Khenchela'),
(2239,1,'Khenifra'),
(3487,1,'Khersonska'),
(3488,1,'Khmelnytska'),
(2293,1,'Khomas'),
(3205,1,'Khon Kaen'),
(16,1,'Khost'),
(2240,1,'Khouribga'),
(323,1,'Khulna'),
(1552,1,'Khuzestan'),
(3473,1,'Kibaale'),
(3427,1,'Kiboga'),
(2815,1,'Kibungo'),
(2816,1,'Kibuye'),
(2008,1,'Kidal'),
(2817,1,'Kigali Rurale'),
(2818,1,'Kigali-ville'),
(3168,1,'Kigoma'),
(1594,1,'Kildare'),
(2097,1,'Kili'),
(3169,1,'Kilimanjaro'),
(3362,1,'Kilis'),
(1595,1,'Kilkenny'),
(3141,1,'Kin-men'),
(1342,1,'Kindia'),
(3682,1,'Kingman Reef'),
(1645,1,'Kingston Parish'),
(3817,1,'Kinshasa'),
(1749,1,'Kiritimati'),
(2032,1,'Kirkop'),
(1584,1,'Kirkuk'),
(4299,1,'Kirov Oblast'),
(3489,1,'Kirovohradska'),
(559,1,'Kirundo'),
(3474,1,'Kisoro'),
(1343,1,'Kissidougou'),
(1295,1,'Kitaa'),
(3456,1,'Kitgum'),
(3363,1,'Kırıkkale'),
(3364,1,'Kırklareli'),
(3365,1,'Kırşehir'),
(1913,1,'Klaipeda'),
(3366,1,'Kocaeli'),
(1676,1,'Kochi'),
(2410,1,'Kogi'),
(1554,1,'Kohkiluyeh and Buyer Ahmad'),
(4110,1,'Kokneses novads'),
(3981,1,'Kolašin'),
(2891,1,'Kolda'),
(2000,1,'Kolhumadulu'),
(40,1,'Kolonje'),
(4003,1,'Kolubara'),
(4457,1,'Komárom-Esztergom'),
(4267,1,'Komi Republic'),
(521,1,'Komondjari'),
(522,1,'Kompienga'),
(17,1,'Konar'),
(18,1,'Kondoz'),
(3367,1,'Konya'),
(852,1,'Koprivničko-križevačka'),
(48,1,'Korce'),
(823,1,'Korhogo'),
(2468,1,'Koror'),
(3958,1,'Koroška'),
(2321,1,'Kosi'),
(2927,1,'Košický'),
(2178,1,'Kosrae'),
(523,1,'Kossi'),
(4300,1,'Kostroma Oblast'),
(184,1,'Kotayk\''),
(3457,1,'Kotido'),
(3982,1,'Kotor'),
(1344,1,'Koubia'),
(366,1,'Kouffo'),
(760,1,'Kouilou'),
(2009,1,'Koulikoro'),
(524,1,'Koulpelogo'),
(1345,1,'Koundara'),
(525,1,'Kouritenga'),
(1346,1,'Kouroussa'),
(526,1,'Kourweogo'),
(1414,1,'Kowloon City Kowloon'),
(3206,1,'Krabi'),
(893,1,'Královehradecký'),
(853,1,'Krapinsko-zagorska'),
(4112,1,'Krāslavas novads'),
(4279,1,'Krasnodar Krai'),
(4280,1,'Krasnoyarsk Krai'),
(581,1,'Kratie'),
(4113,1,'Krimuldas novads'),
(3082,1,'Kronoberg'),
(49,1,'Kruje'),
(4114,1,'Krustpils novads'),
(1985,1,'Kuala Lumpur'),
(47,1,'Kucove'),
(2632,1,'Kujawsko-Pomorskie'),
(50,1,'Kukes'),
(4116,1,'Kuldīgas novads'),
(1677,1,'Kumamoto'),
(3445,1,'Kumi'),
(2294,1,'Kunene'),
(1235,1,'Kuntaur'),
(46,1,'Kurbin'),
(236,1,'Kurdamir'),
(1547,1,'Kurdistan'),
(4301,1,'Kurgan Oblast'),
(1750,1,'Kuria'),
(4302,1,'Kursk Oblast'),
(3368,1,'Kütahya'),
(1248,1,'Kvemo Kartli'),
(1420,1,'Kwai Tsing New Territories'),
(2098,1,'Kwajalein'),
(2411,1,'Kwara'),
(2964,1,'KwaZulu-Natal'),
(434,1,'Kweneng'),
(1415,1,'Kwun Tong Kowloon'),
(3475,1,'Kyenjojo'),
(3490,1,'Kyiv'),
(3491,1,'Kyivska'),
(1678,1,'Kyoto'),
(884,1,'Kyrenia'),
(485,1,'Kyustendil'),
(3883,1,'L\'Aquila'),
(945,1,'La Altagracia'),
(2193,1,'La Condamine'),
(2970,1,'La Coruña'),
(2912,1,'La Digue'),
(876,1,'La Habana'),
(1031,1,'La Libertad'),
(2539,1,'La Libertad'),
(126,1,'La Massana'),
(166,1,'La Pampa'),
(406,1,'La Paz'),
(1032,1,'La Paz'),
(1403,1,'La Paz'),
(167,1,'La Rioja'),
(2996,1,'La Rioja'),
(2913,1,'La Riviere Anglaise'),
(946,1,'La Romana'),
(3884,1,'La Spezia'),
(1033,1,'La Union'),
(2592,1,'La Union'),
(947,1,'La Vega'),
(1059,1,'Laane-Virumaa (Rakvere)'),
(1060,1,'Laanemaa (Haapsalu)'),
(2241,1,'Laayoune'),
(1347,1,'Labe'),
(2841,1,'Laborie'),
(1974,1,'Labuan'),
(663,1,'Lac'),
(238,1,'Lacin'),
(4342,1,'Ladakh'),
(2099,1,'Lae'),
(19,1,'Laghman'),
(93,1,'Laghouat'),
(2412,1,'Lagos'),
(2589,1,'Laguna'),
(3800,1,'Lahij'),
(4026,1,'Lakes'),
(824,1,'Lakota'),
(1491,1,'Lakshadweep'),
(2540,1,'Lambayeque'),
(3207,1,'Lampang'),
(3208,1,'Lamphun'),
(1523,1,'Lampung'),
(2590,1,'Lanao del Norte'),
(2591,1,'Lanao del Sur'),
(3563,1,'Lancashire'),
(1154,1,'Landes'),
(237,1,'Lankaran'),
(239,1,'Lankaran'),
(1088,1,'Länsi-Suomen lääni'),
(1596,1,'Laois'),
(1089,1,'Lapin lääni'),
(2186,1,'Lapusna'),
(3739,1,'Lara'),
(2242,1,'Larache'),
(885,1,'Larnaca'),
(2997,1,'Las Palmas'),
(877,1,'Las Tunas'),
(3885,1,'Latina'),
(973,1,'Lautem'),
(3694,1,'Lavalleja'),
(3399,1,'Lebap Welayaty'),
(3886,1,'Lecce'),
(3887,1,'Lecco'),
(3564,1,'Leicestershire'),
(2659,1,'Leiria'),
(1597,1,'Leitrim'),
(761,1,'Lekoumou'),
(1348,1,'Lelouma'),
(1404,1,'Lempira'),
(4303,1,'Leningrad Oblast'),
(2372,1,'Leon'),
(2998,1,'Leon'),
(527,1,'Leraba'),
(1854,1,'Leribe'),
(240,1,'Lerik'),
(2593,1,'Leyte'),
(52,1,'Lezhe'),
(388,1,'Lhuntse'),
(703,1,'Liaoning'),
(2100,1,'Lib'),
(894,1,'Liberecký'),
(677,1,'Libertador General Bernardo O\'Higgins'),
(51,1,'Librazhd'),
(854,1,'Ličko-senjska'),
(347,1,'Liège'),
(4121,1,'Lielvārdes novads'),
(3142,1,'Lien-chiang'),
(4122,1,'Liepāja'),
(4126,1,'Līgatnes novads'),
(2033,1,'Lija'),
(2101,1,'Likiep'),
(1953,1,'Likoma'),
(762,1,'Likouala'),
(1954,1,'Lilongwe'),
(2541,1,'Lima'),
(886,1,'Limassol'),
(4124,1,'Limbažu novads'),
(348,1,'Limburg'),
(2334,1,'Limburg'),
(1598,1,'Limerick'),
(786,1,'Limon'),
(2965,1,'Limpopo'),
(3565,1,'Lincolnshire'),
(3170,1,'Lindi'),
(4304,1,'Lipetsk Oblast'),
(974,1,'Liquica'),
(3458,1,'Lira'),
(2660,1,'Lisboa'),
(3404,1,'Little Water Cay'),
(367,1,'Littoral'),
(596,1,'Littoral'),
(4128,1,'Līvānu novads'),
(3888,1,'Livorno'),
(2999,1,'Lleida'),
(645,1,'Lobaye'),
(3889,1,'Lodi'),
(2633,1,'Lodzkie'),
(3209,1,'Loei'),
(1868,1,'Lofa'),
(664,1,'Logone Occidental'),
(665,1,'Logone Oriental'),
(1155,1,'Loir et Cher'),
(1156,1,'Loire'),
(1158,1,'Loire Atlantique'),
(1159,1,'Loiret'),
(990,1,'Loja'),
(1349,1,'Lola'),
(300,1,'Long Island'),
(1599,1,'Longford'),
(3210,1,'Lop Buri'),
(1551,1,'Lorestan'),
(2542,1,'Loreto'),
(528,1,'Loroum'),
(185,1,'Lorri'),
(678,1,'Los Lagos'),
(991,1,'Los Rios'),
(4223,1,'Los Rios'),
(2485,1,'Los Santos'),
(1160,1,'Lot'),
(1161,1,'Lot et Garonne'),
(1808,1,'Louang Namtha'),
(1809,1,'Louangphabang'),
(2892,1,'Louga'),
(3640,1,'Louisiana'),
(1600,1,'Louth'),
(486,1,'Lovech'),
(1237,1,'Lower River'),
(20,1,'Lowgar'),
(1162,1,'Lozère'),
(139,1,'Luanda'),
(3826,1,'Luapula'),
(4130,1,'Lubānas novads'),
(2634,1,'Lubelskie'),
(3071,1,'Lubombo'),
(2635,1,'Lubuskie'),
(3890,1,'Lucca'),
(4132,1,'Ludzas novads'),
(3000,1,'Lugo'),
(3492,1,'Luhanska'),
(2322,1,'Lumbini'),
(140,1,'Lunda Norte'),
(141,1,'Lunda Sul'),
(2034,1,'Luqa'),
(3827,1,'Lusaka'),
(53,1,'Lushnje'),
(3428,1,'Luwero'),
(349,1,'Luxembourg'),
(1929,1,'Luxembourg'),
(3106,1,'Luzern'),
(3493,1,'Lvivska'),
(98,1,'M\'Sila'),
(1714,1,'Ma\'an'),
(3801,1,'Ma\'rib'),
(1991,1,'Maalhosmadulu Dhekunu'),
(1990,1,'Maalhosmadulu Uthuru'),
(704,1,'Macau'),
(1350,1,'Macenta'),
(3891,1,'Macerata'),
(1955,1,'Machinga'),
(4002,1,'Mačva'),
(1715,1,'Madaba'),
(2497,1,'Madang'),
(2661,1,'Madeira'),
(1492,1,'Madhya Pradesh'),
(2676,1,'Madinat ash Shamal'),
(4134,1,'Madonas novads'),
(2543,1,'Madre de Dios'),
(3001,1,'Madrid'),
(2373,1,'Madriz'),
(3211,1,'Mae Hong Son'),
(1855,1,'Mafeteng'),
(4305,1,'Magadan Oblast'),
(679,1,'Magallanes y de la Antartica Chilena'),
(739,1,'Magdalena'),
(2594,1,'Maguindanao'),
(2276,1,'Magway'),
(3212,1,'Maha Sarakham'),
(1374,1,'Mahaica-Berbice'),
(1941,1,'Mahajanga'),
(2323,1,'Mahakali'),
(1493,1,'Maharashtra'),
(3302,1,'Mahdia'),
(341,1,'Mahilyowskaya (Mahilyow)'),
(1751,1,'Maiana'),
(3641,1,'Maine'),
(1163,1,'Maine et Loire'),
(618,1,'Maio'),
(2102,1,'Majuro'),
(560,1,'Makamba'),
(1752,1,'Makin'),
(2938,1,'Makira'),
(2884,1,'Makkah'),
(3002,1,'Malaga'),
(2939,1,'Malaita'),
(3720,1,'Malampa'),
(142,1,'Malange'),
(3369,1,'Malatya'),
(3695,1,'Maldonado'),
(1993,1,'Male Atoll'),
(54,1,'Malesi e Madhe'),
(1351,1,'Mali'),
(55,1,'Mallakaster'),
(2103,1,'Maloelap'),
(2636,1,'Malopolskie'),
(4137,1,'Mālpils novads'),
(1524,1,'Maluku'),
(1525,1,'Maluku Utara'),
(646,1,'Mambere-KadeÔ'),
(1352,1,'Mamou'),
(825,1,'Man'),
(992,1,'Manabí'),
(2374,1,'Managua'),
(975,1,'Manatuto'),
(2352,1,'Manawatu-Wanganui'),
(1164,1,'Manche'),
(1646,1,'Manchester Parish'),
(2277,1,'Mandalay'),
(1353,1,'Mandiana'),
(781,1,'Mangaia'),
(1724,1,'Mangghystau'),
(1956,1,'Mangochi'),
(301,1,'Mangrove Cay'),
(2266,1,'Manica'),
(3834,1,'Manicaland'),
(3819,1,'Maniema'),
(769,1,'Manihiki'),
(1494,1,'Manipur'),
(3370,1,'Manisa'),
(604,1,'Manitoba'),
(826,1,'Mankono'),
(3303,1,'Manouba'),
(1236,1,'Mansakonko'),
(3892,1,'Mantova'),
(118,1,'Manu\'a'),
(775,1,'Manuae'),
(976,1,'Manufahi'),
(2498,1,'Manus'),
(3171,1,'Manyara'),
(3072,1,'Manzini'),
(2268,1,'Maputo'),
(2267,1,'Maputo (city)'),
(3172,1,'Mara'),
(2383,1,'Maradi'),
(1753,1,'Marakei'),
(2705,1,'Maramureș'),
(449,1,'Maranhão'),
(3371,1,'Mardin'),
(1869,1,'Margibi'),
(4268,1,'Mari El Republic'),
(948,1,'Maria Trinidad Sanchez'),
(1914,1,'Marijampole'),
(2595,1,'Marinduque'),
(3269,1,'Maritime'),
(1540,1,'Markazi'),
(2351,1,'Marlborough'),
(1165,1,'Marne'),
(3063,1,'Marowijne'),
(2243,1,'Marrakech'),
(2035,1,'Marsa'),
(2036,1,'Marsaskala'),
(2037,1,'Marsaxlokk'),
(3642,1,'Marshall Islands'),
(4138,1,'Mārupes novads'),
(3400,1,'Mary Welayaty'),
(1870,1,'Maryland'),
(3643,1,'Maryland'),
(3429,1,'Masaka'),
(241,1,'Masalli'),
(2375,1,'Masaya'),
(2596,1,'Masbate'),
(94,1,'Mascara'),
(1856,1,'Maseru'),
(3835,1,'Mashonaland Central'),
(3836,1,'Mashonaland East'),
(3837,1,'Mashonaland West'),
(3476,1,'Masindi'),
(2454,1,'Masqat'),
(3893,1,'Massa-Carrara'),
(3644,1,'Massachusetts'),
(3838,1,'Masvingo'),
(56,1,'Mat'),
(3839,1,'Matabeleland North'),
(3840,1,'Matabeleland South'),
(2376,1,'Matagalpa'),
(2893,1,'Matam'),
(878,1,'Matanzas'),
(3894,1,'Matera'),
(450,1,'Mato Grosso'),
(451,1,'Mato Grosso do Sul'),
(1023,1,'Matruh'),
(779,1,'Mauke'),
(680,1,'Maule'),
(1905,1,'Mauren'),
(302,1,'Mayaguana'),
(3278,1,'Mayaro/Rio Claro'),
(1167,1,'Mayenne'),
(1601,1,'Mayo'),
(666,1,'Mayo-Kebbi'),
(1572,1,'Maysan'),
(3446,1,'Mayuge'),
(1563,1,'Mazandaran'),
(2637,1,'Mazowieckie'),
(4136,1,'Mazsalacas novads'),
(827,1,'Mbahiakro'),
(3447,1,'Mbale'),
(3477,1,'Mbarara'),
(3173,1,'Mbeya'),
(647,1,'Mbomou'),
(1389,1,'McDonald Island'),
(1957,1,'Mchinji'),
(2038,1,'Mdina'),
(1602,1,'Meath'),
(2324,1,'Mechi'),
(1261,1,'Mecklenburg-Vorpommern'),
(95,1,'Medea'),
(3304,1,'Medenine'),
(855,1,'Međimurska'),
(1495,1,'Meghalaya'),
(2706,1,'Mehedinți'),
(2104,1,'Mejit'),
(2244,1,'Meknes'),
(1975,1,'Melaka'),
(2469,1,'Melekeok'),
(3003,1,'Melilla'),
(2039,1,'Melliea'),
(168,1,'Mendoza'),
(2311,1,'Meneng'),
(3740,1,'Merida'),
(1932,1,'Mersch'),
(3566,1,'Merseyside'),
(3372,1,'Mersin'),
(4139,1,'Mērsraga novads'),
(3567,1,'Merthyr Tydfil'),
(3896,1,'Messina'),
(740,1,'Meta'),
(1168,1,'Meurthe et Moselle'),
(1169,1,'Meuse'),
(2159,1,'Mexico'),
(2040,1,'Mgarr'),
(3143,1,'Miao-li'),
(3645,1,'Michigan'),
(2160,1,'Michoacan de Ocampo'),
(2842,1,'Micoud'),
(3411,1,'Middle Caicos'),
(634,1,'Midland'),
(3841,1,'Midlands'),
(3568,1,'Midlothian'),
(904,1,'Midtjylland'),
(3683,1,'Midway Atoll'),
(1679,1,'Mie'),
(96,1,'Mila'),
(1989,1,'Miladhunmadulu Dhekunu'),
(1988,1,'Miladhunmadulu Uthuru'),
(3897,1,'Milano'),
(2105,1,'Mili'),
(2499,1,'Milne Bay'),
(452,1,'Minas Gerais'),
(2597,1,'Mindoro Occidental'),
(2598,1,'Mindoro Oriental'),
(242,1,'Mingacevir'),
(3646,1,'Minnesota'),
(342,1,'Minskaya'),
(2648,1,'Miquelon'),
(3741,1,'Miranda'),
(57,1,'Mirdite'),
(2599,1,'Misamis Occidental'),
(2600,1,'Misamis Oriental'),
(169,1,'Misiones'),
(2522,1,'Misiones'),
(1890,1,'Misratah'),
(3647,1,'Mississippi'),
(3648,1,'Missouri'),
(777,1,'Mitiaro'),
(1680,1,'Miyagi'),
(1681,1,'Miyazaki'),
(1496,1,'Mizoram'),
(3898,1,'Modena'),
(1857,1,'Mohale\'s Hoek'),
(755,1,'Moheli'),
(3983,1,'Mojkovac'),
(2140,1,'Moka'),
(1858,1,'Mokhotlong'),
(2285,1,'Mon State'),
(2194,1,'Monaco-Ville'),
(3742,1,'Monagas'),
(1603,1,'Monaghan'),
(3305,1,'Monastir'),
(582,1,'Mondul Kiri'),
(389,1,'Mongar'),
(3569,1,'Monmouthshire'),
(368,1,'Mono'),
(949,1,'Monsenor Nouel'),
(2914,1,'Mont Buxton'),
(2915,1,'Mont Fleuri'),
(487,1,'Montana'),
(3649,1,'Montana'),
(950,1,'Monte Cristi'),
(951,1,'Monte Plata'),
(2195,1,'Monte-Carlo'),
(2869,1,'Montegiardino'),
(3696,1,'Montevideo'),
(1871,1,'Montserrado'),
(4238,1,'Monza Brianza'),
(303,1,'Moore\'s Island'),
(2010,1,'Mopti'),
(2544,1,'Moquegua'),
(4011,1,'Moravica'),
(895,1,'Moravskoslezský'),
(3570,1,'Moray'),
(1034,1,'Morazan'),
(1170,1,'Morbihan'),
(4269,1,'Mordovia, Republic of'),
(2435,1,'More og Romdal'),
(2161,1,'Morelos'),
(2500,1,'Morobe'),
(3174,1,'Morogoro'),
(993,1,'Morona Santiago'),
(3459,1,'Moroto'),
(4333,1,'Moscow'),
(4306,1,'Moscow Oblast'),
(1171,1,'Moselle'),
(2041,1,'Mosta'),
(97,1,'Mostaganem'),
(619,1,'Mosteiros'),
(529,1,'Mouhoun'),
(4441,1,'Mount Athos'),
(4227,1,'Mount Lebanon'),
(2601,1,'Mountain'),
(143,1,'Moxico'),
(667,1,'Moyen-Chari'),
(1222,1,'Moyen-Ogooue'),
(3460,1,'Moyo'),
(3430,1,'Mpigi'),
(2966,1,'Mpumalanga'),
(2042,1,'Mqabba'),
(2043,1,'Msida'),
(2353,1,'Mt Cook-Mackenzie'),
(2044,1,'Mtarfa'),
(1249,1,'Mtskheta-Mtianeti'),
(3175,1,'Mtwara'),
(3431,1,'Mubende'),
(2953,1,'Mudug'),
(3373,1,'Muğla'),
(317,1,'Muharraq'),
(3213,1,'Mukdahan'),
(3432,1,'Mukono'),
(1997,1,'Mulaku Atoll'),
(1958,1,'Mulanje'),
(2074,1,'Munxar'),
(561,1,'Muramvya'),
(3004,1,'Murcia'),
(2707,1,'Mureș'),
(4307,1,'Murmansk Oblast'),
(1891,1,'Murzuq'),
(3374,1,'Muş'),
(2455,1,'Musandam'),
(562,1,'Muyinga'),
(1959,1,'Mwanza'),
(3176,1,'Mwanza'),
(563,1,'Mwaro'),
(3494,1,'Mykolaivska'),
(1960,1,'Mzimba'),
(99,1,'Naama'),
(4228,1,'Nabatieh'),
(3306,1,'Nabeul'),
(2245,1,'Nador'),
(2075,1,'Nadur'),
(243,1,'Naftalan'),
(1497,1,'Nagaland'),
(1682,1,'Nagano'),
(1683,1,'Nagasaki'),
(530,1,'Nahouri'),
(3053,1,'Nahr an Nil'),
(1736,1,'Nairobi Area'),
(2885,1,'Najran'),
(3461,1,'Nakapiripirit'),
(3433,1,'Nakasongola'),
(3214,1,'Nakhon Nayok'),
(3215,1,'Nakhon Pathom'),
(3216,1,'Nakhon Phanom'),
(3217,1,'Nakhon Ratchasima'),
(3218,1,'Nakhon Sawan'),
(3219,1,'Nakhon Si Thammarat'),
(3710,1,'Namangan'),
(531,1,'Namentenga'),
(144,1,'Namibe'),
(2106,1,'Namorik'),
(2269,1,'Nampula'),
(2107,1,'Namu'),
(350,1,'Namur'),
(3220,1,'Nan'),
(3144,1,'Nan-t\'ou'),
(654,1,'Nana-Grebizi'),
(648,1,'Nana-Mambere'),
(21,1,'Nangrahar'),
(3415,1,'Nanumanga'),
(3419,1,'Nanumea'),
(994,1,'Napo'),
(3899,1,'Napoli'),
(1684,1,'Nara'),
(3221,1,'Narathiwat'),
(2325,1,'Narayani'),
(741,1,'Narino'),
(1797,1,'Naryn'),
(2413,1,'Nassarawa'),
(771,1,'Nassau Island'),
(2501,1,'National Capital'),
(4140,1,'Naukšēnu novads'),
(3005,1,'Navarra'),
(3684,1,'Navassa Island'),
(3711,1,'Navoiy'),
(283,1,'Naxcivan'),
(2045,1,'Naxxar'),
(532,1,'Nayala'),
(2162,1,'Nayarit'),
(2708,1,'Neamț'),
(3571,1,'Neath Port Talbot'),
(3462,1,'Nebbi'),
(3650,1,'Nebraska'),
(2523,1,'Neembucu'),
(244,1,'Neftcala'),
(1976,1,'Negeri Sembilan'),
(1619,1,'Negev'),
(2602,1,'Negros Occidental'),
(2603,1,'Negros Oriental'),
(2354,1,'Nelson'),
(469,1,'Nelsons Island'),
(4336,1,'Nenets Autonomous Okrug'),
(4141,1,'Neretas novads'),
(3107,1,'Neuchâtel'),
(170,1,'Neuquen'),
(3651,1,'Nevada'),
(3375,1,'Nevşehir'),
(605,1,'New Brunswick'),
(3652,1,'New Hampshire'),
(2502,1,'New Ireland'),
(3653,1,'New Jersey'),
(3654,1,'New Mexico'),
(192,1,'New South Wales'),
(3655,1,'New York'),
(606,1,'Newfoundland and Labrador'),
(3572,1,'Newport'),
(435,1,'Ngamiland'),
(2470,1,'Ngaraard'),
(2471,1,'Ngarchelong'),
(2472,1,'Ngardmau'),
(2473,1,'Ngatpang'),
(2474,1,'Ngchesar'),
(2475,1,'Ngeremlengui'),
(2476,1,'Ngiwal'),
(1223,1,'Ngounie'),
(564,1,'Ngozi'),
(2384,1,'Niamey'),
(763,1,'Niari'),
(2270,1,'Niassa'),
(2312,1,'Nibok'),
(4142,1,'Nīcas novads'),
(3064,1,'Nickerie'),
(887,1,'Nicosia'),
(3108,1,'Nidwald'),
(201,1,'Niederösterreich'),
(1262,1,'Niedersachsen'),
(1172,1,'Nièvre'),
(3376,1,'Niğde'),
(2414,1,'Niger'),
(1685,1,'Niigata'),
(3984,1,'Nikšić'),
(1754,1,'Nikunau'),
(1999,1,'Nilandhe Atoll Dhekunu'),
(1998,1,'Nilandhe Atoll Uthuru'),
(1872,1,'Nimba'),
(22,1,'Nimruz'),
(1581,1,'Ninawa'),
(705,1,'Ningxia'),
(4014,1,'Nišava'),
(2928,1,'Nitriansky'),
(3416,1,'Niulakita'),
(3417,1,'Niutao'),
(4308,1,'Nizhny Novgorod Oblast'),
(1962,1,'Nkhata Bay'),
(1963,1,'Nkhotakota'),
(4458,1,'Nógrád'),
(3222,1,'Nong Bua Lamphu'),
(3223,1,'Nong Khai'),
(1755,1,'Nonouti'),
(3224,1,'Nonthaburi'),
(2335,1,'Noord-Brabant'),
(2336,1,'Noord-Holland'),
(1173,1,'Nord'),
(1382,1,'Nord'),
(2342,1,'Nord'),
(1383,1,'Nord-Est'),
(3820,1,'Nord-Kivu'),
(1384,1,'Nord-Ouest'),
(2436,1,'Nord-Trondelag'),
(903,1,'Nordjyland'),
(2437,1,'Nordland'),
(1263,1,'Nordrhein-Westfalen'),
(3573,1,'Norfolk'),
(1469,1,'Norourland eystra'),
(1470,1,'Norourland vestra'),
(3083,1,'Norrbotten'),
(742,1,'Norte de Santander'),
(4229,1,'North'),
(597,1,'North (Nord)'),
(304,1,'North Abaco'),
(1287,1,'North Aegean'),
(305,1,'North Andros'),
(3574,1,'North Ayrshire'),
(3995,1,'North Bačka'),
(3997,1,'North Banat'),
(1239,1,'North Bank'),
(3412,1,'North Caicos'),
(3656,1,'North Carolina'),
(3024,1,'North Central'),
(2604,1,'North Cotabato'),
(3657,1,'North Dakota'),
(436,1,'North East'),
(1737,1,'North Eastern'),
(306,1,'North Eleuthera'),
(1565,1,'North Khorasan'),
(3575,1,'North Lanarkshire'),
(1421,1,'North New Territories'),
(4271,1,'North Ossetia-Alania, Republic of'),
(437,1,'North West'),
(2967,1,'North West'),
(3026,1,'North Western'),
(3576,1,'North Yorkshire'),
(2460,1,'North-West Frontier'),
(3829,1,'North-Western'),
(3577,1,'Northamptonshire'),
(318,1,'Northern'),
(2503,1,'Northern'),
(2922,1,'Northern'),
(3025,1,'Northern'),
(3828,1,'Northern'),
(4027,1,'Northern Bahr el-Ghazal'),
(2968,1,'Northern Cape'),
(1081,1,'Northern Division'),
(2425,1,'Northern Islands'),
(3658,1,'Northern Mariana Islands'),
(1051,1,'Northern Red Sea (Semien-Keih-Bahri)'),
(1275,1,'Northern Region'),
(2605,1,'Northern Samar'),
(193,1,'Northern Territory'),
(2355,1,'Northland'),
(3578,1,'Northumberland'),
(598,1,'Northwest (Nord-Ouest)'),
(607,1,'Northwest Territories'),
(3965,1,'Notranjsko-kraška'),
(3579,1,'Nottinghamshire'),
(2128,1,'Nouakchott'),
(533,1,'Noumbiel'),
(608,1,'Nova Scotia'),
(3900,1,'Novara'),
(4309,1,'Novgorod Oblast'),
(4310,1,'Novosibirsk Oblast'),
(1964,1,'Nsanje'),
(1961,1,'Ntcheu'),
(1965,1,'Ntchisi'),
(3478,1,'Ntungamo'),
(2606,1,'Nueva Ecija'),
(3743,1,'Nueva Esparta'),
(2607,1,'Nueva Vizcaya'),
(2163,1,'Nuevo Leon'),
(2377,1,'Nuevo Segovia'),
(2954,1,'Nugaal'),
(3420,1,'Nui'),
(3421,1,'Nukufetau'),
(3422,1,'Nukulaelae'),
(3272,1,'Nukunonu'),
(609,1,'Nunavut'),
(3901,1,'Nuoro'),
(23,1,'Nurestan'),
(1526,1,'Nusa Tenggara Barat'),
(1527,1,'Nusa Tenggara Timur'),
(1224,1,'Nyanga'),
(1738,1,'Nyanza'),
(1354,1,'Nzerekore'),
(2164,1,'Oaxaca'),
(3967,1,'Obalno-kraška'),
(202,1,'Oberösterreich'),
(922,1,'Obock'),
(3109,1,'Obwald'),
(1405,1,'Ocotepeque'),
(583,1,'Oddar Meancheay'),
(3495,1,'Odeska'),
(828,1,'Odienne'),
(1498,1,'Odisha'),
(977,1,'Oecussi'),
(1604,1,'Offaly'),
(1225,1,'Ogooue-Ivindo'),
(1226,1,'Ogooue-Lolo'),
(1227,1,'Ogooue-Maritime'),
(4144,1,'Ogres novads'),
(2415,1,'Ogun'),
(245,1,'Oguz'),
(2295,1,'Ohangwena'),
(3659,1,'Ohio'),
(1366,1,'Oio Region'),
(1174,1,'Oise'),
(1686,1,'Oita'),
(1687,1,'Okayama'),
(1688,1,'Okinawa'),
(3660,1,'Oklahoma'),
(4146,1,'Olaines novads'),
(1406,1,'Olancho'),
(896,1,'Olomoucký'),
(2709,1,'Olt'),
(2296,1,'Omaheke'),
(649,1,'Ombella-M\'Poko'),
(2206,1,'Omnogovi'),
(4311,1,'Omsk Oblast'),
(2297,1,'Omusati'),
(2416,1,'Ondo'),
(1725,1,'Ongtustik Qazaqstan'),
(1756,1,'Onotoa'),
(610,1,'Ontario'),
(351,1,'Oost-Vlaanderen'),
(2638,1,'Opolskie'),
(2439,1,'Oppland'),
(100,1,'Oran'),
(357,1,'Orange Walk'),
(127,1,'Ordino'),
(3377,1,'Ordu'),
(246,1,'Ordubad'),
(3084,1,'Örebro'),
(3661,1,'Oregon'),
(995,1,'Orellana'),
(4312,1,'Orenburg Oblast'),
(2187,1,'Orhei'),
(2197,1,'Orhon'),
(3821,1,'Orientale'),
(3904,1,'Oristano'),
(3580,1,'Orkney Islands'),
(1175,1,'Orne'),
(1074,1,'Oromia'),
(407,1,'Oruro'),
(24,1,'Oruzgan'),
(4313,1,'Oryol Oblast'),
(1689,1,'Osaka'),
(1798,1,'Osh'),
(2298,1,'Oshana'),
(2299,1,'Oshikoto'),
(856,1,'Osječko-baranjska'),
(2440,1,'Oslo'),
(3378,1,'Osmaniye'),
(3963,1,'Osrednjeslovenska'),
(3085,1,'Östergötland'),
(2438,1,'Ostfold'),
(2417,1,'Osun'),
(2356,1,'Otago'),
(2300,1,'Otjozondjupa'),
(668,1,'Ouaddai'),
(650,1,'Ouaka'),
(101,1,'Ouargla'),
(2246,1,'Ouarzazate'),
(534,1,'Oubritenga'),
(535,1,'Oudalan'),
(1810,1,'Oudomxai'),
(369,1,'Oueme'),
(1385,1,'Ouest'),
(651,1,'Ouham'),
(652,1,'Ouham-Pende'),
(2247,1,'Oujda'),
(1090,1,'Oulun lääni'),
(102,1,'Oum el-Bouaghi'),
(829,1,'Oume'),
(1933,1,'Our Lady Fatima Parish'),
(3006,1,'Ourense'),
(2337,1,'Overijssel'),
(2207,1,'Ovorhangay'),
(3581,1,'Oxfordshire'),
(2418,1,'Oyo'),
(4147,1,'Ozolnieku novads'),
(3145,1,'P\'eng-hu'),
(3146,1,'P\'ing-tung'),
(1768,1,'P\'yongan-bukto'),
(1769,1,'P\'yongan-namdo'),
(1772,1,'P\'yongyang Special City'),
(3463,1,'Pader'),
(3905,1,'Padova'),
(375,1,'Paget'),
(1977,1,'Pahang'),
(569,1,'Pailin'),
(25,1,'Paktia'),
(26,1,'Paktika'),
(3662,1,'Palau'),
(2858,1,'Palauli'),
(2608,1,'Palawan'),
(3007,1,'Palencia'),
(3906,1,'Palermo'),
(3448,1,'Pallisa'),
(773,1,'Palmerston'),
(3685,1,'Palmyra Atoll'),
(2609,1,'Pampanga'),
(2141,1,'Pamplemousses'),
(2486,1,'Panama'),
(408,1,'Pando'),
(1915,1,'Panevezys'),
(2610,1,'Pangasinan'),
(2046,1,'Paola'),
(888,1,'Paphos'),
(1528,1,'Papua'),
(4233,1,'Papua Barat'),
(453,1,'Pará'),
(3065,1,'Para'),
(2524,1,'Paraguari'),
(454,1,'Paraíba'),
(3066,1,'Paramaribo'),
(455,1,'Paraná'),
(897,1,'Pardubický'),
(4148,1,'Pārgaujas novads'),
(1189,1,'Paris'),
(3907,1,'Parma'),
(1061,1,'Parnumaa (Parnu)'),
(390,1,'Paro'),
(3405,1,'Parrot Cay'),
(27,1,'Parwan'),
(1176,1,'Pas de Calais'),
(2545,1,'Pasco'),
(536,1,'Passore'),
(996,1,'Pastaza'),
(3225,1,'Pathum Thani'),
(3226,1,'Pattani'),
(620,1,'Paul'),
(3908,1,'Pavia'),
(4150,1,'Pāvilostas novads'),
(1726,1,'Pavlodar'),
(3697,1,'Paysandu'),
(488,1,'Pazardjik'),
(4018,1,'Pčinja'),
(952,1,'Pedernales'),
(4470,1,'Pelagoniski'),
(2477,1,'Peleliu'),
(1288,1,'Peloponnesos'),
(391,1,'Pemagatshel'),
(3177,1,'Pemba North'),
(3178,1,'Pemba South'),
(376,1,'Pembroke'),
(2047,1,'Pembroke'),
(3582,1,'Pembrokeshire'),
(3279,1,'Penal/Debe'),
(3721,1,'Penama'),
(3663,1,'Pennsylvania'),
(770,1,'Penrhyn'),
(4314,1,'Penza Oblast'),
(58,1,'Peqin'),
(1978,1,'Perak'),
(953,1,'Peravia (Bani)'),
(1979,1,'Perlis'),
(4315,1,'Perm Krai'),
(59,1,'Permet'),
(456,1,'Pernambuco'),
(489,1,'Pernik'),
(467,1,'Peros Banhos'),
(3583,1,'Perth and Kinross'),
(3909,1,'Perugia'),
(3910,1,'Pesaro e Urbino'),
(3911,1,'Pescara'),
(4459,1,'Pest'),
(1303,1,'Petit Martinique'),
(1966,1,'Phalombe'),
(3227,1,'Phangnga'),
(3228,1,'Phatthalung'),
(3229,1,'Phayao'),
(3230,1,'Phetchabun'),
(3231,1,'Phetchaburi'),
(3232,1,'Phichit'),
(3233,1,'Phitsanulok'),
(567,1,'Phnom Penh'),
(1811,1,'Phongsali'),
(4256,1,'Phra Nakhon Si Ayutthaya'),
(3234,1,'Phrae'),
(3235,1,'Phuket'),
(3912,1,'Piacenza'),
(457,1,'Piauí'),
(997,1,'Pichincha'),
(2048,1,'Pieta'),
(879,1,'Pinar del Rio'),
(3406,1,'Pine Cay'),
(4016,1,'Pirot'),
(3913,1,'Pisa'),
(3914,1,'Pistoia'),
(1355,1,'Pita'),
(2546,1,'Piura'),
(2142,1,'Plaines Wilhems'),
(2916,1,'Plaisance'),
(1910,1,'Planken'),
(370,1,'Plateau'),
(2419,1,'Plateau'),
(764,1,'Plateaux'),
(3266,1,'Plateaux'),
(3985,1,'Plav'),
(4153,1,'Pļaviņu novads'),
(490,1,'Pleven'),
(3986,1,'Pljevlja'),
(491,1,'Plovdiv'),
(3987,1,'Plužine'),
(898,1,'Plzeňský'),
(3988,1,'Podgorica'),
(2639,1,'Podkarpackie'),
(2640,1,'Podlaskie'),
(3957,1,'Podravska'),
(4004,1,'Podunavlje'),
(60,1,'Pogradec'),
(2179,1,'Pohnpei'),
(3288,1,'Point Fortin'),
(2917,1,'Pointe La Rue'),
(4471,1,'Pološki'),
(3496,1,'Poltavska'),
(1062,1,'Polvamaa (Polva)'),
(1375,1,'Pomeroon-Supenaam'),
(4007,1,'Pomoravlje'),
(2641,1,'Pomorskie'),
(3956,1,'Pomurska'),
(537,1,'Poni'),
(3008,1,'Pontevedra'),
(765,1,'Pool'),
(3915,1,'Pordenone'),
(2918,1,'Port Glaud'),
(2131,1,'Port Louis'),
(2143,1,'Port Louis'),
(3285,1,'Port of Spain'),
(2662,1,'Portalegre'),
(1647,1,'Portland Parish'),
(2663,1,'Porto'),
(621,1,'Porto Novo'),
(3744,1,'Portuguesa'),
(414,1,'Posavski Kanton'),
(1376,1,'Potaro-Siparuni'),
(3916,1,'Potenza'),
(409,1,'Potosi'),
(3584,1,'Powys'),
(857,1,'Požeško-slavonska'),
(3236,1,'Prachin Buri'),
(3237,1,'Prachuap Khiri Khan'),
(899,1,'Praha'),
(2710,1,'Prahova'),
(622,1,'Praia'),
(2843,1,'Praslin'),
(3917,1,'Prato'),
(568,1,'Preah Seihanu (Kompong Som or Sihanoukville)'),
(585,1,'Preah Vihear'),
(4155,1,'Preiļu novads'),
(2525,1,'Presidente Hayes'),
(2929,1,'Prešovský'),
(586,1,'Prey Veng'),
(4157,1,'Priekules novads'),
(4158,1,'Priekuļu novads'),
(858,1,'Primorsko-goranska'),
(4281,1,'Primorsky Krai'),
(611,1,'Prince Edward Island'),
(3280,1,'Princes Town'),
(2873,1,'Principe'),
(3413,1,'Providenciales'),
(1041,1,'Provincia Annobon'),
(1042,1,'Provincia Bioko Norte'),
(1043,1,'Provincia Bioko Sur'),
(1044,1,'Provincia Centro Sur'),
(1045,1,'Provincia Kie-Ntem'),
(1046,1,'Provincia Litoral'),
(1047,1,'Provincia Wele-Nzas'),
(4316,1,'Pskov Oblast'),
(1499,1,'Puducherry'),
(2165,1,'Puebla'),
(954,1,'Puerto Plata'),
(3664,1,'Puerto Rico'),
(767,1,'Pukapuka'),
(61,1,'Puke'),
(1980,1,'Pulau Pinang'),
(392,1,'Punakha'),
(1500,1,'Punjab'),
(2461,1,'Punjab'),
(2547,1,'Puno'),
(787,1,'Puntarenas'),
(584,1,'Pursat'),
(4035,1,'Putrajaya'),
(743,1,'Putumayo'),
(1177,1,'Puy de Dôme'),
(3179,1,'Pwani'),
(1178,1,'Pyrénées Atlantiques'),
(1180,1,'Pyrénées Orientales'),
(247,1,'Qabala'),
(1859,1,'Qacha\'s Nek'),
(2076,1,'Qala'),
(1727,1,'Qaraghandy'),
(3712,1,'Qashqadaryo'),
(248,1,'Qax'),
(249,1,'Qazax'),
(1541,1,'Qazvin'),
(1024,1,'Qina'),
(4232,1,'Qinghai'),
(250,1,'Qobustan'),
(1539,1,'Qom'),
(3713,1,'Qoraqalpog\'iston Republikasi'),
(2049,1,'Qormi'),
(1728,1,'Qostanay'),
(2050,1,'Qrendi'),
(2132,1,'Quatre Bornes'),
(251,1,'Quba'),
(252,1,'Qubadli'),
(612,1,'Québec'),
(194,1,'Queensland'),
(2166,1,'Queretaro'),
(1317,1,'Quetzaltenango'),
(2611,1,'Quezon'),
(1367,1,'Quinara Region'),
(744,1,'Quindio'),
(2167,1,'Quintana Roo'),
(2612,1,'Quirino'),
(253,1,'Qusar'),
(1860,1,'Quthing'),
(1729,1,'Qyzylorda'),
(3511,1,'Ra’s al Khaymah'),
(2051,1,'Rabat'),
(2248,1,'Rabat-Sale'),
(1250,1,'Racha Lechkhumi and Kvemo Svanet'),
(307,1,'Ragged Island'),
(3918,1,'Ragusa'),
(1501,1,'Rajasthan'),
(324,1,'Rajshahi'),
(768,1,'Rakahanga'),
(3434,1,'Rakai'),
(2286,1,'Rakhine State'),
(3238,1,'Ranong'),
(1063,1,'Raplamaa (Rapla)'),
(2326,1,'Rapti'),
(780,1,'Rarotonga'),
(4013,1,'Rasina'),
(4012,1,'Raška'),
(1771,1,'Rason Directly Governed City'),
(587,1,'Ratanak Kiri'),
(3239,1,'Ratchaburi'),
(4159,1,'Raunas novads'),
(3919,1,'Ravenna'),
(3240,1,'Rayong'),
(1566,1,'Razavi Khorasan'),
(492,1,'Razgrad'),
(1923,1,'Redange'),
(154,1,'Redonda'),
(3920,1,'Reggio Calabria'),
(3921,1,'Reggio Emilia'),
(681,1,'Region Metropolitana'),
(103,1,'Relizane'),
(1928,1,'Remich'),
(3585,1,'Renfrewshire'),
(2940,1,'Rennell and Bellona'),
(1318,1,'Retalhuleu'),
(4160,1,'Rēzekne'),
(4161,1,'Rēzeknes novads'),
(1264,1,'Rheinland-Pfalz'),
(3665,1,'Rhode Island'),
(3586,1,'Rhondda Cynon Taff'),
(1183,1,'Rhône'),
(1529,1,'Riau'),
(623,1,'Ribeira Grande'),
(4162,1,'Riebiņu novads'),
(3922,1,'Rieti'),
(3133,1,'Rif Dimashq'),
(1739,1,'Rift Valley'),
(4163,1,'Rīga'),
(3923,1,'Rimini'),
(458,1,'Rio de Janeiro'),
(459,1,'Rio Grande do Norte'),
(460,1,'Rio Grande do Sul'),
(171,1,'Rio Negro'),
(3698,1,'Rio Negro'),
(2378,1,'Rio San Juan'),
(745,1,'Risaralda'),
(2379,1,'Rivas'),
(1873,1,'River Cess'),
(3699,1,'Rivera'),
(2420,1,'Rivers'),
(2144,1,'Riviere du Rempart'),
(3497,1,'Rivnenska'),
(2613,1,'Rizal'),
(3379,1,'Rize'),
(3700,1,'Rocha'),
(2136,1,'Rodrigues'),
(2441,1,'Rogaland'),
(3241,1,'Roi Et'),
(4164,1,'Rojas novads'),
(3924,1,'Roma'),
(2614,1,'Romblon'),
(461,1,'Rondônia'),
(2108,1,'Rongelap'),
(2109,1,'Rongrik'),
(4165,1,'Ropažu novads'),
(462,1,'Roraima'),
(1605,1,'Roscommon'),
(119,1,'Rose Island'),
(4317,1,'Rostov Oblast'),
(2426,1,'Rota'),
(1084,1,'Rotuma'),
(3925,1,'Rovigo'),
(3989,1,'Rožaje'),
(4166,1,'Rucavas novads'),
(4167,1,'Rugāju novads'),
(1907,1,'Ruggell'),
(2819,1,'Ruhengeri'),
(4170,1,'Rūjienas novads'),
(3479,1,'Rukungiri'),
(3180,1,'Rukwa'),
(308,1,'Rum Cay'),
(1967,1,'Rumphi'),
(4168,1,'Rundāles novads'),
(3968,1,'Ruse'),
(565,1,'Rutana'),
(3587,1,'Rutland'),
(3181,1,'Ruvuma'),
(566,1,'Ruyigi'),
(1770,1,'Ryanggang-do (Yanggang-do)'),
(4318,1,'Ryazan Oblast'),
(3242,1,'Sa Kaeo'),
(3804,1,'Sa\'dah'),
(1064,1,'Saaremaa (Kuessaare)'),
(1265,1,'Saarland'),
(255,1,'Saatli'),
(4021,1,'Saba'),
(1981,1,'Sabah'),
(3027,1,'Sabaragamuwa'),
(1892,1,'Sabha'),
(256,1,'Sabirabad'),
(1319,1,'Sacatepequez'),
(1266,1,'Sachsen'),
(1267,1,'Sachsen-Anhalt'),
(257,1,'Sadarak'),
(2052,1,'Safi'),
(2249,1,'Safi'),
(1690,1,'Saga'),
(2278,1,'Sagaing'),
(2327,1,'Sagarmatha'),
(258,1,'Sahbuz'),
(1422,1,'Sai Kung New Territories'),
(104,1,'Saida'),
(327,1,'Saint Andrew'),
(1296,1,'Saint Andrew'),
(2848,1,'Saint Andrew'),
(924,1,'Saint Andrew Parish'),
(1648,1,'Saint Andrew Parish'),
(1649,1,'Saint Ann Parish'),
(2822,1,'Saint Anne Sandy Point'),
(2218,1,'Saint Anthony'),
(1650,1,'Saint Catherine Parish'),
(3783,1,'Saint Croix'),
(1297,1,'Saint David'),
(2849,1,'Saint David'),
(925,1,'Saint David Parish'),
(1651,1,'Saint Elizabeth Parish'),
(147,1,'Saint George'),
(328,1,'Saint George'),
(1298,1,'Saint George'),
(2850,1,'Saint George'),
(2823,1,'Saint George Basseterre'),
(377,1,'Saint George City'),
(2824,1,'Saint George Gingerland'),
(926,1,'Saint George Parish'),
(378,1,'Saint George\'s'),
(2219,1,'Saint Georges'),
(3032,1,'Saint Helena'),
(329,1,'Saint James'),
(1652,1,'Saint James Parish'),
(2825,1,'Saint James Windward'),
(148,1,'Saint John'),
(330,1,'Saint John'),
(1299,1,'Saint John'),
(3784,1,'Saint John'),
(2826,1,'Saint John Capesterre'),
(2827,1,'Saint John Figtree'),
(927,1,'Saint John Parish'),
(331,1,'Saint Joseph'),
(928,1,'Saint Joseph Parish'),
(2919,1,'Saint Louis'),
(332,1,'Saint Lucy'),
(929,1,'Saint Luke Parish'),
(1300,1,'Saint Mark'),
(930,1,'Saint Mark Parish'),
(149,1,'Saint Mary'),
(2828,1,'Saint Mary Cayon'),
(1653,1,'Saint Mary Parish'),
(333,1,'Saint Michael'),
(1301,1,'Saint Patrick'),
(2851,1,'Saint Patrick'),
(931,1,'Saint Patrick Parish'),
(150,1,'Saint Paul'),
(2829,1,'Saint Paul Capesterre'),
(2830,1,'Saint Paul Charlestown'),
(932,1,'Saint Paul Parish'),
(151,1,'Saint Peter'),
(334,1,'Saint Peter'),
(2220,1,'Saint Peter'),
(2831,1,'Saint Peter Basseterre'),
(933,1,'Saint Peter Parish'),
(4334,1,'Saint Petersburg'),
(152,1,'Saint Philip'),
(335,1,'Saint Philip'),
(2647,1,'Saint Pierre'),
(336,1,'Saint Thomas'),
(3785,1,'Saint Thomas'),
(2832,1,'Saint Thomas Lowland'),
(2833,1,'Saint Thomas Middle Island'),
(1654,1,'Saint Thomas Parish'),
(2894,1,'Saint-Louis'),
(2427,1,'Saipan'),
(1691,1,'Saitama'),
(3380,1,'Sakarya'),
(830,1,'Sakassou'),
(4270,1,'Sakha (Yakutia) Republic'),
(4321,1,'Sakhalin Oblast'),
(254,1,'Saki'),
(259,1,'Saki'),
(3243,1,'Sakon Nakhon'),
(624,1,'Sal'),
(4173,1,'Salacgrīvas novads'),
(1569,1,'Salah ad Din'),
(2712,1,'Sălaj'),
(3009,1,'Salamanca'),
(669,1,'Salamat'),
(4174,1,'Salas novads'),
(4175,1,'Salaspils novads'),
(1812,1,'Salavan'),
(955,1,'Salcedo'),
(4177,1,'Saldus novads'),
(4178,1,'Saldus, Saldus novads'),
(3926,1,'Salerno'),
(1968,1,'Salima'),
(468,1,'Salomon Islands'),
(3407,1,'Salt Cay'),
(172,1,'Salta'),
(3701,1,'Salto'),
(260,1,'Salyan'),
(203,1,'Salzburg'),
(956,1,'Samana'),
(28,1,'Samangan'),
(2615,1,'Samar'),
(4319,1,'Samara Oblast'),
(3714,1,'Samarqand'),
(262,1,'Samaxi'),
(393,1,'Samdrup Jongkhar'),
(1251,1,'Samegrelo-Zemo Svaneti'),
(263,1,'Samkir'),
(3381,1,'Samsun'),
(394,1,'Samtse'),
(1252,1,'Samtskhe-Javakheti'),
(3244,1,'Samut Prakan'),
(3245,1,'Samut Sakhon'),
(3246,1,'Samut Songkhram'),
(264,1,'Samux'),
(746,1,'San Andres y Providencia'),
(2487,1,'San Blas'),
(958,1,'San Cristobal'),
(3286,1,'San Fernando'),
(2053,1,'San Giljan'),
(2056,1,'San Gwann'),
(788,1,'San Jose'),
(3702,1,'San Jose'),
(959,1,'San Jose de Ocoa'),
(173,1,'San Juan'),
(960,1,'San Juan'),
(3282,1,'San Juan/Laventille'),
(2078,1,'San Lawrenz'),
(174,1,'San Luis'),
(2168,1,'San Luis Potosi'),
(1320,1,'San Marcos'),
(2548,1,'San Martin'),
(1035,1,'San Miguel'),
(2055,1,'San Pawl il-Bahar'),
(2526,1,'San Pedro'),
(961,1,'San Pedro de Macoris'),
(309,1,'San Salvador'),
(1036,1,'San Salvador'),
(1037,1,'San Vicente'),
(831,1,'San-Pedro'),
(3805,1,'San\'a'),
(2955,1,'Sanaag'),
(957,1,'Sanchez Ramirez'),
(880,1,'Sancti Spiritus'),
(2504,1,'Sandaun'),
(379,1,'Sandys'),
(766,1,'Sangha'),
(655,1,'Sangha-Mbaere'),
(3281,1,'Sangre Grande'),
(538,1,'Sanguie'),
(3382,1,'Şanlıurfa'),
(3722,1,'Sanma'),
(539,1,'Sanmatenga'),
(2079,1,'Sannat'),
(128,1,'Sant Julia de Loria'),
(1038,1,'Santa Ana'),
(1407,1,'Santa Barbara'),
(463,1,'Santa Catarina'),
(625,1,'Santa Catarina'),
(175,1,'Santa Cruz'),
(410,1,'Santa Cruz'),
(626,1,'Santa Cruz'),
(3010,1,'Santa Cruz de Tenerife'),
(176,1,'Santa Fe'),
(2054,1,'Santa Lucija'),
(1321,1,'Santa Rosa'),
(2057,1,'Santa Venera'),
(747,1,'Santander'),
(2664,1,'Santarém'),
(962,1,'Santiago'),
(881,1,'Santiago de Cuba'),
(177,1,'Santiago del Estero'),
(963,1,'Santiago Rodriguez'),
(964,1,'Santo Domingo'),
(627,1,'Sao Domingos'),
(628,1,'Sao Filipe'),
(629,1,'Sao Nicolau'),
(464,1,'São Paulo'),
(2872,1,'Sao Tome'),
(630,1,'Sao Vicente'),
(1185,1,'Saône et Loire'),
(29,1,'Sar-e Pol'),
(3247,1,'Saraburi'),
(427,1,'Sarajevo-Romanija or Sokolac'),
(3067,1,'Saramacca'),
(64,1,'Sarande'),
(2616,1,'Sarangani'),
(4320,1,'Saratov Oblast'),
(1982,1,'Sarawak'),
(395,1,'Sarpang'),
(1186,1,'Sarthe'),
(265,1,'Sarur'),
(613,1,'Saskatchewan'),
(832,1,'Sassandra'),
(3927,1,'Sassari'),
(2711,1,'Satu-Mare'),
(3248,1,'Satun'),
(2859,1,'Satupa\'itea'),
(4180,1,'Saulkrastu novads'),
(3267,1,'Savanes'),
(1813,1,'Savannakhet'),
(2145,1,'Savanne'),
(3959,1,'Savinjska'),
(3990,1,'Šavnik'),
(1187,1,'Savoie'),
(3928,1,'Savona'),
(1893,1,'Sawfajjin'),
(1901,1,'Schaan'),
(3111,1,'Schaffhausen'),
(1909,1,'Schellenberg'),
(1268,1,'Schleswig-Holstein'),
(3112,1,'Schwyz'),
(3588,1,'Scottish Borders'),
(2011,1,'Segou'),
(3011,1,'Segovia'),
(833,1,'Seguela'),
(1191,1,'Seine et Marne'),
(1190,1,'Seine Maritime'),
(1207,1,'Seine St-Denis'),
(4182,1,'Sējas novads'),
(4255,1,'Sejong-teukbyeoljachisi'),
(1983,1,'Selangor'),
(2204,1,'Selenge'),
(1620,1,'Semaria'),
(3435,1,'Sembabule'),
(1562,1,'Semnan'),
(540,1,'Seno'),
(4239,1,'Seoul-teukbyeolsi'),
(465,1,'Sergipe'),
(2871,1,'Serravalle'),
(2328,1,'Seti'),
(105,1,'Setif'),
(2250,1,'Settat'),
(2665,1,'Setúbal'),
(3498,1,'Sevastopol'),
(4472,1,'Severoistočen'),
(3012,1,'Sevilla'),
(3307,1,'Sfax'),
(1423,1,'Sha Tin New Territories'),
(706,1,'Shaanxi'),
(2956,1,'Shabeellaha Dhexe'),
(2957,1,'Shabeellaha Hoose'),
(3806,1,'Shabwah'),
(1390,1,'Shag Island'),
(1416,1,'Sham Shui Po Kowloon'),
(3054,1,'Shamal Bahr al Ghazal'),
(3055,1,'Shamal Darfur'),
(3056,1,'Shamal Kurdufan'),
(1025,1,'Shamal Sina\''),
(2287,1,'Shan State'),
(707,1,'Shandong'),
(708,1,'Shanghai'),
(709,1,'Shanxi'),
(1621,1,'Sharon'),
(3057,1,'Sharq al Istiwa\'iyah'),
(3723,1,'Shefa'),
(3589,1,'Shetland Islands'),
(1253,1,'Shida Kartli'),
(1692,1,'Shiga'),
(1693,1,'Shimane'),
(3182,1,'Shinyanga'),
(186,1,'Shirak'),
(3073,1,'Shishelweni'),
(1694,1,'Shizuoka'),
(62,1,'Shkoder'),
(3590,1,'Shropshire'),
(493,1,'Shumen'),
(1730,1,'Shyghys Qazaqstan'),
(4444,1,'Shymkent'),
(3250,1,'Si Sa Ket'),
(1916,1,'Siauliai'),
(859,1,'Šibensko-kninska'),
(2713,1,'Sibiu'),
(710,1,'Sichuan'),
(3308,1,'Sidi'),
(106,1,'Sidi Bel Abbes'),
(2251,1,'Sidi Kacem'),
(588,1,'Siemreap'),
(3929,1,'Siena'),
(3787,1,'Sigave'),
(2058,1,'Siggiewi'),
(1356,1,'Siguiri'),
(4184,1,'Siguldas novads'),
(3383,1,'Siirt'),
(2012,1,'Sikasso'),
(1502,1,'Sikkim'),
(3309,1,'Siliana'),
(494,1,'Silistra'),
(2169,1,'Sinaloa'),
(2462,1,'Sindh'),
(834,1,'Sinfra'),
(3249,1,'Sing Buri'),
(3183,1,'Singida'),
(3058,1,'Sinnar'),
(1874,1,'Sinoe'),
(3384,1,'Sinop'),
(4022,1,'Sint Eustatius'),
(3068,1,'Sipaliwini'),
(3283,1,'Siparia'),
(2617,1,'Siquijor'),
(3930,1,'Siracusa'),
(3715,1,'Sirdaryo'),
(3449,1,'Sironko'),
(860,1,'Sisačko-moslavačka'),
(541,1,'Sissili'),
(1558,1,'Sistan and Baluchistan'),
(3386,1,'Sivas'),
(266,1,'Siyazan'),
(3385,1,'Şırnak'),
(908,1,'Sjælland'),
(3086,1,'Skåne'),
(107,1,'Skikda'),
(4473,1,'Skopski'),
(63,1,'Skrapar'),
(4185,1,'Skrīveru novads'),
(4187,1,'Skrundas novads'),
(2642,1,'Slaskie'),
(2059,1,'Sliema'),
(1606,1,'Sligo'),
(495,1,'Sliven'),
(4189,1,'Smiltenes novads'),
(380,1,'Smith\'s'),
(4323,1,'Smolensk Oblast'),
(496,1,'Smolyan'),
(3087,1,'Södermanland'),
(2271,1,'Sofala'),
(497,1,'Sofia'),
(498,1,'Sofia - town'),
(2443,1,'Sogn og Fjordane'),
(2421,1,'Sokoto'),
(1322,1,'Solola'),
(3113,1,'Solothurn'),
(1731,1,'Soltustik Qazaqstan'),
(1075,1,'Somali'),
(3591,1,'Somerset'),
(1194,1,'Somme'),
(4460,1,'Somogy'),
(3931,1,'Sondrio'),
(4439,1,'Sondrio, Livigno'),
(3251,1,'Songkhla'),
(2170,1,'Sonora'),
(1039,1,'Sonsonate'),
(2478,1,'Sonsorol'),
(2958,1,'Sool'),
(2442,1,'Sor-Trondelag'),
(3013,1,'Soria'),
(3703,1,'Soriano'),
(2188,1,'Soroca'),
(3450,1,'Soroti'),
(2618,1,'Sorsogon'),
(835,1,'Soubre'),
(2844,1,'Soufriere'),
(108,1,'Souk Ahras'),
(542,1,'Soum'),
(543,1,'Sourou'),
(3310,1,'Sousse'),
(4230,1,'South'),
(600,1,'South (Sud)'),
(310,1,'South Abaco'),
(1289,1,'South Aegean'),
(311,1,'South Andros'),
(195,1,'South Australia'),
(3592,1,'South Ayrshire'),
(4000,1,'South Bačka'),
(3998,1,'South Banat'),
(3409,1,'South Caicos'),
(3666,1,'South Carolina'),
(2619,1,'South Cotabato'),
(3667,1,'South Dakota'),
(438,1,'South East'),
(312,1,'South Eleuthera'),
(718,1,'South Island'),
(1567,1,'South Khorasan'),
(3593,1,'South Lanarkshire'),
(635,1,'South Town'),
(3594,1,'South Yorkshire'),
(381,1,'Southampton'),
(319,1,'Southern'),
(439,1,'Southern'),
(2923,1,'Southern'),
(3028,1,'Southern'),
(3830,1,'Southern'),
(1052,1,'Southern (Debub)'),
(2505,1,'Southern Highlands'),
(1412,1,'Southern Hong Kong Island'),
(2620,1,'Southern Leyte'),
(1076,1,'Southern Nations - Nationalities and Peoples Region'),
(1050,1,'Southern Red Sea (Debub-Keih-Bahri)'),
(2357,1,'Southland'),
(601,1,'Southwest (Sud-Ouest).'),
(313,1,'Spanish Wells'),
(862,1,'Splitsko-dalmatinska'),
(3961,1,'Spodnjeposavska'),
(636,1,'Spot Bay'),
(418,1,'Srednjebosanski Kanton'),
(4001,1,'Srem'),
(1934,1,'St. Anthony Parish'),
(3110,1,'St. Gallen'),
(1937,1,'St. Lawrence Parish'),
(1935,1,'St. Lazarus Parish'),
(2191,1,'St‚nga Nistrului'),
(3595,1,'Staffordshire'),
(637,1,'Stake Bay'),
(358,1,'Stann Creek'),
(499,1,'Stara Zagora'),
(4282,1,'Stavropol Krai'),
(204,1,'Steiermark'),
(3596,1,'Stirling'),
(3088,1,'Stockholm'),
(4192,1,'Stopiņu novads'),
(900,1,'Středočeský'),
(4194,1,'Strenču novads'),
(589,1,'Stung Treng'),
(2714,1,'Suceava'),
(1323,1,'Suchitepequez'),
(748,1,'Sucre'),
(3745,1,'Sucre'),
(998,1,'Sucumbíos'),
(1386,1,'Sud'),
(2343,1,'Sud'),
(1387,1,'Sud-Est'),
(3822,1,'Sud-Kivu'),
(3597,1,'Suffolk'),
(3162,1,'Sughd'),
(1026,1,'Suhaj'),
(2205,1,'Suhbaatar'),
(3252,1,'Sukhothai'),
(4234,1,'Sulawesi Barat'),
(1530,1,'Sulawesi Selatan'),
(1531,1,'Sulawesi Tengah'),
(1532,1,'Sulawesi Tenggara'),
(1533,1,'Sulawesi Utara'),
(2621,1,'Sultan Kudarat'),
(2622,1,'Sulu'),
(4006,1,'Šumadija'),
(1534,1,'Sumatera Barat'),
(1535,1,'Sumatera Selatan'),
(1536,1,'Sumatera Utara'),
(261,1,'Sumqayit'),
(3499,1,'Sumska'),
(1471,1,'Suourland'),
(1472,1,'Suournes'),
(3253,1,'Suphan Buri'),
(3254,1,'Surat Thani'),
(2623,1,'Surigao del Norte'),
(2624,1,'Surigao del Sur'),
(3255,1,'Surin'),
(3598,1,'Surrey'),
(1894,1,'Surt'),
(772,1,'Surwarrow'),
(3716,1,'Surxondaryo'),
(267,1,'Susa'),
(268,1,'Susa'),
(2444,1,'Svalbard'),
(590,1,'Svay Rieng'),
(4322,1,'Sverdlovsk Oblast'),
(120,1,'Swains Island'),
(3599,1,'Swansea'),
(2060,1,'Swieqi'),
(2643,1,'Swietokrzyskie'),
(905,1,'Syddanmark'),
(325,1,'Sylhet'),
(187,1,'Syunik\''),
(4461,1,'Szabolcs-Szatmár-Bereg'),
(3147,1,'T\'ai-chung'),
(3156,1,'T\'ai-chung'),
(3148,1,'T\'ai-nan'),
(3157,1,'T\'ai-nan'),
(3159,1,'T\'ai-pei city'),
(3149,1,'T\'ai-pei county'),
(3150,1,'T\'ai-tung'),
(3151,1,'T\'ao-yuan'),
(2061,1,'Ta Xbiex'),
(3807,1,'Ta\'izz'),
(2171,1,'Tabasco'),
(1757,1,'Tabiteuea'),
(3184,1,'Tabora'),
(836,1,'Tabou'),
(1758,1,'Tabuaeran'),
(2886,1,'Tabuk'),
(3746,1,'Tachira'),
(2549,1,'Tacna'),
(3704,1,'Tacuarembo'),
(923,1,'Tadjoura'),
(3724,1,'Tafea'),
(2125,1,'Tagant'),
(2385,1,'Tahoua'),
(1424,1,'Tai Po New Territories'),
(3256,1,'Tak'),
(2920,1,'Takamaka'),
(591,1,'Takeo'),
(30,1,'Takhar'),
(776,1,'Takutea'),
(1799,1,'Talas'),
(4197,1,'Talsu novads'),
(1759,1,'Tamana'),
(109,1,'Tamanrasset'),
(2172,1,'Tamaulipas'),
(2895,1,'Tambacounda'),
(4324,1,'Tambov Oblast'),
(1503,1,'Tamil Nadu'),
(2253,1,'Tan-Tan'),
(837,1,'Tanda'),
(670,1,'Tandjile'),
(3185,1,'Tanga'),
(2252,1,'Tangier'),
(2279,1,'Tanintharyi'),
(2254,1,'Taounate'),
(544,1,'Tapoa'),
(2422,1,'Taraba'),
(1895,1,'Tarabulus (Tripoli)'),
(2358,1,'Taranaki'),
(3932,1,'Taranto'),
(682,1,'Tarapaca'),
(1760,1,'Tarawa'),
(500,1,'Targovishte'),
(1896,1,'Tarhunah'),
(411,1,'Tarija'),
(2625,1,'Tarlac'),
(1195,1,'Tarn'),
(1196,1,'Tarn et Garonne'),
(2255,1,'Taroudannt'),
(631,1,'Tarrafal'),
(3014,1,'Tarragona'),
(269,1,'Tartar'),
(1065,1,'Tartumaa (Tartu)'),
(3134,1,'Tartus'),
(2062,1,'Tarxien'),
(196,1,'Tasmania'),
(2256,1,'Tata'),
(3311,1,'Tataouine'),
(4272,1,'Tatarstan, Republic of'),
(1917,1,'Taurage'),
(188,1,'Tavush'),
(2626,1,'Tawi-Tawi'),
(2257,1,'Taza'),
(1244,1,'Tbilisi'),
(110,1,'Tebessa'),
(1538,1,'Tehran'),
(3387,1,'Tekirdağ'),
(1622,1,'Tel Aviv (Gosh Dan)'),
(4231,1,'Telangana'),
(2445,1,'Telemark'),
(2715,1,'Teleorman'),
(1357,1,'Telimele'),
(1918,1,'Telsiai'),
(477,1,'Temburong'),
(2941,1,'Temotu'),
(3668,1,'Tennessee'),
(65,1,'Tepelene'),
(1761,1,'Teraina'),
(3933,1,'Teramo'),
(1984,1,'Terengganu'),
(3934,1,'Terni'),
(3500,1,'Ternopilska'),
(1204,1,'Territoire de Belfort'),
(3015,1,'Teruel'),
(4198,1,'Tērvetes novads'),
(2272,1,'Tete'),
(2258,1,'Tetouan'),
(3669,1,'Texas'),
(1861,1,'Thaba-Tseka'),
(1290,1,'Thessaly'),
(2896,1,'Thies'),
(1987,1,'Thiladhunmathi Dhekunu'),
(1986,1,'Thiladhunmathi Uthuru'),
(396,1,'Thimphu'),
(470,1,'Three Brothers'),
(3114,1,'Thurgau'),
(1269,1,'Thüringen'),
(1969,1,'Thyolo'),
(711,1,'Tianjin'),
(111,1,'Tiaret'),
(840,1,'Tiassale'),
(3115,1,'Ticino'),
(838,1,'Tiebissou'),
(178,1,'Tierra del Fuego'),
(2189,1,'Tighina'),
(1077,1,'Tigray'),
(2386,1,'Tillaberi'),
(2716,1,'Timiș'),
(112,1,'Tindouf'),
(839,1,'Tingrela'),
(2428,1,'Tinian'),
(113,1,'Tipaza'),
(1607,1,'Tipperary'),
(67,1,'Tirane'),
(2126,1,'Tiris Zemmour'),
(205,1,'Tirol'),
(114,1,'Tissemsilt'),
(3991,1,'Tivat'),
(115,1,'Tizi Ouzou'),
(2259,1,'Tiznit'),
(2173,1,'Tlaxcala'),
(116,1,'Tlemcen'),
(1942,1,'Toamasina'),
(3290,1,'Tobago'),
(466,1,'Tocantins'),
(1695,1,'Tochigi'),
(2959,1,'Togdheer'),
(3388,1,'Tokat'),
(2110,1,'Toke'),
(1696,1,'Tokushima'),
(1697,1,'Tokyo'),
(359,1,'Toledo'),
(3016,1,'Toledo'),
(1943,1,'Toliara'),
(749,1,'Tolima'),
(4462,1,'Tolna'),
(1368,1,'Tombali Region'),
(2013,1,'Tombouctou'),
(4326,1,'Tomsk Oblast'),
(3274,1,'Tongatapu'),
(4015,1,'Toplica'),
(3725,1,'Torba'),
(3600,1,'Torfaen'),
(3935,1,'Torino'),
(3451,1,'Tororo'),
(3717,1,'Toshkent City'),
(3718,1,'Toshkent Region'),
(1324,1,'Totonicapan'),
(1698,1,'Tottori'),
(841,1,'Touba'),
(1358,1,'Tougue'),
(842,1,'Toulepleu'),
(843,1,'Toumodi'),
(2203,1,'Tov'),
(270,1,'Tovuz'),
(1699,1,'Toyama'),
(3312,1,'Tozeur'),
(3389,1,'Trabzon'),
(3257,1,'Trang'),
(3936,1,'Trapani'),
(2127,1,'Trarza'),
(397,1,'Trashigang'),
(398,1,'Trashiyangste'),
(3258,1,'Trat'),
(429,1,'Trebinje'),
(3705,1,'Treinta y Tres'),
(1655,1,'Trelawny Parish'),
(2930,1,'Trenčiansky'),
(3937,1,'Trento'),
(3938,1,'Treviso'),
(1903,1,'Triesen'),
(1906,1,'Triesenberg'),
(3939,1,'Trieste'),
(2834,1,'Trinity Palmetto Point'),
(1504,1,'Tripura'),
(2931,1,'Trnavský'),
(2446,1,'Troms'),
(399,1,'Trongsa'),
(66,1,'Tropoje'),
(3747,1,'Trujillo'),
(400,1,'Tsirang'),
(1425,1,'Tsuen Wan New Territories'),
(2860,1,'Tuamasaga'),
(1897,1,'Tubruq'),
(179,1,'Tucuman'),
(1426,1,'Tuen Mun New Territories'),
(4199,1,'Tukuma novads'),
(4327,1,'Tula Oblast'),
(2717,1,'Tulcea'),
(2550,1,'Tumbes'),
(3284,1,'Tunapuna/Piarco'),
(3390,1,'Tunceli'),
(999,1,'Tungurahua'),
(3313,1,'Tunis'),
(1294,1,'Tunu'),
(478,1,'Tutong'),
(4273,1,'Tuva Republic'),
(545,1,'Tuy'),
(415,1,'Tuzlanski Kanton'),
(4325,1,'Tver Oblast'),
(3601,1,'Tyne and Wear'),
(4328,1,'Tyumen Oblast'),
(2313,1,'Uaboe'),
(3259,1,'Ubon Ratchathani'),
(271,1,'Ucar'),
(2551,1,'Ucayali'),
(3940,1,'Udine'),
(4274,1,'Udmurt Republic'),
(3260,1,'Udon Thani'),
(145,1,'Uige'),
(2111,1,'Ujae'),
(2112,1,'Ujelang'),
(2196,1,'Ulanbaatar'),
(3992,1,'Ulcinj'),
(4245,1,'Ulsan-gwangyeoksi'),
(4329,1,'Ulyanovsk Oblast'),
(4445,1,'Ulytau'),
(3512,1,'Umm al Qaywayn'),
(2677,1,'Umm Sa\'id'),
(2678,1,'Umm Salal'),
(2820,1,'Umutara'),
(2190,1,'Ungheni'),
(4028,1,'Unity'),
(413,1,'Unsko-Sanski Kanton'),
(1377,1,'Upper Demerara-Berbice'),
(1276,1,'Upper East Region'),
(4029,1,'Upper Nile'),
(1240,1,'Upper River'),
(1378,1,'Upper Takutu-Upper Essequibo'),
(1277,1,'Upper West Region'),
(3089,1,'Uppsala'),
(3116,1,'Uri'),
(3391,1,'Uşak'),
(889,1,'Ústecký'),
(1040,1,'Usulutan'),
(3670,1,'Utah'),
(1919,1,'Utena'),
(3261,1,'Uthai Thani'),
(2113,1,'Utirik'),
(2338,1,'Utrecht'),
(1505,1,'Uttar Pradesh'),
(3262,1,'Uttaradit'),
(4343,1,'Uttarakhand'),
(3029,1,'Uva'),
(2202,1,'Uvs'),
(2861,1,'Va\'a-o-Fonoti'),
(2133,1,'Vacoas-Phoenix'),
(1900,1,'Vaduz'),
(4201,1,'Vaiņodes novads'),
(2862,1,'Vaisigano'),
(3423,1,'Vaitupu'),
(653,1,'Vakaga'),
(1209,1,'Val d\'Oise'),
(1208,1,'Val de Marne'),
(3117,1,'Valais'),
(2719,1,'Vâlcea'),
(3602,1,'Vale of Glamorgan'),
(3017,1,'Valencia'),
(1066,1,'Valgamaa (Valga)'),
(4204,1,'Valkas novads'),
(3018,1,'Valladolid'),
(1408,1,'Valle'),
(750,1,'Valle del Cauca'),
(2063,1,'Valletta'),
(4205,1,'Valmiera'),
(683,1,'Valparaiso'),
(965,1,'Valverde'),
(3392,1,'Van'),
(1197,1,'Var'),
(4208,1,'Varakļānu novads'),
(863,1,'Varaždinska'),
(4466,1,'Vardarski'),
(3941,1,'Varese'),
(3748,1,'Vargas'),
(4209,1,'Vārkavas novads'),
(3090,1,'Värmland'),
(501,1,'Varna'),
(4463,1,'Vas'),
(2718,1,'Vaslui'),
(3091,1,'Västerbotten'),
(3092,1,'Västernorrland'),
(3093,1,'Västmanland'),
(3094,1,'Västra Götaland'),
(1198,1,'Vaucluse'),
(3118,1,'Vaud'),
(751,1,'Vaupes'),
(3275,1,'Vava\'u'),
(844,1,'Vavoua'),
(189,1,'Vayots\' Dzor'),
(4210,1,'Vecpiebalgas novads'),
(4211,1,'Vecumnieku novads'),
(502,1,'Veliko Tarnovo'),
(1199,1,'Vendée'),
(3942,1,'Venezia'),
(4212,1,'Ventspils'),
(4213,1,'Ventspils novads'),
(2174,1,'Veracruz de Ignacio de la Llave'),
(2488,1,'Veraguas'),
(3943,1,'Verbano-Cusio-Ossola'),
(3944,1,'Vercelli'),
(3671,1,'Vermont'),
(3945,1,'Verona'),
(2447,1,'Vest-Agder'),
(1473,1,'Vestfiroir'),
(2448,1,'Vestfold'),
(1474,1,'Vesturland'),
(4464,1,'Veszprém'),
(2666,1,'Viana do Castelo'),
(1924,1,'Vianden'),
(3946,1,'Vibo Valentia'),
(3947,1,'Vicenza'),
(752,1,'Vichada'),
(197,1,'Victoria'),
(2077,1,'Victoria'),
(503,1,'Vidin'),
(1200,1,'Vienne'),
(1801,1,'Vientiane'),
(1814,1,'Vientiane'),
(4215,1,'Viesītes novads'),
(2845,1,'Vieux-Fort'),
(2667,1,'Vila Real'),
(4217,1,'Viļakas novads'),
(4219,1,'Viļānu novads'),
(1067,1,'Viljandimaa (Viljandi)'),
(882,1,'Villa Clara'),
(1920,1,'Vilnius'),
(3501,1,'Vinnytska'),
(978,1,'Viqueque'),
(3672,1,'Virgin Islands'),
(3673,1,'Virginia'),
(864,1,'Virovitičko-podravska'),
(2668,1,'Viseu'),
(3948,1,'Viterbo'),
(343,1,'Vitsyebskaya (Vitsyebsk)'),
(352,1,'Vlaams Brabant'),
(4289,1,'Vladimir Oblast'),
(426,1,'Vlasenica'),
(68,1,'Vlore'),
(4290,1,'Volgograd Oblast'),
(4291,1,'Vologda Oblast'),
(1278,1,'Volta Region'),
(3502,1,'Volynska'),
(206,1,'Vorarlberg'),
(4292,1,'Voronezh Oblast'),
(1068,1,'Vorumaa (Voru)'),
(1202,1,'Vosges'),
(2720,1,'Vrancea'),
(504,1,'Vratza'),
(865,1,'Vukovarsko-srijemska'),
(901,1,'Vysočina'),
(2360,1,'Waikato'),
(2361,1,'Wairarapa'),
(1700,1,'Wakayama'),
(3686,1,'Wake Island'),
(3436,1,'Wakiso'),
(3788,1,'Wallis'),
(1413,1,'Wan Chai Hong Kong Island'),
(401,1,'Wangdue Phodrang'),
(3069,1,'Wanica'),
(3059,1,'Warab'),
(31,1,'Wardak'),
(2644,1,'Warminsko-Mazurskie'),
(4030,1,'Warrap'),
(382,1,'Warwick'),
(3603,1,'Warwickshire'),
(3674,1,'Washington'),
(1571,1,'Wasit'),
(1608,1,'Waterford'),
(2359,1,'Wellington'),
(599,1,'West (Ouest)'),
(1546,1,'West Azarbaijan'),
(3999,1,'West Bačka'),
(1506,1,'West Bengal'),
(3414,1,'West Caicos'),
(2362,1,'West Coast'),
(3604,1,'West Dunbartonshire'),
(638,1,'West End'),
(314,1,'West Grand Bahama'),
(1291,1,'West Greece'),
(719,1,'West Island'),
(3605,1,'West Lothian'),
(1292,1,'West Macedonia'),
(3606,1,'West Midlands'),
(2508,1,'West New Britain'),
(3607,1,'West Sussex'),
(3675,1,'West Virginia'),
(3608,1,'West Yorkshire'),
(353,1,'West-Vlaanderen'),
(121,1,'Western'),
(639,1,'Western'),
(1241,1,'Western'),
(1740,1,'Western'),
(2506,1,'Western'),
(2924,1,'Western'),
(2942,1,'Western'),
(3030,1,'Western'),
(3831,1,'Western'),
(198,1,'Western Australia'),
(4031,1,'Western Bahr el-Ghazal'),
(2969,1,'Western Cape'),
(1083,1,'Western Division'),
(4032,1,'Western Equatoria'),
(2507,1,'Western Highlands'),
(3609,1,'Western Isles'),
(1279,1,'Western Region'),
(1609,1,'Westmeath'),
(1656,1,'Westmoreland Parish'),
(1610,1,'Wexford'),
(1611,1,'Wicklow'),
(2645,1,'Wielkopolskie'),
(207,1,'Wien'),
(3610,1,'Wiltshire'),
(1925,1,'Wiltz'),
(3676,1,'Wisconsin'),
(1228,1,'Woleu-Ntem'),
(1417,1,'Wong Tai Sin Kowloon'),
(2960,1,'Woqooyi Galbeed'),
(3611,1,'Worcestershire'),
(2114,1,'Wotho'),
(2115,1,'Wotje'),
(3612,1,'Wrexham'),
(3677,1,'Wyoming'),
(273,1,'Xacmaz'),
(2080,1,'Xagra'),
(1815,1,'Xaignabouli'),
(1818,1,'Xaisomboun'),
(272,1,'Xankandi'),
(274,1,'Xanlar'),
(1816,1,'Xekong'),
(2081,1,'Xewkija'),
(2064,1,'Xgajra'),
(1817,1,'Xiangkhoang'),
(712,1,'Xinjiang'),
(275,1,'Xizi'),
(276,1,'Xocali'),
(277,1,'Xocavand'),
(3719,1,'Xorazm'),
(1898,1,'Yafran'),
(546,1,'Yagha'),
(3263,1,'Yala'),
(3393,1,'Yalova'),
(1701,1,'Yamagata'),
(1702,1,'Yamaguchi'),
(4339,1,'Yamalo-Nenets Autonomous Okrug'),
(1703,1,'Yamanashi'),
(505,1,'Yambol'),
(845,1,'Yamoussoukro'),
(2280,1,'Yangon'),
(2180,1,'Yap'),
(3749,1,'Yaracuy'),
(278,1,'Yardimli'),
(2314,1,'Yaren'),
(4332,1,'Yaroslavl Oblast'),
(3264,1,'Yasothon'),
(547,1,'Yatenga'),
(1418,1,'Yau Tsim Mong Kowloon'),
(1560,1,'Yazd'),
(190,1,'Yerevan'),
(279,1,'Yevlax'),
(2423,1,'Yobe'),
(1537,1,'Yogyakarta'),
(1359,1,'Yomou'),
(1203,1,'Yonne'),
(1409,1,'Yoro'),
(3394,1,'Yozgat'),
(1800,1,'Ysyk-Kol'),
(2175,1,'Yucatan'),
(1427,1,'Yuen Long New Territories'),
(614,1,'Yukon Territory'),
(3464,1,'Yumbe'),
(3152,1,'Yun-lin'),
(713,1,'Yunnan'),
(1192,1,'Yvelines'),
(4331,1,'Zabaykalsky Krai'),
(2065,1,'Zabbar'),
(3993,1,'Žabljak'),
(32,1,'Zabol'),
(1325,1,'Zacapa'),
(2176,1,'Zacatecas'),
(2646,1,'Zachodniopomorskie'),
(866,1,'Zadarska'),
(3314,1,'Zaghouan'),
(867,1,'Zagrebačka'),
(146,1,'Zaire'),
(4009,1,'Zaječar'),
(3503,1,'Zakarpatska'),
(4465,1,'Zala'),
(2627,1,'Zambales'),
(2273,1,'Zambezia'),
(2628,1,'Zamboanga del Norte'),
(2629,1,'Zamboanga del Sur'),
(2630,1,'Zamboanga Sibugay'),
(2424,1,'Zamfara'),
(3020,1,'Zamora'),
(1000,1,'Zamora Chinchipe'),
(280,1,'Zangilan'),
(1544,1,'Zanjan'),
(3186,1,'Zanzibar Central/South'),
(3187,1,'Zanzibar North'),
(3188,1,'Zanzibar Urban/West'),
(422,1,'Zapadnobosanska'),
(420,1,'Zapadnohercegovacka Zupanija'),
(3504,1,'Zaporizka'),
(281,1,'Zaqatala'),
(3021,1,'Zaragoza'),
(282,1,'Zardab'),
(3960,1,'Zasavska'),
(2066,1,'Zebbug'),
(2082,1,'Zebbug'),
(2339,1,'Zeeland'),
(2067,1,'Zejtun'),
(416,1,'Zenicko-Dobojski Kanton'),
(1732,1,'Zhambyl'),
(714,1,'Zhejiang'),
(402,1,'Zhemgang'),
(3505,1,'Zhytomyrskа'),
(2897,1,'Ziguinchor'),
(2932,1,'Žilinský'),
(4221,1,'Zilupes novads'),
(2387,1,'Zinder'),
(548,1,'Ziro'),
(4010,1,'Zlatibor'),
(902,1,'Zlínský'),
(1899,1,'Zlitan'),
(1970,1,'Zomba'),
(549,1,'Zondoma'),
(3395,1,'Zonguldak'),
(371,1,'Zou'),
(550,1,'Zoundweogo'),
(846,1,'Zuenoula'),
(2456,1,'Zufar'),
(3119,1,'Zug'),
(2340,1,'Zuid-Holland'),
(3750,1,'Zulia'),
(3120,1,'Zürich'),
(2068,1,'Zurrieq');

--
-- Table structure for table `oc_zone_to_geo_zone`
--

DROP TABLE IF EXISTS `oc_zone_to_geo_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `zone_id` int(11) DEFAULT 0,
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_zone_to_geo_zone`
--

INSERT INTO `oc_zone_to_geo_zone` VALUES
(1,4,222,0),
(2,3,222,3513),
(3,3,222,3514),
(4,3,222,3515),
(5,3,222,3516),
(6,3,222,3517),
(7,3,222,3518),
(8,3,222,3519),
(9,3,222,3520),
(10,3,222,3521),
(11,3,222,3522),
(12,3,222,3523),
(13,3,222,3524),
(14,3,222,3525),
(15,3,222,3526),
(16,3,222,3527),
(17,3,222,3528),
(18,3,222,3529),
(19,3,222,3530),
(20,3,222,3531),
(21,3,222,3532),
(22,3,222,3533),
(23,3,222,3534),
(24,3,222,3535),
(25,3,222,3536),
(26,3,222,3537),
(27,3,222,3538),
(28,3,222,3539),
(29,3,222,3540),
(30,3,222,3541),
(31,3,222,3542),
(32,3,222,3543),
(33,3,222,3544),
(34,3,222,3545),
(35,3,222,3546),
(36,3,222,3547),
(37,3,222,3548),
(38,3,222,3549),
(39,3,222,3550),
(40,3,222,3551),
(41,3,222,3552),
(42,3,222,3553),
(43,3,222,3554),
(44,3,222,3555),
(45,3,222,3556),
(46,3,222,3557),
(47,3,222,3558),
(48,3,222,3559),
(49,3,222,3560),
(50,3,222,3561),
(51,3,222,3562),
(52,3,222,3563),
(53,3,222,3564),
(54,3,222,3565),
(55,3,222,3566),
(56,3,222,3567),
(57,3,222,3568),
(58,3,222,3569),
(59,3,222,3570),
(60,3,222,3571),
(61,3,222,3572),
(62,3,222,3573),
(63,3,222,3574),
(64,3,222,3575),
(65,3,222,3576),
(66,3,222,3577),
(67,3,222,3578),
(68,3,222,3579),
(69,3,222,3580),
(70,3,222,3581),
(71,3,222,3582),
(72,3,222,3583),
(73,3,222,3584),
(74,3,222,3585),
(75,3,222,3586),
(76,3,222,3587),
(77,3,222,3588),
(78,3,222,3589),
(79,3,222,3590),
(80,3,222,3591),
(81,3,222,3592),
(82,3,222,3593),
(83,3,222,3594),
(84,3,222,3595),
(85,3,222,3596),
(86,3,222,3597),
(87,3,222,3598),
(88,3,222,3599),
(89,3,222,3600),
(90,3,222,3601),
(91,3,222,3602),
(92,3,222,3603),
(93,3,222,3604),
(94,3,222,3605),
(95,3,222,3606),
(96,3,222,3607),
(97,3,222,3608),
(98,3,222,3609),
(99,3,222,3610),
(100,3,222,3611),
(101,3,222,3612),
(102,3,222,3949),
(103,3,222,3950),
(104,3,222,3951),
(105,3,222,3952),
(106,3,222,3953),
(107,3,222,3954),
(108,3,222,3955);
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-08-13 17:30:40
