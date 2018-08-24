-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: localhost    Database: java2b
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `cs_board`
--

DROP TABLE IF EXISTS `cs_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cs_board` (
  `bnum` int(11) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `content` varchar(300) DEFAULT NULL,
  `subject` varchar(45) NOT NULL,
  `img_path` varchar(50) DEFAULT NULL,
  `has_re` int(11) DEFAULT '0',
  `cdate` date DEFAULT NULL,
  `rgroup` int(11) DEFAULT NULL,
  `rstep` int(11) DEFAULT '1',
  `hide` char(4) DEFAULT 'SHOW',
  PRIMARY KEY (`bnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cs_board`
--

LOCK TABLES `cs_board` WRITE;
/*!40000 ALTER TABLE `cs_board` DISABLE KEYS */;
INSERT INTO `cs_board` VALUES (1,'','ㅇㅇ','교환','common3.jpg',1,'2018-08-02',1,1,'SHOW'),(2,'admin','ㅇㅋ','답변',NULL,0,'2018-08-02',1,2,'SHOW'),(3,'','ㅇㅇ','환불','jin.jpg',1,'2018-08-02',3,1,'SHOW'),(4,'','ㅇㅇ','ㅇㅇ',NULL,0,'2018-08-02',4,1,'SHOW'),(5,'','a','a',NULL,0,'2018-08-02',5,1,'SHOW'),(7,'','c','c',NULL,0,'2018-08-02',7,1,'SHOW'),(9,'','bbb','bbb',NULL,1,'2018-08-02',9,1,'SHOW'),(10,'','vvv','vvv',NULL,0,'2018-08-02',10,1,'SHOW'),(11,'','ddd','ddd',NULL,1,'2018-08-02',11,1,'SHOW'),(12,'','fff','fff',NULL,0,'2018-08-02',12,1,'SHOW'),(13,'admin','bb','답변',NULL,0,'2018-08-02',9,2,'SHOW'),(14,'admin','dd','답변',NULL,0,'2018-08-03',11,2,'SHOW'),(15,'java123','테스트','숨김글',NULL,1,'2018-08-08',15,1,'HIDE'),(16,'admin','잘됨','답변',NULL,0,'2018-08-08',15,2,'HIDE'),(17,'admin','11','11',NULL,0,'2018-08-17',17,1,'SHOW'),(18,'admin','11','11',NULL,0,'2018-08-17',18,1,'SHOW'),(19,'admin','11','11',NULL,0,'2018-08-17',19,1,'SHOW'),(20,'admin','11','11',NULL,0,'2018-08-17',20,1,'SHOW'),(21,'admin','11','11',NULL,0,'2018-08-17',21,1,'SHOW'),(22,'admin','11','11',NULL,0,'2018-08-17',22,1,'SHOW'),(23,'admin','11','11',NULL,0,'2018-08-17',23,1,'SHOW'),(24,'admin','11','11',NULL,0,'2018-08-17',24,1,'SHOW'),(25,'admin','11','11',NULL,0,'2018-08-17',25,1,'SHOW'),(26,'admin','11','11',NULL,1,'2018-08-17',26,1,'SHOW'),(27,'admin','11','11',NULL,0,'2018-08-17',27,1,'SHOW'),(28,'admin','11','답변',NULL,0,'2018-08-17',26,2,'SHOW'),(29,'admin','ㅇㅇ','답변',NULL,0,'2018-08-17',3,2,'SHOW');
/*!40000 ALTER TABLE `cs_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_stock`
--

DROP TABLE IF EXISTS `item_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_stock` (
  `item_code` char(4) NOT NULL,
  `state` varchar(10) DEFAULT NULL,
  `idate` date DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `inumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_stock`
--

LOCK TABLES `item_stock` WRITE;
/*!40000 ALTER TABLE `item_stock` DISABLE KEYS */;
INSERT INTO `item_stock` VALUES ('F001','입고','2018-07-01',444,444,1),('F001','출고','2018-07-03',11,433,2),('F001','출고','2018-07-10',33,400,3),('null','입고','2018-07-12',33,33,1),('null','출고','2018-07-13',3,30,2),('F001','출고','2018-07-20',50,350,4),('null','입고','2018-07-22',30,60,3),('M001','등록','2018-07-24',0,0,1),('V001','등록','2018-07-26',0,0,1),('null','등록','2018-07-26',0,0,1),('V003','등록','2018-07-26',0,0,1),('V001','입고','2018-07-26',100,100,2),('V003','입고','2018-07-26',200,200,2),('T001','등록','2018-07-26',0,0,1),('T001','입고','2018-07-26',1,1,2),('null','등록','2018-07-26',0,0,1),('null','등록','2018-07-27',0,0,1),('T001','입고','2018-07-29',50,51,3),('V003','출고','2018-07-30',10,190,3),('T002','등록','2018-07-31',0,0,1),('T003','등록','2018-07-31',0,0,1),('M002','등록','2018-07-31',0,30,1),('F001','출고','2018-08-01',1,349,5),('F001','출고','2018-08-01',1,348,6),('F001','출고','2018-08-01',1,347,7),('F001','출고','2018-08-01',1,346,8),('F001','출고','2018-08-01',1,345,9),('F001','출고','2018-08-01',1,344,10),('F001','출고','2018-08-01',1,343,11),('F001','입고','2018-08-01',5,348,12),('null','등록','2018-08-03',0,0,1),('null','등록','2018-08-03',0,0,1),('null','등록','2018-08-03',0,0,1),('T002','주문','2018-08-09',2,2,2),('V001','주문','2018-08-09',1,101,3),('M002','주문','2018-08-09',1,26,3),('M002','주문','2018-08-09',1,25,4),('F001','주문','2018-08-09',10,338,13),('F001','주문','2018-08-10',1,337,14),('F001','주문','2018-08-10',10,327,15),('G001','등록','2018-08-13',0,0,1),('G001','입고','2018-08-13',50,50,2),('G001','주문','2018-08-13',1,49,3),('T001','주문','2018-08-13',8,43,4),('T001','주문','2018-08-16',1,42,5),('T002','주문','2018-08-16',1,1,3),('M002','주문','2018-08-06',3,27,2),('M002','주문','2018-08-09',1,24,5),('F001','주문','2018-08-20',1,326,16);
/*!40000 ALTER TABLE `item_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `item_view`
--

DROP TABLE IF EXISTS `item_view`;
/*!50001 DROP VIEW IF EXISTS `item_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `item_view` AS SELECT 
 1 AS `vdate`,
 1 AS `item_code`,
 1 AS `category`,
 1 AS `img_path`,
 1 AS `item_name`,
 1 AS `price`,
 1 AS `sale`,
 1 AS `stock`,
 1 AS `readcount`,
 1 AS `purchase`,
 1 AS `ihide`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `item_code` char(4) NOT NULL,
  `item_name` varchar(45) NOT NULL,
  `price` int(11) NOT NULL,
  `origin` varchar(20) DEFAULT NULL,
  `category` varchar(10) NOT NULL,
  `img_path` varchar(50) DEFAULT NULL,
  `sale` int(11) NOT NULL DEFAULT '0',
  `content` varchar(200) DEFAULT NULL,
  `readcount` int(11) DEFAULT '0',
  `ihide` int(11) DEFAULT '0',
  PRIMARY KEY (`item_code`),
  UNIQUE KEY `item_code_idx` (`item_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES ('F001','청송사과',150,'청송','과일','apple.jpg',0,'빨간맛',2,0),('G001','이천 쌀',40000,'이천','곡류','wheat5.jpg',5,'황금쌀',0,0),('M001','얼음골사과즙',150,'밀양','가공','apple.jpg',0,'사과맛',0,0),('M002','바질페스토',10000,'나','가공','basil.jpg',10,'내가 만듦',0,0),('T001','미숫가루',6000,'우리집','차','apple10.jpg',20,'집에서 만듦',1,0),('T002','보리차',3000,'대구','차','wheat3.jpg',0,'꼬소함',0,0),('T003','유자차',8000,'성주','차','cup.jpg',5,'달달함',0,0),('V001','푸른 깻잎',2000,'밀양','채소','apple7.jpg',10,'무농약 친환경',14,0),('V003','푸른 상추',1200,'밀양','채소','apple9.jpg',0,'세일없다',8,0);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `bnum` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(300) DEFAULT NULL,
  `subject` varchar(45) NOT NULL,
  `img_path` varchar(50) DEFAULT NULL,
  `readcount` int(11) DEFAULT '0',
  `ndate` date DEFAULT NULL,
  PRIMARY KEY (`bnum`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'한다','세일','common4.jpg',33,'2018-08-02'),(2,'aa','aa',NULL,1,'2018-08-02'),(4,'cc','cc',NULL,2,'2018-08-02'),(5,'테스트','중복 테스트',NULL,0,'2018-08-14'),(6,'테스트','중복 테스트',NULL,0,'2018-08-14'),(7,'테스트','중복 테스트',NULL,0,'2018-08-14'),(8,'1','테스트',NULL,1,'2018-08-14'),(9,'1','테스트',NULL,26,'2018-08-14'),(10,'11','중복',NULL,1,'2018-08-14'),(11,'11','중복',NULL,1,'2018-08-14'),(12,'33445','테스트3',NULL,1,'2018-08-14'),(13,'334445556667','테스트3',NULL,1,'2018-08-14'),(14,'3344455566677','테스트3',NULL,1,'2018-08-14'),(16,'test','test',NULL,1,'2018-08-16'),(17,'test2','test2',NULL,1,'2018-08-16'),(18,'testets','ㅅㄷtest3',NULL,1,'2018-08-16');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_item` (
  `item_code` char(4) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` int(11) DEFAULT '0',
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_code`,`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES ('F001',2,1,150),('F001',4,1,150),('F001',6,1,150),('F001',7,1,150),('F001',11,10,150),('F001',12,1,150),('F001',13,10,150),('F001',17,1,150),('G001',14,1,38000),('M001',5,1,150),('M002',2,3,9000),('M002',5,1,9000),('M002',9,1,9000),('M002',10,1,9000),('T001',3,1,4800),('T001',4,1,4800),('T001',15,8,4800),('T001',16,1,4800),('T002',2,1,3000),('T002',8,2,3000),('T002',16,1,3000),('T003',3,1,7600),('T003',7,1,7600),('V001',8,1,1800);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `order_view`
--

DROP TABLE IF EXISTS `order_view`;
/*!50001 DROP VIEW IF EXISTS `order_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `order_view` AS SELECT 
 1 AS `order_id`,
 1 AS `item_code`,
 1 AS `item_name`,
 1 AS `price`,
 1 AS `amount`,
 1 AS `dati`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `dati` datetime NOT NULL,
  `del_phone` varchar(45) DEFAULT NULL,
  `del_mail` varchar(50) DEFAULT NULL,
  `del_addr` varchar(45) NOT NULL,
  `del_postcode` char(5) NOT NULL,
  `depoint` int(11) DEFAULT '0',
  `state` varchar(10) NOT NULL,
  `pay` int(11) DEFAULT NULL,
  `payment` varchar(10) DEFAULT NULL,
  `receiver` varchar(20) DEFAULT NULL,
  `parcel` int(11) DEFAULT '0',
  PRIMARY KEY (`order_id`),
  KEY `order_id_idx` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'admin','1899-12-31 00:00:00',NULL,NULL,'서울 강남구 삼성로 29 (개포동, 경기여자고등학교)11','06324',150,'주문완료',12000,'계좌이체','관리자',0),(2,'admin','2018-08-06 16:24:55',NULL,NULL,'서울 강남구 삼성로 29 (개포동, 경기여자고등학교)11','06324',150,'주문완료',29850,'계좌이체','관리자',0),(3,'admin','2018-08-06 17:12:07',NULL,NULL,'서울 강남구 삼성로 29 (개포동, 경기여자고등학교)11','06324',400,'상품출고',15000,'계좌이체','관리자',0),(4,'admin','2018-08-07 13:39:31','01010001000','0718moss@naver.com','서울 강남구 삼성로 29 (개포동, 경기여자고등학교)11','06324',50,'주문완료',7900,'무통장입금','관리자',3000),(5,'admin','2018-08-07 15:04:12','01010001000','0718moss@naver.com','서울 강남구 삼성로 29 (개포동, 경기여자고등학교)11','06324',150,'상품출고',12000,'신용카드','관리자',3000),(6,'admin','2018-08-07 15:07:41','01010001000','0718moss@naver.com','서울 강남구 삼성로 29 (개포동, 경기여자고등학교)11','06324',1,'배송완료',3149,'계좌이체','관리자',3000),(7,'java123','2018-08-07 15:51:28','01022222222','0718moss@naver.com','제주특별자치도 서귀포시 가가로 14 (상예동)가가 가가가가','63534',750,'배송완료',10000,'무통장입금','자바바',3000),(8,'admin','2018-08-09 15:42:59','01010001000','0718moss@naver.com','서울 강남구 삼성로 29 (개포동, 경기여자고등학교)11','06324',48,'배송완료',10752,'신용카드','관리자',0),(9,'admin','2018-08-09 16:01:11','01010001000','0718moss@naver.com','서울 강남구 삼성로 29 (개포동, 경기여자고등학교)11','06324',100,'주문완료',11900,'계좌이체','관리자',3000),(10,'admin','2018-08-09 16:01:11','01010001000','0718moss@naver.com','서울 강남구 삼성로 29 (개포동, 경기여자고등학교)11','06324',100,'주문완료',11900,'계좌이체','관리자',3000),(11,'admin','2018-08-09 16:05:09','01010001000','0718moss@naver.com','서울 강남구 삼성로 29 (개포동, 경기여자고등학교)11','06324',50,'주문완료',4450,'무통장입금','관리자',3000),(12,'admin','2018-08-10 16:22:02','01010001000','0718moss@naver.com','서울 강남구 삼성로 29 (개포동, 경기여자고등학교)11','06324',150,'주문완료',3000,'계좌이체','관리자',3000),(13,'admin','2018-08-10 16:22:38','01010001000','0718moss@naver.com','서울 강남구 삼성로 29 (개포동, 경기여자고등학교)11','06324',500,'주문완료',4000,'계좌이체','관리자',3000),(14,'admin','2018-08-13 13:28:59','01010001000','0718moss@naver.com','서울 강남구 삼성로 29 (개포동, 경기여자고등학교)11','06324',1000,'주문완료',37000,'무통장입금','관리자',0),(15,'admin','2018-08-13 13:41:23','01010001000','0718moss@naver.com','서울 강남구 삼성로 29 (개포동, 경기여자고등학교)11','06324',400,'배송완료',38000,'계좌이체','관리자',0),(16,'admin','2018-08-16 14:59:02','01010001000','0718moss@naver.com','서울 강남구 삼성로 29 (개포동, 경기여자고등학교)11','06324',100,'배송완료',10700,'무통장입금','관리자',3000),(17,'java123','2018-08-20 12:56:08','01022222222','0718moss@naver.com','제주특별자치도 서귀포시 가가로 14 (상예동)가가 가가가가','63534',50,'상품출고',3100,'계좌이체','김자바',3000);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `point`
--

DROP TABLE IF EXISTS `point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `point` (
  `pt_num` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `state` varchar(10) NOT NULL,
  `plminus` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `pdate` date DEFAULT NULL,
  PRIMARY KEY (`pt_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point`
--

LOCK TABLES `point` WRITE;
/*!40000 ALTER TABLE `point` DISABLE KEYS */;
/*!40000 ALTER TABLE `point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna_board`
--

DROP TABLE IF EXISTS `qna_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qna_board` (
  `bnum` int(11) NOT NULL,
  `item_code` char(4) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `content` varchar(400) DEFAULT NULL,
  `subject` varchar(45) NOT NULL,
  `img_path` varchar(50) DEFAULT NULL,
  `has_re` int(11) DEFAULT '0',
  `qdate` date DEFAULT NULL,
  `rgroup` int(11) DEFAULT NULL,
  `rstep` int(11) DEFAULT '1',
  `qhide` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna_board`
--

LOCK TABLES `qna_board` WRITE;
/*!40000 ALTER TABLE `qna_board` DISABLE KEYS */;
INSERT INTO `qna_board` VALUES (1,'F001','admin','??','왜안옴','common13.jpg',0,'2018-08-09',1,1,0),(1,'T002','admin','11','1',NULL,0,'2018-08-09',1,1,0),(2,'F001','admin','1','1',NULL,0,'2018-08-10',2,1,0),(3,'F001','admin','3','3',NULL,1,'2018-08-10',3,1,0),(7,'F001','admin\n','333','333',NULL,0,'2018-08-10',3,2,0),(10,'F001','admin','테스트2','숨김글','common17.jpg',1,'2018-08-13',10,1,0),(11,'F001','admin','테스트3','숨김글',NULL,0,'2018-08-13',11,1,0),(12,'F001','admin','테스트4','숨김',NULL,0,'2018-08-13',12,1,0),(13,'F001','admin','88','숨김','sap.jpg',1,'2018-08-13',13,1,1),(14,'F001','admin\n','됨','숨김',NULL,0,'2018-08-13',13,2,1),(1,'M001','admin','?','언제들어오나유',NULL,0,'2018-08-13',1,1,0),(1,'T001','admin','ㅇㅇ','ㅇㅇ',NULL,0,'2018-08-13',1,1,0),(15,'F001','관리자','<span id=\"itemname\">[구매상품 | ${item_name}]</span>','테스트3',NULL,0,'2018-08-17',10,2,0);
/*!40000 ALTER TABLE `qna_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_board`
--

DROP TABLE IF EXISTS `review_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_board` (
  `bnum` int(11) NOT NULL,
  `item_code` char(4) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `content` varchar(400) DEFAULT NULL,
  `subject` varchar(45) NOT NULL,
  `img_path` varchar(50) DEFAULT NULL,
  `has_re` int(11) DEFAULT '0',
  `rdate` date DEFAULT NULL,
  `rgroup` int(11) DEFAULT NULL,
  `rstep` int(11) DEFAULT '1',
  `order_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_board`
--

LOCK TABLES `review_board` WRITE;
/*!40000 ALTER TABLE `review_board` DISABLE KEYS */;
INSERT INTO `review_board` VALUES (1,'T003','admin','그러함','달달함','common11.jpg',0,'2018-08-08',1,1,3),(1,'M002','admin','ㅋ','맛있음','common14.jpg',0,'2018-08-09',1,1,2),(1,'F001','admin','1','리뷰1',NULL,0,'2018-08-09',1,1,6),(1,'T002','admin','ㅇㅇ','구수함',NULL,0,'2018-08-09',1,1,8),(0,'F001','관리자','불후의 명저 『철학 이야기』와 『문명 이야기』를 통해 전 세계 수많은 독자들을 철학과 역사의 세계로 안내한 윌 듀런트. 그가 선정한 인류 문명의 ‘위대한’ 순간들의 목록이 한 권의 책에 담겼다. 교육을 위한 최고의 책 100권부터 위대한 사상가 10인, 위대한 시인 10인, 인류 진보의 최고봉과 세계사의 결정적인 연도들까지, 세상에서 가장 중요한 지식의 모음집이라 할 만하다.\r\n이 책 『위대한 사상들』에서 듀런트는 지식','답변',NULL,0,'2018-08-10',1,2,0),(2,'F001','admin','11','11','wheat4.jpg',1,'2018-08-10',2,1,2),(3,'F001','admin','33','33',NULL,0,'2018-08-10',3,1,4),(4,'F001','admin','44','44',NULL,1,'2018-08-10',4,1,11),(0,'F001','관리자','44444444444444','44',NULL,0,'2018-08-10',4,2,0),(5,'F001','관리자','감사','리뷰',NULL,0,'2018-08-17',2,2,0);
/*!40000 ALTER TABLE `review_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test1`
--

DROP TABLE IF EXISTS `test1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1` (
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test1`
--

LOCK TABLES `test1` WRITE;
/*!40000 ALTER TABLE `test1` DISABLE KEYS */;
/*!40000 ALTER TABLE `test1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `user_view`
--

DROP TABLE IF EXISTS `user_view`;
/*!50001 DROP VIEW IF EXISTS `user_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `user_view` AS SELECT 
 1 AS `user_id`,
 1 AS `grade`,
 1 AS `userpay`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` varchar(20) NOT NULL,
  `passwd` varchar(300) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `birth` date DEFAULT NULL,
  `gender` char(2) DEFAULT NULL,
  `postcode` char(5) NOT NULL,
  `address` varchar(60) NOT NULL,
  `address_second` varchar(60) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `grade` varchar(10) DEFAULT '일반회원',
  `usalt` varchar(300) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','9129b39504a05a83bb7a05eeb233a298d9d9902c804ab85a55f4034aa1efd770','관리자','01010001000','1994-09-09','남','06324','서울 강남구 삼성로 29 (개포동, 경기여자고등학교)','11','0718moss@naver.com','관리자','[B@750860ca'),('java123','e937e71c16e033be7499f02d87afe53fcf4feae5a715b505e920f31284976920','김자바','01022222222','1999-12-12','남','63534','제주특별자치도 서귀포시 가가로 14 (상예동)','가가 가가가가','0718moss@naver.com','일반회원','[B@6b4b6f6c');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `item_view`
--

/*!50001 DROP VIEW IF EXISTS `item_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`java`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `item_view` AS select (select `item_stock`.`idate` from `item_stock` where ((`item_stock`.`state` = '등록') and (`items`.`item_code` = `item_stock`.`item_code`))) AS `vdate`,`items`.`item_code` AS `item_code`,`items`.`category` AS `category`,`items`.`img_path` AS `img_path`,`items`.`item_name` AS `item_name`,`items`.`price` AS `price`,`items`.`sale` AS `sale`,(select `a`.`stock` from `item_stock` `a` where (`a`.`inumber` = (select max(`b`.`inumber`) from `item_stock` `b` where ((`a`.`item_code` = `b`.`item_code`) and (`b`.`item_code` = `items`.`item_code`))))) AS `stock`,`items`.`readcount` AS `readcount`,(select sum(`item_stock`.`amount`) from `item_stock` where ((`item_stock`.`state` = '주문') and (`items`.`item_code` = `item_stock`.`item_code`))) AS `purchase`,`items`.`ihide` AS `ihide` from (`items` left join `item_stock` on((`items`.`item_code` = `item_stock`.`item_code`))) group by `items`.`item_code` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_view`
--

/*!50001 DROP VIEW IF EXISTS `order_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`java`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `order_view` AS select `order_item`.`order_id` AS `order_id`,`items`.`item_code` AS `item_code`,`items`.`item_name` AS `item_name`,round(((`items`.`price` * (100 - `items`.`sale`)) / 100),0) AS `price`,`order_item`.`amount` AS `amount`,`orders`.`dati` AS `dati` from ((`order_item` join `items`) join `orders`) where ((`order_item`.`item_code` = `items`.`item_code`) and (`orders`.`order_id` = `order_item`.`order_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_view`
--

/*!50001 DROP VIEW IF EXISTS `user_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = euckr */;
/*!50001 SET character_set_results     = euckr */;
/*!50001 SET collation_connection      = euckr_korean_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`java`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `user_view` AS select `users`.`user_id` AS `user_id`,`users`.`grade` AS `grade`,(select sum(`orders`.`pay`) from `orders` where (`orders`.`user_id` = `users`.`user_id`)) AS `userpay` from (`users` left join `orders` on((`users`.`user_id` = `orders`.`user_id`))) group by `users`.`user_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-23 17:04:38
