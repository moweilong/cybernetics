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

INSERT INTO `c9s_admin_member` (`id`, `dept_id`, `role_id`, `real_name`, `username`, `password_hash`, `salt`, `password_reset_token`, `integral`, `balance`, `avatar`, `sex`, `qq`, `email`, `mobile`, `birthday`, `city_id`, `address`, `pid`, `level`, `tree`, `invite_code`, `cash`, `last_active_at`, `remark`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'admin', 'admin', 'a7c588fffeb2c1d99b29879d7fe97c78', '6541561', '', '88.00', '99289.78', 'http://bufanyun.cn-bj.ufileos.com/hotgo/attachment/2023-02-09/cqdq8er9nfkchdopav.png', 1, '133814250', '133814250@qq.com', '15303830571', '2016-04-16', 410172, '莲花街001号', 0, 1, '', '111', '{"name": "admin", "account": "15303830571", "payeeCode": "http://bufanyun.cn-bj.ufileos.com/hotgo/attachment/2023-02-09/cqdq8mqal5isvcb58g.jpg"}', '2024-08-27 19:02:49', NULL, 1, '2021-02-12 17:59:45', '2024-08-27 19:02:49')


CREATE TABLE IF NOT EXISTS `c9s_admin_member_post` (
  `member_id` bigint NOT NULL COMMENT '管理员ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID'
) COMMENT='管理员_用户岗位关联';





CREATE TABLE IF NOT EXISTS `c9s_admin_member_role` (
  `member_id` bigint NOT NULL COMMENT '管理员ID',
  `role_id` bigint NOT NULL COMMENT '角色ID'
) COMMENT='管理员_用户角色关联';

INSERT INTO `c9s_admin_role` (`id`, `name`, `key`, `data_scope`, `custom_dept`, `pid`, `level`, `tree`, `remark`, `sort`, `status`, `created_at`, `updated_at`) VALUES
(1, '超级管理员', 'super', 1, '[]', 0, 1, NULL, '超级管理员，拥有全部权限', 100, 1, '2022-01-04 17:54:52', '2023-01-12 00:00:00')


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

CREATE TABLE IF NOT EXISTS `c9s_sys_ems_log` (
  `id` bigint NOT NULL COMMENT '主键',
  `event` varchar(64) NOT NULL COMMENT '事件',
  `email` varchar(512) NOT NULL COMMENT '邮箱地址，多个用;隔开',
  `code` varchar(256) DEFAULT '' COMMENT '验证码',
  `times` bigint NOT NULL COMMENT '验证次数',
  `content` longtext COMMENT '邮件内容',
  `ip` varchar(128) DEFAULT NULL COMMENT 'ip地址',
  `status` tinyint DEFAULT '1' COMMENT '状态(1未验证,2已验证)',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) COMMENT='系统_邮件发送记录';

CREATE TABLE IF NOT EXISTS `c9s_sys_sms_log` (
  `id` bigint NOT NULL COMMENT '主键',
  `event` varchar(64) NOT NULL COMMENT '事件',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(256) DEFAULT '' COMMENT '验证码或短信内容',
  `times` bigint NOT NULL COMMENT '验证次数',
  `ip` varchar(128) DEFAULT NULL COMMENT 'ip地址',
  `status` tinyint DEFAULT '1' COMMENT '状态(1未验证,2已验证)',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) COMMENT='系统_短信发送记录';


CREATE TABLE IF NOT EXISTS `c9s_sys_login_log` (
  `id` bigint NOT NULL COMMENT '日志ID',
  `req_id` varchar(50) DEFAULT NULL COMMENT '请求ID',
  `member_id` bigint DEFAULT '0' COMMENT '用户ID',
  `username` varchar(64) DEFAULT NULL COMMENT '用户名',
  `response` json DEFAULT NULL COMMENT '响应数据',
  `login_at` datetime DEFAULT NULL COMMENT '登录时间',
  `login_ip` varchar(128) DEFAULT NULL COMMENT '登录IP',
  `province_id` bigint DEFAULT NULL COMMENT '省编码',
  `city_id` bigint DEFAULT NULL COMMENT '市编码',
  `user_agent` varchar(512) DEFAULT NULL COMMENT 'UA信息',
  `err_msg` varchar(1000) DEFAULT NULL COMMENT '错误提示',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间'
) COMMENT='系统_登录日志';


