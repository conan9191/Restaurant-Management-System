/*
Navicat MySQL Data Transfer

Source Server         : pengyiqun
Source Server Version : 50633
Source Host           : localhost:3306
Source Database       : ordersystem

Target Server Type    : MYSQL
Target Server Version : 50633
File Encoding         : 65001

Date: 2018-05-21 23:02:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `detail`
-- ----------------------------
DROP TABLE IF EXISTS `detail`;
CREATE TABLE `detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `operation` int(11) NOT NULL COMMENT '明细操作类型',
  `money` float(11,2) NOT NULL COMMENT '交易变化额',
  `uid` int(11) DEFAULT NULL COMMENT '用户编号',
  `seat_order_id` int(11) DEFAULT NULL,
  `item_order_id` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL COMMENT '明细时间',
  PRIMARY KEY (`id`),
  KEY `detail_fk1` (`seat_order_id`),
  KEY `detail_fk2` (`item_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100048 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of detail
-- ----------------------------
INSERT INTO `detail` VALUES ('100012', '2', '12.00', '1', null, '28', '2018-05-02 00:00:00');
INSERT INTO `detail` VALUES ('100013', '1', '10.00', '10', '209', null, '2018-05-02 16:17:02');
INSERT INTO `detail` VALUES ('100014', '2', '12.00', '10', null, '32', '2018-05-02 00:00:00');
INSERT INTO `detail` VALUES ('100015', '1', '20.00', '1', '210', null, '2018-05-02 22:00:20');
INSERT INTO `detail` VALUES ('100016', '2', '32.00', '12', null, '61', '2018-05-03 00:00:00');
INSERT INTO `detail` VALUES ('100017', '1', '40.00', '12', '212', null, '2018-05-03 12:35:49');
INSERT INTO `detail` VALUES ('100018', '1', '200.00', '1', '219', null, '2018-05-03 15:39:14');
INSERT INTO `detail` VALUES ('100019', '1', '100.00', '1', '220', null, '2018-05-03 16:12:39');
INSERT INTO `detail` VALUES ('100020', '1', '70.00', '12', '223', null, '2018-05-03 16:16:41');
INSERT INTO `detail` VALUES ('100021', '2', '12.00', '12', null, '75', '2018-05-07 00:00:00');
INSERT INTO `detail` VALUES ('100022', '3', '500.00', null, null, null, '2018-05-13 15:13:45');
INSERT INTO `detail` VALUES ('100023', '3', '1000.00', null, null, null, '2018-05-13 15:13:45');
INSERT INTO `detail` VALUES ('100024', '3', '500.00', null, null, null, '2018-05-13 15:13:45');
INSERT INTO `detail` VALUES ('100025', '3', '900.00', null, null, null, '2018-05-13 15:13:45');
INSERT INTO `detail` VALUES ('100026', '3', '250.00', null, null, null, '2018-05-13 15:13:45');
INSERT INTO `detail` VALUES ('100027', '3', '350.00', null, null, null, '2018-05-13 15:13:45');
INSERT INTO `detail` VALUES ('100028', '3', '250.00', null, null, null, '2018-05-13 15:13:45');
INSERT INTO `detail` VALUES ('100029', '3', '550.00', null, null, null, '2018-05-13 15:13:45');
INSERT INTO `detail` VALUES ('100030', '3', '50.00', null, null, null, '2018-05-13 15:13:45');
INSERT INTO `detail` VALUES ('100031', '3', '350.00', null, null, null, '2018-05-13 15:13:45');
INSERT INTO `detail` VALUES ('100032', '3', '980.00', null, null, null, '2018-05-13 15:13:45');
INSERT INTO `detail` VALUES ('100033', '3', '350.00', null, null, null, '2018-05-13 15:13:45');
INSERT INTO `detail` VALUES ('100034', '3', '1000.00', null, null, null, '2018-05-13 15:13:45');
INSERT INTO `detail` VALUES ('100035', '3', '350.00', null, null, null, '2018-05-13 15:13:45');
INSERT INTO `detail` VALUES ('100036', '3', '550.00', null, null, null, '2018-05-13 15:13:45');
INSERT INTO `detail` VALUES ('100037', '3', '250.00', null, null, null, '2018-05-13 15:13:45');
INSERT INTO `detail` VALUES ('100038', '3', '800.00', null, null, null, '2018-05-13 15:13:45');
INSERT INTO `detail` VALUES ('100039', '1', '50.00', '12', '232', null, '2018-05-13 18:11:50');
INSERT INTO `detail` VALUES ('100040', '2', '160.00', '1', null, '81', '2018-05-14 00:00:00');
INSERT INTO `detail` VALUES ('100041', '2', '48.00', '1', null, '82', '2018-05-14 00:00:00');
INSERT INTO `detail` VALUES ('100042', '2', '64.00', '1', null, '83', '2018-05-14 00:00:00');
INSERT INTO `detail` VALUES ('100043', '2', '80.00', '1', null, '87', '2018-05-14 02:16:15');
INSERT INTO `detail` VALUES ('100044', '2', '64.00', '1', null, '88', '2018-05-14 02:19:50');
INSERT INTO `detail` VALUES ('100045', '2', '6.00', '1', null, '89', '2018-05-14 02:58:05');
INSERT INTO `detail` VALUES ('100046', '2', '96.00', '1', null, '92', '2018-05-14 11:14:53');
INSERT INTO `detail` VALUES ('100047', '1', '40.00', '1', '240', null, '2018-05-14 19:22:09');

-- ----------------------------
-- Table structure for `item`
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '菜品名称',
  `discount` int(11) DEFAULT NULL COMMENT '折扣 1-9折',
  `price` float(5,2) NOT NULL COMMENT '价格',
  `vipprice` float(5,2) NOT NULL COMMENT '会员价',
  `cost` float(5,2) NOT NULL COMMENT '成本',
  `sale` int(11) DEFAULT NULL COMMENT '销售数量',
  `filename` varchar(255) DEFAULT NULL COMMENT '图片文件名称',
  `path` varchar(255) DEFAULT NULL COMMENT '图片文件地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='菜品表';

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('9', '锅包肉', '9', '32.00', '30.00', '15.00', '7', 'c4820bbf43d94c7fb5a54d9d91d4ef7e_锅包肉.jpg', '/pic/');
INSERT INTO `item` VALUES ('10', '菠萝古老肉', '9', '32.00', '30.00', '15.00', '3', 'efce8c1e6245422ebc809f9c00c66267_菠萝古老肉.jpg', '/pic/');
INSERT INTO `item` VALUES ('11', '可乐鸡翅', '9', '48.00', '40.00', '13.00', '4', 'b44c6fe3b355400bbffff7b90ad7570b_可乐鸡翅.jpg', '/pic/');
INSERT INTO `item` VALUES ('12', '地三鲜', '9', '18.00', '16.00', '10.00', '0', '33260665c7ec4a528f68e1f4056a8126_地三鲜.jpg', '/pic/');
INSERT INTO `item` VALUES ('13', '干锅菜花', '9', '22.00', '18.00', '10.00', '0', '4a8f45935ec745eb86368150930e9f4a_干锅菜花.jpg', '/pic/');
INSERT INTO `item` VALUES ('14', '宫保鸡丁', '9', '17.00', '15.00', '10.00', '0', '5e5ac7d538a84504ab41dbac53dabd1e_宫保鸡丁.jpg', '/pic/');
INSERT INTO `item` VALUES ('15', '日本豆腐', '9', '17.00', '16.00', '10.00', '0', '455450b8d39d468d95003bd891ad3b6d_日本豆腐.png', '/pic/');
INSERT INTO `item` VALUES ('16', '糖醋里脊鸡肉', '9', '17.00', '15.00', '10.00', '0', '6802f9a5cd2447018b739c1eb8499e1b_糖醋里脊鸡肉.jpg', '/pic/');
INSERT INTO `item` VALUES ('17', '西红柿炒鸡蛋', '9', '15.00', '14.00', '10.00', '0', '8d3fce93430748aa90c7d4d82a1bb294_西红柿炒鸡蛋.jpg', '/pic/');
INSERT INTO `item` VALUES ('18', '木须肉', '9', '18.00', '16.00', '10.00', '0', '5d6329ec1e5e4a29bf19aa65b8f3bcec_木须肉.jpg', '/pic/');
INSERT INTO `item` VALUES ('20', '肉末茄子', '9', '17.00', '15.00', '10.00', '0', 'e64d557fa7b4498bada2bb2da4f7d1f3_肉末茄子.jpg', '/pic/');
INSERT INTO `item` VALUES ('21', '可乐', '9', '3.00', '2.50', '2.00', '0', '3b2a893ae6804832a13f3e5597c1ddcb_可乐.jpg', '/pic/');
INSERT INTO `item` VALUES ('22', '雪碧', '9', '3.00', '2.50', '2.00', '2', '48cb8666c35645cca5d0209824ae6ee2_雪碧.jpg', '/pic/');
INSERT INTO `item` VALUES ('23', '青岛啤酒', '9', '8.00', '7.00', '6.00', '0', '20ff8d640f6b4acab57ad279801f5da1_青岛啤酒.jpg', '/pic/');

-- ----------------------------
-- Table structure for `item_item_material`
-- ----------------------------
DROP TABLE IF EXISTS `item_item_material`;
CREATE TABLE `item_item_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemId` int(11) NOT NULL COMMENT '菜品编号',
  `materialId` int(11) NOT NULL COMMENT '原料编号',
  `num` int(11) NOT NULL COMMENT '原料的数量',
  PRIMARY KEY (`id`),
  KEY `item_item_material_fk1` (`materialId`),
  KEY `item_item_material_fk2` (`itemId`),
  CONSTRAINT `item_item_material_fk1` FOREIGN KEY (`materialId`) REFERENCES `item_material` (`id`),
  CONSTRAINT `item_item_material_fk2` FOREIGN KEY (`itemId`) REFERENCES `item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='菜品配料关联表';

-- ----------------------------
-- Records of item_item_material
-- ----------------------------
INSERT INTO `item_item_material` VALUES ('12', '9', '13', '1');
INSERT INTO `item_item_material` VALUES ('13', '10', '12', '1');
INSERT INTO `item_item_material` VALUES ('14', '10', '13', '1');
INSERT INTO `item_item_material` VALUES ('15', '11', '16', '1');
INSERT INTO `item_item_material` VALUES ('16', '11', '15', '1');
INSERT INTO `item_item_material` VALUES ('17', '12', '19', '1');
INSERT INTO `item_item_material` VALUES ('18', '12', '14', '1');
INSERT INTO `item_item_material` VALUES ('19', '12', '17', '1');
INSERT INTO `item_item_material` VALUES ('20', '13', '21', '2');
INSERT INTO `item_item_material` VALUES ('21', '14', '22', '1');
INSERT INTO `item_item_material` VALUES ('22', '14', '23', '1');
INSERT INTO `item_item_material` VALUES ('23', '15', '24', '1');
INSERT INTO `item_item_material` VALUES ('24', '16', '22', '1');
INSERT INTO `item_item_material` VALUES ('25', '17', '20', '1');
INSERT INTO `item_item_material` VALUES ('26', '17', '25', '1');
INSERT INTO `item_item_material` VALUES ('27', '18', '26', '1');
INSERT INTO `item_item_material` VALUES ('28', '18', '13', '1');
INSERT INTO `item_item_material` VALUES ('29', '20', '19', '1');
INSERT INTO `item_item_material` VALUES ('30', '20', '13', '1');
INSERT INTO `item_item_material` VALUES ('31', '21', '16', '1');
INSERT INTO `item_item_material` VALUES ('32', '22', '27', '1');
INSERT INTO `item_item_material` VALUES ('33', '23', '28', '1');

-- ----------------------------
-- Table structure for `item_item_type`
-- ----------------------------
DROP TABLE IF EXISTS `item_item_type`;
CREATE TABLE `item_item_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeId` int(11) NOT NULL COMMENT '菜品种类编号',
  `itemId` int(11) NOT NULL COMMENT '菜品编号',
  PRIMARY KEY (`id`),
  KEY `item_item_type_fk1` (`typeId`),
  KEY `item_item_type_fk2` (`itemId`),
  CONSTRAINT `item_item_type_fk1` FOREIGN KEY (`typeId`) REFERENCES `item_type` (`id`),
  CONSTRAINT `item_item_type_fk2` FOREIGN KEY (`itemId`) REFERENCES `item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='菜品菜品种类关联表';

-- ----------------------------
-- Records of item_item_type
-- ----------------------------
INSERT INTO `item_item_type` VALUES ('11', '29', '9');
INSERT INTO `item_item_type` VALUES ('12', '29', '10');
INSERT INTO `item_item_type` VALUES ('13', '29', '11');
INSERT INTO `item_item_type` VALUES ('14', '29', '12');
INSERT INTO `item_item_type` VALUES ('15', '29', '13');
INSERT INTO `item_item_type` VALUES ('16', '30', '14');
INSERT INTO `item_item_type` VALUES ('17', '30', '15');
INSERT INTO `item_item_type` VALUES ('18', '30', '16');
INSERT INTO `item_item_type` VALUES ('19', '31', '17');
INSERT INTO `item_item_type` VALUES ('20', '31', '18');
INSERT INTO `item_item_type` VALUES ('22', '31', '20');
INSERT INTO `item_item_type` VALUES ('23', '33', '21');
INSERT INTO `item_item_type` VALUES ('24', '33', '22');
INSERT INTO `item_item_type` VALUES ('25', '33', '23');

-- ----------------------------
-- Table structure for `item_material`
-- ----------------------------
DROP TABLE IF EXISTS `item_material`;
CREATE TABLE `item_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '配料名称',
  `stock` int(11) NOT NULL COMMENT '库存',
  `unit` varchar(10) NOT NULL COMMENT '单位',
  `price` float(5,2) NOT NULL COMMENT '单价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='配料表';

-- ----------------------------
-- Records of item_material
-- ----------------------------
INSERT INTO `item_material` VALUES ('12', '菠萝', '100', '颗', '5.00');
INSERT INTO `item_material` VALUES ('13', '猪肉', '100', '斤', '10.00');
INSERT INTO `item_material` VALUES ('14', '土豆', '100', '斤', '5.00');
INSERT INTO `item_material` VALUES ('15', '鸡翅', '100', '斤', '9.00');
INSERT INTO `item_material` VALUES ('16', '可乐', '100', '听', '2.50');
INSERT INTO `item_material` VALUES ('17', '青椒', '100', '斤', '3.50');
INSERT INTO `item_material` VALUES ('18', '土豆', '100', '斤', '2.50');
INSERT INTO `item_material` VALUES ('19', '茄子', '100', '斤', '5.50');
INSERT INTO `item_material` VALUES ('20', '鸡蛋', '100', '颗', '0.50');
INSERT INTO `item_material` VALUES ('21', '菜花', '100', '斤', '3.50');
INSERT INTO `item_material` VALUES ('22', '鸡肉', '100', '斤', '9.80');
INSERT INTO `item_material` VALUES ('23', '黄瓜', '100', '斤', '3.50');
INSERT INTO `item_material` VALUES ('24', '日本豆腐', '100', '斤', '10.00');
INSERT INTO `item_material` VALUES ('25', '西红柿', '100', '斤', '3.50');
INSERT INTO `item_material` VALUES ('26', '木耳', '100', '斤', '5.50');
INSERT INTO `item_material` VALUES ('27', '雪碧', '100', '听', '2.50');
INSERT INTO `item_material` VALUES ('28', '青岛啤酒', '100', '瓶', '8.00');

-- ----------------------------
-- Table structure for `item_order`
-- ----------------------------
DROP TABLE IF EXISTS `item_order`;
CREATE TABLE `item_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL,
  `total_quantity` int(11) NOT NULL COMMENT '订单商品总数量',
  `total_price` float(5,2) NOT NULL COMMENT '订单商品总价格',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `state` bit(2) DEFAULT b'0' COMMENT '订单状态',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `item_order_fk1` (`uid`),
  CONSTRAINT `item_order_fk1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_order
-- ----------------------------
INSERT INTO `item_order` VALUES ('21', '13129174313459', '2', '12.00', '2018-05-01 00:00:00', '', '1');
INSERT INTO `item_order` VALUES ('22', '622332136384530', '3', '32.00', '2018-05-02 00:00:00', '', '10');
INSERT INTO `item_order` VALUES ('23', '411134722605751', '1', '10.00', '2018-05-02 00:00:00', '', '1');
INSERT INTO `item_order` VALUES ('28', '735272260601616', '2', '12.00', '2018-05-02 00:00:00', '', '1');
INSERT INTO `item_order` VALUES ('29', '7194437212737', '1', '10.00', '2018-05-02 00:00:00', '', '10');
INSERT INTO `item_order` VALUES ('32', '6639620444854', '2', '12.00', '2018-05-02 00:00:00', '', '10');
INSERT INTO `item_order` VALUES ('33', '72318482826128', '1', '10.00', '2018-05-02 00:00:00', '', '1');
INSERT INTO `item_order` VALUES ('34', '743494017556', '1', '10.00', '2018-05-02 00:00:00', '', '1');
INSERT INTO `item_order` VALUES ('35', '55725917405638', '1', '10.00', '2018-05-02 00:00:00', '', '1');
INSERT INTO `item_order` VALUES ('38', '86544761246039', '2', '12.00', '2018-05-02 00:00:00', '', '1');
INSERT INTO `item_order` VALUES ('39', '314525161421217', '2', '12.00', '2018-05-02 00:00:00', '', '1');
INSERT INTO `item_order` VALUES ('40', '546131327404242', '3', '14.00', '2018-05-02 00:00:00', '', '1');
INSERT INTO `item_order` VALUES ('41', '727353260382739', '4', '16.00', '2018-05-02 00:00:00', '', '1');
INSERT INTO `item_order` VALUES ('42', '3372265448264', '4', '16.00', '2018-05-02 00:00:00', '', '1');
INSERT INTO `item_order` VALUES ('43', '934185247345838', '5', '18.00', '2018-05-03 00:00:00', '', '1');
INSERT INTO `item_order` VALUES ('44', '259144739441119', '2', '4.00', '2018-05-03 00:00:00', '', '10');
INSERT INTO `item_order` VALUES ('45', '145403822355435', '2', '4.00', '2018-05-03 00:00:00', '', '10');
INSERT INTO `item_order` VALUES ('46', '725611325382522', '3', '50.00', '2018-05-03 00:00:00', '', '1');
INSERT INTO `item_order` VALUES ('47', '3172954335641', '3', '14.00', '2018-05-03 00:00:00', '', '10');
INSERT INTO `item_order` VALUES ('48', '9435213331647', '3', '14.00', '2018-05-03 00:00:00', '', '10');
INSERT INTO `item_order` VALUES ('49', '46057472182740', '3', '14.00', '2018-05-03 00:00:00', '', '10');
INSERT INTO `item_order` VALUES ('51', '1122258715263', '3', '32.00', '2018-05-03 00:00:00', '', '12');
INSERT INTO `item_order` VALUES ('52', '9462237545136', '6', '64.00', '2018-05-03 00:00:00', '', '12');
INSERT INTO `item_order` VALUES ('53', '758332722403016', '3', '32.00', '2018-05-03 00:00:00', '', '12');
INSERT INTO `item_order` VALUES ('55', '45628532973251', '5', '44.00', '2018-05-03 00:00:00', '', '12');
INSERT INTO `item_order` VALUES ('56', '5502621411546', '3', '32.00', '2018-05-03 00:00:00', '', '12');
INSERT INTO `item_order` VALUES ('57', '73713483136325', '5', '62.00', '2018-05-03 00:00:00', '', '12');
INSERT INTO `item_order` VALUES ('58', '222433013165024', '5', '80.00', '2018-05-03 00:00:00', '', '12');
INSERT INTO `item_order` VALUES ('59', '82519252526622', '3', '32.00', '2018-05-03 00:00:00', '', '12');
INSERT INTO `item_order` VALUES ('61', '728302331293118', '3', '32.00', '2018-05-03 00:00:00', '', '12');
INSERT INTO `item_order` VALUES ('63', '213856601458', '2', '12.00', '2018-05-03 00:00:00', '', '12');
INSERT INTO `item_order` VALUES ('65', '636175927375245', '1', '20.00', '2018-05-04 00:00:00', '', '12');
INSERT INTO `item_order` VALUES ('66', '2202182647958', '1', '20.00', '2018-05-04 00:00:00', '', '12');
INSERT INTO `item_order` VALUES ('67', '75427315125357', '2', '4.00', '2018-05-04 00:00:00', '', '1');
INSERT INTO `item_order` VALUES ('68', '553523543575417', '2', '30.00', '2018-05-04 00:00:00', '', '12');
INSERT INTO `item_order` VALUES ('69', '261376020191429', '3', '14.00', '2018-05-04 00:00:00', '', '1');
INSERT INTO `item_order` VALUES ('70', '95852233895254', '3', '14.00', '2018-05-04 00:00:00', '', '1');
INSERT INTO `item_order` VALUES ('71', '85214715533637', '3', '14.00', '2018-05-04 00:00:00', '', '1');
INSERT INTO `item_order` VALUES ('74', '1161111271323', '4', '24.00', '2018-05-04 00:00:00', '', '10');
INSERT INTO `item_order` VALUES ('85', '54751548143033', '1', '18.00', '2018-05-14 00:00:00', '', '1');
INSERT INTO `item_order` VALUES ('86', '41225326154627', '2', '80.00', '2018-05-14 02:13:39', '', '1');
INSERT INTO `item_order` VALUES ('87', '532172940584442', '2', '80.00', '2018-05-14 02:16:15', '', '1');
INSERT INTO `item_order` VALUES ('88', '94847132202527', '2', '64.00', '2018-05-14 02:19:50', '', '1');
INSERT INTO `item_order` VALUES ('89', '7603557340410', '2', '6.00', '2018-05-14 02:58:05', '', '1');
INSERT INTO `item_order` VALUES ('92', '521330216529', '3', '96.00', '2018-05-14 11:14:53', '', '1');
INSERT INTO `item_order` VALUES ('94', '2444129929928', '1', '18.00', '2018-05-14 20:04:23', '', '11');

-- ----------------------------
-- Table structure for `item_order_num`
-- ----------------------------
DROP TABLE IF EXISTS `item_order_num`;
CREATE TABLE `item_order_num` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `item_id` int(11) DEFAULT NULL COMMENT '菜品id',
  `num` int(11) NOT NULL COMMENT '该商品数量',
  `price` float(5,2) NOT NULL COMMENT '该项小计',
  `item_order_id` int(11) DEFAULT NULL COMMENT '订餐订单id',
  PRIMARY KEY (`id`),
  KEY `item_order_num_fk1` (`item_id`),
  KEY `item_order_num_fk2` (`item_order_id`),
  CONSTRAINT `item_order_num_fk1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `item_order_num_fk2` FOREIGN KEY (`item_order_id`) REFERENCES `item_order` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_order_num
-- ----------------------------
INSERT INTO `item_order_num` VALUES ('46', '3', '1', '10.00', '21');
INSERT INTO `item_order_num` VALUES ('47', '6', '1', '2.00', '21');
INSERT INTO `item_order_num` VALUES ('48', '6', '1', '2.00', '23');
INSERT INTO `item_order_num` VALUES ('49', '7', '1', '10.00', '23');
INSERT INTO `item_order_num` VALUES ('53', '2', '1', '20.00', '21');
INSERT INTO `item_order_num` VALUES ('54', '2', '2', '40.00', '21');
INSERT INTO `item_order_num` VALUES ('55', '2', '1', '20.00', '22');
INSERT INTO `item_order_num` VALUES ('56', '3', '1', '10.00', '22');
INSERT INTO `item_order_num` VALUES ('57', '6', '1', '2.00', '22');
INSERT INTO `item_order_num` VALUES ('58', '7', '1', '10.00', '23');
INSERT INTO `item_order_num` VALUES ('59', '6', '1', '2.00', '28');
INSERT INTO `item_order_num` VALUES ('60', '7', '1', '10.00', '28');
INSERT INTO `item_order_num` VALUES ('61', '3', '1', '10.00', '32');
INSERT INTO `item_order_num` VALUES ('62', '6', '1', '2.00', '32');
INSERT INTO `item_order_num` VALUES ('63', '2', '1', '20.00', '61');
INSERT INTO `item_order_num` VALUES ('64', '3', '1', '10.00', '61');
INSERT INTO `item_order_num` VALUES ('65', '6', '1', '2.00', '61');
INSERT INTO `item_order_num` VALUES ('66', '3', '1', '10.00', null);
INSERT INTO `item_order_num` VALUES ('67', '6', '1', '2.00', null);
INSERT INTO `item_order_num` VALUES ('68', '9', '2', '64.00', null);
INSERT INTO `item_order_num` VALUES ('69', '11', '2', '96.00', null);
INSERT INTO `item_order_num` VALUES ('70', '11', '1', '48.00', null);
INSERT INTO `item_order_num` VALUES ('71', '9', '1', '32.00', null);
INSERT INTO `item_order_num` VALUES ('72', '10', '1', '32.00', null);
INSERT INTO `item_order_num` VALUES ('73', '10', '1', '32.00', '87');
INSERT INTO `item_order_num` VALUES ('74', '11', '1', '48.00', '87');
INSERT INTO `item_order_num` VALUES ('75', '9', '1', '32.00', '88');
INSERT INTO `item_order_num` VALUES ('76', '10', '1', '32.00', '88');
INSERT INTO `item_order_num` VALUES ('77', '22', '2', '6.00', '89');
INSERT INTO `item_order_num` VALUES ('78', '9', '3', '96.00', '92');

-- ----------------------------
-- Table structure for `item_type`
-- ----------------------------
DROP TABLE IF EXISTS `item_type`;
CREATE TABLE `item_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜品种类编号',
  `name` varchar(20) NOT NULL COMMENT '菜品种类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='菜品种类表';

-- ----------------------------
-- Records of item_type
-- ----------------------------
INSERT INTO `item_type` VALUES ('29', '特色菜系');
INSERT INTO `item_type` VALUES ('30', '肉类');
INSERT INTO `item_type` VALUES ('31', '青菜');
INSERT INTO `item_type` VALUES ('33', '饮品');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(20) NOT NULL COMMENT '菜单名称',
  `parentId` int(11) DEFAULT NULL COMMENT '上级菜单id',
  `serialNum` int(11) DEFAULT NULL COMMENT '是否为顶级菜单，菜单顺序',
  `state` bit(2) DEFAULT b'0',
  `url` varchar(255) DEFAULT NULL COMMENT '权限地址',
  `description` varchar(255) DEFAULT NULL COMMENT '权限描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '菜品管理', '0', null, '', null, null);
INSERT INTO `menu` VALUES ('2', '座位管理', '0', null, '', null, null);
INSERT INTO `menu` VALUES ('3', '管理菜品种类', '1', null, '', '/manage/findAllItemType', null);
INSERT INTO `menu` VALUES ('4', '管理原料种类', '10', null, '', '/manage/findAllItemMaterial', null);
INSERT INTO `menu` VALUES ('7', '管理菜品', '1', null, '', '/manage/findAllItem', null);
INSERT INTO `menu` VALUES ('8', '管理座位', '2', null, '', '/SeatManage/ManageSeats', null);
INSERT INTO `menu` VALUES ('10', '原料管理', '0', null, '', null, null);
INSERT INTO `menu` VALUES ('11', '管理原料', '10', null, '', null, null);
INSERT INTO `menu` VALUES ('12', '添加座位', '2', null, '', '/SeatManage/addSeats', null);
INSERT INTO `menu` VALUES ('15', '系统管理', '0', null, '', null, null);
INSERT INTO `menu` VALUES ('16', '管理角色', '15', null, '', '/SystemManage/manageRole', null);
INSERT INTO `menu` VALUES ('19', '会员管理', '0', null, '', null, null);
INSERT INTO `menu` VALUES ('20', '明细管理', '0', null, '', '', null);
INSERT INTO `menu` VALUES ('21', '财务管理', '0', null, '', null, null);
INSERT INTO `menu` VALUES ('22', '会员授权', '19', null, '', '#', null);
INSERT INTO `menu` VALUES ('23', '管理会员', '19', null, '', '#', null);
INSERT INTO `menu` VALUES ('24', '查看明细', '20', null, '', '/manage/finddetails', null);
INSERT INTO `menu` VALUES ('28', '管理菜单', '15', null, '', '/SystemManage/manageMenu', null);
INSERT INTO `menu` VALUES ('31', '支付管理', '0', null, '', '', '');
INSERT INTO `menu` VALUES ('37', '管理顾客', '15', null, '', '/SystemManage/manageCustomer', '');

-- ----------------------------
-- Table structure for `module`
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `id` int(2) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(50) NOT NULL COMMENT '模块名',
  `status` bit(2) NOT NULL DEFAULT b'0' COMMENT '禁用状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='用来存储模块信息';

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES ('1', '系统管理', '');
INSERT INTO `module` VALUES ('2', '菜品管理', '');
INSERT INTO `module` VALUES ('3', '订餐管理', '');
INSERT INTO `module` VALUES ('4', '座位管理', '');
INSERT INTO `module` VALUES ('5', '订座管理', '');
INSERT INTO `module` VALUES ('6', '进货管理', '');
INSERT INTO `module` VALUES ('7', '财务管理', '');
INSERT INTO `module` VALUES ('8', '顾客管理', '');
INSERT INTO `module` VALUES ('9', '商家管理', '');
INSERT INTO `module` VALUES ('10', '会员管理', '');
INSERT INTO `module` VALUES ('11', '明细管理', '');
INSERT INTO `module` VALUES ('12', '支付管理', '');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `description` varchar(255) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '后台管理员', '能进行所有操作');
INSERT INTO `role` VALUES ('2', '顾客', '订餐，订座，注册默认设置为顾客');
INSERT INTO `role` VALUES ('6', '系统管理员', '管理用户、角色、菜单');
INSERT INTO `role` VALUES ('7', '会员', '享用会员特权');
INSERT INTO `role` VALUES ('8', '明细管理员', '明细管理员');

-- ----------------------------
-- Table structure for `role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_authority_fk1` (`mid`),
  KEY `role_authority_fk2` (`rid`),
  CONSTRAINT `role_authority_fk1` FOREIGN KEY (`mid`) REFERENCES `menu` (`id`),
  CONSTRAINT `role_authority_fk2` FOREIGN KEY (`rid`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES ('371', '6', '15');
INSERT INTO `role_menu` VALUES ('372', '6', '16');
INSERT INTO `role_menu` VALUES ('373', '6', '28');
INSERT INTO `role_menu` VALUES ('374', '6', '37');
INSERT INTO `role_menu` VALUES ('377', '8', '20');
INSERT INTO `role_menu` VALUES ('378', '8', '24');
INSERT INTO `role_menu` VALUES ('379', '8', '21');
INSERT INTO `role_menu` VALUES ('380', '1', '1');
INSERT INTO `role_menu` VALUES ('381', '1', '3');
INSERT INTO `role_menu` VALUES ('382', '1', '7');
INSERT INTO `role_menu` VALUES ('383', '1', '2');
INSERT INTO `role_menu` VALUES ('384', '1', '8');
INSERT INTO `role_menu` VALUES ('385', '1', '12');
INSERT INTO `role_menu` VALUES ('386', '1', '10');
INSERT INTO `role_menu` VALUES ('387', '1', '4');
INSERT INTO `role_menu` VALUES ('388', '1', '11');
INSERT INTO `role_menu` VALUES ('389', '1', '15');
INSERT INTO `role_menu` VALUES ('390', '1', '16');
INSERT INTO `role_menu` VALUES ('391', '1', '21');
INSERT INTO `role_menu` VALUES ('392', '2', '1');
INSERT INTO `role_menu` VALUES ('393', '2', '3');
INSERT INTO `role_menu` VALUES ('394', '2', '7');
INSERT INTO `role_menu` VALUES ('395', '2', '2');
INSERT INTO `role_menu` VALUES ('396', '2', '8');
INSERT INTO `role_menu` VALUES ('397', '2', '12');
INSERT INTO `role_menu` VALUES ('398', '2', '10');
INSERT INTO `role_menu` VALUES ('399', '2', '4');
INSERT INTO `role_menu` VALUES ('400', '2', '11');
INSERT INTO `role_menu` VALUES ('401', '2', '15');
INSERT INTO `role_menu` VALUES ('402', '2', '16');
INSERT INTO `role_menu` VALUES ('403', '2', '28');
INSERT INTO `role_menu` VALUES ('404', '2', '37');

-- ----------------------------
-- Table structure for `seat`
-- ----------------------------
DROP TABLE IF EXISTS `seat`;
CREATE TABLE `seat` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '座位编号名称（如：2-101）',
  `seat_type_id` int(2) NOT NULL COMMENT '座位类型id',
  `state` bit(2) NOT NULL DEFAULT b'1' COMMENT '是否能预定（00：不能预定；01：可以预订）',
  `place` varchar(50) NOT NULL COMMENT '对应位置号',
  PRIMARY KEY (`id`),
  KEY `seat_type_fk1` (`seat_type_id`),
  CONSTRAINT `seat_type_fk1` FOREIGN KEY (`seat_type_id`) REFERENCES `seat_type` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='座位表';

-- ----------------------------
-- Records of seat
-- ----------------------------
INSERT INTO `seat` VALUES ('1', '001', '1', '', '0_1');
INSERT INTO `seat` VALUES ('2', '002', '1', '', '0_2');
INSERT INTO `seat` VALUES ('3', '003', '1', '', '0_3');
INSERT INTO `seat` VALUES ('6', '006', '1', '', '0_6');
INSERT INTO `seat` VALUES ('10', '010', '1', '', '1_0');
INSERT INTO `seat` VALUES ('11', '011', '1', '', '1_1');
INSERT INTO `seat` VALUES ('12', '012', '2', '', '1_2');
INSERT INTO `seat` VALUES ('13', '013', '1', '', '1_3');
INSERT INTO `seat` VALUES ('16', '016', '2', '', '1_6');
INSERT INTO `seat` VALUES ('17', '017', '2', '', '1_7');
INSERT INTO `seat` VALUES ('20', '020', '1', '', '2_0');
INSERT INTO `seat` VALUES ('21', '021', '1', '', '2_1');
INSERT INTO `seat` VALUES ('22', '022', '1', '', '2_2');
INSERT INTO `seat` VALUES ('23', '023', '1', '', '2_3');
INSERT INTO `seat` VALUES ('26', '026', '2', '', '2_6');
INSERT INTO `seat` VALUES ('27', '027', '2', '', '2_7');
INSERT INTO `seat` VALUES ('30', '030', '1', '', '3_0');
INSERT INTO `seat` VALUES ('31', '031', '1', '', '3_1');
INSERT INTO `seat` VALUES ('32', '032', '1', '', '3_2');
INSERT INTO `seat` VALUES ('33', '033', '1', '', '3_3');
INSERT INTO `seat` VALUES ('36', '036', '2', '', '3_6');
INSERT INTO `seat` VALUES ('37', '037', '2', '', '3_7');
INSERT INTO `seat` VALUES ('61', '061', '3', '', '6_1');
INSERT INTO `seat` VALUES ('62', '062', '2', '', '6_2');
INSERT INTO `seat` VALUES ('66', '066', '3', '', '6_6');
INSERT INTO `seat` VALUES ('69', '069', '3', '', '6_9');
INSERT INTO `seat` VALUES ('71', '071', '3', '', '7_1');
INSERT INTO `seat` VALUES ('72', '072', '3', '', '7_2');
INSERT INTO `seat` VALUES ('77', '077', '3', '', '7_7');
INSERT INTO `seat` VALUES ('78', '078', '3', '', '7_8');
INSERT INTO `seat` VALUES ('81', '081', '2', '', '8_1');
INSERT INTO `seat` VALUES ('82', '082', '1', '', '8_2');
INSERT INTO `seat` VALUES ('87', '087', '3', '', '8_7');
INSERT INTO `seat` VALUES ('88', '088', '3', '', '8_8');
INSERT INTO `seat` VALUES ('96', '096', '3', '', '9_6');
INSERT INTO `seat` VALUES ('99', '099', '3', '', '9_9');

-- ----------------------------
-- Table structure for `seat_order`
-- ----------------------------
DROP TABLE IF EXISTS `seat_order`;
CREATE TABLE `seat_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL,
  `ordertime` datetime NOT NULL COMMENT '下单时间（与座位开始时间一致）',
  `arrivetime` datetime NOT NULL COMMENT '到店时间',
  `leavetime` datetime NOT NULL COMMENT '离店时间（与座位结束时间一致）',
  `duration` int(10) NOT NULL COMMENT '用餐时间长度（离店减到店）',
  `num` int(11) DEFAULT NULL COMMENT '就餐人数',
  `cash` int(10) NOT NULL COMMENT '押金',
  `confirm` varchar(50) NOT NULL COMMENT '确认码',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `state` bit(2) DEFAULT b'0' COMMENT '是否付款',
  PRIMARY KEY (`id`),
  KEY `seat_order_fk1` (`uid`),
  CONSTRAINT `seat_order_fk1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8 COMMENT='用于存储预订订单信息';

-- ----------------------------
-- Records of seat_order
-- ----------------------------
INSERT INTO `seat_order` VALUES ('156', '7553318828723', '2018-04-27 20:28:20', '2018-04-27 20:45:07', '2018-04-27 22:45:07', '120', '2', '10', 'IWQGBOT', '1', '');
INSERT INTO `seat_order` VALUES ('157', '22241141346943', '2018-04-27 20:51:47', '2018-04-27 20:55:35', '2018-04-27 22:55:35', '120', '2', '10', 'LNQmf5G', '1', '');
INSERT INTO `seat_order` VALUES ('158', '55925357481533', '2018-04-27 20:56:37', '2018-04-27 21:25:25', '2018-04-27 23:25:25', '120', '4', '20', 'nHAoTqm', '1', '');
INSERT INTO `seat_order` VALUES ('159', '41657481012439', '2018-04-27 21:06:07', '2018-04-27 21:25:42', '2018-04-27 23:25:42', '120', '2', '10', 'cmG30fk', '1', '');
INSERT INTO `seat_order` VALUES ('160', '26154563412718', '2018-04-27 21:08:04', '2018-04-27 21:25:53', '2018-04-27 23:25:53', '120', '4', '20', 'ux5nQ5g', '1', '');
INSERT INTO `seat_order` VALUES ('161', '12617285446358', '2018-04-27 21:08:33', '2018-04-27 21:20:20', '2018-04-27 23:20:20', '120', '8', '50', 'L2BaDM0', '8', '');
INSERT INTO `seat_order` VALUES ('162', '7959165526460', '2018-04-27 21:40:05', '2018-04-27 21:45:53', '2018-04-27 23:45:53', '120', '4', '20', 'OHbcodk', '1', '');
INSERT INTO `seat_order` VALUES ('163', '6252562128149', '2018-04-27 21:56:16', '2018-04-27 22:00:01', '2018-04-28 00:00:01', '120', '4', '20', 'cdz278T', '1', '');
INSERT INTO `seat_order` VALUES ('164', '820491858512731', '2018-04-27 22:12:38', '2018-04-27 22:25:27', '2018-04-28 00:25:27', '120', '4', '20', 'EKBYaiC', '1', '');
INSERT INTO `seat_order` VALUES ('165', '927251113504', '2018-04-27 22:15:16', '2018-04-27 22:25:06', '2018-04-28 00:25:06', '120', '4', '20', '8cHLEro', '1', '');
INSERT INTO `seat_order` VALUES ('166', '415555755373158', '2018-04-27 22:21:06', '2018-04-27 22:25:52', '2018-04-28 00:25:52', '120', '8', '50', 'ZzN8uz2', '1', '');
INSERT INTO `seat_order` VALUES ('167', '818133530123410', '2018-04-27 22:24:19', '2018-04-27 22:25:32', '2018-04-28 00:25:32', '120', '4', '20', 'AsTX882', '1', '');
INSERT INTO `seat_order` VALUES ('168', '63560430047', '2018-04-27 22:24:19', '2018-04-27 22:25:32', '2018-04-28 00:25:32', '120', '4', '20', 'dxel9ko', '1', '');
INSERT INTO `seat_order` VALUES ('169', '759564729352446', '2018-04-27 22:27:03', '2018-04-27 22:45:39', '2018-04-28 00:45:39', '120', '4', '20', '1dneROH', '1', '');
INSERT INTO `seat_order` VALUES ('170', '631352633371927', '2018-04-27 22:31:57', '2018-04-27 22:50:44', '2018-04-28 00:50:44', '120', '4', '20', 'qdOifCz', '1', '');
INSERT INTO `seat_order` VALUES ('171', '13848403420429', '2018-04-27 22:37:40', '2018-04-27 22:50:27', '2018-04-28 00:50:27', '120', '4', '20', 'Kj8i0hp', '1', '');
INSERT INTO `seat_order` VALUES ('172', '549142658232942', '2018-04-27 22:41:06', '2018-04-27 22:50:54', '2018-04-28 00:50:54', '120', '4', '20', 'gxOGh6Z', '1', '');
INSERT INTO `seat_order` VALUES ('173', '551333058441538', '2018-04-27 22:43:37', '2018-04-27 22:50:24', '2018-04-28 00:50:24', '120', '4', '20', 'IZmhqht', '1', '');
INSERT INTO `seat_order` VALUES ('174', '3615632411317', '2018-04-27 22:45:58', '2018-04-27 22:50:47', '2018-04-28 00:50:47', '120', '4', '20', 'ymUzfdy', '1', '');
INSERT INTO `seat_order` VALUES ('175', '3291871713420', '2018-04-27 22:49:42', '2018-05-01 01:00:12', '2018-05-01 03:00:12', '120', '4', '20', 'JASxFrW', '1', '');
INSERT INTO `seat_order` VALUES ('176', '529403911492858', '2018-04-27 22:55:13', '2018-04-27 22:55:58', '2018-04-28 00:55:58', '120', '4', '20', 'vCBnjfx', '1', '');
INSERT INTO `seat_order` VALUES ('177', '1357421517143', '2018-04-27 22:57:53', '2018-04-27 23:25:40', '2018-04-28 01:25:40', '120', '4', '20', 'ykwttAq', '1', '');
INSERT INTO `seat_order` VALUES ('178', '62146163741145', '2018-04-27 23:02:54', '2018-04-27 23:25:41', '2018-04-28 01:25:41', '120', '4', '20', '69NBBjZ', '1', '');
INSERT INTO `seat_order` VALUES ('179', '41115920211515', '2018-04-27 23:06:00', '2018-04-27 23:25:48', '2018-04-28 01:25:48', '120', '4', '20', 'v606pG8', '1', '');
INSERT INTO `seat_order` VALUES ('180', '45149172953761', '2018-04-27 23:08:53', '2018-04-27 23:25:41', '2018-04-28 01:25:41', '120', '4', '20', 'FyIrHLt', '1', '');
INSERT INTO `seat_order` VALUES ('181', '42553434930423', '2018-04-27 23:16:41', '2018-04-27 23:25:30', '2018-04-28 01:25:30', '120', '4', '20', '1uGV0W6', '1', '');
INSERT INTO `seat_order` VALUES ('182', '51453334418818', '2018-04-27 23:37:33', '2018-04-27 23:40:19', '2018-04-28 01:40:19', '120', '4', '20', 'YDMqKpp', '1', '');
INSERT INTO `seat_order` VALUES ('183', '75414735124345', '2018-04-27 23:47:56', '2018-04-27 23:50:43', '2018-04-28 01:50:43', '120', '4', '20', 'DxBYvM3', '1', '');
INSERT INTO `seat_order` VALUES ('184', '15850351518349', '2018-04-28 00:00:01', '2018-04-28 00:00:43', '2018-04-28 02:00:43', '120', '4', '20', 'u847TTq', '1', '');
INSERT INTO `seat_order` VALUES ('185', '8415737345744', '2018-04-28 00:00:01', '2018-04-28 00:00:43', '2018-04-28 02:00:43', '120', '4', '20', 'KpfjtGO', '1', '');
INSERT INTO `seat_order` VALUES ('186', '51528272411936', '2018-04-28 00:10:38', '2018-04-28 00:25:24', '2018-04-28 02:25:24', '120', '8', '40', 'eoKhJlz', '1', '');
INSERT INTO `seat_order` VALUES ('187', '739511646284010', '2018-04-28 00:21:18', '2018-04-28 00:25:07', '2018-04-28 02:25:07', '120', '4', '20', 'cFW13mP', '1', '');
INSERT INTO `seat_order` VALUES ('188', '14245223385710', '2018-04-28 00:31:35', '2018-04-28 15:50:20', '2018-04-28 17:50:20', '120', '8', '50', 'h9ghjMI', '1', '');
INSERT INTO `seat_order` VALUES ('195', '53213205723858', '2018-04-28 00:58:44', '2018-04-28 16:25:53', '2018-04-28 18:25:53', '120', '4', '20', 'Q0gD14g', '1', '');
INSERT INTO `seat_order` VALUES ('196', '214262210521651', '2018-04-28 01:03:09', '2018-04-28 01:20:56', '2018-04-28 03:20:56', '120', '4', '20', 'ysnFZvf', '1', '');
INSERT INTO `seat_order` VALUES ('198', '730362747585037', '2018-04-28 01:14:50', '2018-04-28 01:25:29', '2018-04-28 03:25:29', '120', '12', '60', '6MjOka0', '1', '');
INSERT INTO `seat_order` VALUES ('199', '32834105025', '2018-04-28 01:15:25', '2018-04-28 01:25:10', '2018-04-28 03:25:10', '120', '4', '20', '39ZdZG4', '8', '');
INSERT INTO `seat_order` VALUES ('200', '82141414383835', '2018-04-29 00:25:18', '2018-04-29 00:30:03', '2018-04-29 02:30:03', '120', '2', '10', 'WVmgtNK', '1', '');
INSERT INTO `seat_order` VALUES ('201', '4252303324376', '2018-04-29 00:37:32', '2018-04-29 00:40:20', '2018-04-29 02:40:20', '120', '4', '20', 'IADKHns', '1', '');
INSERT INTO `seat_order` VALUES ('202', '85037281442558', '2018-04-29 00:44:03', '2018-04-29 12:25:45', '2018-04-29 14:25:45', '120', '4', '20', 'bW8kqVa', '1', '');
INSERT INTO `seat_order` VALUES ('203', '9632020422843', '2018-04-29 00:46:17', '2018-04-29 00:50:04', '2018-04-29 02:50:04', '120', '2', '10', 'XHbg4t5', '1', '');
INSERT INTO `seat_order` VALUES ('204', '63849155913546', '2018-04-29 01:02:23', '2018-04-29 01:25:04', '2018-04-29 03:25:04', '120', '2', '10', 'y0LzNtC', '1', '');
INSERT INTO `seat_order` VALUES ('206', '491656183044', '2018-04-29 01:07:21', '2018-04-29 01:25:58', '2018-04-29 03:25:58', '120', '2', '10', 'cO2mzE2', '1', '');
INSERT INTO `seat_order` VALUES ('207', '7172602534735', '2018-04-29 01:08:55', '2018-04-30 01:25:38', '2018-04-30 03:25:38', '120', '6', '30', 'RvpeXNp', '8', '');
INSERT INTO `seat_order` VALUES ('208', '6553747558158', '2018-05-02 15:48:16', '2018-05-02 15:50:35', '2018-05-02 17:50:35', '120', '6', '30', 'P7536sZ', '1', '');
INSERT INTO `seat_order` VALUES ('209', '6010315582434', '2018-05-02 16:17:02', '2018-05-03 16:25:35', '2018-05-03 18:25:35', '120', null, '10', 'wBv1GkM', '10', '');
INSERT INTO `seat_order` VALUES ('210', '4273716541516', '2018-05-02 22:00:20', '2018-05-02 22:25:03', '2018-05-03 00:25:03', '120', '4', '20', 'XnRJLaK', '1', '');
INSERT INTO `seat_order` VALUES ('211', '81657108591034', '2018-05-03 12:35:49', '2018-05-03 12:45:32', '2018-05-03 14:45:32', '120', '8', '40', 'qoq2E56', '12', '');
INSERT INTO `seat_order` VALUES ('212', '450406147583259', '2018-05-03 12:35:49', '2018-05-03 12:45:32', '2018-05-03 14:45:32', '120', '8', '40', '0eAsAWP', '12', '');
INSERT INTO `seat_order` VALUES ('213', '3459465741216', '2018-05-03 12:37:04', '2018-05-03 12:40:19', '2018-05-03 14:40:19', '120', '8', '40', 'DoZzvcV', '10', '');
INSERT INTO `seat_order` VALUES ('216', '8393618025840', '2018-05-03 12:54:20', '2018-05-03 12:55:01', '2018-05-03 14:55:01', '120', '16', '100', 'E7YAJ5v', '12', '');
INSERT INTO `seat_order` VALUES ('217', '33912737394120', '2018-05-03 12:55:14', '2018-05-03 12:55:40', '2018-05-03 14:55:40', '120', '1', '100', '4t3RCzD', '1', '');
INSERT INTO `seat_order` VALUES ('219', '63233171043857', '2018-05-03 15:39:14', '2018-05-03 15:45:54', '2018-05-03 17:45:54', '120', '18', '200', 'mjMBkeH', '1', '');
INSERT INTO `seat_order` VALUES ('220', '93896039451315', '2018-05-03 16:12:39', '2018-05-03 16:25:15', '2018-05-03 18:25:15', '120', '16', '100', '9MCvC2G', '1', '');
INSERT INTO `seat_order` VALUES ('223', '8331792364113', '2018-05-03 16:16:41', '2018-05-03 16:25:15', '2018-05-03 18:25:15', '120', '12', '70', 'hBpWiFF', '12', '');
INSERT INTO `seat_order` VALUES ('224', '918452621296117', '2018-05-03 16:20:16', '2018-05-31 01:00:43', '2018-05-31 03:00:43', '120', '4', '20', 'TP9cJsK', '1', '');
INSERT INTO `seat_order` VALUES ('225', '43564845615256', '2018-05-03 16:24:47', '2018-05-31 01:00:22', '2018-05-31 03:00:22', '120', '4', '20', '1NSDnjF', '1', '');
INSERT INTO `seat_order` VALUES ('226', '2413585352315', '2018-05-03 16:31:11', '2018-05-31 01:00:39', '2018-05-31 03:00:39', '120', '4', '20', 'q62NMXw', '1', '');
INSERT INTO `seat_order` VALUES ('228', '341346140112031', '2018-05-04 22:37:02', '2018-05-04 22:45:16', '2018-05-05 00:45:16', '120', '6', '30', 'kFWvvxc', '10', '');
INSERT INTO `seat_order` VALUES ('229', '832601914119', '2018-05-04 22:41:09', '2018-05-04 22:45:47', '2018-05-05 00:45:47', '120', '4', '20', 'dEMDsi6', '10', '');
INSERT INTO `seat_order` VALUES ('232', '743355739545248', '2018-05-13 18:11:50', '2018-05-13 18:15:36', '2018-05-13 20:15:36', '120', '8', '50', 'CHdwjTI', '12', '');
INSERT INTO `seat_order` VALUES ('236', '6600402305627', '2018-05-14 19:03:59', '2018-05-14 19:25:28', '2018-05-14 23:25:28', '240', '5', '30', 'OFIxD6Z', '1', '');
INSERT INTO `seat_order` VALUES ('239', '914145725474547', '2018-05-14 19:17:13', '2018-05-14 19:25:58', '2018-05-14 23:25:58', '240', '8', '40', 'ampkFM3', '12', '');
INSERT INTO `seat_order` VALUES ('240', '447545419476134', '2018-05-14 19:22:09', '2018-05-14 19:25:51', '2018-05-14 23:25:51', '240', '8', '40', 'f027yil', '1', '');

-- ----------------------------
-- Table structure for `seat_schedule`
-- ----------------------------
DROP TABLE IF EXISTS `seat_schedule`;
CREATE TABLE `seat_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sid` int(5) DEFAULT NULL COMMENT '座位id',
  `soid` int(11) NOT NULL COMMENT '座位订单id',
  `starttime` datetime NOT NULL COMMENT '开始被占用时间',
  `endtime` datetime NOT NULL COMMENT '结束被占用时间',
  PRIMARY KEY (`id`),
  KEY `seat_schedule_fk2` (`soid`),
  KEY `seat_schedule_fk1` (`sid`),
  CONSTRAINT `seat_schedule_fk1` FOREIGN KEY (`sid`) REFERENCES `seat` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `seat_schedule_fk2` FOREIGN KEY (`soid`) REFERENCES `seat_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COMMENT='记录座位被占用时间表相关记录';

-- ----------------------------
-- Records of seat_schedule
-- ----------------------------
INSERT INTO `seat_schedule` VALUES ('86', '77', '232', '2018-05-13 18:15:36', '2018-05-13 22:15:36');
INSERT INTO `seat_schedule` VALUES ('87', '27', '240', '2018-05-14 19:25:51', '2018-05-14 21:25:51');
INSERT INTO `seat_schedule` VALUES ('88', '37', '240', '2018-05-14 19:25:51', '2018-05-14 21:25:51');

-- ----------------------------
-- Table structure for `seat_seat_order`
-- ----------------------------
DROP TABLE IF EXISTS `seat_seat_order`;
CREATE TABLE `seat_seat_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sid` int(5) DEFAULT NULL COMMENT '座位id',
  `soid` int(11) NOT NULL COMMENT '订单id',
  PRIMARY KEY (`id`),
  KEY `seat_seat_order_fk1` (`sid`),
  KEY `seat_seat_order_fk2` (`soid`),
  CONSTRAINT `seat_seat_order_fk1` FOREIGN KEY (`sid`) REFERENCES `seat` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `seat_seat_order_fk2` FOREIGN KEY (`soid`) REFERENCES `seat_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seat_seat_order
-- ----------------------------
INSERT INTO `seat_seat_order` VALUES ('71', '1', '196');
INSERT INTO `seat_seat_order` VALUES ('72', '2', '196');
INSERT INTO `seat_seat_order` VALUES ('73', '2', '208');
INSERT INTO `seat_seat_order` VALUES ('74', '12', '208');
INSERT INTO `seat_seat_order` VALUES ('75', '33', '209');
INSERT INTO `seat_seat_order` VALUES ('76', '36', '210');
INSERT INTO `seat_seat_order` VALUES ('77', '36', '212');
INSERT INTO `seat_seat_order` VALUES ('78', '37', '212');
INSERT INTO `seat_seat_order` VALUES ('79', '77', '219');
INSERT INTO `seat_seat_order` VALUES ('80', '78', '219');
INSERT INTO `seat_seat_order` VALUES ('81', '87', '219');
INSERT INTO `seat_seat_order` VALUES ('82', '88', '219');
INSERT INTO `seat_seat_order` VALUES ('83', '61', '220');
INSERT INTO `seat_seat_order` VALUES ('84', '71', '220');
INSERT INTO `seat_seat_order` VALUES ('85', '62', '223');
INSERT INTO `seat_seat_order` VALUES ('86', '72', '223');
INSERT INTO `seat_seat_order` VALUES ('87', '77', '232');
INSERT INTO `seat_seat_order` VALUES ('88', '27', '240');
INSERT INTO `seat_seat_order` VALUES ('89', '37', '240');

-- ----------------------------
-- Table structure for `seat_type`
-- ----------------------------
DROP TABLE IF EXISTS `seat_type`;
CREATE TABLE `seat_type` (
  `id` int(2) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '座位类型',
  `capacity` int(2) NOT NULL COMMENT '允许最大就餐人数',
  `duration` int(10) DEFAULT NULL COMMENT '记录就餐时间长度（单位：分钟）',
  `cash` int(11) NOT NULL COMMENT '押金',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用来存储座位类型信息';

-- ----------------------------
-- Records of seat_type
-- ----------------------------
INSERT INTO `seat_type` VALUES ('1', '两人座', '2', '60', '10');
INSERT INTO `seat_type` VALUES ('2', '四人座', '4', '120', '20');
INSERT INTO `seat_type` VALUES ('3', '八人座', '8', '240', '50');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码，加密存储',
  `nickname` varchar(20) NOT NULL COMMENT '昵称',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `created` datetime NOT NULL COMMENT '创建时间',
  `updated` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'shizu', '1111111111', '610801272@qq.com', '2018-03-30 17:03:55', '2018-03-30 17:03:55');
INSERT INTO `user` VALUES ('10', 'customer', '91ec1f9324753048c0096d036a694f86', 'customer', '13565236521', '13565236521@qq.com', '2018-05-01 14:07:32', '2018-05-01 14:07:32');
INSERT INTO `user` VALUES ('11', 'pengyiqun123', '5cc9d1400a7245d0dda12cfc284167b0', '彭轶群', '13568523323', '13568523323@qq.com', '2018-05-03 11:32:19', '2018-05-03 11:32:19');
INSERT INTO `user` VALUES ('12', 'pengyiqun', '2faa712ad68ffd2307f42ae80ffaa02e', 'conausu', '13852532222', '13852532222@qq.com', '2018-05-03 11:46:25', '2018-05-03 11:46:25');

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_role_fk1` (`uid`),
  KEY `user_role_fk2` (`rid`),
  CONSTRAINT `user_role_fk1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`),
  CONSTRAINT `user_role_fk2` FOREIGN KEY (`rid`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('6', '1', '1');
INSERT INTO `user_role` VALUES ('11', '10', '2');
INSERT INTO `user_role` VALUES ('12', '11', '2');
INSERT INTO `user_role` VALUES ('13', '12', '2');

-- ----------------------------
-- Table structure for `vip`
-- ----------------------------
DROP TABLE IF EXISTS `vip`;
CREATE TABLE `vip` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) DEFAULT NULL COMMENT '会员编号',
  `point` int(11) DEFAULT '0' COMMENT '会员积分',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `rank` int(11) DEFAULT NULL COMMENT '会员等级',
  PRIMARY KEY (`id`),
  KEY `vip_fk1` (`uid`),
  CONSTRAINT `vip_fk1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vip
-- ----------------------------
INSERT INTO `vip` VALUES ('9', '988', '300', '12', '3');
INSERT INTO `vip` VALUES ('10', '188', '0', '10', '3');

-- ----------------------------
-- Table structure for `vip_rank`
-- ----------------------------
DROP TABLE IF EXISTS `vip_rank`;
CREATE TABLE `vip_rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'vip类型名',
  `discount` float DEFAULT NULL COMMENT '折扣',
  `rate` int(11) DEFAULT NULL COMMENT '每消费1元增长积分数',
  `equal` int(11) DEFAULT NULL COMMENT '1积分可抵多少元',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vip_rank
-- ----------------------------
INSERT INTO `vip_rank` VALUES ('1', 'vip1', '0.9', '1', null);
INSERT INTO `vip_rank` VALUES ('2', 'vip2', '0.8', '2', null);
INSERT INTO `vip_rank` VALUES ('3', 'vip3', '0.7', '3', null);
DROP TRIGGER IF EXISTS `insert_material_trigger`;
DELIMITER ;;
CREATE TRIGGER `insert_material_trigger` AFTER INSERT ON `item_material` FOR EACH ROW begin
   insert into detail(operation,money,time)
               values('3',new.stock*new.price,NOW());
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `update_material_trigger`;
DELIMITER ;;
CREATE TRIGGER `update_material_trigger` AFTER UPDATE ON `item_material` FOR EACH ROW begin
        if new.stock>old.stock 
then
       insert into detail(operation,money,time)
               values('3',(new.stock-old.stock)*new.price,NOW());
end if;

end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `update_item_order_trigger`;
DELIMITER ;;
CREATE TRIGGER `update_item_order_trigger` AFTER UPDATE ON `item_order` FOR EACH ROW begin 
      if new.state='01'
then insert into detail (operation,money,uid,item_order_id,time) values('2',new.total_price,new.uid,new.id,new.order_time);
end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_itemordernum_trigger`;
DELIMITER ;;
CREATE TRIGGER `insert_itemordernum_trigger` AFTER INSERT ON `item_order_num` FOR EACH ROW begin
      update item
set sale=sale+new.num where item.id=new.item_id;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `update_seat_order`;
DELIMITER ;;
CREATE TRIGGER `update_seat_order` AFTER UPDATE ON `seat_order` FOR EACH ROW begin 
      if new.state='01'
then insert into detail (operation,money,uid,seat_order_id,time) values('1',new.cash,new.uid,new.id,new.ordertime);
end if;
end
;;
DELIMITER ;
