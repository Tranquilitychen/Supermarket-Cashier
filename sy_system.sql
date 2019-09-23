/*
Navicat MySQL Data Transfer

Source Server         : kalic
Source Server Version : 80012
Source Host           : 127.0.0.1:3306
Source Database       : sy_system

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2019-09-23 19:22:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for barcode
-- ----------------------------
DROP TABLE IF EXISTS `barcode`;
CREATE TABLE `barcode` (
  `barcode_id` char(22) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '条码号',
  `ev_g_no` char(18) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '参加活动商品流水号',
  `barcode_state` int(11) DEFAULT NULL COMMENT '条形码状态0未使用1已使用',
  PRIMARY KEY (`barcode_id`) USING BTREE,
  KEY `FK_Relationship_11` (`ev_g_no`) USING BTREE,
  CONSTRAINT `FK_Relationship_11` FOREIGN KEY (`ev_g_no`) REFERENCES `event_goods_record` (`ev_g_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='活动条形码记录';

-- ----------------------------
-- Records of barcode
-- ----------------------------
INSERT INTO `barcode` VALUES ('ZP201904230100010001', 'ZP20190423010001', '0');
INSERT INTO `barcode` VALUES ('ZP201904230100010002', 'ZP20190423010001', '0');
INSERT INTO `barcode` VALUES ('ZP201904230100010003', 'ZP20190423010001', '0');
INSERT INTO `barcode` VALUES ('ZP201904230100010004', 'ZP20190423010001', '0');
INSERT INTO `barcode` VALUES ('ZP201904230100010005', 'ZP20190423010001', '0');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `e_id` char(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '员工编号',
  `e_idCard` char(18) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '身份证编号',
  `e_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `e_rfid` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '员工卡号',
  `e_password` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `e_sex` char(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `e_birthday` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '出生日期',
  `e_jointime` timestamp NOT NULL COMMENT '入职日期',
  `e_phone` char(11) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '联系电话',
  `e_state` int(11) DEFAULT NULL COMMENT '在职状态（0审核中，1正常，-1已注销）',
  `e_icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '头像地址',
  `e_level` int(11) DEFAULT NULL COMMENT '等级',
  PRIMARY KEY (`e_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='employee';

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('GL0001', '500021198809099999', 'kalic', 'kalic', '4297F44B1397399D7A93955235245B24', '男', '2019-09-23 10:16:28', '2019-03-26 12:00:00', '13245678900', '1', '2019/2/14/20ab7bdda46a4bda9db36e263d006550.jpg', '99');
INSERT INTO `employee` VALUES ('GL0002', '530324199708191554', 'hefeifei', '000001', '4297F44B1397399D7A93955235245B24', '女', '2019-09-01 00:00:00', '2019-09-05 00:00:00', '17796418315', '1', '2019/09/05/5a982df3b0d749128249b8e98e061729.jpg', '99');
INSERT INTO `employee` VALUES ('SY0001', '530324199708191554', 'zhangliu1', '000004', '4297F44B1397399D7A93955235245B24', '男', '2019-09-01 00:00:00', '2019-09-08 00:00:00', '17796418315', '1', '2019/09/08/b860746eba5444fba7a4b9713d95ad87.jpg', '1');

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event` (
  `et_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动类型编号',
  `et_typename` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '活动类型名称',
  `et_descript` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '活动介绍',
  `et_state` int(11) DEFAULT NULL COMMENT '活动类型状态',
  PRIMARY KEY (`et_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='event';

-- ----------------------------
-- Records of event
-- ----------------------------
INSERT INTO `event` VALUES ('1', '打折', '各种打折活动', '1');
INSERT INTO `event` VALUES ('2', '赠品', '各种赠品活动，满赠，买一赠一', '1');
INSERT INTO `event` VALUES ('3', '满赠', '满足赠送', '1');

-- ----------------------------
-- Table structure for event_goods_record
-- ----------------------------
DROP TABLE IF EXISTS `event_goods_record`;
CREATE TABLE `event_goods_record` (
  `ev_g_no` char(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '参加活动商品流水号',
  `g_no` char(14) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品编号',
  `ev_no` char(12) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '活动记录编号',
  `ev_g_count` int(11) DEFAULT NULL COMMENT '活动商品数量',
  `ev_g_descript` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `ev_discount` double DEFAULT NULL,
  PRIMARY KEY (`ev_g_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='参加活动商品记录';

-- ----------------------------
-- Records of event_goods_record
-- ----------------------------
INSERT INTO `event_goods_record` VALUES ('ZP20190423010001', '00010002000001', 'ZP2019042301', '5', '赠品', '1');

-- ----------------------------
-- Table structure for event_record
-- ----------------------------
DROP TABLE IF EXISTS `event_record`;
CREATE TABLE `event_record` (
  `ev_no` char(12) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '活动记录编号',
  `et_no` int(11) DEFAULT NULL COMMENT '活动类型编号',
  `e_id` char(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '员工编号',
  `ev_begintime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '活动开始时间',
  `ev_endtime` timestamp NOT NULL COMMENT '活动结束时间',
  `ev_state` int(11) DEFAULT NULL COMMENT '活动状态(0未开启，1进行中，2已结束)',
  `ev_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '具体活动的名字',
  PRIMARY KEY (`ev_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='活动记录';

-- ----------------------------
-- Records of event_record
-- ----------------------------
INSERT INTO `event_record` VALUES ('ZP2019042301', '2', 'GL0001', '2019-04-23 00:00:00', '2019-04-30 09:01:00', '1', '五一');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `g_no` char(14) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品编号',
  `gt_no` char(8) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品类别编号',
  `g_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `g_descript` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品描述',
  `g_barcode` char(13) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '条码编号',
  `g_unit` char(3) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '计量单位',
  `g_price` float DEFAULT NULL COMMENT '当前售价',
  `g_state` int(11) DEFAULT NULL COMMENT '状态',
  `g_count` int(11) DEFAULT '0' COMMENT '货物数量',
  `e_id` char(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '收营员编号',
  `exhibit_time` timestamp NULL DEFAULT NULL COMMENT '上货盘点时间',
  PRIMARY KEY (`g_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='goods';

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('00010002000001', '00010002', '可口可乐', '可口可乐中国', '6954767423579', '瓶', '3.5', '1', '1121', 'SY0001', null);
INSERT INTO `goods` VALUES ('00010002000002', '00010002', '百事可乐', '百事饮料', '6940553360012', '瓶', '4', '1', '0', null, null);
INSERT INTO `goods` VALUES ('00050001000001', '00050001', '精通CSS', '学完就是CSS大神', '9787115226730', '本', '49', '1', '1', 'SY0001', null);
INSERT INTO `goods` VALUES ('00060001000001', '00060001', 'A5笔记本蓝色', '纸质', '6953787337514', '本', '5', '1', '0', null, null);
INSERT INTO `goods` VALUES ('00060001000002', '00060001', 'A5笔记本红色', '纸质', '6953787337491', '本', '6', '1', '0', null, null);
INSERT INTO `goods` VALUES ('00070001000001', '00100001', '测试商品', '测试商品', null, null, null, null, '0', null, null);
INSERT INTO `goods` VALUES ('00070001000002', '00100002', '测试商品2', null, null, null, null, null, '0', null, null);

-- ----------------------------
-- Table structure for goodstype
-- ----------------------------
DROP TABLE IF EXISTS `goodstype`;
CREATE TABLE `goodstype` (
  `gt_no` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品类别编号',
  `gt_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品类别名称',
  `gt_descript` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品类别描述',
  `gt_state` int(11) DEFAULT NULL COMMENT '商品类别状态',
  `gt_remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品类别备注',
  `gt_pno` char(8) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '父类别',
  `gt_level` int(11) DEFAULT NULL COMMENT '商品类别等级',
  `gt_isparent` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`gt_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='goodsType';

-- ----------------------------
-- Records of goodstype
-- ----------------------------
INSERT INTO `goodstype` VALUES ('00010000', '饮料', '包含各类饮用水 碳酸饮料 果汁 奶制品等', '1', '不准卖', '00000000', '1', '1');
INSERT INTO `goodstype` VALUES ('00010001', '奶制品', '各种酸奶、鲜奶、乳制品', '1', null, '00010000', '2', '1');
INSERT INTO `goodstype` VALUES ('00010002', '碳酸饮料', '各类可乐等', '1', '国家重新制定标准禁止售卖', '00010001', '3', '0');
INSERT INTO `goodstype` VALUES ('00010004', '啤酒', '各品牌啤酒包含罐装瓶装', '1', null, '00010000', '2', '0');
INSERT INTO `goodstype` VALUES ('00010005', '特仑苏', '牛奶', '1', 'milk', '00010001', '3', '0');
INSERT INTO `goodstype` VALUES ('00010006', '哈啤', '黑啤', '1', '哈尔滨', '00010000', '2', '0');
INSERT INTO `goodstype` VALUES ('00020000', '日用品', '包含卫生纸、电池等', '1', null, '00000000', '1', '1');
INSERT INTO `goodstype` VALUES ('00020001', '卫生纸', '各品牌卷纸抽纸', '1', null, '00020000', '2', '0');
INSERT INTO `goodstype` VALUES ('00020002', '电池', '各品牌1号 5号 7号 纽扣电池', '1', null, '00020000', '2', '0');
INSERT INTO `goodstype` VALUES ('00020003', '洗衣粉', '各类洗衣粉', '1', '', '00020000', '2', '0');
INSERT INTO `goodstype` VALUES ('00030000', '方便食品1', '方便食品1', '1', '方便食品1', '00000000', '1', '1');
INSERT INTO `goodstype` VALUES ('00030001', '方便食品', '方便1', '1', null, '00030000', '2', '0');
INSERT INTO `goodstype` VALUES ('00040000', '佐料', '各类酱油 豆油 豆瓣酱', '1', '', '00000000', '1', '1');
INSERT INTO `goodstype` VALUES ('00040001', '酱油', '酱油', '1', '酱油', '00040000', '2', '0');
INSERT INTO `goodstype` VALUES ('00050000', '书籍', '书', '1', '书', '00000000', '1', '1');
INSERT INTO `goodstype` VALUES ('00050001', '编程书籍', '编程书', '1', '编程书籍', '00050000', '2', '0');
INSERT INTO `goodstype` VALUES ('00060000', '办公用品', '主要用于办公', '1', '笔记本之类', '00000000', '1', '1');
INSERT INTO `goodstype` VALUES ('00060001', '笔记本', '纸质笔记本', '1', null, '00060000', '2', '0');
INSERT INTO `goodstype` VALUES ('00060002', '笔', '办公用笔', '1', null, '00060000', '2', '0');
INSERT INTO `goodstype` VALUES ('00060003', '本子', '本子', '1', null, '00060000', '2', '0');
INSERT INTO `goodstype` VALUES ('00060004', '墨水', '墨水', '1', null, '00060000', '2', '0');
INSERT INTO `goodstype` VALUES ('00060005', '笔刀', '笔刀', '1', '笔刀', '00060000', '2', '0');
INSERT INTO `goodstype` VALUES ('00070000', '宠物', '松鼠', '1', '备注', '00000000', '1', '1');
INSERT INTO `goodstype` VALUES ('00070001', '猫猫', '猫猫', '1', '猫猫', '00070000', '2', '0');
INSERT INTO `goodstype` VALUES ('00070003', '狗狗', '狗狗', '1', '狗狗', '00070000', '2', '0');
INSERT INTO `goodstype` VALUES ('00070004', '哈巴狗', '哈巴狗', '1', '哈巴狗', '00070003', '3', '0');
INSERT INTO `goodstype` VALUES ('00070005', '龙', '龙', '1', '龙', '00070000', '2', '0');
INSERT INTO `goodstype` VALUES ('00080000', '超级英雄', '蜘蛛侠', '1', '漫威宇宙', '00000000', '1', '1');
INSERT INTO `goodstype` VALUES ('00080001', 'DC英雄', '超人', '1', 'superman', '00080000', '2', '1');
INSERT INTO `goodstype` VALUES ('00080002', '蜘蛛侠', '蜘蛛侠', '1', '蜘蛛侠', '00080000', '2', '0');
INSERT INTO `goodstype` VALUES ('00100001', '测试一级节点', '一级节点', '1', '一级节点', '00000000', '1', '1');
INSERT INTO `goodstype` VALUES ('00100002', '子节点', '子节点', '1', '子节点', '00100001', '2', '1');
INSERT INTO `goodstype` VALUES ('00100003', '第二子节点', '第二子节点', '1', '第二子节点', '00100002', '3', '0');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `o_no` char(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '订单编号',
  `e_id` char(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '员工编号',
  `o_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '订单时间',
  `o_cost` float DEFAULT NULL COMMENT '订单总价',
  `o_descript` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '订单备注',
  PRIMARY KEY (`o_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='订单';

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('SY0000520190910', 'SY0005', '2019-09-10 00:00:00', '520', '买零食');
INSERT INTO `orders` VALUES ('SY000120190423024651', 'SY0001', '2019-04-23 14:46:51', '49', 'null');
INSERT INTO `orders` VALUES ('SY000120190423025151', 'SY0001', '2019-04-23 14:51:51', '10.5', 'null');
INSERT INTO `orders` VALUES ('SY000120190423030636', 'SY0001', '2019-04-23 15:06:36', '7', 'null');
INSERT INTO `orders` VALUES ('SY000120190423033356', 'SY0001', '2019-04-23 15:33:56', '10.5', 'null');
INSERT INTO `orders` VALUES ('SY000120190423033614', 'SY0001', '2019-04-23 15:36:14', '3.5', 'null');
INSERT INTO `orders` VALUES ('SY000120190423034946', 'SY0001', '2019-04-23 15:49:46', '98', 'null');
INSERT INTO `orders` VALUES ('SY000120190423035117', 'SY0001', '2019-04-23 15:51:17', '98', 'null');
INSERT INTO `orders` VALUES ('SY000120190423035214', 'SY0001', '2019-04-23 15:52:14', '147', 'null');
INSERT INTO `orders` VALUES ('SY000120190423040859', 'SY0001', '2019-04-23 16:08:59', '3.5', 'null');
INSERT INTO `orders` VALUES ('SY000120190423062058', 'SY0001', '2019-04-23 18:20:58', '3.5', 'null');
INSERT INTO `orders` VALUES ('SY000120190423062145', 'SY0001', '2019-04-23 18:21:45', '3.5', 'null');
INSERT INTO `orders` VALUES ('SY000120190423062522', 'SY0001', '2019-04-23 18:25:22', '3.5', 'null');
INSERT INTO `orders` VALUES ('SY000120190525111442', 'SY0001', '2019-05-25 11:14:42', '10.5', 'null');
INSERT INTO `orders` VALUES ('SY000120190526022125', 'SY0001', '2019-05-26 14:21:25', '10.5', 'null');
INSERT INTO `orders` VALUES ('SY000320100', 'SY0003', '2019-09-15 00:00:00', '47777', 'sdlkddd');
INSERT INTO `orders` VALUES ('SY000720190910', 'SY0007', '2019-09-09 00:00:00', '34588', '买电脑');
INSERT INTO `orders` VALUES ('SY000820192', 'SY0008', '2019-09-02 00:00:00', '1234', 'ddddddd');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `od_no` char(22) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '详情编号',
  `o_no` char(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '订单编号',
  `g_no` char(14) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品编号',
  `g_num` int(11) DEFAULT NULL COMMENT '商品数量',
  `g_price` float DEFAULT NULL COMMENT '商品原价',
  `g_discount` float DEFAULT NULL COMMENT '商品折扣价',
  `ev_g_no` char(18) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '参加活动商品流水号',
  PRIMARY KEY (`od_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='订单详情';

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES ('SY00012019042302465101', 'SY000120190423024651', '00050001000001', '1', '49', '1', 'null');
INSERT INTO `order_detail` VALUES ('SY00012019042302515101', 'SY000120190423025151', '00010002000001', '3', '3.5', '1', 'null');
INSERT INTO `order_detail` VALUES ('SY00012019042303063601', 'SY000120190423030636', '00010002000001', '1', '3.5', '1', 'null');
INSERT INTO `order_detail` VALUES ('SY00012019042303063602', 'SY000120190423030636', '00010002000001', '1', '3.5', '1', 'null');
INSERT INTO `order_detail` VALUES ('SY00012019042303335601', 'SY000120190423033356', '00010002000001', '3', '3.5', '1', 'null');
INSERT INTO `order_detail` VALUES ('SY00012019042303361401', 'SY000120190423033614', '00010002000001', '1', '3.5', '1', 'null');
INSERT INTO `order_detail` VALUES ('SY00012019042303464401', 'SY000120190423034644', '00050001000001', '1', '49', '1', 'null');
INSERT INTO `order_detail` VALUES ('SY00012019042303494601', 'SY000120190423034946', '00050001000001', '2', '49', '1', 'null');
INSERT INTO `order_detail` VALUES ('SY00012019042303511701', 'SY000120190423035117', '00050001000001', '2', '49', '1', 'null');
INSERT INTO `order_detail` VALUES ('SY00012019042303521401', 'SY000120190423035214', '00050001000001', '3', '49', '1', 'null');
INSERT INTO `order_detail` VALUES ('SY00012019042304085901', 'SY000120190423040859', '00010002000001', '1', '3.5', '1', 'null');
INSERT INTO `order_detail` VALUES ('SY00012019042306205801', 'SY000120190423062058', '00010002000001', '1', '3.5', '1', 'null');
INSERT INTO `order_detail` VALUES ('SY00012019042306214501', 'SY000120190423062145', '00010002000001', '1', '3.5', '1', 'null');
INSERT INTO `order_detail` VALUES ('SY00012019042306252201', 'SY000120190423062522', '00010002000001', '1', '3.5', '1', 'null');
INSERT INTO `order_detail` VALUES ('SY00012019052511144201', 'SY000120190525111442', '00010002000001', '3', '3.5', '1', 'null');
INSERT INTO `order_detail` VALUES ('SY00012019052602212501', 'SY000120190526022125', '00010002000001', '3', '3.5', '1', 'null');

-- ----------------------------
-- Table structure for procurment_record
-- ----------------------------
DROP TABLE IF EXISTS `procurment_record`;
CREATE TABLE `procurment_record` (
  `eg_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '上货编号',
  `g_no` char(14) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品编号',
  `e_id` char(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '员工编号',
  `exhibit_no` int(11) DEFAULT NULL COMMENT '上货数量',
  `exhibit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上货时间',
  PRIMARY KEY (`g_no`,`e_id`,`eg_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='上货记录';

-- ----------------------------
-- Records of procurment_record
-- ----------------------------
INSERT INTO `procurment_record` VALUES ('4d7dc9a7ff7d4bf0a05c6d8246e1f875', '00010002000001', 'SY0001', '10', '2019-05-05 13:08:07');
INSERT INTO `procurment_record` VALUES ('572a96d70676407c92d4d1bc1a345255', '00010002000001', 'SY0001', '30', '2019-05-26 14:19:55');
INSERT INTO `procurment_record` VALUES ('591ac64a41224a18b515a4652c17460b', '00010002000001', 'SY0001', '1000', '2019-05-25 11:13:51');
INSERT INTO `procurment_record` VALUES ('e899b06d1a004ce297f36f5af8cdb0b2', '00010002000001', 'SY0001', '100', '2019-04-23 14:51:25');
INSERT INTO `procurment_record` VALUES ('ccf4bfd01993438088904867e515ec97', '00050001000001', 'SY0001', '10', '2019-04-22 20:02:30');
