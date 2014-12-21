/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50538
Source Host           : localhost:3306
Source Database       : ideabox

Target Server Type    : MYSQL
Target Server Version : 50538
File Encoding         : 65001

Date: 2014-07-03 18:56:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `questionid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '0',
  `content` varchar(255) NOT NULL,
  `choice` varchar(255) DEFAULT '',
  PRIMARY KEY (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question
-- ----------------------------

-- ----------------------------
-- Table structure for questionnaire
-- ----------------------------
DROP TABLE IF EXISTS `questionnaire`;
CREATE TABLE `questionnaire` (
  `QID` bigint(32) unsigned NOT NULL AUTO_INCREMENT,
  `investID` bigint(32) NOT NULL DEFAULT '-1',
  `title` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `content` varchar(255) NOT NULL,
  `usernum` int(11) DEFAULT '1',
  `ipnum` int(11) DEFAULT '1',
  `anonymous` int(11) DEFAULT '1',
  `isavailable` int(11) DEFAULT '1',
  `createdate` datetime DEFAULT NULL,
  `lasteditdate` datetime DEFAULT NULL,
  `deletedate` datetime DEFAULT NULL,
  `iscreated` int(11) DEFAULT '1',
  `iseditable` int(11) DEFAULT '1',
  `isreleased` int(11) DEFAULT '0',
  `isclosed` int(11) DEFAULT '0',
  PRIMARY KEY (`QID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questionnaire
-- ----------------------------
INSERT INTO `questionnaire` VALUES ('2', '-1', '123', '213', '12312', '123123', '123', '2', '1', '1', '2014-07-27 16:33:43', '2014-07-03 16:34:03', '2032-12-03 00:00:00', '1', '1', '0', '0');
INSERT INTO `questionnaire` VALUES ('3', '-1', '123', '213', '12312', '123123', '2', '2', '1', '1', '2014-07-27 16:33:43', '2014-07-03 16:34:03', '2032-12-03 00:00:00', '1', '1', '0', '0');
INSERT INTO `questionnaire` VALUES ('4', '-1', '123', '213', '12312', '123123', '24', '24', '1', '1', '2014-07-27 16:33:43', '2014-07-03 16:34:03', '2032-12-03 00:00:00', '1', '1', '0', '0');

-- ----------------------------
-- Table structure for result
-- ----------------------------
DROP TABLE IF EXISTS `result`;
CREATE TABLE `result` (
  `qid` int(11) NOT NULL,
  `result` varchar(255) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of result
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `age` int(10) unsigned NOT NULL,
  `gender` varchar(255) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
