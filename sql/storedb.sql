/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50558
 Source Host           : localhost:3306
 Source Schema         : storedb

 Target Server Type    : MySQL
 Target Server Version : 50558
 File Encoding         : 65001

 Date: 15/03/2023 19:36:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel`  (
  `carousel_id` int(11) NOT NULL AUTO_INCREMENT,
  `imgPath` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `describes` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`carousel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of carousel
-- ----------------------------
INSERT INTO `carousel` VALUES (1, 'public/imgs/cms_1.jpg', '123456');
INSERT INTO `carousel` VALUES (2, 'public/imgs/cms_2.jpg', '123456');
INSERT INTO `carousel` VALUES (3, 'public/imgs/cms_3.jpg', '123456');
INSERT INTO `carousel` VALUES (4, 'public/imgs/cms_4.jpg', '123456');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '手机');
INSERT INTO `category` VALUES (2, '智慧屏');
INSERT INTO `category` VALUES (3, '平板');
INSERT INTO `category` VALUES (4, '穿戴');
INSERT INTO `category` VALUES (5, '保护套');
INSERT INTO `category` VALUES (6, '保护膜');
INSERT INTO `category` VALUES (7, '充电器');
INSERT INTO `category` VALUES (8, '充电宝');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `collect_time` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_collect_user_id`(`user_id`) USING BTREE,
  INDEX `FK_collect_id`(`product_id`) USING BTREE,
  CONSTRAINT `FK_collect_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_collect_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (1, 1, 1, 1678261783994);
