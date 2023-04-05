/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80022 (8.0.22)
 Source Host           : localhost:3306
 Source Schema         : noproject

 Target Server Type    : MySQL
 Target Server Version : 80022 (8.0.22)
 File Encoding         : 65001

 Date: 05/04/2023 10:38:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发布人',
  `time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, '小皮佬的文章1', '吃饭吃饭吃饭吃吃吃吃吃吃吃', '小皮佬', '2022-03-20 19:22:58');
INSERT INTO `article` VALUES (2, '小皮佬的文章2', '睡觉睡觉睡觉睡觉睡觉睡睡睡睡睡', '小皮佬', '2022-05-22 19:22:58');
INSERT INTO `article` VALUES (3, '小皮佬的文章3', '***下雨睡觉***', '管理员', '2023-03-20 17:14:57');
INSERT INTO `article` VALUES (6, '睡觉睡觉睡觉', '![pai.jpg](http://localhost:8880/file/6d3fc6404ee649bc87ae4b221f28450d.jpg)', '管理员', '2023-03-21 20:59:23');
INSERT INTO `article` VALUES (7, '标题01', '![pai.jpg](http://localhost:8880/file/1a4e0fd827de4c599ab60f84d4f23968.jpg)', '管理员', '2023-03-21 21:27:07');

-- ----------------------------
-- Table structure for building
-- ----------------------------
DROP TABLE IF EXISTS `building`;
CREATE TABLE `building`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '楼栋',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单元',
  `pid` int NULL DEFAULT NULL COMMENT '父级id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of building
-- ----------------------------

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  `score` int NULL DEFAULT NULL COMMENT '学分',
  `times` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上课时间',
  `state` tinyint(1) NULL DEFAULT NULL COMMENT '是否开课',
  `teacher_id` int NULL DEFAULT NULL COMMENT '授课老师id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '高等数学', 10, '45', NULL, 2);
INSERT INTO `course` VALUES (2, '低等数学', 10, '30', NULL, 3);
INSERT INTO `course` VALUES (3, 'C++', 10, '50', 0, 14);

-- ----------------------------
-- Table structure for student_course
-- ----------------------------
DROP TABLE IF EXISTS `student_course`;
CREATE TABLE `student_course`  (
  `student_id` int NOT NULL,
  `course_id` int NOT NULL,
  PRIMARY KEY (`student_id`, `course_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_course
-- ----------------------------
INSERT INTO `student_course` VALUES (1, 1);
INSERT INTO `student_course` VALUES (5, 1);
INSERT INTO `student_course` VALUES (6, 2);
INSERT INTO `student_course` VALUES (7, 3);

-- ----------------------------
-- Table structure for t_avatarurl
-- ----------------------------
DROP TABLE IF EXISTS `t_avatarurl`;
CREATE TABLE `t_avatarurl`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `avatarUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `size` bigint NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_avatarurl
-- ----------------------------

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容',
  `user_id` int NULL DEFAULT NULL COMMENT '评论人id',
  `time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论时间',
  `pid` int NULL DEFAULT NULL COMMENT '父id',
  `origin_id` int NULL DEFAULT NULL COMMENT '最上级评论id',
  `article_id` int NULL DEFAULT NULL COMMENT '关联文章的id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (1, '睡睡睡睡睡睡睡睡睡睡睡睡睡睡睡睡睡睡睡睡', 1, '2023-03-18 07:44:03', NULL, NULL, 2);
