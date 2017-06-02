/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50630
Source Host           : localhost:3306
Source Database       : gameplatform

Target Server Type    : MYSQL
Target Server Version : 50630
File Encoding         : 65001

Date: 2017-05-16 21:42:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_charge`
-- ----------------------------
DROP TABLE IF EXISTS `t_charge`;
CREATE TABLE `t_charge` (
  `chargeUserId` int(5) NOT NULL,
  `chargeMoneyTotal` double(5,2) NOT NULL,
  `chargeMoneyNow` double(5,2) NOT NULL,
  PRIMARY KEY (`chargeUserId`),
  CONSTRAINT `t_charge_ibfk_1` FOREIGN KEY (`chargeUserId`) REFERENCES `t_user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_charge
-- ----------------------------
INSERT INTO `t_charge` VALUES ('26', '999.99', '0.00');
INSERT INTO `t_charge` VALUES ('29', '0.00', '0.00');
INSERT INTO `t_charge` VALUES ('31', '10.00', '10.00');
INSERT INTO `t_charge` VALUES ('32', '200.00', '120.00');

-- ----------------------------
-- Table structure for `t_combat`
-- ----------------------------
DROP TABLE IF EXISTS `t_combat`;
CREATE TABLE `t_combat` (
  `combatId` int(5) NOT NULL AUTO_INCREMENT,
  `combateResult` varchar(10) DEFAULT NULL,
  `combateScore` varchar(10) DEFAULT NULL,
  `combateTime` datetime DEFAULT NULL,
  `combatGameId` int(5) DEFAULT NULL,
  `combateUserId` int(5) DEFAULT NULL,
  PRIMARY KEY (`combatId`),
  KEY `FK62B7511F7F8BFA58` (`combatGameId`),
  KEY `FK62B7511F4BF8458E` (`combateUserId`),
  CONSTRAINT `FK62B7511F4BF8458E` FOREIGN KEY (`combateUserId`) REFERENCES `t_user` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `FK62B7511F7F8BFA58` FOREIGN KEY (`combatGameId`) REFERENCES `t_game` (`gameId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_combat
-- ----------------------------
INSERT INTO `t_combat` VALUES ('1', 'win', '1', '2017-05-25 20:12:18', '2', '32');
INSERT INTO `t_combat` VALUES ('40', 'win', '2', '2017-05-25 20:12:18', '1', '32');
INSERT INTO `t_combat` VALUES ('41', 'win', '3', '2017-05-25 20:12:18', '1', '32');
INSERT INTO `t_combat` VALUES ('42', 'win', '4', '2017-05-25 20:12:18', '2', '32');
INSERT INTO `t_combat` VALUES ('43', 'win', '5', '2017-05-25 20:12:18', '2', '32');
INSERT INTO `t_combat` VALUES ('44', 'win', '6', '2017-05-25 20:12:18', '1', '32');
INSERT INTO `t_combat` VALUES ('45', 'win', '7', '2017-05-25 20:12:18', '2', '32');
INSERT INTO `t_combat` VALUES ('46', 'win', '8', '2017-05-25 20:12:18', '1', '32');
INSERT INTO `t_combat` VALUES ('47', 'win', '9', '2017-05-25 20:12:18', '2', '32');
INSERT INTO `t_combat` VALUES ('48', 'win', '10', '2017-05-25 20:12:18', '1', '32');
INSERT INTO `t_combat` VALUES ('49', 'win', '11', '2017-05-25 20:12:18', '1', '32');
INSERT INTO `t_combat` VALUES ('50', 'win', '12', '2017-05-25 20:12:18', '2', '32');
INSERT INTO `t_combat` VALUES ('51', 'win', '13', '2017-05-25 20:12:18', '1', '32');
INSERT INTO `t_combat` VALUES ('52', 'win', '14', '2017-05-25 20:12:18', '2', '32');
INSERT INTO `t_combat` VALUES ('53', 'win', '15', '2017-05-25 20:12:18', '2', '32');
INSERT INTO `t_combat` VALUES ('54', 'win', '16', '2017-05-25 20:12:18', '1', '32');
INSERT INTO `t_combat` VALUES ('55', 'win', '17', '2017-05-25 20:12:18', '2', '32');
INSERT INTO `t_combat` VALUES ('56', 'win', '18', '2017-05-25 20:12:18', '2', '32');
INSERT INTO `t_combat` VALUES ('57', 'win', '19', '2017-05-25 20:12:18', '1', '32');
INSERT INTO `t_combat` VALUES ('58', 'win', '20', '2017-05-25 20:12:18', '1', '32');

-- ----------------------------
-- Table structure for `t_friend`
-- ----------------------------
DROP TABLE IF EXISTS `t_friend`;
CREATE TABLE `t_friend` (
  `friendId` int(5) NOT NULL AUTO_INCREMENT,
  `userId` int(5) NOT NULL,
  `userFriendId` int(5) NOT NULL,
  PRIMARY KEY (`friendId`),
  KEY `userId` (`userId`),
  KEY `userFriendId` (`userFriendId`),
  CONSTRAINT `t_friend_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `t_user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_friend_ibfk_2` FOREIGN KEY (`userFriendId`) REFERENCES `t_user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_friend
-- ----------------------------
INSERT INTO `t_friend` VALUES ('30', '31', '31');
INSERT INTO `t_friend` VALUES ('33', '32', '31');
INSERT INTO `t_friend` VALUES ('34', '32', '32');

-- ----------------------------
-- Table structure for `t_game`
-- ----------------------------
DROP TABLE IF EXISTS `t_game`;
CREATE TABLE `t_game` (
  `gameId` int(5) NOT NULL AUTO_INCREMENT,
  `gameImage` varchar(100) DEFAULT NULL,
  `gameIntroduc` varchar(300) DEFAULT NULL,
  `gameName` varchar(30) NOT NULL,
  `gamePath` varchar(100) NOT NULL,
  `gameTitle` varchar(50) DEFAULT NULL,
  `gameVersion` double(5,0) DEFAULT NULL,
  `gameMoney` double(5,0) unsigned zerofill NOT NULL,
  PRIMARY KEY (`gameId`),
  UNIQUE KEY `gameId` (`gameId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_game
-- ----------------------------
INSERT INTO `t_game` VALUES ('1', 'jigsaw.png', '学习是不是学累了?玩游戏时不时玩烦了？是时候伸个懒腰喽~\r\n\r\n休闲娱乐来一盘，ONE　PIECE 智力拼图，休闲娱乐，转换思路，可谓是休闲的最佳之选。', '拼图游戏', 'jigsaw.zip', '拼图游戏是一款益智休闲类游戏。', '1', '00108');
INSERT INTO `t_game` VALUES ('2', 'ballGame.png', '大学生活你感觉到空虚了吗？大学生活，你感觉到疲惫了吗？那就赶快下载桌面台球 游戏吧，局域网游戏，一个局域，宿舍畅玩，无收费，无弹窗，干净简洁的小游戏， 快来游戏吧，让你和舍友一决高下。\r\n\r\n不要犹豫', '台球游戏', 'ballGame1.3.zip', '台球游戏是一款比较耐玩的体育类安卓游戏。', '1', '00199');
INSERT INTO `t_game` VALUES ('16', 'cry.jpg', 'ccc', 'play', 'Tom.zip', 'Play', '2', '00100');

-- ----------------------------
-- Table structure for `t_relate`
-- ----------------------------
DROP TABLE IF EXISTS `t_relate`;
CREATE TABLE `t_relate` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `userId` int(5) DEFAULT NULL,
  `gameId` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `gameId` (`gameId`),
  CONSTRAINT `t_relate_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `t_user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_relate_ibfk_2` FOREIGN KEY (`gameId`) REFERENCES `t_game` (`gameId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_relate
-- ----------------------------
INSERT INTO `t_relate` VALUES ('1', '26', '1');
INSERT INTO `t_relate` VALUES ('2', '26', '2');
INSERT INTO `t_relate` VALUES ('36', '32', '16');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `userId` int(5) NOT NULL AUTO_INCREMENT,
  `userName` varchar(30) NOT NULL,
  `userPassword` varchar(30) NOT NULL,
  `userType` int(5) NOT NULL,
  `userEmail` varchar(30) DEFAULT NULL,
  `userPhone` varchar(20) DEFAULT NULL,
  `userImage` varchar(100) DEFAULT NULL,
  `userBirth` date DEFAULT NULL,
  `userInfor` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('26', 'admin', 'admin', '2', '864910691@163.com', '17862822935', 'admintimo.png', '1995-10-01', '																																																							只有最强的王者，才有资格说话。\r\n				\r\n				\r\n				\r\n				\r\n				');
INSERT INTO `t_user` VALUES ('29', 'Malulu', 'Malulu123', '0', '2631629805@qq.com', null, 'Malulutimg.jpg', '1996-01-16', '唐艺昕女神.');
INSERT INTO `t_user` VALUES ('31', 'Lucy', 'Lucy123456', '0', 'Lucycy@qq.com', null, 'girl.jpg', '2006-05-18', 'Hello Beary');
INSERT INTO `t_user` VALUES ('32', 'Mystical', 'Mystical123456', '1', 'Mystical@qq.com', '17862822935', 'shuaige.jpg', '2009-07-17', 'Hello world');