CREATE TABLE IF NOT EXISTS `c9s_sys_attachment` (
  `id` bigint NOT NULL COMMENT '文件ID',
  `app_id` varchar(64) NOT NULL COMMENT '应用ID',
  `member_id` bigint DEFAULT '0' COMMENT '管理员ID',
  `cate_id` bigint unsigned DEFAULT '0' COMMENT '上传分类',
  `drive` varchar(64) DEFAULT NULL COMMENT '上传驱动',
  `name` varchar(1000) DEFAULT NULL COMMENT '文件原始名',
  `kind` varchar(16) DEFAULT NULL COMMENT '上传类型',
  `mime_type` varchar(128) NOT NULL DEFAULT '' COMMENT '扩展类型',
  `naive_type` varchar(32) DEFAULT NULL COMMENT 'NaiveUI类型',
  `path` varchar(1000) DEFAULT NULL COMMENT '本地路径',
  `file_url` varchar(1000) DEFAULT NULL COMMENT 'url',
  `size` bigint DEFAULT '0' COMMENT '文件大小',
  `ext` varchar(50) DEFAULT NULL COMMENT '扩展名',
  `md5` varchar(32) DEFAULT NULL COMMENT 'md5校验码',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间'
) COMMENT='系统_附件管理';


CREATE TABLE IF NOT EXISTS `c9s_sys_config` (
  `id` bigint NOT NULL COMMENT '配置ID',
  `group` varchar(128) NOT NULL COMMENT '配置分组',
  `name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `type` varchar(32) NOT NULL COMMENT '键值类型:string,int,uint,bool,datetime,date',
  `key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `value` longtext COMMENT '参数键值',
  `default_value` varchar(500) NOT NULL COMMENT '默认值',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `tip` varchar(500) DEFAULT NULL COMMENT '变量描述',
  `is_default` tinyint DEFAULT '0' COMMENT '是否为系统默认',
  `status` tinyint DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) COMMENT='系统_配置';

CREATE TABLE IF NOT EXISTS `c9s_admin_credits_log` (
  `id` bigint NOT NULL COMMENT '变动ID',
  `member_id` bigint DEFAULT '0' COMMENT '管理员ID',
  `app_id` varchar(64) DEFAULT NULL COMMENT '应用id',
  `addons_name` varchar(100) NOT NULL DEFAULT '' COMMENT '插件名称',
  `credit_type` varchar(32) NOT NULL DEFAULT '' COMMENT '变动类型',
  `credit_group` varchar(32) DEFAULT NULL COMMENT '变动组别',
  `before_num` decimal(10,2) DEFAULT '0.00' COMMENT '变动前',
  `num` decimal(10,2) DEFAULT '0.00' COMMENT '变动数据',
  `after_num` decimal(10,2) DEFAULT '0.00' COMMENT '变动后',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `ip` varchar(20) DEFAULT NULL COMMENT '操作人IP',
  `map_id` bigint DEFAULT '0' COMMENT '关联ID',
  `status` tinyint DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间'
) COMMENT='管理员_资产变动表';

CREATE TABLE IF NOT EXISTS `c9s_sys_provinces` (
  `id` bigint NOT NULL COMMENT '省市区ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '栏目名称',
  `pinyin` varchar(100) DEFAULT '' COMMENT '拼音',
  `lng` varchar(20) DEFAULT '' COMMENT '经度',
  `lat` varchar(20) DEFAULT '' COMMENT '纬度',
  `pid` bigint NOT NULL DEFAULT '0' COMMENT '父栏目',
  `level` int NOT NULL DEFAULT '1' COMMENT '关系树等级',
  `tree` varchar(200) NOT NULL COMMENT '关系',
  `sort` int DEFAULT '0' COMMENT '排序',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) COMMENT='系统_省市区编码';