INSERT INTO `t_comment` VALUES (2, '11111111', 1, '2023-03-18 18:05:42', NULL, NULL, 2);
INSERT INTO `t_comment` VALUES (3, '1111111111', 1, '2023-03-19 11:02:28', NULL, NULL, 2);
INSERT INTO `t_comment` VALUES (4, '111', 1, '2023-03-20 19:55:49', NULL, NULL, 3);
INSERT INTO `t_comment` VALUES (5, '22222', 1, '2023-03-20 21:03:21', 2, 2, 2);
INSERT INTO `t_comment` VALUES (6, '333333', 1, '2023-03-20 21:03:26', 5, 2, 2);
INSERT INTO `t_comment` VALUES (7, '222', 1, '2023-03-21 10:44:39', NULL, NULL, 3);
INSERT INTO `t_comment` VALUES (8, '3333', 1, '2023-03-21 10:44:46', 7, 7, 3);
INSERT INTO `t_comment` VALUES (9, '55555', 1, '2023-03-23 16:42:42', 6, 2, 2);

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict`  (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_dict
-- ----------------------------
INSERT INTO `t_dict` VALUES ('user', 'el-icon-user', 'icon');
INSERT INTO `t_dict` VALUES ('house', 'el-icon-house', 'icon');
INSERT INTO `t_dict` VALUES ('menu', 'el-icon-menu', 'icon');
INSERT INTO `t_dict` VALUES ('s-custom', 'el-icon-s-custom', 'icon');
INSERT INTO `t_dict` VALUES ('s-grid', 'el-icon-s-grid', 'icon');
INSERT INTO `t_dict` VALUES ('document', 'el-icon-document', 'icon');
INSERT INTO `t_dict` VALUES ('coffee', 'el-icon-coffee', 'icon');
INSERT INTO `t_dict` VALUES ('s-marketing', 'el-icon-s-marketing', 'icon');

-- ----------------------------
-- Table structure for t_file
-- ----------------------------
DROP TABLE IF EXISTS `t_file`;
CREATE TABLE `t_file`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `size` bigint NULL DEFAULT NULL COMMENT '文件大小(kb)',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下载链接',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件md5',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `enable` tinyint(1) NULL DEFAULT 0 COMMENT '是否禁用链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_file
-- ----------------------------
INSERT INTO `t_file` VALUES (44, 'C语言编程课程.jpg', 'jpg', 34, 'http://localhost:8880/file/9a08ef6b98f546cbba839fe87b2a3c39.jpg', 'cc80f197a15dc6b7265bab62d2cc7c10', 0, 1);
INSERT INTO `t_file` VALUES (45, 'python编程课程.png', 'png', 83, 'http://localhost:8880/file/9749e562ad73491db7bcc079fa14e33c.png', '51577d64407d3c75ba118dea90b0a3ba', 0, 1);
INSERT INTO `t_file` VALUES (46, '单片机课程.jpg', 'jpg', 62, 'http://localhost:8880/file/411bff6d77d1461189cc508b0f83a024.jpg', '01c60056e9f36479075964551f72d8b4', 0, 1);
INSERT INTO `t_file` VALUES (47, '法语.jpeg', 'jpeg', 68, 'http://localhost:8880/file/f572a220fd3041bb84c49d7ee2a4b5d3.jpeg', 'e262079cd113949d1e915fd87c434055', 0, 1);
INSERT INTO `t_file` VALUES (48, '分子生物学.jpg', 'jpg', 52, 'http://localhost:8880/file/aa9b08fc9ec343d996c26e3f536a0e6b.jpg', 'a6ba5bb4852fe1dae2a9745c684bfcd8', 0, 1);
INSERT INTO `t_file` VALUES (49, '古代文化鉴赏.jpg', 'jpg', 27, 'http://localhost:8880/file/21f13da781b54ce0bb380d192a6d3e07.jpg', 'f26d6e4b5b7b77fe74d87813c3919427', 0, 1);
INSERT INTO `t_file` VALUES (50, '数据结构.jpg', 'jpg', 80, 'http://localhost:8880/file/5acfdb6b742f4aff8d1239cfffa82dac.jpg', 'aa9b59f863c6220426a8351c5f7b88b3', 0, 1);
INSERT INTO `t_file` VALUES (51, '自然科学.jpg', 'jpg', 24, 'http://localhost:8880/file/0c49e123e801495aae4e323e45ba84fc.jpg', 'e5ce51f1a2206927233ec92e35bfc77f', 0, 1);
INSERT INTO `t_file` VALUES (52, '中世纪艺术.png', 'png', 235, 'http://localhost:8880/file/cbf4dc4cdc684974b21bfaab29bee76e.png', '9718e69d58716ccc616923f4a06bc8b7', 0, 1);
INSERT INTO `t_file` VALUES (53, '微课创作.jpg', 'jpg', 30, 'http://localhost:8880/file/dfd5aa982a844a1a9bcc8bc12dc04d6f.jpg', '0cd84d50279713ddfdaf80b3e5247fcf', 0, 1);
INSERT INTO `t_file` VALUES (54, '古代文化鉴赏.jpg', 'jpg', 27, 'http://localhost:8880/file/21f13da781b54ce0bb380d192a6d3e07.jpg', 'f26d6e4b5b7b77fe74d87813c3919427', 0, 1);
INSERT INTO `t_file` VALUES (55, '市场营销学.jpg', 'jpg', 40, 'http://localhost:8880/file/b364a40528a24f3db83f59866e3f025c.jpg', '8f04537e1e9ce81d3ee8c0e4fd619fe2', 0, 1);
INSERT INTO `t_file` VALUES (64, '02.mp4', 'mp4', 948, 'http://localhost:8880/file/5c9ae8a67b884f71907fcf31ac1bfc7a.mp4', '706a584ff78f34fc837a2b4d4efa3410', 0, 0);

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路径',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `pid` int NULL DEFAULT NULL COMMENT '父级id',
  `page_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '页面路径',
  `sort_num` int NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES (2, '数据报表', '/dashbord', 'el-icon-s-marketing', '11', NULL, 'Dashbord', 100);
