/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.3.3
 Source Server Type    : MySQL
 Source Server Version : 80040 (8.0.40)
 Source Host           : 192.168.3.3:13306
 Source Schema         : cybernetics

 Target Server Type    : MySQL
 Target Server Version : 80040 (8.0.40)
 File Encoding         : 65001

 Date: 10/11/2024 11:01:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for api_chain
-- ----------------------------
DROP TABLE IF EXISTS `api_chain`;
CREATE TABLE `api_chain`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `namespace` varchar(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '命名空间',
  `name` varchar(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '区块链名',
  `display_name` varchar(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '区块链展示名',
  `miner_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '区块链矿机机型',
  `image` varchar(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '区块链镜像 ID',
  `min_mine_interval_seconds` int NOT NULL DEFAULT 0 COMMENT '矿机挖矿间隔',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_namespace_name`(`namespace` ASC, `name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '区块链表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of api_chain
-- ----------------------------

-- ----------------------------
-- Table structure for api_miner
-- ----------------------------
DROP TABLE IF EXISTS `api_miner`;
CREATE TABLE `api_miner`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `namespace` varchar(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '命名空间',
  `name` varchar(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '矿机名',
  `display_name` varchar(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '矿机展示名',
  `phase` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '矿机状态',
  `miner_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '矿机机型',
  `chain_name` varchar(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '矿机所属的区块链名',
  `cpu` int NOT NULL DEFAULT 0 COMMENT '矿机 CPU 规格',
  `memory` int NOT NULL DEFAULT 0 COMMENT '矿机内存规格',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_namespace_name`(`namespace` ASC, `name` ASC) USING BTREE,
  INDEX `idx_chain_name`(`chain_name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '矿机表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of api_miner
-- ----------------------------

-- ----------------------------
-- Table structure for api_minerset
-- ----------------------------
DROP TABLE IF EXISTS `api_minerset`;
CREATE TABLE `api_minerset`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `namespace` varchar(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '命名空间',
  `name` varchar(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '矿机池名',
  `replicas` int NOT NULL DEFAULT 0 COMMENT '矿机副本数',
  `display_name` varchar(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '矿机池展示名',
  `delete_policy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '矿机池缩容策略',
  `min_ready_seconds` int NOT NULL DEFAULT 0 COMMENT '矿机 Ready 最小等待时间',
  `fully_labeled_replicas` int NOT NULL DEFAULT 0 COMMENT '所有标签匹配的副本数',
  `ready_replicas` int NOT NULL DEFAULT 0 COMMENT 'Ready 副本数',
  `available_replicas` int NOT NULL DEFAULT 0 COMMENT '可用副本数',
  `failure_reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '失败原因',
  `failure_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '失败信息',
  `conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '矿机池状态',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_namespace_name`(`namespace` ASC, `name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '矿机池表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of api_minerset
-- ----------------------------

-- ----------------------------
-- Table structure for fs_order
-- ----------------------------
DROP TABLE IF EXISTS `fs_order`;
CREATE TABLE `fs_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `customer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `product` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `quantity` bigint NULL DEFAULT NULL,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fs_order
-- ----------------------------

-- ----------------------------
-- Table structure for uc_secret
-- ----------------------------
DROP TABLE IF EXISTS `uc_secret`;
CREATE TABLE `uc_secret`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `user_id` varchar(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户 ID',
  `name` varchar(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密钥名称',
  `secret_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密钥 ID',
  `secret_key` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密钥 Key',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '密钥状态，0-禁用；1-启用',
  `expires` bigint NOT NULL DEFAULT 0 COMMENT '0 永不过期',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密钥描述',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_secret_id`(`secret_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '密钥表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of uc_secret
-- ----------------------------

-- ----------------------------
-- Table structure for uc_user
-- ----------------------------
DROP TABLE IF EXISTS `uc_user`;
CREATE TABLE `uc_user`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `user_id` varchar(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户 ID',
  `username` varchar(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户名称',
  `status` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户状态：registered,active,disabled,blacklisted,locked,deleted',
  `nickname` varchar(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户加密后的密码',
  `email` varchar(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户电子邮箱',
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户手机号',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username` ASC) USING BTREE,
  UNIQUE INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of uc_user
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
