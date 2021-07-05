# Host: localhost  (Version: 5.6.10)
# Date: 2021-07-05 11:30:19
# Generator: MySQL-Front 5.3  (Build 2.42)

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

CREATE DATABASE `gd` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `gd`;

#
# Source for table "abnormal"
#

CREATE TABLE `abnormal` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `username` varchar(16) NOT NULL DEFAULT '',
  `symptom0` varchar(255) DEFAULT NULL,
  `symptom1` varchar(255) DEFAULT NULL,
  `symptom2` varchar(255) DEFAULT NULL,
  `symptom3` varchar(255) DEFAULT NULL,
  `symptom4` varchar(255) DEFAULT NULL,
  `symptom5` varchar(255) DEFAULT NULL,
  `reporter` varchar(10) NOT NULL DEFAULT '',
  `reportertime` date NOT NULL DEFAULT '0000-00-00',
  `sp` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Data for table "abnormal"
#

INSERT INTO `abnormal` VALUES (1,'2020-03-04 14:24:22','尔尔','发烧','咳嗽','呕吐','腹泻','','','admin','2021-05-24',0),(2,'2020-09-16 14:24:29','希晨','发烧','咳嗽','呕吐','','','头疼','admin','2021-05-24',0),(3,'2021-01-13 14:24:34','得的','发烧','咳嗽','','','','','admin','2021-05-24',0),(4,'2020-12-15 14:24:39','李四','发烧','','','','','','admin','2021-05-24',0),(5,'2021-05-24 00:00:00','','感冒','','呕吐','','头晕','','admin','2021-05-24',1),(6,'2021-02-16 14:24:48','17036097','发烧','咳嗽','','','','头疼','admin','2021-05-24',2),(7,'2021-05-24 00:00:00','张三','','咳嗽','','','','','admin','2021-05-24',0),(8,'2021-05-24 19:10:01','李四','发烧','','','','头晕','','admin','2021-05-24',0),(9,'2021-05-24 19:23:32','17036097','','咳嗽','','','','','admin','2021-05-24',1),(10,'2021-05-28 20:44:54','希晨','发烧','咳嗽','呕吐','腹泻','头晕','头疼','admin','2021-05-28',0);

#
# Source for table "bill"
#

CREATE TABLE `bill` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `billno` varchar(30) NOT NULL DEFAULT '0',
  `orderuser` int(11) NOT NULL DEFAULT '0',
  `money` int(11) NOT NULL DEFAULT '0',
  `creater` varchar(16) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT NULL,
  `sp` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "bill"
#

INSERT INTO `bill` VALUES (1,'20210411213021',10,5000,'admin','2021-05-26 06:00:00',2),(2,'20210526181044',27,4000,'admin','2021-05-26 18:10:45',0),(3,'20210526183804',19,5000,'admin','2021-05-26 18:38:05',1),(5,'20210526204826',32,7000,'admin','2021-05-26 20:48:27',2);

#
# Source for table "caip"
#

CREATE TABLE `caip` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `cpname` varchar(255) DEFAULT NULL,
  `cpdescribe` varchar(255) DEFAULT NULL,
  `caipy` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

#
# Data for table "caip"
#

INSERT INTO `caip` VALUES (1,'米饭','大米',1),(2,'面条','面粉',1),(3,'粥','大米',1),(4,'水煮鸡蛋','鸡蛋',1),(5,'荷包蛋','鸡蛋',1),(6,'青椒鸡蛋','青椒，鸡蛋',1),(7,'番茄鸡蛋','番茄，鸡蛋',1),(8,'青椒肉丝','青椒，猪肉',1),(9,'青椒牛肉','青椒，牛肉',1),(10,'宫爆鸡丁','鸡肉，胡萝卜，花生，杏鲍菇',1),(11,'爆炒鸡杂','鸡杂（鸡胗，鸡肠，鸡心，鸡肝），洋葱，小米辣',1),(12,'红烧鸡块','鸡块，青椒，小米辣，蒜头',1),(13,'红烧鸡爪','鸡爪，青椒，小米辣，蒜头',1),(14,'垃圾袋','聚氯乙烯',0),(15,'砂锅鸡','鸡肉',1);

#
# Source for table "caiporder"
#

