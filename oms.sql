/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50703
 Source Host           : localhost:3306
 Source Schema         : oms

 Target Server Type    : MySQL
 Target Server Version : 50703
 File Encoding         : 65001

 Date: 04/08/2020 09:54:17
*/
-- ----------------------------
-- Records of oms_customer
-- ----------------------------
INSERT INTO `oms_customer` VALUES (1, '客户一号');
INSERT INTO `oms_customer` VALUES (28, '我是客户名称2');
INSERT INTO `oms_customer` VALUES (29, '我是客户名称3');
INSERT INTO `oms_customer` VALUES (30, '我是客户名称4');
INSERT INTO `oms_customer` VALUES (31, '我是客户名称5');
INSERT INTO `oms_customer` VALUES (32, '我是客户名称6');
INSERT INTO `oms_customer` VALUES (33, '我是客户名称7');
INSERT INTO `oms_customer` VALUES (34, '我是客户名称8');
INSERT INTO `oms_customer` VALUES (35, '我是客户名称9');

-- ----------------------------
-- Table structure for oms_operator
-- ----------------------------
DROP TABLE IF EXISTS `oms_operator`;
CREATE TABLE `oms_operator`  (
  `operator_id` int(11) NOT NULL AUTO_INCREMENT,
  `operator_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`operator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oms_operator
-- ----------------------------
INSERT INTO `oms_operator` VALUES (1, '维修工1号');
INSERT INTO `oms_operator` VALUES (8, '维修工2');
INSERT INTO `oms_operator` VALUES (9, '维修工3');
INSERT INTO `oms_operator` VALUES (10, '维修工4');
INSERT INTO `oms_operator` VALUES (11, '维修工5');
INSERT INTO `oms_operator` VALUES (12, '维修工6');
INSERT INTO `oms_operator` VALUES (13, '维修工6');
INSERT INTO `oms_operator` VALUES (14, '维修工8');

-- ----------------------------
-- Table structure for oms_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_order`;
CREATE TABLE `oms_order`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `result` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `operator_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `oms_order_customer_id_3056ffc2_fk_oms_customer_customer_id`(`customer_id`) USING BTREE,
  INDEX `oms_order_operator_id_81d4516a_fk_oms_operator_operator_id`(`operator_id`) USING BTREE,
  CONSTRAINT `oms_order_customer_id_3056ffc2_fk_oms_customer_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `oms_customer` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `oms_order_operator_id_81d4516a_fk_oms_operator_operator_id` FOREIGN KEY (`operator_id`) REFERENCES `oms_operator` (`operator_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 171 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oms_order
-- ----------------------------
INSERT INTO `oms_order` VALUES (101, '我是一个新工单1', '已处理', 1, '2020-07-23 00:00:00.000000', '2020-07-30 15:38:09.369805', 1, 1);
INSERT INTO `oms_order` VALUES (102, '我是一个新工单2', '已处理', 1, '2020-07-23 00:00:00.000000', '2020-07-30 15:45:09.605397', 1, 1);
INSERT INTO `oms_order` VALUES (103, '我是一个新工单3', '已处理', 1, '2020-07-23 00:00:00.000000', '2020-07-30 15:45:11.308843', 1, 1);
INSERT INTO `oms_order` VALUES (104, '我是一个新工单4', '已处理', 1, '2020-07-23 00:00:00.000000', '2020-07-30 15:38:08.652720', 1, 1);
INSERT INTO `oms_order` VALUES (105, '我是一个新工单5', '已处理', 1, '2020-07-23 00:00:00.000000', '2020-07-30 15:45:12.700124', 1, 1);
INSERT INTO `oms_order` VALUES (106, '我是一个新工单6', '已处理', 1, '2020-07-23 00:00:00.000000', '2020-07-30 15:45:05.824543', 1, 1);
INSERT INTO `oms_order` VALUES (107, '我是一个新工单7', '已处理', 1, '2020-07-23 00:00:00.000000', '2020-07-30 15:45:05.070520', 1, 1);
INSERT INTO `oms_order` VALUES (108, '我是一个新工单8', '已处理', 1, '2020-07-23 00:00:00.000000', '2020-07-30 15:45:04.606766', 1, 1);
INSERT INTO `oms_order` VALUES (109, '我是一个新工单9', '已处理', 1, '2020-07-23 00:00:00.000000', '2020-07-30 15:37:30.213482', 1, 1);
INSERT INTO `oms_order` VALUES (110, '我是一个新工单10', '已处理', 1, '2020-07-23 00:00:00.000000', '2020-07-30 15:45:03.902642', 1, 1);
INSERT INTO `oms_order` VALUES (111, '我是一个新工单11', '已处理', 1, '2020-07-23 00:00:00.000000', '2020-07-30 15:37:31.253700', 1, 1);
INSERT INTO `oms_order` VALUES (112, '我是一个新工单12', '已处理', 1, '2020-07-23 00:00:00.000000', '2020-07-30 15:38:13.321241', 1, 1);
INSERT INTO `oms_order` VALUES (113, '我是一个新工单13', '已处理', 1, '2020-07-23 00:00:00.000000', '2020-07-30 15:38:11.808284', 1, 1);
INSERT INTO `oms_order` VALUES (114, '我是一个新工单14', '已处理', 1, '2020-07-23 00:00:00.000000', '2020-07-30 15:38:14.522031', 1, 1);
INSERT INTO `oms_order` VALUES (116, '我是一个新工单16', '已处理', 1, '2020-07-24 00:00:00.000000', '2020-07-30 15:45:01.180918', 1, 1);
INSERT INTO `oms_order` VALUES (117, '我是一个新工单17', '已处理', 1, '2020-07-24 00:00:00.000000', '2020-07-30 15:37:27.360108', 1, 1);
INSERT INTO `oms_order` VALUES (118, '我是一个新工单18', '已处理', 1, '2020-07-24 00:00:00.000000', '2020-07-30 15:37:28.168946', 1, 1);
INSERT INTO `oms_order` VALUES (119, '我是一个新工单19', '已处理', 1, '2020-07-24 00:00:00.000000', '2020-07-30 15:37:26.567254', 1, 1);
INSERT INTO `oms_order` VALUES (120, '我是一个新工单20', '已处理', 1, '2020-07-25 00:00:00.000000', '2020-07-30 15:37:54.842671', 1, 1);
INSERT INTO `oms_order` VALUES (121, '我是一个新工单21', '已处理', 1, '2020-07-25 00:00:00.000000', '2020-07-30 15:37:54.109600', 1, 1);
INSERT INTO `oms_order` VALUES (122, '我是一个新工单22', '已处理', 1, '2020-07-25 00:00:00.000000', '2020-07-30 15:44:47.398762', 1, 1);
INSERT INTO `oms_order` VALUES (123, '我是一个新工单23', '已处理', 1, '2020-07-25 00:00:00.000000', '2020-07-30 15:44:48.121832', 1, 1);
INSERT INTO `oms_order` VALUES (124, '我是一个新工单24', '已处理', 1, '2020-07-25 00:00:00.000000', '2020-07-30 15:37:20.801643', 1, 1);
INSERT INTO `oms_order` VALUES (125, '我是一个新工单25', '已处理', 1, '2020-07-25 00:00:00.000000', '2020-07-30 15:44:49.398420', 1, 1);
INSERT INTO `oms_order` VALUES (126, '我是一个新工单26', '已处理', 1, '2020-07-25 00:00:00.000000', '2020-07-30 15:37:56.238906', 1, 1);
INSERT INTO `oms_order` VALUES (127, '我是一个新工单27', '已处理', 1, '2020-07-25 00:00:00.000000', '2020-07-30 15:44:51.454920', 1, 1);
INSERT INTO `oms_order` VALUES (128, '我是一个新工单28', '已处理', 1, '2020-07-25 00:00:00.000000', '2020-07-30 15:37:58.796072', 1, 1);
INSERT INTO `oms_order` VALUES (129, '我是一个新工单29', '已处理', 1, '2020-07-25 00:00:00.000000', '2020-07-30 15:44:56.049635', 1, 1);
INSERT INTO `oms_order` VALUES (130, '我是一个新工单30', '已处理', 1, '2020-07-25 00:00:00.000000', '2020-07-30 15:44:55.181956', 1, 1);
INSERT INTO `oms_order` VALUES (131, '我是一个新工单31', '已处理', 1, '2020-07-25 00:00:00.000000', '2020-07-30 15:37:23.160336', 1, 1);
INSERT INTO `oms_order` VALUES (132, '我是一个新工单32', '已处理', 1, '2020-07-25 00:00:00.000000', '2020-07-30 15:38:03.140455', 1, 1);
INSERT INTO `oms_order` VALUES (133, '我是一个新工单33', '已处理', 1, '2020-07-25 00:00:00.000000', '2020-07-30 15:37:24.511723', 1, 1);
INSERT INTO `oms_order` VALUES (134, '我是一个新工单34', '已处理', 1, '2020-07-25 00:00:00.000000', '2020-07-30 15:38:03.972232', 1, 1);
INSERT INTO `oms_order` VALUES (135, '我是一个新工单35', '已处理', 1, '2020-07-25 00:00:00.000000', '2020-07-30 15:44:58.375418', 1, 1);
INSERT INTO `oms_order` VALUES (136, '我是一个新工单36', '已处理', 1, '2020-07-25 00:00:00.000000', '2020-07-30 15:38:05.097227', 1, 1);
INSERT INTO `oms_order` VALUES (137, '我是一个新工单37', '已处理', 1, '2020-07-25 00:00:00.000000', '2020-07-30 15:38:02.114201', 1, 1);
INSERT INTO `oms_order` VALUES (138, '我是一个新工单38', '已处理', 1, '2020-07-25 00:00:00.000000', '2020-07-30 15:38:06.536380', 1, 1);
INSERT INTO `oms_order` VALUES (139, '我是一个新工单39', '已处理', 1, '2020-07-25 00:00:00.000000', '2020-07-30 15:45:01.873069', 1, 1);
INSERT INTO `oms_order` VALUES (149, '我是一个新工单40', '已处理', 1, '2020-07-27 00:00:00.000000', '2020-07-30 15:44:37.457339', 1, 1);
INSERT INTO `oms_order` VALUES (151, '我是一个新工单42', '已处理', 0, '2020-07-27 00:00:00.000000', '2020-08-01 10:58:56.371166', 1, 1);
INSERT INTO `oms_order` VALUES (152, '我是一个新工单43', '已处理', 1, '2020-07-27 00:00:00.000000', '2020-07-31 08:35:09.679099', 1, 1);
INSERT INTO `oms_order` VALUES (153, '我是一个新工单44', '已处理', 1, '2020-07-27 00:00:00.000000', '2020-07-30 15:44:38.617247', 1, 1);
INSERT INTO `oms_order` VALUES (154, '我是一个新工单45', '已处理', 1, '2020-07-27 00:00:00.000000', '2020-07-30 15:37:49.123928', 1, 1);
INSERT INTO `oms_order` VALUES (155, '我是一个新工单46', '已处理', 1, '2020-07-27 00:00:00.000000', '2020-07-30 15:44:39.977636', 1, 1);
INSERT INTO `oms_order` VALUES (156, '我是一个新工单47', '已处理', 1, '2020-07-27 00:00:00.000000', '2020-07-30 15:37:50.771523', 1, 1);
INSERT INTO `oms_order` VALUES (157, '我是一个新工单48', '已处理', 1, '2020-07-27 00:00:00.000000', '2020-07-30 15:44:42.575658', 1, 1);
INSERT INTO `oms_order` VALUES (158, '我是一个新工单49', '已处理', 1, '2020-07-27 00:00:00.000000', '2020-07-30 15:44:46.602891', 1, 1);
INSERT INTO `oms_order` VALUES (159, '我是一个新工单50', '已处理', 0, '2020-07-28 00:00:00.000000', '2020-08-01 10:58:35.428097', 1, 1);
INSERT INTO `oms_order` VALUES (160, '我是一个新工单51', '已处理', 1, '2020-07-28 00:00:00.000000', '2020-07-30 15:44:36.675469', 1, 1);
INSERT INTO `oms_order` VALUES (161, '我是一个新工单', '已处理', 1, '2020-08-04 09:00:58.563158', '2020-08-04 09:14:18.914499', 1, 1);
INSERT INTO `oms_order` VALUES (162, '我是一个新工单', '已处理', 1, '2020-08-04 09:01:58.146805', '2020-08-04 09:14:18.405859', 1, 1);
INSERT INTO `oms_order` VALUES (163, '我是一个新工单', '已处理', 1, '2020-08-04 09:04:00.282164', '2020-08-04 09:14:17.819428', 1, 1);
INSERT INTO `oms_order` VALUES (164, '我是一个新工单', '已处理', 1, '2020-08-04 09:04:23.450204', '2020-08-04 09:14:17.279871', 1, 1);
INSERT INTO `oms_order` VALUES (165, '', '已处理', 1, '2020-08-04 09:09:26.552575', '2020-08-04 09:14:16.605674', 28, 8);
INSERT INTO `oms_order` VALUES (166, '', '已处理', 1, '2020-08-04 09:11:26.333056', '2020-08-04 09:14:15.837727', 31, 11);
INSERT INTO `oms_order` VALUES (167, '', '已处理', 0, '2020-08-04 09:14:34.364180', '2020-08-04 09:14:34.364180', 29, 9);
INSERT INTO `oms_order` VALUES (168, '', '', 0, '2020-08-04 09:17:11.519878', '2020-08-04 09:17:11.519878', 29, 8);
INSERT INTO `oms_order` VALUES (169, '安抚', '', 0, '2020-08-04 09:26:33.530822', '2020-08-04 09:44:32.587956', 28, 1);
INSERT INTO `oms_order` VALUES (170, '发的', '', 0, '2020-08-04 09:28:55.733515', '2020-08-04 09:44:31.836967', 28, 9);

-- ----------------------------
-- Records of oms_order_question
-- ----------------------------
INSERT INTO `oms_order_question` VALUES (1, 170, 40);


-- ----------------------------
-- Records of oms_question
-- ----------------------------
INSERT INTO `oms_question` VALUES (37, '类别1', '问题好多啊1');
INSERT INTO `oms_question` VALUES (38, '类别2', '问题好多啊2');
INSERT INTO `oms_question` VALUES (39, '类别3', '问题好多啊3');
INSERT INTO `oms_question` VALUES (40, '类别4', '问题好多啊4');
INSERT INTO `oms_question` VALUES (41, '类别5', '问题好多啊5');
INSERT INTO `oms_question` VALUES (42, '类别6', '问题好多啊6');
INSERT INTO `oms_question` VALUES (43, '类别7', '问题好多啊7');
INSERT INTO `oms_question` VALUES (44, '类别8', '问题好多啊8');
INSERT INTO `oms_question` VALUES (45, '类别9', '问题好多啊9');

SET FOREIGN_KEY_CHECKS = 1;
