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
  `channelid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '渠道ID',
  `money` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '结算金额',
  `is_account` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否结算',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '时间',
  `proportion` decimal(3,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '比例',
  PRIMARY KEY (`id`),
  KEY `channelid` (`channelid`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='结算';
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
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `uname` varchar(30) NOT NULL DEFAULT '',
  `password` varchar(20) NOT NULL DEFAULT '',
  `hashpd` char(32) NOT NULL DEFAULT '',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `address` varchar(30) NOT NULL DEFAULT '',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`uid`),
  KEY `name` (`uname`,`hashpd`),
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
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `bookid` int(10) unsigned NOT NULL COMMENT '书籍ID',
  `money` int(10) unsigned NOT NULL COMMENT '打赏书币',
  `create_time` int(10) unsigned NOT NULL COMMENT '时间',
  `type` enum('打赏','催更') NOT NULL DEFAULT '打赏' COMMENT '类型',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`create_time`),
  KEY `bookid` (`bookid`,`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='催更，打赏';
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
  `channelid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '渠道ID',
  `time` int(10) unsigned NOT NULL COMMENT '0',
  `is_balance` enum('已结算','待结算') NOT NULL DEFAULT '待结算' COMMENT '是否结算',
  `money` decimal(6,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '结算金额',
  PRIMARY KEY (`id`),
  KEY `tc` (`channelid`,`time`),
  KEY `channel` (`channelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='渠道结算';
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
  `book_name` varchar(20) NOT NULL DEFAULT '' COMMENT '书名',
  `balance_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '推广数',
  PRIMARY KEY (`id`),
  KEY `bc` (`book_id`,`balance_count`),
  KEY `count` (`balance_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推广情况表';
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
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `bookid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '书籍ID',
  `chapterid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '章节ID',
  `rtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '阅读时间',
  PRIMARY KEY (`id`),
  KEY `ubr` (`uid`,`bookid`,`rtime`),
  KEY `ur` (`uid`,`rtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='书签';
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
  `read_user` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '阅读人数',
  `sale_count` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '总销售额',
  `book_name` varchar(20) NOT NULL DEFAULT '' COMMENT '书名',
  PRIMARY KEY (`id`),
  KEY `bid` (`bookid`,`sale_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售情况表';
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
  `tp_name` varchar(20) NOT NULL DEFAULT '' COMMENT '分类名称',
  `pid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '父分类ID',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`type_id`),
  KEY `pid` (`pid`,`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='类别表';
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
  `bookname` varchar(20) NOT NULL DEFAULT '' COMMENT '小说名称',
  `author` varchar(20) NOT NULL DEFAULT '' COMMENT '作者',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态（0：已完本；1：连载中；2：太监）',
  `sale_type` enum('1','0') NOT NULL DEFAULT '1' COMMENT '销售类型（0：整本出售；1：章节出售）',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`bookid`),
  KEY `bname` (`bookname`),
  KEY `author` (`author`),
  KEY `ctime` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='电子书';
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
  `channelid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '渠道ID',
  `channelname` varchar(30) NOT NULL DEFAULT '' COMMENT '渠道名称',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `proportion` decimal(3,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '分成',
  `readcount` smallint(5) unsigned NOT NULL DEFAULT '10' COMMENT '引导关注的阅读数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `type` varchar(5) NOT NULL DEFAULT '' COMMENT '类型',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父渠道ID',
  `one` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '冗余字段1',
  `two` varchar(30) NOT NULL DEFAULT '' COMMENT '冗余字段1',
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
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `channelid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '渠道ID',
  `login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT 'IP地址',
  PRIMARY KEY (`id`),
  KEY `uil` (`uid`,`ip`,`login_time`),
  KEY `uli` (`uid`,`login_time`,`ip`,`channelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='渠道登录记录';
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
  `chapterid` int(10) unsigned NOT NULL COMMENT '章节数',
  `content` mediumtext NOT NULL COMMENT '内容',
  `chapter_name` varchar(30) NOT NULL DEFAULT '' COMMENT '章节名称',
  `bookid` int(10) unsigned DEFAULT NULL COMMENT 'BOOKID',
  `book_name` varchar(20) NOT NULL DEFAULT '' COMMENT '书名',
  `price` smallint(5) unsigned DEFAULT '0' COMMENT '售价',
  `size` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '字符数',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '状态(0：不可读；1：可读)',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '时间',
  PRIMARY KEY (`id`),
  KEY `chapterid` (`chapterid`),
  KEY `bookid` (`bookid`),
  KEY `bname` (`book_name`),
  KEY `size` (`size`),
  KEY `ctime` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='章节内容';
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
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `bookid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '书籍ID',
  `chapterid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '章节ID',
  `content` varchar(255) DEFAULT '' COMMENT '评论内容',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '时间',
  `is_show` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否展示',
  PRIMARY KEY (`id`),
  KEY `ub` (`uid`,`bookid`),
  KEY `bookid` (`bookid`,`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论';
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
  `ex_name` varchar(30) NOT NULL COMMENT '名称/标题',
  `ex_url` varchar(255) NOT NULL DEFAULT '' COMMENT '推广链接',
  `s_url` varchar(30) NOT NULL DEFAULT '' COMMENT '短链接',
  `crc_url` int(11) NOT NULL DEFAULT '0' COMMENT '加密url',
  `channelid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '渠道ID',
  `book_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'bookID',
  `follow_order` smallint(5) unsigned NOT NULL DEFAULT '10' COMMENT '关注章节',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `channleid` (`channelid`,`create_time`),
  KEY `hash_url` (`crc_url`,`s_url`),
  KEY `bookid` (`book_id`),
  KEY `ex_name` (`ex_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推广';
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
  `exid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '推广链接ID',
  `click` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `refill` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '充值',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最近充值时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `exid` (`exid`),
  KEY `click` (`click`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推广效益';
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
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `bookid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '书籍ID',
  `money` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '金额',
  `is_pay` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否支付',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `channelid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '渠道id',
  PRIMARY KEY (`payid`),
  KEY `umb` (`uid`,`money`,`bookid`),
  KEY `cu` (`uid`,`channelid`),
  KEY `cc` (`channelid`,`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值记录';
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
  `powerid` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `power_name` varchar(20) NOT NULL COMMENT '权限名称',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
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
  `roseid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '角色ID',
  `powerid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '权限ID',
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
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `bookid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '书籍ID',
  `chapterid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '章节id',
  `rtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '阅读时间',
  PRIMARY KEY (`logid`),
  KEY `all` (`uid`,`bookid`,`chapterid`,`rtime`),
  KEY `ur` (`uid`,`rtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='阅读记录';
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
  `rose_name` varchar(10) NOT NULL DEFAULT '' COMMENT '角色名称',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `by_user` varchar(20) NOT NULL DEFAULT '' COMMENT '创建人',
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
  `rid` smallint(5) unsigned NOT NULL COMMENT '角色ID',
  `userid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `byuser` varchar(20) NOT NULL DEFAULT 'admin' COMMENT '操作人',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
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
  `nick` varchar(30) NOT NULL DEFAULT '' COMMENT '昵称',
  `openid` char(32) NOT NULL DEFAULT '' COMMENT 'openID',
  `password` varchar(40) NOT NULL DEFAULT '' COMMENT '密码',
  `hash_pwd` char(32) NOT NULL DEFAULT '' COMMENT '加密密码',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `channelid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '渠道ID',
  `channelname` varchar(20) NOT NULL DEFAULT '' COMMENT '渠道名称',
  `is_flow` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否关注',
  `phone` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '手机号',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `openid` (`openid`,`channelid`),
  KEY `nick` (`nick`),
  KEY `ctime` (`addtime`,`channelid`),
  KEY `channel` (`channelid`),
  KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户';
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
