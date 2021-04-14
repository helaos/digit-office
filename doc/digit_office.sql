/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : digit_office

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 14/04/2021 21:11:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adjust_salary
-- ----------------------------
DROP TABLE IF EXISTS `adjust_salary`;
CREATE TABLE `adjust_salary`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) NULL DEFAULT NULL,
  `adjust_date` date NULL DEFAULT NULL COMMENT '调薪日期',
  `before_salary` int(11) NULL DEFAULT NULL COMMENT '调前薪资',
  `after_salary` int(11) NULL DEFAULT NULL COMMENT '调后薪资',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调薪原因',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`eid`) USING BTREE,
  CONSTRAINT `adjust_salary_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adjust_salary
-- ----------------------------

-- ----------------------------
-- Table structure for appraise
-- ----------------------------
DROP TABLE IF EXISTS `appraise`;
CREATE TABLE `appraise`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) NULL DEFAULT NULL,
  `appraise_date` date NULL DEFAULT NULL COMMENT '考评日期',
  `appraise_result` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '考评结果',
  `appraise_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '考评内容',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`eid`) USING BTREE,
  CONSTRAINT `appraise_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appraise
-- ----------------------------

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `parent_id` int(11) NULL DEFAULT NULL,
  `dep_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `enabled` tinyint(1) NULL DEFAULT 1,
  `parent` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '股东会', -1, '.1', 1, 1);
