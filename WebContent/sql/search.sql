/*
 Navicat Premium Data Transfer

 Source Server         : 点一下玩一年
 Source Server Type    : MySQL
 Source Server Version : 50515
 Source Host           : localhost:3306
 Source Schema         : search

 Target Server Type    : MySQL
 Target Server Version : 50515
 File Encoding         : 65001

 Date: 16/10/2018 13:58:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for urlinfo
-- ----------------------------
DROP TABLE IF EXISTS `urlinfo`;
CREATE TABLE `urlinfo`  (
  `uid` int(255) NOT NULL AUTO_INCREMENT,
  `urlName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网站名字',
  `urlWeblink` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网站链接',
  `urlsortid` int(11) NULL DEFAULT NULL COMMENT '网站分类ID(外键)',
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `urlAndSort`(`urlsortid`) USING BTREE,
  CONSTRAINT `FKb2vv6pvwnm968b599bjjphnek` FOREIGN KEY (`urlsortid`) REFERENCES `urlsortinfo` (`urlsortId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `urlinfo_ibfk_1` FOREIGN KEY (`urlsortid`) REFERENCES `urlsortinfo` (`urlsortId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of urlinfo
-- ----------------------------
INSERT INTO `urlinfo` VALUES (0, '百度', 'https://www.baidu.com/', 0);
INSERT INTO `urlinfo` VALUES (1, '淘宝网', 'https://www.taobao.com/', 1);
INSERT INTO `urlinfo` VALUES (2, '苏宁易购', 'https://www.suning.com/', 1);
INSERT INTO `urlinfo` VALUES (3, '京东', 'https://www.jd.com/', 1);
INSERT INTO `urlinfo` VALUES (4, '国美商城', 'https://www.gome.com.cn/', 1);
INSERT INTO `urlinfo` VALUES (5, '聚划算', 'https://ju.taobao.com/', 1);
INSERT INTO `urlinfo` VALUES (6, '亚马逊', 'https://www.amazon.cn/', 1);
INSERT INTO `urlinfo` VALUES (7, '虎扑足球', 'https://soccer.hupu.com/', 2);
INSERT INTO `urlinfo` VALUES (8, '新浪足球', 'http://sports.sina.com.cn/global/', 2);
INSERT INTO `urlinfo` VALUES (9, '足协', 'http://www.thecfa.cn/', 2);
INSERT INTO `urlinfo` VALUES (10, 'CCTV体育', 'http://sports.cctv.com/football/index.shtml', 2);
INSERT INTO `urlinfo` VALUES (11, 'NBA官网', 'http://china.nba.com/', 2);
INSERT INTO `urlinfo` VALUES (12, 'CBA官网', 'http://www.cba.gov.cn/', 2);
INSERT INTO `urlinfo` VALUES (13, '百度贴吧', 'https://tieba.baidu.com/', 3);
INSERT INTO `urlinfo` VALUES (14, '推特', 'https://twitter.com/', 3);
INSERT INTO `urlinfo` VALUES (15, 'QQ空间', 'https://qzone.qq.com/', 3);
INSERT INTO `urlinfo` VALUES (16, '天涯', 'http://www.tianya.cn/', 3);
INSERT INTO `urlinfo` VALUES (17, '人人网', 'http://china.nba.com/', 3);
INSERT INTO `urlinfo` VALUES (18, 'Facebook', 'https://www.facebook.com/', 3);
INSERT INTO `urlinfo` VALUES (19, '英雄联盟', 'lol.qq.com', 4);
INSERT INTO `urlinfo` VALUES (20, '天涯明月刀', 'wuxia.qq.com', 4);
INSERT INTO `urlinfo` VALUES (21, '地下城勇士', 'dnf.qq.com', 4);
INSERT INTO `urlinfo` VALUES (22, '梦幻西游', 'xyq.163.com', 4);
INSERT INTO `urlinfo` VALUES (23, 'Dota2', 'www.dota2.com.cn', 4);
INSERT INTO `urlinfo` VALUES (24, '坦克世界', 'wot.kongzhong.com', 4);
INSERT INTO `urlinfo` VALUES (25, '瘾科技', 'cn.engadget.com', 5);
INSERT INTO `urlinfo` VALUES (26, 'zealer', 'www.zealer.com', 5);
INSERT INTO `urlinfo` VALUES (27, '大米评测', 'www.pingce.net', 5);
INSERT INTO `urlinfo` VALUES (28, '数字尾巴', 'www.dgtle.com', 5);
INSERT INTO `urlinfo` VALUES (29, '中关村在线', 'www.zol.com.cn', 5);
INSERT INTO `urlinfo` VALUES (30, '太平洋电脑', 'www.pconline.com.cn', 5);
INSERT INTO `urlinfo` VALUES (31, '携程', 'www.ctrip.com', 6);
INSERT INTO `urlinfo` VALUES (32, '途牛', 'www.tuniu.com', 6);
INSERT INTO `urlinfo` VALUES (33, '驴妈妈旅游', 'www.lvmama.com', 6);
INSERT INTO `urlinfo` VALUES (34, '去哪网', 'www.qunar.com', 6);
INSERT INTO `urlinfo` VALUES (35, '马蜂窝', 'www.mafengwo.cn', 6);
INSERT INTO `urlinfo` VALUES (36, '长途客运站', 'www.keyunzhan.com', 6);
INSERT INTO `urlinfo` VALUES (37, '瘾科技', 'cn.engadget.com', 0);
INSERT INTO `urlinfo` VALUES (38, '去哪网', 'www.qunar.com', 0);
INSERT INTO `urlinfo` VALUES (39, 'QQ空间', 'https://qzone.qq.com/', 0);
INSERT INTO `urlinfo` VALUES (40, '京东', 'https://www.jd.com/', 0);
INSERT INTO `urlinfo` VALUES (41, '淘宝网', 'https://www.taobao.com/', 0);
INSERT INTO `urlinfo` VALUES (42, '百度贴吧', 'https://tieba.baidu.com/', 0);
INSERT INTO `urlinfo` VALUES (43, '英雄联盟', 'lol.qq.com', 0);
INSERT INTO `urlinfo` VALUES (44, '地下城勇士', 'dnf.qq.com', 0);
INSERT INTO `urlinfo` VALUES (45, '苏宁易购', 'https://www.suning.com/', 0);
INSERT INTO `urlinfo` VALUES (46, '携程', 'www.ctrip.com', 0);

-- ----------------------------
-- Table structure for urlsortinfo
-- ----------------------------
DROP TABLE IF EXISTS `urlsortinfo`;
CREATE TABLE `urlsortinfo`  (
  `urlsortId` int(11) NOT NULL AUTO_INCREMENT COMMENT '网址分类ID',
  `urlsortName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网址分类名称',
  PRIMARY KEY (`urlsortId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of urlsortinfo
-- ----------------------------
INSERT INTO `urlsortinfo` VALUES (0, '常用');
INSERT INTO `urlsortinfo` VALUES (1, '购物');
INSERT INTO `urlsortinfo` VALUES (2, '体育');
INSERT INTO `urlsortinfo` VALUES (3, '社区');
INSERT INTO `urlsortinfo` VALUES (4, '游戏');
INSERT INTO `urlsortinfo` VALUES (5, '数码');
INSERT INTO `urlsortinfo` VALUES (6, '旅行');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `userId` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `userName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓名',
  `userAccount` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `userPwd` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES (0, 'boss', 'admin', 'admin');
INSERT INTO `userinfo` VALUES (1, '张三', 'asd', '123');
INSERT INTO `userinfo` VALUES (2, '李四', 'asd1', '1231');

SET FOREIGN_KEY_CHECKS = 1;