CREATE TABLE IF NOT EXISTS `c9s_admin_role_casbin` (
  `id` bigint NOT NULL,
  `p_type` varchar(64) DEFAULT NULL,
  `v0` varchar(256) DEFAULT NULL,
  `v1` varchar(256) DEFAULT NULL,
  `v2` varchar(256) DEFAULT NULL,
  `v3` varchar(256) DEFAULT NULL,
  `v4` varchar(256) DEFAULT NULL,
  `v5` varchar(256) DEFAULT NULL
) COMMENT='管理员_casbin权限表';

CREATE TABLE IF NOT EXISTS `c9s_admin_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID'
) COMMENT='管理员_角色菜单关联';

CREATE TABLE IF NOT EXISTS `c9s_sys_blacklist` (
  `id` bigint NOT NULL COMMENT '黑名单ID',
  `ip` varchar(100) DEFAULT '' COMMENT 'IP地址',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `status` tinyint DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) COMMENT='系统_访问黑名单';

CREATE TABLE IF NOT EXISTS `c9s_sys_log` (
  `id` bigint NOT NULL COMMENT '日志ID',
  `req_id` varchar(50) DEFAULT NULL COMMENT '对外ID',
  `app_id` varchar(50) DEFAULT '' COMMENT '应用ID',
  `merchant_id` bigint unsigned DEFAULT '0' COMMENT '商户ID',
  `member_id` bigint DEFAULT '0' COMMENT '用户ID',
  `method` varchar(20) DEFAULT NULL COMMENT '提交类型',
  `module` varchar(50) DEFAULT NULL COMMENT '访问模块',
  `url` varchar(1000) DEFAULT NULL COMMENT '提交url',
  `get_data` json DEFAULT NULL COMMENT 'get数据',
  `post_data` json DEFAULT NULL COMMENT 'post数据',
  `header_data` json DEFAULT NULL COMMENT 'header数据',
  `ip` varchar(128) DEFAULT NULL COMMENT 'IP地址',
  `province_id` bigint NOT NULL DEFAULT '0' COMMENT '省编码',
  `city_id` bigint NOT NULL DEFAULT '0' COMMENT '市编码',
  `error_code` int DEFAULT '0' COMMENT '报错code',
  `error_msg` longtext COMMENT '对外错误提示',
  `error_data` json DEFAULT NULL COMMENT '报错日志',
  `user_agent` varchar(512) DEFAULT NULL COMMENT 'UA信息',
  `take_up_time` bigint DEFAULT '0' COMMENT '请求耗时',
  `timestamp` bigint DEFAULT '0' COMMENT '响应时间',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间'
) COMMENT='系统_全局日志';


CREATE TABLE IF NOT EXISTS `c9s_sys_serve_log` (
  `id` bigint NOT NULL COMMENT '日志ID',
  `trace_id` varchar(50) DEFAULT NULL COMMENT '链路ID',
  `level_format` varchar(32) DEFAULT NULL COMMENT '日志级别',
  `content` text COMMENT '日志内容',
  `stack` json DEFAULT NULL COMMENT '打印堆栈',
  `line` varchar(255) NOT NULL COMMENT '调用行',
  `trigger_ns` bigint DEFAULT NULL COMMENT '触发时间(ns)',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间'
) COMMENT='系统_服务日志';

CREATE TABLE IF NOT EXISTS `c9s_admin_post` (
  `id` bigint NOT NULL COMMENT '岗位ID',
  `code` varchar(64) NOT NULL COMMENT '岗位编码',
  `name` varchar(50) NOT NULL COMMENT '岗位名称',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `sort` int NOT NULL COMMENT '排序',
  `status` tinyint NOT NULL COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) COMMENT='管理员_岗位';