INSERT INTO `t_menu` VALUES (4, '系统管理', NULL, 'el-icon-s-grid', NULL, NULL, NULL, 300);
INSERT INTO `t_menu` VALUES (5, '用户管理', 'user', 'el-icon-user', NULL, NULL, 'User', 301);
INSERT INTO `t_menu` VALUES (6, '角色管理', '/role', 'el-icon-s-custom', NULL, NULL, 'Role', 302);
INSERT INTO `t_menu` VALUES (7, '菜单管理', 'menu', 'el-icon-menu', NULL, NULL, 'Menu', 303);
INSERT INTO `t_menu` VALUES (8, '文件管理', 'file', 'el-icon-document', NULL, NULL, 'File', 304);
INSERT INTO `t_menu` VALUES (9, '捐赠', 'donate', 'el-icon-coffee', NULL, NULL, 'Donate', 200);
INSERT INTO `t_menu` VALUES (10, '主页', '/home', 'el-icon-house', NULL, NULL, 'Home', 0);
INSERT INTO `t_menu` VALUES (39, '课程管理', '/course', 'el-icon-menu', NULL, NULL, 'Course', 201);
INSERT INTO `t_menu` VALUES (40, '高德地图', '/map', 'el-icon-house', NULL, NULL, 'Map', 999);
INSERT INTO `t_menu` VALUES (41, '文章管理', '/article', 'el-icon-menu', NULL, NULL, 'Article', 999);
INSERT INTO `t_menu` VALUES (42, '级联查询', '/building', 'el-icon-menu', NULL, NULL, 'Building', 999);
INSERT INTO `t_menu` VALUES (43, '时间范围查询', '/timeSearch', 'el-icon-menu', NULL, NULL, 'TimeSearch', 999);
INSERT INTO `t_menu` VALUES (47, '用户头像', '/avatar', 'el-icon-menu', NULL, NULL, 'Avatar', 9999);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名字',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `flag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '管理员', '管理员', 'ROLE_ADMIN');
INSERT INTO `t_role` VALUES (2, '学生', '学生', 'ROLE_STUDENT');
INSERT INTO `t_role` VALUES (3, '老师', '老师', 'ROLE_TEACHER');

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu`  (
  `role_id` int NOT NULL COMMENT '角色id',
  `menu_id` int NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES (1, 2);
INSERT INTO `t_role_menu` VALUES (1, 5);
INSERT INTO `t_role_menu` VALUES (1, 6);
INSERT INTO `t_role_menu` VALUES (1, 7);
INSERT INTO `t_role_menu` VALUES (1, 8);
INSERT INTO `t_role_menu` VALUES (1, 9);
INSERT INTO `t_role_menu` VALUES (1, 10);
INSERT INTO `t_role_menu` VALUES (1, 39);
INSERT INTO `t_role_menu` VALUES (1, 40);
INSERT INTO `t_role_menu` VALUES (1, 41);
INSERT INTO `t_role_menu` VALUES (1, 42);
INSERT INTO `t_role_menu` VALUES (1, 43);
INSERT INTO `t_role_menu` VALUES (1, 47);
INSERT INTO `t_role_menu` VALUES (2, 2);
INSERT INTO `t_role_menu` VALUES (2, 9);
INSERT INTO `t_role_menu` VALUES (2, 10);
INSERT INTO `t_role_menu` VALUES (2, 40);
INSERT INTO `t_role_menu` VALUES (3, 2);
INSERT INTO `t_role_menu` VALUES (3, 5);
INSERT INTO `t_role_menu` VALUES (3, 7);
INSERT INTO `t_role_menu` VALUES (3, 10);
INSERT INTO `t_role_menu` VALUES (3, 39);
INSERT INTO `t_role_menu` VALUES (3, 40);
INSERT INTO `t_role_menu` VALUES (3, 41);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'admin', '管理员', 'e10adc3949ba59abbe56e057f20f883e', 'xiaopilao@xiaopilao.com', '114514', 'M717', '2023-03-19 11:01:39', 'http://localhost:8880/file/1a4e0fd827de4c599ab60f84d4f23968.jpg', 'ROLE_ADMIN');
INSERT INTO `t_user` VALUES (2, 'peter', '出生', 'e10adc3949ba59abbe56e057f20f883e', 'peter@petermail.com', '114514', '圆蛤', '2023-03-14 21:00:11', 'http://localhost:8880/file/49730b49a8a048389b592e937ed085dc.jpg', 'ROLE_TEACHER');
INSERT INTO `t_user` VALUES (3, 'lois', '祸', 'dfb31660c52fddd964834eef9ed963a4', 'lois@lois.com', '114514', '圆蛤', '2023-03-15 12:08:00', 'http://localhost:8880/file/541142bf8e554909bb44ac09cf90e0dd.jpg', 'ROLE_TEACHER');
INSERT INTO `t_user` VALUES (4, 'chirs', '手艺人冠军', 'e10adc3949ba59abbe56e057f20f883e', 'chirs@chirsmail.com', '114514', '圆蛤', '2023-03-15 21:31:36', 'http://localhost:8880/file/7b6c9ce46e724ca4b8ed619b6c53a202.jpg', 'ROLE_STUDENT');
INSERT INTO `t_user` VALUES (5, 'meg', '古神', 'e10adc3949ba59abbe56e057f20f883e', 'meg@megmail.com', '114514', '圆蛤', '2023-03-15 21:32:25', 'http://localhost:8880/file/30e374a7cd7b4403ac16f0140dcc2f02.jpg', 'ROLE_STUDENT');
INSERT INTO `t_user` VALUES (6, 'stewie', '爱女装小可爱捏', 'e10adc3949ba59abbe56e057f20f883e', 'stewie@mail.com', '114514', '圆蛤', '2023-03-15 21:32:46', 'http://localhost:8880/file/261fd37d485c4bc98f9560b2bd2db38c.jpg', 'ROLE_STUDENT');
INSERT INTO `t_user` VALUES (7, 'brain', '出生的狗', 'e10adc3949ba59abbe56e057f20f883e', 'brian@brainmail.com', '114514', '圆蛤', '2023-03-15 21:33:04', 'http://localhost:8880/file/de633fbe91be4906a22c4238412cf9e6.jpg', 'ROLE_STUDENT');
INSERT INTO `t_user` VALUES (8, 'joe', '瘸子', 'e10adc3949ba59abbe56e057f20f883e', 'joe@joemail.com', '114514', '圆蛤', '2023-03-15 21:33:18', 'http://localhost:8880/file/0aa97ff700434757b3e3bf7622082bdd.jpg', 'ROLE_TEACHER');
INSERT INTO `t_user` VALUES (9, 'cleveland', '正常人', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, '2023-03-15 21:33:37', 'http://localhost:8880/file/2b69af97decd4582a396c380b9d7a7a6.jpg', 'ROLE_TEACHER');
INSERT INTO `t_user` VALUES (10, 'quagmire', '快哥', 'e10adc3949ba59abbe56e057f20f883e', 'quagmire@quagmiremail.com', '114514', '圆蛤', '2023-03-15 21:33:53', 'http://localhost:8880/file/6fdaa2792e4e4d67b5d66b81ecbc257e.jpg', 'ROLE_TEACHER');
INSERT INTO `t_user` VALUES (11, 'herbert', '炼铜老头', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, '2023-03-15 21:34:08', NULL, 'ROLE_TEACHER');
INSERT INTO `t_user` VALUES (12, 'bonnie', '求你快杀了你丈夫吧', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, '2023-03-15 21:34:23', NULL, 'ROLE_TEACHER');
INSERT INTO `t_user` VALUES (13, 'barbara', '犹大妈', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, '2023-03-15 21:34:34', NULL, 'ROLE_TEACHER');
INSERT INTO `t_user` VALUES (14, 'carter', '恶臭资本家', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, '2023-03-15 21:34:47', NULL, 'ROLE_TEACHER');
INSERT INTO `t_user` VALUES (15, 'takanawa', '亚洲女记者', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, '2023-03-15 21:35:00', NULL, 'ROLE_TEACHER');
INSERT INTO `t_user` VALUES (16, 'TomTrucker', '可悲的新闻人', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, '2023-03-15 21:35:30', NULL, 'ROLE_TEACHER');
INSERT INTO `t_user` VALUES (32, '14', NULL, 'carter', NULL, NULL, NULL, '2023-03-08 14:06:40', NULL, NULL);
INSERT INTO `t_user` VALUES (33, '15', NULL, 'takanawa', NULL, NULL, NULL, '2023-03-08 14:06:40', NULL, NULL);
INSERT INTO `t_user` VALUES (34, '16', NULL, 'Tom trucker', NULL, NULL, NULL, '2023-03-08 14:06:40', NULL, NULL);
INSERT INTO `t_user` VALUES (63, 'xiaopilao', 'xiaopilao', 'e10adc3949ba59abbe56e057f20f883e', 'xiaopilao@xiaopilao.com', '114514', 'M717', '2023-03-15 20:52:21', NULL, 'ROLE_STUDENT');
INSERT INTO `t_user` VALUES (65, 'kun', 'kun', '51711d3cb95945007b827cb703fcf398', NULL, NULL, NULL, '2023-03-17 21:30:55', NULL, 'ROLE_STUDENT');
INSERT INTO `t_user` VALUES (74, 'ikun', '只因', 'f379eaf3c831b04de153469d1bec345e', 'xiaopilao@xiaopilao.com', '114514', 'M717', '2023-03-20 16:22:11', '2023-03-15 03:53:40', NULL);

-- ----------------------------
-- Table structure for t_user_info
-- ----------------------------
DROP TABLE IF EXISTS `t_user_info`;
CREATE TABLE `t_user_info`  (
  `user_id` bigint UNSIGNED NOT NULL COMMENT '主键，用户id',
  `city` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '城市名称',
  `introduce` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人介绍，不要超过128个字符',
  `fans` int UNSIGNED NULL DEFAULT 0 COMMENT '粉丝数量',
  `followee` int UNSIGNED NULL DEFAULT 0 COMMENT '关注的人的数量',
  `gender` tinyint UNSIGNED NULL DEFAULT 0 COMMENT '性别，0：男，1：女',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `credits` int UNSIGNED NULL DEFAULT 0 COMMENT '积分',
  `level` tinyint UNSIGNED NULL DEFAULT 0 COMMENT '会员级别，0~9级,0代表未开通会员',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_info
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
