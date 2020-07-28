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

 Date: 28/07/2020 17:23:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add permission', 1, 'add_permission');
INSERT INTO `auth_permission` VALUES (2, 'Can change permission', 1, 'change_permission');
INSERT INTO `auth_permission` VALUES (3, 'Can delete permission', 1, 'delete_permission');
INSERT INTO `auth_permission` VALUES (4, 'Can view permission', 1, 'view_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can add group', 2, 'add_group');
INSERT INTO `auth_permission` VALUES (6, 'Can change group', 2, 'change_group');
INSERT INTO `auth_permission` VALUES (7, 'Can delete group', 2, 'delete_group');
INSERT INTO `auth_permission` VALUES (8, 'Can view group', 2, 'view_group');
INSERT INTO `auth_permission` VALUES (9, 'Can add user', 3, 'add_user');
INSERT INTO `auth_permission` VALUES (10, 'Can change user', 3, 'change_user');
INSERT INTO `auth_permission` VALUES (11, 'Can delete user', 3, 'delete_user');
INSERT INTO `auth_permission` VALUES (12, 'Can view user', 3, 'view_user');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add article', 6, 'add_article');
INSERT INTO `auth_permission` VALUES (22, 'Can change article', 6, 'change_article');
INSERT INTO `auth_permission` VALUES (23, 'Can delete article', 6, 'delete_article');
INSERT INTO `auth_permission` VALUES (24, 'Can view article', 6, 'view_article');
INSERT INTO `auth_permission` VALUES (25, 'Can add customer', 7, 'add_customer');
INSERT INTO `auth_permission` VALUES (26, 'Can change customer', 7, 'change_customer');
INSERT INTO `auth_permission` VALUES (27, 'Can delete customer', 7, 'delete_customer');
INSERT INTO `auth_permission` VALUES (28, 'Can view customer', 7, 'view_customer');
INSERT INTO `auth_permission` VALUES (29, 'Can add operator', 8, 'add_operator');
INSERT INTO `auth_permission` VALUES (30, 'Can change operator', 8, 'change_operator');
INSERT INTO `auth_permission` VALUES (31, 'Can delete operator', 8, 'delete_operator');
INSERT INTO `auth_permission` VALUES (32, 'Can view operator', 8, 'view_operator');
INSERT INTO `auth_permission` VALUES (33, 'Can add order', 9, 'add_order');
INSERT INTO `auth_permission` VALUES (34, 'Can change order', 9, 'change_order');
INSERT INTO `auth_permission` VALUES (35, 'Can delete order', 9, 'delete_order');
INSERT INTO `auth_permission` VALUES (36, 'Can view order', 9, 'view_order');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (2, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (1, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'oms', 'article');
INSERT INTO `django_content_type` VALUES (7, 'oms', 'customer');
INSERT INTO `django_content_type` VALUES (8, 'oms', 'operator');
INSERT INTO `django_content_type` VALUES (9, 'oms', 'order');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2020-07-25 01:56:56.848806');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2020-07-25 01:56:58.345806');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2020-07-25 01:57:00.537945');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2020-07-25 01:57:08.420899');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2020-07-25 01:57:09.338425');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2020-07-25 01:57:09.398261');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2020-07-25 01:57:09.989713');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2020-07-25 01:57:10.073455');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2020-07-25 01:57:10.142265');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2020-07-25 01:57:10.832430');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2020-07-25 01:57:11.600372');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2020-07-25 01:57:12.226692');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2020-07-25 01:57:12.270578');
INSERT INTO `django_migrations` VALUES (14, 'oms', '0001_initial', '2020-07-25 01:57:13.731713');
INSERT INTO `django_migrations` VALUES (15, 'sessions', '0001_initial', '2020-07-25 01:57:15.844022');
INSERT INTO `django_migrations` VALUES (16, 'oms', '0002_order_status', '2020-07-25 02:31:54.245297');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for oms_article
-- ----------------------------
DROP TABLE IF EXISTS `oms_article`;
CREATE TABLE `oms_article`  (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for oms_customer
-- ----------------------------
DROP TABLE IF EXISTS `oms_customer`;
CREATE TABLE `oms_customer`  (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oms_customer
-- ----------------------------
INSERT INTO `oms_customer` VALUES (1, '王哈哈');
INSERT INTO `oms_customer` VALUES (2, '贸易仓储部张汉明');
INSERT INTO `oms_customer` VALUES (3, '贸易仓储部张汉明');

-- ----------------------------
-- Table structure for oms_operator
-- ----------------------------
DROP TABLE IF EXISTS `oms_operator`;
CREATE TABLE `oms_operator`  (
  `operator_id` int(11) NOT NULL AUTO_INCREMENT,
  `operator_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`operator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oms_operator
-- ----------------------------
INSERT INTO `oms_operator` VALUES (1, '张三');
INSERT INTO `oms_operator` VALUES (2, '张三322222');
INSERT INTO `oms_operator` VALUES (3, '张三');

-- ----------------------------
-- Table structure for oms_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_order`;
CREATE TABLE `oms_order`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `result` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `operator_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `oms_order_customer_id_3056ffc2_fk_oms_customer_customer_id`(`customer_id`) USING BTREE,
  INDEX `oms_order_operator_id_81d4516a_fk_oms_operator_operator_id`(`operator_id`) USING BTREE,
  CONSTRAINT `oms_order_customer_id_3056ffc2_fk_oms_customer_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `oms_customer` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `oms_order_operator_id_81d4516a_fk_oms_operator_operator_id` FOREIGN KEY (`operator_id`) REFERENCES `oms_operator` (`operator_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oms_order
-- ----------------------------
INSERT INTO `oms_order` VALUES (67, '我时一个新工单1', '已处理', '2020-07-27 08:48:03.000000', '2020-07-28 15:44:21.636196', 1, 3, 0);
INSERT INTO `oms_order` VALUES (68, '我时一个新工单2', '已处理', '2020-07-28 08:48:03.898916', '2020-07-28 15:44:22.981601', 2, 3, 0);
INSERT INTO `oms_order` VALUES (69, '我时一个新工单3', '已处理', '2020-07-28 10:25:32.021220', '2020-07-28 15:44:24.526468', 2, 3, 0);
INSERT INTO `oms_order` VALUES (70, '我时一个新工单4', '已处理', '2020-07-28 10:32:53.642514', '2020-07-28 15:01:16.945250', 2, 3, 1);
INSERT INTO `oms_order` VALUES (71, '我时一个新工单5', '已处理', '2020-07-28 10:32:53.810068', '2020-07-28 15:01:18.074231', 2, 3, 1);
INSERT INTO `oms_order` VALUES (72, '我时一个新工单6', '已处理', '2020-07-28 10:32:54.013524', '2020-07-28 15:46:08.359865', 2, 3, 0);
INSERT INTO `oms_order` VALUES (73, '我时一个新工单7', '已处理', '2020-07-28 10:32:54.234930', '2020-07-28 15:01:19.977146', 2, 3, 1);
INSERT INTO `oms_order` VALUES (74, '我时一个新工单8', '已处理', '2020-07-20 10:32:54.000000', '2020-07-28 15:01:21.389383', 2, 3, 1);
INSERT INTO `oms_order` VALUES (75, '我时一个新工单9', '已处理', '2020-07-21 10:32:54.000000', '2020-07-28 15:01:23.388023', 2, 3, 1);
INSERT INTO `oms_order` VALUES (76, '我时一个新工单10', '已处理', '2020-07-22 10:32:54.000000', '2020-07-28 15:01:24.681564', 2, 3, 1);
INSERT INTO `oms_order` VALUES (77, '我时一个新工单', '已处理', '2020-07-22 10:49:55.000000', '2020-07-28 10:50:03.095658', 2, 3, 1);
INSERT INTO `oms_order` VALUES (78, '我时一个新工单', '已处理', '2020-07-23 10:55:52.000000', '2020-07-28 15:01:27.545944', 2, 3, 1);
INSERT INTO `oms_order` VALUES (79, '我时一个新工单', '已处理', '2020-07-24 10:59:10.000000', '2020-07-28 15:01:28.295902', 2, 3, 1);
INSERT INTO `oms_order` VALUES (80, '我时一个新工单', '已处理', '2020-07-24 14:34:29.000000', '2020-07-28 15:01:28.958133', 2, 3, 1);
INSERT INTO `oms_order` VALUES (81, '我时一个新工单', '已处理', '2020-07-24 14:34:29.000000', '2020-07-28 15:01:29.349086', 2, 3, 1);
INSERT INTO `oms_order` VALUES (82, '我时一个新工单', '已处理', '2020-07-24 14:34:29.000000', '2020-07-28 15:01:29.851743', 2, 3, 1);
INSERT INTO `oms_order` VALUES (83, '我时一个新工单', '已处理', '2020-07-25 14:34:29.000000', '2020-07-28 15:01:31.047546', 2, 3, 1);
INSERT INTO `oms_order` VALUES (84, '我时一个新工单', '已处理', '2020-07-25 14:34:29.000000', '2020-07-28 15:01:35.082757', 2, 3, 1);
INSERT INTO `oms_order` VALUES (85, '我时一个新工单', '已处理', '2020-07-26 14:34:30.000000', '2020-07-28 15:01:33.356372', 2, 3, 1);
INSERT INTO `oms_order` VALUES (86, '我时一个新工单', '已处理', '2020-07-26 14:34:30.000000', '2020-07-28 15:01:36.811135', 2, 3, 1);
INSERT INTO `oms_order` VALUES (87, '我时一个新工单', '已处理', '2020-07-26 14:34:30.000000', '2020-07-28 15:01:39.906878', 2, 3, 1);
INSERT INTO `oms_order` VALUES (88, '我时一个新工单', '已处理', '2020-07-27 14:34:30.000000', '2020-07-28 15:01:40.308806', 2, 3, 1);
INSERT INTO `oms_order` VALUES (89, '我时一个新工单', '已处理', '2020-07-27 14:34:30.000000', '2020-07-28 15:01:41.566442', 2, 3, 1);
INSERT INTO `oms_order` VALUES (90, '我时一个新工单', '已处理', '2020-07-28 14:34:30.899188', '2020-07-28 15:01:41.918503', 2, 3, 1);
INSERT INTO `oms_order` VALUES (91, '我时一个新工单', '已处理', '2020-07-28 14:34:31.066741', '2020-07-28 17:19:26.453968', 2, 3, 0);
INSERT INTO `oms_order` VALUES (92, '我时一个新工单', '已处理', '2020-07-28 14:34:31.225325', '2020-07-28 15:25:56.408520', 2, 3, 1);
INSERT INTO `oms_order` VALUES (93, '我时一个新工单', '已处理', '2020-07-28 14:34:31.431765', '2020-07-28 15:25:58.119947', 2, 3, 1);
INSERT INTO `oms_order` VALUES (94, '我时一个新工单', '已处理', '2020-07-28 14:34:31.558436', '2020-07-28 17:19:24.365552', 2, 3, 0);
INSERT INTO `oms_order` VALUES (95, '我时一个新工单', '已处理', '2020-07-28 14:34:31.796789', '2020-07-28 17:19:25.625185', 2, 3, 0);

SET FOREIGN_KEY_CHECKS = 1;
