/*
Navicat MySQL Data Transfer

Source Server         : hiaocong
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : db_out_vehicle_system

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-04-19 00:21:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_driver
-- ----------------------------
DROP TABLE IF EXISTS `t_driver`;
CREATE TABLE `t_driver` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '默认自增id',
  `number` varchar(20) NOT NULL DEFAULT '0' COMMENT '司机编号',
  `mobile_number` int(11) NOT NULL COMMENT '手机号',
  `password` varchar(32) NOT NULL COMMENT '司机密码',
  `head_path` varchar(100) NOT NULL DEFAULT '0' COMMENT '头像保存路径',
  `join_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '加入的时间',
  `delete_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据删除时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '假删除的状态，1表示正常，0表示假删除',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建记录时插入时间',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改记录时插入当前时间',
  `session_id` varchar(26) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `N_Q` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_driver
-- ----------------------------

-- ----------------------------
-- Table structure for t_driver_order
-- ----------------------------
DROP TABLE IF EXISTS `t_driver_order`;
CREATE TABLE `t_driver_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `driver_id` int(11) NOT NULL COMMENT '外键司机id',
  `order_id` int(11) NOT NULL COMMENT '外键订单id唯一',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建记录时插入时间',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改记录时插入当前时间',
  PRIMARY KEY (`id`),
  KEY `DO_ID` (`driver_id`),
  KEY `DD_ID` (`order_id`),
  CONSTRAINT `DD_ID` FOREIGN KEY (`order_id`) REFERENCES `t_order` (`id`),
  CONSTRAINT `DO_ID` FOREIGN KEY (`driver_id`) REFERENCES `t_driver` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_driver_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_driver_vehicle
-- ----------------------------
DROP TABLE IF EXISTS `t_driver_vehicle`;
CREATE TABLE `t_driver_vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `driver_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `dv_ID` (`driver_id`),
  KEY `dg_ID` (`goods_id`),
  CONSTRAINT `dg_ID` FOREIGN KEY (`goods_id`) REFERENCES `t_goods` (`id`),
  CONSTRAINT `dv_ID` FOREIGN KEY (`driver_id`) REFERENCES `t_driver` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_driver_vehicle
-- ----------------------------

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `quantity` double(15,6) NOT NULL,
  `real_quantity` double(15,6) NOT NULL,
  `delete_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Num_uq` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES ('1', 'A101', '石油', '1.100000', '0.990000', '0000-00-00 00:00:00', '2018-04-17 16:28:12', '0000-00-00 00:00:00', '1');
INSERT INTO `t_goods` VALUES ('2', 'A102', '煤', '2.200000', '2.178450', '0000-00-00 00:00:00', '2018-04-17 16:31:10', '0000-00-00 00:00:00', '1');

-- ----------------------------
-- Table structure for t_group
-- ----------------------------
DROP TABLE IF EXISTS `t_group`;
CREATE TABLE `t_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_group
-- ----------------------------

-- ----------------------------
-- Table structure for t_group_driver
-- ----------------------------
DROP TABLE IF EXISTS `t_group_driver`;
CREATE TABLE `t_group_driver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `GPD_ID` (`group_id`),
  KEY `GPDD_ID` (`driver_id`),
  CONSTRAINT `GPDD_ID` FOREIGN KEY (`driver_id`) REFERENCES `t_driver` (`id`),
  CONSTRAINT `GPD_ID` FOREIGN KEY (`group_id`) REFERENCES `t_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_group_driver
-- ----------------------------

-- ----------------------------
-- Table structure for t_manager
-- ----------------------------
DROP TABLE IF EXISTS `t_manager`;
CREATE TABLE `t_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `username` varchar(5) NOT NULL COMMENT '管理员账号',
  `password` varchar(32) NOT NULL COMMENT '管理员密码',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改记录时插入当前时间',
  `session_id` varchar(26) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `User_uq` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_manager
-- ----------------------------
INSERT INTO `t_manager` VALUES ('1', 'admin', '202cb962ac59075b964b07152d234b70', '0000-00-00 00:00:00', '0');
INSERT INTO `t_manager` VALUES ('2', '123', '250cf8b51c773f3f8dc8b4be867a9a02', '0000-00-00 00:00:00', '0');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(20) NOT NULL,
  `udid` varchar(20) NOT NULL,
  `create_time` datetime DEFAULT '0000-00-00 00:00:00',
  `start_time` datetime DEFAULT '0000-00-00 00:00:00',
  `out_number` varchar(10) DEFAULT NULL,
  `out_destination` varchar(20) DEFAULT NULL,
  `mission_status` tinyint(4) NOT NULL DEFAULT '0',
  `order_driver_number` varchar(20) DEFAULT NULL,
  `pick_up_order` varchar(20) DEFAULT NULL,
  `goods_name` varchar(20) DEFAULT NULL,
  `contract_number` varchar(20) DEFAULT NULL,
  `out_of_stock_message` varchar(20) DEFAULT NULL,
  `pick_up_quantity` int(11) DEFAULT NULL,
  `pick_up_time` datetime DEFAULT '0000-00-00 00:00:00',
  `closing_unit` varchar(10) DEFAULT NULL,
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `delete_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `NumUd_uq` (`number`,`udid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('4', '20180417055352254083', '', '2018-04-17 05:54:01', '2018-04-17 17:53:00', '12', '水电费4', '2', null, null, '', null, null, null, '0000-00-00 00:00:00', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('7', '20180417060041974813', '', '2018-04-17 06:00:50', '2018-04-17 18:00:00', '4564', '水', '0', null, null, '煤', null, null, null, '0000-00-00 00:00:00', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('10', '20180417070938662445', '', '2018-04-17 07:09:47', '2018-04-17 19:09:00', '', '水电费', '0', null, null, '石油', null, null, null, '0000-00-00 00:00:00', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('12', '20180417071023576586', '', '2018-04-17 07:10:30', '2018-04-17 19:10:00', '', '电费1', '2', null, null, '石油', null, null, null, '0000-00-00 00:00:00', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('13', '20180417071040449255', '', '2018-04-17 07:10:49', '2018-04-17 19:10:00', '', '水费1', '0', null, null, '石油', null, null, null, '0000-00-00 00:00:00', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('14', '20180417074228369741', '', '2018-04-17 07:42:54', '2018-04-17 19:42:00', '', '是的', '0', null, null, '石油', null, null, null, '0000-00-00 00:00:00', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('15', '20180417075330120352', '', '2018-04-17 07:53:30', '2018-04-17 19:53:00', '', '我', '1', null, null, '煤', null, null, null, '0000-00-00 00:00:00', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('16', '20180417075656655358', '', '2018-04-17 07:56:56', '0000-00-00 00:00:00', '1564', '他1', '0', null, null, '煤', null, null, null, '0000-00-00 00:00:00', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('17', '20180417075849283471', '', '2018-04-17 07:58:49', '2018-04-17 19:58:00', '9787', '水电是的费的', '2', null, null, '煤', null, null, null, '0000-00-00 00:00:00', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('18', '20180418093940779284', '20180418093940737344', '2018-04-18 09:39:40', '2018-04-18 21:39:00', '12', '去', '0', null, null, '石油', null, null, null, '0000-00-00 00:00:00', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('19', '20180418094042201788', '20180418094042143368', '2018-04-18 09:40:42', '2018-04-18 21:40:00', '121', '广告', '0', null, null, '煤', null, null, null, '0000-00-00 00:00:00', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');

-- ----------------------------
-- Table structure for t_privilege
-- ----------------------------
DROP TABLE IF EXISTS `t_privilege`;
CREATE TABLE `t_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_privilege
-- ----------------------------

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_role_group
-- ----------------------------
DROP TABLE IF EXISTS `t_role_group`;
CREATE TABLE `t_role_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `RGR` (`group_id`),
  KEY `RGG` (`role_id`),
  CONSTRAINT `RGG` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`),
  CONSTRAINT `RGR` FOREIGN KEY (`group_id`) REFERENCES `t_goods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_group
-- ----------------------------

-- ----------------------------
-- Table structure for t_role_privilege
-- ----------------------------
DROP TABLE IF EXISTS `t_role_privilege`;
CREATE TABLE `t_role_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `privilege_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `RPR` (`role_id`),
  KEY `RPP` (`privilege_id`),
  CONSTRAINT `RPP` FOREIGN KEY (`privilege_id`) REFERENCES `t_privilege` (`id`),
  CONSTRAINT `RPR` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_privilege
-- ----------------------------

-- ----------------------------
-- Table structure for t_vehicle
-- ----------------------------
DROP TABLE IF EXISTS `t_vehicle`;
CREATE TABLE `t_vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license_plate` varchar(10) NOT NULL,
  `vin` varchar(17) NOT NULL,
  `delete_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `LicVin_uq` (`license_plate`,`vin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_vehicle
-- ----------------------------

-- ----------------------------
-- Table structure for t_vehicle_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_vehicle_goods`;
CREATE TABLE `t_vehicle_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `VG_ID` (`vehicle_id`),
  KEY `GG_ID` (`goods_id`),
  CONSTRAINT `GG_ID` FOREIGN KEY (`goods_id`) REFERENCES `t_goods` (`id`),
  CONSTRAINT `VG_ID` FOREIGN KEY (`vehicle_id`) REFERENCES `t_vehicle` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_vehicle_goods
-- ----------------------------
