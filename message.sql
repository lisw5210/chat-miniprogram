/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : message

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 03/11/2021 14:31:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `created_by` bigint DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否删除',
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态',
  `remarks` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `type` tinyint(1) DEFAULT NULL COMMENT '是否显示时间 0：否 1:是',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '消息内容',
  `content_type` tinyint(1) DEFAULT NULL COMMENT '内容类型 0文字1图片2视频 3:礼物',
  `is_read` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否已读',
  `sender` bigint DEFAULT NULL COMMENT '发送人',
  `receiver` bigint DEFAULT NULL COMMENT '接收人',
  `request_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_last` tinyint(1) DEFAULT NULL COMMENT '是否是最后一条消息 0:否 1:是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='业务消息表';

-- ----------------------------
-- Records of message
-- ----------------------------
BEGIN;
INSERT INTO `message` VALUES (174, NULL, '2021-10-28 11:47:49', NULL, NULL, '0', NULL, NULL, 0, '[{\"type\":2,\"content\":\"[悠闲]\",\"imageClass\":\"smiley_29\"}]', 0, '0', 0, 2, '4cc04308-bdba-4a30-8e33-7265544d43ca', 0);
INSERT INTO `message` VALUES (175, NULL, '2021-10-28 11:47:52', NULL, NULL, '0', NULL, NULL, 0, '[{\"type\":2,\"content\":\"[呲牙]\",\"imageClass\":\"smiley_13\"}]', 0, '0', 0, 2, 'ea58d211-9fb8-49e0-9531-412c11ddbcd4', 0);
INSERT INTO `message` VALUES (176, NULL, '2021-10-28 11:47:54', NULL, NULL, '0', NULL, NULL, 0, '[{\"type\":2,\"content\":\"[害羞]\",\"imageClass\":\"smiley_6\"}]', 0, '0', 0, 2, '36ec9992-fdf3-4eb9-8f6c-9da5373e04ca', 0);
INSERT INTO `message` VALUES (177, NULL, '2021-10-28 11:48:12', NULL, NULL, '0', NULL, NULL, 0, '[{\"type\":2,\"content\":\"[害羞]\",\"imageClass\":\"smiley_6\"}]', 0, '0', 0, 2, '53a89585-b347-42f3-b422-03cfe23dafa4', 0);
INSERT INTO `message` VALUES (178, NULL, '2021-10-28 11:50:57', NULL, NULL, '0', NULL, NULL, 0, '[{\"type\":1,\"content\":\"111111\"}]', 0, '0', 0, 2, '61090e5b-5ff1-4fa8-8f8f-53e268d8144f', 0);
INSERT INTO `message` VALUES (179, NULL, '2021-10-28 16:58:13', NULL, NULL, '0', NULL, NULL, 0, '[{\"type\":2,\"content\":\"[流泪]\",\"imageClass\":\"smiley_5\"}]', 0, '0', 0, 2, '8d436a48-9f9b-4a46-8ed5-5f55bf84f689', 0);
INSERT INTO `message` VALUES (180, NULL, '2021-10-28 16:59:40', NULL, NULL, '0', NULL, NULL, 0, '[{\"type\":2,\"content\":\"[害羞]\",\"imageClass\":\"smiley_6\"}]', 0, '0', 0, 2, '7d042ed5-0691-475e-a5d2-fe33806f6e6c', 0);
INSERT INTO `message` VALUES (181, NULL, '2021-10-28 17:01:21', NULL, NULL, '0', NULL, NULL, 0, '[{\"type\":2,\"content\":\"[调皮]\",\"imageClass\":\"smiley_12\"}]', 0, '0', 0, 2, '07dc47c0-eaa3-4898-8835-be2556d0535d', 0);
INSERT INTO `message` VALUES (182, NULL, '2021-10-28 17:02:47', NULL, NULL, '0', NULL, NULL, 0, '[{\"type\":2,\"content\":\"[偷笑]\",\"imageClass\":\"smiley_20\"}]', 0, '0', 0, 2, '6deeff05-51f9-4f9b-8c28-35d33c947cca', 0);
INSERT INTO `message` VALUES (183, NULL, '2021-10-28 17:03:41', NULL, NULL, '0', NULL, NULL, 0, '[{\"type\":2,\"content\":\"[发怒]\",\"imageClass\":\"smiley_11\"}]', 0, '0', 0, 2, '644a691a-6a98-4f62-81aa-73c8a6186937', 0);
INSERT INTO `message` VALUES (184, NULL, '2021-10-28 17:07:28', NULL, NULL, '0', NULL, NULL, 0, '[{\"type\":2,\"content\":\"[偷笑]\",\"imageClass\":\"smiley_20\"}]', 0, '0', 0, 2, '34fc912c-85f8-4222-8dd6-d0f3f8b5d284', 0);
INSERT INTO `message` VALUES (185, NULL, '2021-10-28 17:08:32', NULL, NULL, '0', NULL, NULL, 0, '[{\"type\":2,\"content\":\"[撇嘴]\",\"imageClass\":\"smiley_1\"}]', 0, '0', 0, 2, '072ff951-f471-4b9d-8956-6eab74d44f30', 0);
INSERT INTO `message` VALUES (186, NULL, '2021-10-28 17:08:44', NULL, NULL, '0', NULL, NULL, 0, '[{\"type\":2,\"content\":\"[害羞]\",\"imageClass\":\"smiley_6\"},{\"type\":2,\"content\":\"[悠闲]\",\"imageClass\":\"smiley_29\"}]', 0, '0', 0, 2, '059ad84d-f6bc-4769-8b0d-ef698d24ea3d', 0);
INSERT INTO `message` VALUES (187, NULL, '2021-10-28 17:14:10', NULL, NULL, '0', NULL, NULL, 0, '[{\"type\":2,\"content\":\"[流泪]\",\"imageClass\":\"smiley_5\"}]', 0, '0', 0, 2, '639e8891-63ef-4791-8044-62507bdd313f', 0);
INSERT INTO `message` VALUES (188, NULL, '2021-10-28 17:15:02', NULL, NULL, '0', NULL, NULL, 0, '[{\"type\":2,\"content\":\"[悠闲]\",\"imageClass\":\"smiley_29\"}]', 0, '0', 0, 2, '5e7fb5cc-b277-4c33-8125-0b65ccf0db69', 0);
INSERT INTO `message` VALUES (189, NULL, '2021-10-28 17:15:04', NULL, NULL, '0', NULL, NULL, 0, '[{\"type\":2,\"content\":\"[流泪]\",\"imageClass\":\"smiley_5\"}]', 0, '0', 0, 2, '4c6b49f9-25e4-45c9-9de9-12dca6ffc58d', 0);
INSERT INTO `message` VALUES (190, NULL, '2021-10-28 17:24:53', NULL, NULL, '0', NULL, NULL, 1, '[{\"type\":1,\"content\":\"1\"},{\"type\":2,\"content\":\"[憨笑]\",\"imageClass\":\"smiley_28\"}]', 0, '0', 0, 2, '7e9a99b7-539c-4f01-8c47-1625648bb10b', 0);
INSERT INTO `message` VALUES (191, NULL, '2021-10-28 17:25:03', NULL, NULL, '0', NULL, NULL, 0, '[{\"type\":2,\"content\":\"[流泪]\",\"imageClass\":\"smiley_5\"}]', 0, '0', 0, 2, 'fbd32e4b-56ca-46cb-942d-4acb1a600e58', 0);
INSERT INTO `message` VALUES (192, NULL, '2021-10-28 17:25:10', NULL, NULL, '0', NULL, NULL, 0, '[{\"type\":2,\"content\":\"[害羞]\",\"imageClass\":\"smiley_6\"}]', 0, '0', 0, 2, '50fc2741-bc9e-420e-8772-db0832dca3f7', 0);
INSERT INTO `message` VALUES (193, NULL, '2021-11-02 09:46:07', NULL, NULL, '0', NULL, NULL, 1, '[{\"type\":2,\"content\":\"[流泪]\",\"imageClass\":\"smiley_5\"}]', 0, '0', 0, 2, 'c4e871e0-6f9c-4ac7-8a65-df2db324a10b', 0);
INSERT INTO `message` VALUES (194, NULL, '2021-11-02 09:48:14', NULL, NULL, '0', NULL, NULL, 0, '[{\"type\":2,\"content\":\"[愉快]\",\"imageClass\":\"smiley_21\"}]', 0, '0', 0, 2, '200dfb71-c37d-43a0-881c-afc2bdd27c2e', 1);
INSERT INTO `message` VALUES (195, NULL, '2021-11-03 10:12:14', NULL, NULL, '0', NULL, NULL, 0, 'https://lisw-message.oss-cn-beijing.aliyuncs.com/lisw-message/20211103/cd0cdffb261842fe8d7fb9a5ab9ed1ed.jpg', 1, '0', 0, 4, '9ca5fe30-8cd0-4cda-9fac-ca638452b006', 0);
INSERT INTO `message` VALUES (196, NULL, '2021-11-03 10:12:14', NULL, NULL, '0', NULL, NULL, 0, 'https://t7.baidu.com/it/u=3930750564,2979238085&fm=193&f=GIF', 1, '0', 0, 4, '9ca5fe30-8cd0-4cda-9fac-ca638452b006', 0);
INSERT INTO `message` VALUES (197, NULL, '2021-11-03 10:12:14', NULL, NULL, '0', NULL, NULL, 0, 'https://t7.baidu.com/it/u=3676218341,3686214618&fm=193&f=GIF', 1, '0', 0, 4, '9ca5fe30-8cd0-4cda-9fac-ca638452b006', 0);
INSERT INTO `message` VALUES (198, NULL, '2021-11-03 10:12:14', NULL, NULL, '0', NULL, NULL, 0, 'https://t7.baidu.com/it/u=2878377037,2986969897&fm=193&f=GIF', 1, '0', 0, 4, '9ca5fe30-8cd0-4cda-9fac-ca638452b006', 0);
INSERT INTO `message` VALUES (199, NULL, '2021-11-03 11:41:34', NULL, NULL, '0', NULL, NULL, 1, '[{\"type\":1,\"content\":\"在吗\"},{\"type\":2,\"content\":\"[微笑]\",\"imageClass\":\"smiley_0\"}]', 0, '0', 0, 4, '703178a3-3caa-466c-92e0-65a3d85a0317', 0);
INSERT INTO `message` VALUES (200, NULL, '2021-11-03 11:42:28', NULL, NULL, '0', NULL, NULL, 0, '[{\"type\":2,\"content\":\"[得意]\",\"imageClass\":\"smiley_4\"}]', 0, '0', 0, 4, '036fc25e-f97d-4462-8bc9-1a8f5ed7fd72', 0);
INSERT INTO `message` VALUES (201, NULL, '2021-11-03 11:43:04', NULL, NULL, '0', NULL, NULL, 0, '[{\"type\":1,\"content\":\"说话啊\"},{\"type\":2,\"content\":\"[害羞]\",\"imageClass\":\"smiley_6\"}]', 0, '0', 0, 4, '38f79b66-a0be-4e2e-97f5-3c429d248d9f', 0);
INSERT INTO `message` VALUES (202, NULL, '2021-11-03 11:43:58', NULL, NULL, '0', NULL, NULL, 0, '[{\"type\":1,\"content\":\"在的在的\"}]', 0, '1', 4, 0, '38f79b66-a0be-4e2e-97f5-3c429d248d9', 0);
INSERT INTO `message` VALUES (203, NULL, '2021-11-03 11:48:59', NULL, NULL, '0', NULL, NULL, 1, '[{\"type\":1,\"content\":\"在的在的\"}]', 0, '1', 4, 0, '38f79b66-a0be-4e2e97f5-3c429d248d9', 0);
INSERT INTO `message` VALUES (204, NULL, '2021-11-03 12:03:41', NULL, NULL, '0', NULL, NULL, 1, '[{\"type\":1,\"content\":\"在的在的\"}]', 0, '1', 4, 0, '38f79b66-a0be-4e2e97f5-3c4248d9', 1);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `avatar` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `open_id` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, '狼人', 'https://img1.baidu.com/it/u=3361478826,3674512954&fm=26&fmt=auto', '1111');
INSERT INTO `user` VALUES (2, '小猴儿', 'https://img1.baidu.com/it/u=1340127580,1407454083&fm=26&fmt=auto', '2222');
INSERT INTO `user` VALUES (3, '神龙', 'https://img0.baidu.com/it/u=2237039644,3735368368&fm=26&fmt=auto', '3333');
INSERT INTO `user` VALUES (4, '一个好人', 'https://img0.baidu.com/it/u=208517397,281463383&fm=26&fmt=auto', '4444');
INSERT INTO `user` VALUES (5, '江湖救急', 'https://img1.baidu.com/it/u=742348601,1159540008&fm=26&fmt=auto', '5555');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
