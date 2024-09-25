CREATE TABLE IF NOT EXISTS `c9s_admin_dept` (
  `id` bigint NOT NULL COMMENT '部门ID',
  `pid` bigint DEFAULT '0' COMMENT '父部门ID',
  `name` varchar(32) DEFAULT NULL COMMENT '部门名称',
  `code` varchar(255) DEFAULT NULL COMMENT '部门编码',
  `type` varchar(10) DEFAULT NULL COMMENT '部门类型',
  `leader` varchar(32) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `level` int NOT NULL COMMENT '关系树等级',
  `tree` varchar(512) DEFAULT NULL COMMENT '关系树',
  `sort` int DEFAULT '0' COMMENT '排序',
  `status` tinyint DEFAULT '1' COMMENT '部门状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
)  COMMENT='管理员_部门';


CREATE TABLE IF NOT EXISTS `c9s_admin_member` (
  `id` bigint NOT NULL COMMENT '管理员ID',
  `dept_id` bigint DEFAULT '0' COMMENT '部门ID',
  `role_id` bigint DEFAULT '10' COMMENT '角色ID',
  `real_name` varchar(32) DEFAULT '' COMMENT '真实姓名',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '帐号',
  `password_hash` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` char(16) NOT NULL COMMENT '密码盐',
  `password_reset_token` varchar(150) DEFAULT '' COMMENT '密码重置令牌',
  `integral` decimal(10,2) DEFAULT '0.00' COMMENT '积分',
  `balance` decimal(10,2) DEFAULT '0.00' COMMENT '余额',
  `avatar` char(150) DEFAULT '' COMMENT '头像',
  `sex` tinyint DEFAULT '1' COMMENT '性别',
  `qq` varchar(20) DEFAULT '' COMMENT 'qq',
  `email` varchar(60) DEFAULT '' COMMENT '邮箱',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机号码',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `city_id` bigint DEFAULT '0' COMMENT '城市编码',
  `address` varchar(100) DEFAULT '' COMMENT '联系地址',
  `pid` bigint NOT NULL COMMENT '上级管理员ID',
  `level` int DEFAULT '1' COMMENT '关系树等级',
  `tree` varchar(512) NOT NULL COMMENT '关系树',
  `invite_code` varchar(12) DEFAULT NULL COMMENT '邀请码',
  `cash` json DEFAULT NULL COMMENT '提现配置',
  `last_active_at` datetime DEFAULT NULL COMMENT '最后活跃时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间'
) COMMENT='管理员_用户表';



CREATE TABLE IF NOT EXISTS `hg_admin_member_post` (
  `member_id` bigint(20) NOT NULL COMMENT '管理员ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理员_用户岗位关联';





CREATE TABLE IF NOT EXISTS `c9s_admin_member_role` (
  `member_id` bigint NOT NULL COMMENT '管理员ID',
  `role_id` bigint NOT NULL COMMENT '角色ID'
) COMMENT='管理员_用户角色关联';



CREATE TABLE IF NOT EXISTS `c9s_admin_role` (
  `id` bigint NOT NULL COMMENT '角色ID',
  `name` varchar(32) NOT NULL COMMENT '角色名称',
  `key` varchar(128) NOT NULL COMMENT '角色权限字符串',
  `data_scope` tinyint DEFAULT '1' COMMENT '数据范围',
  `custom_dept` json DEFAULT NULL COMMENT '自定义部门权限',
  `pid` bigint DEFAULT '0' COMMENT '上级角色ID',
  `level` int NOT NULL DEFAULT '1' COMMENT '关系树等级',
  `tree` varchar(512) DEFAULT NULL COMMENT '关系树',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '角色状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) COMMENT='管理员_角色信息';


CREATE TABLE IF NOT EXISTS `c9s_admin_menu` (
  `id` bigint NOT NULL COMMENT '菜单ID',
  `pid` bigint DEFAULT '0' COMMENT '父菜单ID',
  `level` int NOT NULL DEFAULT '1' COMMENT '关系树等级',
  `tree` varchar(255) NOT NULL COMMENT '关系树',
  `title` varchar(64) NOT NULL COMMENT '菜单名称',
  `name` varchar(128) NOT NULL COMMENT '名称编码',
  `path` varchar(200) DEFAULT NULL COMMENT '路由地址',
  `icon` varchar(128) DEFAULT NULL COMMENT '菜单图标',
  `type` tinyint NOT NULL DEFAULT '1' COMMENT '菜单类型（1目录 2菜单 3按钮）',
  `redirect` varchar(255) DEFAULT NULL COMMENT '重定向地址',
  `permissions` varchar(512) DEFAULT NULL COMMENT '菜单包含权限集合',
  `permission_name` varchar(64) DEFAULT NULL COMMENT '权限名称',
  `component` varchar(255) NOT NULL COMMENT '组件路径',
  `always_show` tinyint DEFAULT '0' COMMENT '取消自动计算根路由模式',
  `active_menu` varchar(255) DEFAULT NULL COMMENT '高亮菜单编码',
  `is_root` tinyint DEFAULT '0' COMMENT '是否跟路由',
  `is_frame` tinyint DEFAULT '1' COMMENT '是否内嵌',
  `frame_src` varchar(512) DEFAULT NULL COMMENT '内联外部地址',
  `keep_alive` tinyint DEFAULT '0' COMMENT '缓存该路由',
  `hidden` tinyint DEFAULT '0' COMMENT '是否隐藏',
  `affix` tinyint DEFAULT '0' COMMENT '是否固定',
  `sort` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint DEFAULT '1' COMMENT '菜单状态',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间'
) COMMENT='管理员_菜单权限';