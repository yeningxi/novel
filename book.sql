-- MySQL dump 10.13  Distrib 5.5.58, for Win64 (AMD64)
--
-- Host: localhost    Database: books
-- ------------------------------------------------------
-- Server version	5.5.58

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channelid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ID',
  `money` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '������',
  `is_account` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '�Ƿ����',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ʱ��',
  `proportion` decimal(3,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '����',
  PRIMARY KEY (`id`),
  KEY `channelid` (`channelid`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user`
--

DROP TABLE IF EXISTS `admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '�û�id',
  `uname` varchar(30) NOT NULL DEFAULT '',
  `password` char(60) NOT NULL DEFAULT '',
  `o_password` varchar(32) NOT NULL DEFAULT '',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `address` varchar(30) NOT NULL DEFAULT '',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '״̬',
  PRIMARY KEY (`uid`),
  KEY `name` (`uname`,`password`),
  KEY `c_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user`
--

LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;
INSERT INTO `admin_user` VALUES (1,'','admin','',0,'',1);
/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `award`
--

DROP TABLE IF EXISTS `award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `award` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '�û�ID',
  `bookid` int(10) unsigned NOT NULL COMMENT '�鼮ID',
  `money` int(10) unsigned NOT NULL COMMENT '�������',
  `create_time` int(10) unsigned NOT NULL COMMENT 'ʱ��',
  `type` enum('����','�߸�') NOT NULL DEFAULT '����' COMMENT '����',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`create_time`),
  KEY `bookid` (`bookid`,`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�߸�������';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `award`
--

LOCK TABLES `award` WRITE;
/*!40000 ALTER TABLE `award` DISABLE KEYS */;
/*!40000 ALTER TABLE `award` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `balance`
--

DROP TABLE IF EXISTS `balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `balance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `channelid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ID',
  `time` int(10) unsigned NOT NULL COMMENT '0',
  `is_balance` enum('�ѽ���','������') NOT NULL DEFAULT '������' COMMENT '�Ƿ����',
  `money` decimal(6,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '������',
  PRIMARY KEY (`id`),
  KEY `tc` (`channelid`,`time`),
  KEY `channel` (`channelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��������';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `balance`
--

LOCK TABLES `balance` WRITE;
/*!40000 ALTER TABLE `balance` DISABLE KEYS */;
/*!40000 ALTER TABLE `balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_balance`
--

DROP TABLE IF EXISTS `book_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_balance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `book_id` int(10) unsigned NOT NULL COMMENT 'BOOKID',
  `book_name` varchar(20) NOT NULL DEFAULT '' COMMENT '����',
  `balance_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�ƹ���',
  PRIMARY KEY (`id`),
  KEY `bc` (`book_id`,`balance_count`),
  KEY `count` (`balance_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ƹ������';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_balance`
--

LOCK TABLES `book_balance` WRITE;
/*!40000 ALTER TABLE `book_balance` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_case`
--

DROP TABLE IF EXISTS `book_case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_case` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�û�ID',
  `bookid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�鼮ID',
  `chapterid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�½�ID',
  `rtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�Ķ�ʱ��',
  PRIMARY KEY (`id`),
  KEY `ubr` (`uid`,`bookid`,`rtime`),
  KEY `ur` (`uid`,`rtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ǩ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_case`
--

LOCK TABLES `book_case` WRITE;
/*!40000 ALTER TABLE `book_case` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_case` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_sale`
--

DROP TABLE IF EXISTS `book_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_sale` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bookid` int(10) unsigned NOT NULL DEFAULT '0',
  `read_user` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�Ķ�����',
  `sale_count` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '�����۶�',
  `book_name` varchar(20) NOT NULL DEFAULT '' COMMENT '����',
  PRIMARY KEY (`id`),
  KEY `bid` (`bookid`,`sale_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���������';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_sale`
--

LOCK TABLES `book_sale` WRITE;
/*!40000 ALTER TABLE `book_sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_type`
--

DROP TABLE IF EXISTS `book_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_type` (
  `type_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `tp_name` varchar(20) NOT NULL DEFAULT '' COMMENT '��������',
  `pid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '������ID',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  PRIMARY KEY (`type_id`),
  KEY `pid` (`pid`,`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_type`
--

LOCK TABLES `book_type` WRITE;
/*!40000 ALTER TABLE `book_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `bookid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'BOOKID',
  `bookname` varchar(20) NOT NULL DEFAULT '' COMMENT 'С˵����',
  `author` varchar(20) NOT NULL DEFAULT '' COMMENT '����',
  `status` tinyint(3) unsigned NOT NULL COMMENT '״̬��0�����걾��1�������У�2��̫�ࣩ',
  `sale_type` enum('1','0') NOT NULL DEFAULT '1' COMMENT '�������ͣ�0���������ۣ�1���½ڳ��ۣ�',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '���ʱ��',
  PRIMARY KEY (`bookid`),
  KEY `bname` (`bookname`),
  KEY `author` (`author`),
  KEY `ctime` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel` (
  `channelid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `channelname` varchar(30) NOT NULL DEFAULT '' COMMENT '��������',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�û�id',
  `proportion` decimal(3,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '�ֳ�',
  `readcount` smallint(5) unsigned NOT NULL DEFAULT '10' COMMENT '������ע���Ķ���',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `type` varchar(5) NOT NULL DEFAULT '' COMMENT '����',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '������ID',
  `one` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�����ֶ�1',
  `two` varchar(30) NOT NULL DEFAULT '' COMMENT '�����ֶ�1',
  PRIMARY KEY (`channelid`),
  UNIQUE KEY `channelname` (`channelname`),
  KEY `uid` (`uid`),
  KEY `ctime` (`create_time`),
  KEY `cp` (`pid`,`channelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel`
--

LOCK TABLES `channel` WRITE;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_login`
--

DROP TABLE IF EXISTS `channel_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�û�ID',
  `channelid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ID',
  `login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '��¼ʱ��',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT 'IP��ַ',
  PRIMARY KEY (`id`),
  KEY `uil` (`uid`,`ip`,`login_time`),
  KEY `uli` (`uid`,`login_time`,`ip`,`channelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������¼��¼';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_login`
--

LOCK TABLES `channel_login` WRITE;
/*!40000 ALTER TABLE `channel_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `channel_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chapter`
--

DROP TABLE IF EXISTS `chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chapter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chapterid` int(10) unsigned NOT NULL COMMENT '�½���',
  `content` mediumtext NOT NULL COMMENT '����',
  `chapter_name` varchar(30) NOT NULL DEFAULT '' COMMENT '�½�����',
  `bookid` int(10) unsigned DEFAULT NULL COMMENT 'BOOKID',
  `book_name` varchar(20) NOT NULL DEFAULT '' COMMENT '����',
  `price` smallint(5) unsigned DEFAULT '0' COMMENT '�ۼ�',
  `size` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '�ַ���',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '״̬(0�����ɶ���1���ɶ�)',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ʱ��',
  PRIMARY KEY (`id`),
  KEY `chapterid` (`chapterid`),
  KEY `bookid` (`bookid`),
  KEY `bname` (`book_name`),
  KEY `size` (`size`),
  KEY `ctime` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�½�����';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapter`
--

LOCK TABLES `chapter` WRITE;
/*!40000 ALTER TABLE `chapter` DISABLE KEYS */;
/*!40000 ALTER TABLE `chapter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�û�ID',
  `bookid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�鼮ID',
  `chapterid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�½�ID',
  `content` varchar(255) DEFAULT '' COMMENT '��������',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ʱ��',
  `is_show` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '�Ƿ�չʾ',
  PRIMARY KEY (`id`),
  KEY `ub` (`uid`,`bookid`),
  KEY `bookid` (`bookid`,`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extend`
--

DROP TABLE IF EXISTS `extend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ex_name` varchar(30) NOT NULL COMMENT '����/����',
  `ex_url` varchar(255) NOT NULL DEFAULT '' COMMENT '�ƹ�����',
  `s_url` varchar(30) NOT NULL DEFAULT '' COMMENT '������',
  `crc_url` int(11) NOT NULL DEFAULT '0' COMMENT '����url',
  `channelid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ID',
  `book_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'bookID',
  `follow_order` smallint(5) unsigned NOT NULL DEFAULT '10' COMMENT '��ע�½�',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  PRIMARY KEY (`id`),
  KEY `channleid` (`channelid`,`create_time`),
  KEY `hash_url` (`crc_url`,`s_url`),
  KEY `bookid` (`book_id`),
  KEY `ex_name` (`ex_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ƹ�';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extend`
--

LOCK TABLES `extend` WRITE;
/*!40000 ALTER TABLE `extend` DISABLE KEYS */;
/*!40000 ALTER TABLE `extend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extend_res`
--

DROP TABLE IF EXISTS `extend_res`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extend_res` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `exid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�ƹ�����ID',
  `click` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�����',
  `refill` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '��ֵ',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�����ֵʱ��',
  PRIMARY KEY (`id`),
  UNIQUE KEY `exid` (`exid`),
  KEY `click` (`click`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ƹ�Ч��';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extend_res`
--

LOCK TABLES `extend_res` WRITE;
/*!40000 ALTER TABLE `extend_res` DISABLE KEYS */;
/*!40000 ALTER TABLE `extend_res` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_log`
--

DROP TABLE IF EXISTS `pay_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_log` (
  `payid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�û�id',
  `bookid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�鼮ID',
  `money` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '���',
  `is_pay` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '�Ƿ�֧��',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `channelid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����id',
  PRIMARY KEY (`payid`),
  KEY `umb` (`uid`,`money`,`bookid`),
  KEY `cu` (`uid`,`channelid`),
  KEY `cc` (`channelid`,`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ֵ��¼';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_log`
--

LOCK TABLES `pay_log` WRITE;
/*!40000 ALTER TABLE `pay_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `power`
--

DROP TABLE IF EXISTS `power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `power` (
  `powerid` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Ȩ��id',
  `power_name` varchar(20) NOT NULL COMMENT 'Ȩ������',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '���ʱ��',
  PRIMARY KEY (`powerid`),
  KEY `power_name` (`power_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `power`
--

LOCK TABLES `power` WRITE;
/*!40000 ALTER TABLE `power` DISABLE KEYS */;
/*!40000 ALTER TABLE `power` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `power_rose`
--

DROP TABLE IF EXISTS `power_rose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `power_rose` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `roseid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '��ɫID',
  `powerid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Ȩ��ID',
  PRIMARY KEY (`id`),
  KEY `rid` (`roseid`,`powerid`),
  KEY `power_id` (`powerid`,`roseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `power_rose`
--

LOCK TABLES `power_rose` WRITE;
/*!40000 ALTER TABLE `power_rose` DISABLE KEYS */;
/*!40000 ALTER TABLE `power_rose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `read_log`
--

DROP TABLE IF EXISTS `read_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `read_log` (
  `logid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�û�id',
  `bookid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�鼮ID',
  `chapterid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�½�id',
  `rtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�Ķ�ʱ��',
  PRIMARY KEY (`logid`),
  KEY `all` (`uid`,`bookid`,`chapterid`,`rtime`),
  KEY `ur` (`uid`,`rtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�Ķ���¼';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `read_log`
--

LOCK TABLES `read_log` WRITE;
/*!40000 ALTER TABLE `read_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `read_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rose`
--

DROP TABLE IF EXISTS `rose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rose` (
  `roseid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `rose_name` varchar(10) NOT NULL DEFAULT '' COMMENT '��ɫ����',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `by_user` varchar(20) NOT NULL DEFAULT '' COMMENT '������',
  PRIMARY KEY (`roseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rose`
--

LOCK TABLES `rose` WRITE;
/*!40000 ALTER TABLE `rose` DISABLE KEYS */;
/*!40000 ALTER TABLE `rose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rose`
--

DROP TABLE IF EXISTS `user_rose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_rose` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `rid` smallint(5) unsigned NOT NULL COMMENT '��ɫID',
  `userid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�û�ID',
  `byuser` varchar(20) NOT NULL DEFAULT 'admin' COMMENT '������',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  PRIMARY KEY (`id`),
  KEY `r_u` (`userid`),
  KEY `rid` (`rid`,`userid`),
  KEY `uid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rose`
--

LOCK TABLES `user_rose` WRITE;
/*!40000 ALTER TABLE `user_rose` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_rose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nick` varchar(30) NOT NULL DEFAULT '' COMMENT '�ǳ�',
  `openid` char(32) NOT NULL DEFAULT '' COMMENT 'openID',
  `password` varchar(40) NOT NULL DEFAULT '' COMMENT '����',
  `hash_pwd` char(32) NOT NULL DEFAULT '' COMMENT '��������',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `channelid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ID',
  `channelname` varchar(20) NOT NULL DEFAULT '' COMMENT '��������',
  `is_flow` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '�Ƿ��ע',
  `phone` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�ֻ���',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `openid` (`openid`,`channelid`),
  KEY `nick` (`nick`),
  KEY `ctime` (`addtime`,`channelid`),
  KEY `channel` (`channelid`),
  KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�û�';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2018-05-14 17:59:05
