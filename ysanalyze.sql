/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.7.18-log : Database - ysanalyze
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ysanalyze` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `ysanalyze`;

/*Table structure for table `SearchHotWord` */

DROP TABLE IF EXISTS `SearchHotWord`;

CREATE TABLE `SearchHotWord` (
  `industryId` varchar(255) NOT NULL,
  `industryName` varchar(255) NOT NULL,
  `industryHotWord` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `company_id` int(20) NOT NULL COMMENT '代运营公司id',
  `type_tag` varchar(50) NOT NULL COMMENT '推广平台类型（百度，360，神马...）',
  `login_name` varchar(100) DEFAULT NULL COMMENT '代运营公司的推广账号-登录名称',
  `login_password` varchar(100) DEFAULT NULL COMMENT '代运营公司的推广账号-登录密码',
  `account_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '代运营公司的使用状态（0：启用，1：停用）',
  PRIMARY KEY (`id`,`account_state`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8 COMMENT='代运营公司推广账号';

/*Table structure for table `backup` */

DROP TABLE IF EXISTS `backup`;

CREATE TABLE `backup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `is_good` int(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1693 DEFAULT CHARSET=utf8;

/*Table structure for table `best_keyword` */

DROP TABLE IF EXISTS `best_keyword`;

CREATE TABLE `best_keyword` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `industry_id` varchar(50) NOT NULL COMMENT '行业id',
  `title` varchar(100) NOT NULL COMMENT '标题（细分行业）',
  `promotion_date` date NOT NULL COMMENT '推广日期',
  `promotion_keyword` varchar(100) NOT NULL COMMENT '推广关键词',
  `keyword_search` varchar(100) NOT NULL COMMENT '搜索关键词',
  `save_date` datetime NOT NULL COMMENT '保存时间',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `keyword_search` (`keyword_search`),
  KEY `title` (`title`),
  KEY `industry_id` (`industry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='最优行业关键词';

/*Table structure for table `company` */

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `industry_id` varchar(50) NOT NULL COMMENT '所属行业',
  `user_id` int(20) NOT NULL COMMENT '所属sem用户id',
  `register_time` datetime NOT NULL COMMENT '注册时间',
  `company_name` varchar(255) NOT NULL COMMENT '代运营公司名称',
  `phone` varchar(255) DEFAULT NULL COMMENT '公司电话',
  `email` varchar(255) DEFAULT NULL COMMENT '电子邮件',
  `address` varchar(255) DEFAULT NULL COMMENT '公司地址',
  `postcard` varchar(255) DEFAULT NULL COMMENT '邮编',
  `company_state` varchar(50) DEFAULT NULL COMMENT '代运营公司状态',
  `is_synchronized_to_ysb` varchar(2) DEFAULT NULL COMMENT '是否同步到易数宝',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8 COMMENT='代运营公司';

/*Table structure for table `company_major_business` */

DROP TABLE IF EXISTS `company_major_business`;

CREATE TABLE `company_major_business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `major_business` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `customer_follow_up` */

DROP TABLE IF EXISTS `customer_follow_up`;

CREATE TABLE `customer_follow_up` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `company_id` int(20) NOT NULL COMMENT '公司id',
  `user_id` varchar(50) NOT NULL COMMENT '跟进人id',
  `user_name` varchar(20) DEFAULT NULL COMMENT '跟进人',
  `company_name` varchar(200) DEFAULT NULL COMMENT '公司名称',
  `follow_up_title` varchar(200) DEFAULT NULL COMMENT '跟进标题',
  `follow_up_content` varchar(1200) DEFAULT NULL COMMENT '跟进内容',
  `follow_up_time` datetime DEFAULT NULL COMMENT '跟进时间',
  `state` varchar(20) DEFAULT NULL COMMENT '是否生效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `industry` */

DROP TABLE IF EXISTS `industry`;

CREATE TABLE `industry` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `industry_name` varchar(50) NOT NULL COMMENT '行业名称',
  `is_industry_to_ysb_synchronized` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `industry_name` (`industry_name`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='行业表';

/*Table structure for table `industry_goal` */

DROP TABLE IF EXISTS `industry_goal`;

CREATE TABLE `industry_goal` (
  `id` varchar(255) NOT NULL,
  `avgConsultGoal` double DEFAULT NULL,
  `avgConversionGoal` double DEFAULT NULL,
  UNIQUE KEY `unique_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `inverseKeyword` */

DROP TABLE IF EXISTS `inverseKeyword`;

CREATE TABLE `inverseKeyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `industryId` varchar(255) DEFAULT NULL,
  `industryName` varchar(255) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `mainBussiness` varchar(255) DEFAULT NULL,
  `inverseKeyword` varchar(255) DEFAULT NULL,
  `matchedPattern` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `keyword_maping` */

DROP TABLE IF EXISTS `keyword_maping`;

CREATE TABLE `keyword_maping` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `company_id` int(20) NOT NULL COMMENT '代运营公司id',
  `promotion_keyword` varchar(100) NOT NULL COMMENT '推广关键词（不重复）',
  `keyword_search` longtext NOT NULL COMMENT '搜索关键词',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=270666 DEFAULT CHARSET=utf8 COMMENT='推广关键词对应多个搜索关键词';

/*Table structure for table `mainBussiness` */

DROP TABLE IF EXISTS `mainBussiness`;

CREATE TABLE `mainBussiness` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `industryId` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `industryName` varchar(255) DEFAULT NULL,
  `mainBussiness` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1132 DEFAULT CHARSET=utf8;

/*Table structure for table `optimization_trategy` */

DROP TABLE IF EXISTS `optimization_trategy`;

CREATE TABLE `optimization_trategy` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `company_id` int(20) NOT NULL,
  `show_date` datetime NOT NULL,
  `optimization` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `origin_baidu` */

DROP TABLE IF EXISTS `origin_baidu`;

CREATE TABLE `origin_baidu` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `import_date` datetime NOT NULL COMMENT '文件导入时间',
  `user_id` int(20) NOT NULL COMMENT '文件导入者',
  `company_id` int(20) NOT NULL COMMENT '代运营公司id',
  `account_id` int(20) NOT NULL COMMENT '代运营公司账号id',
  `promotion_date` date NOT NULL COMMENT '推广日期',
  `promotion_plan` varchar(100) NOT NULL COMMENT '推广计划',
  `promotion_unit` varchar(100) NOT NULL COMMENT '推广单元',
  `promotion_keyword` varchar(100) NOT NULL COMMENT '推广关键词',
  `keyword_search` varchar(100) NOT NULL COMMENT '搜索关键词',
  `add_state` varchar(50) NOT NULL COMMENT '当前单元的添加状态',
  `number_exhibit` int(20) NOT NULL COMMENT '展现量',
  `number_click` int(20) NOT NULL COMMENT '点击量',
  `consume` double(32,2) NOT NULL COMMENT '消费',
  `click_rate` varchar(50) NOT NULL COMMENT '点击率',
  `totalnumber_consult` int(20) NOT NULL COMMENT '总转化量',
  `exact_match` varchar(50) DEFAULT NULL COMMENT '精确匹配扩展(地域词扩展)触发',
  `hight_exact_match` varchar(50) DEFAULT NULL COMMENT '高级精确匹配触发',
  `consume_consult_rate` double(32,3) NOT NULL COMMENT '消费转化比',
  `quadrant_tag` varchar(50) DEFAULT NULL COMMENT '所属象限（1,2,3,4，delete，other）',
  `keyword_search_price` varchar(50) DEFAULT NULL COMMENT '关键词出价',
  `keyword_search_mate` varchar(50) DEFAULT NULL COMMENT '关键词匹配模式',
  `token` varchar(32) DEFAULT NULL COMMENT '权限代码',
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `user_id` (`user_id`),
  KEY `company_id` (`company_id`),
  KEY `promotion_date` (`promotion_date`),
  KEY `promotion_plan` (`promotion_plan`),
  KEY `promotion_keyword` (`promotion_keyword`),
  KEY `keyword_search` (`keyword_search`)
) ENGINE=InnoDB AUTO_INCREMENT=3366938 DEFAULT CHARSET=utf8 COMMENT='百度消费数据表(原始数据)';

/*Table structure for table `originality` */

DROP TABLE IF EXISTS `originality`;

CREATE TABLE `originality` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `import_date` datetime NOT NULL COMMENT '导入时间',
  `user_id` int(11) NOT NULL COMMENT '文件导入者',
  `company_id` int(11) NOT NULL COMMENT '代运营公司',
  `account_id` int(11) NOT NULL COMMENT '代运营公司账号id',
  `promotion_date` date NOT NULL COMMENT '推广日期',
  `account` varchar(100) NOT NULL COMMENT '账户',
  `promotion_plan` varchar(100) NOT NULL COMMENT '推广计划',
  `promotion_unit` varchar(100) NOT NULL COMMENT '推广单元',
  `originality_title` varchar(255) NOT NULL COMMENT '创意标题',
  `originality_describe_one` text NOT NULL COMMENT '创意描述1',
  `originality_describe_two` text COMMENT '创意描述2',
  `display_url` varchar(255) DEFAULT NULL COMMENT '显示URL',
  `number_click` int(11) DEFAULT '-1' COMMENT '点击',
  `consume` double DEFAULT '-1' COMMENT '消费',
  `click_rate` double DEFAULT '-1' COMMENT '点击率',
  `cpc` double DEFAULT '-1' COMMENT '平均点击价格',
  `average_ranking` double DEFAULT '-1' COMMENT '平均排名',
  `webpage_consult` int(11) DEFAULT '-1' COMMENT '网页转化',
  `bridge_consult` int(11) DEFAULT '-1' COMMENT '商桥转化',
  `phone_consult` int(11) DEFAULT '-1' COMMENT '电话转化',
  `number_exhibit` int(11) DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1051972 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `promotion_plan` */

DROP TABLE IF EXISTS `promotion_plan`;

CREATE TABLE `promotion_plan` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `company_id` int(20) NOT NULL COMMENT '代运营公司ID',
  `account_id` int(20) NOT NULL COMMENT '代运营公司账号ID',
  `date` datetime DEFAULT NULL COMMENT '日期',
  `plan_name` varchar(50) NOT NULL COMMENT '推广计划名称',
  `if_delete` tinyint(4) DEFAULT '0' COMMENT '是否被删除(0：未删除，1：已删除)',
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17346 DEFAULT CHARSET=utf8 COMMENT='推广计划';

/*Table structure for table `promotion_unit` */

DROP TABLE IF EXISTS `promotion_unit`;

CREATE TABLE `promotion_unit` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(50) NOT NULL COMMENT '推广单元名称',
  `add_sate` tinyint(4) DEFAULT '0' COMMENT '当前单元的添加状态(0：未添加，1：已添加)',
  `if_delete` tinyint(4) DEFAULT '0' COMMENT '推广单元是否被删除(0：未删除，1：已删除)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19942 DEFAULT CHARSET=utf8 COMMENT='推广单元';

/*Table structure for table `quadrant` */

DROP TABLE IF EXISTS `quadrant`;

CREATE TABLE `quadrant` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `industry_id` varchar(50) NOT NULL COMMENT '行业id',
  `quadrant_name` varchar(50) DEFAULT NULL COMMENT '象限名称',
  `description` varchar(200) DEFAULT NULL COMMENT '象限描述',
  `tag` varchar(50) DEFAULT NULL COMMENT '象限标志（1,2,3,4）',
  `click_rate_min` double(32,3) DEFAULT '0.000' COMMENT '最小点击转化比（总转化／点击次数）',
  `click_rate_max` double(32,3) DEFAULT '0.000' COMMENT '最大点击转化比（总转化／点击次数）',
  `consume_rate_min` double(32,3) NOT NULL DEFAULT '0.000' COMMENT '最小消费转化比（总转化／消费金额）',
  `consume_rate_max` double(32,3) NOT NULL DEFAULT '0.000' COMMENT '最大消费转化比（总转化／消费金额）',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `industry_id` (`industry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='四象限（1,2,3,4，直接删除，其他）';

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户角色表';

/*Table structure for table `sem_platform_type` */

DROP TABLE IF EXISTS `sem_platform_type`;

CREATE TABLE `sem_platform_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) NOT NULL COMMENT '推广类型名称（百度，360，神马...）',
  `type_tag` varchar(50) NOT NULL COMMENT '推广类型标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='推广平台类型';

/*Table structure for table `specialCompany` */

DROP TABLE IF EXISTS `specialCompany`;

CREATE TABLE `specialCompany` (
  `companyId` int(11) DEFAULT NULL,
  `companyName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `industryName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `companyLabel` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '特殊或者普通消费用户'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `strategy` */

DROP TABLE IF EXISTS `strategy`;

CREATE TABLE `strategy` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `company_id` int(20) NOT NULL COMMENT '公司id',
  `company_name` varchar(200) DEFAULT NULL COMMENT '公司名',
  `strategy` varchar(3000) DEFAULT NULL COMMENT '优化策略',
  PRIMARY KEY (`id`,`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `template` */

DROP TABLE IF EXISTS `template`;

CREATE TABLE `template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `column` varchar(100) NOT NULL COMMENT '所需字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据模板';

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `register_time` datetime DEFAULT NULL COMMENT '注册时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `employee_name` varchar(50) NOT NULL COMMENT '员工名称',
  `employee_number` varchar(50) NOT NULL COMMENT '员工工号',
  `user_state` varchar(50) DEFAULT NULL COMMENT '用户状态',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) NOT NULL COMMENT '用户id',
  `role_id` int(20) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=832 DEFAULT CHARSET=utf8 COMMENT='用户-角色表';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
