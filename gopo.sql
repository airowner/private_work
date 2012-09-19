-- MySQL dump 10.13  Distrib 5.5.27, for Linux (x86_64)
--
-- Host: localhost    Database: gopo
-- ------------------------------------------------------
-- Server version	5.5.27-log

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
-- Table structure for table `cdb_access`
--

DROP TABLE IF EXISTS `cdb_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_access` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `allowview` tinyint(1) NOT NULL DEFAULT '0',
  `allowpost` tinyint(1) NOT NULL DEFAULT '0',
  `allowreply` tinyint(1) NOT NULL DEFAULT '0',
  `allowgetattach` tinyint(1) NOT NULL DEFAULT '0',
  `allowpostattach` tinyint(1) NOT NULL DEFAULT '0',
  `adminuser` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`fid`),
  KEY `listorder` (`fid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_access`
--

LOCK TABLES `cdb_access` WRITE;
/*!40000 ALTER TABLE `cdb_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_activities`
--

DROP TABLE IF EXISTS `cdb_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_activities` (
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cost` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `starttimefrom` int(10) unsigned NOT NULL DEFAULT '0',
  `starttimeto` int(10) unsigned NOT NULL DEFAULT '0',
  `place` char(40) NOT NULL DEFAULT '',
  `class` char(20) NOT NULL DEFAULT '',
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `uid` (`uid`,`starttimefrom`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_activities`
--

LOCK TABLES `cdb_activities` WRITE;
/*!40000 ALTER TABLE `cdb_activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_activityapplies`
--

DROP TABLE IF EXISTS `cdb_activityapplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_activityapplies` (
  `applyid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` char(200) NOT NULL DEFAULT '',
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `payment` mediumint(8) NOT NULL DEFAULT '0',
  `contact` char(200) NOT NULL,
  PRIMARY KEY (`applyid`),
  KEY `uid` (`uid`),
  KEY `tid` (`tid`),
  KEY `dateline` (`tid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_activityapplies`
--

LOCK TABLES `cdb_activityapplies` WRITE;
/*!40000 ALTER TABLE `cdb_activityapplies` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_activityapplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_addons`
--

DROP TABLE IF EXISTS `cdb_addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_addons` (
  `key` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `sitename` varchar(255) NOT NULL DEFAULT '',
  `siteurl` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_addons`
--

LOCK TABLES `cdb_addons` WRITE;
/*!40000 ALTER TABLE `cdb_addons` DISABLE KEYS */;
INSERT INTO `cdb_addons` VALUES ('25z5wh0o00','Comsenz','Comsenz','http://www.comsenz.com','Comsenz官方网站推荐的论坛模板与插件','ts@comsenz.com','http://www.comsenz.com/addon/logo.gif',1),('R051uc9D1i','DPS','DPS','http://bbs.7dps.com','提供 Discuz! 插件与风格，享受一键安装/升级/卸载带来的快感，还提供少量风格。','http://bbs.7dps.com/thread-1646-1-1.html','http://api.7dps.com/addons/logo.gif',0);
/*!40000 ALTER TABLE `cdb_addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_adminactions`
--

DROP TABLE IF EXISTS `cdb_adminactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_adminactions` (
  `admingid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `disabledactions` text NOT NULL,
  PRIMARY KEY (`admingid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_adminactions`
--

LOCK TABLES `cdb_adminactions` WRITE;
/*!40000 ALTER TABLE `cdb_adminactions` DISABLE KEYS */;
INSERT INTO `cdb_adminactions` VALUES (18,'a:1:{i:0;s:9:\"_readonly\";}');
/*!40000 ALTER TABLE `cdb_adminactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_admincustom`
--

DROP TABLE IF EXISTS `cdb_admincustom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_admincustom` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `sort` tinyint(1) NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL,
  `clicks` smallint(6) unsigned NOT NULL DEFAULT '1',
  `uid` mediumint(8) unsigned NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_admincustom`
--

LOCK TABLES `cdb_admincustom` WRITE;
/*!40000 ALTER TABLE `cdb_admincustom` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_admincustom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_admingroups`
--

DROP TABLE IF EXISTS `cdb_admingroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_admingroups` (
  `admingid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `alloweditpost` tinyint(1) NOT NULL DEFAULT '0',
  `alloweditpoll` tinyint(1) NOT NULL DEFAULT '0',
  `allowstickthread` tinyint(1) NOT NULL DEFAULT '0',
  `allowmodpost` tinyint(1) NOT NULL DEFAULT '0',
  `allowdelpost` tinyint(1) NOT NULL DEFAULT '0',
  `allowmassprune` tinyint(1) NOT NULL DEFAULT '0',
  `allowrefund` tinyint(1) NOT NULL DEFAULT '0',
  `allowcensorword` tinyint(1) NOT NULL DEFAULT '0',
  `allowviewip` tinyint(1) NOT NULL DEFAULT '0',
  `allowbanip` tinyint(1) NOT NULL DEFAULT '0',
  `allowedituser` tinyint(1) NOT NULL DEFAULT '0',
  `allowmoduser` tinyint(1) NOT NULL DEFAULT '0',
  `allowbanuser` tinyint(1) NOT NULL DEFAULT '0',
  `allowpostannounce` tinyint(1) NOT NULL DEFAULT '0',
  `allowviewlog` tinyint(1) NOT NULL DEFAULT '0',
  `allowbanpost` tinyint(1) NOT NULL DEFAULT '0',
  `disablepostctrl` tinyint(1) NOT NULL DEFAULT '0',
  `supe_allowpushthread` tinyint(1) NOT NULL DEFAULT '0',
  `allowhighlightthread` tinyint(1) NOT NULL DEFAULT '0',
  `allowdigestthread` tinyint(1) NOT NULL DEFAULT '0',
  `allowrecommendthread` tinyint(1) NOT NULL DEFAULT '0',
  `allowbumpthread` tinyint(1) NOT NULL DEFAULT '0',
  `allowclosethread` tinyint(1) NOT NULL DEFAULT '0',
  `allowmovethread` tinyint(1) NOT NULL DEFAULT '0',
  `allowedittypethread` tinyint(1) NOT NULL DEFAULT '0',
  `allowstampthread` tinyint(1) NOT NULL DEFAULT '0',
  `allowcopythread` tinyint(1) NOT NULL DEFAULT '0',
  `allowmergethread` tinyint(1) NOT NULL DEFAULT '0',
  `allowsplitthread` tinyint(1) NOT NULL DEFAULT '0',
  `allowrepairthread` tinyint(1) NOT NULL DEFAULT '0',
  `allowwarnpost` tinyint(1) NOT NULL DEFAULT '0',
  `allowviewreport` tinyint(1) NOT NULL DEFAULT '0',
  `alloweditforum` tinyint(1) NOT NULL DEFAULT '0',
  `allowremovereward` tinyint(1) NOT NULL DEFAULT '0',
  `allowedittrade` tinyint(1) NOT NULL DEFAULT '0',
  `alloweditactivity` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`admingid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_admingroups`
--

LOCK TABLES `cdb_admingroups` WRITE;
/*!40000 ALTER TABLE `cdb_admingroups` DISABLE KEYS */;
INSERT INTO `cdb_admingroups` VALUES (1,1,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(2,1,0,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0),(3,1,0,1,1,1,0,0,0,1,0,0,1,1,0,1,1,1,0,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0),(16,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,1,1,1,1,0,0,1,0,0,0,0,1,1,0,0,0,0),(17,1,0,2,1,0,0,1,0,1,0,0,0,0,1,1,1,1,0,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0),(18,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(19,0,0,0,1,0,0,0,0,1,1,0,1,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `cdb_admingroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_adminnotes`
--

DROP TABLE IF EXISTS `cdb_adminnotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_adminnotes` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `admin` varchar(15) NOT NULL DEFAULT '',
  `access` tinyint(3) NOT NULL DEFAULT '0',
  `adminid` tinyint(3) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_adminnotes`
--

LOCK TABLES `cdb_adminnotes` WRITE;
/*!40000 ALTER TABLE `cdb_adminnotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_adminnotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_adminsessions`
--

DROP TABLE IF EXISTS `cdb_adminsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_adminsessions` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `adminid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `panel` tinyint(1) NOT NULL DEFAULT '0',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `errorcount` tinyint(1) NOT NULL DEFAULT '0',
  `storage` mediumtext NOT NULL,
  PRIMARY KEY (`uid`,`panel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_adminsessions`
--

LOCK TABLES `cdb_adminsessions` WRITE;
/*!40000 ALTER TABLE `cdb_adminsessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_adminsessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_advertisements`
--

DROP TABLE IF EXISTS `cdb_advertisements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_advertisements` (
  `advid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `targets` text NOT NULL,
  `parameters` text NOT NULL,
  `code` text NOT NULL,
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`advid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_advertisements`
--

LOCK TABLES `cdb_advertisements` WRITE;
/*!40000 ALTER TABLE `cdb_advertisements` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_advertisements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_announcements`
--

DROP TABLE IF EXISTS `cdb_announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_announcements` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `author` varchar(15) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `groups` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `timespan` (`starttime`,`endtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_announcements`
--

LOCK TABLES `cdb_announcements` WRITE;
/*!40000 ALTER TABLE `cdb_announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_attachmentfields`
--

DROP TABLE IF EXISTS `cdb_attachmentfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_attachmentfields` (
  `aid` mediumint(8) unsigned NOT NULL,
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `tid` (`tid`),
  KEY `pid` (`pid`,`aid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_attachmentfields`
--

LOCK TABLES `cdb_attachmentfields` WRITE;
/*!40000 ALTER TABLE `cdb_attachmentfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_attachmentfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_attachments`
--

DROP TABLE IF EXISTS `cdb_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_attachments` (
  `aid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `width` smallint(6) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `readperm` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `price` smallint(6) unsigned NOT NULL DEFAULT '0',
  `filename` char(100) NOT NULL DEFAULT '',
  `filetype` char(50) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment` char(100) NOT NULL DEFAULT '',
  `downloads` mediumint(8) NOT NULL DEFAULT '0',
  `isimage` tinyint(1) NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `thumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `remote` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  KEY `tid` (`tid`),
  KEY `pid` (`pid`,`aid`),
  KEY `uid` (`uid`),
  KEY `dateline` (`dateline`,`isimage`,`downloads`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_attachments`
--

LOCK TABLES `cdb_attachments` WRITE;
/*!40000 ALTER TABLE `cdb_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_attachpaymentlog`
--

DROP TABLE IF EXISTS `cdb_attachpaymentlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_attachpaymentlog` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `aid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `amount` int(10) unsigned NOT NULL DEFAULT '0',
  `netamount` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`,`uid`),
  KEY `uid` (`uid`),
  KEY `authorid` (`authorid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_attachpaymentlog`
--

LOCK TABLES `cdb_attachpaymentlog` WRITE;
/*!40000 ALTER TABLE `cdb_attachpaymentlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_attachpaymentlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_attachtypes`
--

DROP TABLE IF EXISTS `cdb_attachtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_attachtypes` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `extension` char(12) NOT NULL DEFAULT '',
  `maxsize` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_attachtypes`
--

LOCK TABLES `cdb_attachtypes` WRITE;
/*!40000 ALTER TABLE `cdb_attachtypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_attachtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_banned`
--

DROP TABLE IF EXISTS `cdb_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_banned` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `ip1` smallint(3) NOT NULL DEFAULT '0',
  `ip2` smallint(3) NOT NULL DEFAULT '0',
  `ip3` smallint(3) NOT NULL DEFAULT '0',
  `ip4` smallint(3) NOT NULL DEFAULT '0',
  `admin` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_banned`
--

LOCK TABLES `cdb_banned` WRITE;
/*!40000 ALTER TABLE `cdb_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_banned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_bbcodes`
--

DROP TABLE IF EXISTS `cdb_bbcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_bbcodes` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `tag` varchar(100) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL,
  `replacement` text NOT NULL,
  `example` varchar(255) NOT NULL DEFAULT '',
  `explanation` text NOT NULL,
  `params` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `prompt` text NOT NULL,
  `nest` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_bbcodes`
--

LOCK TABLES `cdb_bbcodes` WRITE;
/*!40000 ALTER TABLE `cdb_bbcodes` DISABLE KEYS */;
INSERT INTO `cdb_bbcodes` VALUES (1,0,'fly','bb_fly.gif','<marquee width=\"90%\" behavior=\"alternate\" scrollamount=\"3\">{1}</marquee>','[fly]This is sample text[/fly]','使内容横向滚动，这个效果类似 HTML 的 marquee 标签，注意：这个效果只在 Internet Explorer 浏览器下有效。',1,'请输入滚动显示的文字:',1,19),(2,1,'qq','bb_qq.gif','<a href=\"http://wpa.qq.com/msgrd?V=1&Uin={1}&amp;Site=[Discuz!]&amp;Menu=yes\" target=\"_blank\"><img src=\"http://wpa.qq.com/pa?p=1:{1}:1\" border=\"0\"></a>','[qq]688888[/qq]','显示 QQ 在线状态，点这个图标可以和他（她）聊天',1,'请输入显示在线状态 QQ 号码:',1,21),(3,0,'sup','bb_sup.gif','<sup>{1}</sup>','X[sup]2[/sup]','上标',1,'请输入上标文字：',1,22),(4,0,'sub','bb_sub.gif','<sub>{1}</sub>','X[sub]2[/sub]','下标',1,'请输入下标文字：',1,23);
/*!40000 ALTER TABLE `cdb_bbcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_caches`
--

DROP TABLE IF EXISTS `cdb_caches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_caches` (
  `cachename` varchar(32) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  `expiration` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`cachename`),
  KEY `expiration` (`type`,`expiration`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_caches`
--

LOCK TABLES `cdb_caches` WRITE;
/*!40000 ALTER TABLE `cdb_caches` DISABLE KEYS */;
INSERT INTO `cdb_caches` VALUES ('settings',1,1333532446,0,'$_DCACHE[\'settings\'] = array (\n  \'accessemail\' => \'\',\n  \'activitytype\' => \'朋友聚会\r\n出外郊游\r\n自驾出行\r\n公益活动\r\n线上活动\',\n  \'adminipaccess\' => \'\',\n  \'admode\' => \'1\',\n  \'archiverstatus\' => \'1\',\n  \'attachbanperiods\' => \'\',\n  \'attachdir\' => \'/srv/http/uc/bbs/./attachments\',\n  \'attachexpire\' => \'\',\n  \'attachimgpost\' => \'1\',\n  \'attachrefcheck\' => \'0\',\n  \'attachsave\' => \'3\',\n  \'attachurl\' => \'attachments\',\n  \'authkey\' => \'37d61cioNMHjs29A\',\n  \'authoronleft\' => \'0\',\n  \'avatarmethod\' => \'0\',\n  \'baidusitemap\' => \'1\',\n  \'baidusitemap_life\' => \'12\',\n  \'bannedmessages\' => \'1\',\n  \'bbclosed\' => \'\',\n  \'bbname\' => \'Discuz! Board\',\n  \'bdaystatus\' => \'0\',\n  \'boardlicensed\' => \'0\',\n  \'cacheindexlife\' => \'0\',\n  \'cachethreaddir\' => \'forumdata/threadcaches\',\n  \'cachethreadlife\' => \'0\',\n  \'censoremail\' => \'\',\n  \'censoruser\' => \'\',\n  \'creditnotice\' => \'1\',\n  \'creditsformula\' => \'$member[\\\'extcredits1\\\']\',\n  \'creditsformulaexp\' => \'\',\n  \'creditspolicy\' => \n  array (\n    \'post\' => \n    array (\n    ),\n    \'reply\' => \n    array (\n    ),\n    \'digest\' => \n    array (\n      1 => 10,\n    ),\n    \'postattach\' => \n    array (\n    ),\n    \'getattach\' => \n    array (\n    ),\n    \'sendpm\' => \n    array (\n    ),\n    \'search\' => \n    array (\n    ),\n    \'promotion_visit\' => \n    array (\n    ),\n    \'promotion_register\' => \n    array (\n    ),\n    \'tradefinished\' => \n    array (\n    ),\n    \'votepoll\' => \n    array (\n    ),\n    \'lowerlimit\' => \n    array (\n    ),\n  ),\n  \'creditstax\' => \'0.2\',\n  \'creditstrans\' => \'2\',\n  \'dateconvert\' => \'1\',\n  \'dateformat\' => \'Y-n-j\',\n  \'debug\' => \'1\',\n  \'delayviewcount\' => \'0\',\n  \'deletereason\' => \'\',\n  \'disallowfloat\' => \'newthread|reply\',\n  \'doublee\' => \'1\',\n  \'dupkarmarate\' => \'0\',\n  \'dzfeed_limit\' => \n  array (\n    \'thread_replies\' => \n    array (\n      0 => \'100\',\n      1 => \'1000\',\n      2 => \'2000\',\n      3 => \'10000\',\n    ),\n    \'thread_views\' => \n    array (\n      0 => \'500\',\n      1 => \'5000\',\n      2 => \'10000\',\n    ),\n    \'thread_rate\' => \n    array (\n      0 => \'50\',\n      1 => \'200\',\n      2 => \'500\',\n    ),\n    \'post_rate\' => \n    array (\n      0 => \'20\',\n      1 => \'100\',\n      2 => \'300\',\n    ),\n    \'user_usergroup\' => \n    array (\n      0 => \'12\',\n      1 => \'13\',\n      2 => \'14\',\n      3 => \'15\',\n    ),\n    \'user_credit\' => \n    array (\n      0 => \'1000\',\n      1 => \'10000\',\n      2 => \'100000\',\n    ),\n    \'user_threads\' => \n    array (\n      0 => \'100\',\n      1 => \'500\',\n      2 => \'1000\',\n      3 => \'5000\',\n      4 => \'10000\',\n    ),\n    \'user_posts\' => \n    array (\n      0 => \'500\',\n      1 => \'1000\',\n      2 => \'5000\',\n      3 => \'10000\',\n    ),\n    \'user_digest\' => \n    array (\n      0 => \'50\',\n      1 => \'100\',\n      2 => \'500\',\n      3 => \'1000\',\n    ),\n  ),\n  \'ec_account\' => \'\',\n  \'ec_credit\' => \n  array (\n    \'maxcreditspermonth\' => 6,\n    \'rank\' => \n    array (\n      1 => 4,\n      2 => 11,\n      3 => 41,\n      4 => 91,\n      5 => 151,\n      6 => 251,\n      7 => 501,\n      8 => 1001,\n      9 => 2001,\n      10 => 5001,\n      11 => 10001,\n      12 => 20001,\n      13 => 50001,\n      14 => 100001,\n      15 => 200001,\n    ),\n  ),\n  \'ec_maxcredits\' => \'1000\',\n  \'ec_maxcreditspermonth\' => \'0\',\n  \'ec_mincredits\' => \'0\',\n  \'ec_ratio\' => \'0\',\n  \'ec_tenpay_bargainor\' => \'\',\n  \'ec_tenpay_key\' => \'\',\n  \'editedby\' => \'1\',\n  \'editoroptions\' => \'1\',\n  \'edittimelimit\' => \'\',\n  \'exchangemincredits\' => \'100\',\n  \'extcredits\' => \n  array (\n    1 => \n    array (\n      \'title\' => \'威望\',\n      \'showinthread\' => \'\',\n      \'img\' => \'\',\n    ),\n    2 => \n    array (\n      \'title\' => \'金钱\',\n      \'showinthread\' => \'\',\n      \'img\' => \'\',\n    ),\n  ),\n  \'fastpost\' => \'1\',\n  \'floodctrl\' => \'15\',\n  \'forumjump\' => \'0\',\n  \'forumlinkstatus\' => \'1\',\n  \'frameon\' => \'0\',\n  \'framewidth\' => \'180\',\n  \'ftp\' => \n  array (\n    \'on\' => \'0\',\n    \'ssl\' => \'0\',\n    \'host\' => \'\',\n    \'port\' => \'21\',\n    \'username\' => \'\',\n    \'password\' => \'\',\n    \'attachdir\' => \'.\',\n    \'attachurl\' => \'\',\n    \'hideurl\' => \'0\',\n    \'timeout\' => \'0\',\n    \'connid\' => 0,\n  ),\n  \'globalstick\' => \'1\',\n  \'google\' => \'1\',\n  \'gzipcompress\' => \'0\',\n  \'heatthread\' => \n  array (\n    \'reply\' => 5,\n    \'recommend\' => 3,\n    \'hottopic\' => \'50,100,200\',\n    \'iconlevels\' => \n    array (\n    ),\n  ),\n  \'hideprivate\' => \'1\',\n  \'historyposts\' => \'1	1\',\n  \'hottopic\' => \'10\',\n  \'icp\' => \'\',\n  \'imagelib\' => \'0\',\n  \'indexhot\' => false,\n  \'indexname\' => \'index.php\',\n  \'indextype\' => \'classics\',\n  \'infosidestatus\' => false,\n  \'initcredits\' => \'0,0,0,0,0,0,0,0,0\',\n  \'ipaccess\' => \'\',\n  \'jscachelife\' => \'1800\',\n  \'jsdateformat\' => \'\',\n  \'jspath\' => \'forumdata/cache/\',\n  \'jsrefdomains\' => \'\',\n  \'jsstatus\' => \'0\',\n  \'karmaratelimit\' => \'0\',\n  \'loadctrl\' => \'0\',\n  \'losslessdel\' => \'365\',\n  \'magicdiscount\' => \'85\',\n  \'magicmarket\' => \'1\',\n  \'magicstatus\' => \'1\',\n  \'mail\' => \'a:10:{s:8:\"mailsend\";s:1:\"1\";s:6:\"server\";s:13:\"smtp.21cn.com\";s:4:\"port\";s:2:\"25\";s:4:\"auth\";s:1:\"1\";s:4:\"from\";s:26:\"Discuz <username@21cn.com>\";s:13:\"auth_username\";s:17:\"username@21cn.com\";s:13:\"auth_password\";s:8:\"password\";s:13:\"maildelimiter\";s:1:\"0\";s:12:\"mailusername\";s:1:\"1\";s:15:\"sendmail_silent\";s:1:\"1\";}\',\n  \'maxavatarpixel\' => \'120\',\n  \'maxavatarsize\' => \'20000\',\n  \'maxbdays\' => \'0\',\n  \'maxchargespan\' => \'0\',\n  \'maxfavorites\' => \'100\',\n  \'maxincperthread\' => \'0\',\n  \'maxmagicprice\' => \'50\',\n  \'maxmodworksmonths\' => \'3\',\n  \'maxonlinelist\' => \'0\',\n  \'maxpolloptions\' => \'10\',\n  \'maxpostsize\' => \'10000\',\n  \'maxsearchresults\' => \'500\',\n  \'maxsigrows\' => \'100\',\n  \'maxsmilies\' => \'10\',\n  \'maxspm\' => \'0\',\n  \'membermaxpages\' => \'100\',\n  \'memberperpage\' => \'25\',\n  \'memliststatus\' => \'1\',\n  \'minpostsize\' => \'10\',\n  \'moddisplay\' => \'flat\',\n  \'modratelimit\' => \'0\',\n  \'modworkstatus\' => \'1\',\n  \'msgforward\' => \'a:3:{s:11:\"refreshtime\";i:3;s:5:\"quick\";i:1;s:8:\"messages\";a:13:{i:0;s:19:\"thread_poll_succeed\";i:1;s:19:\"thread_rate_succeed\";i:2;s:23:\"usergroups_join_succeed\";i:3;s:23:\"usergroups_exit_succeed\";i:4;s:25:\"usergroups_update_succeed\";i:5;s:20:\"buddy_update_succeed\";i:6;s:17:\"post_edit_succeed\";i:7;s:18:\"post_reply_succeed\";i:8;s:24:\"post_edit_delete_succeed\";i:9;s:22:\"post_newthread_succeed\";i:10;s:13:\"admin_succeed\";i:11;s:17:\"pm_delete_succeed\";i:12;s:15:\"search_redirect\";}}\',\n  \'msn\' => \n  array (\n    \'on\' => 0,\n    \'domain\' => \'discuz.org\',\n  ),\n  \'newbiespan\' => \'0\',\n  \'newbietasks\' => \n  array (\n  ),\n  \'newbietaskupdate\' => \'\',\n  \'nocacheheaders\' => \'0\',\n  \'oltimespan\' => \'10\',\n  \'onlinehold\' => 900,\n  \'onlinerecord\' => \'1	1040034649\',\n  \'outextcredits\' => \n  array (\n    \'|\' => \n    array (\n      \'title\' => NULL,\n      \'unit\' => NULL,\n      \'ratiosrc\' => \n      array (\n        \'\' => NULL,\n      ),\n      \'ratiodesc\' => \n      array (\n        \'\' => NULL,\n      ),\n      \'creditsrc\' => \n      array (\n        \'\' => NULL,\n      ),\n    ),\n  ),\n  \'postbanperiods\' => \'\',\n  \'postmodperiods\' => \'\',\n  \'postperpage\' => \'10\',\n  \'pvfrequence\' => \'60\',\n  \'pwdsafety\' => \'\',\n  \'qihoo\' => \n  array (\n  ),\n  \'ratelogrecord\' => \'5\',\n  \'recommendthread\' => \n  array (\n    \'allow\' => 0,\n  ),\n  \'regctrl\' => \'0\',\n  \'regfloodctrl\' => \'0\',\n  \'reglinkname\' => \'注册\',\n  \'regname\' => \'register.php\',\n  \'regstatus\' => \'1\',\n  \'regverify\' => \'0\',\n  \'relatedtag\' => false,\n  \'reportpost\' => \'1\',\n  \'rewritecompatible\' => \'\',\n  \'rewritestatus\' => \'0\',\n  \'rssstatus\' => \'1\',\n  \'rssttl\' => \'60\',\n  \'runwizard\' => \'1\',\n  \'searchbanperiods\' => \'\',\n  \'searchctrl\' => \'30\',\n  \'seccodedata\' => \n  array (\n    \'minposts\' => \'\',\n    \'loginfailedcount\' => 0,\n    \'width\' => 150,\n    \'height\' => 60,\n    \'type\' => \'0\',\n    \'background\' => \'1\',\n    \'adulterate\' => \'1\',\n    \'ttf\' => \'0\',\n    \'angle\' => \'0\',\n    \'color\' => \'1\',\n    \'size\' => \'0\',\n    \'shadow\' => \'1\',\n    \'animator\' => \'0\',\n  ),\n  \'seccodestatus\' => \'0\',\n  \'seclevel\' => \'1\',\n  \'secqaa\' => \n  array (\n    \'status\' => \n    array (\n      1 => \'0\',\n      2 => \'0\',\n      3 => \'0\',\n    ),\n  ),\n  \'seodescription\' => \'\',\n  \'seohead\' => \'\',\n  \'seokeywords\' => \'\',\n  \'seotitle\' => \'\',\n  \'showemail\' => \'\',\n  \'showimages\' => \'1\',\n  \'showsettings\' => \'7\',\n  \'sigviewcond\' => \'0\',\n  \'sitemessage\' => \n  array (\n    \'time\' => 0,\n    \'register\' => \'\',\n    \'login\' => \'\',\n    \'newthread\' => \'\',\n    \'reply\' => \'\',\n  ),\n  \'sitename\' => \'Comsenz Inc.\',\n  \'siteurl\' => \'http://www.comsenz.com/\',\n  \'smcols\' => \'8\',\n  \'smrows\' => \'5\',\n  \'smthumb\' => \'20\',\n  \'spacedata\' => \n  array (\n    \'cachelife\' => \'900\',\n    \'limitmythreads\' => \'5\',\n    \'limitmyreplies\' => \'5\',\n    \'limitmyrewards\' => \'5\',\n    \'limitmytrades\' => \'5\',\n    \'limitmyvideos\' => \'0\',\n    \'limitmyblogs\' => \'8\',\n    \'limitmyfriends\' => \'0\',\n    \'limitmyfavforums\' => \'5\',\n    \'limitmyfavthreads\' => \'0\',\n    \'textlength\' => \'300\',\n  ),\n  \'spacestatus\' => \'1\',\n  \'starthreshold\' => \'2\',\n  \'statcode\' => \'\',\n  \'statscachelife\' => \'180\',\n  \'statstatus\' => \'\',\n  \'styleid\' => \'1\',\n  \'stylejump\' => \'1\',\n  \'subforumsindex\' => \'\',\n  \'swfupload\' => \'1\',\n  \'tagstatus\' => \'1\',\n  \'taskon\' => \'0\',\n  \'threadmaxpages\' => \'1000\',\n  \'threadsticky\' => \n  array (\n    0 => \'全局置顶\',\n    1 => \'分类置顶\',\n    2 => \'本版置顶\',\n  ),\n  \'thumbheight\' => \'300\',\n  \'thumbquality\' => \'100\',\n  \'thumbstatus\' => \'0\',\n  \'thumbwidth\' => \'400\',\n  \'timeformat\' => \'H:i\',\n  \'timeoffset\' => \'8\',\n  \'topicperpage\' => \'20\',\n  \'tradetypes\' => \n  array (\n  ),\n  \'transfermincredits\' => \'1000\',\n  \'transsidstatus\' => \'0\',\n  \'uc\' => \n  array (\n    \'addfeed\' => 1,\n  ),\n  \'ucactivation\' => \'1\',\n  \'upgradeurl\' => \'http://localhost/develop/dzhead/develop/upgrade.php\',\n  \'userdateformat\' => \n  array (\n    0 => \'Y-n-j\',\n    1 => \'Y/n/j\',\n    2 => \'j-n-Y\',\n    3 => \'j/n/Y\',\n  ),\n  \'userstatusby\' => \'1\',\n  \'viewthreadtags\' => \'100\',\n  \'visitbanperiods\' => \'\',\n  \'visitedforums\' => \'10\',\n  \'vtonlinestatus\' => \'1\',\n  \'wapcharset\' => \'2\',\n  \'wapdateformat\' => \'n/j\',\n  \'wapmps\' => \'500\',\n  \'wapppp\' => \'5\',\n  \'wapregister\' => \'0\',\n  \'wapstatus\' => \'0\',\n  \'waptpp\' => \'10\',\n  \'warningexpiration\' => \'3\',\n  \'warninglimit\' => \'3\',\n  \'watermarkminheight\' => \'0\',\n  \'watermarkminwidth\' => \'0\',\n  \'watermarkquality\' => \'80\',\n  \'watermarkstatus\' => \'0\',\n  \'watermarktext\' => \n  array (\n  ),\n  \'watermarktrans\' => \'65\',\n  \'watermarktype\' => \'0\',\n  \'welcomemsgtitle\' => \'{username}，您好，感谢您的注册，请阅读以下内容。\',\n  \'whosonlinestatus\' => \'1\',\n  \'whosonline_contract\' => \'0\',\n  \'zoomstatus\' => \'1\',\n  \'ratelogon\' => \'0\',\n  \'forumseparator\' => \'1\',\n  \'allowattachurl\' => \'0\',\n  \'allowviewuserthread\' => \'\',\n  \'tasktypes\' => \'a:3:{s:9:\"promotion\";a:2:{s:4:\"name\";s:18:\"论坛推广任务\";s:7:\"version\";s:3:\"1.0\";}s:4:\"gift\";a:2:{s:4:\"name\";s:15:\"红包类任务\";s:7:\"version\";s:3:\"1.0\";}s:6:\"avatar\";a:2:{s:4:\"name\";s:15:\"头像类任务\";s:7:\"version\";s:3:\"1.0\";}}\',\n  \'version\' => \'7.2\',\n  \'totalmembers\' => \'1\',\n  \'lastmember\' => \'admin\',\n  \'cachethreadon\' => 0,\n  \'cronnextrun\' => \'1333536045\',\n  \'styles\' => \n  array (\n    1 => \'默认风格\',\n  ),\n  \'stylejumpstatus\' => false,\n  \'globaladvs\' => \n  array (\n  ),\n  \'redirectadvs\' => \n  array (\n  ),\n  \'invitecredit\' => \'\',\n  \'creditnames\' => \'1|威望|,2|金钱|\',\n  \'creditstransextra\' => \n  array (\n    1 => \'2\',\n    2 => \'2\',\n    3 => \'2\',\n    4 => \'2\',\n    5 => \'2\',\n  ),\n  \'exchangestatus\' => false,\n  \'transferstatus\' => true,\n  \'imagemaxwidth\' => NULL,\n  \'promptpmids\' => \n  array (\n    0 => \'4\',\n    1 => \'5\',\n    2 => \'6\',\n  ),\n  \'promptkeys\' => \n  array (\n    1 => \'pm\',\n    2 => \'announcepm\',\n    4 => \'systempm\',\n    5 => \'friend\',\n    6 => \'threads\',\n  ),\n  \'prompts\' => \n  array (\n    \'pm\' => \n    array (\n      \'name\' => \'私人消息\',\n      \'script\' => \'pm.php?filter=newpm\',\n      \'id\' => \'1\',\n      \'new\' => 0,\n    ),\n    \'announcepm\' => \n    array (\n      \'name\' => \'公共消息\',\n      \'script\' => \'pm.php?filter=announcepm\',\n      \'id\' => \'2\',\n      \'new\' => 0,\n    ),\n    \'systempm\' => \n    array (\n      \'name\' => \'系统消息\',\n      \'script\' => \'\',\n      \'id\' => \'4\',\n      \'new\' => 0,\n    ),\n    \'friend\' => \n    array (\n      \'name\' => \'好友消息\',\n      \'script\' => \'\',\n      \'id\' => \'5\',\n      \'new\' => 0,\n    ),\n    \'threads\' => \n    array (\n      \'name\' => \'帖子消息\',\n      \'script\' => \'\',\n      \'id\' => \'6\',\n      \'new\' => 0,\n    ),\n  ),\n  \'announcepm\' => \'0\',\n  \'specialicon\' => \n  array (\n  ),\n  \'threadplugins\' => \n  array (\n  ),\n  \'hookscript\' => \n  array (\n  ),\n  \'pluginlinks\' => \n  array (\n  ),\n  \'templatelangs\' => \n  array (\n  ),\n  \'pluginlangs\' => \n  array (\n  ),\n  \'plugins\' => \n  array (\n    \'available\' => \n    array (\n    ),\n  ),\n  \'my_status\' => 0,\n  \'tradeopen\' => 1,\n  \'hooks\' => \n  array (\n  ),\n  \'navmns\' => \n  array (\n    0 => \'index\',\n    1 => \'index\',\n    2 => \'search\',\n    3 => \'faq\',\n  ),\n  \'subnavs\' => \n  array (\n  ),\n  \'navs\' => \n  array (\n    1 => \n    array (\n      \'nav\' => \'<li class=\"menu_1\"><a href=\"index.php\" hidefocus=\"true\" id=\"mn_index\">论坛</a></li>\',\n      \'level\' => \'0\',\n    ),\n    2 => \n    array (\n      \'nav\' => \'<li class=\"menu_2\"><a href=\"search.php\" hidefocus=\"true\" id=\"mn_search\">搜索</a></li>\',\n      \'level\' => \'0\',\n    ),\n    3 => \n    array (\n      \'nav\' => \'\',\n      \'level\' => \'0\',\n    ),\n    4 => \n    array (\n      \'nav\' => \'<li class=\"menu_4\"><a href=\"faq.php\" hidefocus=\"true\" id=\"mn_faq\">帮助</a></li>\',\n      \'level\' => \'0\',\n    ),\n    5 => \n    array (\n      \'nav\' => \'<li class=\"menu_5\"><a href=\"misc.php?action=nav\" hidefocus=\"true\" onclick=\"showWindow(\\\'nav\\\', this.href);return false;\">导航</a></li>\',\n      \'level\' => \'0\',\n    ),\n  ),\n  \'allowsynlogin\' => 1,\n  \'ucappopen\' => \n  array (\n    \'UCHOME\' => 1,\n  ),\n  \'ucapp\' => \n  array (\n  ),\n  \'uchomeurl\' => \'http://www.gopo.com/home\',\n  \'homeshow\' => \'0\',\n  \'medalstatus\' => 0,\n  \'dlang\' => \n  array (\n    \'nextpage\' => \'下一页\',\n    \'date\' => \n    array (\n      0 => \'前\',\n      1 => \'天\',\n      2 => \'昨天\',\n      3 => \'前天\',\n      4 => \'小时\',\n      5 => \'半\',\n      6 => \'分钟\',\n      7 => \'秒\',\n      8 => \'刚才\',\n    ),\n  ),\n);\n\n'),('forums',1,1333532446,0,'$_DCACHE[\'forums\'] = array (\n  1 => \n  array (\n    \'fid\' => \'1\',\n    \'type\' => \'group\',\n    \'name\' => \'Discuz!\',\n    \'fup\' => \'0\',\n    \'viewperm\' => \'\',\n    \'orderby\' => \'lastpost\',\n    \'ascdesc\' => \'DESC\',\n    \'status\' => \'1\',\n    \'extra\' => \n    array (\n    ),\n  ),\n  2 => \n  array (\n    \'fid\' => \'2\',\n    \'type\' => \'forum\',\n    \'name\' => \'默认版块\',\n    \'fup\' => \'1\',\n    \'viewperm\' => \'\',\n    \'orderby\' => \'lastpost\',\n    \'ascdesc\' => \'DESC\',\n    \'users\' => NULL,\n    \'status\' => \'1\',\n    \'extra\' => \n    array (\n    ),\n  ),\n);\n\n'),('icons',1,1333532446,0,'$_DCACHE[\'icons\'] = array (\n  65 => \'icon1.gif\',\n  66 => \'icon2.gif\',\n  67 => \'icon3.gif\',\n  68 => \'icon4.gif\',\n  69 => \'icon5.gif\',\n  70 => \'icon6.gif\',\n  71 => \'icon7.gif\',\n  72 => \'icon8.gif\',\n  73 => \'icon9.gif\',\n  74 => \'icon10.gif\',\n  75 => \'icon11.gif\',\n  76 => \'icon12.gif\',\n  77 => \'icon13.gif\',\n  78 => \'icon14.gif\',\n  79 => \'icon15.gif\',\n  80 => \'icon16.gif\',\n);\n\n'),('stamps',1,1333532446,0,'$_DCACHE[\'stamps\'] = array (\n  0 => \n  array (\n    \'url\' => \'001.gif\',\n    \'text\' => \'精华\',\n  ),\n  1 => \n  array (\n    \'url\' => \'002.gif\',\n    \'text\' => \'热帖\',\n  ),\n  2 => \n  array (\n    \'url\' => \'003.gif\',\n    \'text\' => \'美图\',\n  ),\n  3 => \n  array (\n    \'url\' => \'004.gif\',\n    \'text\' => \'优秀\',\n  ),\n  4 => \n  array (\n    \'url\' => \'005.gif\',\n    \'text\' => \'置顶\',\n  ),\n  5 => \n  array (\n    \'url\' => \'006.gif\',\n    \'text\' => \'推荐\',\n  ),\n  6 => \n  array (\n    \'url\' => \'007.gif\',\n    \'text\' => \'原创\',\n  ),\n  7 => \n  array (\n    \'url\' => \'008.gif\',\n    \'text\' => \'版主推荐\',\n  ),\n  8 => \n  array (\n    \'url\' => \'009.gif\',\n    \'text\' => \'爆料\',\n  ),\n);\n\n'),('ranks',1,1333532446,0,'$_DCACHE[\'ranks\'] = array (\n);\n\n'),('usergroups',1,1333532446,0,'$_DCACHE[\'usergroups\'] = array (\n  1 => \n  array (\n    \'type\' => \'system\',\n    \'grouptitle\' => \'管理员\',\n    \'stars\' => \'9\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'200\',\n    \'allowcusbbcode\' => \'1\',\n    \'allowgetattach\' => \'1\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  18 => \n  array (\n    \'type\' => \'special\',\n    \'grouptitle\' => \'信息监察员\',\n    \'stars\' => \'9\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'200\',\n    \'allowcusbbcode\' => \'1\',\n    \'allowgetattach\' => \'1\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  17 => \n  array (\n    \'type\' => \'special\',\n    \'grouptitle\' => \'网站编辑\',\n    \'stars\' => \'8\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'150\',\n    \'allowcusbbcode\' => \'1\',\n    \'allowgetattach\' => \'1\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  16 => \n  array (\n    \'type\' => \'special\',\n    \'grouptitle\' => \'实习版主\',\n    \'stars\' => \'7\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'100\',\n    \'allowcusbbcode\' => \'1\',\n    \'allowgetattach\' => \'1\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  19 => \n  array (\n    \'type\' => \'special\',\n    \'grouptitle\' => \'审核员\',\n    \'stars\' => \'7\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'100\',\n    \'allowcusbbcode\' => \'1\',\n    \'allowgetattach\' => \'1\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  9 => \n  array (\n    \'type\' => \'member\',\n    \'grouptitle\' => \'乞丐\',\n    \'creditshigher\' => \'-9999999\',\n    \'creditslower\' => \'0\',\n    \'stars\' => \'0\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'0\',\n    \'allowcusbbcode\' => \'0\',\n    \'allowgetattach\' => \'0\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  8 => \n  array (\n    \'type\' => \'system\',\n    \'grouptitle\' => \'等待验证会员\',\n    \'stars\' => \'0\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'0\',\n    \'allowcusbbcode\' => \'0\',\n    \'allowgetattach\' => \'0\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  7 => \n  array (\n    \'type\' => \'system\',\n    \'grouptitle\' => \'游客\',\n    \'stars\' => \'0\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'1\',\n    \'allowcusbbcode\' => \'0\',\n    \'allowgetattach\' => \'0\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  6 => \n  array (\n    \'type\' => \'system\',\n    \'grouptitle\' => \'禁止 IP\',\n    \'stars\' => \'0\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'0\',\n    \'allowcusbbcode\' => \'0\',\n    \'allowgetattach\' => \'0\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  5 => \n  array (\n    \'type\' => \'system\',\n    \'grouptitle\' => \'禁止访问\',\n    \'stars\' => \'0\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'0\',\n    \'allowcusbbcode\' => \'0\',\n    \'allowgetattach\' => \'0\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  2 => \n  array (\n    \'type\' => \'system\',\n    \'grouptitle\' => \'超级版主\',\n    \'stars\' => \'8\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'150\',\n    \'allowcusbbcode\' => \'1\',\n    \'allowgetattach\' => \'1\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  3 => \n  array (\n    \'type\' => \'system\',\n    \'grouptitle\' => \'版主\',\n    \'stars\' => \'7\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'100\',\n    \'allowcusbbcode\' => \'1\',\n    \'allowgetattach\' => \'1\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  4 => \n  array (\n    \'type\' => \'system\',\n    \'grouptitle\' => \'禁止发言\',\n    \'stars\' => \'0\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'0\',\n    \'allowcusbbcode\' => \'0\',\n    \'allowgetattach\' => \'0\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  10 => \n  array (\n    \'type\' => \'member\',\n    \'grouptitle\' => \'新手上路\',\n    \'creditshigher\' => \'0\',\n    \'creditslower\' => \'50\',\n    \'stars\' => \'1\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'10\',\n    \'allowcusbbcode\' => \'0\',\n    \'allowgetattach\' => \'1\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  11 => \n  array (\n    \'type\' => \'member\',\n    \'grouptitle\' => \'注册会员\',\n    \'creditshigher\' => \'50\',\n    \'creditslower\' => \'200\',\n    \'stars\' => \'2\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'20\',\n    \'allowcusbbcode\' => \'0\',\n    \'allowgetattach\' => \'1\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  12 => \n  array (\n    \'type\' => \'member\',\n    \'grouptitle\' => \'中级会员\',\n    \'creditshigher\' => \'200\',\n    \'creditslower\' => \'500\',\n    \'stars\' => \'3\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'30\',\n    \'allowcusbbcode\' => \'1\',\n    \'allowgetattach\' => \'1\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  13 => \n  array (\n    \'type\' => \'member\',\n    \'grouptitle\' => \'高级会员\',\n    \'creditshigher\' => \'500\',\n    \'creditslower\' => \'1000\',\n    \'stars\' => \'4\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'50\',\n    \'allowcusbbcode\' => \'1\',\n    \'allowgetattach\' => \'1\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  14 => \n  array (\n    \'type\' => \'member\',\n    \'grouptitle\' => \'金牌会员\',\n    \'creditshigher\' => \'1000\',\n    \'creditslower\' => \'3000\',\n    \'stars\' => \'6\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'70\',\n    \'allowcusbbcode\' => \'1\',\n    \'allowgetattach\' => \'1\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  15 => \n  array (\n    \'type\' => \'member\',\n    \'grouptitle\' => \'论坛元老\',\n    \'creditshigher\' => \'3000\',\n    \'creditslower\' => \'9999999\',\n    \'stars\' => \'8\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'90\',\n    \'allowcusbbcode\' => \'1\',\n    \'allowgetattach\' => \'1\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n);\n\n'),('request',1,1333532446,0,'$_DCACHE[\'request\'] = array (\n  \'边栏模块_版块树形列表\' => \n  array (\n    \'url\' => \'function=module&module=forumtree.inc.php&settings=N%3B&jscharset=0&cachelife=864000\',\n    \'type\' => \'5\',\n  ),\n  \'边栏模块_版主排行\' => \n  array (\n    \'url\' => \'function=module&module=modlist.inc.php&settings=N%3B&jscharset=0&cachelife=3600\',\n    \'type\' => \'5\',\n  ),\n  \'聚合模块_版块列表\' => \n  array (\n    \'url\' => \'function=module&module=rowcombine.inc.php&settings=a%3A1%3A%7Bs%3A4%3A%22data%22%3Bs%3A84%3A%22%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E7%89%88%E5%9D%97%E6%8E%92%E8%A1%8C%2C%E7%89%88%E5%9D%97%E6%8E%92%E8%A1%8C%0D%0A%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E7%89%88%E5%9D%97%E6%A0%91%E5%BD%A2%E5%88%97%E8%A1%A8%2C%E7%89%88%E5%9D%97%E5%88%97%E8%A1%A8%22%3B%7D&jscharset=0&cachelife=864000&\',\n    \'type\' => \'5\',\n  ),\n  \'边栏模块_版块排行\' => \n  array (\n    \'url\' => \'function=forums&startrow=0&items=0&newwindow=1&orderby=posts&jscharset=0&cachelife=43200&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E7%89%88%E5%9D%97%E6%8E%92%E8%A1%8C%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%3Cimg%20style%3D%5C%22vertical-align%3Amiddle%5C%22%20src%3D%5C%22images%2Fdefault%2Ftree_file.gif%5C%22%20%2F%3E%20%7Bforumname%7D%28%7Bposts%7D%29%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\',\n    \'type\' => \'1\',\n  ),\n  \'聚合模块_热门主题\' => \n  array (\n    \'url\' => \'function=module&module=rowcombine.inc.php&settings=a%3A2%3A%7Bs%3A5%3A%22title%22%3Bs%3A12%3A%22%E7%83%AD%E9%97%A8%E4%B8%BB%E9%A2%98%22%3Bs%3A4%3A%22data%22%3Bs%3A112%3A%22%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E7%83%AD%E9%97%A8%E4%B8%BB%E9%A2%98_%E4%BB%8A%E6%97%A5%2C%E6%97%A5%0D%0A%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E7%83%AD%E9%97%A8%E4%B8%BB%E9%A2%98_%E6%9C%AC%E5%91%A8%2C%E5%91%A8%0D%0A%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E7%83%AD%E9%97%A8%E4%B8%BB%E9%A2%98_%E6%9C%AC%E6%9C%88%2C%E6%9C%88%22%3B%7D&jscharset=0&cachelife=1800&\',\n    \'type\' => \'5\',\n  ),\n  \'边栏模块_热门主题_本月\' => \n  array (\n    \'url\' => \'function=threads&sidestatus=0&maxlength=20&fnamelength=0&messagelength=&startrow=0&picpre=images%2Fcommon%2Fslisticon.gif&items=5&tag=&tids=&special=0&rewardstatus=&digest=0&stick=0&recommend=0&newwindow=1&threadtype=0&highlight=0&orderby=hourviews&hours=720&jscharset=0&cachelife=86400&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%AC%E6%9C%88%E7%83%AD%E9%97%A8%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bprefix%7D%7Bsubject%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\',\n    \'type\' => \'0\',\n  ),\n  \'聚合模块_会员排行\' => \n  array (\n    \'url\' => \'function=module&module=rowcombine.inc.php&settings=a%3A2%3A%7Bs%3A5%3A%22title%22%3Bs%3A12%3A%22%E4%BC%9A%E5%91%98%E6%8E%92%E8%A1%8C%22%3Bs%3A4%3A%22data%22%3Bs%3A112%3A%22%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E4%BC%9A%E5%91%98%E6%8E%92%E8%A1%8C_%E4%BB%8A%E6%97%A5%2C%E6%97%A5%0D%0A%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E4%BC%9A%E5%91%98%E6%8E%92%E8%A1%8C_%E6%9C%AC%E5%91%A8%2C%E5%91%A8%0D%0A%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E4%BC%9A%E5%91%98%E6%8E%92%E8%A1%8C_%E6%9C%AC%E6%9C%88%2C%E6%9C%88%22%3B%7D&jscharset=0&cachelife=3600&\',\n    \'type\' => \'5\',\n  ),\n  \'边栏模块_推荐主题\' => \n  array (\n    \'url\' => \'function=threads&sidestatus=0&maxlength=20&fnamelength=0&messagelength=&startrow=0&picpre=images%2Fcommon%2Fslisticon.gif&items=5&tag=&tids=&special=0&rewardstatus=&digest=0&stick=0&recommend=1&newwindow=1&threadtype=0&highlight=0&orderby=lastpost&hours=48&jscharset=0&cachelife=3600&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%8E%A8%E8%8D%90%E4%B8%BB%E9%A2%98%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bprefix%7D%7Bsubject%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\',\n    \'type\' => \'0\',\n  ),\n  \'边栏模块_最新图片\' => \n  array (\n    \'url\' => \'function=images&sidestatus=0&isimage=1&threadmethod=1&maxwidth=140&maxheight=140&startrow=0&items=5&orderby=dateline&hours=0&digest=0&newwindow=1&jscharset=0&jstemplate=%3Cdiv%20%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%80%E6%96%B0%E5%9B%BE%E7%89%87%3C%2Fh4%3E%0D%0A%3Cscript%20type%3D%5C%22text%2Fjavascript%5C%22%3E%0D%0Avar%20slideSpeed%20%3D%202500%3B%0D%0Avar%20slideImgsize%20%3D%20%5B140%2C140%5D%3B%0D%0Avar%20slideTextBar%20%3D%200%3B%0D%0Avar%20slideBorderColor%20%3D%20%5C%27%23C8DCEC%5C%27%3B%0D%0Avar%20slideBgColor%20%3D%20%5C%27%23FFF%5C%27%3B%0D%0Avar%20slideImgs%20%3D%20new%20Array%28%29%3B%0D%0Avar%20slideImgLinks%20%3D%20new%20Array%28%29%3B%0D%0Avar%20slideImgTexts%20%3D%20new%20Array%28%29%3B%0D%0Avar%20slideSwitchBar%20%3D%201%3B%0D%0Avar%20slideSwitchColor%20%3D%20%5C%27black%5C%27%3B%0D%0Avar%20slideSwitchbgColor%20%3D%20%5C%27white%5C%27%3B%0D%0Avar%20slideSwitchHiColor%20%3D%20%5C%27%23C8DCEC%5C%27%3B%0D%0A%5Bnode%5D%0D%0AslideImgs%5B%7Border%7D%5D%20%3D%20%5C%22%7Bimgfile%7D%5C%22%3B%0D%0AslideImgLinks%5B%7Border%7D%5D%20%3D%20%5C%22%7Blink%7D%5C%22%3B%0D%0AslideImgTexts%5B%7Border%7D%5D%20%3D%20%5C%22%7Bsubject%7D%5C%22%3B%0D%0A%5B%2Fnode%5D%0D%0A%3C%2Fscript%3E%0D%0A%3Cscript%20language%3D%5C%22javascript%5C%22%20type%3D%5C%22text%2Fjavascript%5C%22%20src%3D%5C%22include%2Fjs%2Fslide.js%5C%22%3E%3C%2Fscript%3E%0D%0A%3C%2Fdiv%3E&\',\n    \'type\' => \'4\',\n  ),\n  \'边栏模块_最新主题\' => \n  array (\n    \'url\' => \'function=threads&sidestatus=0&maxlength=20&fnamelength=0&messagelength=&startrow=0&picpre=images%2Fcommon%2Fslisticon.gif&items=5&tag=&tids=&special=0&rewardstatus=&digest=0&stick=0&recommend=0&newwindow=1&threadtype=0&highlight=0&orderby=dateline&hours=0&jscharset=0&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%80%E6%96%B0%E4%B8%BB%E9%A2%98%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bprefix%7D%7Bsubject%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\',\n    \'type\' => \'0\',\n  ),\n  \'边栏模块_活跃会员\' => \n  array (\n    \'url\' => \'function=memberrank&startrow=0&items=12&newwindow=1&extcredit=1&orderby=posts&hours=0&jscharset=0&cachelife=43200&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%B4%BB%E8%B7%83%E4%BC%9A%E5%91%98%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22avt_list%20s_clear%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bavatarsmall%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\',\n    \'type\' => \'2\',\n  ),\n  \'边栏模块_热门主题_本版\' => \n  array (\n    \'url\' => \'function=threads&sidestatus=1&maxlength=20&fnamelength=0&messagelength=&startrow=0&picpre=images%2Fcommon%2Fslisticon.gif&items=5&tag=&tids=&special=0&rewardstatus=&digest=0&stick=0&recommend=0&newwindow=1&threadtype=0&highlight=0&orderby=replies&hours=0&jscharset=0&cachelife=1800&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%AC%E7%89%88%E7%83%AD%E9%97%A8%E4%B8%BB%E9%A2%98%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bprefix%7D%7Bsubject%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\',\n    \'type\' => \'0\',\n  ),\n  \'边栏模块_热门主题_今日\' => \n  array (\n    \'url\' => \'function=threads&sidestatus=0&maxlength=20&fnamelength=0&messagelength=&startrow=0&picpre=images%2Fcommon%2Fslisticon.gif&items=5&tag=&tids=&special=0&rewardstatus=&digest=0&stick=0&recommend=0&newwindow=1&threadtype=0&highlight=0&orderby=hourviews&hours=24&jscharset=0&cachelife=1800&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E4%BB%8A%E6%97%A5%E7%83%AD%E9%97%A8%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bprefix%7D%7Bsubject%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\',\n    \'type\' => \'0\',\n  ),\n  \'边栏模块_最新回复\' => \n  array (\n    \'url\' => \'function=threads&sidestatus=0&maxlength=20&fnamelength=0&messagelength=&startrow=0&picpre=images%2Fcommon%2Fslisticon.gif&items=5&tag=&tids=&special=0&rewardstatus=&digest=0&stick=0&recommend=0&newwindow=1&threadtype=0&highlight=0&orderby=lastpost&hours=0&jscharset=0&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%80%E6%96%B0%E5%9B%9E%E5%A4%8D%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bprefix%7D%7Bsubject%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\',\n    \'type\' => \'0\',\n  ),\n  \'边栏模块_最新图片_本版\' => \n  array (\n    \'url\' => \'function=images&sidestatus=1&isimage=1&threadmethod=1&maxwidth=140&maxheight=140&startrow=0&items=5&orderby=dateline&hours=0&digest=0&newwindow=1&jscharset=0&jstemplate=%3Cdiv%20%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%80%E6%96%B0%E5%9B%BE%E7%89%87%3C%2Fh4%3E%0D%0A%3Cscript%20type%3D%5C%22text%2Fjavascript%5C%22%3E%0D%0Avar%20slideSpeed%20%3D%202500%3B%0D%0Avar%20slideImgsize%20%3D%20%5B140%2C140%5D%3B%0D%0Avar%20slideTextBar%20%3D%200%3B%0D%0Avar%20slideBorderColor%20%3D%20%5C%27%23C8DCEC%5C%27%3B%0D%0Avar%20slideBgColor%20%3D%20%5C%27%23FFF%5C%27%3B%0D%0Avar%20slideImgs%20%3D%20new%20Array%28%29%3B%0D%0Avar%20slideImgLinks%20%3D%20new%20Array%28%29%3B%0D%0Avar%20slideImgTexts%20%3D%20new%20Array%28%29%3B%0D%0Avar%20slideSwitchBar%20%3D%201%3B%0D%0Avar%20slideSwitchColor%20%3D%20%5C%27black%5C%27%3B%0D%0Avar%20slideSwitchbgColor%20%3D%20%5C%27white%5C%27%3B%0D%0Avar%20slideSwitchHiColor%20%3D%20%5C%27%23C8DCEC%5C%27%3B%0D%0A%5Bnode%5D%0D%0AslideImgs%5B%7Border%7D%5D%20%3D%20%5C%22%7Bimgfile%7D%5C%22%3B%0D%0AslideImgLinks%5B%7Border%7D%5D%20%3D%20%5C%22%7Blink%7D%5C%22%3B%0D%0AslideImgTexts%5B%7Border%7D%5D%20%3D%20%5C%22%7Bsubject%7D%5C%22%3B%0D%0A%5B%2Fnode%5D%0D%0A%3C%2Fscript%3E%0D%0A%3Cscript%20language%3D%5C%22javascript%5C%22%20type%3D%5C%22text%2Fjavascript%5C%22%20src%3D%5C%22include%2Fjs%2Fslide.js%5C%22%3E%3C%2Fscript%3E%0D%0A%3C%2Fdiv%3E&\',\n    \'type\' => \'4\',\n  ),\n  \'边栏模块_标签\' => \n  array (\n    \'url\' => \'function=module&module=tag.inc.php&settings=a%3A1%3A%7Bs%3A5%3A%22limit%22%3Bs%3A2%3A%2220%22%3B%7D&jscharset=0&cachelife=900&\',\n    \'type\' => \'5\',\n  ),\n  \'边栏模块_会员排行_本月\' => \n  array (\n    \'url\' => \'function=memberrank&startrow=0&items=5&newwindow=1&extcredit=1&orderby=hourposts&hours=720&jscharset=0&cachelife=86400&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%AC%E6%9C%88%E6%8E%92%E8%A1%8C%3C%2Fh4%3E%0D%0A%5Bnode%5D%3Cdiv%20class%3D%5C%22s_clear%5C%22%20style%3D%5C%22margin-bottom%3A%205px%3B%5C%22%3E%3Cdiv%20style%3D%5C%22margin-right%3A%2010px%3B%20float%3A%20left%3B%5C%22%3E%7Bavatarsmall%7D%3C%2Fdiv%3E%3Cp%3E%7Bmember%7D%3C%2Fp%3E%3Cp%3E%E5%8F%91%E5%B8%96%20%7Bvalue%7D%20%E7%AF%87%3C%2Fp%3E%3C%2Fdiv%3E%5B%2Fnode%5D%0D%0A%3C%2Fdiv%3E&\',\n    \'type\' => \'2\',\n  ),\n  \'边栏模块_会员排行_本周\' => \n  array (\n    \'url\' => \'function=memberrank&startrow=0&items=5&newwindow=1&extcredit=1&orderby=hourposts&hours=168&jscharset=0&cachelife=43200&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%AC%E5%91%A8%E6%8E%92%E8%A1%8C%3C%2Fh4%3E%0D%0A%5Bnode%5D%3Cdiv%20class%3D%5C%22s_clear%5C%22%20style%3D%5C%22margin-bottom%3A%205px%3B%5C%22%3E%3Cdiv%20style%3D%5C%22margin-right%3A%2010px%3B%20float%3A%20left%3B%5C%22%3E%7Bavatarsmall%7D%3C%2Fdiv%3E%3Cp%3E%7Bmember%7D%3C%2Fp%3E%3Cp%3E%E5%8F%91%E5%B8%96%20%7Bvalue%7D%20%E7%AF%87%3C%2Fp%3E%3C%2Fdiv%3E%5B%2Fnode%5D%0D%0A%3C%2Fdiv%3E&\',\n    \'type\' => \'2\',\n  ),\n  \'边栏方案_主题列表页默认\' => \n  array (\n    \'url\' => \'function=side&jscharset=&jstemplate=%5Bmodule%5D%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E6%88%91%E7%9A%84%E5%8A%A9%E6%89%8B%5B%2Fmodule%5D%3Chr%20class%3D%22shadowline%22%2F%3E%5Bmodule%5D%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E7%83%AD%E9%97%A8%E4%B8%BB%E9%A2%98_%E6%9C%AC%E7%89%88%5B%2Fmodule%5D%3Chr%20class%3D%22shadowline%22%2F%3E%5Bmodule%5D%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E7%89%88%E5%9D%97%E6%8E%92%E8%A1%8C%5B%2Fmodule%5D&\',\n    \'type\' => \'-2\',\n  ),\n  \'边栏方案_首页默认\' => \n  array (\n    \'url\' => \'function=side&jscharset=&jstemplate=%5Bmodule%5D%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E6%88%91%E7%9A%84%E5%8A%A9%E6%89%8B%5B%2Fmodule%5D%3Chr%20class%3D%22shadowline%22%2F%3E%5Bmodule%5D%E8%81%9A%E5%90%88%E6%A8%A1%E5%9D%97_%E6%96%B0%E5%B8%96%5B%2Fmodule%5D%3Chr%20class%3D%22shadowline%22%2F%3E%5Bmodule%5D%E8%81%9A%E5%90%88%E6%A8%A1%E5%9D%97_%E7%83%AD%E9%97%A8%E4%B8%BB%E9%A2%98%5B%2Fmodule%5D%3Chr%20class%3D%22shadowline%22%2F%3E%5Bmodule%5D%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E6%B4%BB%E8%B7%83%E4%BC%9A%E5%91%98%5B%2Fmodule%5D&\',\n    \'type\' => \'-2\',\n  ),\n  \'聚合模块_新帖\' => \n  array (\n    \'url\' => \'function=module&module=rowcombine.inc.php&settings=a%3A2%3A%7Bs%3A5%3A%22title%22%3Bs%3A12%3A%22%E6%9C%80%E6%96%B0%E5%B8%96%E5%AD%90%22%3Bs%3A4%3A%22data%22%3Bs%3A66%3A%22%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E6%9C%80%E6%96%B0%E4%B8%BB%E9%A2%98%2C%E4%B8%BB%E9%A2%98%0D%0A%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E6%9C%80%E6%96%B0%E5%9B%9E%E5%A4%8D%2C%E5%9B%9E%E5%A4%8D%22%3B%7D&jscharset=0&\',\n    \'type\' => \'5\',\n  ),\n  \'边栏模块_热门主题_本周\' => \n  array (\n    \'url\' => \'function=threads&sidestatus=0&maxlength=20&fnamelength=0&messagelength=&startrow=0&picpre=images%2Fcommon%2Fslisticon.gif&items=5&tag=&tids=&special=0&rewardstatus=&digest=0&stick=0&recommend=0&newwindow=1&threadtype=0&highlight=0&orderby=hourviews&hours=168&jscharset=0&cachelife=43200&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%AC%E5%91%A8%E7%83%AD%E9%97%A8%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bprefix%7D%7Bsubject%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\',\n    \'type\' => \'0\',\n  ),\n  \'边栏模块_会员排行_今日\' => \n  array (\n    \'url\' => \'function=memberrank&startrow=0&items=5&newwindow=1&extcredit=1&orderby=hourposts&hours=24&jscharset=0&cachelife=3600&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E4%BB%8A%E6%97%A5%E6%8E%92%E8%A1%8C%3C%2Fh4%3E%0D%0A%5Bnode%5D%3Cdiv%20class%3D%5C%22s_clear%5C%22%20style%3D%5C%22margin-bottom%3A%205px%3B%5C%22%3E%3Cdiv%20style%3D%5C%22margin-right%3A%2010px%3B%20float%3A%20left%3B%5C%22%3E%7Bavatarsmall%7D%3C%2Fdiv%3E%3Cp%3E%7Bmember%7D%3C%2Fp%3E%3Cp%3E%E5%8F%91%E5%B8%96%20%7Bvalue%7D%20%E7%AF%87%3C%2Fp%3E%3C%2Fdiv%3E%5B%2Fnode%5D%0D%0A%3C%2Fdiv%3E&\',\n    \'type\' => \'2\',\n  ),\n  \'边栏模块_论坛之星\' => \n  array (\n    \'url\' => \'function=memberrank&startrow=0&items=3&newwindow=1&extcredit=1&orderby=hourposts&hours=168&jscharset=0&cachelife=43200&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%20s_clear%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%AC%E5%91%A8%E4%B9%8B%E6%98%9F%3C%2Fh4%3E%0D%0A%5Bnode%5D%0D%0A%5Bshow%3D1%5D%3Cdiv%20style%3D%5C%22clear%3Aboth%5C%22%3E%3Cdiv%20style%3D%5C%22float%3Aleft%3B%20margin-right%3A%2016px%3B%5C%22%3E%7Bavatarsmall%7D%3C%2Fdiv%3E%5B%2Fshow%5D%7Bmember%7D%20%5Bshow%3D1%5D%3Cbr%20%2F%3E%E5%8F%91%E5%B8%96%20%7Bvalue%7D%20%E7%AF%87%3C%2Fdiv%3E%3Cdiv%20style%3D%5C%22clear%3Aboth%3Bmargin-top%3A2px%5C%22%20%2F%3E%3C%2Fdiv%3E%5B%2Fshow%5D%0D%0A%5B%2Fnode%5D%0D%0A%3C%2Fdiv%3E&\',\n    \'type\' => \'2\',\n  ),\n  \'边栏模块_我的助手\' => \n  array (\n    \'url\' => \'function=module&module=assistant.inc.php&settings=N%3B&jscharset=0&cachelife=0\',\n    \'type\' => \'5\',\n  ),\n  \'边栏模块_Google搜索\' => \n  array (\n    \'url\' => \'function=module&module=google.inc.php&settings=a%3A2%3A%7Bs%3A4%3A%22lang%22%3Bs%3A0%3A%22%22%3Bs%3A7%3A%22default%22%3Bs%3A1%3A%221%22%3B%7D&jscharset=0&cachelife=864000&\',\n    \'type\' => \'5\',\n  ),\n  \'UCHome_最新动态\' => \n  array (\n    \'url\' => \'function=module&module=feed.inc.php&settings=a%3A6%3A%7Bs%3A5%3A%22title%22%3Bs%3A12%3A%22%E6%9C%80%E6%96%B0%E5%8A%A8%E6%80%81%22%3Bs%3A4%3A%22uids%22%3Bs%3A0%3A%22%22%3Bs%3A6%3A%22friend%22%3Bs%3A1%3A%220%22%3Bs%3A5%3A%22start%22%3Bs%3A1%3A%220%22%3Bs%3A5%3A%22limit%22%3Bs%3A2%3A%2210%22%3Bs%3A8%3A%22template%22%3Bs%3A54%3A%22%3Cdiv%20style%3D%5C%22padding-left%3A2px%5C%22%3E%7Btitle_template%7D%3C%2Fdiv%3E%22%3B%7D&jscharset=0&cachelife=0&\',\n    \'type\' => \'5\',\n  ),\n  \'UCHome_最新更新空间\' => \n  array (\n    \'url\' => \'function=module&module=space.inc.php&settings=a%3A17%3A%7Bs%3A5%3A%22title%22%3Bs%3A18%3A%22%E6%9C%80%E6%96%B0%E6%9B%B4%E6%96%B0%E7%A9%BA%E9%97%B4%22%3Bs%3A3%3A%22uid%22%3Bs%3A0%3A%22%22%3Bs%3A14%3A%22startfriendnum%22%3Bs%3A0%3A%22%22%3Bs%3A12%3A%22endfriendnum%22%3Bs%3A0%3A%22%22%3Bs%3A12%3A%22startviewnum%22%3Bs%3A0%3A%22%22%3Bs%3A10%3A%22endviewnum%22%3Bs%3A0%3A%22%22%3Bs%3A11%3A%22startcredit%22%3Bs%3A0%3A%22%22%3Bs%3A9%3A%22endcredit%22%3Bs%3A0%3A%22%22%3Bs%3A6%3A%22avatar%22%3Bs%3A2%3A%22-1%22%3Bs%3A10%3A%22namestatus%22%3Bs%3A2%3A%22-1%22%3Bs%3A8%3A%22dateline%22%3Bs%3A1%3A%220%22%3Bs%3A10%3A%22updatetime%22%3Bs%3A1%3A%220%22%3Bs%3A5%3A%22order%22%3Bs%3A10%3A%22updatetime%22%3Bs%3A2%3A%22sc%22%3Bs%3A4%3A%22DESC%22%3Bs%3A5%3A%22start%22%3Bs%3A1%3A%220%22%3Bs%3A5%3A%22limit%22%3Bs%3A2%3A%2210%22%3Bs%3A8%3A%22template%22%3Bs%3A267%3A%22%3Ctable%3E%0D%0A%3Ctr%3E%0D%0A%3Ctd%20width%3D%5C%2250%5C%22%20rowspan%3D%5C%222%5C%22%3E%3Ca%20href%3D%5C%22%7Buserlink%7D%5C%22%20target%3D%5C%22_blank%5C%22%3E%3Cimg%20src%3D%5C%22%7Bphoto%7D%5C%22%20%2F%3E%3C%2Fa%3E%3C%2Ftd%3E%0D%0A%3Ctd%3E%3Ca%20href%3D%5C%22%7Buserlink%7D%5C%22%20%20target%3D%5C%22_blank%5C%22%20style%3D%5C%22text-decoration%3Anone%3B%5C%22%3E%7Busername%7D%3C%2Fa%3E%3C%2Ftd%3E%0D%0A%3C%2Ftr%3E%0D%0A%3Ctr%3E%3Ctd%3E%7Bupdatetime%7D%3C%2Ftd%3E%3C%2Ftr%3E%0D%0A%3C%2Ftable%3E%22%3B%7D&jscharset=0&cachelife=0&\',\n    \'type\' => \'5\',\n  ),\n  \'UCHome_最新记录\' => \n  array (\n    \'url\' => \'function=module&module=doing.inc.php&settings=a%3A6%3A%7Bs%3A5%3A%22title%22%3Bs%3A12%3A%22%E6%9C%80%E6%96%B0%E8%AE%B0%E5%BD%95%22%3Bs%3A3%3A%22uid%22%3Bs%3A0%3A%22%22%3Bs%3A4%3A%22mood%22%3Bs%3A1%3A%220%22%3Bs%3A5%3A%22start%22%3Bs%3A1%3A%220%22%3Bs%3A5%3A%22limit%22%3Bs%3A2%3A%2210%22%3Bs%3A8%3A%22template%22%3Bs%3A361%3A%22%0D%0A%3Cdiv%20style%3D%5C%22padding%3A0%200%205px%200%3B%5C%22%3E%0D%0A%3Ca%20href%3D%5C%22%7Buserlink%7D%5C%22%20target%3D%5C%22_blank%5C%22%3E%3Cimg%20src%3D%5C%22%7Bphoto%7D%5C%22%20width%3D%5C%2218%5C%22%20height%3D%5C%2218%5C%22%20align%3D%5C%22absmiddle%5C%22%3E%3C%2Fa%3E%20%3Ca%20href%3D%5C%22%7Buserlink%7D%5C%22%20%20target%3D%5C%22_blank%5C%22%3E%7Busername%7D%3C%2Fa%3E%EF%BC%9A%0D%0A%3C%2Fdiv%3E%0D%0A%3Cdiv%20style%3D%5C%22padding%3A0%200%205px%2020px%3B%5C%22%3E%0D%0A%3Ca%20href%3D%5C%22%7Blink%7D%5C%22%20style%3D%5C%22color%3A%23333%3Btext-decoration%3Anone%3B%5C%22%20target%3D%5C%22_blank%5C%22%3E%7Bmessage%7D%3C%2Fa%3E%0D%0A%3C%2Fdiv%3E%22%3B%7D&jscharset=0&cachelife=0&\',\n    \'type\' => \'5\',\n  ),\n  \'UCHome_竞价排名\' => \n  array (\n    \'url\' => \'function=module&module=html.inc.php&settings=a%3A3%3A%7Bs%3A4%3A%22type%22%3Bs%3A1%3A%220%22%3Bs%3A4%3A%22code%22%3Bs%3A27%3A%22%3Cdiv%20id%3D%5C%22sidefeed%5C%22%3E%3C%2Fdiv%3E%22%3Bs%3A4%3A%22side%22%3Bs%3A1%3A%220%22%3B%7D&jscharset=0&cachelife=864000&\',\n    \'type\' => \'5\',\n  ),\n);\n\n'),('medals',1,1333532446,0,'$_DCACHE[\'medals\'] = array (\n);\n\n'),('magics',1,1333532446,0,'$_DCACHE[\'magics\'] = array (\n  1 => \n  array (\n    \'identifier\' => \'CCK\',\n    \'available\' => \'1\',\n    \'name\' => \'变色卡\',\n    \'description\' => \'可以变换主题的颜色,并保存24小时\',\n    \'weight\' => \'20\',\n    \'price\' => \'10\',\n    \'type\' => \'1\',\n  ),\n  2 => \n  array (\n    \'identifier\' => \'MOK\',\n    \'available\' => \'1\',\n    \'name\' => \'金钱卡\',\n    \'description\' => \'可以随机获得一些金币\',\n    \'weight\' => \'30\',\n    \'price\' => \'10\',\n    \'type\' => \'3\',\n  ),\n  3 => \n  array (\n    \'identifier\' => \'SEK\',\n    \'available\' => \'1\',\n    \'name\' => \'IP卡\',\n    \'description\' => \'可以查看帖子作者的IP\',\n    \'weight\' => \'30\',\n    \'price\' => \'15\',\n    \'type\' => \'1\',\n  ),\n  4 => \n  array (\n    \'identifier\' => \'UPK\',\n    \'available\' => \'1\',\n    \'name\' => \'提升卡\',\n    \'description\' => \'可以提升某个主题\',\n    \'weight\' => \'30\',\n    \'price\' => \'10\',\n    \'type\' => \'1\',\n  ),\n  5 => \n  array (\n    \'identifier\' => \'TOK\',\n    \'available\' => \'1\',\n    \'name\' => \'置顶卡\',\n    \'description\' => \'可以将主题置顶24小时\',\n    \'weight\' => \'40\',\n    \'price\' => \'20\',\n    \'type\' => \'1\',\n  ),\n  6 => \n  array (\n    \'identifier\' => \'REK\',\n    \'available\' => \'1\',\n    \'name\' => \'悔悟卡\',\n    \'description\' => \'可以删除自己的帖子\',\n    \'weight\' => \'30\',\n    \'price\' => \'10\',\n    \'type\' => \'1\',\n  ),\n  7 => \n  array (\n    \'identifier\' => \'RTK\',\n    \'available\' => \'1\',\n    \'name\' => \'狗仔卡\',\n    \'description\' => \'查看某个用户是否在线\',\n    \'weight\' => \'30\',\n    \'price\' => \'15\',\n    \'type\' => \'2\',\n  ),\n  8 => \n  array (\n    \'identifier\' => \'CLK\',\n    \'available\' => \'1\',\n    \'name\' => \'沉默卡\',\n    \'description\' => \'24小时内不能回复\',\n    \'weight\' => \'30\',\n    \'price\' => \'15\',\n    \'type\' => \'1\',\n  ),\n  9 => \n  array (\n    \'identifier\' => \'OPK\',\n    \'available\' => \'1\',\n    \'name\' => \'喧嚣卡\',\n    \'description\' => \'使贴子可以回复\',\n    \'weight\' => \'30\',\n    \'price\' => \'15\',\n    \'type\' => \'1\',\n  ),\n  10 => \n  array (\n    \'identifier\' => \'YSK\',\n    \'available\' => \'1\',\n    \'name\' => \'隐身卡\',\n    \'description\' => \'可以将自己的帖子匿名\',\n    \'weight\' => \'30\',\n    \'price\' => \'20\',\n    \'type\' => \'1\',\n  ),\n  11 => \n  array (\n    \'identifier\' => \'CBK\',\n    \'available\' => \'1\',\n    \'name\' => \'恢复卡\',\n    \'description\' => \'将匿名恢复为正常显示的用户名,匿名终结者\',\n    \'weight\' => \'20\',\n    \'price\' => \'15\',\n    \'type\' => \'1\',\n  ),\n  12 => \n  array (\n    \'identifier\' => \'MVK\',\n    \'available\' => \'1\',\n    \'name\' => \'移动卡\',\n    \'description\' => \'可将自已的帖子移动到其他版面（隐含、特殊限定版面除外）\',\n    \'weight\' => \'50\',\n    \'price\' => \'50\',\n    \'type\' => \'1\',\n  ),\n);\n\n'),('modreasons',1,1333532446,0,'$_DCACHE[\'modreasons\'] = array (\n  0 => \'广告/SPAM\',\n  1 => \'恶意灌水\',\n  2 => \'违规内容\',\n  3 => \'文不对题\',\n  4 => \'重复发帖\',\n  5 => \'\',\n  6 => \'我很赞同\',\n  7 => \'精品文章\',\n  8 => \'原创内容\',\n);\n\n'),('stamptypeid',1,1333532446,0,'$_DCACHE[\'stamptypeid\'] = array (\n);\n\n'),('advs_archiver',1,1333532446,0,'$_DCACHE[\'advs\'] = array (\n);\n\n'),('advs_register',1,1333532446,0,'$_DCACHE[\'advs\'] = array (\n);\n\n'),('ipctrl',1,1333532446,0,'$_DCACHE[\'ipctrl\'] = array (\n  \'ipregctrl\' => \'\',\n  \'ipverifywhite\' => \'\',\n);\n\n'),('faqs',1,1333532446,0,'$_DCACHE[\'faqs\'] = array (\n  \'login\' => \n  array (\n    \'fpid\' => \'1\',\n    \'id\' => \'3\',\n    \'keyword\' => \'登录帮助\',\n  ),\n  \'discuzcode\' => \n  array (\n    \'fpid\' => \'5\',\n    \'id\' => \'18\',\n    \'keyword\' => \'Discuz!代码\',\n  ),\n  \'smilies\' => \n  array (\n    \'fpid\' => \'5\',\n    \'id\' => \'32\',\n    \'keyword\' => \'表情\',\n  ),\n);\n\n'),('secqaa',1,1333532446,0,'$_DCACHE[\'secqaa\'] = array (\n  1 => NULL,\n  2 => NULL,\n  3 => NULL,\n  4 => NULL,\n  5 => NULL,\n  6 => NULL,\n  7 => NULL,\n  8 => NULL,\n  9 => NULL,\n);\n\n'),('censor',1,1333532446,0,'$_DCACHE[\'censor\'] = array (\n  \'filter\' => \n  array (\n  ),\n  \'banned\' => \'\',\n  \'mod\' => \'\',\n);\n\n'),('ipbanned',1,1333532446,0,'$_DCACHE[\'ipbanned\'] = array (\n);\n\n'),('smilies_js',1,1333532446,0,'$_DCACHE[\'smilies_js\'] = array (\n);\n\n'),('forumstick',1,1333532446,0,'$_DCACHE[\'forumstick\'] = array (\n);\n\n'),('announcements',1,1333532446,0,'$_DCACHE[\'announcements\'] = array (\n);\n\n'),('onlinelist',1,1333532446,0,'$_DCACHE[\'onlinelist\'] = array (\n  \'legend\' => \'<img src=\"images/common/online_admin.gif\" /> 管理员 &nbsp; &nbsp; &nbsp; <img src=\"images/common/online_supermod.gif\" /> 超级版主 &nbsp; &nbsp; &nbsp; <img src=\"images/common/online_moderator.gif\" /> 版主 &nbsp; &nbsp; &nbsp; <img src=\"images/common/online_member.gif\" /> 会员 &nbsp; &nbsp; &nbsp; \',\n  1 => \'online_admin.gif\',\n  2 => \'online_supermod.gif\',\n  3 => \'online_moderator.gif\',\n  0 => \'online_member.gif\',\n);\n\n'),('forumlinks',1,1333532446,0,'$_DCACHE[\'forumlinks\'] = array (\n  0 => \'<li><div class=\"forumlogo\"><img src=\"images/logo.gif\" border=\"0\" alt=\"Discuz! 官方论坛\" /></div><div class=\"forumcontent\"><h5><a href=\"http://www.discuz.net\" target=\"_blank\">Discuz! 官方论坛</a></h5><p>提供最新 Discuz! 产品新闻、软件下载与技术交流</p></div>\',\n  1 => \'\',\n  2 => \'\',\n);\n\n'),('advs_index',1,1333532446,0,'$_DCACHE[\'advs\'] = array (\n);\n\n'),('heats',1,1333532446,0,'$_DCACHE[\'heats\'] = array (\n  \'expiration\' => 0,\n);\n\n'),('smilies',1,1333532446,0,'$_DCACHE[\'smilies\'] = array (\n  \'searcharray\' => \n  array (\n    13 => \'/\\\\:loveliness\\\\:/\',\n    23 => \'/\\\\:handshake/\',\n    20 => \'/\\\\:victory\\\\:/\',\n    37 => \'/\\\\{\\\\:2_37\\\\:\\\\}/\',\n    46 => \'/\\\\{\\\\:3_46\\\\:\\\\}/\',\n    55 => \'/\\\\{\\\\:3_55\\\\:\\\\}/\',\n    64 => \'/\\\\{\\\\:3_64\\\\:\\\\}/\',\n    32 => \'/\\\\{\\\\:2_32\\\\:\\\\}/\',\n    41 => \'/\\\\{\\\\:3_41\\\\:\\\\}/\',\n    50 => \'/\\\\{\\\\:3_50\\\\:\\\\}/\',\n    18 => \'/\\\\:sleepy\\\\:/\',\n    59 => \'/\\\\{\\\\:3_59\\\\:\\\\}/\',\n    27 => \'/\\\\{\\\\:2_27\\\\:\\\\}/\',\n    36 => \'/\\\\{\\\\:2_36\\\\:\\\\}/\',\n    45 => \'/\\\\{\\\\:3_45\\\\:\\\\}/\',\n    54 => \'/\\\\{\\\\:3_54\\\\:\\\\}/\',\n    63 => \'/\\\\{\\\\:3_63\\\\:\\\\}/\',\n    31 => \'/\\\\{\\\\:2_31\\\\:\\\\}/\',\n    40 => \'/\\\\{\\\\:2_40\\\\:\\\\}/\',\n    49 => \'/\\\\{\\\\:3_49\\\\:\\\\}/\',\n    17 => \'/\\\\:shutup\\\\:/\',\n    58 => \'/\\\\{\\\\:3_58\\\\:\\\\}/\',\n    26 => \'/\\\\{\\\\:2_26\\\\:\\\\}/\',\n    35 => \'/\\\\{\\\\:2_35\\\\:\\\\}/\',\n    44 => \'/\\\\{\\\\:3_44\\\\:\\\\}/\',\n    53 => \'/\\\\{\\\\:3_53\\\\:\\\\}/\',\n    62 => \'/\\\\{\\\\:3_62\\\\:\\\\}/\',\n    30 => \'/\\\\{\\\\:2_30\\\\:\\\\}/\',\n    39 => \'/\\\\{\\\\:2_39\\\\:\\\\}/\',\n    48 => \'/\\\\{\\\\:3_48\\\\:\\\\}/\',\n    57 => \'/\\\\{\\\\:3_57\\\\:\\\\}/\',\n    25 => \'/\\\\{\\\\:2_25\\\\:\\\\}/\',\n    34 => \'/\\\\{\\\\:2_34\\\\:\\\\}/\',\n    43 => \'/\\\\{\\\\:3_43\\\\:\\\\}/\',\n    52 => \'/\\\\{\\\\:3_52\\\\:\\\\}/\',\n    61 => \'/\\\\{\\\\:3_61\\\\:\\\\}/\',\n    29 => \'/\\\\{\\\\:2_29\\\\:\\\\}/\',\n    38 => \'/\\\\{\\\\:2_38\\\\:\\\\}/\',\n    47 => \'/\\\\{\\\\:3_47\\\\:\\\\}/\',\n    56 => \'/\\\\{\\\\:3_56\\\\:\\\\}/\',\n    33 => \'/\\\\{\\\\:2_33\\\\:\\\\}/\',\n    42 => \'/\\\\{\\\\:3_42\\\\:\\\\}/\',\n    51 => \'/\\\\{\\\\:3_51\\\\:\\\\}/\',\n    60 => \'/\\\\{\\\\:3_60\\\\:\\\\}/\',\n    28 => \'/\\\\{\\\\:2_28\\\\:\\\\}/\',\n    16 => \'/\\\\:dizzy\\\\:/\',\n    15 => \'/\\\\:curse\\\\:/\',\n    14 => \'/\\\\:funk\\\\:/\',\n    22 => \'/\\\\:kiss\\\\:/\',\n    21 => \'/\\\\:time\\\\:/\',\n    24 => \'/\\\\:call\\\\:/\',\n    19 => \'/\\\\:hug\\\\:/\',\n    12 => \'/\\\\:lol/\',\n    4 => \'/\\\\:\\\'\\\\(/\',\n    5 => \'/\\\\:@/\',\n    9 => \'/;P/\',\n    8 => \'/\\\\:\\\\$/\',\n    3 => \'/\\\\:D/\',\n    7 => \'/\\\\:P/\',\n    2 => \'/\\\\:\\\\(/\',\n    11 => \'/\\\\:Q/\',\n    6 => \'/\\\\:o/\',\n    1 => \'/\\\\:\\\\)/\',\n    10 => \'/\\\\:L/\',\n  ),\n  \'replacearray\' => \n  array (\n    13 => \'loveliness.gif\',\n    23 => \'handshake.gif\',\n    20 => \'victory.gif\',\n    37 => \'13.gif\',\n    46 => \'06.gif\',\n    55 => \'15.gif\',\n    64 => \'24.gif\',\n    32 => \'08.gif\',\n    41 => \'01.gif\',\n    50 => \'10.gif\',\n    18 => \'sleepy.gif\',\n    59 => \'19.gif\',\n    27 => \'03.gif\',\n    36 => \'12.gif\',\n    45 => \'05.gif\',\n    54 => \'14.gif\',\n    63 => \'23.gif\',\n    31 => \'07.gif\',\n    40 => \'16.gif\',\n    49 => \'09.gif\',\n    17 => \'shutup.gif\',\n    58 => \'18.gif\',\n    26 => \'02.gif\',\n    35 => \'11.gif\',\n    44 => \'04.gif\',\n    53 => \'13.gif\',\n    62 => \'22.gif\',\n    30 => \'06.gif\',\n    39 => \'15.gif\',\n    48 => \'08.gif\',\n    57 => \'17.gif\',\n    25 => \'01.gif\',\n    34 => \'10.gif\',\n    43 => \'03.gif\',\n    52 => \'12.gif\',\n    61 => \'21.gif\',\n    29 => \'05.gif\',\n    38 => \'14.gif\',\n    47 => \'07.gif\',\n    56 => \'16.gif\',\n    33 => \'09.gif\',\n    42 => \'02.gif\',\n    51 => \'11.gif\',\n    60 => \'20.gif\',\n    28 => \'04.gif\',\n    16 => \'dizzy.gif\',\n    15 => \'curse.gif\',\n    14 => \'funk.gif\',\n    22 => \'kiss.gif\',\n    21 => \'time.gif\',\n    24 => \'call.gif\',\n    19 => \'hug.gif\',\n    12 => \'lol.gif\',\n    4 => \'cry.gif\',\n    5 => \'huffy.gif\',\n    9 => \'titter.gif\',\n    8 => \'shy.gif\',\n    3 => \'biggrin.gif\',\n    7 => \'tongue.gif\',\n    2 => \'sad.gif\',\n    11 => \'mad.gif\',\n    6 => \'shocked.gif\',\n    1 => \'smile.gif\',\n    10 => \'sweat.gif\',\n  ),\n  \'typearray\' => \n  array (\n    13 => \'1\',\n    23 => \'1\',\n    20 => \'1\',\n    37 => \'2\',\n    46 => \'3\',\n    55 => \'3\',\n    64 => \'3\',\n    32 => \'2\',\n    41 => \'3\',\n    50 => \'3\',\n    18 => \'1\',\n    59 => \'3\',\n    27 => \'2\',\n    36 => \'2\',\n    45 => \'3\',\n    54 => \'3\',\n    63 => \'3\',\n    31 => \'2\',\n    40 => \'2\',\n    49 => \'3\',\n    17 => \'1\',\n    58 => \'3\',\n    26 => \'2\',\n    35 => \'2\',\n    44 => \'3\',\n    53 => \'3\',\n    62 => \'3\',\n    30 => \'2\',\n    39 => \'2\',\n    48 => \'3\',\n    57 => \'3\',\n    25 => \'2\',\n    34 => \'2\',\n    43 => \'3\',\n    52 => \'3\',\n    61 => \'3\',\n    29 => \'2\',\n    38 => \'2\',\n    47 => \'3\',\n    56 => \'3\',\n    33 => \'2\',\n    42 => \'3\',\n    51 => \'3\',\n    60 => \'3\',\n    28 => \'2\',\n    16 => \'1\',\n    15 => \'1\',\n    14 => \'1\',\n    22 => \'1\',\n    21 => \'1\',\n    24 => \'1\',\n    19 => \'1\',\n    12 => \'1\',\n    4 => \'1\',\n    5 => \'1\',\n    9 => \'1\',\n    8 => \'1\',\n    3 => \'1\',\n    7 => \'1\',\n    2 => \'1\',\n    11 => \'1\',\n    6 => \'1\',\n    1 => \'1\',\n    10 => \'1\',\n  ),\n);\n\n'),('announcements_forum',1,1333532446,0,'$_DCACHE[\'announcements_forum\'] = array (\n);\n\n'),('globalstick',1,1333532446,0,'$_DCACHE[\'globalstick\'] = array (\n  \'global\' => \n  array (\n    \'tids\' => 0,\n    \'count\' => 0,\n  ),\n);\n\n'),('advs_forumdisplay',1,1333532446,0,'$_DCACHE[\'advs\'] = array (\n);\n\n'),('smileytypes',1,1333532446,0,'$_DCACHE[\'smileytypes\'] = array (\n  1 => \n  array (\n    \'name\' => \'默认\',\n    \'directory\' => \'default\',\n  ),\n  2 => \n  array (\n    \'name\' => \'酷猴\',\n    \'directory\' => \'coolmonkey\',\n  ),\n  3 => \n  array (\n    \'name\' => \'呆呆男\',\n    \'directory\' => \'grapeman\',\n  ),\n);\n\n'),('bbcodes',1,1333532446,0,'$_DCACHE[\'bbcodes\'] = array (\n  \'searcharray\' => \n  array (\n    0 => \'/\\\\[qq]([^\"\\\\[]+?)\\\\[\\\\/qq\\\\]/is\',\n  ),\n  \'replacearray\' => \n  array (\n    0 => \'<a href=\"http://wpa.qq.com/msgrd?V=1&Uin=\\\\1&amp;Site=[Discuz!]&amp;Menu=yes\" target=\"_blank\"><img src=\"http://wpa.qq.com/pa?p=1:\\\\1:1\" border=\"0\"></a>\',\n  ),\n);\n\n'),('advs_viewthread',1,1333532446,0,'$_DCACHE[\'advs\'] = array (\n);\n\n'),('tags_viewthread',1,1333532446,0,'$_DCACHE[\'tags\'] = array (\n  1 => \'[\\\'\\\']\',\n  0 => \'[\\\'\\\']\',\n  2 => \'0\',\n);\n\n'),('custominfo',1,1333532446,0,'$_DCACHE[\'custominfo\'] = array (\n  \'customauthorinfo\' => \n  array (\n    2 => \'<dt>UID</dt><dd>$post[uid]&nbsp;</dd><dt>帖子</dt><dd>$post[posts]&nbsp;</dd><dt>精华</dt><dd>$post[digestposts]&nbsp;</dd><dt>积分</dt><dd>$post[credits]&nbsp;</dd><dt>阅读权限</dt><dd>$post[readaccess]&nbsp;</dd>\".($post[location] ? \"<dt>来自</dt><dd>$post[location]&nbsp;</dd>\" : \"\").\"<dt>在线时间</dt><dd>$post[oltime] 小时&nbsp;</dd><dt>注册时间</dt><dd>$post[regdate]&nbsp;</dd><dt>最后登录</dt><dd>$post[lastdate]&nbsp;</dd>\',\n    1 => NULL,\n  ),\n  \'fieldsadd\' => \'\',\n  \'profilefields\' => \n  array (\n  ),\n  \'postno\' => \n  array (\n    0 => \'<sup>#</sup>\',\n  ),\n);\n\n'),('groupicon',1,1333532446,0,'$_DCACHE[\'groupicon\'] = array (\n  1 => \'images/common/online_admin.gif\',\n  2 => \'images/common/online_supermod.gif\',\n  3 => \'images/common/online_moderator.gif\',\n  0 => \'images/common/online_member.gif\',\n);\n\n'),('focus',1,1333532446,0,'$_DCACHE[\'focus\'] = array (\n  \'title\' => NULL,\n  \'data\' => \n  array (\n  ),\n);\n\n'),('bbcodes_display',1,1333532446,0,'$_DCACHE[\'bbcodes_display\'] = array (\n);\n\n'),('smileycodes',1,1333532446,0,'$_DCACHE[\'smileycodes\'] = array (\n  1 => \':)\',\n  2 => \':(\',\n  3 => \':D\',\n  4 => \':\\\'(\',\n  5 => \':@\',\n  6 => \':o\',\n  7 => \':P\',\n  8 => \':$\',\n  9 => \';P\',\n  10 => \':L\',\n  11 => \':Q\',\n  12 => \':lol\',\n  13 => \':loveliness:\',\n  14 => \':funk:\',\n  15 => \':curse:\',\n  16 => \':dizzy:\',\n  17 => \':shutup:\',\n  18 => \':sleepy:\',\n  19 => \':hug:\',\n  20 => \':victory:\',\n  21 => \':time:\',\n  22 => \':kiss:\',\n  23 => \':handshake\',\n  24 => \':call:\',\n  25 => \'{:2_25:}\',\n  26 => \'{:2_26:}\',\n  27 => \'{:2_27:}\',\n  28 => \'{:2_28:}\',\n  29 => \'{:2_29:}\',\n  30 => \'{:2_30:}\',\n  31 => \'{:2_31:}\',\n  32 => \'{:2_32:}\',\n  33 => \'{:2_33:}\',\n  34 => \'{:2_34:}\',\n  35 => \'{:2_35:}\',\n  36 => \'{:2_36:}\',\n  37 => \'{:2_37:}\',\n  38 => \'{:2_38:}\',\n  39 => \'{:2_39:}\',\n  40 => \'{:2_40:}\',\n  41 => \'{:3_41:}\',\n  42 => \'{:3_42:}\',\n  43 => \'{:3_43:}\',\n  44 => \'{:3_44:}\',\n  45 => \'{:3_45:}\',\n  46 => \'{:3_46:}\',\n  47 => \'{:3_47:}\',\n  48 => \'{:3_48:}\',\n  49 => \'{:3_49:}\',\n  50 => \'{:3_50:}\',\n  51 => \'{:3_51:}\',\n  52 => \'{:3_52:}\',\n  53 => \'{:3_53:}\',\n  54 => \'{:3_54:}\',\n  55 => \'{:3_55:}\',\n  56 => \'{:3_56:}\',\n  57 => \'{:3_57:}\',\n  58 => \'{:3_58:}\',\n  59 => \'{:3_59:}\',\n  60 => \'{:3_60:}\',\n  61 => \'{:3_61:}\',\n  62 => \'{:3_62:}\',\n  63 => \'{:3_63:}\',\n  64 => \'{:3_64:}\',\n);\n\n'),('domainwhitelist',1,1333532446,0,'$_DCACHE[\'domainwhitelist\'] = array (\n);\n\n'),('fields_required',1,1333532446,0,'$_DCACHE[\'fields_required\'] = array (\n);\n\n'),('fields_optional',1,1333532446,0,'$_DCACHE[\'fields_optional\'] = array (\n);\n\n');
/*!40000 ALTER TABLE `cdb_caches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_creditslog`
--

DROP TABLE IF EXISTS `cdb_creditslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_creditslog` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fromto` char(15) NOT NULL DEFAULT '',
  `sendcredits` tinyint(1) NOT NULL DEFAULT '0',
  `receivecredits` tinyint(1) NOT NULL DEFAULT '0',
  `send` int(10) unsigned NOT NULL DEFAULT '0',
  `receive` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `operation` char(3) NOT NULL DEFAULT '',
  KEY `uid` (`uid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_creditslog`
--

LOCK TABLES `cdb_creditslog` WRITE;
/*!40000 ALTER TABLE `cdb_creditslog` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_creditslog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_crons`
--

DROP TABLE IF EXISTS `cdb_crons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_crons` (
  `cronid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `type` enum('user','system') NOT NULL DEFAULT 'user',
  `name` char(50) NOT NULL DEFAULT '',
  `filename` char(50) NOT NULL DEFAULT '',
  `lastrun` int(10) unsigned NOT NULL DEFAULT '0',
  `nextrun` int(10) unsigned NOT NULL DEFAULT '0',
  `weekday` tinyint(1) NOT NULL DEFAULT '0',
  `day` tinyint(2) NOT NULL DEFAULT '0',
  `hour` tinyint(2) NOT NULL DEFAULT '0',
  `minute` char(36) NOT NULL DEFAULT '',
  PRIMARY KEY (`cronid`),
  KEY `nextrun` (`available`,`nextrun`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_crons`
--

LOCK TABLES `cdb_crons` WRITE;
/*!40000 ALTER TABLE `cdb_crons` DISABLE KEYS */;
INSERT INTO `cdb_crons` VALUES (1,1,'system','清空今日发帖数','todayposts_daily.inc.php',0,1333536045,-1,-1,0,'0'),(2,1,'system','清空本月在线时间','onlinetime_monthly.inc.php',0,1333536045,-1,1,0,'0'),(3,1,'system','每日数据清理','cleanup_daily.inc.php',0,1333536045,-1,-1,5,'30'),(4,1,'system','生日统计与邮件祝福','birthdays_daily.inc.php',0,1333536045,-1,-1,0,'0'),(5,1,'system','主题回复通知','announcements_daily.inc.php',0,1333536045,-1,-1,0,'0'),(6,1,'system','每日公告清理','threadexpiries_hourly.inc.php',0,1333536045,-1,-1,5,'0'),(7,1,'system','限时操作清理','promotions_hourly.inc.php',0,1333536045,-1,-1,0,'00'),(8,1,'system','论坛推广清理','cleanup_monthly.inc.php',0,1333536045,-1,1,6,'00'),(9,1,'system','每月主题清理','magics_daily.inc.php',0,1333536045,-1,-1,0,'0'),(10,1,'system','每日 X-Space更新用户','secqaa_daily.inc.php',0,1333536045,-1,-1,6,'0'),(11,1,'system','每周主题更新','tags_daily.inc.php',0,1333536045,6,-1,6,'0'),(12,1,'system','每日勋章更新','medals_daily.inc.php',0,1333536045,-1,-1,0,'0');
/*!40000 ALTER TABLE `cdb_crons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_debateposts`
--

DROP TABLE IF EXISTS `cdb_debateposts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_debateposts` (
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `stand` tinyint(1) NOT NULL DEFAULT '0',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `voters` mediumint(10) unsigned NOT NULL DEFAULT '0',
  `voterids` text NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `pid` (`pid`,`stand`),
  KEY `tid` (`tid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_debateposts`
--

LOCK TABLES `cdb_debateposts` WRITE;
/*!40000 ALTER TABLE `cdb_debateposts` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_debateposts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_debates`
--

DROP TABLE IF EXISTS `cdb_debates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_debates` (
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `affirmdebaters` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `negadebaters` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `affirmvotes` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `negavotes` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `umpire` varchar(15) NOT NULL DEFAULT '',
  `winner` tinyint(1) NOT NULL DEFAULT '0',
  `bestdebater` varchar(50) NOT NULL DEFAULT '',
  `affirmpoint` text NOT NULL,
  `negapoint` text NOT NULL,
  `umpirepoint` text NOT NULL,
  `affirmvoterids` text NOT NULL,
  `negavoterids` text NOT NULL,
  `affirmreplies` mediumint(8) unsigned NOT NULL,
  `negareplies` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `uid` (`uid`,`starttime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_debates`
--

LOCK TABLES `cdb_debates` WRITE;
/*!40000 ALTER TABLE `cdb_debates` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_debates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_failedlogins`
--

DROP TABLE IF EXISTS `cdb_failedlogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_failedlogins` (
  `ip` char(15) NOT NULL DEFAULT '',
  `count` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_failedlogins`
--

LOCK TABLES `cdb_failedlogins` WRITE;
/*!40000 ALTER TABLE `cdb_failedlogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_failedlogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_faqs`
--

DROP TABLE IF EXISTS `cdb_faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_faqs` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `fpid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `identifier` varchar(20) NOT NULL,
  `keyword` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `displayplay` (`displayorder`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_faqs`
--

LOCK TABLES `cdb_faqs` WRITE;
/*!40000 ALTER TABLE `cdb_faqs` DISABLE KEYS */;
INSERT INTO `cdb_faqs` VALUES (1,0,1,'','','用户须知',''),(2,1,1,'','','我必须要注册吗？','这取决于管理员如何设置 Discuz! 论坛的用户组权限选项，您甚至有可能必须在注册成正式用户后后才能浏览帖子。当然，在通常情况下，您至少应该是正式用户才能发新帖和回复已有帖子。请 <a href=\"register.php\" target=\"_blank\">点击这里</a> 免费注册成为我们的新用户！\r\n<br /><br />强烈建议您注册，这样会得到很多以游客身份无法实现的功能。'),(3,1,2,'login','登录帮助','我如何登录论坛？','如果您已经注册成为该论坛的会员，哪么您只要通过访问页面右上的<a href=\"logging.php?action=login\" target=\"_blank\">登录</a>，进入登陆界面填写正确的用户名和密码（如果您设有安全提问，请选择正确的安全提问并输入对应的答案），点击“提交”即可完成登陆如果您还未注册请点击这里。<br /><br />\r\n如果需要保持登录，请选择相应的 Cookie 时间，在此时间范围内您可以不必输入密码而保持上次的登录状态。'),(4,1,3,'','','忘记我的登录密码，怎么办？','当您忘记了用户登录的密码，您可以通过注册时填写的电子邮箱重新设置一个新的密码。点击登录页面中的 <a href=\"member.php?action=lostpasswd\" target=\"_blank\">取回密码</a>，按照要求填写您的个人信息，系统将自动发送重置密码的邮件到您注册时填写的 Email 信箱中。如果您的 Email 已失效或无法收到信件，请与论坛管理员联系。'),(5,0,2,'','','帖子相关操作',''),(6,0,3,'','','基本功能操作',''),(7,0,4,'','','其他相关问题',''),(8,1,4,'','','我如何使用个性化头像','在<a href=\"memcp.php\" target=\"_blank\">控制面板</a>中的“编辑个人资料”，有一个“头像”的选项，可以使用论坛自带的头像或者自定义的头像。'),(9,1,5,'','','我如何修改登录密码','在<a href=\"memcp.php\" target=\"_blank\">控制面板</a>中的“编辑个人资料”，填写“原密码”，“新密码”，“确认新密码”。点击“提交”，即可修改。'),(10,1,6,'','','我如何使用个性化签名和昵称','在<a href=\"memcp.php\" target=\"_blank\">控制面板</a>中的“编辑个人资料”，有一个“昵称”和“个人签名”的选项，可以在此设置。'),(11,5,1,'','','我如何发表新主题','在论坛版块中，点“新帖”，如果有权限，您可以看到有“投票，悬赏，活动，交易”，点击即可进入功能齐全的发帖界面。\r\n<br /><br />注意：一般论坛都设置为高级别的用户组才能发布这四类特殊主题。如发布普通主题，直接点击“新帖”，当然您也可以使用版块下面的“快速发帖”发表新帖(如果此选项打开)。一般论坛都设置为需要登录后才能发帖。'),(12,5,2,'','','我如何发表回复','回复有分三种：第一、贴子最下方的快速回复； 第二、在您想回复的楼层点击右下方“回复”； 第三、完整回复页面，点击本页“新帖”旁边的“回复”。'),(13,5,3,'','','我如何编辑自己的帖子','在帖子的右下角，有编辑，回复，报告等选项，点击编辑，就可以对帖子进行编辑。'),(14,5,4,'','','我如何出售购买主题','<li>出售主题：\r\n当您进入发贴界面后，如果您所在的用户组有发买卖贴的权限，在“售价(金钱)”后面填写主题的价格，这样其他用户在查看这个帖子的时候就需要进入交费的过程才可以查看帖子。</li>\r\n<li>购买主题：\r\n浏览你准备购买的帖子，在帖子的相关信息的下面有[查看付款记录] [购买主题] [返回上一页] \r\n等链接，点击“购买主题”进行购买。</li>'),(15,5,5,'','','我如何出售购买附件','<li>上传附件一栏有个售价的输入框，填入出售价格即可实现需要支付才可下载附件的功能。</li>\r\n<li>点击帖子中[购买附件]按钮或点击附件的下载链接会跳转至附件购买页面，确认付款的相关信息后点提交按钮，即可得到附件的下载权限。只需购买一次，就有该附件的永远下载权限。</li>'),(16,5,6,'','','我如何上传附件','<li>发表新主题的时候上传附件，步骤为：写完帖子标题和内容后点上传附件右方的浏览，然后在本地选择要上传附件的具体文件名，最后点击发表话题。</li>\r\n<li>发表回复的时候上传附件，步骤为：写完回复楼主的内容，然后点上传附件右方的浏览，找到需要上传的附件，点击发表回复。</li>'),(17,5,7,'','','我如何实现发帖时图文混排效果','<li>发表新主题的时候点击上传附件左侧的“[插入]”链接把附件标记插入到帖子中适当的位置即可。</li>'),(18,5,8,'discuzcode','Discuz!代码','我如何使用Discuz!代码','<table width=\"99%\" cellpadding=\"2\" cellspacing=\"2\">\r\n  <tr>\r\n    <th width=\"50%\">Discuz!代码</th>\r\n    <th width=\"402\">效果</th>\r\n  </tr>\r\n  <tr>\r\n    <td>[b]粗体文字 Abc[/b]</td>\r\n    <td><strong>粗体文字 Abc</strong></td>\r\n  </tr>\r\n  <tr>\r\n    <td>[i]斜体文字 Abc[/i]</td>\r\n    <td><em>斜体文字 Abc</em></td>\r\n  </tr>\r\n  <tr>\r\n    <td>[u]下划线文字 Abc[/u]</td>\r\n    <td><u>下划线文字 Abc</u></td>\r\n  </tr>\r\n  <tr>\r\n    <td>[color=red]红颜色[/color]</td>\r\n    <td><font color=\"red\">红颜色</font></td>\r\n  </tr>\r\n  <tr>\r\n    <td>[size=3]文字大小为 3[/size] </td>\r\n    <td><font size=\"3\">文字大小为 3</font></td>\r\n  </tr>\r\n  <tr>\r\n    <td>[font=仿宋]字体为仿宋[/font] </td>\r\n    <td><font face=\"仿宋\">字体为仿宋</font></td>\r\n  </tr>\r\n  <tr>\r\n    <td>[align=Center]内容居中[/align] </td>\r\n    <td><div align=\"center\">内容居中</div></td>\r\n  </tr>\r\n  <tr>\r\n    <td>[url]http://www.comsenz.com[/url]</td>\r\n    <td><a href=\"http://www.comsenz.com\" target=\"_blank\">http://www.comsenz.com</a>（超级链接）</td>\r\n  </tr>\r\n  <tr>\r\n    <td>[url=http://www.Discuz.net]Discuz! 论坛[/url]</td>\r\n    <td><a href=\"http://www.Discuz.net\" target=\"_blank\">Discuz! 论坛</a>（超级链接）</td>\r\n  </tr>\r\n  <tr>\r\n    <td>[email]myname@mydomain.com[/email]</td>\r\n    <td><a href=\"mailto:myname@mydomain.com\">myname@mydomain.com</a>（E-mail链接）</td>\r\n  </tr>\r\n  <tr>\r\n    <td>[email=support@discuz.net]Discuz! 技术支持[/email]</td>\r\n    <td><a href=\"mailto:support@discuz.net\">Discuz! 技术支持（E-mail链接）</a></td>\r\n  </tr>\r\n  <tr>\r\n    <td>[quote]Discuz! Board 是由康盛创想（北京）科技有限公司开发的论坛软件[/quote] </td>\r\n    <td><div style=\"font-size: 12px\"><br /><br /><div class=\"quote\"><h5>引用:</h5><blockquote>原帖由 <i>admin</i> 于 2006-12-26 08:45 发表<br />Discuz! Board 是由康盛创想（北京）科技有限公司开发的论坛软件</blockquote></div></td>\r\n  </tr>\r\n   <tr>\r\n    <td>[code]Discuz! Board 是由康盛创想（北京）科技有限公司开发的论坛软件[/code] </td>\r\n    <td><div style=\"font-size: 12px\"><br /><br /><div class=\"blockcode\"><h5>代码:</h5><code id=\"code0\">Discuz! Board 是由康盛创想（北京）科技有限公司开发的论坛软件</code></div></td>\r\n  </tr>\r\n  <tr>\r\n    <td>[hide]隐藏内容 Abc[/hide]</td>\r\n    <td>效果:只有当浏览者回复本帖时，才显示其中的内容，否则显示为“<b>**** 隐藏信息 跟帖后才能显示 *****</b>”</td>\r\n  </tr>\r\n  <tr>\r\n    <td>[hide=20]隐藏内容 Abc[/hide]</td>\r\n    <td>效果:只有当浏览者积分高于 20 点时，才显示其中的内容，否则显示为“<b>**** 隐藏信息 积分高于 20 点才能显示 ****</b>”</td>\r\n  </tr>\r\n  <tr>\r\n    <td>[list][*]列表项 #1[*]列表项 #2[*]列表项 #3[/list]</td>\r\n    <td><ul>\r\n      <li>列表项 ＃1</li>\r\n      <li>列表项 ＃2</li>\r\n      <li>列表项 ＃3 </li>\r\n    </ul></td>\r\n  </tr>\r\n  <tr>\r\n    <td>[img]http://www.discuz.net/images/default/logo.gif[/img] </td>\r\n    <td>帖子内显示为：<img src=\"http://www.discuz.net/images/default/logo.gif\" /></td>\r\n  </tr>\r\n  <tr>\r\n    <td>[img=88,31]http://www.discuz.net/images/logo.gif[/img] </td>\r\n    <td>帖子内显示为：<img src=\"http://www.discuz.net/images/logo.gif\" /></td>\r\n  </tr> <tr>\r\n    <td>[media=400,300,1]多媒体 URL[/media]</td>\r\n    <td>帖子内嵌入多媒体，宽 400 高 300 自动播放</td>\r\n  </tr>\r\n <tr>\r\n    <td>[fly]飞行的效果[/fly]</td>\r\n    <td><marquee scrollamount=\"3\" behavior=\"alternate\" width=\"90%\">飞行的效果</marquee></td>\r\n  </tr>\r\n  <tr>\r\n    <td>[flash]Flash网页地址 [/flash] </td>\r\n    <td>帖子内嵌入 Flash 动画</td>\r\n  </tr>\r\n  <tr>\r\n    <td>[qq]123456789[/qq]</td>\r\n    <td>在帖子内显示 QQ 在线状态，点这个图标可以和他（她）聊天</td>\r\n  </tr>\r\n  <tr>\r\n    <td>X[sup]2[/sup]</td>\r\n    <td>X<sup>2</sup></td>\r\n  </tr>\r\n  <tr>\r\n    <td>X[sub]2[/sub]</td>\r\n    <td>X<sub>2</sub></td>\r\n  </tr>\r\n  \r\n</table>'),(19,6,1,'','','我如何使用短消息功能','您登录后，点击导航栏上的短消息按钮，即可进入短消息管理。\r\n点击[发送短消息]按钮，在\"发送到\"后输入收信人的用户名，填写完标题和内容，点提交(或按 Ctrl+Enter 发送)即可发出短消息。\r\n<br /><br />如果要保存到发件箱，以在提交前勾选\"保存到发件箱中\"前的复选框。\r\n<ul>\r\n<li>点击收件箱可打开您的收件箱查看收到的短消息。</li>\r\n<li>点击发件箱可查看保存在发件箱里的短消息。 </li>\r\n<li>点击已发送来查看对方是否已经阅读您的短消息。 </li>\r\n<li>点击搜索短消息就可通过关键字，发信人，收信人，搜索范围，排序类型等一系列条件设定来找到您需要查找的短消息。 </li>\r\n<li>点击导出短消息可以将自己的短消息导出htm文件保存在自己的电脑里。 </li>\r\n<li>点击忽略列表可以设定忽略人员，当这些被添加的忽略用户给您发送短消息时将不予接收。</li>\r\n</ul>'),(20,6,2,'','','我如何向好友群发短消息','登录论坛后，点击短消息，然后点发送短消息，如果有好友的话，好友群发后面点击全选，可以给所有的好友群发短消息。'),(21,6,3,'','','我如何查看论坛会员数据','点击导航栏上面的会员，然后显示的是此论坛的会员数据。注：需要论坛管理员开启允许你查看会员资料才可看到。'),(22,6,4,'','','我如何使用搜索','点击导航栏上面的搜索，输入搜索的关键字并选择一个范围，就可以检索到您有权限访问论坛中的相关的帖子。'),(23,6,5,'','','我如何使用“我的”功能','<li>会员必须首先<a href=\"logging.php?action=login\" target=\"_blank\">登录</a>，没有用户名的请先<a href=\"register.php\" target=\"_blank\">注册</a>；</li>\r\n<li>登录之后在论坛的左上方会出现一个“我的”的超级链接，点击这个链接之后就可进入到有关于您的信息。</li>'),(24,7,1,'','','我如何向管理员报告帖子','打开一个帖子，在帖子的右下角可以看到：“编辑”、“引用”、“报告”、“评分”、“回复”等等几个按钮，点击其中的“报告”按钮进入报告页面，填写好“我的意见”，单击“报告”按钮即可完成报告某个帖子的操作。'),(25,7,2,'','','我如何“打印”，“推荐”，“订阅”，“收藏”帖子','当你浏览一个帖子时，在它的右上角可以看到：“打印”、“推荐”、“订阅”、“收藏”，点击相对应的文字连接即可完成相关的操作。'),(26,7,3,'','','我如何设置论坛好友','设置论坛好友有3种简单的方法。\r\n<ul>\r\n<li>当您浏览帖子的时候可以点击“发表时间”右侧的“加为好友”设置论坛好友。</li>\r\n<li>当您浏览某用户的个人资料时，可以点击头像下方的“加为好友”设置论坛好友。</li>\r\n<li>您也可以在控制面板中的好友列表增加您的论坛好友。</li>\r\n<ul>'),(27,7,4,'','','我如何使用RSS订阅','在论坛的首页和进入版块的页面的右上角就会出现一个rss订阅的小图标<img src=\"images/common/xml.gif\" border=\"0\">，鼠标点击之后将出现本站点的rss地址，你可以将此rss地址放入到你的rss阅读器中进行订阅。'),(28,7,5,'','','我如何清除Cookies','cookie是由浏览器保存在系统内的，在论坛的右下角提供有\"清除 Cookies\"的功能，点击后即可帮您清除系统内存储的Cookies。 <br /><br />\r\n以下介绍3种常用浏览器的Cookies清除方法(注：此方法为清除全部的Cookies,请谨慎使用)\r\n<ul>\r\n<li>Internet Explorer: 工具（选项）内的Internet选项→常规选项卡内，IE6直接可以看到删除Cookies的按钮点击即可，IE7为“浏 览历史记录”选项内的删除点击即可清空Cookies。对于Maxthon,腾讯TT等IE核心浏览器一样适用。 </li>\r\n<li>FireFox:工具→选项→隐私→Cookies→显示Cookie里可以对Cookie进行对应的删除操作。 </li>\r\n<li>Opera:工具→首选项→高级→Cookies→管理Cookies即可对Cookies进行删除的操作。</li>\r\n</ul>'),(29,7,6,'','','我如何联系管理员','您可以通过论坛底部右下角的“联系我们”链接快速的发送邮件与我们联系。也可以通过管理团队中的用户资料发送短消息给我们。'),(30,7,7,'','','我如何开通个人空间','如果您有权限开通“我的个人空间”，当用户登录论坛以后在论坛首页，用户名的右方点击开通我的个人空间，进入个人空间的申请页面。'),(31,7,8,'','','我如何将自己的主题加入个人空间','如果您有权限开通“我的个人空间”，在您发表的主题上方点击“加入个人空间”，您发表的主题以及回复都会加入到您空间的日志里。'),(32,5,9,'smilies','表情','我如何使用表情代码','表情是一些用字符表示的表情符号，如果打开表情功能，Discuz! 会把一些符号转换成小图像，显示在帖子中，更加美观明了。目前支持下面这些表情：<br /><br />\r\n<table cellspacing=\"0\" cellpadding=\"4\" width=\"30%\" align=\"center\">\r\n<tr><th width=\"25%\" align=\"center\">表情符号</td>\r\n<th width=\"75%\" align=\"center\">对应图像</td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:)</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/smile.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:(</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/sad.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:D</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/biggrin.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:\\\'(</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/cry.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:@</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/huffy.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:o</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/shocked.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:P</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/tongue.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:$</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/shy.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">;P</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/titter.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:L</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/sweat.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:Q</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/mad.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:lol</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/lol.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:hug:</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/hug.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:victory:</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/victory.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:time:</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/time.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:kiss:</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/kiss.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:handshake</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/handshake.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:call:</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/call.gif\" alt=\"\" /></td>\r\n</tr>\r\n</table>\r\n</div></div>\r\n<br />'),(33,0,5,'','','论坛高级功能使用',''),(34,33,0,'forwardmessagelist','','论坛快速跳转关键字列表','Discuz! 支持自定义快速跳转页面，当某些操作完成后，可以不显示提示信息，直接跳转到新的页面，从而方便用户进行下一步操作，避免等待。 在实际使用当中，您根据需要，把关键字添加到快速跳转设置里面(后台 -- 基本设置 --  界面与显示方式 -- [<a href=\"admincp.php?action=settings&operation=styles&frames=yes\" target=\"_blank\">提示信息跳转设置</a> ])，让某些信息不显示而实现快速跳转。以下是 Discuz! 当中的一些常用信息的关键字:\r\n</br></br>\r\n\r\n<table width=\"99%\" cellpadding=\"2\" cellspacing=\"2\">\r\n  <tr>\r\n    <td width=\"50%\">关键字</td>\r\n    <td width=\"50%\">提示信息页面或者作用</td>\r\n  </tr>\r\n  <tr>\r\n    <td>login_succeed</td>\r\n    <td>登录成功</td>\r\n  </tr>\r\n  <tr>\r\n    <td>logout_succeed</td>\r\n    <td>退出登录成功</td>\r\n  </tr>\r\n    <tr>\r\n    <td>thread_poll_succeed</td>\r\n    <td>投票成功</td>\r\n  </tr>\r\n    <tr>\r\n    <td>thread_rate_succeed</td>\r\n    <td>评分成功</td>\r\n  </tr>\r\n    <tr>\r\n    <td>register_succeed</td>\r\n    <td>注册成功</td>\r\n  </tr>\r\n    <tr>\r\n    <td>usergroups_join_succeed</td>\r\n    <td>加入扩展组成功</td>\r\n  </tr>\r\n    <tr>\r\n    <td height=\"22\">usergroups_exit_succeed</td>\r\n    <td>退出扩展组成功</td>\r\n  </tr>\r\n  <tr>\r\n    <td>usergroups_update_succeed</td>\r\n    <td>更新扩展组成功</td>\r\n  </tr>\r\n    <tr>\r\n    <td>buddy_update_succeed</td>\r\n    <td>好友更新成功</td>\r\n  </tr>\r\n    <tr>\r\n    <td>post_edit_succeed</td>\r\n    <td>编辑帖子成功</td>\r\n  </tr>\r\n    <tr>\r\n    <td>post_edit_delete_succeed</td>\r\n    <td>删除帖子成功</td>\r\n  </tr>\r\n    <tr>\r\n    <td>post_reply_succeed</td>\r\n    <td>回复成功</td>\r\n  </tr>\r\n    <tr>\r\n    <td>post_newthread_succeed</td>\r\n    <td>发表新主题成功</td>\r\n  </tr>\r\n    <tr>\r\n    <td>post_reply_blog_succeed</td>\r\n    <td>文集评论发表成功</td>\r\n  </tr>\r\n    <tr>\r\n    <td>post_newthread_blog_succeed</td>\r\n    <td>blog 发表成功</td>\r\n  </tr>\r\n    <tr>\r\n    <td>profile_avatar_succeed</td>\r\n    <td>头像设置成功</td>\r\n  </tr>\r\n    <tr>\r\n    <td>profile_succeed</td>\r\n    <td>个人资料更新成功</td>\r\n  </tr>\r\n    <tr>\r\n    <td>pm_send_succeed</td>\r\n    <td>短消息发送成功</td>\r\n  </tr>\r\n  </tr>\r\n    <tr>\r\n    <td>pm_delete_succeed</td>\r\n    <td>短消息删除成功</td>\r\n  </tr>\r\n  </tr>\r\n    <tr>\r\n    <td>pm_ignore_succeed</td>\r\n    <td>短消息忽略列表更新</td>\r\n  </tr>\r\n    <tr>\r\n    <td>admin_succeed</td>\r\n    <td>管理操作成功〔注意：设置此关键字后，所有管理操作完毕都将直接跳转〕</td>\r\n  </tr>\r\n    <tr>\r\n    <td>admin_succeed_next&nbsp;</td>\r\n    <td>管理成功并将跳转到下一个管理动作</td>\r\n  </tr> \r\n    <tr>\r\n    <td>search_redirect</td>\r\n    <td>搜索完成，进入搜索结果列表</td>\r\n  </tr>\r\n</table>');
/*!40000 ALTER TABLE `cdb_faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_favoriteforums`
--

DROP TABLE IF EXISTS `cdb_favoriteforums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_favoriteforums` (
  `fid` smallint(6) NOT NULL DEFAULT '0',
  `uid` mediumint(8) NOT NULL DEFAULT '0',
  `dateline` int(10) NOT NULL DEFAULT '0',
  `newthreads` mediumint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_favoriteforums`
--

LOCK TABLES `cdb_favoriteforums` WRITE;
/*!40000 ALTER TABLE `cdb_favoriteforums` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_favoriteforums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_favorites`
--

DROP TABLE IF EXISTS `cdb_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_favorites` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fid` smallint(6) unsigned NOT NULL DEFAULT '0',
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_favorites`
--

LOCK TABLES `cdb_favorites` WRITE;
/*!40000 ALTER TABLE `cdb_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_favoritethreads`
--

DROP TABLE IF EXISTS `cdb_favoritethreads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_favoritethreads` (
  `tid` mediumint(8) NOT NULL DEFAULT '0',
  `uid` mediumint(8) NOT NULL DEFAULT '0',
  `dateline` int(10) NOT NULL DEFAULT '0',
  `newreplies` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_favoritethreads`
--

LOCK TABLES `cdb_favoritethreads` WRITE;
/*!40000 ALTER TABLE `cdb_favoritethreads` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_favoritethreads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_feeds`
--

DROP TABLE IF EXISTS `cdb_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_feeds` (
  `feed_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT 'default',
  `fid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `sortid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `appid` varchar(30) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  `template` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`feed_id`),
  KEY `type` (`type`),
  KEY `dateline` (`dateline`),
  KEY `uid` (`uid`),
  KEY `appid` (`appid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_feeds`
--

LOCK TABLES `cdb_feeds` WRITE;
/*!40000 ALTER TABLE `cdb_feeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_forumfields`
--

DROP TABLE IF EXISTS `cdb_forumfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_forumfields` (
  `fid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `password` varchar(12) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `postcredits` varchar(255) NOT NULL DEFAULT '',
  `replycredits` varchar(255) NOT NULL DEFAULT '',
  `getattachcredits` varchar(255) NOT NULL DEFAULT '',
  `postattachcredits` varchar(255) NOT NULL DEFAULT '',
  `digestcredits` varchar(255) NOT NULL DEFAULT '',
  `redirect` varchar(255) NOT NULL DEFAULT '',
  `attachextensions` varchar(255) NOT NULL DEFAULT '',
  `formulaperm` text NOT NULL,
  `moderators` text NOT NULL,
  `rules` text NOT NULL,
  `threadtypes` text NOT NULL,
  `threadsorts` text NOT NULL,
  `viewperm` text NOT NULL,
  `postperm` text NOT NULL,
  `replyperm` text NOT NULL,
  `getattachperm` text NOT NULL,
  `postattachperm` text NOT NULL,
  `keywords` text NOT NULL,
  `supe_pushsetting` text NOT NULL,
  `modrecommend` text NOT NULL,
  `tradetypes` text NOT NULL,
  `typemodels` mediumtext NOT NULL,
  `threadplugin` text NOT NULL,
  `extra` text NOT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_forumfields`
--

LOCK TABLES `cdb_forumfields` WRITE;
/*!40000 ALTER TABLE `cdb_forumfields` DISABLE KEYS */;
INSERT INTO `cdb_forumfields` VALUES (1,'','','','','','','','','','','','','','','','','','','','','','','','','','',''),(2,'','','','','','','','','','','','','','','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `cdb_forumfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_forumlinks`
--

DROP TABLE IF EXISTS `cdb_forumlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_forumlinks` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `logo` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_forumlinks`
--

LOCK TABLES `cdb_forumlinks` WRITE;
/*!40000 ALTER TABLE `cdb_forumlinks` DISABLE KEYS */;
INSERT INTO `cdb_forumlinks` VALUES (1,0,'Discuz! 官方论坛','http://www.discuz.net','提供最新 Discuz! 产品新闻、软件下载与技术交流','images/logo.gif');
/*!40000 ALTER TABLE `cdb_forumlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_forumrecommend`
--

DROP TABLE IF EXISTS `cdb_forumrecommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_forumrecommend` (
  `fid` smallint(6) unsigned NOT NULL,
  `tid` mediumint(8) unsigned NOT NULL,
  `typeid` smallint(6) NOT NULL,
  `displayorder` tinyint(1) NOT NULL,
  `subject` char(80) NOT NULL,
  `author` char(15) NOT NULL,
  `authorid` mediumint(8) NOT NULL,
  `moderatorid` mediumint(8) NOT NULL,
  `expiration` int(10) unsigned NOT NULL,
  `position` tinyint(1) NOT NULL DEFAULT '0',
  `highlight` tinyint(1) NOT NULL DEFAULT '0',
  `aid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `filename` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`tid`),
  KEY `displayorder` (`fid`,`displayorder`),
  KEY `position` (`position`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_forumrecommend`
--

LOCK TABLES `cdb_forumrecommend` WRITE;
/*!40000 ALTER TABLE `cdb_forumrecommend` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_forumrecommend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_forums`
--

DROP TABLE IF EXISTS `cdb_forums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_forums` (
  `fid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `fup` smallint(6) unsigned NOT NULL DEFAULT '0',
  `type` enum('group','forum','sub') NOT NULL DEFAULT 'forum',
  `name` char(50) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `displayorder` smallint(6) NOT NULL DEFAULT '0',
  `styleid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `threads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `todayposts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lastpost` char(110) NOT NULL DEFAULT '',
  `allowsmilies` tinyint(1) NOT NULL DEFAULT '0',
  `allowhtml` tinyint(1) NOT NULL DEFAULT '0',
  `allowbbcode` tinyint(1) NOT NULL DEFAULT '0',
  `allowimgcode` tinyint(1) NOT NULL DEFAULT '0',
  `allowmediacode` tinyint(1) NOT NULL DEFAULT '0',
  `allowanonymous` tinyint(1) NOT NULL DEFAULT '0',
  `allowshare` tinyint(1) NOT NULL DEFAULT '0',
  `allowpostspecial` smallint(6) unsigned NOT NULL DEFAULT '0',
  `allowspecialonly` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `alloweditrules` tinyint(1) NOT NULL DEFAULT '0',
  `allowfeed` tinyint(1) NOT NULL DEFAULT '1',
  `recyclebin` tinyint(1) NOT NULL DEFAULT '0',
  `modnewposts` tinyint(1) NOT NULL DEFAULT '0',
  `jammer` tinyint(1) NOT NULL DEFAULT '0',
  `disablewatermark` tinyint(1) NOT NULL DEFAULT '0',
  `inheritedmod` tinyint(1) NOT NULL DEFAULT '0',
  `autoclose` smallint(6) NOT NULL DEFAULT '0',
  `forumcolumns` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `threadcaches` tinyint(1) NOT NULL DEFAULT '0',
  `alloweditpost` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `simple` tinyint(1) unsigned NOT NULL,
  `modworks` tinyint(1) unsigned NOT NULL,
  `allowtag` tinyint(1) NOT NULL DEFAULT '1',
  `allowglobalstick` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`fid`),
  KEY `forum` (`status`,`type`,`displayorder`),
  KEY `fup` (`fup`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_forums`
--

LOCK TABLES `cdb_forums` WRITE;
/*!40000 ALTER TABLE `cdb_forums` DISABLE KEYS */;
INSERT INTO `cdb_forums` VALUES (1,0,'group','Discuz!',1,0,0,0,0,0,'',0,0,1,1,1,0,1,63,0,0,1,0,0,0,0,0,0,0,0,1,0,0,1,1),(2,1,'forum','默认版块',1,0,0,13,13,0,'13	7.2新增功能及功能强化	1333532445	admin',1,0,1,1,1,0,1,63,0,0,1,0,0,0,0,0,0,0,0,1,0,0,1,1);
/*!40000 ALTER TABLE `cdb_forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_imagetypes`
--

DROP TABLE IF EXISTS `cdb_imagetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_imagetypes` (
  `typeid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `name` char(20) NOT NULL,
  `type` enum('smiley','icon','avatar') NOT NULL DEFAULT 'smiley',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `directory` char(100) NOT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_imagetypes`
--

LOCK TABLES `cdb_imagetypes` WRITE;
/*!40000 ALTER TABLE `cdb_imagetypes` DISABLE KEYS */;
INSERT INTO `cdb_imagetypes` VALUES (1,1,'默认','smiley',1,'default'),(2,1,'酷猴','smiley',2,'coolmonkey'),(3,1,'呆呆男','smiley',3,'grapeman');
/*!40000 ALTER TABLE `cdb_imagetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_invites`
--

DROP TABLE IF EXISTS `cdb_invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_invites` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  `inviteip` char(15) NOT NULL,
  `invitecode` char(16) NOT NULL,
  `reguid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `regdateline` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  KEY `uid` (`uid`,`status`),
  KEY `invitecode` (`invitecode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_invites`
--

LOCK TABLES `cdb_invites` WRITE;
/*!40000 ALTER TABLE `cdb_invites` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_itempool`
--

DROP TABLE IF EXISTS `cdb_itempool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_itempool` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL,
  `question` text NOT NULL,
  `answer` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_itempool`
--

LOCK TABLES `cdb_itempool` WRITE;
/*!40000 ALTER TABLE `cdb_itempool` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_itempool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_magiclog`
--

DROP TABLE IF EXISTS `cdb_magiclog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_magiclog` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `magicid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `action` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `amount` smallint(6) unsigned NOT NULL DEFAULT '0',
  `price` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `targettid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `targetpid` int(10) unsigned NOT NULL DEFAULT '0',
  `targetuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  KEY `uid` (`uid`,`dateline`),
  KEY `targetuid` (`targetuid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_magiclog`
--

LOCK TABLES `cdb_magiclog` WRITE;
/*!40000 ALTER TABLE `cdb_magiclog` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_magiclog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_magicmarket`
--

DROP TABLE IF EXISTS `cdb_magicmarket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_magicmarket` (
  `mid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `magicid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL,
  `price` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mid`),
  KEY `num` (`magicid`,`num`),
  KEY `price` (`magicid`,`price`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_magicmarket`
--

LOCK TABLES `cdb_magicmarket` WRITE;
/*!40000 ALTER TABLE `cdb_magicmarket` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_magicmarket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_magics`
--

DROP TABLE IF EXISTS `cdb_magics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_magics` (
  `magicid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `type` tinyint(3) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `identifier` varchar(40) NOT NULL,
  `description` varchar(255) NOT NULL,
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `price` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num` smallint(6) unsigned NOT NULL DEFAULT '0',
  `salevolume` smallint(6) unsigned NOT NULL DEFAULT '0',
  `supplytype` tinyint(1) NOT NULL DEFAULT '0',
  `supplynum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `weight` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `recommend` tinyint(1) NOT NULL DEFAULT '0',
  `filename` varchar(50) NOT NULL,
  `magicperm` text NOT NULL,
  PRIMARY KEY (`magicid`),
  UNIQUE KEY `identifier` (`identifier`),
  KEY `displayorder` (`available`,`displayorder`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_magics`
--

LOCK TABLES `cdb_magics` WRITE;
/*!40000 ALTER TABLE `cdb_magics` DISABLE KEYS */;
INSERT INTO `cdb_magics` VALUES (1,1,1,'变色卡','CCK','可以变换主题的颜色,并保存24小时',0,10,999,0,0,0,20,0,'magic_color.inc.php',''),(2,1,3,'金钱卡','MOK','可以随机获得一些金币',0,10,999,0,0,0,30,0,'magic_money.inc.php',''),(3,1,1,'IP卡','SEK','可以查看帖子作者的IP',0,15,999,0,0,0,30,0,'magic_see.inc.php',''),(4,1,1,'提升卡','UPK','可以提升某个主题',0,10,999,0,0,0,30,0,'magic_up.inc.php',''),(5,1,1,'置顶卡','TOK','可以将主题置顶24小时',0,20,999,0,0,0,40,0,'magic_top.inc.php',''),(6,1,1,'悔悟卡','REK','可以删除自己的帖子',0,10,999,0,0,0,30,0,'magic_del.inc.php',''),(7,1,2,'狗仔卡','RTK','查看某个用户是否在线',0,15,999,0,0,0,30,0,'magic_reporter.inc.php',''),(8,1,1,'沉默卡','CLK','24小时内不能回复',0,15,999,0,0,0,30,0,'magic_close.inc.php',''),(9,1,1,'喧嚣卡','OPK','使贴子可以回复',0,15,999,0,0,0,30,0,'magic_open.inc.php',''),(10,1,1,'隐身卡','YSK','可以将自己的帖子匿名',0,20,999,0,0,0,30,0,'magic_hidden.inc.php',''),(11,1,1,'恢复卡','CBK','将匿名恢复为正常显示的用户名,匿名终结者',0,15,999,0,0,0,20,0,'magic_renew.inc.php',''),(12,1,1,'移动卡','MVK','可将自已的帖子移动到其他版面（隐含、特殊限定版面除外）',0,50,989,0,0,0,50,0,'magic_move.inc.php','');
/*!40000 ALTER TABLE `cdb_magics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_medallog`
--

DROP TABLE IF EXISTS `cdb_medallog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_medallog` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `medalid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `status` (`status`,`expiration`),
  KEY `uid` (`uid`,`medalid`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_medallog`
--

LOCK TABLES `cdb_medallog` WRITE;
/*!40000 ALTER TABLE `cdb_medallog` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_medallog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_medals`
--

DROP TABLE IF EXISTS `cdb_medals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_medals` (
  `medalid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  `expiration` smallint(6) unsigned NOT NULL DEFAULT '0',
  `permission` mediumtext NOT NULL,
  PRIMARY KEY (`medalid`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_medals`
--

LOCK TABLES `cdb_medals` WRITE;
/*!40000 ALTER TABLE `cdb_medals` DISABLE KEYS */;
INSERT INTO `cdb_medals` VALUES (1,'Medal No.1',0,'medal1.gif',0,0,'',0,''),(2,'Medal No.2',0,'medal2.gif',0,0,'',0,''),(3,'Medal No.3',0,'medal3.gif',0,0,'',0,''),(4,'Medal No.4',0,'medal4.gif',0,0,'',0,''),(5,'Medal No.5',0,'medal5.gif',0,0,'',0,''),(6,'Medal No.6',0,'medal6.gif',0,0,'',0,''),(7,'Medal No.7',0,'medal7.gif',0,0,'',0,''),(8,'Medal No.8',0,'medal8.gif',0,0,'',0,''),(9,'Medal No.9',0,'medal9.gif',0,0,'',0,''),(10,'Medal No.10',0,'medal10.gif',0,0,'',0,'');
/*!40000 ALTER TABLE `cdb_medals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_memberfields`
--

DROP TABLE IF EXISTS `cdb_memberfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_memberfields` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `nickname` varchar(30) NOT NULL DEFAULT '',
  `site` varchar(75) NOT NULL DEFAULT '',
  `alipay` varchar(50) NOT NULL DEFAULT '',
  `icq` varchar(12) NOT NULL DEFAULT '',
  `qq` varchar(12) NOT NULL DEFAULT '',
  `yahoo` varchar(40) NOT NULL DEFAULT '',
  `msn` varchar(100) NOT NULL DEFAULT '',
  `taobao` varchar(40) NOT NULL DEFAULT '',
  `location` varchar(30) NOT NULL DEFAULT '',
  `customstatus` varchar(30) NOT NULL DEFAULT '',
  `medals` text NOT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `avatarwidth` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `avatarheight` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `bio` text NOT NULL,
  `sightml` text NOT NULL,
  `ignorepm` text NOT NULL,
  `groupterms` text NOT NULL,
  `authstr` varchar(20) NOT NULL DEFAULT '',
  `spacename` varchar(40) NOT NULL,
  `buyercredit` smallint(6) NOT NULL DEFAULT '0',
  `sellercredit` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_memberfields`
--

LOCK TABLES `cdb_memberfields` WRITE;
/*!40000 ALTER TABLE `cdb_memberfields` DISABLE KEYS */;
INSERT INTO `cdb_memberfields` VALUES (1,'','','','','','','','','','','','',0,0,'','','','','','',0,0);
/*!40000 ALTER TABLE `cdb_memberfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_membermagics`
--

DROP TABLE IF EXISTS `cdb_membermagics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_membermagics` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `magicid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `num` smallint(6) unsigned NOT NULL DEFAULT '0',
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_membermagics`
--

LOCK TABLES `cdb_membermagics` WRITE;
/*!40000 ALTER TABLE `cdb_membermagics` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_membermagics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_memberrecommend`
--

DROP TABLE IF EXISTS `cdb_memberrecommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_memberrecommend` (
  `tid` mediumint(8) unsigned NOT NULL,
  `recommenduid` mediumint(8) unsigned NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  KEY `tid` (`tid`),
  KEY `uid` (`recommenduid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_memberrecommend`
--

LOCK TABLES `cdb_memberrecommend` WRITE;
/*!40000 ALTER TABLE `cdb_memberrecommend` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_memberrecommend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_members`
--

DROP TABLE IF EXISTS `cdb_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_members` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(15) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `secques` char(8) NOT NULL DEFAULT '',
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `adminid` tinyint(1) NOT NULL DEFAULT '0',
  `groupid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `groupexpiry` int(10) unsigned NOT NULL DEFAULT '0',
  `extgroupids` char(20) NOT NULL DEFAULT '',
  `regip` char(15) NOT NULL DEFAULT '',
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` char(15) NOT NULL DEFAULT '',
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `lastactivity` int(10) unsigned NOT NULL DEFAULT '0',
  `lastpost` int(10) unsigned NOT NULL DEFAULT '0',
  `posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `threads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `digestposts` smallint(6) unsigned NOT NULL DEFAULT '0',
  `oltime` smallint(6) unsigned NOT NULL DEFAULT '0',
  `pageviews` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `credits` int(10) NOT NULL DEFAULT '0',
  `extcredits1` int(10) NOT NULL DEFAULT '0',
  `extcredits2` int(10) NOT NULL DEFAULT '0',
  `extcredits3` int(10) NOT NULL DEFAULT '0',
  `extcredits4` int(10) NOT NULL DEFAULT '0',
  `extcredits5` int(10) NOT NULL DEFAULT '0',
  `extcredits6` int(10) NOT NULL DEFAULT '0',
  `extcredits7` int(10) NOT NULL DEFAULT '0',
  `extcredits8` int(10) NOT NULL DEFAULT '0',
  `email` char(40) NOT NULL DEFAULT '',
  `bday` date NOT NULL DEFAULT '0000-00-00',
  `sigstatus` tinyint(1) NOT NULL DEFAULT '0',
  `tpp` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ppp` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `styleid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `dateformat` tinyint(1) NOT NULL DEFAULT '0',
  `timeformat` tinyint(1) NOT NULL DEFAULT '0',
  `pmsound` tinyint(1) NOT NULL DEFAULT '0',
  `showemail` tinyint(1) NOT NULL DEFAULT '0',
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `invisible` tinyint(1) NOT NULL DEFAULT '0',
  `timeoffset` char(4) NOT NULL DEFAULT '',
  `prompt` tinyint(1) NOT NULL DEFAULT '0',
  `accessmasks` tinyint(1) NOT NULL DEFAULT '0',
  `editormode` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `customshow` tinyint(1) unsigned NOT NULL DEFAULT '26',
  `xspacestatus` tinyint(1) NOT NULL DEFAULT '0',
  `customaddfeed` tinyint(1) NOT NULL DEFAULT '0',
  `newbietaskid` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `groupid` (`groupid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_members`
--

LOCK TABLES `cdb_members` WRITE;
/*!40000 ALTER TABLE `cdb_members` DISABLE KEYS */;
INSERT INTO `cdb_members` VALUES (1,'admin','410789e146593b60a3349378900ed92e','',0,1,1,0,'','hidden',1333532445,'',1333532445,0,1333532445,13,13,0,0,0,0,0,0,0,0,0,0,0,0,'admin@your.com','0000-00-00',0,0,0,0,0,0,0,1,1,0,'9999',0,0,2,26,0,0,0);
/*!40000 ALTER TABLE `cdb_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_memberspaces`
--

DROP TABLE IF EXISTS `cdb_memberspaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_memberspaces` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `style` char(20) NOT NULL,
  `description` char(100) NOT NULL,
  `layout` char(200) NOT NULL,
  `side` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_memberspaces`
--

LOCK TABLES `cdb_memberspaces` WRITE;
/*!40000 ALTER TABLE `cdb_memberspaces` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_memberspaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_moderators`
--

DROP TABLE IF EXISTS `cdb_moderators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_moderators` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `inherited` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_moderators`
--

LOCK TABLES `cdb_moderators` WRITE;
/*!40000 ALTER TABLE `cdb_moderators` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_moderators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_modworks`
--

DROP TABLE IF EXISTS `cdb_modworks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_modworks` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `modaction` char(3) NOT NULL DEFAULT '',
  `dateline` date NOT NULL DEFAULT '2006-01-01',
  `count` smallint(6) unsigned NOT NULL DEFAULT '0',
  `posts` smallint(6) unsigned NOT NULL DEFAULT '0',
  KEY `uid` (`uid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_modworks`
--

LOCK TABLES `cdb_modworks` WRITE;
/*!40000 ALTER TABLE `cdb_modworks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_modworks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_mytasks`
--

DROP TABLE IF EXISTS `cdb_mytasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_mytasks` (
  `uid` mediumint(8) unsigned NOT NULL,
  `username` char(15) NOT NULL DEFAULT '',
  `taskid` smallint(6) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `csc` char(255) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`taskid`),
  KEY `parter` (`taskid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_mytasks`
--

LOCK TABLES `cdb_mytasks` WRITE;
/*!40000 ALTER TABLE `cdb_mytasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_mytasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_navs`
--

DROP TABLE IF EXISTS `cdb_navs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_navs` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `name` char(50) NOT NULL,
  `title` char(255) NOT NULL,
  `url` char(255) NOT NULL,
  `target` tinyint(1) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL,
  `highlight` tinyint(1) NOT NULL DEFAULT '0',
  `level` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_navs`
--

LOCK TABLES `cdb_navs` WRITE;
/*!40000 ALTER TABLE `cdb_navs` DISABLE KEYS */;
INSERT INTO `cdb_navs` VALUES (1,0,'论坛','','#',0,0,1,1,0,0),(2,0,'搜索','','search.php',0,0,1,2,0,0),(3,0,'插件','','#',0,0,1,4,0,0),(4,0,'帮助','','faq.php',0,0,1,5,0,0),(5,0,'导航','','#',0,0,1,6,0,0);
/*!40000 ALTER TABLE `cdb_navs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_onlinelist`
--

DROP TABLE IF EXISTS `cdb_onlinelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_onlinelist` (
  `groupid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `title` varchar(30) NOT NULL DEFAULT '',
  `url` varchar(30) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_onlinelist`
--

LOCK TABLES `cdb_onlinelist` WRITE;
/*!40000 ALTER TABLE `cdb_onlinelist` DISABLE KEYS */;
INSERT INTO `cdb_onlinelist` VALUES (1,1,'管理员','online_admin.gif'),(2,2,'超级版主','online_supermod.gif'),(3,3,'版主','online_moderator.gif'),(0,4,'会员','online_member.gif');
/*!40000 ALTER TABLE `cdb_onlinelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_onlinetime`
--

DROP TABLE IF EXISTS `cdb_onlinetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_onlinetime` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `thismonth` smallint(6) unsigned NOT NULL DEFAULT '0',
  `total` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_onlinetime`
--

LOCK TABLES `cdb_onlinetime` WRITE;
/*!40000 ALTER TABLE `cdb_onlinetime` DISABLE KEYS */;
INSERT INTO `cdb_onlinetime` VALUES (1,10,60,1170601084);
/*!40000 ALTER TABLE `cdb_onlinetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_orders`
--

DROP TABLE IF EXISTS `cdb_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_orders` (
  `orderid` char(32) NOT NULL DEFAULT '',
  `status` char(3) NOT NULL DEFAULT '',
  `buyer` char(50) NOT NULL DEFAULT '',
  `admin` char(15) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `amount` int(10) unsigned NOT NULL DEFAULT '0',
  `price` float(7,2) unsigned NOT NULL DEFAULT '0.00',
  `submitdate` int(10) unsigned NOT NULL DEFAULT '0',
  `confirmdate` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `orderid` (`orderid`),
  KEY `submitdate` (`submitdate`),
  KEY `uid` (`uid`,`submitdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_orders`
--

LOCK TABLES `cdb_orders` WRITE;
/*!40000 ALTER TABLE `cdb_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_paymentlog`
--

DROP TABLE IF EXISTS `cdb_paymentlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_paymentlog` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `amount` int(10) unsigned NOT NULL DEFAULT '0',
  `netamount` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`,`uid`),
  KEY `uid` (`uid`),
  KEY `authorid` (`authorid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_paymentlog`
--

LOCK TABLES `cdb_paymentlog` WRITE;
/*!40000 ALTER TABLE `cdb_paymentlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_paymentlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_pluginhooks`
--

DROP TABLE IF EXISTS `cdb_pluginhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_pluginhooks` (
  `pluginhookid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pluginid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `code` mediumtext NOT NULL,
  PRIMARY KEY (`pluginhookid`),
  KEY `pluginid` (`pluginid`),
  KEY `available` (`available`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_pluginhooks`
--

LOCK TABLES `cdb_pluginhooks` WRITE;
/*!40000 ALTER TABLE `cdb_pluginhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_pluginhooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_plugins`
--

DROP TABLE IF EXISTS `cdb_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_plugins` (
  `pluginid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `adminid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL DEFAULT '',
  `identifier` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `datatables` varchar(255) NOT NULL DEFAULT '',
  `directory` varchar(100) NOT NULL DEFAULT '',
  `copyright` varchar(100) NOT NULL DEFAULT '',
  `modules` text NOT NULL,
  `version` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`pluginid`),
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_plugins`
--

LOCK TABLES `cdb_plugins` WRITE;
/*!40000 ALTER TABLE `cdb_plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_pluginvars`
--

DROP TABLE IF EXISTS `cdb_pluginvars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_pluginvars` (
  `pluginvarid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pluginid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `variable` varchar(40) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT 'text',
  `value` text NOT NULL,
  `extra` text NOT NULL,
  PRIMARY KEY (`pluginvarid`),
  KEY `pluginid` (`pluginid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_pluginvars`
--

LOCK TABLES `cdb_pluginvars` WRITE;
/*!40000 ALTER TABLE `cdb_pluginvars` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_pluginvars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_polloptions`
--

DROP TABLE IF EXISTS `cdb_polloptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_polloptions` (
  `polloptionid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `votes` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `polloption` varchar(80) NOT NULL DEFAULT '',
  `voterids` mediumtext NOT NULL,
  PRIMARY KEY (`polloptionid`),
  KEY `tid` (`tid`,`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_polloptions`
--

LOCK TABLES `cdb_polloptions` WRITE;
/*!40000 ALTER TABLE `cdb_polloptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_polloptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_polls`
--

DROP TABLE IF EXISTS `cdb_polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_polls` (
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `overt` tinyint(1) NOT NULL DEFAULT '0',
  `multiple` tinyint(1) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `maxchoices` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_polls`
--

LOCK TABLES `cdb_polls` WRITE;
/*!40000 ALTER TABLE `cdb_polls` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_postposition`
--

DROP TABLE IF EXISTS `cdb_postposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_postposition` (
  `tid` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tid`,`position`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_postposition`
--

LOCK TABLES `cdb_postposition` WRITE;
/*!40000 ALTER TABLE `cdb_postposition` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_postposition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_posts`
--

DROP TABLE IF EXISTS `cdb_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_posts` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `first` tinyint(1) NOT NULL DEFAULT '0',
  `author` varchar(15) NOT NULL DEFAULT '',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(80) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `message` mediumtext NOT NULL,
  `useip` varchar(15) NOT NULL DEFAULT '',
  `invisible` tinyint(1) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `usesig` tinyint(1) NOT NULL DEFAULT '0',
  `htmlon` tinyint(1) NOT NULL DEFAULT '0',
  `bbcodeoff` tinyint(1) NOT NULL DEFAULT '0',
  `smileyoff` tinyint(1) NOT NULL DEFAULT '0',
  `parseurloff` tinyint(1) NOT NULL DEFAULT '0',
  `attachment` tinyint(1) NOT NULL DEFAULT '0',
  `rate` smallint(6) NOT NULL DEFAULT '0',
  `ratetimes` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`),
  KEY `fid` (`fid`),
  KEY `authorid` (`authorid`),
  KEY `dateline` (`dateline`),
  KEY `invisible` (`invisible`),
  KEY `displayorder` (`tid`,`invisible`,`dateline`),
  KEY `first` (`tid`,`first`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_posts`
--

LOCK TABLES `cdb_posts` WRITE;
/*!40000 ALTER TABLE `cdb_posts` DISABLE KEYS */;
INSERT INTO `cdb_posts` VALUES (1,2,1,1,'admin',1,'论坛运营秘籍 - Discuz! 7.2 新功能的妙用 ',1333532445,'\r\nDiscuz! 7.2 新推出的几个功能，都是围绕着提高论坛的互动性而设计的，好好利用这些新功能，对于提高论坛用户粘性，增强会员之间的互动性，大有脾益。下面我们来说说，如何根据论坛的实际情况，来合理的设置这些新功能。[p=30, 2, left]\r\n[b][size=4]一、论坛动态和首页显示风格[/size][/b] [/p][p=30, 2, left]\r\n[b]设计目标：[/b] [/p]\r\n通过对论坛事件展示方式的优化，增强论坛信息的传递功能，提高论坛会员之间的沟通效率。[b]设置指导：[/b]\r\n很多人喜欢 UCHome 中好友动态功能，Discuz! 将这一功能引入论坛系统，通过指定条件产生论坛动态消息，促进会员之间互动的产生。各项目的值应该根据当前论坛运营状况仔细斟酌而定。 例如：论坛日发帖量在100以上的，设置【主题回复数达到一定值发送动态】时可以如下设置 “10, 30, 80”  ，这样当主题被回复了10次，30次，80次的时候都在论坛动态页产生一个动态消息。日发帖量在1000以上的论坛，就可以设置“30，100，200”。总结起来论坛小，活跃用户少，日发帖量不大，那么应该将各项目的阈值调低，这样让论坛动态更容易产生。相反，论坛大，活跃用户多，日发帖量很大，那么应该将各项目的阈值调高，避免论坛动态泛滥，影响用户体验。\r\n\r\n\r\n[img]http://faq.comsenz.com/attachments/2009/10/26_200910091741481w8rg.thumb.jpg[/img]\r\n\r\n论坛首页支持两种显示风格了：一种是传统的论坛版块列表的形式，这种形式历史悠久，被广大用户所熟悉，版块就像一本书的目录，用户可以根据版块来快速的确定自己感兴趣的话题在什么地方；第二种论坛首页形式就是7.2新推出的论坛动态，在这种形式下，论坛内的各种事件动态信息都汇集到论坛动态列表中，比如某人发的主题回复数超过1000了，某某的帖子被版主评为精华了等等。这种以事件为核心，动态信息为表现的形式，可以大大加强论坛用户之间的互动性，信息流动起来了，互动性就更容易产生，更能突出一个真实“社区”的感觉。\r\n在这里特别提醒一下，刚开始运营不久的论坛，往往内容不够充实，人气不旺，也就产生不了高质量的论坛动态信息，因此短期内不宜设置首页风格为：论坛实时动态。\r\n\r\n\r\n[img]http://faq.comsenz.com/attachments/2009/10/26_200910091742581Wdb4.png[/img][p=30, 2, left]\r\n[b][size=4]二、基于主题热度和评价的主题推荐方式[/size][/b] [/p][p=30, 2, left]\r\n[b]设计目标：[/b] [/p]\r\n以前版本中的版主推荐或者被广泛采用的首页四格插件等功能都是为了达到同一个目的：让论坛的各种“热闹”或者精华信息被更多的用户更加容易的看到，促使他们参与其中。 但以前的方式由于对论坛的帖子没有一个统一标准的评价系统，因此不管采用那种信息提取方式，都会不够精准。因此 Discuz! 引入了主题热度的概念，让论坛用户广泛的参与到论坛内容的评价中来。让论坛热闹和精华信息的提取和展现变得更加准确，更加方便。\r\n[b]设置指导：[/b]\r\n【[url=http://faq.comsenz.com/viewnews-851]主题热度[/url]】会影响主题在主题列表显示时标题后图标的显示(如图)，主题的热度根据回复数、评价值等参量根据一定算法计算得到。当热度值达到设定的显示级别如50，100，200 时，在主题列表中主题的标题后会显示对应级别的图标，来表示该主题的热门程度。站长应该根据站点当前运营情况来设定这些值，一般推荐的方案是保证主题列表中，热门主题和普通主题的比例在 1:7 左右。\r\n\r\n[img]http://faq.comsenz.com/attachments/2009/10/26_200910091749011stPk.png[/img]\r\n\r\n【[url=http://faq.comsenz.com/viewnews-851]主题评价[/url]】功能通过收集用户对主题的评价，来计算评价图标的显示级别，当达到设定的级别阈值时，在主题列表中显示主题标题后的对应级别的推荐图标。用户可以再后台设置主题评价的词语 例如加分操作和减分操作分别设置为“顶”“踩”或者“支持”“鄙视”等，发挥想象力，让用户更有兴趣参与到对主题的评价中来。\r\n\r\n[img]http://faq.comsenz.com/attachments/2009/10/26_20091009174901250VL.png[/img]\r\n\r\n【[url=http://faq.comsenz.com/viewnews-854]论坛热点[/url]】是根据主题热度来选取一部分热点主题展示在首页，由于选取的主题热度高，参与性强，加之显示在首页所以能好的促进论坛气氛的活跃。但是新站开启论坛热点的效果不会很好，因为新站主题少，人气少，提取出来的热点准确性就会大打折扣。等有一定人气基础，出来的热点才是真正的热点。一般推荐的方式是：左边放置图片展示，右边设置 10 至 14 个推荐主题。\r\n\r\n[url=http://faq.comsenz.com/attachments/2009/10/26_200910091744121xhVg.png][img=644,186]http://faq.comsenz.com/attachments/2009/10/26_200910091744121xhVg.png[/img][/url]\r\n\r\n【[url=http://faq.comsenz.com/viewnews-852]推荐主题[/url]】功能通过自动或手动方式从论坛数据中提取一些主题作为系统推荐的主题，这些主题一般为论坛里内容精彩、用户参与度高的话题。推荐主题的数量应设置合理，太多则让人眼花缭乱，太少则不美观。数据缓存时间也要设置得当，该值设置太大则数据长时间不更新，造成吸引力下降，设置太小频繁更新缓存又会增加服务器负担。根据设置推荐的主题可以显示在主题列表页，也可以显示在主题查看页（如图）。一般来讲和版块话题主旨符合程度高，帖子内容普适程度高的主题适合显示在主题列表页，帖子内容新颖，话题性强则更适合显示到主题查看页。\r\n\r\n[img]http://faq.comsenz.com/attachments/2009/10/26_200910091759431vD2J.png[/img]\r\n[url=http://faq.comsenz.com/attachments/2009/10/26_200910091759432UPgA.png][img=644,459]http://faq.comsenz.com/attachments/2009/10/26_200910091759432UPgA.png[/img][/url]\r\n[p=30, 2, left]\r\n[b][size=4]三、服务老用户不忘照顾新用户[/size][/b][/p]\r\n\r\n[b]设计目标：[/b]\r\n随着互联网的发展，论坛用户群体越来越广泛，很多人没有多少上网或电脑使用经验，他们成为论坛的用户后往往不知道自己能在论坛做些什么，通过新手任务功能，在向导的指引下，让这些用户很快的掌握论坛基本操作，不再对论坛感到陌生，尽快的参与到论坛的各种活动当中。\r\n[b]设置指导：[/b]\r\n建议站长在进行【[url=http://faq.comsenz.com/viewnews-853]新手任务[/url]】的设置时认真考虑任务奖励类型和具体的奖励量值。一般来讲，同时使用多种奖励形式(论坛已设定开启【道具】和【勋章】功能)更能激励新手们把所有新手任务做完。对积分的设置也要拉开层次，不要所有任务的奖励都奖励相同的积分量值。站长也可以修改任务描述，用更友好、更具吸引力的语言来描述任务，提高用户对完成任务的兴趣。下面是一些建议：\r\n\r\n  任务一的任务名可以写“学习回帖” ，奖励10个金钱 。任务二的任务名写成“开始我的第一次”，奖励一种道具。 任务三的任务名写成“与众不同”，奖励一枚勋章。\r\n   站长应该根据自己站点用户群特征来决定开启哪些新手任务项目，例如用户群主要为上网时间不长，对发帖回帖操作尚不熟悉的用户，那么就开启学习回帖，发表主题等比较初级的任务。如果用户群为已经有一定上网经验，对论坛常规的发帖回帖操作已经比较熟悉，那么就可以只开启修改个人资料，修改头像等比较高级的任务。\r\n[color=#ff0000]备注： 文中的功能名以\"【功能名称】\" 形式标注 ，例如：【[/color][url=http://faq.comsenz.com/viewnews-853][color=#ff0000]新手任务[/color][/url][color=#ff0000]】 点击功能名称的链接，可以查看该功能的使用说明。[/color]','',0,0,0,0,0,0,0,0,0,0,0),(2,2,2,1,'admin',1,'Discuz! 7.2 新功能－－站长推荐 ',1333532445,'\r\nDiscuz! 7.2 新增站长推荐功能，管理员可以设置一部分帖子为“站长推荐”，被设置为“站长推荐”的这些帖子就会在帖子内容页面右下角以浮动窗口的形式展示给浏览者，如果有多个主题被设置为“站长推荐”则随机轮流显示。\r\n站长推荐可以理解为一个全局主题推荐，管理员可以将一些版块重要信息，比如通知、公告等设置为站长推荐，以保证更多的用户可以浏览到，或者还可以在此加入广告帖进行赢利，一个功能多种用法，各位站长可以根据自身情况设置和使用。\r\n“站长推荐”在后台的设置位置为：Discuz! 7.2 后台 => 广告 => 站长推荐\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909271722051W2zR.gif[/img][p=30, 2, left]一、设置站长推荐[/p]\r\n可以在此设置站长推荐区域标题，默认为“站长推荐”，您可以设置为您希望的标题：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909271722052Ji2X.gif[/img][p=30, 2, left]二、添加站长推荐[/p]\r\n添加热点话题有三种方式：手动添加、添加主题、自动添加。[p=30, 2, left]1、手动添加[/p]\r\n上图界面中点击“添加”，在弹出的下拉框中我们点击“手动添加”：\r\n\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909271722053xvtI.gif[/img]\r\n\r\n\r\n\r\n输入“推荐链接地址”、“推荐标题”、“推荐内容”和“附加图片”，然后“提交”即可手动添加一条站长推荐。\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909271722054Fae6.gif[/img]\r\n上图界面中点击“提交”则该帖子成功被设置为“站长推荐”：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909271722055tNdh.gif[/img]\r\n返回前台进入帖子内容页在右下角就可以看到我们刚才设置的该站长推荐：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909271722056CKUJ.gif[/img]\r\n[b]2、添加主题[/b]\r\n后台“站长推荐”点击“添加”，在弹出的下拉框中我们点击“添加主题”：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909271722057gPEE.gif[/img]\r\n输入帖子地址后点击“获取帖子内容”则可以获取到该帖子的标题和帖子内容摘要：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909271722058BY2H.gif[/img]\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909271722059Fwkt.gif[/img]\r\n提交即可成功添加该主题为站长推荐信息。\r\n[p=30, 2, left]3、自动添加[/p]\r\n后台“站长推荐”点击“添加”，在弹出的下拉框中我们点击“自动添加”：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_2009092717220510PAXX.gif[/img]\r\n系统将自动推荐 10 个主题作为站长推荐候选，自动推荐的原则的获取站点所有版主的推荐主题，如果版主推荐主题不足 10 个则有几个自动推荐几个。\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909081525058gOVO.gif[/img]\r\n管理员可以在此选择哪些推荐主题设置为站长推荐，选中推荐主题前面的多选框，“提交”即可。[p=30, 2, left]二、管理站长推荐[/p]\r\n所有被设置为站长推荐和曾经设置为站长推荐的主题都会在此显示，管理员可以在此设置一些主题为站长推荐也可以取消其站长推荐的身份，还可以编辑这些主题，或者将这些主题删除出站长推荐。\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_2009092717220511ZOHp.gif[/img][p=30, 2, left]三、前台显示[/p]\r\n我们来看看站长推荐在前台的显示效果，打开随便一篇帖子内容页，在右下角我们可以看到一个浮动窗口，这个就是站长推荐的显示界面：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_2009092717220512QfsZ.gif[/img]\r\n在该浮动窗口中点击帖子标题、内容摘要，或者右下角的“查看”链接都可以进入该帖子内容页查看详情。\r\n看到这里相信大家已经清楚了该功能的实际用途和使用方法，那么，赶快体验吧！','',0,0,0,0,0,0,0,0,0,0,0),(3,2,3,1,'admin',1,'论坛热点：在第一眼就留住用户 ',1333532445,'\r\n让社区论坛在第一眼就留住用户，需要及时的把热点事件传递给用户，在第一时间把最受会员欢迎的主题资源展示出来，才能够最大限度的提高论坛的互动性，增加社区的黏着度。\r\nDiscuz! 7.2新增的论坛热点功能，能够很好的满足主题聚焦的应用需求。该功能可以将社区中最抢眼的主题合显示到论坛首页的头部，方便用户快速在论坛中浏览热点信息。论坛热点的设置和 Discuz! 的其它功能一操作非常简单，只需要以管理员身份到后台简单开启即可。\r\n\r\n我们截图来看一下开启后的效果：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909110951061nyw4.gif[/img]\r\n下面我们来说一下后台的开启方法：\r\n进入 Discuz! 7.2 后台 => 界面 => 界面设置 => 首页设置：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909271530271hxkL.gif[/img]\r\n上图界面我们可以看到“论坛热点”开启选择，我们选择“是”来设置各项显示条件：\r\n[img]http://faq.comsenz.com/attachments/2009/10/9_2009101616230316I1M.gif[/img]\r\n论坛热点：是/否，设置是否显示全论坛的论坛热点主题。\r\n论坛热点显示数量：设置论坛热点条目数，默认值 10 条。\r\n论坛热点更新周期（秒）：设置论坛热点在多长时间更新一次，默认值 900 。\r\n论坛热点图片大小：设置首页论坛热点图片的大小，默认值 100*70 。\r\n论坛热点内容截取文字长度：设置论坛热点内容的文字长度，默认值 200 个字。\r\n如此设置后的效果如图开篇第一个图片所示，需要注意的是，这里设置的“论坛热点显示数量”为 10 仅指右侧不包含图片的热点主题，不包含左侧的带图片主题。\r\n论坛热点的显示结构为：\r\n左侧一列调用带图片的主题热度最高一条主题及其图片缩略图、主题内容摘要及其发布时间和作者；\r\n右侧调用主题热度最高的 10 条不带图片的主题，按照主题热度从高到低排序，前面 2 条显示主题标题、作者及其内容摘要，后面的 8 条之显示主题标题。\r\n到此论坛热点的开启和效果展示为大家讲解完毕了，怎么样，这个功能是不是很吸引你，还等什么，赶快安装最新版 Discuz! 7.2 或者将您的论坛升级到 Discuz! 7.2 来体验吧！','',0,0,0,0,0,0,0,0,0,0,0),(4,2,4,1,'admin',1,'Discuz! 7.2新特性－－主题热度/评价',1333532445,'\r\nDiscuz!7.2 在对主题的操作上添加了新特性，即主题热度和主题评价。\r\n主题热度，用户可以对主题进行回复、评价等操作，这些操作都会增加主题热度，当主题达到一定得热度时，会显示热度图标；\r\n主题评价，用户可以对某主题评价，以表达自己的观点态度；当主题所得的评价指数达到后台设置的指数级别时，会显示评价图标；\r\n这两项新特性都大大提高了用户浏览的效率，更是增加了热度高或评价高主题的浏览次数。\r\n下面请看详细介绍：[p=30, 2, left][b]一、主题热度[/b][/p]\r\n主题热度是 Discuz!7.2 新增的特性，站长可以在后台设置主题热度值及热度增加权重值。当某个主题达到站点设置的热度时，会在主题列表页标题右侧显示热度图标，大大提高热度主题的浏览次数。\r\n1、后台设置\r\n论坛后台 => 全局 => 论坛功能 => 主题热度，如下图：\r\n[img]http://faq.comsenz.com/attachments/2009/09/15_200909271400321aEXX.gif[/img]\r\n回复增量权重：每次回复主题时，主题热度的增量，默认值为 5 。\r\n评价增量权重：每次对主题进行评价操作时，主题热度的增量，默认为 3 。\r\n热门主题显示级别：设置主题列表页主题热度的级别对应热度值。每个级别都有相应的热度图标，共有三个级别。级别热度值间用逗号分隔。留空为不显示热度图标。\r\n设置完毕后，点击“提交”按钮完成设置。\r\n设置完成后，到前台主题列表页刷新，达到热度值的主题前会显示主题热度图标：\r\n[url=http://faq.comsenz.com/attachments/2009/09/15_200909081603201rueN.gif][img=644,171]http://faq.comsenz.com/attachments/2009/09/15_200909081603201rueN.gif[/img][/url]\r\n2、根据主题热度来排序浏览\r\n用户可以根据主题热度来对主题列表排序浏览，打开主题列表页：\r\n[img]http://faq.comsenz.com/attachments/2009/09/15_200909081603202zliR.gif[/img][p=30, 2, left][b]二、主题评价[/b][/p]\r\n主题评价是 Discuz!7.2 新增的特性，后台有是否开启该功能的开关，并且站长可以在后台设置评价图标显示级别。\r\n1、后台设置\r\n论坛后台 => 全局 => 论坛功能 => 主题评价，如下图：\r\n[img]http://faq.comsenz.com/attachments/2009/09/15_200909271400351aw5h.gif[/img]\r\n[img]http://faq.comsenz.com/attachments/2009/09/15_200909271400371JFAt.gif[/img]\r\n[img]http://faq.comsenz.com/attachments/2009/09/15_200909271400401hrE4.gif[/img]\r\n启用主题评价：选择“是”，打开主题评价功能。\r\n加分操作文字：设置评价加分项的表达文字，建议设置的简单明了，而且不宜过长；默认每评价一次加 1 个评价积分。\r\n减分操作文字：设置评价减分项的表达文字，建议设置的简单明了，而且不宜过长；默认每评价一次减 1 个评价积分。\r\n默认显示数值：设置在帖子内容页默认显示的评价结果数值，用户点击可切换。\r\n每 24 小时评价主体次数：设置用户每 24 小时可以评价多少篇主题，0 或留空为不限制。\r\n是否允许评价自己的帖子：设置是否允许评价自己的主题，评价自己的主题无积分奖励。\r\n评价图标显示级别：设置主题列表页评价图标每一级别对应的评价指数。建议为 3 个级别，每个级别的评价指数请用逗号分隔。\r\n设置好，点击“提交”完成设置。\r\n2、前台评价主题\r\n在前台浏览主题内容时，您会看到如下图：\r\n[img]http://faq.comsenz.com/attachments/2009/09/15_200909081605032M3vn.gif[/img]\r\n当主题的评价指数达到后台设置的指数级别时，在主题列表页将会显示对应级别的评价图标：\r\n[url=http://faq.comsenz.com/attachments/2009/09/15_200909081605033D2LF.gif][img=644,201]http://faq.comsenz.com/attachments/2009/09/15_200909081605033D2LF.gif[/img][/url]\r\n评价图标更直观地告诉该用户主题的评价，因此会大大增加评价高主题的浏览次数。\r\n至此，主题热度和主题评价已经说明完毕，赶紧去体验下吧！','',0,0,0,0,0,0,0,0,0,0,0),(5,2,5,1,'admin',1,'Discuz! 7.2 新特性－－推荐主题',1333532445,'D\r\nDiscuz!7.2 版本完善了推荐主题功能：推荐主题时可以修改主题标题、并有选择性地推荐主题中的图片等，用户体验有了很大的提高。\r\n下面请看详细介绍：[p=30, 2, left][b]一、后台开启推荐主题的权限[/b][/p]\r\n论坛后台 => 版块 => 版块管理 => 编辑，即可看到下图所示：\r\n[img]http://faq.comsenz.com/attachments/2009/09/15_200909081607261Sfhr.gif[/img]\r\n选择推荐主题的方式及其他设置：\r\n[img]http://faq.comsenz.com/attachments/2009/09/15_200909081607391e0B1.gif[/img]\r\n[img]http://faq.comsenz.com/attachments/2009/09/15_200909081607392ZKwm.gif[/img]\r\n设置好后，点击“提交”完成推荐主题的后台设置。[p=30, 2, left][b]二、前台推荐主题[/b][/p]\r\n有推荐权限的用户在前台可以推荐某个主题，如图：\r\n[url=http://faq.comsenz.com/attachments/2009/09/15_200909081607393hITH.gif][img=644,131]http://faq.comsenz.com/attachments/2009/09/15_200909081607393hITH.gif[/img][/url]\r\n推荐主题设置：\r\n[img]http://faq.comsenz.com/attachments/2009/09/15_200909081607394uMLw.gif[/img]\r\n被推荐的主题，可以在帖子列表页顶部看到：\r\n[img]http://faq.comsenz.com/attachments/2009/09/15_200909081607395MQ0W.gif[/img]\r\n到此为止，推荐主题功能已经讲解完毕，赶紧去体验下吧！','',0,0,0,0,0,0,0,0,0,0,0),(6,2,6,1,'admin',1,'Discuz! 7.2 新特性－－新手任务',1333532445,'\r\nDiscuz!7.2 在论坛任务方面有所改进，系统有针对性地自带了 7 个新手任务，无需站长添加。新注册用户将自动申请该任务，此功能可用于防止恶意注册及恶意灌水，或引导新手快速熟悉论坛。\r\n下面请看详细介绍：[p=30, 2, left][b]一、后台启用[/b][/p]\r\n系统自带的 7 个新手任务，在后台都有开关，您可以启用或关闭任务。\r\n论坛后台 => 扩展 => 论坛任务，如下图：\r\n[url=http://faq.comsenz.com/attachments/2009/09/15_200909081610241JZg0.gif][img=644,436]http://faq.comsenz.com/attachments/2009/09/15_200909081610241JZg0.gif[/img][/url]\r\n是否开启论坛任务：选择“是”开启论坛任务；如果选择“否”，那么下面的设置都是不起作用的。\r\n可用：勾选表示该任务可用，用户注册后会自动申请该任务。如果不勾选，表示不可用，用户注册后，不会看到该任务。[p=30, 2, left][b]二、编辑新手任务[/b][/p]\r\n您可以点击任务后的“编辑”来编辑该任务的一些信息，如图：\r\n[img]http://faq.comsenz.com/attachments/2009/09/15_200909081610341n8AY.gif[/img]\r\n编辑好点击“提交”完成编辑。[p=30, 2, left][b]三、新手前台执行任务[/b][/p]\r\n用户注册后，登录前台，即可看到新手任务的提示，如图：\r\n[img]http://faq.comsenz.com/attachments/2009/09/15_200909081610343KZDL.gif[/img]\r\n新手每完成一个任务，就会得到相应的奖励。\r\n至此，新手任务已经讲解完毕，赶紧去体验下吧！','',0,0,0,0,0,0,0,0,0,0,0),(7,2,7,1,'admin',1,'主题关注：让论坛帖子动起来',1333532445,'\r\n用户在社区论坛中的核心应用是有效信息的获取。当用户在“逛”论坛的时候，发现了一个很感兴趣的话题往往需要一定的时间成本。如果用户翻到一个帖子，主题内容和里面的回复都很有意思，这时候用户肯定还想即时了解到帖子的发展情况。有了“主题关注”功能，可以很方便的实现主题信息的互动，只需要用户把这个值得关注的主题标记为关注状态，其他会员回复该主题时，用户就可以收到一个交互性的通知，只需要鼠标轻轻一点，就会看到所关注的主题中有哪些“志同道合”者的回复了。让论坛帖子内容互动起来，是不是会有不一样感觉呢？\r\n“主题关注”不仅是社区论坛功能细节上的实现，更是在尊重网络社区用户阅读习惯的基础之上的设计理念创新。用户盲无目的的去浏览帖子内容很容易形成阅读疲劳，“主题关注”可以轻松的把用户关心的主题信息主动的展示给用户，让用户的有效信息获取更加精准高效。\r\n下面介绍一下会员如何使用主题关注功能：[p=30, 2, left][b]一、关注主题[/b][/p]\r\n要将一个主题设为被关注状态有以下三种方法：\r\n1、发布新主题时\r\n在发表主题的时候，点击“发表话题”按钮右侧的“更多选项”，然后在“发帖选项”里选中“关注主题”的复选框\r\n[img]http://faq.comsenz.com/attachments/2009/10/42_2009102816100010TeM.gif[/img]\r\n[img]http://faq.comsenz.com/attachments/2009/10/42_200910281610002EHJ8.gif[/img]\r\n2、看贴时\r\n点击主题内容下方的 “收藏”图标，在弹出的窗口中点击“关注此主题的最新回复”\r\n[img]http://faq.comsenz.com/attachments/2009/10/42_200910281610003BVqH.gif[/img]\r\n[p=30, 2, left][b]二、查看被关注的主题[/b][/p]\r\n1、关注信息提示\r\n当您所关注的主题有新的回复时，您将在页面顶部看到如下提示，您可以通过点击通知里的关注提示查看被关注主题的最新回复\r\n[img]http://faq.comsenz.com/attachments/2009/10/42_200910281613191ND3i.gif[/img]\r\n2、在“个人中心”的“我的关注”中查看关注列表。\r\n在关注列表中，您可以选择查看正在关注的“有新回复的主题”或者“全部主题”\r\n[img]http://faq.comsenz.com/attachments/2009/10/42_200910281615301xugz.gif[/img]\r\n[img]http://faq.comsenz.com/attachments/2009/10/42_200910281618341SGvP.gif[/img][p=30, 2, left][b]三、取消关注主题[/b][/p]\r\n1、在编辑帖子或回复帖子时，在高级模式下勾选“取消对此主题新回复的关注”复选框，这样此主题将不再处于被关注状态\r\n[img]http://faq.comsenz.com/attachments/2009/10/42_200910281629011crqU.gif[/img]\r\n2、在二（2）的关注列表中选择需要取消关注的主题并点击“提交”按钮，如此操作将使得选中主题不再处于被关注状态\r\n[img]http://faq.comsenz.com/attachments/2009/10/42_200910281632171Yb4d.gif[/img]\r\n此外，站点的管理员除了可以和普通会员一样使用主题关注功能外，还可以在系统设置中对会员的主题关注列表容量进行控制，具体操作如下：\r\n系统设置 => 全局 => 用户权限 => 主题关注列表容量\r\n[img]http://faq.comsenz.com/attachments/2009/10/42_200910281635481Z6XD.gif[/img]','',0,0,0,0,0,0,0,0,0,0,0),(8,2,8,1,'admin',1,'Discuz! 7.2 新特性－－论坛动态',1333532445,'Discuz! 7.2 增加了论坛动态实时浏览功能，用户除了浏览原来的版块列表界面外还可以切换到“论坛动态”里面查看论坛实时动态，此功能类似于 SNS 的动态查看功能，可以集中查看到所有好友的动态信息，而无需进入好友个人主页查看。\r\n[img]http://faq.comsenz.com/attachments/2009/10/9_2009100915323019jA5.gif[/img]\r\n站长可以在 Discuz! 7.2 后台设置论坛首页的默认显示风格，进入 Discuz! 7.2 系统设置 => 界面 => 界面设置 => 首页设置 => 首页显示风格：\r\n[img]http://faq.comsenz.com/attachments/2009/10/9_200910091532302Z0N9.gif[/img]\r\n经典版块列表：即论坛版块列表展示模式，也就是老版本的 Discuz! 的展示效果。\r\n论坛实时动态：即 Discuz! 7.2 新增的动态实时查看功能，用户可以在此集中查看到所有好友的动态信息。\r\n如果站长希望站点所有用户登录 Discuz! 后看到是其好友的动态信息，那么在这里就可以选择首页的默认显示风格为“论坛实时动态”，效果如下图所示：\r\n[img]http://faq.comsenz.com/attachments/2009/10/9_200910091532303yDV1.gif[/img]\r\n怎么样，是不是很方便？赶快安装全新的 Discuz! 7.2 或者升级您的论坛体验一下吧！','',0,0,0,0,0,0,0,0,0,0,0),(9,2,9,1,'admin',1,'Discuz! 7.2 新特性－－提醒系统',1333532445,'Discuz! 7.2 新增了提醒系统，提醒内容包括“全部”、“系统信息”、“好友信息”、“帖子信息”。上述这些信息主要有新信息则就会在导航的“提醒”那里出现新信息提示，如下图所示：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909291118351ebXv.gif[/img]\r\n鼠标放到“提醒”上就可以看到收到的信息内容。\r\n点击“提醒”即可进入提醒系统界面：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909291118352Km5p.gif[/img]\r\n提醒系统首页是全部信息展示，分类浏览可以点击其他的信息类别进行浏览。\r\n系统信息：包括管理操作提醒、道具赠送提醒、任务提醒、积分提醒等。\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909291118353g4uE.gif[/img]\r\n好友信息：添加好友的提醒。\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909291118354wCOX.gif[/img]\r\n帖子信息：主题关注相关提醒。\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909291118355XZp5.gif[/img]\r\nDiscuz! 7.2 提醒系统更加细化了各个操作带来的信息提醒，一目了然的分类，使用和浏览信息更加清晰明确。','',0,0,0,0,0,0,0,0,0,0,0),(10,2,10,1,'admin',1,'帖子编辑器：轻轻松松发帖',1333532445,'帖子主题的展示是社区论坛的核心功能。会员在发表或回复帖子时，用到的就多就是编辑器功能，很多站长苦恼于会员发帖时排版很乱而无法解决。一款专业编辑器不仅需发有人性化的界面，更需要能够帮助用户更好的对帖子内容进行编辑，让社区论坛主题的排版更加专业和多样化。\r\n分析会员的使用习惯，Discuz! 7.2 的编辑器有了很大的改进，界面更友好，突出显示常用操作图标，并且新增了很多功能。\r\n新增删除线和分割线标签，让您的帖子格式更加丰富多彩；插入图片可以设置宽高；音乐播放支持 mp3 wma ra rm ram midwav 等多种格式；视频播放支持 wmv rm rmvb flv swf avi asf mpg mpeg mov等多种格式；视频可以自动分析优酷、土豆、ku6三大主流视频网站的视频网址；附件上传、修改、删除等操作整合到编辑器中；附件上传机制改进，同时上传多个附件时如果有上传失败的，不影响已经成功上传的。\r\nDiscuz! 7.2 前台 => 发帖，即可进入全新的 Discuz! 7.2 编辑器：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909271441261E3fW.gif[/img]\r\n从上图界面可以看出，Discuz! 7.2 的编辑器有了很大的改观，突出显示目前社区比较常用的表情、图片、音乐、视频、Flash、代码、引用，界面更加友好。\r\n下面介绍几个新增功能：[p=30, 2, left][b]1、新增删除线和分割线标签[/b][/p]\r\n新增删除线和分割线标签，让您的帖子格式更加丰富多彩。\r\n如下图所示我们为“节省天光”几个字添加“删除线”：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909071737197EwOi.gif[/img]\r\n设置后的效果如下图所示：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909071737198xEI5.gif[/img]\r\n同理添加分割线：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909071737199TrYW.gif[/img]\r\n添加后的效果：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_2009090717371910v6WE.gif[/img][p=30, 2, left][b]2、插入图片可以设置宽高[/b][/p]\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_2009090717371911dvfs.gif[/img][p=30, 2, left][b]3、音乐播放支持 mp3 wma ra rm ram mid wav 等多种格式[/b][/p]\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_2009090717371912wMUt.gif[/img]\r\n插入的音乐代码类似：\r\n[audio]http://vfile.home.news.cn/music/public/vd06/200908/18/50/MUfs06200908181354375150fd99.mp3[/audio]\r\n播放效果：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_2009090717371913aJ2z.gif[/img][p=30, 2, left][b]4、视频功能更强大[/b][/p]\r\n视频播放支持 wmv rm rmvb flv swf avi asf mpg mpeg mov 等多种格式\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_2009090717371914Ad5B.gif[/img]\r\n插入的视频代码类似：\r\n[media=wmv,400,300]http://w4180.s11.mydiscuz.com/Alizee_lais la bonita.wmv[/media]\r\n发布后的效果：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_2009090717371915G371.gif[/img]\r\n视频还可以自动分析优酷、土豆、ku6 三大主流视频网站的视频网址：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_2009090717371916vS5U.gif[/img]\r\n插入的视频代码类似：\r\n[media=swf,400,300]http://player.youku.com/player.php/sid/XMTA3OTE4NjIw/v.swf[/media]\r\n发布后的效果：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_20090907173719177BxG.gif[/img][p=30, 2, left][b]5、编辑器里上传附件[/b][/p]\r\n附件上传、修改、删除等操作整合到编辑器中；附件上传机制改进，同时上传多个附件时如果有上传失败的，不影响已经成功上传的。\r\n批量上传：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_20090907173719182BAP.gif[/img]\r\n普通上传：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_2009090717371919zovp.gif[/img]\r\n附件列表：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_2009090717371920TWNz.gif[/img]\r\n到此 Discuz! 7.2 最新编辑器介绍完了，怎么样？是不是超酷炫！而且使用起来更加得心应手，那么还等什么，赶快体验吧！\r\n\r\n论坛运营秘籍 - Discuz!7.2 新功能的妙用：[url=http://faq.comsenz.com/viewnews-869]http://faq.comsenz.com/viewnews-869[/url]\r\n[p=30, 2, left][img]http://faq.comsenz.com/attachments/2009/09/9_200909071737196ENcW.gif[/img][/p]','',0,0,0,0,0,0,0,0,0,0,0),(11,2,11,1,'admin',1,'转发视频：更易更强大',1333532445,'Discuz! 7.2 在视频播放方面有了很大改进，不但支持播放 wmv rm rmvb flv swf avi asf mpgmpeg mov 等多种格式，还可以自动分析优酷、土豆、ku6三大主流视频网站的视频网址，而不需要再去找专门的转发引用地址，使得转发视频变得更容易更强大，下面为大家举例演示这三大主流视频网站的视频转发功能。\r\nDiscuz! 7.2 前台 => 发帖，即可进入全新 Discuz! 7.2 编辑器：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909271441261E3fW.gif[/img]\r\n下面我们从优酷、土豆、ku6 三大主流视频网站分别找一个视频地址：\r\n优酷：[url=http://v.youku.com/v_show/id_XOTMwODQ2NjQ=.html]http://v.youku.com/v_show/id_XOTMwODQ2NjQ=.html[/url]\r\n土豆：[url=http://www.tudou.com/programs/view/4NgBn7J39bg/]http://www.tudou.com/programs/view/4NgBn7J39bg/[/url]\r\nku6 ：[url=http://v.ku6.com/show/VrLuttrXQb1CIbkC.html]http://v.ku6.com/show/VrLuttrXQb1CIbkC.html[/url]\r\n将上面三个地址分别插入视频，如图所示：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909111355583f0Ft.gif[/img]\r\n插入后的代码如下图所示：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909111355584BDQP.gif[/img]\r\n提交发布后的效果如下图所示：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909111355585XszF.gif[/img]\r\n从上面的演示可以看出来，Discuz! 7.2 发布优酷、土豆、ku6 三大主流视频网站的视频变得非常容易，无需再费力找论坛引用地址，直接输入视频的网址系统就会自动解析获取最终的播放地址，还等什么，快快来亲身体验一把吧！','',0,0,0,0,0,0,0,0,0,0,0),(12,2,12,1,'admin',1,'Discuz!7.2 新特性－－Manyou应用的开启',1333532445,'\r\nDiscuz!7.2 较之前的版本，在后台添加了 Manyou 应用的开关。做为插件的形式，站长可以在后台开启或关闭该功能。开启该功能后，会员在论坛也可以看到 Manyou 应用的动态信息及大家都在玩什么应用游戏，同时还可以参与进来。\r\n下面请看详细介绍：\r\n[b]一、安装 Manyou 插件并开启[/b]\r\n\r\n论坛后台 => 插件 => 论坛插件，如图：\r\n\r\n[url=http://faq.comsenz.com/attachments/2009/09/15_200909271430221otXN.gif][img=644,233]http://faq.comsenz.com/attachments/2009/09/15_200909271430221otXN.gif[/img][/url]\r\n安装后，请启用该插件，如图：\r\n[img]http://faq.comsenz.com/attachments/2009/09/15_200909271432211ofuE.gif[/img][p=30, 2, left][b]二、开启 Manyou 应用[/b][/p]\r\n论坛后台 => 插件 => Manyou：\r\n[url=http://faq.comsenz.com/attachments/2009/09/15_200909101753151btyX.gif][img=644,440]http://faq.comsenz.com/attachments/2009/09/15_200909101753151btyX.gif[/img][/url]\r\n点击“设置”：\r\n[url=http://faq.comsenz.com/attachments/2009/09/15_2009091017533510KUl.gif][img]http://faq.comsenz.com/attachments/2009/09/15_2009091017533510KUl.gif[/img][/url]\r\n点击“MYOP 应用管理”：\r\n[url=http://faq.comsenz.com/attachments/2009/09/15_20090910175335228pj.gif][img=644,228]http://faq.comsenz.com/attachments/2009/09/15_20090910175335228pj.gif[/img][/url]\r\n点击“启用服务”：\r\n[img]http://faq.comsenz.com/attachments/2009/09/15_200909101753353h7yn.gif[/img]\r\n为站点开启具体的应用或游戏：\r\n[url=http://faq.comsenz.com/attachments/2009/09/15_200909101753354uW1y.gif][img=644,474]http://faq.comsenz.com/attachments/2009/09/15_200909101753354uW1y.gif[/img][/url]\r\n设为默认应用：无论用户是否添加此应用，默认应用都会显示在所有用户的开始菜单里面。\r\n关闭应用：用户不能添加处于关闭状态的应用，应用目录中也不会显示处于关闭状态的应用。\r\n设为推荐应用：被设置为推荐的应用将显示在您网站应用目录的推荐栏目下。\r\n为使大家能在论坛首页看到推荐的应用并方便地参与进来，请设置首页应用推荐条目数：\r\n[url=http://faq.comsenz.com/attachments/2009/09/15_200909101753355rwqi.gif][img]http://faq.comsenz.com/attachments/2009/09/15_200909101753355rwqi.gif[/img][/url][p=30, 2, left][b]三、前台查看[/b][/p]\r\n1、前台查看 Manyou 动态\r\n打开论坛首页，可以看到下图所示：\r\n[url=http://faq.comsenz.com/attachments/2009/09/15_2009091017533561U7q.gif][img=644,244]http://faq.comsenz.com/attachments/2009/09/15_2009091017533561U7q.gif[/img][/url]\r\n点击“应用动态”，即可查看 Manyou 应用的相关动态：\r\n[url=http://faq.comsenz.com/attachments/2009/09/15_200909101753357KO05.gif][img]http://faq.comsenz.com/attachments/2009/09/15_200909101753357KO05.gif[/img][/url]\r\n点击“论坛版块”，可以在论坛首页下方看到推荐的 Manyou 应用：\r\n[url=http://faq.comsenz.com/attachments/2009/09/15_200909101753358q9hK.gif][img=644,317]http://faq.comsenz.com/attachments/2009/09/15_200909101753358q9hK.gif[/img][/url]\r\n到此，Manyou 应用功能已经讲解完毕，赶紧去体验一下吧！','',0,0,0,0,0,0,0,0,0,0,0),(13,2,13,1,'admin',1,'7.2新增功能及功能强化',1333532445,'[p=30, 2, left][b]功能新增：[/b][/p]\r\n[p=16, 0, left]=================================================================[/p]\r\n[p=16, 0, left]活动导出[/p]\r\n[p=16, 0, left]增加附件的动态链接(attach://aid.ext)，便于各方面引用[/p]\r\n[p=16, 0, left]主题鉴定[/p]\r\n[p=16, 0, left]抢楼贴[/p]\r\n[p=16, 0, left]不受审核限制的 IP 列表[/p]\r\n[p=16, 0, left]版块名称颜色[/p]\r\n[p=16, 0, left]倒序帖--倒序显示回复[/p]\r\n[p=16, 0, left]把主题在任意版块中置顶[/p]\r\n\r\n[p=30, 2, left][b]增强优化:[/b][/p]\r\n[p=16, 0, left]=================================================================[/p]\r\n[p=16, 0, left]管理员不受任何搜索限制[/p]\r\n[p=16, 0, left]权限表达式增强，增加注册 IP、注册时间、用户定制栏目的公式项目，可自定义权限表达式提示文字，增加可访问用户列表[/p]\r\n[p=16, 0, left]数据调用增加主题评价的排序[/p]\r\n[p=16, 0, left]管理中心用户管理增加马甲查找功能[/p]\r\n[p=16, 0, left]回收站增加主题列表功能[/p]\r\n[p=16, 0, left]买卖主题增加日志记录查看[/p]\r\n[p=16, 0, left]个人资料页可自由查看他人的帖子[/p]\r\n[p=16, 0, left]评分记录显示方式改进[/p]\r\n[p=16, 0, left]主题列表分割带[/p]\r\n[p=16, 0, left]分类信息加强[/p]\r\n[p=16, 0, left]前台权限细化[/p]\r\n[p=16, 0, left]搜索页高级搜索显示调整[/p]\r\n[p=16, 0, left]添加新用户组时深度继承所选参照组权限[/p]\r\n[p=16, 0, left]版主可以管理特殊用户组的用户[/p]','',0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `cdb_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_profilefields`
--

DROP TABLE IF EXISTS `cdb_profilefields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_profilefields` (
  `fieldid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `invisible` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `size` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `displayorder` smallint(6) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `unchangeable` tinyint(1) NOT NULL DEFAULT '0',
  `showinthread` tinyint(1) NOT NULL DEFAULT '0',
  `selective` tinyint(1) NOT NULL DEFAULT '0',
  `choices` text NOT NULL,
  PRIMARY KEY (`fieldid`),
  KEY `available` (`available`,`required`,`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_profilefields`
--

LOCK TABLES `cdb_profilefields` WRITE;
/*!40000 ALTER TABLE `cdb_profilefields` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_profilefields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_projects`
--

DROP TABLE IF EXISTS `cdb_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_projects` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` varchar(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_projects`
--

LOCK TABLES `cdb_projects` WRITE;
/*!40000 ALTER TABLE `cdb_projects` DISABLE KEYS */;
INSERT INTO `cdb_projects` VALUES (1,'技术性论坛','extcredit','如果您不希望会员通过灌水、页面访问等方式得到积分，而是需要发布一些技术性的帖子获得积分。','a:4:{s:10:\"savemethod\";a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}s:14:\"creditsformula\";s:49:\"posts*0.5+digestposts*5+extcredits1*2+extcredits2\";s:13:\"creditspolicy\";s:299:\"a:12:{s:4:\"post\";a:0:{}s:5:\"reply\";a:0:{}s:6:\"digest\";a:1:{i:1;i:10;}s:10:\"postattach\";a:0:{}s:9:\"getattach\";a:0:{}s:2:\"pm\";a:0:{}s:6:\"search\";a:0:{}s:15:\"promotion_visit\";a:1:{i:3;i:2;}s:18:\"promotion_register\";a:1:{i:3;i:2;}s:13:\"tradefinished\";a:0:{}s:8:\"votepoll\";a:0:{}s:10:\"lowerlimit\";a:0:{}}\";s:10:\"extcredits\";s:1444:\"a:8:{i:1;a:8:{s:5:\"title\";s:4:\"威望\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:2;a:8:{s:5:\"title\";s:4:\"金钱\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:3;a:8:{s:5:\"title\";s:4:\"贡献\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:4;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:5;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:6;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:7;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:8;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}}\";}'),(2,'娱乐性论坛','extcredit','此类型论坛的会员可以通过发布一些评论、回复等获得积分，同时扩大论坛的访问量。更重要的是希望会员发布一些有价值的娱乐新闻等。','a:4:{s:10:\"savemethod\";a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}s:14:\"creditsformula\";s:81:\"posts+digestposts*5+oltime*5+pageviews/1000+extcredits1*2+extcredits2+extcredits3\";s:13:\"creditspolicy\";s:315:\"a:12:{s:4:\"post\";a:1:{i:1;i:1;}s:5:\"reply\";a:1:{i:2;i:1;}s:6:\"digest\";a:1:{i:1;i:10;}s:10:\"postattach\";a:0:{}s:9:\"getattach\";a:0:{}s:2:\"pm\";a:0:{}s:6:\"search\";a:0:{}s:15:\"promotion_visit\";a:1:{i:3;i:2;}s:18:\"promotion_register\";a:1:{i:3;i:2;}s:13:\"tradefinished\";a:0:{}s:8:\"votepoll\";a:0:{}s:10:\"lowerlimit\";a:0:{}}\";s:10:\"extcredits\";s:1036:\"a:8:{i:1;a:6:{s:5:\"title\";s:4:\"威望\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;}i:2;a:6:{s:5:\"title\";s:4:\"金钱\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;}i:3;a:6:{s:5:\"title\";s:4:\"贡献\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;}i:4;a:6:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;}i:5;a:6:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;}i:6;a:6:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;}i:7;a:6:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;}i:8;a:6:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;}}\";}'),(3,'动漫、摄影类论坛','extcredit','此类型论坛需要更多的图片附件发布给广大会员，因此增加一项扩展积分：魅力。','a:4:{s:10:\"savemethod\";a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}s:14:\"creditsformula\";s:86:\"posts+digestposts*2+pageviews/2000+extcredits1*2+extcredits2+extcredits3+extcredits4*3\";s:13:\"creditspolicy\";s:324:\"a:12:{s:4:\"post\";a:1:{i:2;i:1;}s:5:\"reply\";a:0:{}s:6:\"digest\";a:1:{i:1;i:10;}s:10:\"postattach\";a:1:{i:4;i:3;}s:9:\"getattach\";a:1:{i:2;i:-2;}s:2:\"pm\";a:0:{}s:6:\"search\";a:0:{}s:15:\"promotion_visit\";a:1:{i:3;i:2;}s:18:\"promotion_register\";a:1:{i:3;i:2;}s:13:\"tradefinished\";a:0:{}s:8:\"votepoll\";a:0:{}s:10:\"lowerlimit\";a:0:{}}\";s:10:\"extcredits\";s:1454:\"a:8:{i:1;a:8:{s:5:\"title\";s:4:\"威望\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:2;a:8:{s:5:\"title\";s:4:\"金钱\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:3;a:8:{s:5:\"title\";s:4:\"贡献\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:4;a:8:{s:5:\"title\";s:4:\"魅力\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:5;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:6;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:7;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:8;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}}\";}'),(4,'文章、小说类论坛','extcredit','此类型的论坛更重视会员的原创文章或者是转发的文章，因此增加一项扩展积分：文采。','a:4:{s:10:\"savemethod\";a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}s:14:\"creditsformula\";s:57:\"posts+digestposts*8+extcredits2+extcredits3+extcredits4*2\";s:13:\"creditspolicy\";s:307:\"a:12:{s:4:\"post\";a:1:{i:2;i:1;}s:5:\"reply\";a:0:{}s:6:\"digest\";a:1:{i:4;i:10;}s:10:\"postattach\";a:0:{}s:9:\"getattach\";a:0:{}s:2:\"pm\";a:0:{}s:6:\"search\";a:0:{}s:15:\"promotion_visit\";a:1:{i:3;i:2;}s:18:\"promotion_register\";a:1:{i:3;i:2;}s:13:\"tradefinished\";a:0:{}s:8:\"votepoll\";a:0:{}s:10:\"lowerlimit\";a:0:{}}\";s:10:\"extcredits\";s:1454:\"a:8:{i:1;a:8:{s:5:\"title\";s:4:\"威望\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:2;a:8:{s:5:\"title\";s:4:\"金钱\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:3;a:8:{s:5:\"title\";s:4:\"贡献\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:4;a:8:{s:5:\"title\";s:4:\"文采\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:5;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:6;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:7;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:8;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}}\";}'),(5,'调研性论坛','extcredit','此类型论坛更期望的是得到会员的建议和意见，主要是通过投票的方式体现会员的建议，因此增加一项积分策略为：参加投票，增加一项扩展积分为：积极性。','a:4:{s:10:\"savemethod\";a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}s:14:\"creditsformula\";s:63:\"posts*0.5+digestposts*2+extcredits1*2+extcredits3+extcredits4*2\";s:13:\"creditspolicy\";s:306:\"a:12:{s:4:\"post\";a:0:{}s:5:\"reply\";a:0:{}s:6:\"digest\";a:1:{i:1;i:8;}s:10:\"postattach\";a:0:{}s:9:\"getattach\";a:0:{}s:2:\"pm\";a:0:{}s:6:\"search\";a:0:{}s:15:\"promotion_visit\";a:1:{i:3;i:2;}s:18:\"promotion_register\";a:1:{i:3;i:2;}s:13:\"tradefinished\";a:0:{}s:8:\"votepoll\";a:1:{i:4;i:5;}s:10:\"lowerlimit\";a:0:{}}\";s:10:\"extcredits\";s:1456:\"a:8:{i:1;a:8:{s:5:\"title\";s:4:\"威望\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:2;a:8:{s:5:\"title\";s:4:\"金钱\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:3;a:8:{s:5:\"title\";s:4:\"贡献\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:4;a:8:{s:5:\"title\";s:6:\"积极性\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:5;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:6;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:7;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:8;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}}\";}'),(6,'贸易性论坛','extcredit','此类型论坛更注重的是会员之间的交易，因此使用积分策略：交易成功，增加一项扩展积分：诚信度。','a:4:{s:10:\"savemethod\";a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}s:14:\"creditsformula\";s:55:\"posts+digestposts+extcredits1*2+extcredits3+extcredits4\";s:13:\"creditspolicy\";s:306:\"a:12:{s:4:\"post\";a:0:{}s:5:\"reply\";a:0:{}s:6:\"digest\";a:1:{i:1;i:5;}s:10:\"postattach\";a:0:{}s:9:\"getattach\";a:0:{}s:2:\"pm\";a:0:{}s:6:\"search\";a:0:{}s:15:\"promotion_visit\";a:1:{i:3;i:2;}s:18:\"promotion_register\";a:1:{i:3;i:2;}s:13:\"tradefinished\";a:1:{i:4;i:6;}s:8:\"votepoll\";a:0:{}s:10:\"lowerlimit\";a:0:{}}\";s:10:\"extcredits\";s:1456:\"a:8:{i:1;a:8:{s:5:\"title\";s:4:\"威望\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:2;a:8:{s:5:\"title\";s:4:\"金钱\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:3;a:8:{s:5:\"title\";s:4:\"贡献\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:4;a:8:{s:5:\"title\";s:6:\"诚信度\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:5;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:6;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:7;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:8;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}}\";}'),(7,'坛内事务类版块','forum','该板块设置了不允许其他模块共享，以及设置了需要很高的权限才能浏览该版块。也适合于保密性高版块。','a:33:{s:7:\"styleid\";s:1:\"0\";s:12:\"allowsmilies\";s:1:\"1\";s:9:\"allowhtml\";s:1:\"0\";s:11:\"allowbbcode\";s:1:\"1\";s:12:\"allowimgcode\";s:1:\"1\";s:14:\"allowanonymous\";s:1:\"0\";s:10:\"allowshare\";s:1:\"0\";s:16:\"allowpostspecial\";s:1:\"0\";s:14:\"alloweditrules\";s:1:\"1\";s:10:\"recyclebin\";s:1:\"1\";s:11:\"modnewposts\";s:1:\"0\";s:6:\"jammer\";s:1:\"0\";s:16:\"disablewatermark\";s:1:\"0\";s:12:\"inheritedmod\";s:1:\"0\";s:9:\"autoclose\";s:1:\"0\";s:12:\"forumcolumns\";s:1:\"0\";s:12:\"threadcaches\";s:2:\"40\";s:16:\"allowpaytoauthor\";s:1:\"0\";s:13:\"alloweditpost\";s:1:\"1\";s:6:\"simple\";s:1:\"0\";s:11:\"postcredits\";s:0:\"\";s:12:\"replycredits\";s:0:\"\";s:16:\"getattachcredits\";s:0:\"\";s:17:\"postattachcredits\";s:0:\"\";s:13:\"digestcredits\";s:0:\"\";s:16:\"attachextensions\";s:0:\"\";s:11:\"threadtypes\";s:0:\"\";s:8:\"viewperm\";s:7:\"	1	2	3	\";s:8:\"postperm\";s:7:\"	1	2	3	\";s:9:\"replyperm\";s:7:\"	1	2	3	\";s:13:\"getattachperm\";s:7:\"	1	2	3	\";s:14:\"postattachperm\";s:7:\"	1	2	3	\";s:16:\"supe_pushsetting\";s:0:\"\";}'),(8,'技术交流类版块','forum','该设置开启了主题缓存系数。其他的权限设置级别较低。','a:33:{s:7:\"styleid\";s:1:\"0\";s:12:\"allowsmilies\";s:1:\"1\";s:9:\"allowhtml\";s:1:\"0\";s:11:\"allowbbcode\";s:1:\"1\";s:12:\"allowimgcode\";s:1:\"1\";s:14:\"allowanonymous\";s:1:\"0\";s:10:\"allowshare\";s:1:\"1\";s:16:\"allowpostspecial\";s:1:\"5\";s:14:\"alloweditrules\";s:1:\"0\";s:10:\"recyclebin\";s:1:\"1\";s:11:\"modnewposts\";s:1:\"0\";s:6:\"jammer\";s:1:\"0\";s:16:\"disablewatermark\";s:1:\"0\";s:12:\"inheritedmod\";s:1:\"0\";s:9:\"autoclose\";s:1:\"0\";s:12:\"forumcolumns\";s:1:\"0\";s:12:\"threadcaches\";s:2:\"40\";s:16:\"allowpaytoauthor\";s:1:\"1\";s:13:\"alloweditpost\";s:1:\"1\";s:6:\"simple\";s:1:\"0\";s:11:\"postcredits\";s:0:\"\";s:12:\"replycredits\";s:0:\"\";s:16:\"getattachcredits\";s:0:\"\";s:17:\"postattachcredits\";s:0:\"\";s:13:\"digestcredits\";s:0:\"\";s:16:\"attachextensions\";s:0:\"\";s:11:\"threadtypes\";s:0:\"\";s:8:\"viewperm\";s:0:\"\";s:8:\"postperm\";s:0:\"\";s:9:\"replyperm\";s:0:\"\";s:13:\"getattachperm\";s:0:\"\";s:14:\"postattachperm\";s:0:\"\";s:16:\"supe_pushsetting\";s:0:\"\";}'),(9,'发布公告类版块','forum','该设置开启了发帖审核，限制了允许发帖的用户组。','a:33:{s:7:\"styleid\";s:1:\"0\";s:12:\"allowsmilies\";s:1:\"1\";s:9:\"allowhtml\";s:1:\"0\";s:11:\"allowbbcode\";s:1:\"1\";s:12:\"allowimgcode\";s:1:\"1\";s:14:\"allowanonymous\";s:1:\"0\";s:10:\"allowshare\";s:1:\"1\";s:16:\"allowpostspecial\";s:1:\"1\";s:14:\"alloweditrules\";s:1:\"0\";s:10:\"recyclebin\";s:1:\"1\";s:11:\"modnewposts\";s:1:\"1\";s:6:\"jammer\";s:1:\"1\";s:16:\"disablewatermark\";s:1:\"0\";s:12:\"inheritedmod\";s:1:\"0\";s:9:\"autoclose\";s:1:\"0\";s:12:\"forumcolumns\";s:1:\"0\";s:12:\"threadcaches\";s:1:\"0\";s:16:\"allowpaytoauthor\";s:1:\"1\";s:13:\"alloweditpost\";s:1:\"0\";s:6:\"simple\";s:1:\"0\";s:11:\"postcredits\";s:0:\"\";s:12:\"replycredits\";s:0:\"\";s:16:\"getattachcredits\";s:0:\"\";s:17:\"postattachcredits\";s:0:\"\";s:13:\"digestcredits\";s:0:\"\";s:16:\"attachextensions\";s:0:\"\";s:11:\"threadtypes\";s:0:\"\";s:8:\"viewperm\";s:0:\"\";s:8:\"postperm\";s:7:\"	1	2	3	\";s:9:\"replyperm\";s:0:\"\";s:13:\"getattachperm\";s:0:\"\";s:14:\"postattachperm\";s:0:\"\";s:16:\"supe_pushsetting\";s:0:\"\";}'),(10,'发起活动类版块','forum','该类型设置里发起主题一个月之后会自动关闭主题。','a:33:{s:7:\"styleid\";s:1:\"0\";s:12:\"allowsmilies\";s:1:\"1\";s:9:\"allowhtml\";s:1:\"0\";s:11:\"allowbbcode\";s:1:\"1\";s:12:\"allowimgcode\";s:1:\"1\";s:14:\"allowanonymous\";s:1:\"0\";s:10:\"allowshare\";s:1:\"1\";s:16:\"allowpostspecial\";s:1:\"9\";s:14:\"alloweditrules\";s:1:\"0\";s:10:\"recyclebin\";s:1:\"1\";s:11:\"modnewposts\";s:1:\"0\";s:6:\"jammer\";s:1:\"0\";s:16:\"disablewatermark\";s:1:\"0\";s:12:\"inheritedmod\";s:1:\"1\";s:9:\"autoclose\";s:2:\"30\";s:12:\"forumcolumns\";s:1:\"0\";s:12:\"threadcaches\";s:2:\"40\";s:16:\"allowpaytoauthor\";s:1:\"1\";s:13:\"alloweditpost\";s:1:\"0\";s:6:\"simple\";s:1:\"0\";s:11:\"postcredits\";s:0:\"\";s:12:\"replycredits\";s:0:\"\";s:16:\"getattachcredits\";s:0:\"\";s:17:\"postattachcredits\";s:0:\"\";s:13:\"digestcredits\";s:0:\"\";s:16:\"attachextensions\";s:0:\"\";s:11:\"threadtypes\";s:0:\"\";s:8:\"viewperm\";s:0:\"\";s:8:\"postperm\";s:22:\"	1	2	3	11	12	13	14	15	\";s:9:\"replyperm\";s:0:\"\";s:13:\"getattachperm\";s:0:\"\";s:14:\"postattachperm\";s:0:\"\";s:16:\"supe_pushsetting\";s:0:\"\";}'),(11,'娱乐灌水类版块','forum','该设置了主题缓存系数，开启了所有的特殊主题按钮。','a:33:{s:7:\"styleid\";s:1:\"0\";s:12:\"allowsmilies\";s:1:\"1\";s:9:\"allowhtml\";s:1:\"0\";s:11:\"allowbbcode\";s:1:\"1\";s:12:\"allowimgcode\";s:1:\"1\";s:14:\"allowanonymous\";s:1:\"0\";s:10:\"allowshare\";s:1:\"1\";s:16:\"allowpostspecial\";s:2:\"15\";s:14:\"alloweditrules\";s:1:\"0\";s:10:\"recyclebin\";s:1:\"1\";s:11:\"modnewposts\";s:1:\"0\";s:6:\"jammer\";s:1:\"0\";s:16:\"disablewatermark\";s:1:\"0\";s:12:\"inheritedmod\";s:1:\"0\";s:9:\"autoclose\";s:1:\"0\";s:12:\"forumcolumns\";s:1:\"0\";s:12:\"threadcaches\";s:2:\"40\";s:16:\"allowpaytoauthor\";s:1:\"1\";s:13:\"alloweditpost\";s:1:\"1\";s:6:\"simple\";s:1:\"0\";s:11:\"postcredits\";s:0:\"\";s:12:\"replycredits\";s:0:\"\";s:16:\"getattachcredits\";s:0:\"\";s:17:\"postattachcredits\";s:0:\"\";s:13:\"digestcredits\";s:0:\"\";s:16:\"attachextensions\";s:0:\"\";s:11:\"threadtypes\";s:0:\"\";s:8:\"viewperm\";s:0:\"\";s:8:\"postperm\";s:0:\"\";s:9:\"replyperm\";s:0:\"\";s:13:\"getattachperm\";s:0:\"\";s:14:\"postattachperm\";s:0:\"\";s:16:\"supe_pushsetting\";s:0:\"\";}');
/*!40000 ALTER TABLE `cdb_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_promotions`
--

DROP TABLE IF EXISTS `cdb_promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_promotions` (
  `ip` char(15) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_promotions`
--

LOCK TABLES `cdb_promotions` WRITE;
/*!40000 ALTER TABLE `cdb_promotions` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_prompt`
--

DROP TABLE IF EXISTS `cdb_prompt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_prompt` (
  `uid` mediumint(8) unsigned NOT NULL,
  `typeid` smallint(6) unsigned NOT NULL,
  `number` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`uid`,`typeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_prompt`
--

LOCK TABLES `cdb_prompt` WRITE;
/*!40000 ALTER TABLE `cdb_prompt` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_prompt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_promptmsgs`
--

DROP TABLE IF EXISTS `cdb_promptmsgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_promptmsgs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `extraid` int(10) unsigned NOT NULL DEFAULT '0',
  `new` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `actor` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`typeid`),
  KEY `new` (`new`),
  KEY `dateline` (`dateline`),
  KEY `extraid` (`extraid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_promptmsgs`
--

LOCK TABLES `cdb_promptmsgs` WRITE;
/*!40000 ALTER TABLE `cdb_promptmsgs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_promptmsgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_prompttype`
--

DROP TABLE IF EXISTS `cdb_prompttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_prompttype` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `script` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_prompttype`
--

LOCK TABLES `cdb_prompttype` WRITE;
/*!40000 ALTER TABLE `cdb_prompttype` DISABLE KEYS */;
INSERT INTO `cdb_prompttype` VALUES (1,'pm','私人消息','pm.php?filter=newpm'),(2,'announcepm','公共消息','pm.php?filter=announcepm'),(3,'task','论坛任务','task.php?item=doing'),(4,'systempm','系统消息',''),(5,'friend','好友消息',''),(6,'threads','帖子消息','');
/*!40000 ALTER TABLE `cdb_prompttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_ranks`
--

DROP TABLE IF EXISTS `cdb_ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_ranks` (
  `rankid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `ranktitle` varchar(30) NOT NULL DEFAULT '',
  `postshigher` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `stars` tinyint(3) NOT NULL DEFAULT '0',
  `color` varchar(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`rankid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_ranks`
--

LOCK TABLES `cdb_ranks` WRITE;
/*!40000 ALTER TABLE `cdb_ranks` DISABLE KEYS */;
INSERT INTO `cdb_ranks` VALUES (1,'新生入学',0,1,''),(2,'小试牛刀',50,2,''),(3,'实习记者',300,5,''),(4,'自由撰稿人',1000,4,''),(5,'特聘作家',3000,5,'');
/*!40000 ALTER TABLE `cdb_ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_ratelog`
--

DROP TABLE IF EXISTS `cdb_ratelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_ratelog` (
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `extcredits` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `score` smallint(6) NOT NULL DEFAULT '0',
  `reason` char(40) NOT NULL DEFAULT '',
  KEY `pid` (`pid`,`dateline`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_ratelog`
--

LOCK TABLES `cdb_ratelog` WRITE;
/*!40000 ALTER TABLE `cdb_ratelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_ratelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_regips`
--

DROP TABLE IF EXISTS `cdb_regips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_regips` (
  `ip` char(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `count` smallint(6) NOT NULL DEFAULT '0',
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_regips`
--

LOCK TABLES `cdb_regips` WRITE;
/*!40000 ALTER TABLE `cdb_regips` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_regips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_relatedthreads`
--

DROP TABLE IF EXISTS `cdb_relatedthreads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_relatedthreads` (
  `tid` mediumint(8) NOT NULL DEFAULT '0',
  `type` enum('general','trade') NOT NULL DEFAULT 'general',
  `expiration` int(10) NOT NULL DEFAULT '0',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `relatedthreads` text NOT NULL,
  PRIMARY KEY (`tid`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_relatedthreads`
--

LOCK TABLES `cdb_relatedthreads` WRITE;
/*!40000 ALTER TABLE `cdb_relatedthreads` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_relatedthreads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_reportlog`
--

DROP TABLE IF EXISTS `cdb_reportlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_reportlog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fid` smallint(6) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL,
  `username` char(15) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `type` tinyint(1) NOT NULL,
  `reason` char(40) NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pid` (`pid`,`uid`),
  KEY `dateline` (`fid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_reportlog`
--

LOCK TABLES `cdb_reportlog` WRITE;
/*!40000 ALTER TABLE `cdb_reportlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_reportlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_request`
--

DROP TABLE IF EXISTS `cdb_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_request` (
  `variable` varchar(32) NOT NULL DEFAULT '',
  `value` mediumtext NOT NULL,
  `type` tinyint(1) NOT NULL,
  `system` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`variable`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_request`
--

LOCK TABLES `cdb_request` WRITE;
/*!40000 ALTER TABLE `cdb_request` DISABLE KEYS */;
INSERT INTO `cdb_request` VALUES ('边栏模块_版块树形列表','a:4:{s:3:\"url\";s:83:\"function=module&module=forumtree.inc.php&settings=N%3B&jscharset=0&cachelife=864000\";s:9:\"parameter\";a:3:{s:6:\"module\";s:17:\"forumtree.inc.php\";s:9:\"cachelife\";s:6:\"864000\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:30:\"边栏版块树形列表模块\";s:4:\"type\";s:1:\"5\";}',5,0),('边栏模块_版主排行','a:4:{s:3:\"url\";s:79:\"function=module&module=modlist.inc.php&settings=N%3B&jscharset=0&cachelife=3600\";s:9:\"parameter\";a:3:{s:6:\"module\";s:15:\"modlist.inc.php\";s:9:\"cachelife\";s:4:\"3600\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:24:\"边栏版主排行模块\";s:4:\"type\";s:1:\"5\";}',5,0),('聚合模块_版块列表','a:4:{s:3:\"url\";s:382:\"function=module&module=rowcombine.inc.php&settings=a%3A1%3A%7Bs%3A4%3A%22data%22%3Bs%3A84%3A%22%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E7%89%88%E5%9D%97%E6%8E%92%E8%A1%8C%2C%E7%89%88%E5%9D%97%E6%8E%92%E8%A1%8C%0D%0A%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E7%89%88%E5%9D%97%E6%A0%91%E5%BD%A2%E5%88%97%E8%A1%A8%2C%E7%89%88%E5%9D%97%E5%88%97%E8%A1%A8%22%3B%7D&jscharset=0&cachelife=864000&\";s:9:\"parameter\";a:4:{s:6:\"module\";s:18:\"rowcombine.inc.php\";s:9:\"cachelife\";s:6:\"864000\";s:8:\"settings\";a:1:{s:4:\"data\";s:84:\"边栏模块_版块排行,版块排行\r\n边栏模块_版块树形列表,版块列表\";}s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:39:\"热门版块、版块树形聚合模块\";s:4:\"type\";s:1:\"5\";}',5,0),('边栏模块_版块排行','a:4:{s:3:\"url\";s:482:\"function=forums&startrow=0&items=0&newwindow=1&orderby=posts&jscharset=0&cachelife=43200&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E7%89%88%E5%9D%97%E6%8E%92%E8%A1%8C%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%3Cimg%20style%3D%5C%22vertical-align%3Amiddle%5C%22%20src%3D%5C%22images%2Fdefault%2Ftree_file.gif%5C%22%20%2F%3E%20%7Bforumname%7D%28%7Bposts%7D%29%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\";s:9:\"parameter\";a:7:{s:10:\"jstemplate\";s:211:\"<div class=\\\"sidebox\\\">\r\n<h4>版块排行</h4>\r\n<ul class=\\\"textinfolist\\\">\r\n[node]<li><img style=\\\"vertical-align:middle\\\" src=\\\"images/default/tree_file.gif\\\" /> {forumname}({posts})</li>[/node]\r\n</ul>\r\n</div>\";s:9:\"cachelife\";s:5:\"43200\";s:8:\"startrow\";s:1:\"0\";s:5:\"items\";s:1:\"0\";s:9:\"newwindow\";i:1;s:7:\"orderby\";s:5:\"posts\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:24:\"边栏版块排行模块\";s:4:\"type\";s:1:\"1\";}',1,0),('聚合模块_热门主题','a:4:{s:3:\"url\";s:533:\"function=module&module=rowcombine.inc.php&settings=a%3A2%3A%7Bs%3A5%3A%22title%22%3Bs%3A12%3A%22%E7%83%AD%E9%97%A8%E4%B8%BB%E9%A2%98%22%3Bs%3A4%3A%22data%22%3Bs%3A112%3A%22%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E7%83%AD%E9%97%A8%E4%B8%BB%E9%A2%98_%E4%BB%8A%E6%97%A5%2C%E6%97%A5%0D%0A%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E7%83%AD%E9%97%A8%E4%B8%BB%E9%A2%98_%E6%9C%AC%E5%91%A8%2C%E5%91%A8%0D%0A%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E7%83%AD%E9%97%A8%E4%B8%BB%E9%A2%98_%E6%9C%AC%E6%9C%88%2C%E6%9C%88%22%3B%7D&jscharset=0&cachelife=1800&\";s:9:\"parameter\";a:4:{s:6:\"module\";s:18:\"rowcombine.inc.php\";s:9:\"cachelife\";s:4:\"1800\";s:8:\"settings\";a:2:{s:5:\"title\";s:12:\"热门主题\";s:4:\"data\";s:112:\"边栏模块_热门主题_今日,日\r\n边栏模块_热门主题_本周,周\r\n边栏模块_热门主题_本月,月\";}s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:48:\"今日、本周、本月热门主题聚合模块\";s:4:\"type\";s:1:\"5\";}',5,0),('边栏模块_热门主题_本月','a:4:{s:3:\"url\";s:556:\"function=threads&sidestatus=0&maxlength=20&fnamelength=0&messagelength=&startrow=0&picpre=images%2Fcommon%2Fslisticon.gif&items=5&tag=&tids=&special=0&rewardstatus=&digest=0&stick=0&recommend=0&newwindow=1&threadtype=0&highlight=0&orderby=hourviews&hours=720&jscharset=0&cachelife=86400&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%AC%E6%9C%88%E7%83%AD%E9%97%A8%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bprefix%7D%7Bsubject%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\";s:9:\"parameter\";a:19:{s:10:\"jstemplate\";s:131:\"<div class=\\\"sidebox\\\">\r\n<h4>本月热门</h4>\r\n<ul class=\\\"textinfolist\\\">\r\n[node]<li>{prefix}{subject}</li>[/node]\r\n</ul>\r\n</div>\";s:9:\"cachelife\";s:5:\"86400\";s:10:\"sidestatus\";s:1:\"0\";s:8:\"startrow\";s:1:\"0\";s:5:\"items\";s:1:\"5\";s:9:\"maxlength\";s:2:\"20\";s:11:\"fnamelength\";s:1:\"0\";s:13:\"messagelength\";s:0:\"\";s:6:\"picpre\";s:27:\"images/common/slisticon.gif\";s:4:\"tids\";s:0:\"\";s:7:\"keyword\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:10:\"threadtype\";s:1:\"0\";s:9:\"highlight\";s:1:\"0\";s:9:\"recommend\";s:1:\"0\";s:9:\"newwindow\";i:1;s:7:\"orderby\";s:9:\"hourviews\";s:5:\"hours\";s:3:\"720\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:30:\"边栏本月热门主题模块\";s:4:\"type\";s:1:\"0\";}',0,0),('聚合模块_会员排行','a:4:{s:3:\"url\";s:533:\"function=module&module=rowcombine.inc.php&settings=a%3A2%3A%7Bs%3A5%3A%22title%22%3Bs%3A12%3A%22%E4%BC%9A%E5%91%98%E6%8E%92%E8%A1%8C%22%3Bs%3A4%3A%22data%22%3Bs%3A112%3A%22%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E4%BC%9A%E5%91%98%E6%8E%92%E8%A1%8C_%E4%BB%8A%E6%97%A5%2C%E6%97%A5%0D%0A%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E4%BC%9A%E5%91%98%E6%8E%92%E8%A1%8C_%E6%9C%AC%E5%91%A8%2C%E5%91%A8%0D%0A%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E4%BC%9A%E5%91%98%E6%8E%92%E8%A1%8C_%E6%9C%AC%E6%9C%88%2C%E6%9C%88%22%3B%7D&jscharset=0&cachelife=3600&\";s:9:\"parameter\";a:4:{s:6:\"module\";s:18:\"rowcombine.inc.php\";s:9:\"cachelife\";s:4:\"3600\";s:8:\"settings\";a:2:{s:5:\"title\";s:12:\"会员排行\";s:4:\"data\";s:112:\"边栏模块_会员排行_今日,日\r\n边栏模块_会员排行_本周,周\r\n边栏模块_会员排行_本月,月\";}s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:48:\"今日、本周、本月会员排行聚合模块\";s:4:\"type\";s:1:\"5\";}',5,0),('边栏模块_推荐主题','a:4:{s:3:\"url\";s:553:\"function=threads&sidestatus=0&maxlength=20&fnamelength=0&messagelength=&startrow=0&picpre=images%2Fcommon%2Fslisticon.gif&items=5&tag=&tids=&special=0&rewardstatus=&digest=0&stick=0&recommend=1&newwindow=1&threadtype=0&highlight=0&orderby=lastpost&hours=48&jscharset=0&cachelife=3600&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%8E%A8%E8%8D%90%E4%B8%BB%E9%A2%98%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bprefix%7D%7Bsubject%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\";s:9:\"parameter\";a:19:{s:10:\"jstemplate\";s:131:\"<div class=\\\"sidebox\\\">\r\n<h4>推荐主题</h4>\r\n<ul class=\\\"textinfolist\\\">\r\n[node]<li>{prefix}{subject}</li>[/node]\r\n</ul>\r\n</div>\";s:9:\"cachelife\";s:4:\"3600\";s:10:\"sidestatus\";s:1:\"0\";s:8:\"startrow\";s:1:\"0\";s:5:\"items\";s:1:\"5\";s:9:\"maxlength\";s:2:\"20\";s:11:\"fnamelength\";s:1:\"0\";s:13:\"messagelength\";s:0:\"\";s:6:\"picpre\";s:27:\"images/common/slisticon.gif\";s:4:\"tids\";s:0:\"\";s:7:\"keyword\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:10:\"threadtype\";s:1:\"0\";s:9:\"highlight\";s:1:\"0\";s:9:\"recommend\";s:1:\"1\";s:9:\"newwindow\";i:1;s:7:\"orderby\";s:8:\"lastpost\";s:5:\"hours\";s:2:\"48\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:24:\"边栏推荐主题模块\";s:4:\"type\";s:1:\"0\";}',0,0),('边栏模块_最新图片','a:4:{s:3:\"url\";s:1385:\"function=images&sidestatus=0&isimage=1&threadmethod=1&maxwidth=140&maxheight=140&startrow=0&items=5&orderby=dateline&hours=0&digest=0&newwindow=1&jscharset=0&jstemplate=%3Cdiv%20%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%80%E6%96%B0%E5%9B%BE%E7%89%87%3C%2Fh4%3E%0D%0A%3Cscript%20type%3D%5C%22text%2Fjavascript%5C%22%3E%0D%0Avar%20slideSpeed%20%3D%202500%3B%0D%0Avar%20slideImgsize%20%3D%20%5B140%2C140%5D%3B%0D%0Avar%20slideTextBar%20%3D%200%3B%0D%0Avar%20slideBorderColor%20%3D%20%5C%27%23C8DCEC%5C%27%3B%0D%0Avar%20slideBgColor%20%3D%20%5C%27%23FFF%5C%27%3B%0D%0Avar%20slideImgs%20%3D%20new%20Array%28%29%3B%0D%0Avar%20slideImgLinks%20%3D%20new%20Array%28%29%3B%0D%0Avar%20slideImgTexts%20%3D%20new%20Array%28%29%3B%0D%0Avar%20slideSwitchBar%20%3D%201%3B%0D%0Avar%20slideSwitchColor%20%3D%20%5C%27black%5C%27%3B%0D%0Avar%20slideSwitchbgColor%20%3D%20%5C%27white%5C%27%3B%0D%0Avar%20slideSwitchHiColor%20%3D%20%5C%27%23C8DCEC%5C%27%3B%0D%0A%5Bnode%5D%0D%0AslideImgs%5B%7Border%7D%5D%20%3D%20%5C%22%7Bimgfile%7D%5C%22%3B%0D%0AslideImgLinks%5B%7Border%7D%5D%20%3D%20%5C%22%7Blink%7D%5C%22%3B%0D%0AslideImgTexts%5B%7Border%7D%5D%20%3D%20%5C%22%7Bsubject%7D%5C%22%3B%0D%0A%5B%2Fnode%5D%0D%0A%3C%2Fscript%3E%0D%0A%3Cscript%20language%3D%5C%22javascript%5C%22%20type%3D%5C%22text%2Fjavascript%5C%22%20src%3D%5C%22include%2Fjs%2Fslide.js%5C%22%3E%3C%2Fscript%3E%0D%0A%3C%2Fdiv%3E&\";s:9:\"parameter\";a:13:{s:10:\"jstemplate\";s:709:\"<div  class=\\\"sidebox\\\">\r\n<h4>最新图片</h4>\r\n<script type=\\\"text/javascript\\\">\r\nvar slideSpeed = 2500;\r\nvar slideImgsize = [140,140];\r\nvar slideTextBar = 0;\r\nvar slideBorderColor = \\\'#C8DCEC\\\';\r\nvar slideBgColor = \\\'#FFF\\\';\r\nvar slideImgs = new Array();\r\nvar slideImgLinks = new Array();\r\nvar slideImgTexts = new Array();\r\nvar slideSwitchBar = 1;\r\nvar slideSwitchColor = \\\'black\\\';\r\nvar slideSwitchbgColor = \\\'white\\\';\r\nvar slideSwitchHiColor = \\\'#C8DCEC\\\';\r\n[node]\r\nslideImgs[{order}] = \\\"{imgfile}\\\";\r\nslideImgLinks[{order}] = \\\"{link}\\\";\r\nslideImgTexts[{order}] = \\\"{subject}\\\";\r\n[/node]\r\n</script>\r\n<script language=\\\"javascript\\\" type=\\\"text/javascript\\\" src=\\\"include/js/slide.js\\\"></script>\r\n</div>\";s:9:\"cachelife\";s:0:\"\";s:10:\"sidestatus\";s:1:\"0\";s:8:\"startrow\";s:1:\"0\";s:5:\"items\";s:1:\"5\";s:7:\"isimage\";s:1:\"1\";s:8:\"maxwidth\";s:3:\"140\";s:9:\"maxheight\";s:3:\"140\";s:12:\"threadmethod\";s:1:\"1\";s:9:\"newwindow\";i:1;s:7:\"orderby\";s:8:\"dateline\";s:5:\"hours\";s:0:\"\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:30:\"边栏最新图片展示模块\";s:4:\"type\";s:1:\"4\";}',4,0),('边栏模块_最新主题','a:4:{s:3:\"url\";s:537:\"function=threads&sidestatus=0&maxlength=20&fnamelength=0&messagelength=&startrow=0&picpre=images%2Fcommon%2Fslisticon.gif&items=5&tag=&tids=&special=0&rewardstatus=&digest=0&stick=0&recommend=0&newwindow=1&threadtype=0&highlight=0&orderby=dateline&hours=0&jscharset=0&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%80%E6%96%B0%E4%B8%BB%E9%A2%98%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bprefix%7D%7Bsubject%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\";s:9:\"parameter\";a:19:{s:10:\"jstemplate\";s:131:\"<div class=\\\"sidebox\\\">\r\n<h4>最新主题</h4>\r\n<ul class=\\\"textinfolist\\\">\r\n[node]<li>{prefix}{subject}</li>[/node]\r\n</ul>\r\n</div>\";s:9:\"cachelife\";s:0:\"\";s:10:\"sidestatus\";s:1:\"0\";s:8:\"startrow\";s:1:\"0\";s:5:\"items\";s:1:\"5\";s:9:\"maxlength\";s:2:\"20\";s:11:\"fnamelength\";s:1:\"0\";s:13:\"messagelength\";s:0:\"\";s:6:\"picpre\";s:27:\"images/common/slisticon.gif\";s:4:\"tids\";s:0:\"\";s:7:\"keyword\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:10:\"threadtype\";s:1:\"0\";s:9:\"highlight\";s:1:\"0\";s:9:\"recommend\";s:1:\"0\";s:9:\"newwindow\";i:1;s:7:\"orderby\";s:8:\"dateline\";s:5:\"hours\";s:0:\"\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:24:\"边栏最新主题模块\";s:4:\"type\";s:1:\"0\";}',0,0),('边栏模块_活跃会员','a:4:{s:3:\"url\";s:381:\"function=memberrank&startrow=0&items=12&newwindow=1&extcredit=1&orderby=posts&hours=0&jscharset=0&cachelife=43200&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%B4%BB%E8%B7%83%E4%BC%9A%E5%91%98%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22avt_list%20s_clear%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bavatarsmall%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\";s:9:\"parameter\";a:9:{s:10:\"jstemplate\";s:131:\"<div class=\\\"sidebox\\\">\r\n<h4>活跃会员</h4>\r\n<ul class=\\\"avt_list s_clear\\\">\r\n[node]<li>{avatarsmall}</li>[/node]\r\n</ul>\r\n</div>\";s:9:\"cachelife\";s:5:\"43200\";s:8:\"startrow\";s:1:\"0\";s:5:\"items\";s:2:\"12\";s:9:\"newwindow\";i:1;s:9:\"extcredit\";s:1:\"1\";s:7:\"orderby\";s:5:\"posts\";s:5:\"hours\";s:0:\"\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:24:\"边栏活跃会员模块\";s:4:\"type\";s:1:\"2\";}',2,0),('边栏模块_热门主题_本版','a:4:{s:3:\"url\";s:569:\"function=threads&sidestatus=1&maxlength=20&fnamelength=0&messagelength=&startrow=0&picpre=images%2Fcommon%2Fslisticon.gif&items=5&tag=&tids=&special=0&rewardstatus=&digest=0&stick=0&recommend=0&newwindow=1&threadtype=0&highlight=0&orderby=replies&hours=0&jscharset=0&cachelife=1800&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%AC%E7%89%88%E7%83%AD%E9%97%A8%E4%B8%BB%E9%A2%98%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bprefix%7D%7Bsubject%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\";s:9:\"parameter\";a:19:{s:10:\"jstemplate\";s:137:\"<div class=\\\"sidebox\\\">\r\n<h4>本版热门主题</h4>\r\n<ul class=\\\"textinfolist\\\">\r\n[node]<li>{prefix}{subject}</li>[/node]\r\n</ul>\r\n</div>\";s:9:\"cachelife\";s:4:\"1800\";s:10:\"sidestatus\";s:1:\"1\";s:8:\"startrow\";s:1:\"0\";s:5:\"items\";s:1:\"5\";s:9:\"maxlength\";s:2:\"20\";s:11:\"fnamelength\";s:1:\"0\";s:13:\"messagelength\";s:0:\"\";s:6:\"picpre\";s:27:\"images/common/slisticon.gif\";s:4:\"tids\";s:0:\"\";s:7:\"keyword\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:10:\"threadtype\";s:1:\"0\";s:9:\"highlight\";s:1:\"0\";s:9:\"recommend\";s:1:\"0\";s:9:\"newwindow\";i:1;s:7:\"orderby\";s:7:\"replies\";s:5:\"hours\";s:0:\"\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:30:\"边栏本版热门主题模块\";s:4:\"type\";s:1:\"0\";}',0,0),('边栏模块_热门主题_今日','a:4:{s:3:\"url\";s:554:\"function=threads&sidestatus=0&maxlength=20&fnamelength=0&messagelength=&startrow=0&picpre=images%2Fcommon%2Fslisticon.gif&items=5&tag=&tids=&special=0&rewardstatus=&digest=0&stick=0&recommend=0&newwindow=1&threadtype=0&highlight=0&orderby=hourviews&hours=24&jscharset=0&cachelife=1800&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E4%BB%8A%E6%97%A5%E7%83%AD%E9%97%A8%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bprefix%7D%7Bsubject%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\";s:9:\"parameter\";a:19:{s:10:\"jstemplate\";s:131:\"<div class=\\\"sidebox\\\">\r\n<h4>今日热门</h4>\r\n<ul class=\\\"textinfolist\\\">\r\n[node]<li>{prefix}{subject}</li>[/node]\r\n</ul>\r\n</div>\";s:9:\"cachelife\";s:4:\"1800\";s:10:\"sidestatus\";s:1:\"0\";s:8:\"startrow\";s:1:\"0\";s:5:\"items\";s:1:\"5\";s:9:\"maxlength\";s:2:\"20\";s:11:\"fnamelength\";s:1:\"0\";s:13:\"messagelength\";s:0:\"\";s:6:\"picpre\";s:27:\"images/common/slisticon.gif\";s:4:\"tids\";s:0:\"\";s:7:\"keyword\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:10:\"threadtype\";s:1:\"0\";s:9:\"highlight\";s:1:\"0\";s:9:\"recommend\";s:1:\"0\";s:9:\"newwindow\";i:1;s:7:\"orderby\";s:9:\"hourviews\";s:5:\"hours\";s:2:\"24\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:30:\"边栏今日热门主题模块\";s:4:\"type\";s:1:\"0\";}',0,0),('边栏模块_最新回复','a:4:{s:3:\"url\";s:537:\"function=threads&sidestatus=0&maxlength=20&fnamelength=0&messagelength=&startrow=0&picpre=images%2Fcommon%2Fslisticon.gif&items=5&tag=&tids=&special=0&rewardstatus=&digest=0&stick=0&recommend=0&newwindow=1&threadtype=0&highlight=0&orderby=lastpost&hours=0&jscharset=0&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%80%E6%96%B0%E5%9B%9E%E5%A4%8D%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bprefix%7D%7Bsubject%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\";s:9:\"parameter\";a:19:{s:10:\"jstemplate\";s:131:\"<div class=\\\"sidebox\\\">\r\n<h4>最新回复</h4>\r\n<ul class=\\\"textinfolist\\\">\r\n[node]<li>{prefix}{subject}</li>[/node]\r\n</ul>\r\n</div>\";s:9:\"cachelife\";s:0:\"\";s:10:\"sidestatus\";s:1:\"0\";s:8:\"startrow\";s:1:\"0\";s:5:\"items\";s:1:\"5\";s:9:\"maxlength\";s:2:\"20\";s:11:\"fnamelength\";s:1:\"0\";s:13:\"messagelength\";s:0:\"\";s:6:\"picpre\";s:27:\"images/common/slisticon.gif\";s:4:\"tids\";s:0:\"\";s:7:\"keyword\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:10:\"threadtype\";s:1:\"0\";s:9:\"highlight\";s:1:\"0\";s:9:\"recommend\";s:1:\"0\";s:9:\"newwindow\";i:1;s:7:\"orderby\";s:8:\"lastpost\";s:5:\"hours\";s:0:\"\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:24:\"边栏最新回复模块\";s:4:\"type\";s:1:\"0\";}',0,0),('边栏模块_最新图片_本版','a:4:{s:3:\"url\";s:1385:\"function=images&sidestatus=1&isimage=1&threadmethod=1&maxwidth=140&maxheight=140&startrow=0&items=5&orderby=dateline&hours=0&digest=0&newwindow=1&jscharset=0&jstemplate=%3Cdiv%20%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%80%E6%96%B0%E5%9B%BE%E7%89%87%3C%2Fh4%3E%0D%0A%3Cscript%20type%3D%5C%22text%2Fjavascript%5C%22%3E%0D%0Avar%20slideSpeed%20%3D%202500%3B%0D%0Avar%20slideImgsize%20%3D%20%5B140%2C140%5D%3B%0D%0Avar%20slideTextBar%20%3D%200%3B%0D%0Avar%20slideBorderColor%20%3D%20%5C%27%23C8DCEC%5C%27%3B%0D%0Avar%20slideBgColor%20%3D%20%5C%27%23FFF%5C%27%3B%0D%0Avar%20slideImgs%20%3D%20new%20Array%28%29%3B%0D%0Avar%20slideImgLinks%20%3D%20new%20Array%28%29%3B%0D%0Avar%20slideImgTexts%20%3D%20new%20Array%28%29%3B%0D%0Avar%20slideSwitchBar%20%3D%201%3B%0D%0Avar%20slideSwitchColor%20%3D%20%5C%27black%5C%27%3B%0D%0Avar%20slideSwitchbgColor%20%3D%20%5C%27white%5C%27%3B%0D%0Avar%20slideSwitchHiColor%20%3D%20%5C%27%23C8DCEC%5C%27%3B%0D%0A%5Bnode%5D%0D%0AslideImgs%5B%7Border%7D%5D%20%3D%20%5C%22%7Bimgfile%7D%5C%22%3B%0D%0AslideImgLinks%5B%7Border%7D%5D%20%3D%20%5C%22%7Blink%7D%5C%22%3B%0D%0AslideImgTexts%5B%7Border%7D%5D%20%3D%20%5C%22%7Bsubject%7D%5C%22%3B%0D%0A%5B%2Fnode%5D%0D%0A%3C%2Fscript%3E%0D%0A%3Cscript%20language%3D%5C%22javascript%5C%22%20type%3D%5C%22text%2Fjavascript%5C%22%20src%3D%5C%22include%2Fjs%2Fslide.js%5C%22%3E%3C%2Fscript%3E%0D%0A%3C%2Fdiv%3E&\";s:9:\"parameter\";a:13:{s:10:\"jstemplate\";s:709:\"<div  class=\\\"sidebox\\\">\r\n<h4>最新图片</h4>\r\n<script type=\\\"text/javascript\\\">\r\nvar slideSpeed = 2500;\r\nvar slideImgsize = [140,140];\r\nvar slideTextBar = 0;\r\nvar slideBorderColor = \\\'#C8DCEC\\\';\r\nvar slideBgColor = \\\'#FFF\\\';\r\nvar slideImgs = new Array();\r\nvar slideImgLinks = new Array();\r\nvar slideImgTexts = new Array();\r\nvar slideSwitchBar = 1;\r\nvar slideSwitchColor = \\\'black\\\';\r\nvar slideSwitchbgColor = \\\'white\\\';\r\nvar slideSwitchHiColor = \\\'#C8DCEC\\\';\r\n[node]\r\nslideImgs[{order}] = \\\"{imgfile}\\\";\r\nslideImgLinks[{order}] = \\\"{link}\\\";\r\nslideImgTexts[{order}] = \\\"{subject}\\\";\r\n[/node]\r\n</script>\r\n<script language=\\\"javascript\\\" type=\\\"text/javascript\\\" src=\\\"include/js/slide.js\\\"></script>\r\n</div>\";s:9:\"cachelife\";s:0:\"\";s:10:\"sidestatus\";s:1:\"1\";s:8:\"startrow\";s:1:\"0\";s:5:\"items\";s:1:\"5\";s:7:\"isimage\";s:1:\"1\";s:8:\"maxwidth\";s:3:\"140\";s:9:\"maxheight\";s:3:\"140\";s:12:\"threadmethod\";s:1:\"1\";s:9:\"newwindow\";i:1;s:7:\"orderby\";s:8:\"dateline\";s:5:\"hours\";s:0:\"\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:36:\"边栏本版最新图片展示模块\";s:4:\"type\";s:1:\"4\";}',4,0),('边栏模块_标签','a:4:{s:3:\"url\";s:126:\"function=module&module=tag.inc.php&settings=a%3A1%3A%7Bs%3A5%3A%22limit%22%3Bs%3A2%3A%2220%22%3B%7D&jscharset=0&cachelife=900&\";s:9:\"parameter\";a:4:{s:6:\"module\";s:11:\"tag.inc.php\";s:9:\"cachelife\";s:3:\"900\";s:8:\"settings\";a:1:{s:5:\"limit\";s:2:\"20\";}s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:18:\"边栏标签模块\";s:4:\"type\";s:1:\"5\";}',5,0),('边栏模块_会员排行_本月','a:4:{s:3:\"url\";s:574:\"function=memberrank&startrow=0&items=5&newwindow=1&extcredit=1&orderby=hourposts&hours=720&jscharset=0&cachelife=86400&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%AC%E6%9C%88%E6%8E%92%E8%A1%8C%3C%2Fh4%3E%0D%0A%5Bnode%5D%3Cdiv%20class%3D%5C%22s_clear%5C%22%20style%3D%5C%22margin-bottom%3A%205px%3B%5C%22%3E%3Cdiv%20style%3D%5C%22margin-right%3A%2010px%3B%20float%3A%20left%3B%5C%22%3E%7Bavatarsmall%7D%3C%2Fdiv%3E%3Cp%3E%7Bmember%7D%3C%2Fp%3E%3Cp%3E%E5%8F%91%E5%B8%96%20%7Bvalue%7D%20%E7%AF%87%3C%2Fp%3E%3C%2Fdiv%3E%5B%2Fnode%5D%0D%0A%3C%2Fdiv%3E&\";s:9:\"parameter\";a:9:{s:10:\"jstemplate\";s:235:\"<div class=\\\"sidebox\\\">\r\n<h4>本月排行</h4>\r\n[node]<div class=\\\"s_clear\\\" style=\\\"margin-bottom: 5px;\\\"><div style=\\\"margin-right: 10px; float: left;\\\">{avatarsmall}</div><p>{member}</p><p>发帖 {value} 篇</p></div>[/node]\r\n</div>\";s:9:\"cachelife\";s:5:\"86400\";s:8:\"startrow\";s:1:\"0\";s:5:\"items\";s:1:\"5\";s:9:\"newwindow\";i:1;s:9:\"extcredit\";s:1:\"1\";s:7:\"orderby\";s:9:\"hourposts\";s:5:\"hours\";s:3:\"720\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:36:\"边栏会员本月发帖排行模块\";s:4:\"type\";s:1:\"2\";}',2,0),('边栏模块_会员排行_本周','a:4:{s:3:\"url\";s:574:\"function=memberrank&startrow=0&items=5&newwindow=1&extcredit=1&orderby=hourposts&hours=168&jscharset=0&cachelife=43200&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%AC%E5%91%A8%E6%8E%92%E8%A1%8C%3C%2Fh4%3E%0D%0A%5Bnode%5D%3Cdiv%20class%3D%5C%22s_clear%5C%22%20style%3D%5C%22margin-bottom%3A%205px%3B%5C%22%3E%3Cdiv%20style%3D%5C%22margin-right%3A%2010px%3B%20float%3A%20left%3B%5C%22%3E%7Bavatarsmall%7D%3C%2Fdiv%3E%3Cp%3E%7Bmember%7D%3C%2Fp%3E%3Cp%3E%E5%8F%91%E5%B8%96%20%7Bvalue%7D%20%E7%AF%87%3C%2Fp%3E%3C%2Fdiv%3E%5B%2Fnode%5D%0D%0A%3C%2Fdiv%3E&\";s:9:\"parameter\";a:9:{s:10:\"jstemplate\";s:235:\"<div class=\\\"sidebox\\\">\r\n<h4>本周排行</h4>\r\n[node]<div class=\\\"s_clear\\\" style=\\\"margin-bottom: 5px;\\\"><div style=\\\"margin-right: 10px; float: left;\\\">{avatarsmall}</div><p>{member}</p><p>发帖 {value} 篇</p></div>[/node]\r\n</div>\";s:9:\"cachelife\";s:5:\"43200\";s:8:\"startrow\";s:1:\"0\";s:5:\"items\";s:1:\"5\";s:9:\"newwindow\";i:1;s:9:\"extcredit\";s:1:\"1\";s:7:\"orderby\";s:9:\"hourposts\";s:5:\"hours\";s:3:\"168\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:36:\"边栏会员本周发帖排行模块\";s:4:\"type\";s:1:\"2\";}',2,0),('边栏方案_主题列表页默认','a:4:{s:3:\"url\";s:432:\"function=side&jscharset=&jstemplate=%5Bmodule%5D%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E6%88%91%E7%9A%84%E5%8A%A9%E6%89%8B%5B%2Fmodule%5D%3Chr%20class%3D%22shadowline%22%2F%3E%5Bmodule%5D%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E7%83%AD%E9%97%A8%E4%B8%BB%E9%A2%98_%E6%9C%AC%E7%89%88%5B%2Fmodule%5D%3Chr%20class%3D%22shadowline%22%2F%3E%5Bmodule%5D%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E7%89%88%E5%9D%97%E6%8E%92%E8%A1%8C%5B%2Fmodule%5D&\";s:9:\"parameter\";a:3:{s:12:\"selectmodule\";a:3:{i:1;s:25:\"边栏模块_我的助手\";i:2;s:32:\"边栏模块_热门主题_本版\";i:3;s:25:\"边栏模块_版块排行\";}s:9:\"cachelife\";i:0;s:10:\"jstemplate\";s:181:\"[module]边栏模块_我的助手[/module]<hr class=\"shadowline\"/>[module]边栏模块_热门主题_本版[/module]<hr class=\"shadowline\"/>[module]边栏模块_版块排行[/module]\";}s:7:\"comment\";N;s:4:\"type\";s:2:\"-2\";}',-2,0),('边栏方案_首页默认','a:4:{s:3:\"url\";s:533:\"function=side&jscharset=&jstemplate=%5Bmodule%5D%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E6%88%91%E7%9A%84%E5%8A%A9%E6%89%8B%5B%2Fmodule%5D%3Chr%20class%3D%22shadowline%22%2F%3E%5Bmodule%5D%E8%81%9A%E5%90%88%E6%A8%A1%E5%9D%97_%E6%96%B0%E5%B8%96%5B%2Fmodule%5D%3Chr%20class%3D%22shadowline%22%2F%3E%5Bmodule%5D%E8%81%9A%E5%90%88%E6%A8%A1%E5%9D%97_%E7%83%AD%E9%97%A8%E4%B8%BB%E9%A2%98%5B%2Fmodule%5D%3Chr%20class%3D%22shadowline%22%2F%3E%5Bmodule%5D%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E6%B4%BB%E8%B7%83%E4%BC%9A%E5%91%98%5B%2Fmodule%5D&\";s:9:\"parameter\";a:3:{s:12:\"selectmodule\";a:4:{i:1;s:25:\"边栏模块_我的助手\";i:2;s:19:\"聚合模块_新帖\";i:3;s:25:\"聚合模块_热门主题\";i:4;s:25:\"边栏模块_活跃会员\";}s:9:\"cachelife\";i:0;s:10:\"jstemplate\";s:234:\"[module]边栏模块_我的助手[/module]<hr class=\"shadowline\"/>[module]聚合模块_新帖[/module]<hr class=\"shadowline\"/>[module]聚合模块_热门主题[/module]<hr class=\"shadowline\"/>[module]边栏模块_活跃会员[/module]\";}s:7:\"comment\";N;s:4:\"type\";s:2:\"-2\";}',-2,0),('聚合模块_新帖','a:4:{s:3:\"url\";s:387:\"function=module&module=rowcombine.inc.php&settings=a%3A2%3A%7Bs%3A5%3A%22title%22%3Bs%3A12%3A%22%E6%9C%80%E6%96%B0%E5%B8%96%E5%AD%90%22%3Bs%3A4%3A%22data%22%3Bs%3A66%3A%22%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E6%9C%80%E6%96%B0%E4%B8%BB%E9%A2%98%2C%E4%B8%BB%E9%A2%98%0D%0A%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E6%9C%80%E6%96%B0%E5%9B%9E%E5%A4%8D%2C%E5%9B%9E%E5%A4%8D%22%3B%7D&jscharset=0&\";s:9:\"parameter\";a:4:{s:6:\"module\";s:18:\"rowcombine.inc.php\";s:9:\"cachelife\";s:0:\"\";s:8:\"settings\";a:2:{s:5:\"title\";s:12:\"最新帖子\";s:4:\"data\";s:66:\"边栏模块_最新主题,主题\r\n边栏模块_最新回复,回复\";}s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:39:\"最新主题、最新回复聚合模块\";s:4:\"type\";s:1:\"5\";}',5,0),('边栏模块_热门主题_本周','a:4:{s:3:\"url\";s:556:\"function=threads&sidestatus=0&maxlength=20&fnamelength=0&messagelength=&startrow=0&picpre=images%2Fcommon%2Fslisticon.gif&items=5&tag=&tids=&special=0&rewardstatus=&digest=0&stick=0&recommend=0&newwindow=1&threadtype=0&highlight=0&orderby=hourviews&hours=168&jscharset=0&cachelife=43200&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%AC%E5%91%A8%E7%83%AD%E9%97%A8%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bprefix%7D%7Bsubject%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\";s:9:\"parameter\";a:19:{s:10:\"jstemplate\";s:131:\"<div class=\\\"sidebox\\\">\r\n<h4>本周热门</h4>\r\n<ul class=\\\"textinfolist\\\">\r\n[node]<li>{prefix}{subject}</li>[/node]\r\n</ul>\r\n</div>\";s:9:\"cachelife\";s:5:\"43200\";s:10:\"sidestatus\";s:1:\"0\";s:8:\"startrow\";s:1:\"0\";s:5:\"items\";s:1:\"5\";s:9:\"maxlength\";s:2:\"20\";s:11:\"fnamelength\";s:1:\"0\";s:13:\"messagelength\";s:0:\"\";s:6:\"picpre\";s:27:\"images/common/slisticon.gif\";s:4:\"tids\";s:0:\"\";s:7:\"keyword\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:10:\"threadtype\";s:1:\"0\";s:9:\"highlight\";s:1:\"0\";s:9:\"recommend\";s:1:\"0\";s:9:\"newwindow\";i:1;s:7:\"orderby\";s:9:\"hourviews\";s:5:\"hours\";s:3:\"168\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:30:\"边栏本周热门主题模块\";s:4:\"type\";s:1:\"0\";}',0,0),('边栏模块_会员排行_今日','a:4:{s:3:\"url\";s:572:\"function=memberrank&startrow=0&items=5&newwindow=1&extcredit=1&orderby=hourposts&hours=24&jscharset=0&cachelife=3600&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E4%BB%8A%E6%97%A5%E6%8E%92%E8%A1%8C%3C%2Fh4%3E%0D%0A%5Bnode%5D%3Cdiv%20class%3D%5C%22s_clear%5C%22%20style%3D%5C%22margin-bottom%3A%205px%3B%5C%22%3E%3Cdiv%20style%3D%5C%22margin-right%3A%2010px%3B%20float%3A%20left%3B%5C%22%3E%7Bavatarsmall%7D%3C%2Fdiv%3E%3Cp%3E%7Bmember%7D%3C%2Fp%3E%3Cp%3E%E5%8F%91%E5%B8%96%20%7Bvalue%7D%20%E7%AF%87%3C%2Fp%3E%3C%2Fdiv%3E%5B%2Fnode%5D%0D%0A%3C%2Fdiv%3E&\";s:9:\"parameter\";a:9:{s:10:\"jstemplate\";s:235:\"<div class=\\\"sidebox\\\">\r\n<h4>今日排行</h4>\r\n[node]<div class=\\\"s_clear\\\" style=\\\"margin-bottom: 5px;\\\"><div style=\\\"margin-right: 10px; float: left;\\\">{avatarsmall}</div><p>{member}</p><p>发帖 {value} 篇</p></div>[/node]\r\n</div>\";s:9:\"cachelife\";s:4:\"3600\";s:8:\"startrow\";s:1:\"0\";s:5:\"items\";s:1:\"5\";s:9:\"newwindow\";i:1;s:9:\"extcredit\";s:1:\"1\";s:7:\"orderby\";s:9:\"hourposts\";s:5:\"hours\";s:2:\"24\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:36:\"边栏会员今日发帖排行模块\";s:4:\"type\";s:1:\"2\";}',2,0),('边栏模块_论坛之星','a:4:{s:3:\"url\";s:668:\"function=memberrank&startrow=0&items=3&newwindow=1&extcredit=1&orderby=hourposts&hours=168&jscharset=0&cachelife=43200&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%20s_clear%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%AC%E5%91%A8%E4%B9%8B%E6%98%9F%3C%2Fh4%3E%0D%0A%5Bnode%5D%0D%0A%5Bshow%3D1%5D%3Cdiv%20style%3D%5C%22clear%3Aboth%5C%22%3E%3Cdiv%20style%3D%5C%22float%3Aleft%3B%20margin-right%3A%2016px%3B%5C%22%3E%7Bavatarsmall%7D%3C%2Fdiv%3E%5B%2Fshow%5D%7Bmember%7D%20%5Bshow%3D1%5D%3Cbr%20%2F%3E%E5%8F%91%E5%B8%96%20%7Bvalue%7D%20%E7%AF%87%3C%2Fdiv%3E%3Cdiv%20style%3D%5C%22clear%3Aboth%3Bmargin-top%3A2px%5C%22%20%2F%3E%3C%2Fdiv%3E%5B%2Fshow%5D%0D%0A%5B%2Fnode%5D%0D%0A%3C%2Fdiv%3E&\";s:9:\"parameter\";a:9:{s:10:\"jstemplate\";s:291:\"<div class=\\\"sidebox s_clear\\\">\r\n<h4>本周之星</h4>\r\n[node]\r\n[show=1]<div style=\\\"clear:both\\\"><div style=\\\"float:left; margin-right: 16px;\\\">{avatarsmall}</div>[/show]{member} [show=1]<br />发帖 {value} 篇</div><div style=\\\"clear:both;margin-top:2px\\\" /></div>[/show]\r\n[/node]\r\n</div>\";s:9:\"cachelife\";s:5:\"43200\";s:8:\"startrow\";s:1:\"0\";s:5:\"items\";s:1:\"3\";s:9:\"newwindow\";i:1;s:9:\"extcredit\";s:1:\"1\";s:7:\"orderby\";s:9:\"hourposts\";s:5:\"hours\";s:3:\"168\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:24:\"边栏论坛之星模块\";s:4:\"type\";s:1:\"2\";}',2,0),('边栏模块_我的助手','a:4:{s:3:\"url\";s:78:\"function=module&module=assistant.inc.php&settings=N%3B&jscharset=0&cachelife=0\";s:9:\"parameter\";a:3:{s:6:\"module\";s:17:\"assistant.inc.php\";s:9:\"cachelife\";s:1:\"0\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:24:\"边栏我的助手模块\";s:4:\"type\";s:1:\"5\";}',5,0),('边栏模块_Google搜索','a:4:{s:3:\"url\";s:171:\"function=module&module=google.inc.php&settings=a%3A2%3A%7Bs%3A4%3A%22lang%22%3Bs%3A0%3A%22%22%3Bs%3A7%3A%22default%22%3Bs%3A1%3A%221%22%3B%7D&jscharset=0&cachelife=864000&\";s:9:\"parameter\";a:4:{s:6:\"module\";s:14:\"google.inc.php\";s:9:\"cachelife\";s:6:\"864000\";s:8:\"settings\";a:2:{s:4:\"lang\";s:0:\"\";s:7:\"default\";s:1:\"1\";}s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:26:\"边栏 Google 搜索模块\";s:4:\"type\";s:1:\"5\";}',5,0),('UCHome_最新动态','a:4:{s:3:\"url\";s:445:\"function=module&module=feed.inc.php&settings=a%3A6%3A%7Bs%3A5%3A%22title%22%3Bs%3A12%3A%22%E6%9C%80%E6%96%B0%E5%8A%A8%E6%80%81%22%3Bs%3A4%3A%22uids%22%3Bs%3A0%3A%22%22%3Bs%3A6%3A%22friend%22%3Bs%3A1%3A%220%22%3Bs%3A5%3A%22start%22%3Bs%3A1%3A%220%22%3Bs%3A5%3A%22limit%22%3Bs%3A2%3A%2210%22%3Bs%3A8%3A%22template%22%3Bs%3A54%3A%22%3Cdiv%20style%3D%5C%22padding-left%3A2px%5C%22%3E%7Btitle_template%7D%3C%2Fdiv%3E%22%3B%7D&jscharset=0&cachelife=0&\";s:9:\"parameter\";a:4:{s:6:\"module\";s:12:\"feed.inc.php\";s:9:\"cachelife\";s:1:\"0\";s:8:\"settings\";a:6:{s:5:\"title\";s:12:\"最新动态\";s:4:\"uids\";s:0:\"\";s:6:\"friend\";s:1:\"0\";s:5:\"start\";s:1:\"0\";s:5:\"limit\";s:2:\"10\";s:8:\"template\";s:54:\"<div style=\\\"padding-left:2px\\\">{title_template}</div>\";}s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:27:\"获取UCHome的最新动态\";s:4:\"type\";s:1:\"5\";}',5,0),('UCHome_最新更新空间','a:4:{s:3:\"url\";s:1388:\"function=module&module=space.inc.php&settings=a%3A17%3A%7Bs%3A5%3A%22title%22%3Bs%3A18%3A%22%E6%9C%80%E6%96%B0%E6%9B%B4%E6%96%B0%E7%A9%BA%E9%97%B4%22%3Bs%3A3%3A%22uid%22%3Bs%3A0%3A%22%22%3Bs%3A14%3A%22startfriendnum%22%3Bs%3A0%3A%22%22%3Bs%3A12%3A%22endfriendnum%22%3Bs%3A0%3A%22%22%3Bs%3A12%3A%22startviewnum%22%3Bs%3A0%3A%22%22%3Bs%3A10%3A%22endviewnum%22%3Bs%3A0%3A%22%22%3Bs%3A11%3A%22startcredit%22%3Bs%3A0%3A%22%22%3Bs%3A9%3A%22endcredit%22%3Bs%3A0%3A%22%22%3Bs%3A6%3A%22avatar%22%3Bs%3A2%3A%22-1%22%3Bs%3A10%3A%22namestatus%22%3Bs%3A2%3A%22-1%22%3Bs%3A8%3A%22dateline%22%3Bs%3A1%3A%220%22%3Bs%3A10%3A%22updatetime%22%3Bs%3A1%3A%220%22%3Bs%3A5%3A%22order%22%3Bs%3A10%3A%22updatetime%22%3Bs%3A2%3A%22sc%22%3Bs%3A4%3A%22DESC%22%3Bs%3A5%3A%22start%22%3Bs%3A1%3A%220%22%3Bs%3A5%3A%22limit%22%3Bs%3A2%3A%2210%22%3Bs%3A8%3A%22template%22%3Bs%3A267%3A%22%3Ctable%3E%0D%0A%3Ctr%3E%0D%0A%3Ctd%20width%3D%5C%2250%5C%22%20rowspan%3D%5C%222%5C%22%3E%3Ca%20href%3D%5C%22%7Buserlink%7D%5C%22%20target%3D%5C%22_blank%5C%22%3E%3Cimg%20src%3D%5C%22%7Bphoto%7D%5C%22%20%2F%3E%3C%2Fa%3E%3C%2Ftd%3E%0D%0A%3Ctd%3E%3Ca%20href%3D%5C%22%7Buserlink%7D%5C%22%20%20target%3D%5C%22_blank%5C%22%20style%3D%5C%22text-decoration%3Anone%3B%5C%22%3E%7Busername%7D%3C%2Fa%3E%3C%2Ftd%3E%0D%0A%3C%2Ftr%3E%0D%0A%3Ctr%3E%3Ctd%3E%7Bupdatetime%7D%3C%2Ftd%3E%3C%2Ftr%3E%0D%0A%3C%2Ftable%3E%22%3B%7D&jscharset=0&cachelife=0&\";s:9:\"parameter\";a:4:{s:6:\"module\";s:13:\"space.inc.php\";s:9:\"cachelife\";s:1:\"0\";s:8:\"settings\";a:17:{s:5:\"title\";s:18:\"最新更新空间\";s:3:\"uid\";s:0:\"\";s:14:\"startfriendnum\";s:0:\"\";s:12:\"endfriendnum\";s:0:\"\";s:12:\"startviewnum\";s:0:\"\";s:10:\"endviewnum\";s:0:\"\";s:11:\"startcredit\";s:0:\"\";s:9:\"endcredit\";s:0:\"\";s:6:\"avatar\";s:2:\"-1\";s:10:\"namestatus\";s:2:\"-1\";s:8:\"dateline\";s:1:\"0\";s:10:\"updatetime\";s:1:\"0\";s:5:\"order\";s:10:\"updatetime\";s:2:\"sc\";s:4:\"DESC\";s:5:\"start\";s:1:\"0\";s:5:\"limit\";s:2:\"10\";s:8:\"template\";s:267:\"<table>\r\n<tr>\r\n<td width=\\\"50\\\" rowspan=\\\"2\\\"><a href=\\\"{userlink}\\\" target=\\\"_blank\\\"><img src=\\\"{photo}\\\" /></a></td>\r\n<td><a href=\\\"{userlink}\\\"  target=\\\"_blank\\\" style=\\\"text-decoration:none;\\\">{username}</a></td>\r\n</tr>\r\n<tr><td>{updatetime}</td></tr>\r\n</table>\";}s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:36:\"获取UCHome最新更新会员空间\";s:4:\"type\";s:1:\"5\";}',5,0),('UCHome_最新记录','a:4:{s:3:\"url\";s:1021:\"function=module&module=doing.inc.php&settings=a%3A6%3A%7Bs%3A5%3A%22title%22%3Bs%3A12%3A%22%E6%9C%80%E6%96%B0%E8%AE%B0%E5%BD%95%22%3Bs%3A3%3A%22uid%22%3Bs%3A0%3A%22%22%3Bs%3A4%3A%22mood%22%3Bs%3A1%3A%220%22%3Bs%3A5%3A%22start%22%3Bs%3A1%3A%220%22%3Bs%3A5%3A%22limit%22%3Bs%3A2%3A%2210%22%3Bs%3A8%3A%22template%22%3Bs%3A361%3A%22%0D%0A%3Cdiv%20style%3D%5C%22padding%3A0%200%205px%200%3B%5C%22%3E%0D%0A%3Ca%20href%3D%5C%22%7Buserlink%7D%5C%22%20target%3D%5C%22_blank%5C%22%3E%3Cimg%20src%3D%5C%22%7Bphoto%7D%5C%22%20width%3D%5C%2218%5C%22%20height%3D%5C%2218%5C%22%20align%3D%5C%22absmiddle%5C%22%3E%3C%2Fa%3E%20%3Ca%20href%3D%5C%22%7Buserlink%7D%5C%22%20%20target%3D%5C%22_blank%5C%22%3E%7Busername%7D%3C%2Fa%3E%EF%BC%9A%0D%0A%3C%2Fdiv%3E%0D%0A%3Cdiv%20style%3D%5C%22padding%3A0%200%205px%2020px%3B%5C%22%3E%0D%0A%3Ca%20href%3D%5C%22%7Blink%7D%5C%22%20style%3D%5C%22color%3A%23333%3Btext-decoration%3Anone%3B%5C%22%20target%3D%5C%22_blank%5C%22%3E%7Bmessage%7D%3C%2Fa%3E%0D%0A%3C%2Fdiv%3E%22%3B%7D&jscharset=0&cachelife=0&\";s:9:\"parameter\";a:4:{s:6:\"module\";s:13:\"doing.inc.php\";s:9:\"cachelife\";s:1:\"0\";s:8:\"settings\";a:6:{s:5:\"title\";s:12:\"最新记录\";s:3:\"uid\";s:0:\"\";s:4:\"mood\";s:1:\"0\";s:5:\"start\";s:1:\"0\";s:5:\"limit\";s:2:\"10\";s:8:\"template\";s:361:\"\r\n<div style=\\\"padding:0 0 5px 0;\\\">\r\n<a href=\\\"{userlink}\\\" target=\\\"_blank\\\"><img src=\\\"{photo}\\\" width=\\\"18\\\" height=\\\"18\\\" align=\\\"absmiddle\\\"></a> <a href=\\\"{userlink}\\\"  target=\\\"_blank\\\">{username}</a>：\r\n</div>\r\n<div style=\\\"padding:0 0 5px 20px;\\\">\r\n<a href=\\\"{link}\\\" style=\\\"color:#333;text-decoration:none;\\\" target=\\\"_blank\\\">{message}</a>\r\n</div>\";}s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:27:\"获取UCHome的最新记录\";s:4:\"type\";s:1:\"5\";}',5,0),('UCHome_竞价排名','a:4:{s:3:\"url\";s:255:\"function=module&module=html.inc.php&settings=a%3A3%3A%7Bs%3A4%3A%22type%22%3Bs%3A1%3A%220%22%3Bs%3A4%3A%22code%22%3Bs%3A27%3A%22%3Cdiv%20id%3D%5C%22sidefeed%5C%22%3E%3C%2Fdiv%3E%22%3Bs%3A4%3A%22side%22%3Bs%3A1%3A%220%22%3B%7D&jscharset=0&cachelife=864000&\";s:9:\"parameter\";a:4:{s:6:\"module\";s:12:\"html.inc.php\";s:9:\"cachelife\";s:6:\"864000\";s:8:\"settings\";a:3:{s:4:\"type\";s:1:\"0\";s:4:\"code\";s:27:\"<div id=\\\"sidefeed\\\"></div>\";s:4:\"side\";s:1:\"0\";}s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:33:\"获取UCHome的竞价排名信息\";s:4:\"type\";s:1:\"5\";}',5,0);
/*!40000 ALTER TABLE `cdb_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_rewardlog`
--

DROP TABLE IF EXISTS `cdb_rewardlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_rewardlog` (
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `answererid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned DEFAULT '0',
  `netamount` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `userid` (`authorid`,`answererid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_rewardlog`
--

LOCK TABLES `cdb_rewardlog` WRITE;
/*!40000 ALTER TABLE `cdb_rewardlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_rewardlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_rsscaches`
--

DROP TABLE IF EXISTS `cdb_rsscaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_rsscaches` (
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  `fid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `forum` char(50) NOT NULL DEFAULT '',
  `author` char(15) NOT NULL DEFAULT '',
  `subject` char(80) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  UNIQUE KEY `tid` (`tid`),
  KEY `fid` (`fid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_rsscaches`
--

LOCK TABLES `cdb_rsscaches` WRITE;
/*!40000 ALTER TABLE `cdb_rsscaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_rsscaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_searchindex`
--

DROP TABLE IF EXISTS `cdb_searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_searchindex` (
  `searchid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `searchstring` text NOT NULL,
  `useip` varchar(15) NOT NULL DEFAULT '',
  `uid` mediumint(10) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  `threadsortid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `threads` smallint(6) unsigned NOT NULL DEFAULT '0',
  `tids` text NOT NULL,
  PRIMARY KEY (`searchid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_searchindex`
--

LOCK TABLES `cdb_searchindex` WRITE;
/*!40000 ALTER TABLE `cdb_searchindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_sessions`
--

DROP TABLE IF EXISTS `cdb_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_sessions` (
  `sid` char(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `ip1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ip2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ip3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ip4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `groupid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `styleid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `invisible` tinyint(1) NOT NULL DEFAULT '0',
  `action` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastactivity` int(10) unsigned NOT NULL DEFAULT '0',
  `lastolupdate` int(10) unsigned NOT NULL DEFAULT '0',
  `pageviews` smallint(6) unsigned NOT NULL DEFAULT '0',
  `seccode` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `fid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bloguid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `sid` (`sid`),
  KEY `uid` (`uid`),
  KEY `bloguid` (`bloguid`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_sessions`
--

LOCK TABLES `cdb_sessions` WRITE;
/*!40000 ALTER TABLE `cdb_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_settings`
--

DROP TABLE IF EXISTS `cdb_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_settings` (
  `variable` varchar(32) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_settings`
--

LOCK TABLES `cdb_settings` WRITE;
/*!40000 ALTER TABLE `cdb_settings` DISABLE KEYS */;
INSERT INTO `cdb_settings` VALUES ('accessemail',''),('activitytype','朋友聚会\r\n出外郊游\r\n自驾出行\r\n公益活动\r\n线上活动'),('adminipaccess',''),('admode','1'),('allowthreadplugin',''),('archiverstatus','1'),('attachbanperiods',''),('attachdir','./attachments'),('attachexpire',''),('attachimgpost','1'),('attachrefcheck','0'),('attachsave','3'),('attachurl','attachments'),('authkey','37d61cioNMHjs29A'),('authoronleft','0'),('avatarmethod','0'),('backupdir','8a6aec'),('baidusitemap','1'),('baidusitemap_life','12'),('bannedmessages','1'),('bbclosed',''),('bbname','Discuz! Board'),('bbrules','0'),('bbrulestxt',''),('bdaystatus','0'),('boardlicensed','0'),('cacheindexlife','0'),('cachethreaddir','forumdata/threadcaches'),('cachethreadlife','0'),('censoremail',''),('censoruser',''),('closedreason',''),('creditnotice','1'),('creditsformula','extcredits1'),('creditsformulaexp',''),('creditsnotify',''),('creditspolicy','a:12:{s:4:\"post\";a:0:{}s:5:\"reply\";a:0:{}s:6:\"digest\";a:1:{i:1;i:10;}s:10:\"postattach\";a:0:{}s:9:\"getattach\";a:0:{}s:6:\"sendpm\";a:0:{}s:6:\"search\";a:0:{}s:15:\"promotion_visit\";a:0:{}s:18:\"promotion_register\";a:0:{}s:13:\"tradefinished\";a:0:{}s:8:\"votepoll\";a:0:{}s:10:\"lowerlimit\";a:0:{}}'),('creditstax','0.2'),('creditstrans','2'),('customauthorinfo','a:1:{i:0;a:9:{s:3:\"uid\";a:1:{s:4:\"menu\";s:1:\"1\";}s:5:\"posts\";a:1:{s:4:\"menu\";s:1:\"1\";}s:6:\"digest\";a:1:{s:4:\"menu\";s:1:\"1\";}s:7:\"credits\";a:1:{s:4:\"menu\";s:1:\"1\";}s:8:\"readperm\";a:1:{s:4:\"menu\";s:1:\"1\";}s:8:\"location\";a:1:{s:4:\"menu\";s:1:\"1\";}s:6:\"oltime\";a:1:{s:4:\"menu\";s:1:\"1\";}s:7:\"regtime\";a:1:{s:4:\"menu\";s:1:\"1\";}s:8:\"lastdate\";a:1:{s:4:\"menu\";s:1:\"1\";}}}'),('custombackup',''),('dateconvert','1'),('dateformat','Y-n-j'),('debug','1'),('delayviewcount','0'),('deletereason',''),('disallowfloat','a:2:{i:3;s:9:\"newthread\";i:4;s:5:\"reply\";}'),('domainwhitelist',''),('doublee','1'),('dupkarmarate','0'),('dzfeed_limit','a:9:{s:14:\"thread_replies\";a:4:{i:0;s:3:\"100\";i:1;s:4:\"1000\";i:2;s:4:\"2000\";i:3;s:5:\"10000\";}s:12:\"thread_views\";a:3:{i:0;s:3:\"500\";i:1;s:4:\"5000\";i:2;s:5:\"10000\";}s:11:\"thread_rate\";a:3:{i:0;s:2:\"50\";i:1;s:3:\"200\";i:2;s:3:\"500\";}s:9:\"post_rate\";a:3:{i:0;s:2:\"20\";i:1;s:3:\"100\";i:2;s:3:\"300\";}s:14:\"user_usergroup\";a:4:{i:0;s:2:\"12\";i:1;s:2:\"13\";i:2;s:2:\"14\";i:3;s:2:\"15\";}s:11:\"user_credit\";a:3:{i:0;s:4:\"1000\";i:1;s:5:\"10000\";i:2;s:6:\"100000\";}s:12:\"user_threads\";a:5:{i:0;s:3:\"100\";i:1;s:3:\"500\";i:2;s:4:\"1000\";i:3;s:4:\"5000\";i:4;s:5:\"10000\";}s:10:\"user_posts\";a:4:{i:0;s:3:\"500\";i:1;s:4:\"1000\";i:2;s:4:\"5000\";i:3;s:5:\"10000\";}s:11:\"user_digest\";a:4:{i:0;s:2:\"50\";i:1;s:3:\"100\";i:2;s:3:\"500\";i:3;s:4:\"1000\";}}'),('ec_account',''),('ec_contract',''),('ec_credit','a:2:{s:18:\"maxcreditspermonth\";i:6;s:4:\"rank\";a:15:{i:1;i:4;i:2;i:11;i:3;i:41;i:4;i:91;i:5;i:151;i:6;i:251;i:7;i:501;i:8;i:1001;i:9;i:2001;i:10;i:5001;i:11;i:10001;i:12;i:20001;i:13;i:50001;i:14;i:100001;i:15;i:200001;}}'),('ec_maxcredits','1000'),('ec_maxcreditspermonth','0'),('ec_mincredits','0'),('ec_ratio','0'),('ec_tenpay_bargainor',''),('ec_tenpay_key',''),('editedby','1'),('editoroptions','1'),('edittimelimit',''),('exchangemincredits','100'),('extcredits','a:2:{i:1;a:3:{s:5:\"title\";s:6:\"威望\";s:12:\"showinthread\";s:0:\"\";s:9:\"available\";i:1;}i:2;a:3:{s:5:\"title\";s:6:\"金钱\";s:12:\"showinthread\";s:0:\"\";s:9:\"available\";i:1;}}'),('fastpost','1'),('floodctrl','15'),('forumjump','0'),('forumlinkstatus','1'),('frameon','0'),('framewidth','180'),('ftp','a:10:{s:2:\"on\";s:1:\"0\";s:3:\"ssl\";s:1:\"0\";s:4:\"host\";s:0:\"\";s:4:\"port\";s:2:\"21\";s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";s:9:\"attachdir\";s:1:\".\";s:9:\"attachurl\";s:0:\"\";s:7:\"hideurl\";s:1:\"0\";s:7:\"timeout\";s:1:\"0\";}'),('globalstick','1'),('google','1'),('gzipcompress','0'),('heatthread','a:3:{s:5:\"reply\";i:5;s:9:\"recommend\";i:3;s:8:\"hottopic\";s:10:\"50,100,200\";}'),('hideprivate','1'),('historyposts','1	1'),('hottopic','10'),('icp',''),('imageimpath',''),('imagelib','0'),('indexhot',''),('indexname','index.php'),('indextype','classics'),('infosidestatus','0'),('initcredits','0,0,0,0,0,0,0,0,0'),('inviteconfig',''),('ipaccess',''),('ipregctrl',''),('jscachelife','1800'),('jsdateformat',''),('jspath','forumdata/cache/'),('jsrefdomains',''),('jsstatus','0'),('jswizard',''),('karmaratelimit','0'),('loadctrl','0'),('losslessdel','365'),('magicdiscount','85'),('magicmarket','1'),('magicstatus','1'),('mail','a:10:{s:8:\"mailsend\";s:1:\"1\";s:6:\"server\";s:13:\"smtp.21cn.com\";s:4:\"port\";s:2:\"25\";s:4:\"auth\";s:1:\"1\";s:4:\"from\";s:26:\"Discuz <username@21cn.com>\";s:13:\"auth_username\";s:17:\"username@21cn.com\";s:13:\"auth_password\";s:8:\"password\";s:13:\"maildelimiter\";s:1:\"0\";s:12:\"mailusername\";s:1:\"1\";s:15:\"sendmail_silent\";s:1:\"1\";}'),('maxavatarpixel','120'),('maxavatarsize','20000'),('maxbdays','0'),('maxchargespan','0'),('maxfavorites','100'),('maxincperthread','0'),('maxmagicprice','50'),('maxmodworksmonths','3'),('maxonlinelist','0'),('maxonlines','5000'),('maxpolloptions','10'),('maxpostsize','10000'),('maxsearchresults','500'),('maxsigrows','100'),('maxsmilies','10'),('maxspm','0'),('membermaxpages','100'),('memberperpage','25'),('memliststatus','1'),('minpostsize','10'),('moddisplay','flat'),('modratelimit','0'),('modreasons','广告/SPAM\r\n恶意灌水\r\n违规内容\r\n文不对题\r\n重复发帖\r\n\r\n我很赞同\r\n精品文章\r\n原创内容'),('modworkstatus','1'),('msgforward','a:3:{s:11:\"refreshtime\";i:3;s:5:\"quick\";i:1;s:8:\"messages\";a:13:{i:0;s:19:\"thread_poll_succeed\";i:1;s:19:\"thread_rate_succeed\";i:2;s:23:\"usergroups_join_succeed\";i:3;s:23:\"usergroups_exit_succeed\";i:4;s:25:\"usergroups_update_succeed\";i:5;s:20:\"buddy_update_succeed\";i:6;s:17:\"post_edit_succeed\";i:7;s:18:\"post_reply_succeed\";i:8;s:24:\"post_edit_delete_succeed\";i:9;s:22:\"post_newthread_succeed\";i:10;s:13:\"admin_succeed\";i:11;s:17:\"pm_delete_succeed\";i:12;s:15:\"search_redirect\";}}'),('msn',''),('newbiespan','0'),('newbietasks',''),('newbietaskupdate',''),('newsletter',''),('nocacheheaders','0'),('oltimespan','10'),('onlinehold','15'),('onlinerecord','1	1040034649'),('outextcredits',''),('postbanperiods',''),('postmodperiods',''),('postno','#'),('postnocustom',''),('postperpage','10'),('pvfrequence','60'),('pwdsafety',''),('qihoo','a:9:{s:6:\"status\";i:0;s:9:\"searchbox\";i:6;s:7:\"summary\";i:1;s:6:\"jammer\";i:1;s:9:\"maxtopics\";i:10;s:8:\"keywords\";s:0:\"\";s:10:\"adminemail\";s:0:\"\";s:8:\"validity\";i:1;s:14:\"relatedthreads\";a:6:{s:6:\"bbsnum\";i:0;s:6:\"webnum\";i:0;s:4:\"type\";a:3:{s:4:\"blog\";s:4:\"blog\";s:4:\"news\";s:4:\"news\";s:3:\"bbs\";s:3:\"bbs\";}s:6:\"banurl\";s:0:\"\";s:8:\"position\";i:1;s:8:\"validity\";i:1;}}'),('ratelogrecord','5'),('recommendthread',''),('regctrl','0'),('regfloodctrl','0'),('reglinkname','注册'),('regname','register.php'),('regstatus','1'),('regverify','0'),('relatedtag',''),('reportpost','1'),('rewritecompatible',''),('rewritestatus','0'),('rssstatus','1'),('rssttl','60'),('runwizard','1'),('searchbanperiods',''),('searchctrl','30'),('seccodedata','a:13:{s:8:\"minposts\";s:0:\"\";s:16:\"loginfailedcount\";i:0;s:5:\"width\";i:150;s:6:\"height\";i:60;s:4:\"type\";s:1:\"0\";s:10:\"background\";s:1:\"1\";s:10:\"adulterate\";s:1:\"1\";s:3:\"ttf\";s:1:\"0\";s:5:\"angle\";s:1:\"0\";s:5:\"color\";s:1:\"1\";s:4:\"size\";s:1:\"0\";s:6:\"shadow\";s:1:\"1\";s:8:\"animator\";s:1:\"0\";}'),('seccodestatus','0'),('seclevel','1'),('secqaa','a:2:{s:8:\"minposts\";s:1:\"1\";s:6:\"status\";i:0;}'),('seodescription',''),('seohead',''),('seokeywords',''),('seotitle',''),('showemail',''),('showimages','1'),('showsettings','7'),('sigviewcond','0'),('sitemessage',''),('sitename','Comsenz Inc.'),('siteuniqueid','MEEJej8732jB9WVD'),('siteurl','http://www.comsenz.com/'),('smcols','8'),('smrows','5'),('smthumb','20'),('spacedata','a:11:{s:9:\"cachelife\";s:3:\"900\";s:14:\"limitmythreads\";s:1:\"5\";s:14:\"limitmyreplies\";s:1:\"5\";s:14:\"limitmyrewards\";s:1:\"5\";s:13:\"limitmytrades\";s:1:\"5\";s:13:\"limitmyvideos\";s:1:\"0\";s:12:\"limitmyblogs\";s:1:\"8\";s:14:\"limitmyfriends\";s:1:\"0\";s:16:\"limitmyfavforums\";s:1:\"5\";s:17:\"limitmyfavthreads\";s:1:\"0\";s:10:\"textlength\";s:3:\"300\";}'),('spacestatus','1'),('starthreshold','2'),('statcode',''),('statscachelife','180'),('statstatus',''),('styleid','1'),('stylejump','1'),('subforumsindex',''),('swfupload','1'),('tagstatus','1'),('taskon','0'),('threadmaxpages','1000'),('threadsticky','全局置顶,分类置顶,本版置顶'),('thumbheight','300'),('thumbquality','100'),('thumbstatus','0'),('thumbwidth','400'),('timeformat','H:i'),('timeoffset','8'),('topicperpage','20'),('tradetypes',''),('transfermincredits','1000'),('transsidstatus','0'),('uc','a:1:{s:7:\"addfeed\";i:1;}'),('ucactivation','1'),('upgradeurl','http://localhost/develop/dzhead/develop/upgrade.php'),('userdateformat','Y-n-j\r\nY/n/j\r\nj-n-Y\r\nj/n/Y'),('userstatusby','1'),('viewthreadtags','100'),('visitbanperiods',''),('visitedforums','10'),('vtonlinestatus','1'),('wapcharset','2'),('wapdateformat','n/j'),('wapmps','500'),('wapppp','5'),('wapregister','0'),('wapstatus','0'),('waptpp','10'),('warningexpiration','3'),('warninglimit','3'),('watermarkminheight','0'),('watermarkminwidth','0'),('watermarkquality','80'),('watermarkstatus','0'),('watermarktext',''),('watermarktrans','65'),('watermarktype','0'),('welcomemsg','1'),('welcomemsgtitle','{username}，您好，感谢您的注册，请阅读以下内容。'),('welcomemsgtxt','尊敬的{username}，您已经注册成为{sitename}的会员，请您在发表言论时，遵守当地法律法规。\r\n如果您有什么疑问可以联系管理员，Email: {adminemail}。\r\n\r\n\r\n{bbname}\r\n{time}'),('whosonlinestatus','1'),('whosonline_contract','0'),('zoomstatus','1'),('ratelogon','0'),('forumseparator','1'),('allowattachurl','0'),('allowviewuserthread',''),('ipverifywhite',''),('tasktypes','a:3:{s:9:\"promotion\";a:2:{s:4:\"name\";s:18:\"论坛推广任务\";s:7:\"version\";s:3:\"1.0\";}s:4:\"gift\";a:2:{s:4:\"name\";s:15:\"红包类任务\";s:7:\"version\";s:3:\"1.0\";}s:6:\"avatar\";a:2:{s:4:\"name\";s:15:\"头像类任务\";s:7:\"version\";s:3:\"1.0\";}}');
/*!40000 ALTER TABLE `cdb_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_smilies`
--

DROP TABLE IF EXISTS `cdb_smilies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_smilies` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(6) unsigned NOT NULL,
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `type` enum('smiley','icon','stamp') NOT NULL DEFAULT 'smiley',
  `code` varchar(30) NOT NULL DEFAULT '',
  `url` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_smilies`
--

LOCK TABLES `cdb_smilies` WRITE;
/*!40000 ALTER TABLE `cdb_smilies` DISABLE KEYS */;
INSERT INTO `cdb_smilies` VALUES (1,1,1,'smiley',':)','smile.gif'),(2,1,2,'smiley',':(','sad.gif'),(3,1,3,'smiley',':D','biggrin.gif'),(4,1,4,'smiley',':\'(','cry.gif'),(5,1,5,'smiley',':@','huffy.gif'),(6,1,6,'smiley',':o','shocked.gif'),(7,1,7,'smiley',':P','tongue.gif'),(8,1,8,'smiley',':$','shy.gif'),(9,1,9,'smiley',';P','titter.gif'),(10,1,10,'smiley',':L','sweat.gif'),(11,1,11,'smiley',':Q','mad.gif'),(12,1,12,'smiley',':lol','lol.gif'),(13,1,13,'smiley',':loveliness:','loveliness.gif'),(14,1,14,'smiley',':funk:','funk.gif'),(15,1,15,'smiley',':curse:','curse.gif'),(16,1,16,'smiley',':dizzy:','dizzy.gif'),(17,1,17,'smiley',':shutup:','shutup.gif'),(18,1,18,'smiley',':sleepy:','sleepy.gif'),(19,1,19,'smiley',':hug:','hug.gif'),(20,1,20,'smiley',':victory:','victory.gif'),(21,1,21,'smiley',':time:','time.gif'),(22,1,22,'smiley',':kiss:','kiss.gif'),(23,1,23,'smiley',':handshake','handshake.gif'),(24,1,24,'smiley',':call:','call.gif'),(25,2,1,'smiley','{:2_25:}','01.gif'),(26,2,2,'smiley','{:2_26:}','02.gif'),(27,2,3,'smiley','{:2_27:}','03.gif'),(28,2,4,'smiley','{:2_28:}','04.gif'),(29,2,5,'smiley','{:2_29:}','05.gif'),(30,2,6,'smiley','{:2_30:}','06.gif'),(31,2,7,'smiley','{:2_31:}','07.gif'),(32,2,8,'smiley','{:2_32:}','08.gif'),(33,2,9,'smiley','{:2_33:}','09.gif'),(34,2,10,'smiley','{:2_34:}','10.gif'),(35,2,11,'smiley','{:2_35:}','11.gif'),(36,2,12,'smiley','{:2_36:}','12.gif'),(37,2,13,'smiley','{:2_37:}','13.gif'),(38,2,14,'smiley','{:2_38:}','14.gif'),(39,2,15,'smiley','{:2_39:}','15.gif'),(40,2,16,'smiley','{:2_40:}','16.gif'),(41,3,1,'smiley','{:3_41:}','01.gif'),(42,3,2,'smiley','{:3_42:}','02.gif'),(43,3,3,'smiley','{:3_43:}','03.gif'),(44,3,4,'smiley','{:3_44:}','04.gif'),(45,3,5,'smiley','{:3_45:}','05.gif'),(46,3,6,'smiley','{:3_46:}','06.gif'),(47,3,7,'smiley','{:3_47:}','07.gif'),(48,3,8,'smiley','{:3_48:}','08.gif'),(49,3,9,'smiley','{:3_49:}','09.gif'),(50,3,10,'smiley','{:3_50:}','10.gif'),(51,3,11,'smiley','{:3_51:}','11.gif'),(52,3,12,'smiley','{:3_52:}','12.gif'),(53,3,13,'smiley','{:3_53:}','13.gif'),(54,3,14,'smiley','{:3_54:}','14.gif'),(55,3,15,'smiley','{:3_55:}','15.gif'),(56,3,16,'smiley','{:3_56:}','16.gif'),(57,3,17,'smiley','{:3_57:}','17.gif'),(58,3,18,'smiley','{:3_58:}','18.gif'),(59,3,19,'smiley','{:3_59:}','19.gif'),(60,3,20,'smiley','{:3_60:}','20.gif'),(61,3,21,'smiley','{:3_61:}','21.gif'),(62,3,22,'smiley','{:3_62:}','22.gif'),(63,3,23,'smiley','{:3_63:}','23.gif'),(64,3,24,'smiley','{:3_64:}','24.gif'),(65,0,1,'icon','','icon1.gif'),(66,0,2,'icon','','icon2.gif'),(67,0,3,'icon','','icon3.gif'),(68,0,4,'icon','','icon4.gif'),(69,0,5,'icon','','icon5.gif'),(70,0,6,'icon','','icon6.gif'),(71,0,7,'icon','','icon7.gif'),(72,0,8,'icon','','icon8.gif'),(73,0,9,'icon','','icon9.gif'),(74,0,10,'icon','','icon10.gif'),(75,0,11,'icon','','icon11.gif'),(76,0,12,'icon','','icon12.gif'),(77,0,13,'icon','','icon13.gif'),(78,0,14,'icon','','icon14.gif'),(79,0,15,'icon','','icon15.gif'),(80,0,16,'icon','','icon16.gif'),(81,0,0,'stamp','精华','001.gif'),(82,0,1,'stamp','热帖','002.gif'),(83,0,2,'stamp','美图','003.gif'),(84,0,3,'stamp','优秀','004.gif'),(85,0,4,'stamp','置顶','005.gif'),(86,0,5,'stamp','推荐','006.gif'),(87,0,6,'stamp','原创','007.gif'),(88,0,7,'stamp','版主推荐','008.gif'),(89,0,8,'stamp','爆料','009.gif');
/*!40000 ALTER TABLE `cdb_smilies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_spacecaches`
--

DROP TABLE IF EXISTS `cdb_spacecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_spacecaches` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `variable` varchar(20) NOT NULL,
  `value` text NOT NULL,
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_spacecaches`
--

LOCK TABLES `cdb_spacecaches` WRITE;
/*!40000 ALTER TABLE `cdb_spacecaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_spacecaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_stats`
--

DROP TABLE IF EXISTS `cdb_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_stats` (
  `type` char(10) NOT NULL DEFAULT '',
  `variable` char(10) NOT NULL DEFAULT '',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`type`,`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_stats`
--

LOCK TABLES `cdb_stats` WRITE;
/*!40000 ALTER TABLE `cdb_stats` DISABLE KEYS */;
INSERT INTO `cdb_stats` VALUES ('total','hits',1),('total','members',0),('total','guests',1),('os','Windows',1),('os','Mac',0),('os','Linux',0),('os','FreeBSD',0),('os','SunOS',0),('os','OS/2',0),('os','AIX',0),('os','Spiders',0),('os','Other',0),('browser','MSIE',1),('browser','Netscape',0),('browser','Mozilla',0),('browser','Lynx',0),('browser','Opera',0),('browser','Konqueror',0),('browser','Other',0),('week','0',0),('week','1',1),('week','2',0),('week','3',0),('week','4',0),('week','5',0),('week','6',0),('hour','00',0),('hour','01',0),('hour','02',0),('hour','03',0),('hour','04',0),('hour','05',0),('hour','06',0),('hour','07',0),('hour','08',0),('hour','09',0),('hour','10',1),('hour','11',0),('hour','12',0),('hour','13',0),('hour','14',0),('hour','15',0),('hour','16',0),('hour','17',0),('hour','18',0),('hour','19',0),('hour','20',0),('hour','21',0),('hour','22',0),('hour','23',0),('browser','Firefox',0),('browser','Safari',0);
/*!40000 ALTER TABLE `cdb_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_statvars`
--

DROP TABLE IF EXISTS `cdb_statvars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_statvars` (
  `type` varchar(20) NOT NULL DEFAULT '',
  `variable` varchar(20) NOT NULL DEFAULT '',
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`type`,`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_statvars`
--

LOCK TABLES `cdb_statvars` WRITE;
/*!40000 ALTER TABLE `cdb_statvars` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_statvars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_styles`
--

DROP TABLE IF EXISTS `cdb_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_styles` (
  `styleid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `available` tinyint(1) NOT NULL DEFAULT '1',
  `templateid` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`styleid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_styles`
--

LOCK TABLES `cdb_styles` WRITE;
/*!40000 ALTER TABLE `cdb_styles` DISABLE KEYS */;
INSERT INTO `cdb_styles` VALUES (1,'默认风格',1,1);
/*!40000 ALTER TABLE `cdb_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_stylevars`
--

DROP TABLE IF EXISTS `cdb_stylevars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_stylevars` (
  `stylevarid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `styleid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `variable` text NOT NULL,
  `substitute` text NOT NULL,
  PRIMARY KEY (`stylevarid`),
  KEY `styleid` (`styleid`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_stylevars`
--

LOCK TABLES `cdb_stylevars` WRITE;
/*!40000 ALTER TABLE `cdb_stylevars` DISABLE KEYS */;
INSERT INTO `cdb_stylevars` VALUES (1,1,'stypeid','1'),(2,1,'available',''),(3,1,'boardimg','logo.gif'),(4,1,'imgdir',''),(5,1,'styleimgdir',''),(6,1,'font','Verdana, Helvetica, Arial, sans-serif'),(7,1,'fontsize','12px'),(8,1,'smfont','Verdana, Helvetica, Arial, sans-serif'),(9,1,'smfontsize','0.83em'),(10,1,'tabletext','#444'),(11,1,'midtext','#666'),(12,1,'lighttext','#999'),(13,1,'link','#000'),(14,1,'highlightlink','#09C'),(15,1,'noticetext','#F60'),(16,1,'msgfontsize','14px'),(17,1,'msgbigsize','16px'),(18,1,'bgcolor','#0D2345 bodybg.gif repeat-x 0 90px'),(19,1,'sidebgcolor','#FFF sidebg.gif repeat-y 100% 0'),(20,1,'headerborder','1px'),(21,1,'headerbordercolor','#00B2E8'),(22,1,'headerbgcolor','#00A2D2 header.gif repeat-x 0 100%'),(23,1,'headertext','#97F2FF'),(24,1,'footertext','#8691A2'),(25,1,'menuborder','#B0E4EF'),(26,1,'menubgcolor','#EBF4FD mtabbg.gif repeat-x 0 100%'),(27,1,'menutext','#666'),(28,1,'menuhover','#1E4B7E'),(29,1,'menuhovertext','#C3D3E4'),(30,1,'wrapwidth','960px'),(31,1,'wrapbg','#FFF'),(32,1,'wrapborder','0'),(33,1,'wrapbordercolor',''),(34,1,'contentwidth','600px'),(35,1,'contentseparate','#D3E8F2'),(36,1,'inputborder','#CCC'),(37,1,'inputborderdarkcolor','#999'),(38,1,'inputbg','#FFF'),(39,1,'commonborder','#E6E7E1'),(40,1,'commonbg','#F7F7F7'),(41,1,'specialborder','#E3EDF5'),(42,1,'specialbg','#EBF2F8'),(43,1,'interleavecolor','#F5F5F5'),(44,1,'dropmenuborder','#7FCAE2'),(45,1,'dropmenubgcolor','#FEFEFE'),(46,1,'floatmaskbgcolor','#7FCAE2'),(47,1,'floatbgcolor','#F1F5FA');
/*!40000 ALTER TABLE `cdb_stylevars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_tags`
--

DROP TABLE IF EXISTS `cdb_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_tags` (
  `tagname` char(20) NOT NULL,
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `total` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`tagname`),
  KEY `total` (`total`),
  KEY `closed` (`closed`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_tags`
--

LOCK TABLES `cdb_tags` WRITE;
/*!40000 ALTER TABLE `cdb_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_tasks`
--

DROP TABLE IF EXISTS `cdb_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_tasks` (
  `taskid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `relatedtaskid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `newbietask` tinyint(1) NOT NULL DEFAULT '0',
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `icon` varchar(150) NOT NULL DEFAULT '',
  `applicants` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `achievers` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tasklimits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `applyperm` text NOT NULL,
  `scriptname` varchar(50) NOT NULL DEFAULT '',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `period` int(10) unsigned NOT NULL DEFAULT '0',
  `reward` enum('credit','magic','medal','invite','group') NOT NULL DEFAULT 'credit',
  `prize` varchar(15) NOT NULL DEFAULT '',
  `bonus` int(10) NOT NULL DEFAULT '0',
  `displayorder` smallint(6) NOT NULL DEFAULT '0',
  `version` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`taskid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_tasks`
--

LOCK TABLES `cdb_tasks` WRITE;
/*!40000 ALTER TABLE `cdb_tasks` DISABLE KEYS */;
INSERT INTO `cdb_tasks` VALUES (1,0,1,0,'回帖是一种美德','学习回帖，看帖回帖是一种美德，BS看帖不回帖的','',0,0,0,'all','newbie_post_reply',0,0,0,'credit','2',10,-1,''),(2,0,1,0,'我的第一次','学会发主题帖，成为社区的焦点','',0,0,0,'all','newbie_post_newthread',0,0,0,'credit','2',10,-1,''),(3,0,1,0,'与众不同','修改个人资料，让你和别人与众不同','',0,0,0,'all','newbie_modifyprofile',0,0,0,'credit','2',10,-1,''),(4,0,1,0,'我型我秀','上传头像，让大家认识一个全新的你','',0,0,0,'all','newbie_uploadavatar',0,0,0,'credit','2',10,-1,''),(5,0,1,0,'联络感情','给其他用户发个发短消息，大家联络一下感情','',0,0,0,'all','newbie_sendpm',0,0,0,'credit','2',10,-1,''),(6,0,1,0,'一个好汉三个帮','出来混的，没几个好友怎么行，加个好友吧','',0,0,0,'all','newbie_addbuddy',0,0,0,'credit','2',10,-1,''),(7,0,1,0,'信息时代','信息时代最缺的什么？搜索','',0,0,0,'all','newbie_search',0,0,0,'credit','2',10,-1,'');
/*!40000 ALTER TABLE `cdb_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_taskvars`
--

DROP TABLE IF EXISTS `cdb_taskvars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_taskvars` (
  `taskvarid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `taskid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `sort` enum('apply','complete','setting') NOT NULL DEFAULT 'complete',
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `variable` varchar(40) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT 'text',
  `value` text NOT NULL,
  `extra` text NOT NULL,
  PRIMARY KEY (`taskvarid`),
  KEY `taskid` (`taskid`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_taskvars`
--

LOCK TABLES `cdb_taskvars` WRITE;
/*!40000 ALTER TABLE `cdb_taskvars` DISABLE KEYS */;
INSERT INTO `cdb_taskvars` VALUES (1,1,'complete','回复指定主题','设置会员只有回复该主题才能完成任务，请填写主题的 tid(比如一个主题的地址是 http://localhost/viewthread.php?tid=8 那么该主题的 tid 就是 8)，留空为不限制','threadid','text','0',''),(2,1,'setting','','','entrance','text','viewthread',''),(3,2,'complete','在指定版块发表新主题','设置会员必须在某个版块发表至少一篇新主题才能完成任务','forumid','text','',''),(4,2,'setting','','','entrance','text','forumdisplay',''),(5,3,'complete','完善个人资料','申请任务后只要把自己的个人资料填写完整即可完成任务','','','',''),(6,3,'setting','','','entrance','text','memcp',''),(7,4,'complete','上传头像','申请任务后只要成功上传头像即可完成任务','','','',''),(8,4,'setting','','','entrance','text','memcp',''),(9,5,'complete','给指定会员发送短消息','只有给该会员成功发送短消息才能完成任务，请填写该会员的用户名','authorid','text','',''),(10,5,'setting','','','entrance','text','space',''),(11,6,'complete','将指定会员加为好友','只有将该会员加为好友才能完成任务，请填写该会员的用户名','authorid','text','',''),(12,6,'setting','','','entrance','text','space',''),(13,7,'complete','学会搜索','申请任务后只要成功使用论坛搜索功能即可完成任务','','','',''),(14,7,'setting','','','entrance','text','search','');
/*!40000 ALTER TABLE `cdb_taskvars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_templates`
--

DROP TABLE IF EXISTS `cdb_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_templates` (
  `templateid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `directory` varchar(100) NOT NULL DEFAULT '',
  `copyright` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`templateid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_templates`
--

LOCK TABLES `cdb_templates` WRITE;
/*!40000 ALTER TABLE `cdb_templates` DISABLE KEYS */;
INSERT INTO `cdb_templates` VALUES (1,'默认模板套系','./templates/default','康盛创想（北京）科技有限公司');
/*!40000 ALTER TABLE `cdb_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_threads`
--

DROP TABLE IF EXISTS `cdb_threads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_threads` (
  `tid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `fid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `iconid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `sortid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `readperm` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `price` smallint(6) NOT NULL DEFAULT '0',
  `author` char(15) NOT NULL DEFAULT '',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subject` char(80) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `lastpost` int(10) unsigned NOT NULL DEFAULT '0',
  `lastposter` char(15) NOT NULL DEFAULT '',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `replies` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `displayorder` tinyint(1) NOT NULL DEFAULT '0',
  `highlight` tinyint(1) NOT NULL DEFAULT '0',
  `digest` tinyint(1) NOT NULL DEFAULT '0',
  `rate` tinyint(1) NOT NULL DEFAULT '0',
  `special` tinyint(1) NOT NULL DEFAULT '0',
  `attachment` tinyint(1) NOT NULL DEFAULT '0',
  `moderated` tinyint(1) NOT NULL DEFAULT '0',
  `closed` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `itemid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `supe_pushstatus` tinyint(1) NOT NULL DEFAULT '0',
  `recommends` smallint(6) NOT NULL,
  `recommend_add` smallint(6) NOT NULL,
  `recommend_sub` smallint(6) NOT NULL,
  `heats` int(10) unsigned NOT NULL DEFAULT '0',
  `status` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `digest` (`digest`),
  KEY `sortid` (`sortid`),
  KEY `displayorder` (`fid`,`displayorder`,`lastpost`),
  KEY `typeid` (`fid`,`typeid`,`displayorder`,`lastpost`),
  KEY `recommends` (`recommends`),
  KEY `heats` (`heats`),
  KEY `authorid` (`authorid`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_threads`
--

LOCK TABLES `cdb_threads` WRITE;
/*!40000 ALTER TABLE `cdb_threads` DISABLE KEYS */;
INSERT INTO `cdb_threads` VALUES (1,2,0,0,0,0,0,'admin',1,'论坛运营秘籍 - Discuz! 7.2 新功能的妙用',1333532445,1333532445,'admin',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2,2,0,0,0,0,0,'admin',1,'Discuz! 7.2 新功能－－站长推荐',1333532445,1333532445,'admin',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(3,2,0,0,0,0,0,'admin',1,'论坛热点：在第一眼就留住用户',1333532445,1333532445,'admin',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(4,2,0,0,0,0,0,'admin',1,'Discuz! 7.2新特性－－主题热度/评价',1333532445,1333532445,'admin',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(5,2,0,0,0,0,0,'admin',1,'Discuz! 7.2 新特性－－推荐主题',1333532445,1333532445,'admin',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(6,2,0,0,0,0,0,'admin',1,'Discuz! 7.2 新特性－－新手任务',1333532445,1333532445,'admin',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(7,2,0,0,0,0,0,'admin',1,'主题关注：让论坛帖子动起来',1333532445,1333532445,'admin',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(8,2,0,0,0,0,0,'admin',1,'Discuz! 7.2 新特性－－论坛动态',1333532445,1333532445,'admin',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(9,2,0,0,0,0,0,'admin',1,'Discuz! 7.2 新特性－－提醒系统',1333532445,1333532445,'admin',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(10,2,0,0,0,0,0,'admin',1,'帖子编辑器：轻轻松松发帖',1333532445,1333532445,'admin',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(11,2,0,0,0,0,0,'admin',1,'转发视频：更易更强大',1333532445,1333532445,'admin',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(12,2,0,0,0,0,0,'admin',1,'Discuz!7.2 新特性－－Manyou应用的开启',1333532445,1333532445,'admin',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(13,2,0,0,0,0,0,'admin',1,'7.2新增功能及功能强化',1333532445,1333532445,'admin',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `cdb_threads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_threadsmod`
--

DROP TABLE IF EXISTS `cdb_threadsmod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_threadsmod` (
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  `action` char(5) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `magicid` smallint(6) unsigned NOT NULL,
  `stamp` tinyint(3) NOT NULL,
  KEY `tid` (`tid`,`dateline`),
  KEY `expiration` (`expiration`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_threadsmod`
--

LOCK TABLES `cdb_threadsmod` WRITE;
/*!40000 ALTER TABLE `cdb_threadsmod` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_threadsmod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_threadtags`
--

DROP TABLE IF EXISTS `cdb_threadtags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_threadtags` (
  `tagname` char(20) NOT NULL,
  `tid` int(10) unsigned NOT NULL,
  KEY `tagname` (`tagname`),
  KEY `tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_threadtags`
--

LOCK TABLES `cdb_threadtags` WRITE;
/*!40000 ALTER TABLE `cdb_threadtags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_threadtags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_threadtypes`
--

DROP TABLE IF EXISTS `cdb_threadtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_threadtypes` (
  `typeid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `displayorder` smallint(6) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `special` smallint(6) NOT NULL DEFAULT '0',
  `modelid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `expiration` tinyint(1) NOT NULL DEFAULT '0',
  `template` text NOT NULL,
  `stemplate` text NOT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_threadtypes`
--

LOCK TABLES `cdb_threadtypes` WRITE;
/*!40000 ALTER TABLE `cdb_threadtypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_threadtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_tradecomments`
--

DROP TABLE IF EXISTS `cdb_tradecomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_tradecomments` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `orderid` char(32) NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL,
  `raterid` mediumint(8) unsigned NOT NULL,
  `rater` char(15) NOT NULL,
  `rateeid` mediumint(8) unsigned NOT NULL,
  `ratee` char(15) NOT NULL,
  `message` char(200) NOT NULL,
  `explanation` char(200) NOT NULL,
  `score` tinyint(1) NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `raterid` (`raterid`,`type`,`dateline`),
  KEY `rateeid` (`rateeid`,`type`,`dateline`),
  KEY `orderid` (`orderid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_tradecomments`
--

LOCK TABLES `cdb_tradecomments` WRITE;
/*!40000 ALTER TABLE `cdb_tradecomments` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_tradecomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_tradelog`
--

DROP TABLE IF EXISTS `cdb_tradelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_tradelog` (
  `tid` mediumint(8) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `orderid` varchar(32) NOT NULL,
  `tradeno` varchar(32) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quality` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `itemtype` tinyint(1) NOT NULL DEFAULT '0',
  `number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tax` decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  `locus` varchar(100) NOT NULL,
  `sellerid` mediumint(8) unsigned NOT NULL,
  `seller` varchar(15) NOT NULL,
  `selleraccount` varchar(50) NOT NULL,
  `buyerid` mediumint(8) unsigned NOT NULL,
  `buyer` varchar(15) NOT NULL,
  `buyercontact` varchar(50) NOT NULL,
  `buyercredits` smallint(5) unsigned NOT NULL DEFAULT '0',
  `buyermsg` varchar(200) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  `offline` tinyint(1) NOT NULL DEFAULT '0',
  `buyername` varchar(50) NOT NULL,
  `buyerzip` varchar(10) NOT NULL,
  `buyerphone` varchar(20) NOT NULL,
  `buyermobile` varchar(20) NOT NULL,
  `transport` tinyint(1) NOT NULL DEFAULT '0',
  `transportfee` smallint(6) unsigned NOT NULL DEFAULT '0',
  `baseprice` decimal(8,2) NOT NULL,
  `discount` tinyint(1) NOT NULL DEFAULT '0',
  `ratestatus` tinyint(1) NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `credit` int(10) unsigned NOT NULL DEFAULT '0',
  `basecredit` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `orderid` (`orderid`),
  KEY `sellerid` (`sellerid`),
  KEY `buyerid` (`buyerid`),
  KEY `status` (`status`),
  KEY `buyerlog` (`buyerid`,`status`,`lastupdate`),
  KEY `sellerlog` (`sellerid`,`status`,`lastupdate`),
  KEY `tid` (`tid`,`pid`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_tradelog`
--

LOCK TABLES `cdb_tradelog` WRITE;
/*!40000 ALTER TABLE `cdb_tradelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_tradelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_tradeoptionvars`
--

DROP TABLE IF EXISTS `cdb_tradeoptionvars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_tradeoptionvars` (
  `sortid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `optionid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `value` mediumtext NOT NULL,
  KEY `sortid` (`sortid`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_tradeoptionvars`
--

LOCK TABLES `cdb_tradeoptionvars` WRITE;
/*!40000 ALTER TABLE `cdb_tradeoptionvars` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_tradeoptionvars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_trades`
--

DROP TABLE IF EXISTS `cdb_trades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_trades` (
  `tid` mediumint(8) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `typeid` smallint(6) unsigned NOT NULL,
  `sellerid` mediumint(8) unsigned NOT NULL,
  `seller` char(15) NOT NULL,
  `account` char(50) NOT NULL,
  `subject` char(100) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `amount` smallint(6) unsigned NOT NULL DEFAULT '1',
  `quality` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `locus` char(20) NOT NULL,
  `transport` tinyint(1) NOT NULL DEFAULT '0',
  `ordinaryfee` smallint(4) unsigned NOT NULL DEFAULT '0',
  `expressfee` smallint(4) unsigned NOT NULL DEFAULT '0',
  `emsfee` smallint(4) unsigned NOT NULL DEFAULT '0',
  `itemtype` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  `lastbuyer` char(15) NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  `totalitems` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tradesum` decimal(8,2) NOT NULL DEFAULT '0.00',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `aid` mediumint(8) unsigned NOT NULL,
  `displayorder` tinyint(1) NOT NULL,
  `costprice` decimal(8,2) NOT NULL,
  `credit` int(10) unsigned NOT NULL DEFAULT '0',
  `costcredit` int(10) unsigned NOT NULL DEFAULT '0',
  `credittradesum` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`,`pid`),
  KEY `sellerid` (`sellerid`),
  KEY `totalitems` (`totalitems`),
  KEY `tradesum` (`tradesum`),
  KEY `displayorder` (`tid`,`displayorder`),
  KEY `sellertrades` (`sellerid`,`tradesum`,`totalitems`),
  KEY `typeid` (`typeid`),
  KEY `credittradesum` (`credittradesum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_trades`
--

LOCK TABLES `cdb_trades` WRITE;
/*!40000 ALTER TABLE `cdb_trades` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_trades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_typemodels`
--

DROP TABLE IF EXISTS `cdb_typemodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_typemodels` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `options` mediumtext NOT NULL,
  `customoptions` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_typemodels`
--

LOCK TABLES `cdb_typemodels` WRITE;
/*!40000 ALTER TABLE `cdb_typemodels` DISABLE KEYS */;
INSERT INTO `cdb_typemodels` VALUES (1,'房屋交易信息',0,1,'7	10	13	65	66	68',''),(2,'车票交易信息',0,1,'55	56	58	67	7	13	68',''),(3,'兴趣交友信息',0,1,'8	9	31',''),(4,'公司招聘信息',0,1,'34	48	54	51	47	46	44	45	52	53','');
/*!40000 ALTER TABLE `cdb_typemodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_typeoptions`
--

DROP TABLE IF EXISTS `cdb_typeoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_typeoptions` (
  `optionid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `classid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `identifier` varchar(40) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `unit` varchar(40) NOT NULL,
  `rules` mediumtext NOT NULL,
  PRIMARY KEY (`optionid`),
  KEY `classid` (`classid`)
) ENGINE=MyISAM AUTO_INCREMENT=3001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_typeoptions`
--

LOCK TABLES `cdb_typeoptions` WRITE;
/*!40000 ALTER TABLE `cdb_typeoptions` DISABLE KEYS */;
INSERT INTO `cdb_typeoptions` VALUES (1,0,0,'通用类','','','','',''),(2,0,0,'房产类','','','','',''),(3,0,0,'交友类','','','','',''),(4,0,0,'求职招聘类','','','','',''),(5,0,0,'交易类','','','','',''),(6,0,0,'互联网类','','','','',''),(7,1,0,'姓名','','name','text','',''),(9,1,0,'年龄','','age','number','',''),(10,1,0,'地址','','address','text','',''),(11,1,0,'QQ','','qq','number','',''),(12,1,0,'邮箱','','mail','email','',''),(13,1,0,'电话','','phone','text','',''),(14,5,0,'培训费用','','teach_pay','text','',''),(15,5,0,'培训时间','','teach_time','text','',''),(20,2,0,'楼层','','floor','number','',''),(21,2,0,'交通状况','','traf','textarea','',''),(22,2,0,'地图','','images','image','',''),(24,2,0,'价格','','price','text','',''),(26,5,0,'培训名称','','teach_name','text','',''),(28,3,0,'身高','','heighth','number','',''),(29,3,0,'体重','','weighth','number','',''),(33,1,0,'照片','','photo','image','',''),(35,5,0,'服务方式','','service_type','text','',''),(36,5,0,'服务时间','','service_time','text','',''),(37,5,0,'服务费用','','service_pay','text','',''),(39,6,0,'网址','','site_url','url','',''),(40,6,0,'电子邮件','','site_mail','email','',''),(42,6,0,'网站名称','','site_name','text','',''),(46,4,0,'职位','','recr_intend','text','',''),(47,4,0,'工作地点','','recr_palce','text','',''),(49,4,0,'有效期至','','recr_end','calendar','',''),(51,4,0,'公司名称','','recr_com','text','',''),(52,4,0,'年龄要求','','recr_age','text','',''),(54,4,0,'专业','','recr_abli','text','',''),(55,5,0,'始发','','leaves','text','',''),(56,5,0,'终点','','boundfor','text','',''),(57,6,0,'Alexa排名','','site_top','number','',''),(58,5,0,'车次/航班','','train_no','text','',''),(59,5,0,'数量','','trade_num','number','',''),(60,5,0,'价格','','trade_price','text','',''),(61,5,0,'有效期至','','trade_end','calendar','',''),(63,1,0,'详细描述','','detail_content','textarea','',''),(64,1,0,'籍贯','','born_place','text','',''),(65,2,0,'租金','','money','text','',''),(66,2,0,'面积','','acreage','text','',''),(67,5,0,'发车时间','','time','calendar','','N;'),(68,1,0,'所在地','','now_place','text','',''),(8,1,2,'性别','','gender','radio','','a:3:{s:8:\"required\";s:1:\"0\";s:12:\"unchangeable\";s:1:\"0\";s:7:\"choices\";s:12:\"1=男\r\n2=女\";}'),(16,2,0,'房屋类型','','property','select','','a:1:{s:7:\"choices\";s:64:\"1=写字楼\r\n2=公寓\r\n3=小区\r\n4=平房\r\n5=别墅\r\n6=地下室\";}'),(17,2,0,'座向','','face','radio','','a:3:{s:8:\"required\";s:1:\"0\";s:12:\"unchangeable\";s:1:\"0\";s:7:\"choices\";s:38:\"1=南向\r\n2=北向\r\n3=西向\r\n4=东向\";}'),(18,2,0,'装修情况','','makes','radio','','a:3:{s:8:\"required\";s:1:\"0\";s:12:\"unchangeable\";s:1:\"0\";s:7:\"choices\";s:40:\"1=无装修\r\n2=简单装修\r\n3=精装修\";}'),(19,2,0,'居室','','mode','select','','a:1:{s:7:\"choices\";s:57:\"1=独居\r\n2=两居室\r\n3=三居室\r\n4=四居室\r\n5=别墅\";}'),(23,2,0,'屋内设施','','equipment','checkbox','','a:3:{s:8:\"required\";s:1:\"0\";s:12:\"unchangeable\";s:1:\"0\";s:7:\"choices\";s:167:\"1=水电\r\n2=宽带\r\n3=管道气\r\n4=有线电视\r\n5=电梯\r\n6=电话\r\n7=冰箱\r\n8=洗衣机\r\n9=热水器\r\n10=空调\r\n11=暖气\r\n12=微波炉\r\n13=油烟机\r\n14=饮水机\";}'),(25,2,0,'是否中介','','bool','radio','','a:3:{s:8:\"required\";s:1:\"0\";s:12:\"unchangeable\";s:1:\"0\";s:7:\"choices\";s:12:\"1=是\r\n2=否\";}'),(27,3,0,'星座','','Horoscope','select','','a:1:{s:7:\"choices\";s:157:\"1=白羊座\r\n2=金牛座\r\n3=双子座\r\n4=巨蟹座\r\n5=狮子座\r\n6=处女座\r\n7=天秤座\r\n8=天蝎座\r\n9=射手座\r\n10=摩羯座\r\n11=水瓶座\r\n12=双鱼座\";}'),(30,3,0,'婚姻状况','','marrige','radio','','a:1:{s:7:\"choices\";s:18:\"1=已婚\r\n2=未婚\";}'),(31,3,0,'爱好','','hobby','checkbox','','a:1:{s:7:\"choices\";s:242:\"1=美食\r\n2=唱歌\r\n3=跳舞\r\n4=电影\r\n5=音乐\r\n6=戏剧\r\n7=聊天\r\n8=拍托\r\n9=电脑\r\n10=网络\r\n11=游戏\r\n12=绘画\r\n13=书法\r\n14=雕塑\r\n15=异性\r\n16=阅读\r\n17=运动\r\n18=旅游\r\n19=八卦\r\n20=购物\r\n21=赚钱\r\n22=汽车\r\n23=摄影\";}'),(32,3,0,'收入范围','','salary','select','','a:3:{s:8:\"required\";s:1:\"0\";s:12:\"unchangeable\";s:1:\"0\";s:7:\"choices\";s:109:\"1=保密\r\n2=800元以上\r\n3=1500元以上\r\n4=2000元以上\r\n5=3000元以上\r\n6=5000元以上\r\n7=8000元以上\";}'),(34,1,0,'学历','','education','radio','','a:3:{s:8:\"required\";s:1:\"0\";s:12:\"unchangeable\";s:1:\"0\";s:7:\"choices\";s:91:\"1=文盲\r\n2=小学\r\n3=初中\r\n4=高中\r\n5=中专\r\n6=大专\r\n7=本科\r\n8=研究生\r\n9=博士\";}'),(38,5,0,'席别','','seats','select','','a:1:{s:7:\"choices\";s:48:\"1=站票\r\n2=硬座\r\n3=软座\r\n4=硬卧\r\n5=软卧\";}'),(44,4,0,'是否应届','','recr_term','radio','','a:3:{s:8:\"required\";s:1:\"0\";s:12:\"unchangeable\";s:1:\"0\";s:7:\"choices\";s:21:\"1=应届\r\n2=非应届\";}'),(48,4,0,'薪金','','recr_salary','select','','a:1:{s:7:\"choices\";s:114:\"1=面议\r\n2=1000以下\r\n3=1000~1500\r\n4=1500~2000\r\n5=2000~3000\r\n6=3000~4000\r\n7=4000~6000\r\n8=6000~8000\r\n9=8000以上\";}'),(50,4,0,'工作性质','','recr_work','radio','','a:3:{s:8:\"required\";s:1:\"0\";s:12:\"unchangeable\";s:1:\"0\";s:7:\"choices\";s:18:\"1=全职\r\n2=兼职\";}'),(53,4,0,'性别要求','','recr_sex','checkbox','','a:3:{s:8:\"required\";s:1:\"0\";s:12:\"unchangeable\";s:1:\"0\";s:7:\"choices\";s:12:\"1=男\r\n2=女\";}'),(62,5,0,'付款方式','','pay_type','checkbox','','a:3:{s:8:\"required\";s:1:\"0\";s:12:\"unchangeable\";s:1:\"0\";s:7:\"choices\";s:41:\"1=电汇\r\n2=支付宝\r\n3=现金\r\n4=其他\";}');
/*!40000 ALTER TABLE `cdb_typeoptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_typeoptionvars`
--

DROP TABLE IF EXISTS `cdb_typeoptionvars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_typeoptionvars` (
  `sortid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `optionid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  `value` mediumtext NOT NULL,
  KEY `sortid` (`sortid`),
  KEY `tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_typeoptionvars`
--

LOCK TABLES `cdb_typeoptionvars` WRITE;
/*!40000 ALTER TABLE `cdb_typeoptionvars` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_typeoptionvars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_typevars`
--

DROP TABLE IF EXISTS `cdb_typevars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_typevars` (
  `sortid` smallint(6) NOT NULL DEFAULT '0',
  `optionid` smallint(6) NOT NULL DEFAULT '0',
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `unchangeable` tinyint(1) NOT NULL DEFAULT '0',
  `search` tinyint(1) NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `subjectshow` tinyint(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `optionid` (`sortid`,`optionid`),
  KEY `sortid` (`sortid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_typevars`
--

LOCK TABLES `cdb_typevars` WRITE;
/*!40000 ALTER TABLE `cdb_typevars` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_typevars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_usergroups`
--

DROP TABLE IF EXISTS `cdb_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_usergroups` (
  `groupid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `radminid` tinyint(3) NOT NULL DEFAULT '0',
  `type` enum('system','special','member') NOT NULL DEFAULT 'member',
  `system` char(8) NOT NULL DEFAULT 'private',
  `grouptitle` char(30) NOT NULL DEFAULT '',
  `creditshigher` int(10) NOT NULL DEFAULT '0',
  `creditslower` int(10) NOT NULL DEFAULT '0',
  `stars` tinyint(3) NOT NULL DEFAULT '0',
  `color` char(7) NOT NULL DEFAULT '',
  `groupavatar` char(60) NOT NULL DEFAULT '',
  `readaccess` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `allowvisit` tinyint(1) NOT NULL DEFAULT '0',
  `allowpost` tinyint(1) NOT NULL DEFAULT '0',
  `allowreply` tinyint(1) NOT NULL DEFAULT '0',
  `allowpostpoll` tinyint(1) NOT NULL DEFAULT '0',
  `allowpostreward` tinyint(1) NOT NULL DEFAULT '0',
  `allowposttrade` tinyint(1) NOT NULL DEFAULT '0',
  `allowpostactivity` tinyint(1) NOT NULL DEFAULT '0',
  `allowdirectpost` tinyint(1) NOT NULL DEFAULT '0',
  `allowgetattach` tinyint(1) NOT NULL DEFAULT '0',
  `allowpostattach` tinyint(1) NOT NULL DEFAULT '0',
  `allowvote` tinyint(1) NOT NULL DEFAULT '0',
  `allowmultigroups` tinyint(1) NOT NULL DEFAULT '0',
  `allowsearch` tinyint(1) NOT NULL DEFAULT '0',
  `allowcstatus` tinyint(1) NOT NULL DEFAULT '0',
  `allowuseblog` tinyint(1) NOT NULL DEFAULT '0',
  `allowinvisible` tinyint(1) NOT NULL DEFAULT '0',
  `allowtransfer` tinyint(1) NOT NULL DEFAULT '0',
  `allowsetreadperm` tinyint(1) NOT NULL DEFAULT '0',
  `allowsetattachperm` tinyint(1) NOT NULL DEFAULT '0',
  `allowhidecode` tinyint(1) NOT NULL DEFAULT '0',
  `allowhtml` tinyint(1) NOT NULL DEFAULT '0',
  `allowcusbbcode` tinyint(1) NOT NULL DEFAULT '0',
  `allowanonymous` tinyint(1) NOT NULL DEFAULT '0',
  `allownickname` tinyint(1) NOT NULL DEFAULT '0',
  `allowsigbbcode` tinyint(1) NOT NULL DEFAULT '0',
  `allowsigimgcode` tinyint(1) NOT NULL DEFAULT '0',
  `allowviewpro` tinyint(1) NOT NULL DEFAULT '0',
  `allowviewstats` tinyint(1) NOT NULL DEFAULT '0',
  `disableperiodctrl` tinyint(1) NOT NULL DEFAULT '0',
  `reasonpm` tinyint(1) NOT NULL DEFAULT '0',
  `maxprice` smallint(6) unsigned NOT NULL DEFAULT '0',
  `maxsigsize` smallint(6) unsigned NOT NULL DEFAULT '0',
  `maxattachsize` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `maxsizeperday` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpostsperhour` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `attachextensions` char(100) NOT NULL DEFAULT '',
  `raterange` char(150) NOT NULL DEFAULT '',
  `mintradeprice` smallint(6) unsigned NOT NULL DEFAULT '1',
  `maxtradeprice` smallint(6) unsigned NOT NULL DEFAULT '0',
  `minrewardprice` smallint(6) NOT NULL DEFAULT '1',
  `maxrewardprice` smallint(6) NOT NULL DEFAULT '0',
  `magicsdiscount` tinyint(1) NOT NULL,
  `allowmagics` tinyint(1) unsigned NOT NULL,
  `maxmagicsweight` smallint(6) unsigned NOT NULL,
  `allowbiobbcode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowbioimgcode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maxbiosize` smallint(6) unsigned NOT NULL DEFAULT '0',
  `allowinvite` tinyint(1) NOT NULL DEFAULT '0',
  `allowmailinvite` tinyint(1) NOT NULL DEFAULT '0',
  `maxinvitenum` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `inviteprice` smallint(6) unsigned NOT NULL DEFAULT '0',
  `maxinviteday` smallint(6) unsigned NOT NULL DEFAULT '0',
  `allowpostdebate` tinyint(1) NOT NULL DEFAULT '0',
  `tradestick` tinyint(1) unsigned NOT NULL,
  `exempt` tinyint(1) unsigned NOT NULL,
  `allowsendpm` tinyint(1) NOT NULL DEFAULT '1',
  `maxattachnum` smallint(6) NOT NULL DEFAULT '0',
  `allowposturl` tinyint(1) NOT NULL DEFAULT '3',
  `allowrecommend` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `edittimelimit` smallint(6) unsigned NOT NULL DEFAULT '0',
  `allowpostrushreply` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `creditsrange` (`creditshigher`,`creditslower`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_usergroups`
--

LOCK TABLES `cdb_usergroups` WRITE;
/*!40000 ALTER TABLE `cdb_usergroups` DISABLE KEYS */;
INSERT INTO `cdb_usergroups` VALUES (1,1,'system','private','管理员',0,0,9,'','',200,1,1,1,1,1,1,1,3,1,1,1,1,2,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,30,500,2048000,0,0,'','1	-30	30	500',1,0,1,0,0,2,200,2,2,0,0,0,0,0,0,1,5,255,1,0,3,1,0,1),(2,2,'system','private','超级版主',0,0,8,'','',150,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,1,0,20,300,2048000,0,0,'chm, pdf, zip, rar, tar, gz, bzip2, gif, jpg, jpeg, png','1	-15	15	50',1,0,1,0,0,2,180,2,2,0,0,0,0,0,0,1,5,255,1,0,3,1,0,0),(3,3,'system','private','版主',0,0,7,'','',100,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,0,1,0,1,1,1,1,1,1,0,10,200,2048000,0,0,'chm, pdf, zip, rar, tar, gz, bzip2, gif, jpg, jpeg, png','1	-10	10	30',1,0,1,0,0,2,160,2,2,0,0,0,0,0,0,1,5,224,1,0,3,1,0,0),(4,0,'system','private','禁止发言',0,0,0,'','',0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,5,0,1,0,3,1,0,0),(5,0,'system','private','禁止访问',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,5,0,1,0,3,1,0,0),(6,0,'system','private','禁止 IP',0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,5,0,1,0,3,1,0,0),(7,0,'system','private','游客',0,0,0,'','',1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'gif,jpg,jpeg,png','',1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,5,0,1,0,3,1,0,0),(8,0,'system','private','等待验证会员',0,0,0,'','',0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,50,0,0,0,'','',1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,5,0,1,0,3,1,0,0),(9,0,'member','private','乞丐',-9999999,0,0,'','',0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'chm,pdf,zip,rar,tar,gz,bzip2,gif,jpg,jpeg,png','',1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,5,0,1,0,3,1,0,0),(10,0,'member','private','新手上路',0,50,1,'','',10,1,1,1,0,0,1,0,0,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,80,1024000,0,0,'chm, pdf, zip, rar, tar, gz, bzip2, gif, jpg, jpeg, png','',1,0,1,0,0,1,40,1,1,0,0,0,0,0,0,1,5,0,1,0,3,1,0,0),(11,0,'member','private','注册会员',50,200,2,'','',20,1,1,1,1,1,1,1,0,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,0,0,0,100,1024000,0,0,'chm, pdf, zip, rar, tar, gz, bzip2, gif, jpg, jpeg, png','',1,0,1,0,0,1,60,1,1,0,0,0,0,0,0,1,5,0,1,0,3,1,0,0),(12,0,'member','private','中级会员',200,500,3,'','',30,1,1,1,1,1,1,1,0,1,1,1,0,1,0,0,0,0,0,0,0,0,1,0,0,1,0,1,1,0,0,0,150,1024000,0,0,'chm, pdf, zip, rar, tar, gz, bzip2, gif, jpg, jpeg, png','',1,0,1,0,0,1,80,1,1,0,0,0,0,0,0,1,5,0,1,0,3,1,0,0),(13,0,'member','private','高级会员',500,1000,4,'','',50,1,1,1,1,1,1,1,0,1,1,1,1,1,1,0,0,0,0,0,0,0,1,0,1,1,0,1,1,0,0,0,200,2048000,0,0,'chm, pdf, zip, rar, tar, gz, bzip2, gif, jpg, jpeg, png','1	-10	10	30',1,0,1,0,0,2,100,2,2,0,0,0,0,0,0,1,5,0,1,0,3,1,0,0),(14,0,'member','private','金牌会员',1000,3000,6,'','',70,1,1,1,1,1,1,1,0,1,1,1,1,1,1,0,0,0,1,1,0,0,1,0,1,1,1,1,1,0,0,0,300,2048000,0,0,'chm, pdf, zip, rar, tar, gz, bzip2, gif, jpg, jpeg, png','1	-15	15	40',1,0,1,0,0,2,120,2,2,0,0,0,0,0,0,1,5,0,1,0,3,1,0,0),(15,0,'member','private','论坛元老',3000,9999999,8,'','',90,1,1,1,1,1,1,1,0,1,1,1,1,1,1,0,1,0,1,1,0,0,1,1,1,1,1,1,1,0,0,0,500,2048000,0,0,'chm, pdf, zip, rar, tar, gz, bzip2, gif, jpg, jpeg, png','1	-20	20	50',1,0,1,0,0,2,140,2,2,0,0,0,0,0,0,1,5,0,1,0,3,1,0,0),(16,3,'special','private','实习版主',0,0,7,'','',100,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,0,1,0,1,1,1,1,1,1,0,10,200,2048000,0,0,'chm, pdf, zip, rar, tar, gz, bzip2, gif, jpg, jpeg, png','1 -10 10 30',1,0,1,0,0,2,160,1,1,0,0,0,0,0,10,1,5,188,1,0,3,0,0,0),(17,2,'special','private','网站编辑',0,0,8,'','',150,1,1,1,1,1,1,1,3,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,1,0,20,300,2048000,0,0,'chm, pdf, zip, rar, tar, gz, bzip2, gif, jpg, jpeg, png','1 -15 15 50',1,0,1,0,0,2,180,1,1,0,0,0,0,0,10,1,5,255,1,0,3,0,0,0),(18,1,'special','private','信息监察员',0,0,9,'','',200,1,1,1,1,1,1,1,3,1,1,1,1,2,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,30,500,0,0,1,'','1 -30 30 400 2 -30 30 400 3 -30 30 4000',1,0,1,0,0,2,200,1,1,0,1,1,0,1,10,1,5,255,1,0,3,3,0,0),(19,3,'special','private','审核员',0,0,7,'','',100,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,0,1,0,1,1,1,1,1,1,0,10,200,2048000,0,0,'chm, pdf, zip, rar, tar, gz, bzip2, gif, jpg, jpeg, png','1 -10 10 30',1,0,1,0,0,2,160,1,1,0,0,0,0,0,10,1,5,188,1,0,3,0,0,0);
/*!40000 ALTER TABLE `cdb_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_validating`
--

DROP TABLE IF EXISTS `cdb_validating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_validating` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `submitdate` int(10) unsigned NOT NULL DEFAULT '0',
  `moddate` int(10) unsigned NOT NULL DEFAULT '0',
  `admin` varchar(15) NOT NULL DEFAULT '',
  `submittimes` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `remark` text NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_validating`
--

LOCK TABLES `cdb_validating` WRITE;
/*!40000 ALTER TABLE `cdb_validating` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_validating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_warnings`
--

DROP TABLE IF EXISTS `cdb_warnings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_warnings` (
  `wid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL,
  `operatorid` mediumint(8) unsigned NOT NULL,
  `operator` char(15) NOT NULL,
  `authorid` mediumint(8) unsigned NOT NULL,
  `author` char(15) NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  `reason` char(40) NOT NULL,
  PRIMARY KEY (`wid`),
  UNIQUE KEY `pid` (`pid`),
  KEY `authorid` (`authorid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_warnings`
--

LOCK TABLES `cdb_warnings` WRITE;
/*!40000 ALTER TABLE `cdb_warnings` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_warnings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdb_words`
--

DROP TABLE IF EXISTS `cdb_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdb_words` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `admin` varchar(15) NOT NULL DEFAULT '',
  `find` varchar(255) NOT NULL DEFAULT '',
  `replacement` varchar(255) NOT NULL DEFAULT '',
  `extra` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdb_words`
--

LOCK TABLES `cdb_words` WRITE;
/*!40000 ALTER TABLE `cdb_words` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdb_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uc_admins`
--

DROP TABLE IF EXISTS `uc_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uc_admins` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(15) NOT NULL DEFAULT '',
  `allowadminsetting` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminapp` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminuser` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminbadword` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmintag` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminpm` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmincredits` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmindomain` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmindb` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminnote` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmincache` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminlog` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uc_admins`
--

LOCK TABLES `uc_admins` WRITE;
/*!40000 ALTER TABLE `uc_admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `uc_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uc_applications`
--

DROP TABLE IF EXISTS `uc_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uc_applications` (
  `appid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `type` char(16) NOT NULL DEFAULT '',
  `name` char(20) NOT NULL DEFAULT '',
  `url` char(255) NOT NULL DEFAULT '',
  `authkey` char(255) NOT NULL DEFAULT '',
  `ip` char(15) NOT NULL DEFAULT '',
  `viewprourl` char(255) NOT NULL,
  `apifilename` char(30) NOT NULL DEFAULT 'uc.php',
  `charset` char(8) NOT NULL DEFAULT '',
  `dbcharset` char(8) NOT NULL DEFAULT '',
  `synlogin` tinyint(1) NOT NULL DEFAULT '0',
  `recvnote` tinyint(1) DEFAULT '0',
  `extra` mediumtext NOT NULL,
  `tagtemplates` mediumtext NOT NULL,
  PRIMARY KEY (`appid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uc_applications`
--

LOCK TABLES `uc_applications` WRITE;
/*!40000 ALTER TABLE `uc_applications` DISABLE KEYS */;
INSERT INTO `uc_applications` VALUES (1,'UCHOME','个人家园','http://www.gopo.com/home','YfA1Kay9m2j4MeHdkcZcxdkbA2s7X08c6014U3bek6R5OaMfO6Q8h608ObXeK5Vb','','','uc.php','utf-8','utf8',1,1,'','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<root>\r\n	<item id=\"template\"><![CDATA[<a href=\"{url}\" target=\"_blank\">{subject}</a>]]></item>\r\n	<item id=\"fields\">\r\n		<item id=\"subject\"><![CDATA[日志标题]]></item>\r\n		<item id=\"uid\"><![CDATA[用户 ID]]></item>\r\n		<item id=\"username\"><![CDATA[用户名]]></item>\r\n		<item id=\"dateline\"><![CDATA[日期]]></item>\r\n		<item id=\"spaceurl\"><![CDATA[空间地址]]></item>\r\n		<item id=\"url\"><![CDATA[日志地址]]></item>\r\n	</item>\r\n</root>'),(2,'DISCUZ','Discuz!','http://www.gopo.com/bbs','w7U5B18ev84dL8mbp9T7K8T0M8b8J7xct8M3Mb50P4pbM7H3E8FeR1DaicW5Y1m3','','','uc.php','utf-8','utf8',1,1,'','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<root>\r\n	<item id=\"template\"><![CDATA[<a href=\"{url}\" target=\"_blank\">{subject}</a>]]></item>\r\n	<item id=\"fields\">\r\n		<item id=\"subject\"><![CDATA[标题]]></item>\r\n		<item id=\"uid\"><![CDATA[用户 ID]]></item>\r\n		<item id=\"username\"><![CDATA[发帖者]]></item>\r\n		<item id=\"dateline\"><![CDATA[日期]]></item>\r\n		<item id=\"url\"><![CDATA[主题地址]]></item>\r\n	</item>\r\n</root>');
/*!40000 ALTER TABLE `uc_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uc_badwords`
--

DROP TABLE IF EXISTS `uc_badwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uc_badwords` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `admin` varchar(15) NOT NULL DEFAULT '',
  `find` varchar(255) NOT NULL DEFAULT '',
  `replacement` varchar(255) NOT NULL DEFAULT '',
  `findpattern` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `find` (`find`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uc_badwords`
--

LOCK TABLES `uc_badwords` WRITE;
/*!40000 ALTER TABLE `uc_badwords` DISABLE KEYS */;
/*!40000 ALTER TABLE `uc_badwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uc_domains`
--

DROP TABLE IF EXISTS `uc_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uc_domains` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain` char(40) NOT NULL DEFAULT '',
  `ip` char(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uc_domains`
--

LOCK TABLES `uc_domains` WRITE;
/*!40000 ALTER TABLE `uc_domains` DISABLE KEYS */;
/*!40000 ALTER TABLE `uc_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uc_failedlogins`
--

DROP TABLE IF EXISTS `uc_failedlogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uc_failedlogins` (
  `ip` char(15) NOT NULL DEFAULT '',
  `count` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uc_failedlogins`
--

LOCK TABLES `uc_failedlogins` WRITE;
/*!40000 ALTER TABLE `uc_failedlogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `uc_failedlogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uc_feeds`
--

DROP TABLE IF EXISTS `uc_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uc_feeds` (
  `feedid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `appid` varchar(30) NOT NULL DEFAULT '',
  `icon` varchar(30) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `hash_template` varchar(32) NOT NULL DEFAULT '',
  `hash_data` varchar(32) NOT NULL DEFAULT '',
  `title_template` text NOT NULL,
  `title_data` text NOT NULL,
  `body_template` text NOT NULL,
  `body_data` text NOT NULL,
  `body_general` text NOT NULL,
  `image_1` varchar(255) NOT NULL DEFAULT '',
  `image_1_link` varchar(255) NOT NULL DEFAULT '',
  `image_2` varchar(255) NOT NULL DEFAULT '',
  `image_2_link` varchar(255) NOT NULL DEFAULT '',
  `image_3` varchar(255) NOT NULL DEFAULT '',
  `image_3_link` varchar(255) NOT NULL DEFAULT '',
  `image_4` varchar(255) NOT NULL DEFAULT '',
  `image_4_link` varchar(255) NOT NULL DEFAULT '',
  `target_ids` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`feedid`),
  KEY `uid` (`uid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uc_feeds`
--

LOCK TABLES `uc_feeds` WRITE;
/*!40000 ALTER TABLE `uc_feeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `uc_feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uc_friends`
--

DROP TABLE IF EXISTS `uc_friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uc_friends` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `friendid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `direction` tinyint(1) NOT NULL DEFAULT '0',
  `version` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `delstatus` tinyint(1) NOT NULL DEFAULT '0',
  `comment` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`version`),
  KEY `uid` (`uid`),
  KEY `friendid` (`friendid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uc_friends`
--

LOCK TABLES `uc_friends` WRITE;
/*!40000 ALTER TABLE `uc_friends` DISABLE KEYS */;
/*!40000 ALTER TABLE `uc_friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uc_mailqueue`
--

DROP TABLE IF EXISTS `uc_mailqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uc_mailqueue` (
  `mailid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `touid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tomail` varchar(32) NOT NULL,
  `frommail` varchar(100) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `charset` varchar(15) NOT NULL,
  `htmlon` tinyint(1) NOT NULL DEFAULT '0',
  `level` tinyint(1) NOT NULL DEFAULT '1',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `failures` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `appid` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mailid`),
  KEY `appid` (`appid`),
  KEY `level` (`level`,`failures`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uc_mailqueue`
--

LOCK TABLES `uc_mailqueue` WRITE;
/*!40000 ALTER TABLE `uc_mailqueue` DISABLE KEYS */;
/*!40000 ALTER TABLE `uc_mailqueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uc_memberfields`
--

DROP TABLE IF EXISTS `uc_memberfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uc_memberfields` (
  `uid` mediumint(8) unsigned NOT NULL,
  `blacklist` text NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uc_memberfields`
--

LOCK TABLES `uc_memberfields` WRITE;
/*!40000 ALTER TABLE `uc_memberfields` DISABLE KEYS */;
INSERT INTO `uc_memberfields` VALUES (1,''),(2,''),(3,''),(4,'');
/*!40000 ALTER TABLE `uc_memberfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uc_members`
--

DROP TABLE IF EXISTS `uc_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uc_members` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(15) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `email` char(32) NOT NULL DEFAULT '',
  `myid` char(30) NOT NULL DEFAULT '',
  `myidkey` char(16) NOT NULL DEFAULT '',
  `regip` char(15) NOT NULL DEFAULT '',
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastloginip` int(10) NOT NULL DEFAULT '0',
  `lastlogintime` int(10) unsigned NOT NULL DEFAULT '0',
  `salt` char(6) NOT NULL,
  `secques` char(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uc_members`
--

LOCK TABLES `uc_members` WRITE;
/*!40000 ALTER TABLE `uc_members` DISABLE KEYS */;
INSERT INTO `uc_members` VALUES (1,'admin','398166fa7aadd3a576e2b7a8821f0e53','webmastor@yourdomain.com','','','127.0.0.1',1333532335,0,0,'f63553','');
/*!40000 ALTER TABLE `uc_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uc_mergemembers`
--

DROP TABLE IF EXISTS `uc_mergemembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uc_mergemembers` (
  `appid` smallint(6) unsigned NOT NULL,
  `username` char(15) NOT NULL,
  PRIMARY KEY (`appid`,`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uc_mergemembers`
--

LOCK TABLES `uc_mergemembers` WRITE;
/*!40000 ALTER TABLE `uc_mergemembers` DISABLE KEYS */;
/*!40000 ALTER TABLE `uc_mergemembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uc_newpm`
--

DROP TABLE IF EXISTS `uc_newpm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uc_newpm` (
  `uid` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uc_notelist`
--

DROP TABLE IF EXISTS `uc_notelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uc_notelist` (
  `noteid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `operation` char(32) NOT NULL,
  `closed` tinyint(4) NOT NULL DEFAULT '0',
  `totalnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `succeednum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `getdata` mediumtext NOT NULL,
  `postdata` mediumtext NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `pri` tinyint(3) NOT NULL DEFAULT '0',
  `app1` tinyint(4) NOT NULL,
  `app2` tinyint(4) NOT NULL,
  PRIMARY KEY (`noteid`),
  KEY `closed` (`closed`,`pri`,`noteid`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uc_notelist`
--

LOCK TABLES `uc_notelist` WRITE;
/*!40000 ALTER TABLE `uc_notelist` DISABLE KEYS */;
INSERT INTO `uc_notelist` VALUES (1,'updateapps',1,0,0,'','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<root>\r\n	<item id=\"1\">\r\n		<item id=\"appid\"><![CDATA[1]]></item>\r\n		<item id=\"type\"><![CDATA[UCHOME]]></item>\r\n		<item id=\"name\"><![CDATA[个人家园]]></item>\r\n		<item id=\"url\"><![CDATA[http://www.gopo.com/home]]></item>\r\n		<item id=\"ip\"><![CDATA[]]></item>\r\n		<item id=\"charset\"><![CDATA[utf-8]]></item>\r\n		<item id=\"synlogin\"><![CDATA[1]]></item>\r\n		<item id=\"extra\"><![CDATA[]]></item>\r\n	</item>\r\n	<item id=\"UC_API\"><![CDATA[http://www.gopo.com/ucenter]]></item>\r\n</root>',0,0,0,0),(2,'updateapps',1,10,0,'','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<root>\r\n	<item id=\"1\">\r\n		<item id=\"appid\"><![CDATA[1]]></item>\r\n		<item id=\"type\"><![CDATA[UCHOME]]></item>\r\n		<item id=\"name\"><![CDATA[个人家园]]></item>\r\n		<item id=\"url\"><![CDATA[http://www.gopo.com/home]]></item>\r\n		<item id=\"ip\"><![CDATA[]]></item>\r\n		<item id=\"charset\"><![CDATA[utf-8]]></item>\r\n		<item id=\"synlogin\"><![CDATA[1]]></item>\r\n		<item id=\"extra\"><![CDATA[]]></item>\r\n	</item>\r\n	<item id=\"2\">\r\n		<item id=\"appid\"><![CDATA[2]]></item>\r\n		<item id=\"type\"><![CDATA[DISCUZ]]></item>\r\n		<item id=\"name\"><![CDATA[Discuz!]]></item>\r\n		<item id=\"url\"><![CDATA[http://www.gopo.com/bbs]]></item>\r\n		<item id=\"ip\"><![CDATA[]]></item>\r\n		<item id=\"charset\"><![CDATA[utf-8]]></item>\r\n		<item id=\"synlogin\"><![CDATA[1]]></item>\r\n		<item id=\"extra\"><![CDATA[]]></item>\r\n	</item>\r\n	<item id=\"UC_API\"><![CDATA[http://www.gopo.com/ucenter]]></item>\r\n</root>',1333532511,0,-5,-5),(3,'updatepw',1,1,1,'username=admin&password=','',1345308110,0,1,0);
/*!40000 ALTER TABLE `uc_notelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uc_pms`
--

DROP TABLE IF EXISTS `uc_pms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uc_pms` (
  `pmid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `msgfrom` varchar(15) NOT NULL DEFAULT '',
  `msgfromid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `msgtoid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `folder` enum('inbox','outbox') NOT NULL DEFAULT 'inbox',
  `new` tinyint(1) NOT NULL DEFAULT '0',
  `subject` varchar(75) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `related` int(10) unsigned NOT NULL DEFAULT '0',
  `fromappid` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pmid`),
  KEY `msgtoid` (`msgtoid`,`folder`,`dateline`),
  KEY `msgfromid` (`msgfromid`,`folder`,`dateline`),
  KEY `related` (`related`),
  KEY `getnum` (`msgtoid`,`folder`,`delstatus`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `uc_protectedmembers`
--

DROP TABLE IF EXISTS `uc_protectedmembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uc_protectedmembers` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `appid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `admin` char(15) NOT NULL DEFAULT '0',
  UNIQUE KEY `username` (`username`,`appid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uc_protectedmembers`
--

LOCK TABLES `uc_protectedmembers` WRITE;
/*!40000 ALTER TABLE `uc_protectedmembers` DISABLE KEYS */;
INSERT INTO `uc_protectedmembers` VALUES (1,'admin',1,1333532335,'admin'),(1,'admin',0,1333532438,'');
/*!40000 ALTER TABLE `uc_protectedmembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uc_settings`
--

DROP TABLE IF EXISTS `uc_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uc_settings` (
  `k` varchar(32) NOT NULL DEFAULT '',
  `v` text NOT NULL,
  PRIMARY KEY (`k`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uc_settings`
--

LOCK TABLES `uc_settings` WRITE;
/*!40000 ALTER TABLE `uc_settings` DISABLE KEYS */;
INSERT INTO `uc_settings` VALUES ('accessemail',''),('censoremail',''),('censorusername',''),('dateformat','y-n-j'),('doublee','1'),('nextnotetime','0'),('timeoffset','28800'),('pmlimit1day','100'),('pmfloodctrl','15'),('pmcenter','1'),('sendpmseccode','1'),('pmsendregdays','0'),('maildefault','username@21cn.com'),('mailsend','1'),('mailserver','smtp.21cn.com'),('mailport','25'),('mailauth','1'),('mailfrom','UCenter <username@21cn.com>'),('mailauth_username','username@21cn.com'),('mailauth_password','password'),('maildelimiter','0'),('mailusername','1'),('mailsilent','1'),('version','1.5.0');
/*!40000 ALTER TABLE `uc_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uc_sqlcache`
--

DROP TABLE IF EXISTS `uc_sqlcache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uc_sqlcache` (
  `sqlid` char(6) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL,
  `expiry` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sqlid`),
  KEY `expiry` (`expiry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uc_sqlcache`
--

LOCK TABLES `uc_sqlcache` WRITE;
/*!40000 ALTER TABLE `uc_sqlcache` DISABLE KEYS */;
/*!40000 ALTER TABLE `uc_sqlcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uc_tags`
--

DROP TABLE IF EXISTS `uc_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uc_tags` (
  `tagname` char(20) NOT NULL,
  `appid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `data` mediumtext,
  `expiration` int(10) unsigned NOT NULL,
  KEY `tagname` (`tagname`,`appid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uc_tags`
--

LOCK TABLES `uc_tags` WRITE;
/*!40000 ALTER TABLE `uc_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `uc_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uc_vars`
--

DROP TABLE IF EXISTS `uc_vars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uc_vars` (
  `name` char(32) NOT NULL DEFAULT '',
  `value` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uc_vars`
--

LOCK TABLES `uc_vars` WRITE;
/*!40000 ALTER TABLE `uc_vars` DISABLE KEYS */;
/*!40000 ALTER TABLE `uc_vars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_ad`
--

DROP TABLE IF EXISTS `uchome_ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_ad` (
  `adid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `available` tinyint(1) NOT NULL DEFAULT '1',
  `title` varchar(50) NOT NULL DEFAULT '',
  `pagetype` varchar(20) NOT NULL DEFAULT '',
  `adcode` text NOT NULL,
  `system` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`adid`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_ad`
--

LOCK TABLES `uchome_ad` WRITE;
/*!40000 ALTER TABLE `uchome_ad` DISABLE KEYS */;
INSERT INTO `uchome_ad` VALUES (1,1,'首页轮播1图片（490x154)','header','a:2:{s:4:\"html\";s:34:\"http://s.gopo.com/images/QQad0.png\";s:4:\"type\";s:4:\"html\";}',0),(2,1,'首页轮播2图片（490x154)','header','a:2:{s:4:\"html\";s:34:\"http://s.gopo.com/images/QQad1.png\";s:4:\"type\";s:4:\"html\";}',0),(3,1,'首页轮播3图片（490x154)','header','a:2:{s:4:\"html\";s:34:\"http://s.gopo.com/images/QQad2.png\";s:4:\"type\";s:4:\"html\";}',0),(4,1,'首页轮播4图片（490x154)','header','a:2:{s:4:\"html\";s:34:\"http://s.gopo.com/images/QQad3.png\";s:4:\"type\";s:4:\"html\";}',0),(5,1,'广场中部横条','header','a:6:{s:11:\"imageheight\";s:1:\"0\";s:10:\"imagewidth\";s:3:\"950\";s:8:\"imagesrc\";s:33:\"http://s.gopo.com/images/ggnr.gif\";s:8:\"imageurl\";s:1:\"#\";s:8:\"imagealt\";s:0:\"\";s:4:\"type\";s:5:\"image\";}',0),(6,1,'圈子首部轮播1','header','a:6:{s:11:\"imageheight\";s:3:\"200\";s:10:\"imagewidth\";s:3:\"630\";s:8:\"imagesrc\";s:34:\"http://s.gopo.com/images/QQad0.png\";s:8:\"imageurl\";s:1:\"#\";s:8:\"imagealt\";s:0:\"\";s:4:\"type\";s:5:\"image\";}',0),(7,1,'圈子首部轮播2','header','a:6:{s:11:\"imageheight\";s:3:\"200\";s:10:\"imagewidth\";s:3:\"630\";s:8:\"imagesrc\";s:34:\"http://s.gopo.com/images/QQad1.png\";s:8:\"imageurl\";s:2:\"##\";s:8:\"imagealt\";s:0:\"\";s:4:\"type\";s:5:\"image\";}',0),(8,1,'圈子首部轮播3','header','a:6:{s:11:\"imageheight\";s:3:\"200\";s:10:\"imagewidth\";s:3:\"630\";s:8:\"imagesrc\";s:34:\"http://s.gopo.com/images/QQad2.png\";s:8:\"imageurl\";s:2:\"##\";s:8:\"imagealt\";s:0:\"\";s:4:\"type\";s:5:\"image\";}',0),(9,1,'圈子首部轮播4','header','a:6:{s:11:\"imageheight\";s:3:\"200\";s:10:\"imagewidth\";s:3:\"630\";s:8:\"imagesrc\";s:34:\"http://s.gopo.com/images/QQad3.png\";s:8:\"imageurl\";s:2:\"##\";s:8:\"imagealt\";s:0:\"\";s:4:\"type\";s:5:\"image\";}',0),(10,1,'圈子右下角广告1','header','a:6:{s:11:\"imageheight\";s:3:\"103\";s:10:\"imagewidth\";s:3:\"229\";s:8:\"imagesrc\";s:31:\"http://s.gopo.com/images/bx.png\";s:8:\"imageurl\";s:2:\"##\";s:8:\"imagealt\";s:0:\"\";s:4:\"type\";s:5:\"image\";}',0),(11,1,'圈子右下角广告2','header','a:6:{s:11:\"imageheight\";s:3:\"103\";s:10:\"imagewidth\";s:3:\"229\";s:8:\"imagesrc\";s:31:\"http://s.gopo.com/images/bx.png\";s:8:\"imageurl\";s:2:\"##\";s:8:\"imagealt\";s:0:\"\";s:4:\"type\";s:5:\"image\";}',0),(12,1,'圈子右下角广告3','header','a:6:{s:11:\"imageheight\";s:3:\"103\";s:10:\"imagewidth\";s:3:\"229\";s:8:\"imagesrc\";s:31:\"http://s.gopo.com/images/bx.png\";s:8:\"imageurl\";s:2:\"##\";s:8:\"imagealt\";s:0:\"\";s:4:\"type\";s:5:\"image\";}',0),(13,1,'首页热门游戏1','header','a:6:{s:11:\"imageheight\";s:2:\"37\";s:10:\"imagewidth\";s:2:\"37\";s:8:\"imagesrc\";s:33:\"http://s.gopo.com/images/tjyx.gif\";s:8:\"imageurl\";s:2:\"##\";s:8:\"imagealt\";s:0:\"\";s:4:\"type\";s:5:\"image\";}',0),(14,1,'首页热门游戏2','header','a:6:{s:11:\"imageheight\";s:2:\"37\";s:10:\"imagewidth\";s:2:\"37\";s:8:\"imagesrc\";s:33:\"http://s.gopo.com/images/tjyx.gif\";s:8:\"imageurl\";s:2:\"##\";s:8:\"imagealt\";s:0:\"\";s:4:\"type\";s:5:\"image\";}',0),(15,1,'首页热门游戏3','header','a:6:{s:11:\"imageheight\";s:2:\"37\";s:10:\"imagewidth\";s:2:\"37\";s:8:\"imagesrc\";s:33:\"http://s.gopo.com/images/tjyx.gif\";s:8:\"imageurl\";s:2:\"##\";s:8:\"imagealt\";s:0:\"\";s:4:\"type\";s:5:\"image\";}',0),(16,1,'首页热门游戏4','header','a:6:{s:11:\"imageheight\";s:2:\"37\";s:10:\"imagewidth\";s:2:\"37\";s:8:\"imagesrc\";s:33:\"http://s.gopo.com/images/tjyx.gif\";s:8:\"imageurl\";s:2:\"##\";s:8:\"imagealt\";s:0:\"\";s:4:\"type\";s:5:\"image\";}',0);
/*!40000 ALTER TABLE `uchome_ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_adminsession`
--

DROP TABLE IF EXISTS `uchome_adminsession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_adminsession` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `errorcount` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_adminsession`
--

LOCK TABLES `uchome_adminsession` WRITE;
/*!40000 ALTER TABLE `uchome_adminsession` DISABLE KEYS */;
/*!40000 ALTER TABLE `uchome_adminsession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_album`
--

DROP TABLE IF EXISTS `uchome_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_album` (
  `albumid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `albumname` varchar(50) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `picnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `pic` varchar(60) NOT NULL DEFAULT '',
  `picflag` tinyint(1) NOT NULL DEFAULT '0',
  `friend` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(10) NOT NULL DEFAULT '',
  `target_ids` text NOT NULL,
  PRIMARY KEY (`albumid`),
  KEY `uid` (`uid`,`updatetime`),
  KEY `updatetime` (`updatetime`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uchome_app_tw_gift`
--

DROP TABLE IF EXISTS `uchome_app_tw_gift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_app_tw_gift` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `touid` mediumint(8) NOT NULL,
  `tousername` varchar(50) NOT NULL,
  `gift` varchar(100) NOT NULL,
  `dateline` int(10) NOT NULL,
  `type` int(10) NOT NULL,
  `message` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `touid` (`touid`),
  KEY `touid2` (`touid`,`dateline`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uchome_appcreditlog`
--

DROP TABLE IF EXISTS `uchome_appcreditlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_appcreditlog` (
  `logid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `appid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `appname` varchar(60) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `credit` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `note` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`logid`),
  KEY `uid` (`uid`,`dateline`),
  KEY `appid` (`appid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_appcreditlog`
--

LOCK TABLES `uchome_appcreditlog` WRITE;
/*!40000 ALTER TABLE `uchome_appcreditlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `uchome_appcreditlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_blacklist`
--

DROP TABLE IF EXISTS `uchome_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_blacklist` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `buid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`buid`),
  KEY `uid` (`uid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_blacklist`
--

LOCK TABLES `uchome_blacklist` WRITE;
/*!40000 ALTER TABLE `uchome_blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `uchome_blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_block`
--

DROP TABLE IF EXISTS `uchome_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_block` (
  `bid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `blockname` varchar(40) NOT NULL DEFAULT '',
  `blocksql` text NOT NULL,
  `cachename` varchar(30) NOT NULL DEFAULT '',
  `cachetime` smallint(6) unsigned NOT NULL DEFAULT '0',
  `startnum` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `num` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `perpage` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `htmlcode` text NOT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_block`
--

LOCK TABLES `uchome_block` WRITE;
/*!40000 ALTER TABLE `uchome_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `uchome_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_blog`
--

DROP TABLE IF EXISTS `uchome_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_blog` (
  `blogid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `topicid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `subject` char(80) NOT NULL DEFAULT '',
  `classid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `viewnum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `replynum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hot` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `pic` char(120) NOT NULL DEFAULT '',
  `picflag` tinyint(1) NOT NULL DEFAULT '0',
  `noreply` tinyint(1) NOT NULL DEFAULT '0',
  `friend` tinyint(1) NOT NULL DEFAULT '0',
  `password` char(10) NOT NULL DEFAULT '',
  `click_1` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click_2` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click_3` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click_4` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click_5` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`blogid`),
  KEY `uid` (`uid`,`dateline`),
  KEY `topicid` (`topicid`,`dateline`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uchome_blogfield`
--

DROP TABLE IF EXISTS `uchome_blogfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_blogfield` (
  `blogid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tag` varchar(255) NOT NULL DEFAULT '',
  `message` mediumtext NOT NULL,
  `postip` varchar(20) NOT NULL DEFAULT '',
  `related` text NOT NULL,
  `relatedtime` int(10) unsigned NOT NULL DEFAULT '0',
  `target_ids` text NOT NULL,
  `hotuser` text NOT NULL,
  `magiccolor` tinyint(6) NOT NULL DEFAULT '0',
  `magicpaper` tinyint(6) NOT NULL DEFAULT '0',
  `magiccall` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`blogid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uchome_cache`
--

DROP TABLE IF EXISTS `uchome_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_cache` (
  `cachekey` varchar(16) NOT NULL DEFAULT '',
  `value` mediumtext NOT NULL,
  `mtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cachekey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_cache`
--

LOCK TABLES `uchome_cache` WRITE;
/*!40000 ALTER TABLE `uchome_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `uchome_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_class`
--

DROP TABLE IF EXISTS `uchome_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_class` (
  `classid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `classname` char(40) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`classid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uchome_click`
--

DROP TABLE IF EXISTS `uchome_click`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_click` (
  `clickid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `icon` varchar(100) NOT NULL DEFAULT '',
  `idtype` varchar(15) NOT NULL DEFAULT '',
  `displayorder` tinyint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`clickid`),
  KEY `idtype` (`idtype`,`displayorder`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_click`
--

LOCK TABLES `uchome_click` WRITE;
/*!40000 ALTER TABLE `uchome_click` DISABLE KEYS */;
INSERT INTO `uchome_click` VALUES (1,'路过','luguo.gif','blogid',0),(2,'雷人','leiren.gif','blogid',0),(3,'握手','woshou.gif','blogid',0),(4,'鲜花','xianhua.gif','blogid',0),(5,'鸡蛋','jidan.gif','blogid',0),(6,'漂亮','piaoliang.gif','picid',0),(7,'酷毙','kubi.gif','picid',0),(8,'雷人','leiren.gif','picid',0),(9,'鲜花','xianhua.gif','picid',0),(10,'鸡蛋','jidan.gif','picid',0),(11,'搞笑','gaoxiao.gif','tid',0),(12,'迷惑','mihuo.gif','tid',0),(13,'雷人','leiren.gif','tid',0),(14,'鲜花','xianhua.gif','tid',0),(15,'鸡蛋','jidan.gif','tid',0);
/*!40000 ALTER TABLE `uchome_click` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_clickuser`
--

DROP TABLE IF EXISTS `uchome_clickuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_clickuser` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `idtype` varchar(15) NOT NULL DEFAULT '',
  `clickid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `id` (`id`,`idtype`,`dateline`),
  KEY `uid` (`uid`,`idtype`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uchome_comment`
--

DROP TABLE IF EXISTS `uchome_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_comment` (
  `cid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `idtype` varchar(20) NOT NULL DEFAULT '',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(15) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `magicflicker` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `authorid` (`authorid`,`idtype`),
  KEY `id` (`id`,`idtype`,`dateline`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uchome_config`
--

DROP TABLE IF EXISTS `uchome_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_config` (
  `var` varchar(30) NOT NULL DEFAULT '',
  `datavalue` text NOT NULL,
  PRIMARY KEY (`var`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_config`
--

LOCK TABLES `uchome_config` WRITE;
/*!40000 ALTER TABLE `uchome_config` DISABLE KEYS */;
INSERT INTO `uchome_config` VALUES ('sitename','我的空间'),('template','default'),('adminemail','webmaster@www.gopo.com'),('onlinehold','1800'),('timeoffset','8'),('maxpage','100'),('starcredit','100'),('starlevelnum','5'),('cachemode','database'),('cachegrade','0'),('allowcache','1'),('allowdomain','0'),('allowrewrite','0'),('allowwatermark','0'),('allowftp','0'),('holddomain','www|*blog*|*space*|x'),('mtagminnum','5'),('feedday','7'),('feedmaxnum','100'),('feedfilternum','10'),('importnum','100'),('maxreward','10'),('singlesent','50'),('groupnum','8'),('closeregister','0'),('closeinvite','0'),('close','0'),('networkpublic','1'),('networkpage','1'),('seccode_register','1'),('uc_tagrelated','1'),('manualmoderator','1'),('linkguide','1'),('showall','1'),('sendmailday','0'),('realname','0'),('namecheck','0'),('namechange','0'),('name_allowviewspace','1'),('name_allowfriend','1'),('name_allowpoke','1'),('name_allowdoing','1'),('name_allowblog','0'),('name_allowalbum','0'),('name_allowthread','0'),('name_allowshare','0'),('name_allowcomment','0'),('name_allowpost','0'),('showallfriendnum','10'),('feedtargetblank','1'),('feedread','1'),('feedhotnum','3'),('feedhotday','2'),('feedhotmin','3'),('feedhiddenicon','friend,profile,task,wall'),('uc_tagrelatedtime','86400'),('privacy','a:2:{s:4:\"view\";a:12:{s:5:\"index\";i:0;s:7:\"profile\";i:0;s:6:\"friend\";i:0;s:4:\"wall\";i:0;s:4:\"feed\";i:0;s:4:\"mtag\";i:0;s:5:\"event\";i:0;s:5:\"doing\";i:0;s:4:\"blog\";i:0;s:5:\"album\";i:0;s:5:\"share\";i:0;s:4:\"poll\";i:0;}s:4:\"feed\";a:21:{s:5:\"doing\";i:1;s:4:\"blog\";i:1;s:6:\"upload\";i:1;s:5:\"share\";i:1;s:4:\"poll\";i:1;s:8:\"joinpoll\";i:1;s:6:\"thread\";i:1;s:4:\"post\";i:1;s:4:\"mtag\";i:1;s:5:\"event\";i:1;s:4:\"join\";i:1;s:6:\"friend\";i:1;s:7:\"comment\";i:1;s:4:\"show\";i:1;s:9:\"spaceopen\";i:1;s:6:\"credit\";i:1;s:6:\"invite\";i:1;s:4:\"task\";i:1;s:7:\"profile\";i:1;s:5:\"album\";i:1;s:5:\"click\";i:1;}}'),('cronnextrun','1346104920'),('my_status','0'),('uniqueemail','1'),('updatestat','1'),('my_showgift','1'),('topcachetime','60'),('newspacenum','3'),('sitekey','d10efcgdm9cg2wPW'),('spacebarusername',''),('defaultfusername',''),('spacehotblogusername','wanglan,zhanghua'),('spaceinterestmtagusername',''),('mtaginterest','1,2'),('spacehotmtagownerusername','wanglan'),('spacehotmtaguserusername','zhanghua,wanglan,admin'),('mtagbeijingorder','5,4'),('spacemtagbeijingusername','测试群组111\r\n北京圈子'),('mtagbeijing','4,5'),('mtagrecommend','2,9,7'),('mtagrecommendorder','7,9,8');
/*!40000 ALTER TABLE `uchome_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_creditlog`
--

DROP TABLE IF EXISTS `uchome_creditlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_creditlog` (
  `clid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cyclenum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `credit` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `experience` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `info` text NOT NULL,
  `user` text NOT NULL,
  `app` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`clid`),
  KEY `uid` (`uid`,`rid`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `uchome_creditrule`
--

DROP TABLE IF EXISTS `uchome_creditrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_creditrule` (
  `rid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `rulename` char(20) NOT NULL DEFAULT '',
  `action` char(20) NOT NULL DEFAULT '',
  `cycletype` tinyint(1) NOT NULL DEFAULT '0',
  `cycletime` int(10) NOT NULL DEFAULT '0',
  `rewardnum` tinyint(2) NOT NULL DEFAULT '1',
  `rewardtype` tinyint(1) NOT NULL DEFAULT '1',
  `norepeat` tinyint(1) NOT NULL DEFAULT '0',
  `credit` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `experience` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`rid`),
  KEY `action` (`action`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_creditrule`
--

LOCK TABLES `uchome_creditrule` WRITE;
/*!40000 ALTER TABLE `uchome_creditrule` DISABLE KEYS */;
INSERT INTO `uchome_creditrule` VALUES (1,'开通空间','register',0,0,1,1,0,10,0),(2,'实名认证','realname',0,0,1,1,0,20,20),(3,'邮箱认证','realemail',0,0,1,1,0,40,40),(4,'成功邀请好友','invitefriend',4,0,20,1,0,10,10),(5,'设置头像','setavatar',0,0,1,1,0,15,15),(6,'视频认证','videophoto',0,0,1,1,0,40,40),(7,'成功举报','report',4,0,0,1,0,2,2),(8,'更新心情','updatemood',1,0,3,1,0,3,3),(9,'热点信息','hotinfo',4,0,0,1,0,10,10),(10,'每天登陆','daylogin',1,0,1,1,0,15,15),(11,'访问别人空间','visit',1,0,10,1,2,1,1),(12,'打招呼','poke',1,0,10,1,2,1,1),(13,'留言','guestbook',1,0,20,1,2,2,2),(14,'被留言','getguestbook',1,0,5,1,2,1,0),(15,'发表记录','doing',1,0,5,1,0,1,1),(16,'发表日志','publishblog',1,0,3,1,0,5,5),(17,'上传图片','uploadimage',1,0,10,1,0,2,2),(18,'拍大头贴','camera',1,0,5,1,0,3,3),(19,'发表话题','publishthread',1,0,5,1,0,5,5),(20,'回复话题','replythread',1,0,10,1,1,1,1),(21,'创建投票','createpoll',1,0,5,1,0,2,2),(22,'参与投票','joinpoll',1,0,10,1,1,1,1),(23,'发起活动','createevent',1,0,1,1,0,3,3),(24,'参与活动','joinevent',1,0,1,1,1,1,1),(25,'推荐活动','recommendevent',4,0,0,1,0,10,10),(26,'发起分享','createshare',1,0,3,1,0,2,2),(27,'评论','comment',1,0,40,1,1,1,1),(28,'被评论','getcomment',1,0,20,1,1,1,0),(29,'安装应用','installapp',4,0,0,1,3,5,5),(30,'使用应用','useapp',1,0,10,1,3,1,1),(31,'信息表态','click',1,0,10,1,1,1,1),(32,'修改实名','editrealname',0,0,1,0,0,5,0),(33,'更改邮箱认证','editrealemail',0,0,1,0,0,5,0),(34,'头像被删除','delavatar',0,0,1,0,0,10,10),(35,'获取邀请码','invitecode',0,0,1,0,0,0,0),(36,'搜索一次','search',0,0,1,0,0,1,0),(37,'日志导入','blogimport',0,0,1,0,0,10,0),(38,'修改域名','modifydomain',0,0,1,0,0,5,0),(39,'日志被删除','delblog',0,0,1,0,0,10,10),(40,'记录被删除','deldoing',0,0,1,0,0,2,2),(41,'图片被删除','delimage',0,0,1,0,0,4,4),(42,'投票被删除','delpoll',0,0,1,0,0,4,4),(43,'话题被删除','delthread',0,0,1,0,0,4,4),(44,'活动被删除','delevent',0,0,1,0,0,6,6),(45,'分享被删除','delshare',0,0,1,0,0,4,4),(46,'留言被删除','delguestbook',0,0,1,0,0,4,4),(47,'评论被删除','delcomment',0,0,1,0,0,2,2);
/*!40000 ALTER TABLE `uchome_creditrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_cron`
--

DROP TABLE IF EXISTS `uchome_cron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_cron` (
  `cronid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `type` enum('user','system') NOT NULL DEFAULT 'user',
  `name` char(50) NOT NULL DEFAULT '',
  `filename` char(50) NOT NULL DEFAULT '',
  `lastrun` int(10) unsigned NOT NULL DEFAULT '0',
  `nextrun` int(10) unsigned NOT NULL DEFAULT '0',
  `weekday` tinyint(1) NOT NULL DEFAULT '0',
  `day` tinyint(2) NOT NULL DEFAULT '0',
  `hour` tinyint(2) NOT NULL DEFAULT '0',
  `minute` char(36) NOT NULL DEFAULT '',
  PRIMARY KEY (`cronid`),
  KEY `nextrun` (`available`,`nextrun`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_cron`
--

LOCK TABLES `uchome_cron` WRITE;
/*!40000 ALTER TABLE `uchome_cron` DISABLE KEYS */;
INSERT INTO `uchome_cron` VALUES (1,1,'system','更新浏览数统计','log.php',1347926221,1347926400,-1,-1,-1,'0	5	10	15	20	25	30	35	40	45	50	55'),(2,1,'system','清理过期feed','cleanfeed.php',1347926215,1347995040,-1,-1,3,'4'),(3,1,'system','清理个人通知','cleannotification.php',1347926217,1348002360,-1,-1,5,'6'),(4,1,'system','同步UC的feed','getfeed.php',1346104469,1346104920,-1,-1,-1,'2	7	12	17	22	27	32	37	42	47	52'),(5,1,'system','清理脚印和最新访客','cleantrace.php',1347924040,1347991380,-1,-1,2,'3');
/*!40000 ALTER TABLE `uchome_cron` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_data`
--

DROP TABLE IF EXISTS `uchome_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_data` (
  `var` varchar(20) NOT NULL DEFAULT '',
  `datavalue` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`var`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_data`
--

LOCK TABLES `uchome_data` WRITE;
/*!40000 ALTER TABLE `uchome_data` DISABLE KEYS */;
INSERT INTO `uchome_data` VALUES ('mail','a:3:{s:8:\"mailsend\";s:1:\"1\";s:13:\"maildelimiter\";s:1:\"0\";s:12:\"mailusername\";s:1:\"1\";}',1333532306),('setting','a:4:{s:10:\"thumbwidth\";s:3:\"100\";s:11:\"thumbheight\";s:3:\"100\";s:12:\"watermarkpos\";s:1:\"4\";s:14:\"watermarktrans\";s:2:\"75\";}',1333532306),('network','a:5:{s:4:\"blog\";a:12:{s:6:\"blogid\";s:0:\"\";s:3:\"uid\";s:0:\"\";s:4:\"hot1\";s:0:\"\";s:4:\"hot2\";s:0:\"\";s:8:\"viewnum1\";s:0:\"\";s:8:\"viewnum2\";s:0:\"\";s:9:\"replynum1\";s:0:\"\";s:9:\"replynum2\";s:0:\"\";s:8:\"dateline\";s:0:\"\";s:5:\"order\";s:8:\"dateline\";s:2:\"sc\";s:4:\"desc\";s:5:\"cache\";s:3:\"600\";}s:3:\"pic\";a:8:{s:5:\"picid\";s:0:\"\";s:3:\"uid\";s:0:\"\";s:4:\"hot1\";s:0:\"\";s:4:\"hot2\";s:0:\"\";s:8:\"dateline\";s:0:\"\";s:5:\"order\";s:8:\"dateline\";s:2:\"sc\";s:4:\"desc\";s:5:\"cache\";s:3:\"700\";}s:6:\"thread\";a:13:{s:3:\"tid\";s:0:\"\";s:3:\"uid\";s:0:\"\";s:4:\"hot1\";s:0:\"\";s:4:\"hot2\";s:0:\"\";s:8:\"viewnum1\";s:0:\"\";s:8:\"viewnum2\";s:0:\"\";s:9:\"replynum1\";s:0:\"\";s:9:\"replynum2\";s:0:\"\";s:8:\"dateline\";s:0:\"\";s:8:\"lastpost\";s:0:\"\";s:5:\"order\";s:8:\"dateline\";s:2:\"sc\";s:4:\"desc\";s:5:\"cache\";s:3:\"800\";}s:5:\"event\";a:12:{s:7:\"eventid\";s:0:\"\";s:3:\"uid\";s:0:\"\";s:4:\"hot1\";s:0:\"\";s:4:\"hot2\";s:0:\"\";s:10:\"membernum1\";s:0:\"\";s:10:\"membernum2\";s:0:\"\";s:10:\"follownum1\";s:0:\"\";s:10:\"follownum2\";s:0:\"\";s:8:\"dateline\";s:0:\"\";s:5:\"order\";s:8:\"dateline\";s:2:\"sc\";s:4:\"desc\";s:5:\"cache\";s:3:\"900\";}s:4:\"poll\";a:12:{s:3:\"pid\";s:0:\"\";s:3:\"uid\";s:0:\"\";s:4:\"hot1\";s:0:\"\";s:4:\"hot2\";s:0:\"\";s:9:\"voternum1\";s:0:\"\";s:9:\"voternum2\";s:0:\"\";s:9:\"replynum1\";s:0:\"\";s:9:\"replynum2\";s:0:\"\";s:8:\"dateline\";s:0:\"\";s:5:\"order\";s:8:\"dateline\";s:2:\"sc\";s:4:\"desc\";s:5:\"cache\";s:3:\"500\";}}',1343482029),('newspacelist','a:3:{i:0;a:6:{s:3:\"uid\";s:1:\"4\";s:8:\"username\";s:4:\"haha\";s:4:\"name\";s:0:\"\";s:10:\"namestatus\";s:1:\"0\";s:11:\"videostatus\";s:1:\"0\";s:8:\"dateline\";s:10:\"1345300846\";}i:1;a:6:{s:3:\"uid\";s:1:\"3\";s:8:\"username\";s:7:\"wanglan\";s:4:\"name\";s:6:\"王兰\";s:10:\"namestatus\";s:1:\"1\";s:11:\"videostatus\";s:1:\"0\";s:8:\"dateline\";s:10:\"1341044406\";}i:2;a:6:{s:3:\"uid\";s:1:\"2\";s:8:\"username\";s:8:\"zhanghua\";s:4:\"name\";s:0:\"\";s:10:\"namestatus\";s:1:\"0\";s:11:\"videostatus\";s:1:\"0\";s:8:\"dateline\";s:10:\"1341043974\";}}',1345300846);
/*!40000 ALTER TABLE `uchome_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_docomment`
--

DROP TABLE IF EXISTS `uchome_docomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_docomment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `upid` int(10) unsigned NOT NULL DEFAULT '0',
  `doid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `ip` varchar(20) NOT NULL DEFAULT '',
  `grade` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `doid` (`doid`,`dateline`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_docomment`
--

LOCK TABLES `uchome_docomment` WRITE;
/*!40000 ALTER TABLE `uchome_docomment` DISABLE KEYS */;
INSERT INTO `uchome_docomment` VALUES (1,0,1,1,'admin',1343551151,'sdtstt','127.0.0.1',1),(2,0,1,1,'admin',1343551155,'sss','127.0.0.1',1);
/*!40000 ALTER TABLE `uchome_docomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_doing`
--

DROP TABLE IF EXISTS `uchome_doing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_doing` (
  `doid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `from` varchar(20) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `ip` varchar(20) NOT NULL DEFAULT '',
  `replynum` int(10) unsigned NOT NULL DEFAULT '0',
  `mood` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`doid`),
  KEY `uid` (`uid`,`dateline`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uchome_event`
--

DROP TABLE IF EXISTS `uchome_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_event` (
  `eventid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `topicid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(80) NOT NULL DEFAULT '',
  `classid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `province` varchar(20) NOT NULL DEFAULT '',
  `city` varchar(20) NOT NULL DEFAULT '',
  `location` varchar(80) NOT NULL DEFAULT '',
  `poster` varchar(60) NOT NULL DEFAULT '',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `remote` tinyint(1) NOT NULL DEFAULT '0',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `public` tinyint(3) NOT NULL DEFAULT '0',
  `membernum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `follownum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `viewnum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `grade` tinyint(3) NOT NULL DEFAULT '0',
  `recommendtime` int(10) unsigned NOT NULL DEFAULT '0',
  `tagid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `picnum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `threadnum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `hot` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`eventid`),
  KEY `grade` (`grade`,`recommendtime`),
  KEY `membernum` (`membernum`),
  KEY `uid` (`uid`,`eventid`),
  KEY `tagid` (`tagid`,`eventid`),
  KEY `topicid` (`topicid`,`dateline`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `uchome_eventclass`
--

DROP TABLE IF EXISTS `uchome_eventclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_eventclass` (
  `classid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `classname` varchar(80) NOT NULL DEFAULT '',
  `poster` tinyint(1) NOT NULL DEFAULT '0',
  `template` text NOT NULL,
  `displayorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`classid`),
  UNIQUE KEY `classname` (`classname`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_eventclass`
--

LOCK TABLES `uchome_eventclass` WRITE;
/*!40000 ALTER TABLE `uchome_eventclass` DISABLE KEYS */;
INSERT INTO `uchome_eventclass` VALUES (1,'生活/聚会',0,'费用说明：\r\n集合地点：\r\n着装要求：\r\n联系方式：\r\n注意事项：',1),(2,'出行/旅游',0,'路线说明:\r\n费用说明:\r\n装备要求:\r\n交通工具:\r\n集合地点:\r\n联系方式:\r\n注意事项:',2),(3,'比赛/运动',0,'费用说明：\r\n集合地点：\r\n着装要求：\r\n场地介绍：\r\n联系方式：\r\n注意事项：',4),(4,'电影/演出',0,'剧情介绍：\r\n费用说明：\r\n集合地点：\r\n联系方式：\r\n注意事项：',3),(5,'教育/讲座',0,'主办单位：\r\n活动主题：\r\n费用说明：\r\n集合地点：\r\n联系方式：\r\n注意事项：',5),(6,'其它',0,'',6);
/*!40000 ALTER TABLE `uchome_eventclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_eventfield`
--

DROP TABLE IF EXISTS `uchome_eventfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_eventfield` (
  `eventid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `detail` text NOT NULL,
  `template` varchar(255) NOT NULL DEFAULT '',
  `limitnum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `verify` tinyint(1) NOT NULL DEFAULT '0',
  `allowpic` tinyint(1) NOT NULL DEFAULT '0',
  `allowpost` tinyint(1) NOT NULL DEFAULT '0',
  `allowinvite` tinyint(1) NOT NULL DEFAULT '0',
  `allowfellow` tinyint(1) NOT NULL DEFAULT '0',
  `hotuser` text NOT NULL,
  PRIMARY KEY (`eventid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_eventfield`
--

LOCK TABLES `uchome_eventfield` WRITE;
/*!40000 ALTER TABLE `uchome_eventfield` DISABLE KEYS */;
INSERT INTO `uchome_eventfield` VALUES (1,'费用说明：100元/人<br>集合地点：地铁站<br>着装要求：随便<br>联系方式：--<br>注意事项：--<br><br>','',0,0,1,1,1,0,''),(2,'费用说明：1111<br>集合地点：1112<br>着装要求：222<br>联系方式：344<br>注意事项：555<br><br>','',0,0,1,1,1,0,'3');
/*!40000 ALTER TABLE `uchome_eventfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_eventinvite`
--

DROP TABLE IF EXISTS `uchome_eventinvite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_eventinvite` (
  `eventid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `touid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tousername` char(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`eventid`,`touid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_eventinvite`
--

LOCK TABLES `uchome_eventinvite` WRITE;
/*!40000 ALTER TABLE `uchome_eventinvite` DISABLE KEYS */;
/*!40000 ALTER TABLE `uchome_eventinvite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_eventpic`
--

DROP TABLE IF EXISTS `uchome_eventpic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_eventpic` (
  `picid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `eventid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`picid`),
  KEY `eventid` (`eventid`,`picid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_eventpic`
--

LOCK TABLES `uchome_eventpic` WRITE;
/*!40000 ALTER TABLE `uchome_eventpic` DISABLE KEYS */;
INSERT INTO `uchome_eventpic` VALUES (5,2,1,'admin',1342884596);
/*!40000 ALTER TABLE `uchome_eventpic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_feed`
--

DROP TABLE IF EXISTS `uchome_feed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_feed` (
  `feedid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `appid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `icon` varchar(30) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `friend` tinyint(1) NOT NULL DEFAULT '0',
  `hash_template` varchar(32) NOT NULL DEFAULT '',
  `hash_data` varchar(32) NOT NULL DEFAULT '',
  `title_template` text NOT NULL,
  `title_data` text NOT NULL,
  `body_template` text NOT NULL,
  `body_data` text NOT NULL,
  `body_general` text NOT NULL,
  `image_1` varchar(255) NOT NULL DEFAULT '',
  `image_1_link` varchar(255) NOT NULL DEFAULT '',
  `image_2` varchar(255) NOT NULL DEFAULT '',
  `image_2_link` varchar(255) NOT NULL DEFAULT '',
  `image_3` varchar(255) NOT NULL DEFAULT '',
  `image_3_link` varchar(255) NOT NULL DEFAULT '',
  `image_4` varchar(255) NOT NULL DEFAULT '',
  `image_4_link` varchar(255) NOT NULL DEFAULT '',
  `target_ids` text NOT NULL,
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `idtype` varchar(15) NOT NULL DEFAULT '',
  `hot` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`feedid`),
  KEY `uid` (`uid`,`dateline`),
  KEY `dateline` (`dateline`),
  KEY `hot` (`hot`),
  KEY `id` (`id`,`idtype`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uchome_friend`
--

DROP TABLE IF EXISTS `uchome_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_friend` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fusername` varchar(15) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `gid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `note` varchar(50) NOT NULL DEFAULT '',
  `num` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`fuid`),
  KEY `fuid` (`fuid`),
  KEY `status` (`uid`,`status`,`num`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uchome_friendguide`
--

DROP TABLE IF EXISTS `uchome_friendguide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_friendguide` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fusername` char(15) NOT NULL DEFAULT '',
  `num` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`fuid`),
  KEY `uid` (`uid`,`num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_friendguide`
--

LOCK TABLES `uchome_friendguide` WRITE;
/*!40000 ALTER TABLE `uchome_friendguide` DISABLE KEYS */;
/*!40000 ALTER TABLE `uchome_friendguide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_friendlog`
--

DROP TABLE IF EXISTS `uchome_friendlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_friendlog` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `action` varchar(10) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`fuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_friendlog`
--

LOCK TABLES `uchome_friendlog` WRITE;
/*!40000 ALTER TABLE `uchome_friendlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `uchome_friendlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_invite`
--

DROP TABLE IF EXISTS `uchome_invite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_invite` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `code` varchar(20) NOT NULL DEFAULT '',
  `fuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fusername` varchar(15) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `appid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_invite`
--

LOCK TABLES `uchome_invite` WRITE;
/*!40000 ALTER TABLE `uchome_invite` DISABLE KEYS */;
/*!40000 ALTER TABLE `uchome_invite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_log`
--

DROP TABLE IF EXISTS `uchome_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_log` (
  `logid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `idtype` char(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`logid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_log`
--

LOCK TABLES `uchome_log` WRITE;
/*!40000 ALTER TABLE `uchome_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `uchome_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_magic`
--

DROP TABLE IF EXISTS `uchome_magic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_magic` (
  `mid` varchar(15) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `forbiddengid` text NOT NULL,
  `charge` smallint(6) unsigned NOT NULL DEFAULT '0',
  `experience` smallint(6) unsigned NOT NULL DEFAULT '0',
  `provideperoid` int(10) unsigned NOT NULL DEFAULT '0',
  `providecount` smallint(6) unsigned NOT NULL DEFAULT '0',
  `useperoid` int(10) unsigned NOT NULL DEFAULT '0',
  `usecount` smallint(6) unsigned NOT NULL DEFAULT '0',
  `displayorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `custom` text NOT NULL,
  `close` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_magic`
--

LOCK TABLES `uchome_magic` WRITE;
/*!40000 ALTER TABLE `uchome_magic` DISABLE KEYS */;
INSERT INTO `uchome_magic` VALUES ('invisible','隐身草','让自己隐身登录，不显示在线，24小时内有效','',50,5,86400,10,86400,1,0,'',0),('friendnum','好友增容卡','在允许添加的最多好友数限制外，增加10个好友名额','',30,3,86400,999,0,1,0,'',0),('attachsize','附件增容卡','使用一次，可以给自己增加 10M 的附件空间','',30,3,86400,999,0,1,0,'',0),('thunder','雷鸣之声','发布一条全站信息，让大家知道自己上线了','',500,5,86400,5,86400,1,0,'',0),('updateline','救生圈','把指定对象的发布时间更新为当前时间','',200,5,86400,999,0,1,0,'',0),('downdateline','时空机','把指定对象的发布时间修改为过去的时间','',250,5,86400,999,0,1,0,'',0),('color','彩色灯','把指定对象的标题变成彩色的','',50,5,86400,999,0,1,0,'',0),('hot','热点灯','把指定对象的热度增加站点推荐的热点值','',50,5,86400,999,0,1,0,'',0),('visit','互访卡','随机选择10个好友，向其打招呼、留言或访问空间','',20,2,86400,999,0,1,0,'',0),('icon','彩虹蛋','给指定对象的标题前面增加图标（最多8个图标）','',20,2,86400,999,0,1,0,'',0),('flicker','彩虹炫','让评论、留言的文字闪烁起来','',30,3,86400,999,0,1,0,'',0),('gift','红包卡','在自己的空间埋下积分红包送给来访者','',20,2,86400,999,0,1,0,'',0),('superstar','超级明星','在个人主页，给自己的头像增加超级明星标识','',30,3,86400,999,0,1,0,'',0),('viewmagiclog','八卦镜','查看指定用户最近使用的道具记录','',100,5,86400,999,0,1,0,'',0),('viewmagic','透视镜','查看指定用户当前持有的道具','',100,5,86400,999,0,1,0,'',0),('viewvisitor','偷窥镜','查看指定用户最近访问过的10个空间','',100,5,86400,999,0,1,0,'',0),('call','点名卡','发通知给自己的好友，让他们来查看指定的对象','',50,5,86400,999,0,1,0,'',0),('coupon','代金券','购买道具时折换一定量的积分','',0,0,0,0,0,1,0,'',0),('frame','相框','给自己的照片添上相框','',30,3,86400,999,0,1,0,'',0),('bgimage','信纸','给指定的对象添加信纸背景','',30,3,86400,999,0,1,0,'',0),('doodle','涂鸦板','允许在留言、评论等操作时使用涂鸦板','',30,3,86400,999,0,1,0,'',0),('anonymous','匿名卡','在指定的地方，让自己的名字显示为匿名','',50,5,86400,999,0,1,0,'',0),('reveal','照妖镜','可以查看一次匿名用户的真实身份','',100,5,86400,999,0,1,0,'',0),('license','道具转让许可证','使用许可证，将道具赠送给指定好友','',10,1,3600,999,0,1,0,'',0),('detector','探测器','探测埋了红包的空间','',10,1,86400,999,0,1,0,'',0);
/*!40000 ALTER TABLE `uchome_magic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_magicinlog`
--

DROP TABLE IF EXISTS `uchome_magicinlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_magicinlog` (
  `logid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `mid` varchar(15) NOT NULL DEFAULT '',
  `count` smallint(6) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fromid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `credit` smallint(6) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`logid`),
  KEY `uid` (`uid`,`dateline`),
  KEY `type` (`type`,`fromid`,`dateline`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uchome_magicstore`
--

DROP TABLE IF EXISTS `uchome_magicstore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_magicstore` (
  `mid` varchar(15) NOT NULL DEFAULT '',
  `storage` smallint(6) unsigned NOT NULL DEFAULT '0',
  `lastprovide` int(10) unsigned NOT NULL DEFAULT '0',
  `sellcount` int(8) unsigned NOT NULL DEFAULT '0',
  `sellcredit` int(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_magicstore`
--

LOCK TABLES `uchome_magicstore` WRITE;
/*!40000 ALTER TABLE `uchome_magicstore` DISABLE KEYS */;
INSERT INTO `uchome_magicstore` VALUES ('invisible',10,1340466155,0,0),('doodle',998,1343311158,3,90),('flicker',999,1340986468,0,0),('anonymous',999,1340986472,0,0),('friendnum',999,1343546521,1,30),('attachsize',999,1341738449,0,0),('thunder',5,1341738449,0,0),('updateline',999,1341738449,0,0),('downdateline',999,1341738449,0,0),('color',999,1341738449,0,0),('hot',999,1341738449,0,0),('visit',999,1341738449,0,0),('icon',999,1341738449,0,0),('gift',998,1341738449,1,20),('superstar',998,1341738449,1,30),('viewmagiclog',999,1341738449,0,0),('viewmagic',999,1341738449,0,0),('viewvisitor',999,1341738449,0,0),('call',999,1341738449,0,0),('frame',999,1341738449,0,0),('bgimage',999,1341738449,0,0),('reveal',999,1341738449,0,0),('license',999,1341738449,0,0),('detector',999,1341738449,0,0);
/*!40000 ALTER TABLE `uchome_magicstore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_magicuselog`
--

DROP TABLE IF EXISTS `uchome_magicuselog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_magicuselog` (
  `logid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `mid` varchar(15) NOT NULL DEFAULT '',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `idtype` varchar(20) NOT NULL DEFAULT '',
  `count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `expire` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`logid`),
  KEY `uid` (`uid`,`mid`),
  KEY `id` (`id`,`idtype`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_magicuselog`
--

LOCK TABLES `uchome_magicuselog` WRITE;
/*!40000 ALTER TABLE `uchome_magicuselog` DISABLE KEYS */;
INSERT INTO `uchome_magicuselog` VALUES (1,1,'admin','superstar',0,'',1,'',1344787761,1345392561);
/*!40000 ALTER TABLE `uchome_magicuselog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_mailcron`
--

DROP TABLE IF EXISTS `uchome_mailcron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_mailcron` (
  `cid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `touid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `sendtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `sendtime` (`sendtime`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_mailcron`
--

LOCK TABLES `uchome_mailcron` WRITE;
/*!40000 ALTER TABLE `uchome_mailcron` DISABLE KEYS */;
/*!40000 ALTER TABLE `uchome_mailcron` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_mailqueue`
--

DROP TABLE IF EXISTS `uchome_mailqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_mailqueue` (
  `qid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`qid`),
  KEY `mcid` (`cid`,`dateline`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_mailqueue`
--

LOCK TABLES `uchome_mailqueue` WRITE;
/*!40000 ALTER TABLE `uchome_mailqueue` DISABLE KEYS */;
/*!40000 ALTER TABLE `uchome_mailqueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_member`
--

DROP TABLE IF EXISTS `uchome_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_member` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(15) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_member`
--

LOCK TABLES `uchome_member` WRITE;
/*!40000 ALTER TABLE `uchome_member` DISABLE KEYS */;
INSERT INTO `uchome_member` VALUES (1,'admin','211283f7ee4ad210bc6a65d7906dd7a1');
/*!40000 ALTER TABLE `uchome_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_mtag`
--

DROP TABLE IF EXISTS `uchome_mtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_mtag` (
  `tagid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tagname` varchar(40) NOT NULL DEFAULT '',
  `fieldid` smallint(6) NOT NULL DEFAULT '0',
  `membernum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `threadnum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `postnum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `close` tinyint(1) NOT NULL DEFAULT '0',
  `announcement` text NOT NULL,
  `pic` varchar(150) NOT NULL DEFAULT '',
  `closeapply` tinyint(1) NOT NULL DEFAULT '0',
  `joinperm` tinyint(1) NOT NULL DEFAULT '0',
  `viewperm` tinyint(1) NOT NULL DEFAULT '0',
  `threadperm` tinyint(1) NOT NULL DEFAULT '0',
  `postperm` tinyint(1) NOT NULL DEFAULT '0',
  `recommend` tinyint(1) NOT NULL DEFAULT '0',
  `moderator` varchar(255) NOT NULL DEFAULT '',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tagid`),
  KEY `tagname` (`tagname`),
  KEY `threadnum` (`threadnum`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uchome_mtaginvite`
--

DROP TABLE IF EXISTS `uchome_mtaginvite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_mtaginvite` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tagid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fromuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fromusername` char(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`tagid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_mtaginvite`
--

LOCK TABLES `uchome_mtaginvite` WRITE;
/*!40000 ALTER TABLE `uchome_mtaginvite` DISABLE KEYS */;
/*!40000 ALTER TABLE `uchome_mtaginvite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_myapp`
--

DROP TABLE IF EXISTS `uchome_myapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_myapp` (
  `appid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `appname` varchar(60) NOT NULL DEFAULT '',
  `narrow` tinyint(1) NOT NULL DEFAULT '0',
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  `version` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `displaymethod` tinyint(1) NOT NULL DEFAULT '0',
  `displayorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`appid`),
  KEY `flag` (`flag`,`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_myapp`
--

LOCK TABLES `uchome_myapp` WRITE;
/*!40000 ALTER TABLE `uchome_myapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `uchome_myapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_myinvite`
--

DROP TABLE IF EXISTS `uchome_myinvite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_myinvite` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `typename` varchar(100) NOT NULL DEFAULT '',
  `appid` mediumint(8) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `fromuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `touid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `myml` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `hash` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`),
  KEY `uid` (`touid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_myinvite`
--

LOCK TABLES `uchome_myinvite` WRITE;
/*!40000 ALTER TABLE `uchome_myinvite` DISABLE KEYS */;
/*!40000 ALTER TABLE `uchome_myinvite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_notification`
--

DROP TABLE IF EXISTS `uchome_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_notification` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT '',
  `new` tinyint(1) NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(15) NOT NULL DEFAULT '',
  `note` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`new`,`dateline`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uchome_pic`
--

DROP TABLE IF EXISTS `uchome_pic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_pic` (
  `picid` mediumint(8) NOT NULL AUTO_INCREMENT,
  `albumid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topicid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `postip` varchar(20) NOT NULL DEFAULT '',
  `filename` varchar(100) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `size` int(10) unsigned NOT NULL DEFAULT '0',
  `filepath` varchar(60) NOT NULL DEFAULT '',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `remote` tinyint(1) NOT NULL DEFAULT '0',
  `hot` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `click_6` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click_7` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click_8` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click_9` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click_10` smallint(6) unsigned NOT NULL DEFAULT '0',
  `magicframe` tinyint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`picid`),
  KEY `albumid` (`albumid`,`dateline`),
  KEY `topicid` (`topicid`,`dateline`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uchome_picfield`
--

DROP TABLE IF EXISTS `uchome_picfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_picfield` (
  `picid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hotuser` text NOT NULL,
  PRIMARY KEY (`picid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_picfield`
--

LOCK TABLES `uchome_picfield` WRITE;
/*!40000 ALTER TABLE `uchome_picfield` DISABLE KEYS */;
/*!40000 ALTER TABLE `uchome_picfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_poke`
--

DROP TABLE IF EXISTS `uchome_poke`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_poke` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fromuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fromusername` varchar(15) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `iconid` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`fromuid`),
  KEY `uid` (`uid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_poke`
--

LOCK TABLES `uchome_poke` WRITE;
/*!40000 ALTER TABLE `uchome_poke` DISABLE KEYS */;
/*!40000 ALTER TABLE `uchome_poke` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_poll`
--

DROP TABLE IF EXISTS `uchome_poll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_poll` (
  `pid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `topicid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `subject` char(80) NOT NULL DEFAULT '',
  `voternum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `replynum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `multiple` tinyint(1) NOT NULL DEFAULT '0',
  `maxchoice` tinyint(3) NOT NULL DEFAULT '0',
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `noreply` tinyint(1) NOT NULL DEFAULT '0',
  `credit` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `percredit` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  `lastvote` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `hot` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`),
  KEY `uid` (`uid`,`dateline`),
  KEY `topicid` (`topicid`,`dateline`),
  KEY `voternum` (`voternum`),
  KEY `dateline` (`dateline`),
  KEY `lastvote` (`lastvote`),
  KEY `hot` (`hot`),
  KEY `percredit` (`percredit`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `uchome_pollfield`
--

DROP TABLE IF EXISTS `uchome_pollfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_pollfield` (
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `summary` text NOT NULL,
  `option` text NOT NULL,
  `invite` text NOT NULL,
  `hotuser` text NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uchome_polloption`
--

DROP TABLE IF EXISTS `uchome_polloption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_polloption` (
  `oid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `votenum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `option` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`oid`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uchome_polluser`
--

DROP TABLE IF EXISTS `uchome_polluser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_polluser` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `option` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`pid`),
  KEY `pid` (`pid`,`dateline`),
  KEY `uid` (`uid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_polluser`
--

LOCK TABLES `uchome_polluser` WRITE;
/*!40000 ALTER TABLE `uchome_polluser` DISABLE KEYS */;
/*!40000 ALTER TABLE `uchome_polluser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_post`
--

DROP TABLE IF EXISTS `uchome_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_post` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `pic` varchar(255) NOT NULL DEFAULT '',
  `isthread` tinyint(1) NOT NULL DEFAULT '0',
  `hotuser` text NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `tid` (`tid`,`dateline`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uchome_profield`
--

DROP TABLE IF EXISTS `uchome_profield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_profield` (
  `fieldid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `formtype` varchar(20) NOT NULL DEFAULT '0',
  `inputnum` smallint(3) unsigned NOT NULL DEFAULT '0',
  `choice` text NOT NULL,
  `mtagminnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `manualmoderator` tinyint(1) NOT NULL DEFAULT '0',
  `manualmember` tinyint(1) NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_profield`
--

LOCK TABLES `uchome_profield` WRITE;
/*!40000 ALTER TABLE `uchome_profield` DISABLE KEYS */;
INSERT INTO `uchome_profield` VALUES (1,'自由联盟','','text',100,'',0,0,1,0),(2,'地区联盟','','text',100,'',0,0,1,0),(3,'兴趣联盟','','text',100,'',0,0,1,0);
/*!40000 ALTER TABLE `uchome_profield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_profilefield`
--

DROP TABLE IF EXISTS `uchome_profilefield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_profilefield` (
  `fieldid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `formtype` varchar(20) NOT NULL DEFAULT '0',
  `maxsize` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `invisible` tinyint(1) NOT NULL DEFAULT '0',
  `allowsearch` tinyint(1) NOT NULL DEFAULT '0',
  `choice` text NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_profilefield`
--

LOCK TABLES `uchome_profilefield` WRITE;
/*!40000 ALTER TABLE `uchome_profilefield` DISABLE KEYS */;
/*!40000 ALTER TABLE `uchome_profilefield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_report`
--

DROP TABLE IF EXISTS `uchome_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_report` (
  `rid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `idtype` varchar(15) NOT NULL DEFAULT '',
  `new` tinyint(1) NOT NULL DEFAULT '0',
  `num` smallint(6) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `reason` text NOT NULL,
  `uids` text NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `id` (`id`,`idtype`,`num`,`dateline`),
  KEY `new` (`new`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_report`
--

LOCK TABLES `uchome_report` WRITE;
/*!40000 ALTER TABLE `uchome_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `uchome_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_session`
--

DROP TABLE IF EXISTS `uchome_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_session` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `lastactivity` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` int(10) unsigned NOT NULL DEFAULT '0',
  `magichidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `lastactivity` (`lastactivity`),
  KEY `ip` (`ip`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_session`
--

LOCK TABLES `uchome_session` WRITE;
/*!40000 ALTER TABLE `uchome_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `uchome_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_share`
--

DROP TABLE IF EXISTS `uchome_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_share` (
  `sid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `topicid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` varchar(30) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `title_template` text NOT NULL,
  `body_template` text NOT NULL,
  `body_data` text NOT NULL,
  `body_general` text NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `image_link` varchar(255) NOT NULL DEFAULT '',
  `hot` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hotuser` text NOT NULL,
  PRIMARY KEY (`sid`),
  KEY `uid` (`uid`,`dateline`),
  KEY `topicid` (`topicid`,`dateline`),
  KEY `hot` (`hot`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uchome_show`
--

DROP TABLE IF EXISTS `uchome_show`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_show` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `credit` int(10) unsigned NOT NULL DEFAULT '0',
  `note` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `credit` (`credit`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_show`
--

LOCK TABLES `uchome_show` WRITE;
/*!40000 ALTER TABLE `uchome_show` DISABLE KEYS */;
/*!40000 ALTER TABLE `uchome_show` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_space`
--

DROP TABLE IF EXISTS `uchome_space`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_space` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `groupid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `credit` int(10) NOT NULL DEFAULT '0',
  `experience` int(10) NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `name` char(20) NOT NULL DEFAULT '',
  `namestatus` tinyint(1) NOT NULL DEFAULT '0',
  `videostatus` tinyint(1) NOT NULL DEFAULT '0',
  `domain` char(15) NOT NULL DEFAULT '',
  `friendnum` int(10) unsigned NOT NULL DEFAULT '0',
  `viewnum` int(10) unsigned NOT NULL DEFAULT '0',
  `notenum` int(10) unsigned NOT NULL DEFAULT '0',
  `addfriendnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `mtaginvitenum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `eventinvitenum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `myinvitenum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `pokenum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `doingnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `blognum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `albumnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `threadnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `pollnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `eventnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `sharenum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `lastsearch` int(10) unsigned NOT NULL DEFAULT '0',
  `lastpost` int(10) unsigned NOT NULL DEFAULT '0',
  `lastlogin` int(10) unsigned NOT NULL DEFAULT '0',
  `lastsend` int(10) unsigned NOT NULL DEFAULT '0',
  `attachsize` int(10) unsigned NOT NULL DEFAULT '0',
  `addsize` int(10) unsigned NOT NULL DEFAULT '0',
  `addfriend` smallint(6) unsigned NOT NULL DEFAULT '0',
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  `newpm` smallint(6) unsigned NOT NULL DEFAULT '0',
  `avatar` tinyint(1) NOT NULL DEFAULT '0',
  `regip` char(15) NOT NULL DEFAULT '',
  `ip` int(10) unsigned NOT NULL DEFAULT '0',
  `mood` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `username` (`username`),
  KEY `domain` (`domain`),
  KEY `ip` (`ip`),
  KEY `updatetime` (`updatetime`),
  KEY `mood` (`mood`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uchome_spacefield`
--

DROP TABLE IF EXISTS `uchome_spacefield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_spacefield` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `newemail` varchar(100) NOT NULL DEFAULT '',
  `emailcheck` tinyint(1) NOT NULL DEFAULT '0',
  `mobile` varchar(40) NOT NULL DEFAULT '',
  `qq` varchar(20) NOT NULL DEFAULT '',
  `msn` varchar(80) NOT NULL DEFAULT '',
  `msnrobot` varchar(15) NOT NULL DEFAULT '',
  `msncstatus` tinyint(1) NOT NULL DEFAULT '0',
  `videopic` varchar(32) NOT NULL DEFAULT '',
  `birthyear` smallint(6) unsigned NOT NULL DEFAULT '0',
  `birthmonth` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `birthday` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `blood` varchar(5) NOT NULL DEFAULT '',
  `marry` tinyint(1) NOT NULL DEFAULT '0',
  `birthprovince` varchar(20) NOT NULL DEFAULT '',
  `birthcity` varchar(20) NOT NULL DEFAULT '',
  `resideprovince` varchar(20) NOT NULL DEFAULT '',
  `residecity` varchar(20) NOT NULL DEFAULT '',
  `note` text NOT NULL,
  `spacenote` text NOT NULL,
  `authstr` varchar(20) NOT NULL DEFAULT '',
  `theme` varchar(20) NOT NULL DEFAULT '',
  `nocss` tinyint(1) NOT NULL DEFAULT '0',
  `menunum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `css` text NOT NULL,
  `privacy` text NOT NULL,
  `friend` mediumtext NOT NULL,
  `feedfriend` mediumtext NOT NULL,
  `sendmail` text NOT NULL,
  `magicstar` tinyint(1) NOT NULL DEFAULT '0',
  `magicexpire` int(10) unsigned NOT NULL DEFAULT '0',
  `timeoffset` varchar(20) NOT NULL DEFAULT '',
  `emplyee` varchar(255) NOT NULL DEFAULT '',
  `likedog` varchar(255) NOT NULL DEFAULT '',
  `aihao` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uchome_spaceinfo`
--

DROP TABLE IF EXISTS `uchome_spaceinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_spaceinfo` (
  `infoid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT '',
  `subtype` varchar(20) NOT NULL DEFAULT '',
  `title` text NOT NULL,
  `subtitle` varchar(255) NOT NULL DEFAULT '',
  `friend` tinyint(1) NOT NULL DEFAULT '0',
  `startyear` smallint(6) unsigned NOT NULL DEFAULT '0',
  `endyear` smallint(6) unsigned NOT NULL DEFAULT '0',
  `startmonth` smallint(6) unsigned NOT NULL DEFAULT '0',
  `endmonth` smallint(6) unsigned NOT NULL DEFAULT '0',
  `emplyee` varchar(255) NOT NULL DEFAULT '',
  `mobile` int(11) unsigned NOT NULL DEFAULT '0',
  `likedog` varchar(255) NOT NULL DEFAULT '',
  `aihao` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`infoid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_spaceinfo`
--

LOCK TABLES `uchome_spaceinfo` WRITE;
/*!40000 ALTER TABLE `uchome_spaceinfo` DISABLE KEYS */;
INSERT INTO `uchome_spaceinfo` VALUES (8,1,'base','mobile','','',1,0,0,0,0,'',0,'',''),(7,1,'base','birth','','',1,0,0,0,0,'',0,'','');
/*!40000 ALTER TABLE `uchome_spaceinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_spacelog`
--

DROP TABLE IF EXISTS `uchome_spacelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_spacelog` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `opuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `opusername` char(15) NOT NULL DEFAULT '',
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `flag` (`flag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_spacelog`
--

LOCK TABLES `uchome_spacelog` WRITE;
/*!40000 ALTER TABLE `uchome_spacelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `uchome_spacelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_stat`
--

DROP TABLE IF EXISTS `uchome_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_stat` (
  `daytime` int(10) unsigned NOT NULL DEFAULT '0',
  `login` smallint(6) unsigned NOT NULL DEFAULT '0',
  `register` smallint(6) unsigned NOT NULL DEFAULT '0',
  `invite` smallint(6) unsigned NOT NULL DEFAULT '0',
  `appinvite` smallint(6) unsigned NOT NULL DEFAULT '0',
  `doing` smallint(6) unsigned NOT NULL DEFAULT '0',
  `blog` smallint(6) unsigned NOT NULL DEFAULT '0',
  `pic` smallint(6) unsigned NOT NULL DEFAULT '0',
  `poll` smallint(6) unsigned NOT NULL DEFAULT '0',
  `event` smallint(6) unsigned NOT NULL DEFAULT '0',
  `share` smallint(6) unsigned NOT NULL DEFAULT '0',
  `thread` smallint(6) unsigned NOT NULL DEFAULT '0',
  `docomment` smallint(6) unsigned NOT NULL DEFAULT '0',
  `blogcomment` smallint(6) unsigned NOT NULL DEFAULT '0',
  `piccomment` smallint(6) unsigned NOT NULL DEFAULT '0',
  `pollcomment` smallint(6) unsigned NOT NULL DEFAULT '0',
  `pollvote` smallint(6) unsigned NOT NULL DEFAULT '0',
  `eventcomment` smallint(6) unsigned NOT NULL DEFAULT '0',
  `eventjoin` smallint(6) unsigned NOT NULL DEFAULT '0',
  `sharecomment` smallint(6) unsigned NOT NULL DEFAULT '0',
  `post` smallint(6) unsigned NOT NULL DEFAULT '0',
  `wall` smallint(6) unsigned NOT NULL DEFAULT '0',
  `poke` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`daytime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uchome_statuser`
--

DROP TABLE IF EXISTS `uchome_statuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_statuser` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `daytime` int(10) unsigned NOT NULL DEFAULT '0',
  `type` char(20) NOT NULL DEFAULT '',
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_statuser`
--

LOCK TABLES `uchome_statuser` WRITE;
/*!40000 ALTER TABLE `uchome_statuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `uchome_statuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_tag`
--

DROP TABLE IF EXISTS `uchome_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_tag` (
  `tagid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tagname` char(30) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `blognum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `close` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tagid`),
  KEY `tagname` (`tagname`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uchome_tagblog`
--

DROP TABLE IF EXISTS `uchome_tagblog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_tagblog` (
  `tagid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `blogid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tagid`,`blogid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `uchome_tagspace`
--

DROP TABLE IF EXISTS `uchome_tagspace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_tagspace` (
  `tagid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `grade` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tagid`,`uid`),
  KEY `grade` (`tagid`,`grade`),
  KEY `uid` (`uid`,`grade`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `uchome_task`
--

DROP TABLE IF EXISTS `uchome_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_task` (
  `taskid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `note` text NOT NULL,
  `num` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `maxnum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `image` varchar(150) NOT NULL DEFAULT '',
  `filename` varchar(50) NOT NULL DEFAULT '',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `nexttime` int(10) unsigned NOT NULL DEFAULT '0',
  `nexttype` varchar(20) NOT NULL DEFAULT '',
  `credit` smallint(6) NOT NULL DEFAULT '0',
  `displayorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`taskid`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_task`
--

LOCK TABLES `uchome_task` WRITE;
/*!40000 ALTER TABLE `uchome_task` DISABLE KEYS */;
INSERT INTO `uchome_task` VALUES (1,1,'更新一下自己的头像','头像就是你在这里的个人形象。<br>设置自己的头像后，会让更多的朋友记住您。',2,0,'image/task/avatar.gif','avatar.php',0,0,0,'',20,1),(2,1,'将个人资料补充完整','把自己的个人资料填写完整吧。<br>这样您会被更多的朋友找到的，系统也会帮您找到朋友。',0,0,'image/task/profile.gif','profile.php',0,0,0,'2',20,0),(3,1,'发表自己的第一篇日志','现在，就写下自己的第一篇日志吧。<br>与大家一起分享自己的生活感悟。',1,0,'image/task/blog.gif','blog.php',0,0,0,'',5,3),(4,1,'寻找并添加五位好友','有了好友，您发的日志、图片等会被好友及时看到并传播出去；<br>您也会在首页方便及时的看到好友的最新动态。',0,0,'image/task/friend.gif','friend.php',0,0,0,'',50,4),(5,1,'验证激活自己的邮箱','填写自己真实的邮箱地址并验证通过。<br>您可以在忘记密码的时候使用该邮箱取回自己的密码；<br>还可以及时接受站内的好友通知等等。',0,0,'image/task/email.gif','email.php',0,0,0,'',10,5),(6,1,'邀请10个新朋友加入','邀请一下自己的QQ好友或者邮箱联系人，让亲朋好友一起来加入我们吧。',0,0,'image/task/friend.gif','invite.php',0,0,0,'',100,6),(7,1,'领取每日访问大礼包','每天登录访问自己的主页，就可领取大礼包。',0,0,'image/task/gift.gif','gift.php',0,0,0,'day',5,99);
/*!40000 ALTER TABLE `uchome_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_thread`
--

DROP TABLE IF EXISTS `uchome_thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_thread` (
  `tid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `topicid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tagid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `eventid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subject` char(80) NOT NULL DEFAULT '',
  `magiccolor` tinyint(6) unsigned NOT NULL DEFAULT '0',
  `magicegg` tinyint(6) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `viewnum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `replynum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lastpost` int(10) unsigned NOT NULL DEFAULT '0',
  `lastauthor` char(15) NOT NULL DEFAULT '',
  `lastauthorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `displayorder` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `digest` tinyint(1) NOT NULL DEFAULT '0',
  `hot` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `click_11` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click_12` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click_13` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click_14` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click_15` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `tagid` (`tagid`,`displayorder`,`lastpost`),
  KEY `uid` (`uid`,`lastpost`),
  KEY `lastpost` (`lastpost`),
  KEY `topicid` (`topicid`,`dateline`),
  KEY `eventid` (`eventid`,`lastpost`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uchome_topic`
--

DROP TABLE IF EXISTS `uchome_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_topic` (
  `topicid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `subject` varchar(80) NOT NULL DEFAULT '',
  `message` mediumtext NOT NULL,
  `jointype` varchar(255) NOT NULL DEFAULT '',
  `joingid` varchar(255) NOT NULL DEFAULT '',
  `pic` varchar(100) NOT NULL DEFAULT '',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `remote` tinyint(1) NOT NULL DEFAULT '0',
  `joinnum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lastpost` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`topicid`),
  KEY `lastpost` (`lastpost`),
  KEY `joinnum` (`joinnum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_topic`
--

LOCK TABLES `uchome_topic` WRITE;
/*!40000 ALTER TABLE `uchome_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `uchome_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_topicuser`
--

DROP TABLE IF EXISTS `uchome_topicuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_topicuser` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topicid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`dateline`),
  KEY `topicid` (`topicid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_topicuser`
--

LOCK TABLES `uchome_topicuser` WRITE;
/*!40000 ALTER TABLE `uchome_topicuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `uchome_topicuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_userapp`
--

DROP TABLE IF EXISTS `uchome_userapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_userapp` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `appid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `appname` varchar(60) NOT NULL DEFAULT '',
  `privacy` tinyint(1) NOT NULL DEFAULT '0',
  `allowsidenav` tinyint(1) NOT NULL DEFAULT '0',
  `allowfeed` tinyint(1) NOT NULL DEFAULT '0',
  `allowprofilelink` tinyint(1) NOT NULL DEFAULT '0',
  `narrow` tinyint(1) NOT NULL DEFAULT '0',
  `menuorder` smallint(6) NOT NULL DEFAULT '0',
  `displayorder` smallint(6) NOT NULL DEFAULT '0',
  KEY `uid` (`uid`,`appid`),
  KEY `menuorder` (`uid`,`menuorder`),
  KEY `displayorder` (`uid`,`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_userapp`
--

LOCK TABLES `uchome_userapp` WRITE;
/*!40000 ALTER TABLE `uchome_userapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `uchome_userapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_userappfield`
--

DROP TABLE IF EXISTS `uchome_userappfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_userappfield` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `appid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `profilelink` text NOT NULL,
  `myml` text NOT NULL,
  KEY `uid` (`uid`,`appid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_userappfield`
--

LOCK TABLES `uchome_userappfield` WRITE;
/*!40000 ALTER TABLE `uchome_userappfield` DISABLE KEYS */;
/*!40000 ALTER TABLE `uchome_userappfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_userevent`
--

DROP TABLE IF EXISTS `uchome_userevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_userevent` (
  `eventid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `fellow` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `template` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`eventid`,`uid`),
  KEY `uid` (`uid`,`dateline`),
  KEY `eventid` (`eventid`,`status`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uchome_usergroup`
--

DROP TABLE IF EXISTS `uchome_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_usergroup` (
  `gid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `grouptitle` varchar(20) NOT NULL DEFAULT '',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `banvisit` tinyint(1) NOT NULL DEFAULT '0',
  `explower` int(10) NOT NULL DEFAULT '0',
  `maxfriendnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `maxattachsize` int(10) unsigned NOT NULL DEFAULT '0',
  `allowhtml` tinyint(1) NOT NULL DEFAULT '0',
  `allowcomment` tinyint(1) NOT NULL DEFAULT '0',
  `searchinterval` smallint(6) unsigned NOT NULL DEFAULT '0',
  `searchignore` tinyint(1) NOT NULL DEFAULT '0',
  `postinterval` smallint(6) unsigned NOT NULL DEFAULT '0',
  `spamignore` tinyint(1) NOT NULL DEFAULT '0',
  `videophotoignore` tinyint(1) NOT NULL DEFAULT '0',
  `allowblog` tinyint(1) NOT NULL DEFAULT '0',
  `allowdoing` tinyint(1) NOT NULL DEFAULT '0',
  `allowupload` tinyint(1) NOT NULL DEFAULT '0',
  `allowshare` tinyint(1) NOT NULL DEFAULT '0',
  `allowmtag` tinyint(1) NOT NULL DEFAULT '0',
  `allowthread` tinyint(1) NOT NULL DEFAULT '0',
  `allowpost` tinyint(1) NOT NULL DEFAULT '0',
  `allowcss` tinyint(1) NOT NULL DEFAULT '0',
  `allowpoke` tinyint(1) NOT NULL DEFAULT '0',
  `allowfriend` tinyint(1) NOT NULL DEFAULT '0',
  `allowpoll` tinyint(1) NOT NULL DEFAULT '0',
  `allowclick` tinyint(1) NOT NULL DEFAULT '0',
  `allowevent` tinyint(1) NOT NULL DEFAULT '0',
  `allowmagic` tinyint(1) NOT NULL DEFAULT '0',
  `allowpm` tinyint(1) NOT NULL DEFAULT '0',
  `allowviewvideopic` tinyint(1) NOT NULL DEFAULT '0',
  `allowmyop` tinyint(1) NOT NULL DEFAULT '0',
  `allowtopic` tinyint(1) NOT NULL DEFAULT '0',
  `allowstat` tinyint(1) NOT NULL DEFAULT '0',
  `magicdiscount` tinyint(1) NOT NULL DEFAULT '0',
  `verifyevent` tinyint(1) NOT NULL DEFAULT '0',
  `edittrail` tinyint(1) NOT NULL DEFAULT '0',
  `domainlength` smallint(6) unsigned NOT NULL DEFAULT '0',
  `closeignore` tinyint(1) NOT NULL DEFAULT '0',
  `seccode` tinyint(1) NOT NULL DEFAULT '0',
  `color` varchar(10) NOT NULL DEFAULT '',
  `icon` varchar(100) NOT NULL DEFAULT '',
  `manageconfig` tinyint(1) NOT NULL DEFAULT '0',
  `managenetwork` tinyint(1) NOT NULL DEFAULT '0',
  `manageprofilefield` tinyint(1) NOT NULL DEFAULT '0',
  `manageprofield` tinyint(1) NOT NULL DEFAULT '0',
  `manageusergroup` tinyint(1) NOT NULL DEFAULT '0',
  `managefeed` tinyint(1) NOT NULL DEFAULT '0',
  `manageshare` tinyint(1) NOT NULL DEFAULT '0',
  `managedoing` tinyint(1) NOT NULL DEFAULT '0',
  `manageblog` tinyint(1) NOT NULL DEFAULT '0',
  `managetag` tinyint(1) NOT NULL DEFAULT '0',
  `managetagtpl` tinyint(1) NOT NULL DEFAULT '0',
  `managealbum` tinyint(1) NOT NULL DEFAULT '0',
  `managecomment` tinyint(1) NOT NULL DEFAULT '0',
  `managemtag` tinyint(1) NOT NULL DEFAULT '0',
  `managethread` tinyint(1) NOT NULL DEFAULT '0',
  `manageevent` tinyint(1) NOT NULL DEFAULT '0',
  `manageeventclass` tinyint(1) NOT NULL DEFAULT '0',
  `managecensor` tinyint(1) NOT NULL DEFAULT '0',
  `managead` tinyint(1) NOT NULL DEFAULT '0',
  `managesitefeed` tinyint(1) NOT NULL DEFAULT '0',
  `managebackup` tinyint(1) NOT NULL DEFAULT '0',
  `manageblock` tinyint(1) NOT NULL DEFAULT '0',
  `managetemplate` tinyint(1) NOT NULL DEFAULT '0',
  `managestat` tinyint(1) NOT NULL DEFAULT '0',
  `managecache` tinyint(1) NOT NULL DEFAULT '0',
  `managecredit` tinyint(1) NOT NULL DEFAULT '0',
  `managecron` tinyint(1) NOT NULL DEFAULT '0',
  `managename` tinyint(1) NOT NULL DEFAULT '0',
  `manageapp` tinyint(1) NOT NULL DEFAULT '0',
  `managetask` tinyint(1) NOT NULL DEFAULT '0',
  `managereport` tinyint(1) NOT NULL DEFAULT '0',
  `managepoll` tinyint(1) NOT NULL DEFAULT '0',
  `manageclick` tinyint(1) NOT NULL DEFAULT '0',
  `managemagic` tinyint(1) NOT NULL DEFAULT '0',
  `managemagiclog` tinyint(1) NOT NULL DEFAULT '0',
  `managebatch` tinyint(1) NOT NULL DEFAULT '0',
  `managedelspace` tinyint(1) NOT NULL DEFAULT '0',
  `managetopic` tinyint(1) NOT NULL DEFAULT '0',
  `manageip` tinyint(1) NOT NULL DEFAULT '0',
  `managehotuser` tinyint(1) NOT NULL DEFAULT '0',
  `managedefaultuser` tinyint(1) NOT NULL DEFAULT '0',
  `managespacegroup` tinyint(1) NOT NULL DEFAULT '0',
  `managespaceinfo` tinyint(1) NOT NULL DEFAULT '0',
  `managespacecredit` tinyint(1) NOT NULL DEFAULT '0',
  `managespacenote` tinyint(1) NOT NULL DEFAULT '0',
  `managevideophoto` tinyint(1) NOT NULL DEFAULT '0',
  `managelog` tinyint(1) NOT NULL DEFAULT '0',
  `magicaward` text NOT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_usergroup`
--

LOCK TABLES `uchome_usergroup` WRITE;
/*!40000 ALTER TABLE `uchome_usergroup` DISABLE KEYS */;
INSERT INTO `uchome_usergroup` VALUES (1,'站点管理员',-1,0,0,0,0,1,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,0,'red','image/group/admin.gif',1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,''),(2,'信息管理员',-1,0,0,0,0,1,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,3,1,0,'blue','image/group/infor.gif',0,0,0,0,0,1,1,1,1,1,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(3,'贵宾VIP',1,0,0,0,0,1,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,3,0,0,'green','image/group/vip.gif',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(4,'受限会员',0,0,-999999999,10,10,0,0,600,0,300,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(5,'普通会员',0,0,0,100,20,0,1,60,0,60,0,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,0,1,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(6,'中级会员',0,0,100,200,50,0,1,30,0,30,0,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,0,1,0,0,0,0,0,5,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(7,'高级会员',0,0,1000,300,100,1,1,10,1,10,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0,0,0,0,0,3,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(8,'禁止发言',-1,0,0,1,1,0,0,9999,0,9999,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,99,0,1,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(9,'禁止访问',-1,1,0,1,1,0,0,9999,0,9999,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,99,0,1,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');
/*!40000 ALTER TABLE `uchome_usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_userlog`
--

DROP TABLE IF EXISTS `uchome_userlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_userlog` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `action` char(10) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchome_userlog`
--

LOCK TABLES `uchome_userlog` WRITE;
/*!40000 ALTER TABLE `uchome_userlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `uchome_userlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchome_usermagic`
--

DROP TABLE IF EXISTS `uchome_usermagic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_usermagic` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `mid` varchar(15) NOT NULL DEFAULT '',
  `count` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uchome_usertask`
--

DROP TABLE IF EXISTS `uchome_usertask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_usertask` (
  `uid` mediumint(8) unsigned NOT NULL,
  `username` char(15) NOT NULL DEFAULT '',
  `taskid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `credit` smallint(6) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `isignore` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`taskid`),
  KEY `isignore` (`isignore`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uchome_visitor`
--

DROP TABLE IF EXISTS `uchome_visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchome_visitor` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `vuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `vusername` char(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`vuid`),
  KEY `dateline` (`uid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-09-19 10:10:05
