-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.27-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema course
--

CREATE DATABASE IF NOT EXISTS course;
USE course;

--
-- Definition of table `addsub`
--

DROP TABLE IF EXISTS `addsub`;
CREATE TABLE `addsub` (
  `cname` varchar(45) NOT NULL,
  `branch` varchar(45) NOT NULL,
  `creg` varchar(45) NOT NULL,
  `year` varchar(45) NOT NULL,
  `sem` varchar(45) NOT NULL,
  `subcode` varchar(45) NOT NULL,
  `subname` varchar(45) NOT NULL,
  `prd` int(20) unsigned NOT NULL,
  `tut` int(20) unsigned NOT NULL,
  `crd` int(20) unsigned NOT NULL,
  `type` varchar(45) NOT NULL default 'R'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addsub`
--

/*!40000 ALTER TABLE `addsub` DISABLE KEYS */;
INSERT INTO `addsub` (`cname`,`branch`,`creg`,`year`,`sem`,`subcode`,`subname`,`prd`,`tut`,`crd`,`type`) VALUES 
 ('B.Tech','CSE','R05','I','-','R123','UNIX',2,2,2,'R'),
 ('B.Tech','CSE','R05','I','-','R124','CO',2,2,2,'R'),
 ('B.Tech','CSE','R05','I','-','R125','CD',2,2,2,'R'),
 ('B.Tech','CSE','R05','I','-','R126','DBMS',2,2,2,'R'),
 ('B.Tech','CSE','R05','II','1','R127','IS',2,2,2,'R'),
 ('B.Tech','CSE','R05','II','1','R128','SE',2,2,2,'R'),
 ('B.Tech','CSE','R05','II','1','R129','CDS',2,2,2,'R'),
 ('M.Tech','ECE','R05','II','1','R130','ADS',2,2,2,'R'),
 ('M.Tech','ECE','R05','II','1','R131','MM',2,2,2,'R'),
 ('M.Tech','ECE','R05','II','1','R132','M1',2,2,2,'R'),
 ('M.Tech','ECE','R05','II','2','R133','EDS',2,2,2,'R'),
 ('M.Tech','ECE','R05','II','2','R134','BEE',2,2,2,'R'),
 ('M.Tech','CSE','R05','I','-','SADSDA','SDAD',1,2,2,'R'),
 ('M.Tech','CSE','R05','I','1','SADSDA','SDAD',1,2,2,'R'),
 ('B.Tech','CSE','R05','II','1','SADSDA','SDAD',1,2,2,'R'),
 ('B.Tech','CSE','R05','I','-','SADSDA','SDAD',1,2,2,'R'),
 ('B.Tech','CSE','R05','II','1','GFH','GHHG',1,0,1,'R');
INSERT INTO `addsub` (`cname`,`branch`,`creg`,`year`,`sem`,`subcode`,`subname`,`prd`,`tut`,`crd`,`type`) VALUES 
 ('B.Tech','CSE','R05','IV','1','RE2','MMAD',2,2,2,'E2'),
 ('B.Tech','CSE','R05','IV','1','R109','MM',2,2,2,'E1'),
 ('B.Tech','CSE','R05','I','-','R109','MM',2,2,2,'R'),
 ('M.Tech','CSE','R05','I','1','R111','MM',2,2,2,'E4'),
 ('M.Tech','CSE','R05','IV','2','R33','CS',2,2,2,'E4'),
 ('B.Tech','CSE','R05','I','-','R33','CS',2,2,2,'R'),
 ('B.Tech','CSE','R05','IV','1','R22','CS',2,2,4,'E1');
/*!40000 ALTER TABLE `addsub` ENABLE KEYS */;


--
-- Definition of table `courseinfo`
--

DROP TABLE IF EXISTS `courseinfo`;
CREATE TABLE `courseinfo` (
  `cname` varchar(50) NOT NULL,
  `bname` varchar(45) NOT NULL,
  `creg` varchar(45) NOT NULL,
  `year` int(20) unsigned NOT NULL,
  `seats` int(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courseinfo`
--

/*!40000 ALTER TABLE `courseinfo` DISABLE KEYS */;
INSERT INTO `courseinfo` (`cname`,`bname`,`creg`,`year`,`seats`) VALUES 
 ('M.Tech','ECE','R05',2001,100),
 ('B.Tech','CSE','R05',2001,100),
 ('B.Tech','ECE','R05',2001,100);
/*!40000 ALTER TABLE `courseinfo` ENABLE KEYS */;


--
-- Definition of table `file`
--

DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `sname` varchar(50) NOT NULL,
  `sfname` varchar(45) NOT NULL,
  `path` varchar(100) NOT NULL,
  PRIMARY KEY  (`sname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `file`
--

/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` (`sname`,`sfname`,`path`) VALUES 
 ('R123','r123.doc','C:\\\\Program Files\\\\Apache Software Foundation\\\\Tomcat 5.5\\\\webapps\\\\course\\\\syllabus\\\\r123.doc');
/*!40000 ALTER TABLE `file` ENABLE KEYS */;


--
-- Definition of table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `uid` varchar(50) NOT NULL default '',
  `pwd` varchar(45) NOT NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` (`uid`,`pwd`) VALUES 
 ('cet','cet'),
 ('svpcet','ss');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