INSERT INTO `collect` VALUES (2, 1, 5, 1678268436066);
INSERT INTO `collect` VALUES (3, 1, 2, 1678878387793);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_num` int(11) NOT NULL,
  `product_price` double NOT NULL,
  `order_time` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_order_user_id`(`user_id`) USING BTREE,
  INDEX `FK_order_id`(`product_id`) USING BTREE,
  CONSTRAINT `FK_order_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_order_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 11678259738397, 1, 3, 1, 2599, 1678259738397);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_title` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_picture` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` double NOT NULL,
  `product_selling_price` double NOT NULL,
  `product_num` int(11) NOT NULL,
  `product_sales` int(11) NOT NULL,
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `FK_product_category`(`category_id`) USING BTREE,
  CONSTRAINT `FK_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'HUAWEI Pocket S 鸿蒙手机', 1, '时尚多彩 精巧折叠 | 后摄质感人像自拍', '120Hz高帧率流速屏/ 索尼6400万前后六摄 / 6.67\'小孔径全面屏 / 最高可选8GB+256GB大存储 / 高通骁龙730G处理器 / 3D四曲面玻璃机身 / 4500mAh+27W快充 / 多功能NFC', 'public/imgs/phone/HUAWEI Pocket S 鸿蒙手机.png', 6488, 6388, 10, 0);
INSERT INTO `product` VALUES (2, 'HUAWEI Mate 50 Pro', 1, ' 北斗卫星消息 | 超光变XMAGE影像', '双模5G / 三路并发 / 高通骁龙765G / 7nm 5G低功耗处理器 / 120Hz高帧率流速屏 / 6.67\'小孔径全面屏 / 索尼6400万前后六摄 / 最高可选8GB+256GB大存储 / 4500mAh+30W快充 / 3D四曲面玻璃机身 / 多功能NFC', 'public/imgs/phone/HUAWEI Mate 50 Pro.png', 6999, 6699, 10, 0);
INSERT INTO `product` VALUES (3, 'HUAWEI Mate 50 RS 保时捷设计', 1, '北斗卫星消息 | 超微距长焦摄像头', '1亿像素主摄 / 全场景五摄像头 / 四闪光灯 / 3200万自拍 / 10 倍混合光学变焦，50倍数字变焦 / 5260mAh ⼤电量 / 标配 30W疾速快充 / ⼩米⾸款超薄屏下指纹 / 德国莱茵低蓝光认证 / 多功能NFC / 红外万能遥控 / 1216超线性扬声器', 'public/imgs/phone/HUAWEI Mate 50 RS 保时捷设计.png', 12999, 11999, 20, 0);
INSERT INTO `product` VALUES (4, 'HUAWEI Mate Xs 2', 1, '5000mAh超长续航', '5000mAh超长续航 / 高通骁龙439八核处理器 / 4GB+64GB', 'public/imgs/phone/HUAWEI Mate Xs 2.png', 9999, 8999, 20, 0);
INSERT INTO `product` VALUES (5, 'HUAWEI P50', 1, '直屏影像旗舰 | 原色双影像单元', '5000mAh超长续航 / 高通骁龙439八核处理器 / 4GB+64GB / 1200万AI后置相机', 'public/imgs/phone/HUAWEI P50.png', 4988, 4258, 20, 0);
INSERT INTO `product` VALUES (6, 'nova 10 青春版', 1, '亿像素|AI美肤|经典直屏', ' 1.08亿像素超清摄像头|90Hz高刷新率顺滑流畅|美，不止“亿”种', 'public/imgs/phone/nova 10 青春版.png', 1399, 1299, 20, 0);
INSERT INTO `product` VALUES (7, '华为畅享 50 Pro', 1, '5000万AI三摄 | 大容量内存', '千元4800万四摄 | 高通骁龙665 | 小金刚品质保证', 'public/imgs/phone/华为畅享 50 Pro.png', 1699, 1649, 20, 0);
INSERT INTO `product` VALUES (8, '华为畅享 50', 1, '6000mAh大电池 | 影音大屏', '小巧大电量，持久又流畅骁龙8核高性能处理器 | 4000mAh超长续航 | AI人脸解锁 | 整机防泼溅', 'public/imgs/phone/华为畅享 50.png', 1299, 1249, 20, 0);
INSERT INTO `product` VALUES (9, '华为 Vision 智慧屏', 2, '双120Hz鸿鹄画质，HarmonyOS智慧投屏', '75英寸超薄全面屏 4K超高清120Hz高刷智能液晶平板电视机', 'public/imgs/appliance/华为 Vision 智慧屏.webp', 5999, 4949, 10, 0);
INSERT INTO `product` VALUES (10, '华为智慧屏 SE65 MEMC版', 2, '4K超高清，10.7亿色，电影级广色域', '5英寸 4K HDR全面屏液晶电视 MEMC10.7亿色鸿鹄画质|智慧投屏', 'public/imgs/appliance/华为智慧屏 SE65.webp', 3199, 2499, 10, 0);
INSERT INTO `product` VALUES (11, '华为智慧屏 V65 Pro', 2, '120Hz鸿鹄计算画质，Super MiniLED', '人工智能语音系统 | 海量影视内容 | 4K 超高清屏 | 杜比音效 | 64位四核处理器 | 65英寸超薄全面屏 4K超高清智能电视 HDR 双Viid 鸿鹄SuperMiniLED', 'public/imgs/appliance/华为智慧屏 V65 Pro.webp', 10999, 10499, 10, 0);
INSERT INTO `product` VALUES (12, '华为智慧屏 SE55 MEMC版', 2, '4K超高清，10.7亿色，电影级广色域', '人工智能语音系统 | FHD全高清屏 | 64位四核处理器 | 海量片源 |迅晰流畅 55英寸超薄全面屏 4K超高清智能电视 | 钢琴烤漆', 'public/imgs/appliance/华为智慧屏 SE55 MEMC版.webp', 2199, 1799, 10, 0);
INSERT INTO `product` VALUES (13, '华为智慧屏 V 55', 2, '120Hz迅晰流畅，帝瓦雷影院声场', '人工智能 | 大内存 | 杜比音效 | 超窄边 | 55英寸120Hz超薄全面屏4K液晶电视机 帝瓦雷影院声场鸿蒙 | 海量片源 | 纤薄机身| 钢琴烤漆', 'public/imgs/appliance/华为智慧屏 V 55.webp', 5299, 4799, 10, 0);
INSERT INTO `product` VALUES (14, '华为智慧屏S Pro', 2, '120Hz鸿鹄画质，8K解码，震撼音效', '55英寸120Hz4K超高清鸿蒙HarmonyOS游戏电视机', 'public/imgs/appliance/华为智慧屏S Pro.webp', 2999, 2799, 10, 0);
INSERT INTO `product` VALUES (15, '华为智慧屏 SE', 2, '8K解码，MEMC迅晰流畅', '75英寸 超薄电视 8K解码鸿鹄画质 4K超高清MEMC智能液晶电视', 'public/imgs/appliance/华为智慧屏 SE.webp', 6999, 6999, 10, 0);
INSERT INTO `product` VALUES (16, 'HUAWEI MatePad Pro', 3, '120Hz高刷原色全面屏 | 平板远程操控华为电脑', '12.6英寸 120Hz高刷原色全面屏 | 平板远程操控华为电脑', 'public/imgs/appliance/HUAWEI MatePad Pro.webp', 4699, 4399, 20, 10);
INSERT INTO `product` VALUES (17, 'HUAWEI MateBook E', 3, '二合一笔记本丨12.6英寸OLED原色全面屏', '12.6英寸 二合一笔记本丨12.6英寸OLED原色全面屏', 'public/imgs/appliance/HUAWEI MateBook E.webp', 5499, 4699, 20, 8);
INSERT INTO `product` VALUES (18, 'HUAWEI WATCH Buds', 4, 'AI降噪通话，血氧自动检测', '耳机手表二合一 AI降噪通话 黑色真皮表带 血氧监测 综合续航3天', 'public/imgs/appliance/HUAWEI WATCH Buds.webp', 2999, 2999, 20, 7);
INSERT INTO `product` VALUES (19, 'HUAWEI Mate 50 RS 保时捷设计', 5, '保时捷设计 真皮智能视窗保护套', '优选PC材料，强韧张力，经久耐用 / 精选开孔，全面贴合机身 / 手感轻薄细腻，舒适无负担 / 三款颜色可选，彰显个性，与众不同', 'public/imgs/accessory/HUAWEI Mate 50 RS 保时捷设计.webp', 1999, 1999, 20, 10);
INSERT INTO `product` VALUES (20, '华为9 ARE U OK保护壳', 5, '一个与众不同的保护壳', '彰显独特个性 / 轻薄无负担 / 优选PC材料 / 贴合机身 / 潮流五色', 'public/imgs/accessory/protectingShell-Mi-9.png', 49, 39, 20, 10);
INSERT INTO `product` VALUES (21, '华为CC9&华为CC9美图定制版 标准高透贴膜', 6, '高清透亮，耐磨性强', '耐磨性强，防护更出众 / 疏油疏水，有效抗水抗脏污 / 高清透亮，保留了原生屏幕的亮丽颜色和清晰度 / 操作灵敏，智能吸附 / 进口高端PET材质，裸机般手感', 'public/imgs/accessory/protectingMen-Mi-CC9.png', 19, 19, 20, 9);
INSERT INTO `product` VALUES (22, '华为CC9e 标准高透贴膜', 6, '高清透亮，耐磨性强', '耐磨性强，防护更出众 / 疏油疏水，有效抗水抗脏污 / 高清透亮，保留了原生屏幕的亮丽颜色和清晰度 / 操作灵敏，智能吸附 / 进口高端PET材质，裸机般手感', 'public/imgs/accessory/protectingMen-Mi-CC9e.png', 19, 19, 20, 9);
INSERT INTO `product` VALUES (23, '华为USB充电器30W快充版（1A1C）', 7, '多一种接口，多一种选择', '双口输出 / 30W 输出 / 可折叠插脚 / 小巧便携', 'public/imgs/accessory/charger-30w.png', 59, 59, 20, 8);
INSERT INTO `product` VALUES (24, '华为USB充电器快充版（18W）', 7, '安卓、苹果设备均可使用', '支持QC3.0设备充电 / 支持iOS设备充电/ 美观耐用', 'public/imgs/accessory/charger-18w.png', 29, 29, 20, 8);
INSERT INTO `product` VALUES (25, '华为USB充电器60W快充版（6口）', 7, '6口输出，USB-C输出接口', '6口输出 / USB-C输出接口 / 支持QC3.0快充协议 / 总输出功率60W', 'public/imgs/accessory/charger-60w.png', 129, 129, 20, 0);
INSERT INTO `product` VALUES (26, '华为USB充电器36W快充版（2口）', 7, '6多重安全保护，小巧便携', '双USB输出接口 / 支持QC3.0快充协议 / 多重安全保护 / 小巧便携', 'public/imgs/accessory/charger-36w.png', 59, 59, 20, 0);
INSERT INTO `product` VALUES (27, '华为车载充电器快充版', 7, '让爱车成为移动充电站', 'QC3.0 双口输出 / 智能温度控制 / 5重安全保护 / 兼容iOS&Android设备', 'public/imgs/accessory/charger-car.png', 69, 69, 20, 0);
INSERT INTO `product` VALUES (28, '华为车载充电器快充版(37W)', 7, '双口快充，车载充电更安全', '单口27W 快充 / 双口输出 / 多重安全保护', 'public/imgs/accessory/charger-car-37w.png', 49, 49, 20, 0);
INSERT INTO `product` VALUES (29, '华为二合一移动电源（充电器）', 7, '一个设备多种用途', '5000mAh充沛电量 / 多协议快充 / USB 口输出', 'public/imgs/accessory/charger-tio.png', 99, 99, 20, 0);
INSERT INTO `product` VALUES (30, '华为无线充电宝青春版10000mAh', 8, '能量满满，无线有线都能充', '10000mAh大容量 / 支持边充边放 / 有线无线都能充 / 双向快充', 'public/imgs/accessory/charger-10000mAh.png', 129, 129, 20, 8);
INSERT INTO `product` VALUES (31, '华为CC9 Pro/尊享版 撞色飘带保护壳', 5, '全面贴合，无感更舒适', '优选环保PC材质，强韧张力，全面贴合，无感更舒适', 'public/imgs/accessory/protectingShell-Mi-CC9Pro.png', 69, 69, 20, 0);
INSERT INTO `product` VALUES (32, 'Redmi K20系列 幻境之心保护壳', 5, '柔软坚韧,全面贴合', '优质环保材质，柔软坚韧 / 全面贴合，有效抵抗灰尘 / 鲜亮三种颜色可选，为爱机随时换装', 'public/imgs/accessory/protectingShell-RedMi-K20.png', 39, 39, 20, 0);
INSERT INTO `product` VALUES (33, '华为9 SE 街头风保护壳黑色', 5, '个性时尚,细节出众', '个性时尚 / 细节出众 / 纤薄轻巧 / 多彩时尚', 'public/imgs/accessory/protectingShell-Mi-9SE.png', 49, 49, 20, 0);
INSERT INTO `product` VALUES (34, '华为9 街头风保护壳 红色', 5, '个性时尚,细节出众', '时尚多彩 / 细节出众 / 纤薄轻巧 / 是腕带也是支架', 'public/imgs/accessory/protectingShell-Mi-9-red.png', 49, 49, 20, 0);
INSERT INTO `product` VALUES (35, '华为MIX 3 极简保护壳蓝色', 5, '时尚简约设计，手感细腻顺滑', '时尚简约设计，手感细腻顺滑 / 优质环保PC原材料，强韧张力，经久耐用 / 超薄 0.8MM厚度', 'public/imgs/accessory/protectingShell-Mix-3.png', 49, 12.9, 20, 0);

-- ----------------------------
-- Table structure for product_picture
-- ----------------------------
DROP TABLE IF EXISTS `product_picture`;
CREATE TABLE `product_picture`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `product_picture` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_product_id`(`product_id`) USING BTREE,
  CONSTRAINT `FK_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_picture
-- ----------------------------
INSERT INTO `product_picture` VALUES (1, 1, 'public/imgs/phone/picture/HUAWEI Pocket S 鸿蒙手机-1.png', NULL);
INSERT INTO `product_picture` VALUES (2, 1, 'public/imgs/phone/picture/HUAWEI Pocket S 鸿蒙手机-2.png', NULL);
INSERT INTO `product_picture` VALUES (3, 1, 'public/imgs/phone/picture/HUAWEI Pocket S 鸿蒙手机-3.png', NULL);
INSERT INTO `product_picture` VALUES (4, 1, 'public/imgs/phone/picture/HUAWEI Pocket S 鸿蒙手机-4.png', NULL);
INSERT INTO `product_picture` VALUES (5, 1, 'public/imgs/phone/picture/HUAWEI Pocket S 鸿蒙手机-5.png', NULL);
INSERT INTO `product_picture` VALUES (6, 2, 'public/imgs/phone/picture/HUAWEI Mate 50 Pro-1.webp', NULL);
INSERT INTO `product_picture` VALUES (7, 2, 'public/imgs/phone/picture/HUAWEI Mate 50 Pro-1.webp', NULL);
INSERT INTO `product_picture` VALUES (8, 2, 'public/imgs/phone/picture/HUAWEI Mate 50 Pro-3.webp', NULL);
INSERT INTO `product_picture` VALUES (9, 2, 'public/imgs/phone/picture/HUAWEI Mate 50 Pro-4.webp', NULL);
INSERT INTO `product_picture` VALUES (10, 2, 'public/imgs/phone/picture/HUAWEI Mate 50 Pro-5.webp', NULL);
INSERT INTO `product_picture` VALUES (11, 3, 'public/imgs/phone/picture/HUAWEI Mate 50 RS 保时捷设计-1.webp', NULL);
INSERT INTO `product_picture` VALUES (12, 3, 'public/imgs/phone/picture/HUAWEI Mate 50 RS 保时捷设计-2.webp', NULL);
INSERT INTO `product_picture` VALUES (13, 3, 'public/imgs/phone/picture/HUAWEI Mate 50 RS 保时捷设计-3.webp', NULL);
INSERT INTO `product_picture` VALUES (14, 3, 'public/imgs/phone/picture/HUAWEI Mate 50 RS 保时捷设计-4.webp', NULL);
INSERT INTO `product_picture` VALUES (15, 3, 'public/imgs/phone/picture/HUAWEI Mate 50 RS 保时捷设计-5.webp', NULL);
INSERT INTO `product_picture` VALUES (16, 3, 'public/imgs/phone/picture/HUAWEI Mate 50 RS 保时捷设计-6.webp', NULL);
INSERT INTO `product_picture` VALUES (17, 4, 'public/imgs/phone/picture/HUAWEI Mate Xs 2-1.webp', NULL);
INSERT INTO `product_picture` VALUES (18, 4, 'public/imgs/phone/picture/HUAWEI Mate Xs 2-2.webp', NULL);
INSERT INTO `product_picture` VALUES (19, 4, 'public/imgs/phone/picture/HUAWEI Mate Xs 2-3.webp', NULL);
INSERT INTO `product_picture` VALUES (20, 4, 'public/imgs/phone/picture/HUAWEI Mate Xs 2-4.webp', NULL);
INSERT INTO `product_picture` VALUES (21, 4, 'public/imgs/phone/picture/HUAWEI Mate Xs 2-5.webp', NULL);
INSERT INTO `product_picture` VALUES (22, 5, 'public/imgs/phone/picture/HUAWEI P50-1.webp', NULL);
INSERT INTO `product_picture` VALUES (23, 6, 'public/imgs/phone/picture/nova 10 青春版-1.png', NULL);
INSERT INTO `product_picture` VALUES (24, 6, 'public/imgs/phone/picture/nova 10 青春版-2.png', NULL);
INSERT INTO `product_picture` VALUES (25, 6, 'public/imgs/phone/picture/nova 10 青春版-3.png', NULL);
INSERT INTO `product_picture` VALUES (26, 6, 'public/imgs/phone/picture/nova 10 青春版-4.png', NULL);
INSERT INTO `product_picture` VALUES (27, 6, 'public/imgs/phone/picture/nova 10 青春版-5.png', NULL);
INSERT INTO `product_picture` VALUES (28, 7, 'public/imgs/phone/picture/华为畅享 50 Pro-1.webp', NULL);
INSERT INTO `product_picture` VALUES (29, 7, 'public/imgs/phone/picture/华为畅享 50 Pro-2.webp', NULL);
INSERT INTO `product_picture` VALUES (30, 7, 'public/imgs/phone/picture/华为畅享 50 Pro-3.webp', NULL);
INSERT INTO `product_picture` VALUES (31, 7, 'public/imgs/phone/picture/华为畅享 50 Pro-4.webp', NULL);
INSERT INTO `product_picture` VALUES (32, 7, 'public/imgs/phone/picture/华为畅享 50 Pro-5.webp', NULL);
INSERT INTO `product_picture` VALUES (33, 8, 'public/imgs/phone/picture/华为畅享 50-1.webp', NULL);
INSERT INTO `product_picture` VALUES (34, 8, 'public/imgs/phone/picture/华为畅享 50-2.webp', NULL);
INSERT INTO `product_picture` VALUES (35, 8, 'public/imgs/phone/picture/华为畅享 50-3.webp', NULL);
INSERT INTO `product_picture` VALUES (36, 8, 'public/imgs/phone/picture/华为畅享 50-4.webp', NULL);
INSERT INTO `product_picture` VALUES (37, 8, 'public/imgs/phone/picture/华为畅享 50-5.webp', NULL);
INSERT INTO `product_picture` VALUES (38, 9, 'public/imgs/phone/picture/华为 Vision 智慧屏-1.webp', NULL);
INSERT INTO `product_picture` VALUES (39, 9, 'public/imgs/phone/picture/华为 Vision 智慧屏-2.webp', NULL);
INSERT INTO `product_picture` VALUES (40, 9, 'public/imgs/phone/picture/华为 Vision 智慧屏-3.webp', NULL);
INSERT INTO `product_picture` VALUES (41, 9, 'public/imgs/phone/picture/华为 Vision 智慧屏-4.webp', NULL);
INSERT INTO `product_picture` VALUES (42, 10, 'public/imgs/phone/picture/华为智慧屏 SE65-1.webp', NULL);
INSERT INTO `product_picture` VALUES (43, 10, 'public/imgs/phone/picture/华为智慧屏 SE65-2.webp', NULL);
INSERT INTO `product_picture` VALUES (44, 10, 'public/imgs/phone/picture/华为智慧屏 SE65-3.webp', NULL);
INSERT INTO `product_picture` VALUES (45, 10, 'public/imgs/phone/picture/华为智慧屏 SE65-4.webp', NULL);
INSERT INTO `product_picture` VALUES (46, 11, 'public/imgs/phone/picture/华为智慧屏V65 Pro-1.webp', NULL);
INSERT INTO `product_picture` VALUES (47, 11, 'public/imgs/phone/picture/华为智慧屏V65 Pro-2.webp', NULL);
INSERT INTO `product_picture` VALUES (48, 11, 'public/imgs/phone/picture/华为智慧屏V65 Pro-3.webp', NULL);
INSERT INTO `product_picture` VALUES (49, 11, 'public/imgs/phone/picture/华为智慧屏V65 Pro-4.webp', NULL);
INSERT INTO `product_picture` VALUES (50, 12, 'public/imgs/phone/picture/华为智慧屏 SE55 MEMC版-1.webp', NULL);
INSERT INTO `product_picture` VALUES (51, 12, 'public/imgs/phone/picture/华为智慧屏 SE55 MEMC版-2.webp', NULL);
INSERT INTO `product_picture` VALUES (52, 12, 'public/imgs/phone/picture/华为智慧屏 SE55 MEMC版-3.webp', NULL);
INSERT INTO `product_picture` VALUES (53, 13, 'public/imgs/phone/picture/华为智慧屏 V 55-1.webp', NULL);
INSERT INTO `product_picture` VALUES (54, 13, 'public/imgs/phone/picture/华为智慧屏 V 55-2.webp', NULL);
INSERT INTO `product_picture` VALUES (55, 13, 'public/imgs/phone/picture/华为智慧屏 V 55-3.webp', NULL);
INSERT INTO `product_picture` VALUES (56, 14, 'public/imgs/phone/picture/华为智慧屏S Pro-1.webp', NULL);
INSERT INTO `product_picture` VALUES (57, 15, 'public/imgs/phone/picture/华为智慧屏 SE-1.webp', NULL);
INSERT INTO `product_picture` VALUES (58, 16, 'public/imgs/phone/picture/HUAWEI MatePad Pro-1.webp', NULL);
INSERT INTO `product_picture` VALUES (59, 17, 'public/imgs/phone/picture/HUAWEI MateBook E.webp', NULL);
INSERT INTO `product_picture` VALUES (60, 18, 'public/imgs/phone/picture/HUAWEI WATCH Buds-1.webp', NULL);
INSERT INTO `product_picture` VALUES (61, 18, 'public/imgs/phone/picture/HUAWEI WATCH Buds-2.webp', NULL);
INSERT INTO `product_picture` VALUES (62, 18, 'public/imgs/phone/picture/HUAWEI WATCH Buds-3.webp', NULL);
INSERT INTO `product_picture` VALUES (63, 18, 'public/imgs/phone/picture/HUAWEI WATCH Buds-4.webp', NULL);
INSERT INTO `product_picture` VALUES (64, 19, 'public/imgs/phone/picture/HUAWEI Mate 50 RS 保时捷设计-9.webp', NULL);
INSERT INTO `product_picture` VALUES (65, 20, 'public/imgs/phone/picture/protectingShell-Mi-9-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (66, 20, 'public/imgs/phone/picture/protectingShell-Mi-9-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (67, 21, 'public/imgs/phone/picture/protectingMen-Mi-CC9-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (68, 22, 'public/imgs/phone/picture/protectingMen-Mi-CC9e-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (69, 23, 'public/imgs/phone/picture/charger-30w-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (70, 23, 'public/imgs/phone/picture/charger-30w-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (71, 23, 'public/imgs/phone/picture/charger-30w-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (72, 23, 'public/imgs/phone/picture/charger-30w-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (73, 24, 'public/imgs/phone/picture/charger-18w-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (74, 24, 'public/imgs/phone/picture/charger-18w-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (75, 24, 'public/imgs/phone/picture/charger-18w-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (76, 25, 'public/imgs/phone/picture/charger-60w-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (77, 25, 'public/imgs/phone/picture/charger-60w-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (78, 25, 'public/imgs/phone/picture/charger-60w-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (79, 25, 'public/imgs/phone/picture/charger-60w-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (80, 26, 'public/imgs/phone/picture/charger-36w-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (81, 26, 'public/imgs/phone/picture/charger-36w-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (82, 26, 'public/imgs/phone/picture/charger-36w-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (83, 26, 'public/imgs/phone/picture/charger-36w-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (84, 26, 'public/imgs/phone/picture/charger-36w-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (85, 27, 'public/imgs/phone/picture/charger-car-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (86, 27, 'public/imgs/phone/picture/charger-car-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (87, 27, 'public/imgs/phone/picture/charger-car-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (88, 27, 'public/imgs/phone/picture/charger-car-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (89, 27, 'public/imgs/phone/picture/charger-car-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (90, 27, 'public/imgs/phone/picture/charger-car-6.jpg', NULL);
INSERT INTO `product_picture` VALUES (91, 28, 'public/imgs/phone/picture/charger-car-37w-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (92, 28, 'public/imgs/phone/picture/charger-car-37w-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (93, 28, 'public/imgs/phone/picture/charger-car-37w-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (94, 28, 'public/imgs/phone/picture/charger-car-37w-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (95, 28, 'public/imgs/phone/picture/charger-car-37w-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (96, 29, 'public/imgs/phone/picture/charger-tio-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (97, 29, 'public/imgs/phone/picture/charger-tio-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (98, 29, 'public/imgs/phone/picture/charger-tio-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (99, 29, 'public/imgs/phone/picture/charger-tio-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (100, 29, 'public/imgs/phone/picture/charger-tio-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (101, 30, 'public/imgs/phone/picture/charger-10000mAh-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (102, 30, 'public/imgs/phone/picture/charger-10000mAh-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (103, 30, 'public/imgs/phone/picture/charger-10000mAh-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (104, 30, 'public/imgs/phone/picture/charger-10000mAh-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (105, 30, 'public/imgs/phone/picture/charger-10000mAh-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (106, 31, 'public/imgs/phone/picture/protectingShell-Mi-CC9Pro-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (107, 32, 'public/imgs/phone/picture/protectingShell-RedMi-K20-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (108, 33, 'public/imgs/phone/picture/protectingShell-Mi-9SE-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (109, 34, 'public/imgs/phone/picture/protectingShell-Mi-9-red-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (110, 35, 'public/imgs/phone/picture/protectingShell-Mix-3-1.jpg', NULL);

-- ----------------------------
-- Table structure for shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_user_id`(`user_id`) USING BTREE,
  INDEX `FK_shoppingCart_id`(`product_id`) USING BTREE,
  CONSTRAINT `FK_shoppingCart_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of shoppingcart
-- ----------------------------
INSERT INTO `shoppingcart` VALUES (2, 1, 5, 1);
INSERT INTO `shoppingcart` VALUES (3, 1, 2, 1);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userPhoneNumber` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `userName`(`userName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'xiaoqi', 'q123456789', NULL);

SET FOREIGN_KEY_CHECKS = 1;
