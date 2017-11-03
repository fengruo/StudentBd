/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50716
Source Host           : 127.0.0.1:3306
Source Database       : studentrxdb

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-11-03 21:49:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_major_id` int(11) NOT NULL,
  `c_name` varchar(20) NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `c_major_id` (`c_major_id`),
  CONSTRAINT `class_ibfk_1` FOREIGN KEY (`c_major_id`) REFERENCES `major` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `d_name` varchar(20) NOT NULL,
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for guardian
-- ----------------------------
DROP TABLE IF EXISTS `guardian`;
CREATE TABLE `guardian` (
  `g_id` int(11) NOT NULL AUTO_INCREMENT,
  `g_id_card` varchar(20) DEFAULT NULL,
  `g_name1` varchar(20) DEFAULT NULL,
  `g_tel1` varchar(20) DEFAULT NULL,
  `g_name2` varchar(20) DEFAULT NULL,
  `g_tel2` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`g_id`),
  KEY `g_id-card` (`g_id_card`),
  CONSTRAINT `guardian_ibfk_1` FOREIGN KEY (`g_id_card`) REFERENCES `student` (`s_id_card`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=650 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `d_id` int(11) DEFAULT NULL,
  `m_name` varchar(20) NOT NULL,
  `training_level` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`m_id`),
  KEY `d_id` (`d_id`),
  CONSTRAINT `major_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `department` (`d_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for manage
-- ----------------------------
DROP TABLE IF EXISTS `manage`;
CREATE TABLE `manage` (
  `ma_id` int(11) NOT NULL AUTO_INCREMENT,
  `ma_name` varchar(255) DEFAULT NULL COMMENT '管理员用户名',
  `ma_password` varchar(255) DEFAULT NULL COMMENT '管理员密码',
  `ma_del` int(4) DEFAULT '0' COMMENT '管理员是否删除',
  `ma_state` int(4) DEFAULT NULL COMMENT '管理员类别 1 超级管理员 2教师辅导员',
  `ma_teacherid` int(4) DEFAULT NULL COMMENT '对应教师ID',
  PRIMARY KEY (`ma_id`),
  KEY `ma_teacherid` (`ma_teacherid`),
  CONSTRAINT `manage_ibfk_1` FOREIGN KEY (`ma_teacherid`) REFERENCES `teacher` (`t_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for organize
-- ----------------------------
DROP TABLE IF EXISTS `organize`;
CREATE TABLE `organize` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `o_id_card` varchar(20) DEFAULT NULL,
  `o_status` varchar(20) DEFAULT NULL,
  `o_fromwhere` varchar(255) DEFAULT NULL,
  `o_partyname` varchar(20) DEFAULT NULL,
  `o_degree` varchar(20) DEFAULT NULL,
  `o_lette` varchar(20) DEFAULT NULL,
  `o_time` datetime DEFAULT NULL,
  `o_fee_time` datetime DEFAULT NULL,
  PRIMARY KEY (`o_id`),
  KEY `o_id-card` (`o_id_card`),
  CONSTRAINT `organize_ibfk_1` FOREIGN KEY (`o_id_card`) REFERENCES `student` (`s_id_card`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for politicsstatus
-- ----------------------------
DROP TABLE IF EXISTS `politicsstatus`;
CREATE TABLE `politicsstatus` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_political_status` varchar(20) NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for state
-- ----------------------------
DROP TABLE IF EXISTS `state`;
CREATE TABLE `state` (
  `st_id` int(11) NOT NULL AUTO_INCREMENT,
  `st_name` varchar(20) NOT NULL,
  PRIMARY KEY (`st_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `s_id_card` varchar(20) DEFAULT NULL,
  `s_exam_number` varchar(20) NOT NULL,
  `s_student_number` varchar(20) DEFAULT NULL,
  `s_name` varchar(20) DEFAULT NULL,
  `s_sex` varchar(4) DEFAULT NULL,
  `s_age` int(4) DEFAULT NULL,
  `s_province` varchar(20) DEFAULT NULL,
  `s_native_place` varchar(40) DEFAULT NULL,
  `s_address` varchar(255) DEFAULT NULL,
  `s_riding_section` varchar(255) DEFAULT NULL,
  `s_p_id` int(11) DEFAULT NULL,
  `s_nation` varchar(20) DEFAULT NULL,
  `s_tel` varchar(20) DEFAULT NULL,
  `s_email` varchar(55) DEFAULT NULL,
  `s_dormitory_id` varchar(55) DEFAULT '0',
  `s_train_level` varchar(20) DEFAULT NULL,
  `s_education_system` int(4) DEFAULT NULL,
  `s_class_id` int(4) DEFAULT NULL,
  `s_family_population` int(4) DEFAULT NULL,
  `s_state_id` int(4) DEFAULT '4',
  `s_note` text,
  PRIMARY KEY (`s_exam_number`),
  KEY `s_p_id` (`s_p_id`),
  KEY `s_class_id` (`s_class_id`),
  KEY `s_state_id` (`s_state_id`),
  KEY `s_id-card` (`s_id_card`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`s_p_id`) REFERENCES `politicsstatus` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`s_class_id`) REFERENCES `class` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_ibfk_3` FOREIGN KEY (`s_state_id`) REFERENCES `state` (`st_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_name` varchar(20) DEFAULT NULL,
  `t_sex` varchar(4) DEFAULT NULL,
  `t_age` int(4) DEFAULT NULL,
  `t_tel` varchar(20) DEFAULT NULL,
  `t_email` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_c_connection
-- ----------------------------
DROP TABLE IF EXISTS `t_c_connection`;
CREATE TABLE `t_c_connection` (
  `tc_id` int(11) NOT NULL AUTO_INCREMENT,
  `tc_tea_id` int(11) DEFAULT NULL,
  `tc_cla_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tc_id`),
  KEY `tc_tea_id` (`tc_tea_id`),
  KEY `tc_cla_id` (`tc_cla_id`),
  CONSTRAINT `t_c_connection_ibfk_1` FOREIGN KEY (`tc_tea_id`) REFERENCES `teacher` (`t_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_c_connection_ibfk_2` FOREIGN KEY (`tc_cla_id`) REFERENCES `class` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8;

-- ----------------------------
-- View structure for basic_info_sta_freshmen_view
-- ----------------------------
DROP VIEW IF EXISTS `basic_info_sta_freshmen_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `basic_info_sta_freshmen_view` AS select `department`.`d_name` AS `d_name`,`student`.`s_name` AS `s_name`,`major`.`m_name` AS `m_name`,`class`.`c_name` AS `c_name`,`student`.`s_train_level` AS `s_train_level`,`student`.`s_education_system` AS `s_education_system`,`student`.`s_dormitory_id` AS `s_dormitory_id`,`student`.`s_sex` AS `s_sex`,cast(substr(`student`.`s_id_card`,7,8) as datetime) AS `date_birth`,`student`.`s_nation` AS `s_nation`,`politicsstatus`.`p_political_status` AS `p_political_status`,`student`.`s_id_card` AS `s_id_card`,`student`.`s_native_place` AS `s_native_place`,`student`.`s_address` AS `s_address`,`student`.`s_riding_section` AS `s_riding_section`,`guardian`.`g_name1` AS `g_name1`,`guardian`.`g_tel1` AS `g_tel1`,`guardian`.`g_name2` AS `g_name2`,`guardian`.`g_tel2` AS `g_tel2`,`student`.`s_family_population` AS `s_family_population` from (((((`student` join `politicsstatus`) join `guardian`) join `department`) join `major`) join `class`) where ((`student`.`s_p_id` = `politicsstatus`.`p_id`) and (`student`.`s_id_card` = `guardian`.`g_id_card`) and (`department`.`d_id` = `major`.`d_id`) and (`major`.`m_id` = `class`.`c_major_id`) and (`student`.`s_class_id` = `class`.`c_id`)) ;

-- ----------------------------
-- View structure for stu_basic_info_regist_view
-- ----------------------------
DROP VIEW IF EXISTS `stu_basic_info_regist_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stu_basic_info_regist_view` AS select `student`.`s_name` AS `s_name`,`student`.`s_sex` AS `s_sex`,`student`.`s_age` AS `s_age`,`student`.`s_nation` AS `s_nation`,`politicsstatus`.`p_political_status` AS `p_political_status`,`student`.`s_province` AS `s_province`,`student`.`s_address` AS `s_address`,`student`.`s_tel` AS `s_tel`,`guardian`.`g_tel1` AS `g_tel1`,`guardian`.`g_tel2` AS `g_tel2`,`student`.`s_dormitory_id` AS `s_dormitory_id`,`student`.`s_note` AS `s_note` from ((`student` join `politicsstatus`) join `guardian`) where ((`student`.`s_p_id` = `politicsstatus`.`p_id`) and (`student`.`s_id_card` = `guardian`.`g_id_card`)) ;

-- ----------------------------
-- View structure for stu_re_brief_info_view
-- ----------------------------
DROP VIEW IF EXISTS `stu_re_brief_info_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stu_re_brief_info_view` AS select `student`.`s_id_card` AS `s_id_card`,`student`.`s_name` AS `s_name`,`student`.`s_sex` AS `s_sex`,`department`.`d_name` AS `d_name`,`major`.`m_name` AS `m_name`,`major`.`training_level` AS `training_level`,`class`.`c_name` AS `c_name`,`state`.`st_name` AS `st_name` from ((((`student` join `department`) join `class`) join `major`) join `state`) where ((`student`.`s_class_id` = `class`.`c_id`) and (`class`.`c_major_id` = `major`.`m_id`) and (`major`.`d_id` = `department`.`d_id`) and (`student`.`s_state_id` = `state`.`st_id`)) ;

-- ----------------------------
-- Procedure structure for updateSS
-- ----------------------------
DROP PROCEDURE IF EXISTS `updateSS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSS`()
BEGIN
	UPDATE student set s_education_system =4 where s_train_level="本科";
	UPDATE student set s_education_system =3 where s_train_level="专科";
	UPDATE student set s_education_system =2 where s_train_level="专本";
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for 专业级分类汇总
-- ----------------------------
DROP PROCEDURE IF EXISTS `专业级分类汇总`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `专业级分类汇总`()
begin
select m_name as '专业名称',count(*) as '录取人数',sum(s_sex='女') as '录取女生人数',sum(s_sex='男') as '录取男生人数',sum(s_sex='女' and st_name='在校') as '实到女生人数',sum(s_sex='男' and st_name='在校') as '实到男生人数',sum(st_name='在校') as '已报到人数'
	from stu_re_brief_info_view
	group by m_name;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for 信息汇总
-- ----------------------------
DROP PROCEDURE IF EXISTS `信息汇总`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `信息汇总`()
begin
select d_name as '汇总类别',count(*) as '录取人数',sum(s_sex='女') as '录取女生人数',sum(s_sex='男') as '录取男生人数',sum(s_sex='女' and st_name='在校') as '实到女生人数',sum(s_sex='男' and st_name='在校') as '实到男生人数',sum(st_name='在校') as '已报到人数'
	from stu_re_brief_info_view
	group by d_name
union all
select training_level as '汇总类别',count(*) as '录取人数',sum(s_sex='女') as '录取女生人数',sum(s_sex='男') as '录取男生人数',sum(s_sex='女' and st_name='在校') as '实到女生人数',sum(s_sex='男' and st_name='在校') as '实到男生人数',sum(st_name='在校') as '已报到人数'
	from stu_re_brief_info_view
	group by training_level
union all
select m_name as '汇总类别',count(*) as '录取人数',sum(s_sex='女') as '录取女生人数',sum(s_sex='男') as '录取男生人数',sum(s_sex='女' and st_name='在校') as '实到女生人数',sum(s_sex='男' and st_name='在校') as '实到男生人数',sum(st_name='在校') as '已报到人数'
	from stu_re_brief_info_view
	group by m_name
union all
select c_name as '汇总类别',count(*) as '录取人数',sum(s_sex='女') as '录取女生人数',sum(s_sex='男') as '录取男生人数',sum(s_sex='女' and st_name='在校') as '实到女生人数',sum(s_sex='男' and st_name='在校') as '实到男生人数',sum(st_name='在校') as '已报到人数'
	from stu_re_brief_info_view
	group by c_name;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for 培养层次分类汇总
-- ----------------------------
DROP PROCEDURE IF EXISTS `培养层次分类汇总`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `培养层次分类汇总`()
begin
select training_level as '培养层次',count(*) as '录取人数',sum(s_sex='女') as '录取女生人数',sum(s_sex='男') as '录取男生人数',sum(s_sex='女' and st_name='在校') as '实到女生人数',sum(s_sex='男' and st_name='在校') as '实到男生人数',sum(st_name='在校') as '已报到人数'
	from stu_re_brief_info_view
	group by training_level;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for 学生基本信息登记表
-- ----------------------------
DROP PROCEDURE IF EXISTS `学生基本信息登记表`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `学生基本信息登记表`()
begin
select @rownum:=@rownum+1 as '编号',s_name as '学生姓名',s_sex as '性别',s_age as '年龄',s_nation as '民族',p_political_status as '政治面貌',s_province as '省份',s_address as '家庭详细地址',s_tel as '本人电话',g_tel1 as '父亲电话',g_tel2 as '母亲电话',s_dormitory_id as '宿舍号',s_note as '备注'
	from (SELECT @rownum:=0) r,student,politicsstatus,guardian
	where student.s_p_id=politicsstatus.p_id and student.s_id_card=guardian.g_id_card ;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for 学院级分类汇总
-- ----------------------------
DROP PROCEDURE IF EXISTS `学院级分类汇总`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `学院级分类汇总`()
begin
select d_name as '学院名称',count(*) as '录取人数',sum(s_sex='女') as '录取女生人数',sum(s_sex='男') as '录取男生人数',sum(s_sex='女' and st_name='在校') as '实到女生人数',sum(s_sex='男' and st_name='在校') as '实到男生人数',sum(st_name='在校') as '已报到人数'
	from stu_re_brief_info_view
	group by d_name;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for 新生基本信息统计表
-- ----------------------------
DROP PROCEDURE IF EXISTS `新生基本信息统计表`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `新生基本信息统计表`()
begin
select d_name as '学院名称',s_name as '姓名',m_name as '专业',c_name as '班级',s_train_level as '培养层次',s_education_system as '学制',s_dormitory_id as '宿舍号',s_sex as '性别',CAST(SUBSTRING(s_id_card,7,8) AS DATE) as '出生年月日',s_nation as '民族',p_political_status as '政治面貌',s_id_card as '身份证号码',s_native_place as '籍贯',s_address as '家庭住址',s_riding_section as '乘车区间',g_name1 as '监护人1姓名',g_tel1 as '联系电话',g_name2 as '监护人2姓名',g_tel2 as '联系电话',s_family_population as '家庭人口数',s_tel as '本人电话'
	from student,politicsstatus,guardian,department,major,class
	where student.s_p_id=politicsstatus.p_id and student.s_id_card=guardian.g_id_card and department.d_id=major.d_id and major.m_id=class.c_major_id and student.s_class_id=class.c_id ;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for 新生报到情况一览表
-- ----------------------------
DROP PROCEDURE IF EXISTS `新生报到情况一览表`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `新生报到情况一览表`()
begin
select d_name as '汇总类别',count(s_name) as '录取人数',sum(st_name='在校') as '已报到人数',sum(st_name='未报到') as '未报到人数'
	from stu_re_brief_info_view
	group by d_name
union all
select training_level as '汇总类别',count(s_name) as '录取人数',sum(st_name='在校') as '已报到人数',sum(st_name='未报到') as '未报到人数'
	from stu_re_brief_info_view
	group by training_level
union all
select m_name as '汇总类别',count(s_name) as '录取人数',sum(st_name='在校') as '已报到人数',sum(st_name='未报到') as '未报到人数'
	from stu_re_brief_info_view
	group by m_name
union all
select c_name as '汇总类别',count(s_name) as '录取人数',sum(st_name='在校') as '已报到人数',sum(st_name='未报到') as '未报到人数'
	from stu_re_brief_info_view
	group by c_name;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for 班级分类汇总
-- ----------------------------
DROP PROCEDURE IF EXISTS `班级分类汇总`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `班级分类汇总`()
begin
select c_name as '班级名称',count(*) as '录取人数',sum(s_sex='女') as '录取女生人数',sum(s_sex='男') as '录取男生人数',sum(s_sex='女' and st_name='在校') as '实到女生人数',sum(s_sex='男' and st_name='在校') as '实到男生人数',sum(st_name='在校') as '已报到人数'
	from stu_re_brief_info_view
	group by c_name;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for 班级分类汇总(含学院)
-- ----------------------------
DROP PROCEDURE IF EXISTS `班级分类汇总(含学院)`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `班级分类汇总(含学院)`()
begin
select (select d_name from class,major,department where department.d_id= major.d_id and student.s_class_id=class.c_id and class.c_major_id=major.m_id) as '学院',(select c_name from class where c_id= s_class_id) as '专业班级',count(*) as '录取人数',sum(s_sex='女') as '录取女生人数',sum(s_sex='男') as '录取男生人数',sum(s_sex='女' and s_state_id='1') as '实到女生人数',sum(s_sex='男' and s_state_id='1') as '实到男生人数',sum(s_state_id='1') as '已报到人数'
	from student
	group by s_class_id;
end
;;
DELIMITER ;