CREATE TABLE `caiporder` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(11) NOT NULL DEFAULT '0',
  `cdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `temp` varchar(255) NOT NULL DEFAULT '',
  `send` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

#
# Data for table "caiporder"
#

INSERT INTO `caiporder` VALUES (1,6,'2021-05-25 12:32:35','米饭，青椒鸡蛋',1),(2,30,'2021-05-27 00:32:33','米饭,面条,',1),(3,30,'2021-05-27 00:49:23','米饭,面条,粥,',1),(4,30,'2021-05-27 18:48:34','垃圾袋,',1),(5,30,'2021-05-27 18:57:01','垃圾袋,',1),(6,30,'2021-05-27 19:03:22','垃圾袋,',1),(7,30,'2021-05-27 19:07:01','垃圾袋,',1),(8,30,'2021-05-27 19:09:19','垃圾袋,',1),(9,30,'2021-05-27 19:14:38','米饭,荷包蛋,',1),(10,30,'2021-05-27 19:14:45','垃圾袋,',1),(11,30,'2021-05-28 20:39:37','米饭,',0),(12,30,'2021-05-28 20:39:48','垃圾袋,',0);

#
# Source for table "dayreport"
#

CREATE TABLE `dayreport` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `temp` int(2) DEFAULT NULL,
  `cdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `emotion` varchar(255) DEFAULT NULL,
  `reportetime` date DEFAULT '0000-00-00',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "dayreport"
#


#
# Source for table "duty"
#

CREATE TABLE `duty` (
  `Id` int(8) NOT NULL AUTO_INCREMENT,
  `aduserid` int(8) DEFAULT NULL,
  `userid` int(8) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `aduserid` (`aduserid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "duty"
#

INSERT INTO `duty` VALUES (3,2,5);

#
# Source for table "room"
#

CREATE TABLE `room` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `roomname` varchar(10) DEFAULT NULL,
  `roomadd` varchar(255) DEFAULT NULL,
  `userd` int(1) NOT NULL DEFAULT '0',
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

#
# Data for table "room"
#

INSERT INTO `room` VALUES (1,'1#01','巢湖市XX酒店一楼1#01',1,28),(2,'1#02','巢湖市XX酒店一楼1#02',1,19),(3,'1#03','巢湖市XX酒店一楼1#03',1,27),(4,'1#04','巢湖市XX酒店一楼1#04',1,28),(5,'1#05','巢湖市XX酒店一楼1#05',1,5),(6,'1#06','巢湖市XX酒店一楼1#06',1,14),(7,'2#01','巢湖酒店',1,30),(8,'2#02','巢湖市XX酒店二楼2#02',1,6),(9,'2#03','巢湖市XX酒店二楼2#03',1,32),(10,'2#04','巢湖市XX酒店二楼2#04',0,NULL),(11,'2#05','巢湖市XX酒店二楼2#05',0,NULL),(12,'2#06','巢湖市XX酒店二楼2#06',0,NULL),(13,'3#01','巢湖市XX酒店3#01',1,10),(14,'3#02','巢湖市XX酒店三楼3#02',0,NULL);

#
# Source for table "user"
#

CREATE TABLE `user` (
  `id` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL,
  `birth` date NOT NULL,
  `sex` varchar(6) DEFAULT NULL,
  `phonenum` varchar(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `qq` varchar(16) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `realname` varchar(16) DEFAULT NULL,
  `idnum` varchar(100) DEFAULT NULL,
  `userclass` char(1) NOT NULL,
  `cadd` varchar(255) DEFAULT NULL,
  `tl` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "user"
#

INSERT INTO `user` VALUES (00000002,'admin','123456','1997-01-17','男','18855117322','18165078@qq.com','1618588055','中国安徽巢湖','希晨','342601189809179021','A',NULL,0),(00000003,'李四','123456','1995-01-04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'L',NULL,0),(00000005,'王大美','12345','2021-04-05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'G','1#05',0),(00000006,'六七','123456','2021-04-05','男','32423234553','18165828@qq.com','1618588333','中国安徽巢湖','希晨','342601189809179021','G','',1),(00000007,'无二','123456','2021-04-06','女','23256743512',NULL,NULL,NULL,NULL,NULL,'G','4#03',0),(00000010,'希晨1','123','2020-12-29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'G','3#01',0),(00000013,'尔尔','123456','2021-03-31','女',NULL,NULL,NULL,NULL,NULL,NULL,'A',NULL,0),(00000017,'王大大','123456','2021-03-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'G',NULL,1),(00000019,'张而大','123456','2021-04-06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'G','',1),(00000021,'王为','123456','2021-02-04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'L',NULL,0),(00000022,'咿呀','123456','1997-01-23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'L',NULL,0),(00000024,'时间','123456','2021-02-17','男',NULL,NULL,NULL,NULL,NULL,NULL,'A',NULL,0),(00000026,'希晨21','123456','2021-01-05','男',NULL,NULL,NULL,NULL,NULL,NULL,'A',NULL,0),(00000027,'基尼太美','123456','2021-02-04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'G','',1),(00000028,'高岩松','123456','2021-03-10',NULL,NULL,NULL,NULL,NULL,'',NULL,'G','1#04',0),(00000029,'白先大','123456','2020-12-03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'L',NULL,0),(00000030,'张三','123456','2021-04-27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'G','2#01',0),(00000031,'李小白','123456','2021-05-26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'G','',1),(00000032,'刘洋','123456','2021-05-26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'G','',1);

#
# Source for table "user_room"
#

CREATE TABLE `user_room` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `roomid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "user_room"
#


/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
