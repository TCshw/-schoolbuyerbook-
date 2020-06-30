/*
Navicat MySQL Data Transfer

Source Server         : orderbook
Source Server Version : 50645
Source Host           : localhost:3306
Source Database       : library

Target Server Type    : MYSQL
Target Server Version : 50645
File Encoding         : 65001

Date: 2020-06-12 17:22:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminid` int(100) NOT NULL,
  `adminpass` varchar(255) NOT NULL,
  `adminname` varchar(255) NOT NULL,
  PRIMARY KEY (`adminid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('12', '11', 'ff');
INSERT INTO `admin` VALUES ('2020200001', '2020200000', 'xh');

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `bookid` varchar(255) NOT NULL,
  `bookname` varchar(255) NOT NULL,
  `bookauthor` varchar(255) NOT NULL,
  `bookpublisher` varchar(255) NOT NULL,
  `bookprice` int(123) NOT NULL,
  `major` varchar(255) NOT NULL,
  `bookquantity` int(20) DEFAULT NULL,
  PRIMARY KEY (`bookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES ('A002', 'spring', 'xxx', 'xxxx', '12', 'dsd', '4');
INSERT INTO `books` VALUES ('A13', 'df', 'fd', 'fds', '12', 'ds', '344');
INSERT INTO `books` VALUES ('AD21', 'dv', 'dvs', 'dsv', '2', 'ds', '32');
INSERT INTO `books` VALUES ('D12', 'ds', 'sdf', 'dfs', '213', 'dd', '2334');
INSERT INTO `books` VALUES ('F23', 'ew', 'ewr', 'erw', '23', 'ew', '21');
INSERT INTO `books` VALUES ('S23', 'dfs', 'fdf', 'sfs', '332', 'cxv', '45');
INSERT INTO `books` VALUES ('zxc', 'vxc', 'xcv', 'cxv', '12', 'cacs', '4324');

-- ----------------------------
-- Table structure for buyer
-- ----------------------------
DROP TABLE IF EXISTS `buyer`;
CREATE TABLE `buyer` (
  `buyerid` int(100) NOT NULL,
  `buyerpass` varchar(255) NOT NULL,
  `buyername` varchar(230) NOT NULL,
  PRIMARY KEY (`buyerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of buyer
-- ----------------------------
INSERT INTO `buyer` VALUES ('2020000001', '2020000001', 'xx');

-- ----------------------------
-- Table structure for lockbook
-- ----------------------------
DROP TABLE IF EXISTS `lockbook`;
CREATE TABLE `lockbook` (
  `bookid` varchar(233) NOT NULL,
  `bookname` varchar(255) NOT NULL,
  `bookauthor` varchar(255) NOT NULL,
  `bookpublisher` varchar(255) NOT NULL,
  `bookprice` int(233) NOT NULL,
  `bookquantity` int(233) NOT NULL,
  PRIMARY KEY (`bookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lockbook
-- ----------------------------
INSERT INTO `lockbook` VALUES ('e12', 'AD', 'ADS', 'VD', '23', '12');

-- ----------------------------
-- Table structure for purchasebook
-- ----------------------------
DROP TABLE IF EXISTS `purchasebook`;
CREATE TABLE `purchasebook` (
  `bookid` int(255) NOT NULL,
  `bookname` varchar(255) NOT NULL,
  `bookauthor` varchar(255) NOT NULL,
  `bookpublisher` varchar(255) CHARACTER SET utf8 NOT NULL,
  `bookprice` int(11) NOT NULL,
  `bookquantity` int(255) NOT NULL,
  `studentname` varchar(30) DEFAULT NULL,
  `bookdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of purchasebook
-- ----------------------------
INSERT INTO `purchasebook` VALUES ('5', 'fd', 'fd', 'gdg', '1234', '32', 'ds', null);
INSERT INTO `purchasebook` VALUES ('97', '??', 'xh', 'gdg', '1239', '32', 'ds', null);
INSERT INTO `purchasebook` VALUES ('224', 'gf', 'efr', 'gr', '123', '12', 'fd', null);
INSERT INTO `purchasebook` VALUES ('37', 'fd', 'vf', 'vf', '2', '2', 'ddd', '2020-05-27');
INSERT INTO `purchasebook` VALUES ('3452', 'sds', 'dcc', 'vd', '111', '111', 'cv', '2020-05-14');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `stuId` int(100) NOT NULL,
  `stupass` varchar(255) NOT NULL,
  `stuName` varchar(255) NOT NULL,
  `stuclass` varchar(255) NOT NULL,
  PRIMARY KEY (`stuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('2020100001', '2020100001', 'xxx', 'san');

-- ----------------------------
-- Table structure for stuinbook
-- ----------------------------
DROP TABLE IF EXISTS `stuinbook`;
CREATE TABLE `stuinbook` (
  `bookid` varchar(255) NOT NULL,
  `bookname` varchar(255) NOT NULL,
  `bookauthor` varchar(255) NOT NULL,
  `bookpublisher` varchar(255) NOT NULL,
  `bookprice` int(122) NOT NULL,
  `bookquantity` int(122) NOT NULL,
  `studentname` varchar(255) NOT NULL,
  `bookdate` date NOT NULL,
  `bookstate` varchar(255) CHARACTER SET utf8 COLLATE utf8_icelandic_ci DEFAULT NULL,
  `lackbooks` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of stuinbook
-- ----------------------------
INSERT INTO `stuinbook` VALUES ('003A', 'hhh', 'hhh', 'hhh', '34', '323', 'df', '2019-04-03', 'T', '34');
INSERT INTO `stuinbook` VALUES ('g3234', 'BV', 'FB', 'bss', '234', '43', 'fdvf', '2020-05-31', 'NULL', '0');
INSERT INTO `stuinbook` VALUES ('D32', 'sdf', 'dsf', 'sd23', '3', '23', 'ds', '2020-06-04', 'NULL', '0');
INSERT INTO `stuinbook` VALUES ('F231', 'dsa', 'fads', 'fd', '21', '12', 'ds', '2020-06-05', 'NULL', '0');
