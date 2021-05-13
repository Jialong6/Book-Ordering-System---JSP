/*
 Navicat MySQL Data Transfer

 Source Server         : local book
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : jsp_book

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 05/05/2021 21:37:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_book
-- ----------------------------
DROP TABLE IF EXISTS `t_book`;
CREATE TABLE `t_book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `publisher` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `publication_time` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isbn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `pages` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stock` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `catelog_id` int NOT NULL,
  `del` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `language` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_book
-- ----------------------------
BEGIN;
INSERT INTO `t_book` VALUES (1, 'old man and the sea', 'Hemingwei', 'NY press', '2012.08.12', '2233324123', '19.99', '302', '958', 1, 'no', 'eng');
INSERT INTO `t_book` VALUES (2, 'Database Management', 'Xie Dong', 'PSU Library', '2021.01.13', '2233421235', '99.99', '999', '300', 6, 'no', 'eng');
INSERT INTO `t_book` VALUES (3, 'Linear Algebra Done Right', 'Axler', 'PSU Library', '2018.06.27', '4423315233', '29.99', '280', '30', 6, 'no', 'eng');
INSERT INTO `t_book` VALUES (4, 'NY Times', 'Journalists', 'NY Press', '2021.05.02', '3332213521', '3.99', '12', '9928', 5, 'no', 'eng');
INSERT INTO `t_book` VALUES (5, 'Science', 'Scientists', 'Science Press', '2021.04.27', '9982871723', '39.99', '80', '500', 4, 'no', 'eng');
COMMIT;

-- ----------------------------
-- Table structure for t_catelog
-- ----------------------------
DROP TABLE IF EXISTS `t_catelog`;
CREATE TABLE `t_catelog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `introduction` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `del` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_catelog
-- ----------------------------
BEGIN;
INSERT INTO `t_catelog` VALUES (1, 'Fiction', 'These novels inspired me a lot.', 'no');
INSERT INTO `t_catelog` VALUES (2, 'Novel', 'So romantic, I love it', 'yes');
INSERT INTO `t_catelog` VALUES (3, 'Paper', 'I hate reading papers', 'no');
INSERT INTO `t_catelog` VALUES (4, 'Academic Journals', 'Learning new things day by day', 'no');
INSERT INTO `t_catelog` VALUES (5, 'Newspapers', 'Japan will pour the Nuclear polutted water into the ocean??! SOS', 'no');
INSERT INTO `t_catelog` VALUES (6, 'Textbooks', 'Too difficult to read', 'no');
INSERT INTO `t_catelog` VALUES (35, 'Physics', 'i love physics', 'no');
COMMIT;

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `short_text` varchar(255) NOT NULL,
  `score` int NOT NULL,
  `usefulness` varchar(15) NOT NULL DEFAULT '0',
  `isbn` varchar(32) NOT NULL,
  `trustfulness` varchar(15) NOT NULL,
  `user_id` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(32) NOT NULL,
  `age` varchar(32) NOT NULL,
  `address` varchar(32) NOT NULL,
  `tel` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `id_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `del` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
BEGIN;
INSERT INTO `t_customer` VALUES (1, 'sdfdsfdsf', '12344', 'Male', '32', 'NY', '9282832892', 'fddfsfd@google.com', 'dfdfs', 'no');
INSERT INTO `t_customer` VALUES (2, '234', '2321', 'Male', '12', 'abcd', '123456789', '123456@facebook.com', '123', 'no');
INSERT INTO `t_customer` VALUES (3, 'jason', '3322', 'Male', '17', 'CA', '188156789', '01927365@amazon.com', '123456', 'no');
INSERT INTO `t_customer` VALUES (4, 'kk', 'loip', 'Female', '20', 'TX', '190123456', '0917654@microsoft.com', '09876', 'no');
INSERT INTO `t_customer` VALUES (5, 'John', 'qija', 'Male', '17', 'SE', '19903692777', 'qowji887@osu.edu', '20034', 'yes');
INSERT INTO `t_customer` VALUES (6, 'Daniel', 'good', 'Male', '21', 'WS', '258741', '025963@wm.edu', '1234567', 'no');
INSERT INTO `t_customer` VALUES (7, '0326598', 'h092', 'Male', '27', 'OH', '18854646591', '12458230@gmail.com', '0215487', 'no');
INSERT INTO `t_customer` VALUES (8, 'Michiel', 'glad', 'Male', '15', 'PA', '125896324587', '123654778@psu.edu', '0215487', 'yes');
INSERT INTO `t_customer` VALUES (9, 'hua', 'perfect', 'Male', '12', 'NZ', '18876459523', '977851164@qq.com', '012', 'yes');
INSERT INTO `t_customer` VALUES (10, 'Three', '100', 'Male', '18', 'MI', '15578952461', '254987652130@yahoo.com', '789456123', 'no');
INSERT INTO `t_customer` VALUES (11, 'sky', 'fullcredits', 'Female', '21', 'DTW', '1245699954', '3189977938@qq.com', '26589', 'yes');
INSERT INTO `t_customer` VALUES (12, 'Bob', 'manylove', 'Male', '17', 'MD', '8147772867', '52789872@cuhk.edu', '33214', 'no');
INSERT INTO `t_customer` VALUES (18, '1234', '1', 'Male', '12', '11', '22', '33', 'test', 'no');
COMMIT;

-- ----------------------------
-- Table structure for t_manager
-- ----------------------------
DROP TABLE IF EXISTS `t_manager`;
CREATE TABLE `t_manager` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) NOT NULL,
  `userPw` varchar(20) NOT NULL,
  `userRole` varchar(32) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_manager
-- ----------------------------
BEGIN;
INSERT INTO `t_manager` VALUES (1, 'LI', '123456', '0');
INSERT INTO `t_manager` VALUES (2, 'Lee', '123123', '0');
INSERT INTO `t_manager` VALUES (3, 'admin', 'admin', '0');
INSERT INTO `t_manager` VALUES (4, 'database', '123456', '1');
INSERT INTO `t_manager` VALUES (27, '1234', '1', '1');
INSERT INTO `t_manager` VALUES (28, '9876', '9876', '0');
COMMIT;

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `book_id` int NOT NULL,
  `order_num` int NOT NULL,
  `order_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `del` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
BEGIN;
INSERT INTO `t_order` VALUES (1, 2, 1, 1, '2020-06-13', 'yes');
INSERT INTO `t_order` VALUES (2, 1, 1, 1, '2020-06-13', 'yes');
INSERT INTO `t_order` VALUES (3, 3, 1, 1, '2020-06-13', 'yes');
INSERT INTO `t_order` VALUES (4, 3, 1, 1, '2020-06-17', 'no');
INSERT INTO `t_order` VALUES (5, 3, 1, 2, '2020-06-18', 'yes');
INSERT INTO `t_order` VALUES (6, 4, 1, 1, '2020-06-20', 'yes');
INSERT INTO `t_order` VALUES (7, 3, 1, 1, '2020-06-20', 'yes');
INSERT INTO `t_order` VALUES (8, 4, 1, 1, '2020-06-20', 'yes');
INSERT INTO `t_order` VALUES (9, 3, 1, 1, '2020-06-20', 'yes');
INSERT INTO `t_order` VALUES (10, 5, 1, 1, '2020-06-20', 'no');
INSERT INTO `t_order` VALUES (11, 3, 1, 1, '2020-06-20', 'yes');
INSERT INTO `t_order` VALUES (19, 12, 3, 213, '2021-05-02', 'no');
INSERT INTO `t_order` VALUES (20, 7, 2, 985, '2021-05-02', 'no');
INSERT INTO `t_order` VALUES (21, 1, 2, 534, '2021-05-02', 'no');
INSERT INTO `t_order` VALUES (22, 1, 4, 223, '2021-05-02', 'yes');
INSERT INTO `t_order` VALUES (23, 18, 2, 123, '2021-05-02', 'no');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
