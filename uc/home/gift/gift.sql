DROP TABLE IF EXISTS `uchome_app_tw_gift`;
CREATE TABLE IF NOT EXISTS `uchome_app_tw_gift` (
  `id` int(11) NOT NULL auto_increment,
  `uid` mediumint(8) default NULL,
  `username` varchar(50) default NULL,
  `touid` mediumint(8) NOT NULL,
  `tousername` varchar(50) NOT NULL,
  `gift` varchar(100) NOT NULL,
  `dateline` int(10) NOT NULL,
  `type` int(10) NOT NULL,
  `message` varchar(250) default NULL,
  PRIMARY KEY  (`id`),
  KEY `touid` (`touid`),
  KEY `touid2` (`touid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