INSERT INTO `department` VALUES (4, '董事会', 1, '.1.4', 1, 1);
INSERT INTO `department` VALUES (5, '总办', 4, '.1.4.5', 1, 1);
INSERT INTO `department` VALUES (8, '财务部', 5, '.1.4.5.8', 1, 0);
INSERT INTO `department` VALUES (78, '市场部', 5, '.1.4.5.78', 1, 1);
INSERT INTO `department` VALUES (81, '华北市场部', 78, '.1.4.5.78.81', 1, 1);
INSERT INTO `department` VALUES (82, '华南市场部', 78, '.1.4.5.78.82', 1, 0);
INSERT INTO `department` VALUES (85, '石家庄市场部', 81, '.1.4.5.78.81.85', 1, 0);
INSERT INTO `department` VALUES (86, '西北市场部', 78, '.1.4.5.78.86', 1, 1);
INSERT INTO `department` VALUES (87, '西安市场', 86, '.1.4.5.78.86.87', 1, 1);
INSERT INTO `department` VALUES (89, '莲湖区市场', 87, '.1.4.5.78.86.87.89', 1, 0);
INSERT INTO `department` VALUES (91, '技术部', 5, '.1.4.5.91', 1, 0);
INSERT INTO `department` VALUES (92, '运维部', 5, '.1.4.5.92', 1, 1);
INSERT INTO `department` VALUES (93, '运维1部', 92, '.1.4.5.92.93', 1, 0);
INSERT INTO `department` VALUES (94, '运维2部', 92, '.1.4.5.92.94', 1, 0);
INSERT INTO `department` VALUES (96, 'bbb', 1, '.1.96', 1, 1);
INSERT INTO `department` VALUES (104, '111', 96, '.1.96.104', 1, 0);

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工姓名',
  `gender` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `id_card` char(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `wedlock` enum('已婚','未婚','离异') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '婚姻状况',
  `nation_id` int(8) NULL DEFAULT NULL COMMENT '民族',
  `native_place` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '籍贯',
  `political_status_id` int(8) NULL DEFAULT NULL COMMENT '政治面貌',
  `email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `address` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `department_id` int(11) NULL DEFAULT NULL COMMENT '所属部门',
  `job_level_id` int(11) NULL DEFAULT NULL COMMENT '职称id',
  `position_id` int(11) NULL DEFAULT NULL COMMENT '职位id',
  `engage_form` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '聘用形式',
  `top_degree` enum('博士','硕士','本科','大专','高中','初中','小学','其他') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最高学历',
  `specialty` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属专业',
  `school` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '毕业院校',
  `begin_date` date NULL DEFAULT NULL COMMENT '入职日期',
  `work_state` enum('在职','离职') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '在职' COMMENT '在职状态',
  `work_id` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工号',
  `contract_term` double NULL DEFAULT NULL COMMENT '合同期限',
  `conversion_time` date NULL DEFAULT NULL COMMENT '转正日期',
  `notwork_date` date NULL DEFAULT NULL COMMENT '离职日期',
  `begin_contract` date NULL DEFAULT NULL COMMENT '合同起始日期',
  `end_contract` date NULL DEFAULT NULL COMMENT '合同终止日期',
  `work_age` int(11) NULL DEFAULT NULL COMMENT '工龄',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `department_id`(`department_id`) USING BTREE,
  INDEX `job_level_id`(`job_level_id`) USING BTREE,
  INDEX `position_id`(`position_id`) USING BTREE,
  INDEX `nation_id`(`nation_id`) USING BTREE,
  INDEX `political_status_id`(`political_status_id`) USING BTREE,
  INDEX `work_id_key`(`work_id`) USING BTREE,
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`job_level_id`) REFERENCES `joblevel` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`nation_id`) REFERENCES `nation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_ibfk_5` FOREIGN KEY (`political_status_id`) REFERENCES `politicsstatus` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------

-- ----------------------------
-- Table structure for employee_salary
-- ----------------------------
DROP TABLE IF EXISTS `employee_salary`;
CREATE TABLE `employee_salary`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) NULL DEFAULT NULL,
  `sid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `eid`(`eid`) USING BTREE,
  INDEX `employee_salary_ibfk_2`(`sid`) USING BTREE,
  CONSTRAINT `employee_salary_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_salary_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `salary` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee_salary
-- ----------------------------
INSERT INTO `employee_salary` VALUES (6, 4, 10);
INSERT INTO `employee_salary` VALUES (10, 5, 9);
INSERT INTO `employee_salary` VALUES (11, 6, 13);
INSERT INTO `employee_salary` VALUES (12, 7, 13);
INSERT INTO `employee_salary` VALUES (14, 8, 10);
INSERT INTO `employee_salary` VALUES (15, 9, 10);
INSERT INTO `employee_salary` VALUES (20, 10, 13);
INSERT INTO `employee_salary` VALUES (21, 11, 9);
INSERT INTO `employee_salary` VALUES (22, 3, 13);
INSERT INTO `employee_salary` VALUES (24, 2, 9);
INSERT INTO `employee_salary` VALUES (25, 1, 13);
INSERT INTO `employee_salary` VALUES (26, 33, 10);
INSERT INTO `employee_salary` VALUES (28, 34, 9);
INSERT INTO `employee_salary` VALUES (29, 44, 10);
INSERT INTO `employee_salary` VALUES (30, 45, 10);
INSERT INTO `employee_salary` VALUES (31, 43, 10);
INSERT INTO `employee_salary` VALUES (32, 47, 10);
INSERT INTO `employee_salary` VALUES (33, 52, 13);
INSERT INTO `employee_salary` VALUES (34, 53, 10);
INSERT INTO `employee_salary` VALUES (35, 54, 10);
INSERT INTO `employee_salary` VALUES (36, 56, 10);
INSERT INTO `employee_salary` VALUES (38, 21, 9);

-- ----------------------------
-- Table structure for employee_train
-- ----------------------------
DROP TABLE IF EXISTS `employee_train`;
CREATE TABLE `employee_train`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) NULL DEFAULT NULL COMMENT '员工编号',
  `train_date` date NULL DEFAULT NULL COMMENT '培训日期',
  `train_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '培训内容',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`eid`) USING BTREE,
  CONSTRAINT `employee_train_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee_train
-- ----------------------------

-- ----------------------------
-- Table structure for hr
-- ----------------------------
DROP TABLE IF EXISTS `hr`;
CREATE TABLE `hr`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'HRid',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `telephone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住宅电话',
  `address` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `enabled` tinyint(1) NULL DEFAULT 1,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hr
