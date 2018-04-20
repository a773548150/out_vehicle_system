/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : db_out_vehicle_system

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-04-20 23:37:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_driver
-- ----------------------------
DROP TABLE IF EXISTS `t_driver`;
CREATE TABLE `t_driver` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '默认自增id',
  `number` varchar(20) NOT NULL DEFAULT '0' COMMENT '司机编号',
  `name` varchar(20) NOT NULL COMMENT '司机姓名',
  `mobile_number` varchar(11) NOT NULL COMMENT '手机号',
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_driver
-- ----------------------------
INSERT INTO `t_driver` VALUES ('1', '20180419075911247106', '林夏聪', '13794578316', '202cb962ac59075b964b07152d234b70', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `t_driver` VALUES ('2', '20180419075938104971', '林聪', '13794578311', '202cb962ac59075b964b07152d234b70', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');

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
-- Table structure for t_manager
-- ----------------------------
DROP TABLE IF EXISTS `t_manager`;
CREATE TABLE `t_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `username` varchar(20) NOT NULL COMMENT '管理员账号',
  `password` varchar(32) NOT NULL COMMENT '管理员密码',
  `role_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改记录时插入当前时间',
  `session_id` varchar(26) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `User_uq` (`username`),
  CONSTRAINT `df_DF` FOREIGN KEY (`id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_manager
-- ----------------------------
INSERT INTO `t_manager` VALUES ('1', 'admin', '202cb962ac59075b964b07152d234b70', '7', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `t_manager` VALUES ('2', '123', '250cf8b51c773f3f8dc8b4be867a9a02', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `t_manager` VALUES ('3', 'xiaoming', '202cb962ac59075b964b07152d234b70', '2', '2018-04-20 10:28:19', '0000-00-00 00:00:00', '0');

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
  `out_destination` varchar(20) DEFAULT NULL,
  `mission_status` tinyint(4) NOT NULL DEFAULT '0',
  `pick_up_order` varchar(20) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `contract_number` varchar(20) DEFAULT NULL,
  `out_of_stock_message` varchar(20) DEFAULT NULL,
  `goods_quantity` int(11) DEFAULT NULL,
  `pick_up_quantity` int(11) DEFAULT NULL,
  `pick_up_time` datetime DEFAULT '0000-00-00 00:00:00',
  `closing_unit` varchar(10) DEFAULT NULL,
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `delete_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `NumUd_uq` (`number`,`udid`),
  KEY `OG_ID` (`goods_id`),
  KEY `OR_ID` (`driver_id`),
  KEY `OV_ID` (`vehicle_id`),
  CONSTRAINT `OG_ID` FOREIGN KEY (`goods_id`) REFERENCES `t_goods` (`id`),
  CONSTRAINT `OR_ID` FOREIGN KEY (`driver_id`) REFERENCES `t_driver` (`id`),
  CONSTRAINT `OV_ID` FOREIGN KEY (`vehicle_id`) REFERENCES `t_vehicle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1', '20180417053212585842', '', '0000-00-00 00:00:00', '2018-04-17 17:32:00', '地方上的12', '0', null, '1', null, null, null, null, null, null, '0000-00-00 00:00:00', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('4', '20180417055352254083', '', '2018-04-17 05:54:01', '2018-04-17 17:53:00', '水电费12', '2', null, '1', '2', '1', null, null, null, null, '0000-00-00 00:00:00', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('5', '20180417055653975555', '', '2018-04-17 05:57:02', '2018-04-17 17:56:00', '12', '1', null, '1', '3', '2', null, null, null, null, '0000-00-00 00:00:00', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('7', '20180417060041974813', '', '2018-04-17 06:00:50', '2018-04-17 18:00:00', '的12', '0', null, '2', null, null, null, null, null, null, '0000-00-00 00:00:00', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('10', '20180417070938662445', '', '2018-04-17 07:09:47', '2018-04-17 19:09:00', '地方125', '0', null, '1', null, null, null, null, null, null, '0000-00-00 00:00:00', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('12', '20180417071023576586', '', '2018-04-17 07:10:30', '2018-04-17 19:10:00', '水电费12', '2', null, '1', '1', '1', null, null, null, null, '0000-00-00 00:00:00', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('13', '20180417071040449255', '', '2018-04-17 07:10:49', '2018-04-17 19:10:00', '水电费23', '0', null, '1', null, null, null, null, null, null, '0000-00-00 00:00:00', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('14', '20180417074228369741', '', '2018-04-17 07:42:54', '2018-04-17 19:42:00', '1654', '0', null, '2', null, null, null, null, null, null, '0000-00-00 00:00:00', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('15', '20180417075330120352', '', '2018-04-17 07:53:30', '2018-04-17 19:53:00', 'dsf513', '1', null, '1', '2', '2', null, null, null, null, '0000-00-00 00:00:00', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('16', '20180417075656655358', '', '2018-04-17 07:56:56', '0000-00-00 00:00:00', 'dsf23', '0', null, '1', null, null, null, null, null, null, '0000-00-00 00:00:00', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('17', '20180417075849283471', '', '2018-04-17 07:58:49', '2018-04-17 19:58:00', 'fds10531', '2', null, '1', '3', '1', null, null, null, null, '0000-00-00 00:00:00', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('18', '20180419065930752203', '20180419065930626107', '2018-04-19 06:59:30', '2018-04-19 18:59:00', '是滴是滴12', '0', null, '1', null, null, null, null, null, null, '0000-00-00 00:00:00', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('19', '20180419070110705126', '20180419070110472903', '2018-04-19 07:01:10', '2018-04-19 19:01:00', '是滴是12', '0', null, '1', null, null, null, null, null, null, '0000-00-00 00:00:00', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('20', '20180420083726910626', '20180420083726681698', '2018-04-20 08:37:26', '2018-04-20 20:37:00', '惠州学院', '0', null, '1', null, null, null, null, '100', null, '0000-00-00 00:00:00', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `manage_order` tinyint(4) NOT NULL DEFAULT '1',
  `manage_driver` tinyint(4) NOT NULL DEFAULT '1',
  `manage_vehicle` tinyint(4) NOT NULL DEFAULT '1',
  `manage_role` tinyint(4) NOT NULL DEFAULT '1',
  `manage_diary` tinyint(4) NOT NULL DEFAULT '1',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `NAME_Q` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '门卫', '0', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `t_role` VALUES ('2', '门卫2', '0', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `t_role` VALUES ('3', '门卫3', '1', '1', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `t_role` VALUES ('4', '门卫4', '1', '0', '0', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `t_role` VALUES ('5', '门卫5', '0', '1', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `t_role` VALUES ('6', '门卫6', '0', '0', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `t_role` VALUES ('7', '门外7', '1', '1', '1', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for t_vehicle
-- ----------------------------
DROP TABLE IF EXISTS `t_vehicle`;
CREATE TABLE `t_vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license_plate` varchar(7) NOT NULL,
  `vin` varchar(17) NOT NULL,
  `delete_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `LicVin_uq` (`license_plate`,`vin`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_vehicle
-- ----------------------------
INSERT INTO `t_vehicle` VALUES ('1', '粤A13145', 'ALSDK265SFSD15456', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_vehicle` VALUES ('2', '粤A23146', 'DFLS4K26152345456', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_vehicle` VALUES ('3', '粤A83166', 'YERDK265SFSD15456', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
