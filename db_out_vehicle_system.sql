/*
Navicat MySQL Data Transfer

Source Server         : hiaocong
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : db_out_vehicle_system

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-04-25 23:18:17
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `N_Q` (`number`),
  UNIQUE KEY `MO_Q` (`mobile_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_driver
-- ----------------------------
INSERT INTO `t_driver` VALUES ('1', '20180419075911247106', '林夏聪', '13794578316', '202cb962ac59075b964b07152d234b70', 'Application/Common/img/13794578316.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `t_driver` VALUES ('2', '20180419075938104971', '林聪', '13794578311', 'e10adc3949ba59abbe56e057f20f883e', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '默认自增id',
  `number` varchar(20) NOT NULL COMMENT '商品编码',
  `name` varchar(20) NOT NULL COMMENT '商品名',
  `quantity` double(15,6) NOT NULL COMMENT '商品数量',
  `real_quantity` double(15,6) NOT NULL DEFAULT '0.000000' COMMENT '商品实际数量',
  `delete_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据删除时间',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建记录时插入时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '假删除的状态，1表示正常，0表示假删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Num_uq` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES ('1', 'A101', '石油', '1.100000', '0.880000', '0000-00-00 00:00:00', '2018-04-17 16:28:12', '0000-00-00 00:00:00', '1');
INSERT INTO `t_goods` VALUES ('2', 'A102', '煤', '2.200000', '2.178450', '0000-00-00 00:00:00', '2018-04-17 16:31:10', '0000-00-00 00:00:00', '1');
INSERT INTO `t_goods` VALUES ('3', '20180425104651129168', '商品1', '99.120000', '0.000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_goods` VALUES ('4', '20180425104907991128', '商品1', '99.120000', '0.000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '默认自增id',
  `manager_id` int(11) NOT NULL COMMENT '操作用户id',
  `type` tinyint(4) NOT NULL COMMENT '1表示插入 2表示删除 3表示修改',
  `table_id` tinyint(4) NOT NULL COMMENT '修改表对应的id',
  `table_name` varchar(14) NOT NULL COMMENT '修改的表名',
  `alert_time` datetime NOT NULL COMMENT '修改时间',
  `key` varchar(20) NOT NULL DEFAULT 'empty' COMMENT '修改的字段，默认为“empty"',
  `value` varchar(30) NOT NULL DEFAULT 'empty' COMMENT '修改的旧值，默认为“empty"',
  `current_value` varchar(30) NOT NULL DEFAULT 'empty' COMMENT '修改的新值，默认为“empty"',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES ('1', '1', '1', '26', 'order', '2018-04-25 08:19:32', 'empty', 'empty', 'empty');
INSERT INTO `t_log` VALUES ('2', '1', '2', '26', 'order', '2018-04-25 08:32:57', 'out_destination', '惠州', '惠州2');
INSERT INTO `t_log` VALUES ('3', '1', '3', '26', 'order', '2018-04-27 08:37:00', 'empty', 'empty', 'empty');
INSERT INTO `t_log` VALUES ('4', '1', '3', '25', 'order', '2018-04-28 08:37:09', 'empty', 'empty', 'empty');
INSERT INTO `t_log` VALUES ('5', '1', '1', '27', 'order', '2018-04-25 10:49:07', 'empty', 'empty', 'empty');

-- ----------------------------
-- Table structure for t_manager
-- ----------------------------
DROP TABLE IF EXISTS `t_manager`;
CREATE TABLE `t_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `username` varchar(20) NOT NULL COMMENT '管理员账号',
  `password` varchar(32) NOT NULL COMMENT '管理员密码',
  `role_id` int(11) DEFAULT NULL COMMENT '外键角色的id',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建记录时插入时间',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改记录时插入当前时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `User_uq` (`username`),
  KEY `RM_FID` (`role_id`) USING BTREE,
  CONSTRAINT `RM_FID` FOREIGN KEY (`id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_manager
-- ----------------------------
INSERT INTO `t_manager` VALUES ('1', 'admin', '202cb962ac59075b964b07152d234b70', '7', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `t_manager` VALUES ('2', '123', '250cf8b51c773f3f8dc8b4be867a9a02', '7', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `t_manager` VALUES ('3', 'xiaoming', '202cb962ac59075b964b07152d234b70', '4', '2018-04-20 10:28:19', '2018-04-21 09:11:10');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '默认自增id',
  `number` varchar(20) NOT NULL COMMENT '订单编号',
  `udid` varchar(20) NOT NULL COMMENT '订单号',
  `start_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '出车出发时间',
  `out_destination` varchar(20) DEFAULT NULL COMMENT '出车目的地',
  `mission_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `pick_up_order` varchar(20) DEFAULT NULL COMMENT '提货单号',
  `goods_id` int(11) DEFAULT NULL COMMENT '外键商品id',
  `vehicle_id` int(11) DEFAULT NULL COMMENT '外键车辆id',
  `driver_id` int(11) DEFAULT NULL COMMENT '外键司机id',
  `contract_number` varchar(20) DEFAULT NULL COMMENT '合同号',
  `out_of_stock_message` varchar(20) DEFAULT NULL COMMENT '缺货信息',
  `goods_quantity` float(10,4) DEFAULT NULL COMMENT '商品数量',
  `pick_up_quantity` float(10,4) DEFAULT NULL COMMENT '提货数量',
  `pick_up_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '提货时间',
  `closing_unit` varchar(10) DEFAULT NULL COMMENT '结算单位',
  `create_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '创建记录时插入时间',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改记录时插入当前时间',
  `delete_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据删除时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '假删除的状态，1表示正常，0表示假删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `NumUd_uq` (`number`,`udid`),
  KEY `OG_ID` (`goods_id`),
  KEY `OR_ID` (`driver_id`),
  KEY `OV_ID` (`vehicle_id`),
  CONSTRAINT `OG_ID` FOREIGN KEY (`goods_id`) REFERENCES `t_goods` (`id`),
  CONSTRAINT `OR_ID` FOREIGN KEY (`driver_id`) REFERENCES `t_driver` (`id`),
  CONSTRAINT `OV_ID` FOREIGN KEY (`vehicle_id`) REFERENCES `t_vehicle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1', '20180417053212585842', '', '2018-04-17 17:32:00', '地方上的12', '0', null, '1', null, null, null, null, '151.0000', null, '0000-00-00 00:00:00', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `t_order` VALUES ('4', '20180417055352254083', '', '2018-03-17 17:53:00', '水电费12', '2', null, '1', '2', '1', null, null, '78.0000', null, '0000-00-00 00:00:00', null, '2018-04-17 05:54:01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('5', '20180417055653975555', '', '2018-04-17 17:56:00', '12', '1', null, '1', '3', '2', null, null, '95.0000', null, '0000-00-00 00:00:00', null, '2018-04-17 05:57:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('7', '20180417060041974813', '', '2018-04-17 18:00:00', '的12', '0', null, '2', null, null, null, null, '58.0000', null, '0000-00-00 00:00:00', null, '2018-04-17 06:00:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('10', '20180417070938662445', '', '2018-04-17 19:09:00', '地方125', '0', null, '1', null, null, null, null, '13.0000', null, '0000-00-00 00:00:00', null, '2018-04-17 07:09:47', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('12', '20180417071023576586', '', '2018-04-17 19:10:00', '水电费12', '2', null, '1', '1', '1', null, null, '12.0000', null, '0000-00-00 00:00:00', null, '2018-04-17 07:10:30', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('13', '20180417071040449255', '', '2018-04-17 19:10:00', '水电费23', '0', null, '1', null, null, null, null, '11.0000', null, '0000-00-00 00:00:00', null, '2018-04-17 07:10:49', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('14', '20180417074228369741', '', '2018-04-17 19:42:00', '1654', '0', null, '2', null, null, null, null, '50.0000', null, '0000-00-00 00:00:00', null, '2018-04-17 07:42:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('15', '20180417075330120352', '', '2018-04-17 19:53:00', 'dsf513', '1', null, '1', '2', '2', null, null, '30.0000', null, '0000-00-00 00:00:00', null, '2018-04-17 07:53:30', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('16', '20180417075656655358', '', '0000-00-00 00:00:00', 'dsf23', '0', null, '1', null, null, null, null, '20.0000', null, '0000-00-00 00:00:00', null, '2018-04-17 07:56:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('17', '20180417075849283471', '', '2018-04-17 19:58:00', 'fds10531', '2', null, '1', '3', '1', null, null, '10.0000', null, '0000-00-00 00:00:00', null, '2018-04-17 07:58:49', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('18', '20180419065930752203', '20180419065930626107', '2018-04-19 18:59:00', '是滴是滴12', '0', null, '1', null, null, null, null, '5.0000', null, '0000-00-00 00:00:00', null, '2018-04-19 06:59:30', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('19', '20180419070110705126', '20180419070110472903', '2018-04-19 19:01:00', '是滴是12', '0', null, '1', null, null, null, null, '123.2655', null, '0000-00-00 00:00:00', null, '2018-04-19 07:01:10', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('20', '20180420083726910626', '20180420083726681698', '2018-06-20 20:37:00', '惠州学院', '1', '16345', '1', '1', '1', '165498541s', '33收到', '100.0000', '100.0000', '2018-04-23 00:00:00', '公司', '2018-04-20 08:37:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('21', '20180425081516530526', '20180425081516524291', '2018-04-25 20:15:00', '惠经', '0', null, '2', null, null, null, null, '4.0000', null, '0000-00-00 00:00:00', null, '2018-04-25 08:15:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('22', '20180425081628449392', '20180425081628596307', '2018-04-25 20:15:00', '惠经', '0', null, '2', null, null, null, null, '4.0000', null, '0000-00-00 00:00:00', null, '2018-04-25 08:16:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('23', '20180425081706902194', '20180425081706592297', '2018-04-25 20:16:00', '惠州', '0', null, '1', null, null, null, null, '3.3300', null, '0000-00-00 00:00:00', null, '2018-04-25 08:17:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('24', '20180425081835998544', '20180425081835913208', '2018-04-25 20:16:00', '惠州', '0', null, '1', null, null, null, null, '2.5500', null, '0000-00-00 00:00:00', null, '2018-04-25 08:18:35', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_order` VALUES ('25', '20180425081858316238', '20180425081858257489', '2018-04-25 20:16:00', '惠州', '0', null, '1', null, null, null, null, '2.5500', null, '0000-00-00 00:00:00', null, '2018-04-25 08:18:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `t_order` VALUES ('26', '20180425081932645993', '20180425081932341369', '2018-04-25 20:16:00', '惠州2', '0', null, '1', null, null, null, null, '2.5500', null, '0000-00-00 00:00:00', null, '2018-04-25 08:19:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
INSERT INTO `t_order` VALUES ('27', '20180425104907159078', '20180425104907367736', '2018-04-25 22:46:00', '测试1', '0', null, '4', null, null, null, null, '99.1200', null, '0000-00-00 00:00:00', null, '2018-04-25 10:49:07', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '默认自增id',
  `name` varchar(20) NOT NULL COMMENT '角色名',
  `manage_order` tinyint(4) NOT NULL DEFAULT '1' COMMENT '管理订单模块',
  `manage_driver` tinyint(4) NOT NULL DEFAULT '1' COMMENT '管理司机模块',
  `manage_vehicle` tinyint(4) NOT NULL DEFAULT '1' COMMENT '管理车辆模块',
  `manage_role` tinyint(4) NOT NULL DEFAULT '1' COMMENT '管理角色模块',
  `manage_log` tinyint(4) NOT NULL DEFAULT '1' COMMENT '管理日记模块',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '假删除的状态，1表示正常，0表示假删除',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改记录时插入当前时间',
  `create_time` datetime NOT NULL COMMENT '创建记录时插入时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `NAME_Q` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '门卫', '0', '0', '1', '0', '0', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `t_role` VALUES ('2', '门卫2', '0', '0', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `t_role` VALUES ('3', '门卫3', '1', '1', '1', '0', '0', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `t_role` VALUES ('4', '门卫4', '1', '0', '0', '1', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `t_role` VALUES ('5', '门卫5', '0', '1', '1', '0', '0', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `t_role` VALUES ('6', '门卫6', '0', '0', '1', '1', '0', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `t_role` VALUES ('7', '门外7', '1', '1', '1', '1', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for t_vehicle
-- ----------------------------
DROP TABLE IF EXISTS `t_vehicle`;
CREATE TABLE `t_vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '默认自增id',
  `license_plate` varchar(7) NOT NULL COMMENT '车牌号',
  `vin` varchar(17) NOT NULL COMMENT '车架号',
  `delete_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据删除时间',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建记录时插入时间',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改记录时插入当前时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '假删除的状态，1表示正常，0表示假删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `LicVin_uq` (`license_plate`,`vin`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_vehicle
-- ----------------------------
INSERT INTO `t_vehicle` VALUES ('1', '粤A13145', 'ALSDK265SFSD15456', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_vehicle` VALUES ('2', '粤A23146', 'DFLS4K26152345456', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `t_vehicle` VALUES ('3', '粤A83166', 'YERDK265SFSD15456', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