-- ----------------------------
INSERT INTO `hr` VALUES (3, '系统管理员', '18568887789', '029-82881234', '深圳南山', 1, 'admin', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://tse1-mm.cn.bing.net/th/id/OIP.OkqRjKcirxLDwG5VYQ-2qgAAAA', NULL);
INSERT INTO `hr` VALUES (5, '李白', '18568123489', '029-82123434', '海口美兰', 1, 'libai', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://tse1-mm.cn.bing.net/th?id=OIP.TGtKbITalm6aaUV4mg_-UwAAAA', NULL);
INSERT INTO `hr` VALUES (10, '韩愈', '18568123666', '029-82111555', '广州番禺', 1, 'hanyu', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://tse1-mm.cn.bing.net/th?id=OIP.IRgSLp2eu0FGRZCyDEjAyAAAAA', NULL);
INSERT INTO `hr` VALUES (11, '柳宗元', '18568123377', '029-82111333', '广州天河', 1, 'liuzongyuan', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://tse1-mm.cn.bing.net/th/id/OIP.aZnj3_rbNh6p6VILEOuAUAAAAA', NULL);
INSERT INTO `hr` VALUES (12, '曾巩', '18568128888', '029-82111222', '广州越秀', 1, 'zenggong', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://tse2-mm.cn.bing.net/th/id/OIP.F6mzegJyoKc2d8UlTp3-nwAAAA', NULL);

-- ----------------------------
-- Table structure for hr_role
-- ----------------------------
DROP TABLE IF EXISTS `hr_role`;
CREATE TABLE `hr_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hr_id` int(11) NULL DEFAULT NULL,
  `rid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rid`(`rid`) USING BTREE,
  INDEX `hr_role_ibfk_1`(`hr_id`) USING BTREE,
  CONSTRAINT `hr_role_ibfk_1` FOREIGN KEY (`hr_id`) REFERENCES `hr` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `hr_role_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hr_role
-- ----------------------------
INSERT INTO `hr_role` VALUES (1, 3, 6);
INSERT INTO `hr_role` VALUES (35, 12, 4);
INSERT INTO `hr_role` VALUES (36, 12, 3);
INSERT INTO `hr_role` VALUES (37, 12, 2);
INSERT INTO `hr_role` VALUES (43, 11, 3);
INSERT INTO `hr_role` VALUES (44, 11, 2);
INSERT INTO `hr_role` VALUES (45, 11, 4);
INSERT INTO `hr_role` VALUES (46, 11, 5);
INSERT INTO `hr_role` VALUES (48, 10, 3);
INSERT INTO `hr_role` VALUES (49, 10, 4);
INSERT INTO `hr_role` VALUES (72, 5, 1);
INSERT INTO `hr_role` VALUES (73, 5, 2);
INSERT INTO `hr_role` VALUES (74, 5, 3);

-- ----------------------------
-- Table structure for job_level
-- ----------------------------
DROP TABLE IF EXISTS `job_level`;
CREATE TABLE `job_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职称名称',
  `title_level` enum('正高级','副高级','中级','初级','员级') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `enabled` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job_level
-- ----------------------------
INSERT INTO `job_level` VALUES (9, '教授', '正高级', '2018-01-11 00:00:00', 1);
INSERT INTO `job_level` VALUES (10, '副教授', '副高级', '2018-01-11 21:19:20', 1);
INSERT INTO `job_level` VALUES (12, '助教', '初级', '2018-01-11 21:35:39', 1);
INSERT INTO `job_level` VALUES (13, '讲师', '中级', '2018-01-11 00:00:00', 0);
INSERT INTO `job_level` VALUES (14, '初级工程师', '初级', '2018-01-14 00:00:00', 1);
INSERT INTO `job_level` VALUES (15, '中级工程师66', '中级', '2018-01-14 00:00:00', 1);
INSERT INTO `job_level` VALUES (16, '高级工程师', '副高级', '2018-01-14 16:19:14', 1);
INSERT INTO `job_level` VALUES (17, '骨灰级工程师', '正高级', '2018-01-14 16:19:24', 1);

-- ----------------------------
-- Table structure for mail_send_log
-- ----------------------------
DROP TABLE IF EXISTS `mail_send_log`;
CREATE TABLE `mail_send_log`  (
  `msg_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `eid` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT 0 COMMENT '0发送中，1发送成功，2发送失败',
  `route_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `exchange` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `count` int(11) NULL DEFAULT NULL COMMENT '重试次数',
  `try_time` date NULL DEFAULT NULL COMMENT '第一次重试时间',
  `create_time` date NULL DEFAULT NULL,
  `update_time` date NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mail_send_log
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `path` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `component` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `icon_cls` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `keep_alive` tinyint(1) NULL DEFAULT NULL,
  `require_auth` tinyint(1) NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `enabled` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '/', NULL, NULL, '所有', NULL, NULL, NULL, NULL, 1);
INSERT INTO `menu` VALUES (2, '/', '/home', 'Home', '员工资料', 'fa fa-user-circle-o', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (3, '/', '/home', 'Home', '人事管理', 'fa fa-address-card-o', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (4, '/', '/home', 'Home', '薪资管理', 'fa fa-money', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (5, '/', '/home', 'Home', '统计管理', 'fa fa-bar-chart', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (6, '/', '/home', 'Home', '系统管理', 'fa fa-windows', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (7, '/employee/basic/**', '/emp/basic', 'EmpBasic', '基本资料', NULL, NULL, 1, 2, 1);
INSERT INTO `menu` VALUES (8, '/employee/advanced/**', '/emp/adv', 'EmpAdv', '高级资料', NULL, NULL, 1, 2, 1);
INSERT INTO `menu` VALUES (9, '/personnel/emp/**', '/per/emp', 'PerEmp', '员工资料', NULL, NULL, 1, 3, 1);
INSERT INTO `menu` VALUES (10, '/personnel/ec/**', '/per/ec', 'PerEc', '员工奖惩', NULL, NULL, 1, 3, 1);
INSERT INTO `menu` VALUES (11, '/personnel/train/**', '/per/train', 'PerTrain', '员工培训', NULL, NULL, 1, 3, 1);
INSERT INTO `menu` VALUES (12, '/personnel/salary/**', '/per/salary', 'PerSalary', '员工调薪', NULL, NULL, 1, 3, 1);
INSERT INTO `menu` VALUES (13, '/personnel/remove/**', '/per/mv', 'PerMv', '员工调动', NULL, NULL, 1, 3, 1);
INSERT INTO `menu` VALUES (14, '/salary/sob/**', '/sal/sob', 'SalSob', '工资账套管理', NULL, NULL, 1, 4, 1);
INSERT INTO `menu` VALUES (15, '/salary/sobcfg/**', '/sal/sobcfg', 'SalSobCfg', '员工账套设置', NULL, NULL, 1, 4, 1);
INSERT INTO `menu` VALUES (16, '/salary/table/**', '/sal/table', 'SalTable', '工资表管理', NULL, NULL, 1, 4, 1);
INSERT INTO `menu` VALUES (17, '/salary/month/**', '/sal/month', 'SalMonth', '月末处理', NULL, NULL, 1, 4, 1);
INSERT INTO `menu` VALUES (18, '/salary/search/**', '/sal/search', 'SalSearch', '工资表查询', NULL, NULL, 1, 4, 1);
INSERT INTO `menu` VALUES (19, '/statistics/all/**', '/sta/all', 'StaAll', '综合信息统计', NULL, NULL, 1, 5, 1);
INSERT INTO `menu` VALUES (20, '/statistics/score/**', '/sta/score', 'StaScore', '员工积分统计', NULL, NULL, 1, 5, 1);
INSERT INTO `menu` VALUES (21, '/statistics/personnel/**', '/sta/pers', 'StaPers', '人事信息统计', NULL, NULL, 1, 5, 1);
INSERT INTO `menu` VALUES (22, '/statistics/recored/**', '/sta/record', 'StaRecord', '人事记录统计', NULL, NULL, 1, 5, 1);
INSERT INTO `menu` VALUES (23, '/system/basic/**', '/sys/basic', 'SysBasic', '基础信息设置', NULL, NULL, 1, 6, 1);
INSERT INTO `menu` VALUES (24, '/system/cfg/**', '/sys/cfg', 'SysCfg', '系统管理', NULL, NULL, 1, 6, 1);
INSERT INTO `menu` VALUES (25, '/system/log/**', '/sys/log', 'SysLog', '操作日志管理', NULL, NULL, 1, 6, 1);
INSERT INTO `menu` VALUES (26, '/system/hr/**', '/sys/hr', 'SysHr', '操作员管理', NULL, NULL, 1, 6, 1);
INSERT INTO `menu` VALUES (27, '/system/data/**', '/sys/data', 'SysData', '备份恢复数据库', NULL, NULL, 1, 6, 1);
INSERT INTO `menu` VALUES (28, '/system/init/**', '/sys/init', 'SysInit', '初始化数据库', NULL, NULL, 1, 6, 1);

-- ----------------------------
-- Table structure for menu_role
-- ----------------------------
DROP TABLE IF EXISTS `menu_role`;
CREATE TABLE `menu_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NULL DEFAULT NULL,
  `rid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE,
  INDEX `rid`(`rid`) USING BTREE,
  CONSTRAINT `menu_role_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `menu_role_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 283 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_role
-- ----------------------------
INSERT INTO `menu_role` VALUES (161, 7, 3);
INSERT INTO `menu_role` VALUES (162, 7, 6);
INSERT INTO `menu_role` VALUES (163, 9, 6);
INSERT INTO `menu_role` VALUES (164, 10, 6);
INSERT INTO `menu_role` VALUES (165, 11, 6);
INSERT INTO `menu_role` VALUES (166, 12, 6);
INSERT INTO `menu_role` VALUES (167, 13, 6);
INSERT INTO `menu_role` VALUES (168, 14, 6);
INSERT INTO `menu_role` VALUES (169, 15, 6);
INSERT INTO `menu_role` VALUES (170, 16, 6);
INSERT INTO `menu_role` VALUES (171, 17, 6);
INSERT INTO `menu_role` VALUES (172, 18, 6);
INSERT INTO `menu_role` VALUES (173, 19, 6);
INSERT INTO `menu_role` VALUES (174, 20, 6);
INSERT INTO `menu_role` VALUES (175, 21, 6);
INSERT INTO `menu_role` VALUES (176, 22, 6);
INSERT INTO `menu_role` VALUES (177, 23, 6);
INSERT INTO `menu_role` VALUES (178, 25, 6);
INSERT INTO `menu_role` VALUES (179, 26, 6);
INSERT INTO `menu_role` VALUES (180, 27, 6);
INSERT INTO `menu_role` VALUES (181, 28, 6);
INSERT INTO `menu_role` VALUES (182, 24, 6);
INSERT INTO `menu_role` VALUES (247, 7, 4);
INSERT INTO `menu_role` VALUES (248, 8, 4);
INSERT INTO `menu_role` VALUES (249, 11, 4);
INSERT INTO `menu_role` VALUES (250, 7, 2);
INSERT INTO `menu_role` VALUES (251, 8, 2);
INSERT INTO `menu_role` VALUES (252, 9, 2);
INSERT INTO `menu_role` VALUES (253, 10, 2);
INSERT INTO `menu_role` VALUES (254, 12, 2);
INSERT INTO `menu_role` VALUES (255, 13, 2);
INSERT INTO `menu_role` VALUES (256, 7, 1);
INSERT INTO `menu_role` VALUES (257, 8, 1);
INSERT INTO `menu_role` VALUES (258, 9, 1);
INSERT INTO `menu_role` VALUES (259, 10, 1);
INSERT INTO `menu_role` VALUES (260, 11, 1);
INSERT INTO `menu_role` VALUES (261, 12, 1);
INSERT INTO `menu_role` VALUES (262, 13, 1);
INSERT INTO `menu_role` VALUES (263, 14, 1);
INSERT INTO `menu_role` VALUES (264, 15, 1);
INSERT INTO `menu_role` VALUES (265, 16, 1);
INSERT INTO `menu_role` VALUES (266, 17, 1);
INSERT INTO `menu_role` VALUES (267, 18, 1);
INSERT INTO `menu_role` VALUES (268, 19, 1);
INSERT INTO `menu_role` VALUES (269, 20, 1);
INSERT INTO `menu_role` VALUES (270, 21, 1);
INSERT INTO `menu_role` VALUES (271, 22, 1);
INSERT INTO `menu_role` VALUES (272, 23, 1);
INSERT INTO `menu_role` VALUES (273, 24, 1);
INSERT INTO `menu_role` VALUES (274, 25, 1);
INSERT INTO `menu_role` VALUES (275, 26, 1);
INSERT INTO `menu_role` VALUES (276, 27, 1);
INSERT INTO `menu_role` VALUES (277, 28, 1);
INSERT INTO `menu_role` VALUES (280, 7, 14);
INSERT INTO `menu_role` VALUES (281, 8, 14);
INSERT INTO `menu_role` VALUES (282, 9, 14);

-- ----------------------------
-- Table structure for msg_content
-- ----------------------------
DROP TABLE IF EXISTS `msg_content`;
CREATE TABLE `msg_content`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of msg_content
-- ----------------------------
INSERT INTO `msg_content` VALUES (14, '2222222222', '11111111111111111', '2018-02-02 20:46:19');
INSERT INTO `msg_content` VALUES (15, '22222222', '3333333333333333333333', '2018-02-02 21:45:57');
INSERT INTO `msg_content` VALUES (16, '通知标题1', '通知内容1', '2018-02-03 11:41:39');
INSERT INTO `msg_content` VALUES (17, '通知标题2', '通知内容2', '2018-02-03 11:52:37');
INSERT INTO `msg_content` VALUES (18, '通知标题3', '通知内容3', '2018-02-03 12:19:41');

-- ----------------------------
-- Table structure for nation
-- ----------------------------
DROP TABLE IF EXISTS `nation`;
CREATE TABLE `nation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nation
-- ----------------------------
INSERT INTO `nation` VALUES (1, '汉族');
INSERT INTO `nation` VALUES (2, '蒙古族');
INSERT INTO `nation` VALUES (3, '回族');
INSERT INTO `nation` VALUES (4, '藏族');
INSERT INTO `nation` VALUES (5, '维吾尔族');
INSERT INTO `nation` VALUES (6, '苗族');
INSERT INTO `nation` VALUES (7, '彝族');
INSERT INTO `nation` VALUES (8, '壮族');
INSERT INTO `nation` VALUES (9, '布依族');
INSERT INTO `nation` VALUES (10, '朝鲜族');
INSERT INTO `nation` VALUES (11, '满族');
INSERT INTO `nation` VALUES (12, '侗族');
INSERT INTO `nation` VALUES (13, '瑶族');
INSERT INTO `nation` VALUES (14, '白族');
INSERT INTO `nation` VALUES (15, '土家族');
INSERT INTO `nation` VALUES (16, '哈尼族');
INSERT INTO `nation` VALUES (17, '哈萨克族');
INSERT INTO `nation` VALUES (18, '傣族');
INSERT INTO `nation` VALUES (19, '黎族');
INSERT INTO `nation` VALUES (20, '傈僳族');
INSERT INTO `nation` VALUES (21, '佤族');
INSERT INTO `nation` VALUES (22, '畲族');
INSERT INTO `nation` VALUES (23, '高山族');
INSERT INTO `nation` VALUES (24, '拉祜族');
INSERT INTO `nation` VALUES (25, '水族');
INSERT INTO `nation` VALUES (26, '东乡族');
INSERT INTO `nation` VALUES (27, '纳西族');
INSERT INTO `nation` VALUES (28, '景颇族');
INSERT INTO `nation` VALUES (29, '柯尔克孜族');
INSERT INTO `nation` VALUES (30, '土族');
INSERT INTO `nation` VALUES (31, '达斡尔族');
INSERT INTO `nation` VALUES (32, '仫佬族');
INSERT INTO `nation` VALUES (33, '羌族');
INSERT INTO `nation` VALUES (34, '布朗族');
INSERT INTO `nation` VALUES (35, '撒拉族');
INSERT INTO `nation` VALUES (36, '毛难族');
INSERT INTO `nation` VALUES (37, '仡佬族');
INSERT INTO `nation` VALUES (38, '锡伯族');
INSERT INTO `nation` VALUES (39, '阿昌族');
INSERT INTO `nation` VALUES (40, '普米族');
INSERT INTO `nation` VALUES (41, '塔吉克族');
INSERT INTO `nation` VALUES (42, '怒族');
INSERT INTO `nation` VALUES (43, '乌孜别克族');
INSERT INTO `nation` VALUES (44, '俄罗斯族');
INSERT INTO `nation` VALUES (45, '鄂温克族');
INSERT INTO `nation` VALUES (46, '崩龙族');
INSERT INTO `nation` VALUES (47, '保安族');
INSERT INTO `nation` VALUES (48, '裕固族');
INSERT INTO `nation` VALUES (49, '京族');
INSERT INTO `nation` VALUES (50, '塔塔尔族');
INSERT INTO `nation` VALUES (51, '独龙族');
INSERT INTO `nation` VALUES (52, '鄂伦春族');
INSERT INTO `nation` VALUES (53, '赫哲族');
INSERT INTO `nation` VALUES (54, '门巴族');
INSERT INTO `nation` VALUES (55, '珞巴族');
INSERT INTO `nation` VALUES (56, '基诺族');

-- ----------------------------
-- Table structure for operate_log
-- ----------------------------
DROP TABLE IF EXISTS `operate_log`;
CREATE TABLE `operate_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_date` date NULL DEFAULT NULL COMMENT '添加日期',
  `operate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作内容',
  `hr_id` int(11) NULL DEFAULT NULL COMMENT '操作员id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `hr_id`(`hr_id`) USING BTREE,
  CONSTRAINT `operate_log_ibfk_1` FOREIGN KEY (`hr_id`) REFERENCES `hr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operate_log
-- ----------------------------

-- ----------------------------
-- Table structure for politics_status
-- ----------------------------
DROP TABLE IF EXISTS `politics_status`;
CREATE TABLE `politics_status`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of politics_status
-- ----------------------------
INSERT INTO `politics_status` VALUES (1, '中共党员');
INSERT INTO `politics_status` VALUES (2, '中共预备党员');
INSERT INTO `politics_status` VALUES (3, '共青团员');
INSERT INTO `politics_status` VALUES (4, '民革党员');
INSERT INTO `politics_status` VALUES (5, '民盟盟员');
INSERT INTO `politics_status` VALUES (6, '民建会员');
INSERT INTO `politics_status` VALUES (7, '民进会员');
INSERT INTO `politics_status` VALUES (8, '农工党党员');
INSERT INTO `politics_status` VALUES (9, '致公党党员');
INSERT INTO `politics_status` VALUES (10, '九三学社社员');
INSERT INTO `politics_status` VALUES (11, '台盟盟员');
INSERT INTO `politics_status` VALUES (12, '无党派民主人士');
INSERT INTO `politics_status` VALUES (13, '普通公民');

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职位',
  `create_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `enabled` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES (29, '技术总监', '2018-01-11 21:13:42', 1);
INSERT INTO `position` VALUES (30, '运营总监', '2018-01-11 21:13:48', 1);
INSERT INTO `position` VALUES (31, '市场总监', '2018-01-11 00:00:00', 1);
INSERT INTO `position` VALUES (33, '研发工程师', '2018-01-14 00:00:00', 0);
INSERT INTO `position` VALUES (34, '运维工程师', '2018-01-14 16:11:41', 1);
INSERT INTO `position` VALUES (36, 'Java研发经理', '2019-10-01 00:00:00', 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name_zh` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'ROLE_manager', '部门经理');
INSERT INTO `role` VALUES (2, 'ROLE_personnel', '人事专员');
INSERT INTO `role` VALUES (3, 'ROLE_recruiter', '招聘主管');
INSERT INTO `role` VALUES (4, 'ROLE_train', '培训主管');
INSERT INTO `role` VALUES (5, 'ROLE_performance', '薪酬绩效主管');
INSERT INTO `role` VALUES (6, 'ROLE_admin', '系统管理员');
INSERT INTO `role` VALUES (13, 'ROLE_test2', '测试角色2');
INSERT INTO `role` VALUES (14, 'ROLE_test1', '测试角色1');
INSERT INTO `role` VALUES (17, 'ROLE_test3', '测试角色3');
INSERT INTO `role` VALUES (18, 'ROLE_test4', '测试角色4');
INSERT INTO `role` VALUES (19, 'ROLE_test4', '测试角色4');
INSERT INTO `role` VALUES (20, 'ROLE_test5', '测试角色5');
INSERT INTO `role` VALUES (21, 'ROLE_test6', '测试角色6');

-- ----------------------------
-- Table structure for salary
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `basic_salary` int(11) NULL DEFAULT NULL COMMENT '基本工资',
  `bonus` int(11) NULL DEFAULT NULL COMMENT '奖金',
  `lunch_salary` int(11) NULL DEFAULT NULL COMMENT '午餐补助',
  `traffic_salary` int(11) NULL DEFAULT NULL COMMENT '交通补助',
  `all_salary` int(11) NULL DEFAULT NULL COMMENT '应发工资',
  `pension_base` int(11) NULL DEFAULT NULL COMMENT '养老金基数',
  `pension_ratio` float NULL DEFAULT NULL COMMENT '养老金比率',
  `create_date` timestamp(0) NULL DEFAULT NULL COMMENT '启用时间',
  `medical_base` int(11) NULL DEFAULT NULL COMMENT '医疗基数',
  `medical_ratio` float NULL DEFAULT NULL COMMENT '医疗保险比率',
  `provident_fund_base` int(11) NULL DEFAULT NULL COMMENT '公积金基数',
  `provident_fund_ratio` float NULL DEFAULT NULL COMMENT '公积金比率',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of salary
-- ----------------------------
INSERT INTO `salary` VALUES (9, '市场部工资账套', 9000, 4000, 800, 500, NULL, 2000, 0.07, '2018-01-24 00:00:00', 2000, 0.07, 2000, 0.07);
INSERT INTO `salary` VALUES (10, '人事部工资账套', 2000, 2000, 400, 1000, NULL, 2000, 0.07, '2018-01-01 00:00:00', 2000, 0.07, 2000, 0.07);
INSERT INTO `salary` VALUES (13, '运维部工资账套', 20000, 3000, 500, 500, NULL, 4000, 0.07, '2018-01-25 00:00:00', 4000, 0.07, 4000, 0.07);

-- ----------------------------
-- Table structure for staff_reward_punish
-- ----------------------------
DROP TABLE IF EXISTS `staff_reward_punish`;
CREATE TABLE `staff_reward_punish`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) NULL DEFAULT NULL COMMENT '员工编号',
  `reward_punish_date` date NULL DEFAULT NULL COMMENT '奖罚日期',
  `reward_punish_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '奖罚原因',
  `reward_punish_point` int(11) NULL DEFAULT NULL COMMENT '奖罚分',
  `reward_punish_type` int(11) NULL DEFAULT NULL COMMENT '奖罚类别，0：奖，1：罚',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`eid`) USING BTREE,
  CONSTRAINT `staff_reward_punish_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of staff_reward_punish
-- ----------------------------

-- ----------------------------
-- Table structure for staff_transfer
-- ----------------------------
DROP TABLE IF EXISTS `staff_transfer`;
CREATE TABLE `staff_transfer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) NULL DEFAULT NULL,
  `after_department_id` int(11) NULL DEFAULT NULL COMMENT '调动后部门',
  `after_job_id` int(11) NULL DEFAULT NULL COMMENT '调动后职位',
  `transfer_date` date NULL DEFAULT NULL COMMENT '调动日期',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调动原因',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`eid`) USING BTREE,
  CONSTRAINT `staff_transfer_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of staff_transfer
-- ----------------------------

-- ----------------------------
-- Table structure for system_msg
-- ----------------------------
DROP TABLE IF EXISTS `system_msg`;
CREATE TABLE `system_msg`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NULL DEFAULT NULL COMMENT '消息id',
  `type` int(11) NULL DEFAULT 0 COMMENT '0表示群发消息',
  `hr_id` int(11) NULL DEFAULT NULL COMMENT '这条消息是给谁的',
  `state` int(11) NULL DEFAULT 0 COMMENT '0 未读 1 已读',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `hr_id`(`hr_id`) USING BTREE,
  INDEX `system_msg_ibfk_1`(`mid`) USING BTREE,
  CONSTRAINT `system_msg_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `msgcontent` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `system_msg_ibfk_2` FOREIGN KEY (`hr_id`) REFERENCES `hr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_msg
-- ----------------------------
INSERT INTO `system_msg` VALUES (57, 14, 0, 3, 1);
INSERT INTO `system_msg` VALUES (58, 14, 0, 5, 1);
INSERT INTO `system_msg` VALUES (59, 14, 0, 10, 1);
INSERT INTO `system_msg` VALUES (60, 14, 0, 11, 0);
INSERT INTO `system_msg` VALUES (61, 14, 0, 12, 0);
INSERT INTO `system_msg` VALUES (62, 15, 0, 3, 1);
INSERT INTO `system_msg` VALUES (63, 15, 0, 5, 1);
INSERT INTO `system_msg` VALUES (64, 15, 0, 10, 1);
INSERT INTO `system_msg` VALUES (65, 15, 0, 11, 0);
INSERT INTO `system_msg` VALUES (66, 15, 0, 12, 0);
INSERT INTO `system_msg` VALUES (67, 16, 0, 3, 1);
INSERT INTO `system_msg` VALUES (68, 16, 0, 5, 1);
INSERT INTO `system_msg` VALUES (69, 16, 0, 10, 1);
INSERT INTO `system_msg` VALUES (70, 16, 0, 11, 0);
INSERT INTO `system_msg` VALUES (71, 16, 0, 12, 0);
INSERT INTO `system_msg` VALUES (72, 17, 0, 3, 1);
INSERT INTO `system_msg` VALUES (73, 17, 0, 5, 1);
INSERT INTO `system_msg` VALUES (74, 17, 0, 10, 1);
INSERT INTO `system_msg` VALUES (75, 17, 0, 11, 0);
INSERT INTO `system_msg` VALUES (76, 17, 0, 12, 0);
INSERT INTO `system_msg` VALUES (77, 18, 0, 3, 1);
INSERT INTO `system_msg` VALUES (78, 18, 0, 5, 0);
INSERT INTO `system_msg` VALUES (79, 18, 0, 10, 0);
INSERT INTO `system_msg` VALUES (80, 18, 0, 11, 0);
INSERT INTO `system_msg` VALUES (81, 18, 0, 12, 0);

-- ----------------------------
-- Procedure structure for addDep
-- ----------------------------
DROP PROCEDURE IF EXISTS `addDep`;
delimiter ;;
CREATE PROCEDURE `addDep`(in depName varchar(32),in parentId int,in enabled boolean,out result int,out result2 int)
begin
  declare did int;
  declare pDepPath varchar(64);
  insert into department set name=depName,parentId=parentId,enabled=enabled;
  select row_count() into result;
  select last_insert_id() into did;
  set result2=did;
  select depPath into pDepPath from department where id=parentId;
  update department set depPath=concat(pDepPath,'.',did) where id=did;
  update department set isParent=true where id=parentId;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for deleteDep
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteDep`;
delimiter ;;
CREATE PROCEDURE `deleteDep`(in did int,out result int)
begin
  declare ecount int;
  declare pid int;
  declare pcount int;
  declare a int;
  select count(*) into a from department where id=did and isParent=false;
  if a=0 then set result=-2;
  else
  select count(*) into ecount from employee where departmentId=did;
  if ecount>0 then set result=-1;
  else
  select parentId into pid from department where id=did;
  delete from department where id=did and isParent=false;
  select row_count() into result;
  select count(*) into pcount from department where parentId=pid;
  if pcount=0 then update department set isParent=false where id=pid;
  end if;
  end if;
  end if;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
