/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50716
Source Host           : 127.0.0.1:3306
Source Database       : studentrxdb

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-11-03 21:47:12
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
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('21', '16', '网络工程17-1');
INSERT INTO `class` VALUES ('22', '16', '网络工程17-2');
INSERT INTO `class` VALUES ('23', '17', '网络工程(网络软件开发)17-1');
INSERT INTO `class` VALUES ('24', '17', ' 网络工程(网络软件开发)17-2');
INSERT INTO `class` VALUES ('25', '18', '物联网工程17-1');
INSERT INTO `class` VALUES ('26', '18', '物联网工程17-2');
INSERT INTO `class` VALUES ('27', '19', '计算机应用技术17-1');
INSERT INTO `class` VALUES ('28', '19', '计算机应用技术17-2');
INSERT INTO `class` VALUES ('29', '20', '数字媒体应用技术17-1');
INSERT INTO `class` VALUES ('30', '20', '数字媒体应用技术17-2');
INSERT INTO `class` VALUES ('31', '16', ' 网络工程（专升本）17');

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
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '信息工程学院');

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
-- Records of guardian
-- ----------------------------
INSERT INTO `guardian` VALUES ('564', '411122199907148233', '李志强', '13871543017', '李书凯', '15188409320');
INSERT INTO `guardian` VALUES ('565', '412726199709196217', '孟庆学', '15958829530', '', '');
INSERT INTO `guardian` VALUES ('566', '411422199712246323', '付修建', '15090540695', '焦献玲', '13462750726');
INSERT INTO `guardian` VALUES ('567', '412722199412017331', '徐占国', '15838087053', '刘金霞', '13849031864');
INSERT INTO `guardian` VALUES ('568', '41152119990314832X', '张志春', '15839780865', '刘平荣', '15839780865');
INSERT INTO `guardian` VALUES ('569', '411422199806308046', '常军起', '13503401561', '王俊霞', '13608402793');
INSERT INTO `guardian` VALUES ('570', '412825199811261010', '赵要珠', '13940870629', '赵堆', '13783340497');
INSERT INTO `guardian` VALUES ('571', '412829199604095617', '单小洲', '15820427964', '王金珠', '13223868573');
INSERT INTO `guardian` VALUES ('572', '413026199911057520', '胡孝玉', '13140606888', '胡孝玉', '03766386669');
INSERT INTO `guardian` VALUES ('573', '411422199905103345', '王兴江', '13269278116', '孙永兰', '15239945612');
INSERT INTO `guardian` VALUES ('575', '411323199804234419', '杨雪红', '13579832012', '', '');
INSERT INTO `guardian` VALUES ('576', '410881199902277017', '刘秋霞', '15039187220', '蒋进京', '');
INSERT INTO `guardian` VALUES ('577', '411524199807260513', '沈明江', '13526048072', '李长梅', '13303760989');
INSERT INTO `guardian` VALUES ('578', '413026199805106616', '冯明强', '18137122533', '王炜', '15839763357');
INSERT INTO `guardian` VALUES ('579', '411525199512010919', '何道仁', '13910714035', '向文芳', '13716508906');
INSERT INTO `guardian` VALUES ('580', '410821200003060075', '杨帆', '13782718858', '张四香', '15139176518');
INSERT INTO `guardian` VALUES ('581', '410726199902239520', '张志国', '15716681066', '褚云梅', '15903080737');
INSERT INTO `guardian` VALUES ('582', '411528199810290719', '齐清伟', '18697730418', '王永', '13033774591');
INSERT INTO `guardian` VALUES ('583', '412723200003025965', '李海彦', '15346065851', '赵红梨', '18238918659');
INSERT INTO `guardian` VALUES ('584', '412827199802070514', '王书平', '13137366646', '李小瑞', '13283071710');
INSERT INTO `guardian` VALUES ('585', '411323199707204453', '王成文', '18336643121', '', '');
INSERT INTO `guardian` VALUES ('586', '410711199711221024', '李拥军', '13462328753', '张桂', '13462328723');
INSERT INTO `guardian` VALUES ('587', '410323199908204010', '孔天喜', '13137042131', '郭贞子', '15516365383');
INSERT INTO `guardian` VALUES ('588', '412702199707228130', '张险峰', '18839487716', '付丽', '15896740808');
INSERT INTO `guardian` VALUES ('589', '413026199905042445', '杨庆宝', '18837672598', '黄美兵', '18873812081');
INSERT INTO `guardian` VALUES ('590', '410803199901090032', '韩红军', '13343623848', '张应琴', '13343623748');
INSERT INTO `guardian` VALUES ('592', '411502200002180011', '夏永华', '13569754886', '', '');
INSERT INTO `guardian` VALUES ('593', '511321199812012083', '李廷雄', '15352691819', '', '');
INSERT INTO `guardian` VALUES ('594', '411002199809150523', '郝改霞', '15893752462', '', '');
INSERT INTO `guardian` VALUES ('595', '654221199810231619', '刘新华', '15899391045', '李红杰', '13399903700');
INSERT INTO `guardian` VALUES ('596', '411521199911255723', '胡艳芳', '18738683993', '余长成', '13380101438');
INSERT INTO `guardian` VALUES ('598', '410184199810135020', '张广军', '13373926073', '马会平', '17788121235');
INSERT INTO `guardian` VALUES ('599', '41272419980510691X', '李树田', '13790365668', '李春霞', '15225717658');
INSERT INTO `guardian` VALUES ('600', '411524199906102019', '袁明琴', '18236282670', '施兴贵', '15978592938');
INSERT INTO `guardian` VALUES ('602', '342225199605210019', '袁崇胜', '13721275687', '', '');
INSERT INTO `guardian` VALUES ('603', '411502199905230010', '阮祥安', '13937693548', '毛秀琴', '18737685158');
INSERT INTO `guardian` VALUES ('604', '410611199810244517', '田建明', '13033898068', '田建明', '13033881196');
INSERT INTO `guardian` VALUES ('605', '410702199902140511', '苗宇', '18937399150', '张芬霞', '13503736045');
INSERT INTO `guardian` VALUES ('606', '411323199811292115', '张瑞刚', '13193677509', '', '');
INSERT INTO `guardian` VALUES ('607', '650103199811225112', '白龙', '18129301100', '杨福华', '18999271880');
INSERT INTO `guardian` VALUES ('609', '411625199805285831', '谢福军', '18737953978', '郝现英', '1318307671');
INSERT INTO `guardian` VALUES ('610', '411528199908200013', '徐伟', '13723139779', '徐丽', '13523908750');
INSERT INTO `guardian` VALUES ('612', '41148119970210062X', '李维明', '17638403579', '刘雪玲', '18039942428');
INSERT INTO `guardian` VALUES ('613', '411528199903122925', '陈玉宝', '15738270419', '汪妮', '13839756244');
INSERT INTO `guardian` VALUES ('614', '412825199708213715', '朱小贺', '13526383852', '赵明峰', '15993454087');
INSERT INTO `guardian` VALUES ('615', '412326199504086020', '邵金房', '13781619909', '', '');
INSERT INTO `guardian` VALUES ('616', '411303199901140013', '魏元红', '15837776757', '闫宏生', '13721819803');
INSERT INTO `guardian` VALUES ('619', '371202199810231249', '亓振敏', '13031761133', '魏洪霞', '13686349556');
INSERT INTO `guardian` VALUES ('620', '410122199806142667', '孙国选', '13663004841', '王香梅', '15037179247');
INSERT INTO `guardian` VALUES ('621', '410422199802267012', '崔书锋', '13523755046', '', '');
INSERT INTO `guardian` VALUES ('625', '411524199809012732', '李东', '15078125036', '薄香绮', '18737672066');
INSERT INTO `guardian` VALUES ('626', '650103199904090616', '陈兴华', '13369693127', '刘玉红', '13899910996');
INSERT INTO `guardian` VALUES ('627', '410923199908161033', '邸国强', '15936718038', '樊朋娇', '15890496803');
INSERT INTO `guardian` VALUES ('628', '411627199804086913', '陈德让', '15039408516', '', '');
INSERT INTO `guardian` VALUES ('629', '410711199809163010', '薛瑞云', '13598703268', '康锋', '18237385115');
INSERT INTO `guardian` VALUES ('630', '410881199902205013', '周喜战', '15838969537', '卢菊叶', '15239733462');
INSERT INTO `guardian` VALUES ('631', '413026199804017216', '柴志玲', '13507604832', '张久林', '13937699016');
INSERT INTO `guardian` VALUES ('632', '652222199806101218', '郭延智', '17799354995', '张凤荣', '17799355133');
INSERT INTO `guardian` VALUES ('633', '412726200011105980', '赵书生', '15539434531', '', '');
INSERT INTO `guardian` VALUES ('634', '412724199605044021', '张桂霞', '17057170804', '杨朝光', '18910825982');
INSERT INTO `guardian` VALUES ('635', '412725199801116535', '任进良', '18272841308', '郭晓群', '13781238841');
INSERT INTO `guardian` VALUES ('636', '412726200004115945', '曹德新', '15333891992', '', '');
INSERT INTO `guardian` VALUES ('637', '412824199910145510', '黄彦坡', '13353879172', '张艳', '13513968346');
INSERT INTO `guardian` VALUES ('638', '410883199909190312', '郭军芳', '13513822730', '姬梦龙', '15893056520');
INSERT INTO `guardian` VALUES ('639', '412725199707284612', '王现岭', '17186721389', '李桂林', '15138299489');
INSERT INTO `guardian` VALUES ('640', '412723199712160857', '顾振华', '13939438910', '李倾', '18749267892');
INSERT INTO `guardian` VALUES ('641', '412825199802063370', '董珍', '13513978178', '', '');
INSERT INTO `guardian` VALUES ('643', '412723199909287317', '苏宁', '13673574661', '朱海停', '13637610762');
INSERT INTO `guardian` VALUES ('644', '412723199807055582', '史四友', '13849419585', '何宝敬', '13849419585');
INSERT INTO `guardian` VALUES ('645', '411524199603280512', '王玉红', '15815611178', '', '');
INSERT INTO `guardian` VALUES ('646', '411626199809022648', '王毓', '18736149881', '', '');
INSERT INTO `guardian` VALUES ('649', '410482199605211016', '13461169354', '13461169354', '13461169354', '13461169354');

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
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES ('16', '1', '网络工程', '本科');
INSERT INTO `major` VALUES ('17', '1', '网络工程(网络软件开发)', '本科');
INSERT INTO `major` VALUES ('18', '1', '物联网工程', '本科');
INSERT INTO `major` VALUES ('19', '1', '计算机应用技术', '专科');
INSERT INTO `major` VALUES ('20', '1', '数字媒体应用技术', '专科');

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
-- Records of manage
-- ----------------------------
INSERT INTO `manage` VALUES ('1', 'admin', 'ICy5YqxZB1uWSwcVLSNLcA==', '0', '1', '1');
INSERT INTO `manage` VALUES ('16', 'zhumeng', 'GUfGXRMD8EEz1B6DimcKiQ==', '0', '1', '6');
INSERT INTO `manage` VALUES ('18', 'luodan', 'Xm9Og5P9ltAzT11q0jND6A==', '0', '2', '15');
INSERT INTO `manage` VALUES ('19', 'liuxuan', '2ZiWkd3HI4VYcK4iZV72kA==', '0', '2', '18');
INSERT INTO `manage` VALUES ('20', 'wufeng', 'pLbx5BhJwGTu+dDSoZPNAA==', '0', '2', '16');
INSERT INTO `manage` VALUES ('21', 'fengyuhan', 'oPw4qim889I7LgmdV/yoSw==', '0', '2', '17');

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
-- Records of organize
-- ----------------------------

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
-- Records of politicsstatus
-- ----------------------------
INSERT INTO `politicsstatus` VALUES ('1', '群众');
INSERT INTO `politicsstatus` VALUES ('2', '共青团员');
INSERT INTO `politicsstatus` VALUES ('3', '积极分子');
INSERT INTO `politicsstatus` VALUES ('4', '发展对象');
INSERT INTO `politicsstatus` VALUES ('5', '预备党员');
INSERT INTO `politicsstatus` VALUES ('6', '正式党员');
INSERT INTO `politicsstatus` VALUES ('7', '民主党派');

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
-- Records of state
-- ----------------------------
INSERT INTO `state` VALUES ('1', '在校');
INSERT INTO `state` VALUES ('2', '申请休学');
INSERT INTO `state` VALUES ('3', '毕业离校');
INSERT INTO `state` VALUES ('4', '未报到');
INSERT INTO `state` VALUES ('5', '新生入伍');

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
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (null, '0806101078', null, '郑宗惠', '男', null, '广东', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES (null, '0981103701', null, '宁树宙', '男', null, '广东', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES (null, '1322190011', null, '温承荣', '男', null, '广东', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES ('', '1521190046', '', '侯娟', '女', '26', '广东', '河南周口', '河南周口', '信阳-周口', '1', '汉族', '15517186188', '4153916752@qq.com', '0', '专科', '3', '28', '5', '4', '');
INSERT INTO `student` VALUES (null, '17130723150143', null, '梁乔颖', '女', null, '河北', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES (null, '17340822151880', null, '李德鑫', '男', null, '安徽', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES ('342225199605210019', '17341324152111', '', '袁威', '男', '21', '安徽', '安徽省宿州市泗县', '安徽省宿州市泗县泗城镇东关社区叶庄28号', '信阳-安徽', '2', '汉族', '15178295424', '1500864560@qq.com', '13#107', '本科', '4', '21', '3', '1', '');
INSERT INTO `student` VALUES (null, '17341602150703', null, '石宏奎', '男', null, '安徽', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES (null, '17341702153634', null, '刘叙讯', '男', null, '安徽', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES (null, '17370302150665', null, '孙静怡', '女', null, '山东', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES ('371202199810231249', '17371202153508', '', '亓文玉', '女', '18', '山东', '山东省莱芜市', '山东省莱芜市莱城区口镇西街村镇中街135号', '信阳-莱芜', '2', '汉族', '15263429615', '1283232223@qq.com', '12#9', '本科', '4', '21', '4', '1', '');
INSERT INTO `student` VALUES (null, '17410101150095', null, '禹林青', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES ('', '17410101151114', '', '刘苗苗', '女', '22', '河南', '河南省南阳', '河南省南阳', '信阳-南阳', '1', '汉族', '15225319126', '1368781197@qq.com', '0', '本科', '4', '23', '4', '4', '');
INSERT INTO `student` VALUES (null, '17410101152052', null, '李宇明', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES ('410122199806142667', '17410101152884', '', '孙梦姣', '女', '19', '河南', '河南省新郑市', '河南省新郑市郑港办事处小河刘村050号', '信阳-郑州', '2', '汉族', '13607641639', '1437840429@qq.com', '12#315', '本科', '4', '24', '6', '1', '');
INSERT INTO `student` VALUES (null, '17410103151066', null, '许浒', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '26', null, '4', null);
INSERT INTO `student` VALUES (null, '17410103151550', null, '韩海涛', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '25', null, '4', null);
INSERT INTO `student` VALUES (null, '17410103900007', null, '张龙飞', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17410103901012', null, '张凯', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES (null, '17410103901221', null, '徐明杰', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES (null, '17410103901263', null, '刘银', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES (null, '17410103901266', null, '郎进鹏', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17410103901322', null, '刘凡', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17410103901435', null, '孙亚楠', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES ('410184199810135020', '17410103905360', '', '张帆', '女', '18', '河南', '河南省新郑市', '河南省新郑市八千乡八千村320号', '信阳-郑州', '2', '汉族', '13849051683', '1260172790@qq.com', '7#606', '专科', '3', '29', '5', '1', '');
INSERT INTO `student` VALUES ('412722199412017331', '17410104150002', '', '徐文强', '男', '22', '河南', '河南西华县', '河南省西华县清河驿乡官路徐行政村官路徐村一组', '信阳-郑州', '2', '汉族', '13663848950', '1025498188@qq.com', '13#113', '本科', '4', '23', '4', '4', '');
INSERT INTO `student` VALUES (null, '17410104150545', null, '张新文', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES (null, '17410104300842', null, '王凯', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '31', null, '4', null);
INSERT INTO `student` VALUES (null, '17410104301350', null, '韩煜', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '31', null, '4', null);
INSERT INTO `student` VALUES (null, '17410104302605', null, '王永波', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '31', null, '4', null);
INSERT INTO `student` VALUES (null, '17410104305419', null, '张新泽', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '31', null, '4', null);
INSERT INTO `student` VALUES ('', '17410104902128', '', '台振宇', '男', '17', '河南', '河南省固始县', '河南省固始县黎集镇卫生院家属院', '信阳-固始', '1', '汉族', '15156429593', '1448213753@qq.com', '11#513', '专科', '3', '28', '4', '4', '');
INSERT INTO `student` VALUES (null, '17410111150478', null, '孙威', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17410112151016', null, '杜一航', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '26', null, '4', null);
INSERT INTO `student` VALUES (null, '17410112151807', null, '郭鑫源', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17410112152452', null, '李浩杰', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES (null, '17410113151859', null, '韩威烨', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '23', null, '4', null);
INSERT INTO `student` VALUES (null, '17410113152461', null, '屈隆博', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17410113152634', null, '钟靖波', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '23', null, '4', null);
INSERT INTO `student` VALUES (null, '17410114150696', null, '赵泽铭', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES ('', '17410114150898', '', '王梁敏', '女', '18', '河南', '河南省郑州市', '河南省郑州市新郑市孟庄镇鸡王村', '信阳-信阳东站', '2', '汉族', '15981874818', '744966791@qq.com', '0', '本科', '4', '21', '4', '4', '');
INSERT INTO `student` VALUES (null, '17410114153091', null, '王金龙', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '25', null, '4', null);
INSERT INTO `student` VALUES (null, '17410114153409', null, '付泽坤', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES (null, '17410115150281', null, '梁英杰', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17410115152928', null, '胡梦洋', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES (null, '17410201152617', null, '何俊楠', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '23', null, '4', null);
INSERT INTO `student` VALUES (null, '17410201153736', null, '张曼玉', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '23', null, '4', null);
INSERT INTO `student` VALUES (null, '17410204301238', null, '孟照龙', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '31', null, '4', null);
INSERT INTO `student` VALUES (null, '17410211110737', null, '李倩文', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES (null, '17410211110738', null, '曹颜颜', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17410212150237', null, '昝爱侠', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES (null, '17410212150343', null, '李浩然', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES (null, '17410212151136', null, '杨帆', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES (null, '17410212151801', null, '戎柯君', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '26', null, '4', null);
INSERT INTO `student` VALUES (null, '17410212153211', null, '陈阳', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES (null, '17410214150018', null, '吴亚寒', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES (null, '17410214150549', null, '陈冲', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17410214152069', null, '王君', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17410214152902', null, '张祥光', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '25', null, '4', null);
INSERT INTO `student` VALUES ('411625199805285831', '17410303900115', '', '谢顺义', '男', '19', '河南', '河南省郸城县', '河南省郸城县石槽镇谢楼行政村谢楼村064号', '信阳-郸城', '2', '汉族', '15703799469', '846913546@qq.com', '11#520', '专科', '3', '30', '5', '1', '');
INSERT INTO `student` VALUES (null, '17410303900265', null, '马焕焕', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES (null, '17410303900269', null, '武林', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17410303900333', null, '许俊巧', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES ('410323199908204010', '17410310151833', '', '孔祥浩', '男', '18', '河南', '河南省新安县仓头乡中沟村', '河南省新安县仓头乡中沟村中沟组', '信阳-洛阳', '2', '汉族', '13513847940', '1491138832@qq.com', '13#201', '本科', '4', '26', '5', '1', '');
INSERT INTO `student` VALUES (null, '17410312150499', null, '宁晨辉', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES (null, '17410312151090', null, '牛玉', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '23', null, '4', null);
INSERT INTO `student` VALUES (null, '17410312151597', null, '栾希旺', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES (null, '17410312152290', null, '陈亚飞', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES (null, '17410312152526', null, '刘飞飞', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '23', null, '4', null);
INSERT INTO `student` VALUES (null, '17410313151078', null, '薛旭旭', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17410313152019', null, '刘洋', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES (null, '17410313152498', null, '王梦娣', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17410314151662', null, '孙彦婷', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '25', null, '4', null);
INSERT INTO `student` VALUES (null, '17410314152050', null, '姚红言', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES (null, '17410315150642', null, '刘龙飞', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '23', null, '4', null);
INSERT INTO `student` VALUES ('', '17410316151177', '', '刘奇', '男', '18', '河南', '河南省罗山县', '白白嫩嫩扭扭捏捏你', '信阳-罗山', '2', '汉族', '13612341234', '666666666@qq.com', '0', '本科', '4', '25', '7', '4', '');
INSERT INTO `student` VALUES (null, '17410316151669', null, '张世浩', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '26', null, '4', null);
INSERT INTO `student` VALUES (null, '17410317151431', null, '崔宇飞', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17410319119001', null, '袁格格', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17410319150716', null, '白海涛', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '23', null, '4', null);
INSERT INTO `student` VALUES ('410422199802267012', '17410411151660', '', '崔书锋', '男', '19', '河南', '河南省叶县', '河南省平顶山市叶县廉村镇', '信阳-平顶山', '2', '汉族', '13613756894', '1335950381@qq.com', '13#107', '本科', '4', '22', '7', '1', '');
INSERT INTO `student` VALUES (null, '17410412150118', null, '李鹏', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '25', null, '4', null);
INSERT INTO `student` VALUES (null, '17410412150305', null, '边玉龙', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES (null, '17410412152487', null, '南明辉', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17410413150419', null, '张亚隆', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '23', null, '4', null);
INSERT INTO `student` VALUES (null, '17410413151045', null, '王少光', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES (null, '17410415150963', null, '王文瑶', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES (null, '17410415151276', null, '张垚垚', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES ('410711199711221024', '17410501111372', '', '李雪莹', '女', '19', '河南', '河南省西平县', '河南省新乡市红旗区新延路206号5号楼1单元202室', '信阳-新乡', '2', '汉族', '13462328753', '736546590@qq.com', '7#606', '专科', '3', '29', '3', '1', '');
INSERT INTO `student` VALUES ('410702199902140511', '17410501150605', '', '苗宁', '男', '18', '河南', '河南省新乡市延津县', '新乡市红旗区牌坊街76号2号楼2单元8号', '信阳-新乡', '2', '汉族', '18937398981', '1016080382@qq.com', '13#113', '本科', '4', '23', '4', '1', '');
INSERT INTO `student` VALUES (null, '17410501151618', null, '王佳炜', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '23', null, '4', null);
INSERT INTO `student` VALUES ('410711199809163010', '17410501154089', '', '康明斯', '男', '18', '河南', '河南省新乡市', '河南省新乡市化工路与胜利路金色家园1号楼三单元6楼南户', '信阳-新乡', '2', '汉族', '15537322650', '976003911@qq.com', '13#105', '本科', '4', '22', '3', '1', '');
INSERT INTO `student` VALUES ('', '17410503900170', '', '冯楚楚', '女', '26', '河南', '河南省洛阳市', '河南省郑州', '信阳-周口', '1', '汉族', '15517618618', '415391782@qq.com', '0', '专科', '3', '27', '3', '4', '');
INSERT INTO `student` VALUES (null, '17410504300881', null, '孙巧', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '31', null, '4', null);
INSERT INTO `student` VALUES (null, '17410511150249', null, '宁凯', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17410511151832', null, '秦梦媛', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES (null, '17410512150441', null, '翟德旭', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES (null, '17410514150067', null, '方晨', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '26', null, '4', null);
INSERT INTO `student` VALUES (null, '17410515151131', null, '康子露', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '25', null, '4', null);
INSERT INTO `student` VALUES ('410726199902239520', '17410515152170', '', '张玉', '女', '18', '河南', '河南省延津县', '河南省延津县司寨乡东张庄村', '信阳-新乡', '2', '汉族', '17638572516', '2780225619@qq.com', '12#317', '本科', '4', '26', '5', '1', '');
INSERT INTO `student` VALUES (null, '17410516151784', null, '李志浩', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '23', null, '4', null);
INSERT INTO `student` VALUES (null, '17410516151931', null, '韦隶书', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES (null, '17410516152505', null, '时平凡', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES (null, '17410517150199', null, '周庆卓', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17410601150269', null, '杨豪', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES (null, '17410601151047', null, '石慧杰', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17410601151472', null, '王紫娟', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES ('410803199901090032', '17410601151516', '', '韩智华', '男', '18', '河南', '河南省焦作市', '河南省焦作市中站区许衡办西王封村402号', '信阳-焦作', '2', '汉族', '15639152668', '2315795448@qq.com', '13#201', '本科', '4', '26', '4', '1', '');
INSERT INTO `student` VALUES (null, '17410601900039', null, '贺永智', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES (null, '17410603900075', null, '李家锋', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES (null, '17410611150733', null, '范中阳', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES ('410821200003060075', '17410611150800', '', '杨纪元', '男', '17', '河南', '河南省焦作市修武县', '河南省焦作市修武县城关镇南关一街17号', '信阳-修武', '2', '汉族', '15716369858', '864267563@qq.com', '13#205', '本科', '4', '25', '4', '1', '');
INSERT INTO `student` VALUES (null, '17410612151033', null, '贺品华', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES (null, '17410612151236', null, '李恒鑫', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '23', null, '4', null);
INSERT INTO `student` VALUES (null, '17410612158075', null, '王易', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES (null, '17410613151077', null, '韦佳辉', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES (null, '17410613151439', null, '孙炳旭', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES (null, '17410613152243', null, '杨志鑫', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17410614158058', null, '王飞帆', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES (null, '17410615150836', null, '晁子涵', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '23', null, '4', null);
INSERT INTO `student` VALUES (null, '17410616110009', null, '王浩洁', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES ('410883199909190312', '17410616150603', '', '谢浩', '男', '17', '河南', '河南省焦作市孟州市', '河南省焦作市孟州市孟州公馆12号楼401', '信阳-洛阳', '1', '汉族', '15639172520', '1009563286@qq.com', '13#113', '本科', '4', '23', '3', '1', '');
INSERT INTO `student` VALUES (null, '17410616150749', null, '刘海帆', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '25', null, '4', null);
INSERT INTO `student` VALUES (null, '17410703900271', null, '康宇', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES (null, '17410704300068', null, '朱志雄', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '31', null, '4', null);
INSERT INTO `student` VALUES (null, '17410711151518', null, '霍东芳', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '26', null, '4', null);
INSERT INTO `student` VALUES (null, '17410712150964', null, '曹彬', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '26', null, '4', null);
INSERT INTO `student` VALUES (null, '17410712152637', null, '张栋凯', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '25', null, '4', null);
INSERT INTO `student` VALUES (null, '17410712152646', null, '秦培晅', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES (null, '17410713150984', null, '闫晓彤', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES (null, '17410715150331', null, '曹小康', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '26', null, '4', null);
INSERT INTO `student` VALUES (null, '17410716150577', null, '谭敏', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '25', null, '4', null);
INSERT INTO `student` VALUES (null, '17410801150210', null, '刘继松', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES (null, '17410801151337', null, '王进征', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES (null, '17410801152272', null, '艾兴港', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '25', null, '4', null);
INSERT INTO `student` VALUES (null, '17410802150506', null, '谢德阳', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES ('410923199908161033', '17410803900077', '', '邸宏宇', '男', '18', '河南', '河南省濮阳市', '河南省濮阳市南乐县韩张镇东机留町村', '信阳-濮阳', '1', '汉族', '18839309635', '2444230606@qq.com', '11#517', '专科', '3', '29', '4', '1', '');
INSERT INTO `student` VALUES (null, '17410813151560', null, '孙帅达', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '26', null, '4', null);
INSERT INTO `student` VALUES ('410611199810244517', '17410902150064', '', '田兆鑫', '男', '18', '河南', '河南省鹤壁市山城区', '河南省鹤壁市淇滨区大河涧乡石鼓沟村2号院', '信阳-鹤壁', '2', '汉族', '18303928104', '870493197@qq.com', '13#102', '本科', '4', '21', '4', '1', '');
INSERT INTO `student` VALUES (null, '17410902150588', null, '王静阳', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17410902150772', null, '李冰举', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '23', null, '4', null);
INSERT INTO `student` VALUES (null, '17410911150368', null, '侯园园', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17410911150518', null, '魏行', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '25', null, '4', null);
INSERT INTO `student` VALUES (null, '17411011150400', null, '杨志龙', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '26', null, '4', null);
INSERT INTO `student` VALUES (null, '17411011152743', null, '余小宁', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '26', null, '4', null);
INSERT INTO `student` VALUES (null, '17411012159011', null, '李依帆', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17411013150035', null, '王琦', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES (null, '17411013150086', null, '侯璐鑫', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '25', null, '4', null);
INSERT INTO `student` VALUES ('', '17411013150315', '', '范王娟', '女', '33', '河南', '河南省郑州市', '你们', '信阳-郑州', '6', '回族', '18211115454', 'nm@xyafu.edu.cn', '0', '本科', '4', '25', '3', '4', '');
INSERT INTO `student` VALUES (null, '17411013151174', null, '艾高飞', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES ('412827199802070514', '17411013151290', '', '王子洋', '男', '19', '河南', '河南省驻马店市平舆县', '河南省信阳市浉河区平西十二组', '信阳-驻马店', '2', '汉族', '13193860886', '2238046210@qq.com', '11#508', '专科', '3', '27', '4', '1', '');
INSERT INTO `student` VALUES (null, '17411014150559', null, '张慧超', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES ('411002199809150523', '17411101151105', '', '李淑楠', '女', '18', '河南', '河南省许昌市', '河南省许昌市魏都区解放路32号5号楼1单元11号', '信阳-许昌', '2', '汉族', '15993604177', '1978988432@qq.com', '12#309', '本科', '4', '22', '2', '1', '');
INSERT INTO `student` VALUES (null, '17411103900017', null, '董玉芳', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17411111118015', null, '乔祺臻', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES (null, '17411111152024', null, '王莉君', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES (null, '17411112151122', null, '张瑜', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '23', null, '4', null);
INSERT INTO `student` VALUES (null, '17411112151995', null, '韩思维', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES (null, '17411113150152', null, '潘莹莹', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17411113150249', null, '唐柳玉', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES (null, '17411114152693', null, '华东凯', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17411114152947', null, '孙瑞源', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '23', null, '4', null);
INSERT INTO `student` VALUES (null, '17411114153799', null, '罗怡莹', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES (null, '17411114159077', null, '李明辉', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES (null, '17411201150498', null, '张旭旭', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17411211150848', null, '赵子沣', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17411211152237', null, '郭义杰', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES (null, '17411212150403', null, '高嘉妍', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '23', null, '4', null);
INSERT INTO `student` VALUES (null, '17411213110160', null, '王旭涛', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17411213150657', null, '李远帆', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES (null, '17411213151485', null, '杨光', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '26', null, '4', null);
INSERT INTO `student` VALUES ('411122199907148233', '17411213151533', '', '李虎', '男', '18', '河南', '河南省漯河市临颍县', '河南省临颍县石桥乡藕河村', '信阳-许昌', '2', '汉族', '18639549067', '1611571263@qq.com', '13#102', '本科', '4', '21', '5', '1', '');
INSERT INTO `student` VALUES (null, '17411301153597', null, '袁浩', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES (null, '17411303900012', null, '邵明伟', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES (null, '17411303900013', null, '张浩东', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17411303900224', null, '邓蒙蒙', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES ('411422199712246323', '17411303900518', '', '付金慧', '女', '19', '河南', '河南省商丘市睢县', '河南省睢县尚屯镇南田庄村125号', '信阳-睢县', '2', '汉族', '15539012230', '3236259947@qq.com', '7#601', '专科', '3', '27', '5', '1', '');
INSERT INTO `student` VALUES (null, '17411303900681', null, '夏道洋', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES (null, '17411312152660', null, '王纯', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES ('412326199504086020', '17411312154282', '', '邵凯丽', '女', '22', '河南', '河南省商丘市夏邑县火店镇', '河南省夏邑县火店乡邵长庄村71号', '信阳-商丘市', '1', '汉族', '15660788007', '1547499819@qq.com', '7#604', '专科', '3', '28', '6', '1', '');
INSERT INTO `student` VALUES ('', '17411313150910', '', '李士林', '男', '20', '河南', '河南虞城', '河南虞城', '信阳-虞城', '1', '汉族', '15517618618', '415391782@qq.com', '0', '专科', '3', '28', '3', '4', '');
INSERT INTO `student` VALUES (null, '17411313151971', null, '贺晔', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '23', null, '4', null);
INSERT INTO `student` VALUES (null, '17411313152389', null, '王政伟', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '25', null, '4', null);
INSERT INTO `student` VALUES (null, '17411313152888', null, '吕子甲', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES (null, '17411313153046', null, '田兴国', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '26', null, '4', null);
INSERT INTO `student` VALUES (null, '17411314153264', null, '张亚昆', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES (null, '17411314153596', null, '陈晓影', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES (null, '17411315150462', null, '王艳艳', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '26', null, '4', null);
INSERT INTO `student` VALUES ('411422199905103345', '17411316110347', '', '王文静', '女', '18', '河南', '河南省商丘市', '河南省商丘市睢县白楼乡司桥村157号', '信阳-商丘', '2', '汉族', '15937031342', '1927562934@qq.com', '7#606', '专科', '3', '29', '4', '1', '');
INSERT INTO `student` VALUES ('411422199806308046', '17411316150971', '', '常文洁', '女', '19', '河南', '河南省商丘睢县', '河南省商丘市睢县匡城乡后石村', '信阳-民权', '2', '汉族', '18338738382', '1661853511@qq.com', '12#319', '本科', '4', '25', '4', '1', '');
INSERT INTO `student` VALUES (null, '17411316153557', null, '闫肖倩', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17411316154142', null, '朱林勇', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES (null, '17411316154664', null, '魏怀建', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17411316159176', null, '郑梦月', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17411317158005', null, '杜存金', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES (null, '17411401150664', null, '刘二康', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES ('411626199809022648', '17411403900197', '', '许亚楠', '女', '19', '河南', '河南省周口市淮阳县', '河南省淮阳县葛店乡许庄028号', '信阳-周口', '2', '汉族', '13460048190', '2425354961@qq.com', '7#604', '专科', '3', '28', '6', '1', '');
INSERT INTO `student` VALUES ('', '17411403900253', '', '郭江涛', '男', '18', '河南', '河南省商水县', '河南省商水县姚集乡宋庄村一组', '信阳-周口', '2', '汉族', '15639419764', '1831352375@qq.com', '0', '专科', '3', '28', '4', '4', '');
INSERT INTO `student` VALUES (null, '17411403900260', null, '杨文波', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES (null, '17411403900262', null, '张世昌', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES (null, '17411403900271', null, '李江楠', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES (null, '17411403900298', null, '李亚婷', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17411403900330', null, '张富娟', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES (null, '17411403900481', null, '王克农', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17411403900484', null, '孙艳鹏', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17411403900490', null, '李梦豪', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES ('', '17411403900523', '', '张永雪', '女', '18', '河南', '河南周口', '商水县纬一路木子职专', '信阳-周口', '2', '汉族', '15939409662', '415391782@qq.com', '0', '专科', '3', '27', '5', '4', '');
INSERT INTO `student` VALUES ('412723199807055582', '17411403900526', '', '史春秋', '女', '19', '河南', '河南省周口市商水县', '河南省周口市商水县化合乡杨树东一组', '信阳-周口', '2', '汉族', '13849414517', '1905129964@qq.com', '7#606', '专科', '3', '29', '5', '1', '');
INSERT INTO `student` VALUES (null, '17411403900534', null, '李留涛', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES (null, '17411403900551', null, '雷付杰', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES ('412723199909287317', '17411403900582', '', '朱文中', '男', '17', '河南', '河南省商水县', '河南省周口市商水县袁老乡朱屯村4组', '信阳-周口', '2', '汉族', '15993224429', '1161941828@QQ.com', '11#520', '专科', '3', '30', '4', '1', '');
INSERT INTO `student` VALUES (null, '17411403900588', null, '袁梦云', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES (null, '17411403900603', null, '李鑫', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES (null, '17411403900776', null, '田瑞丹', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17411403900788', null, '王阿楠', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES (null, '17411403900792', null, '邹路丹', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES (null, '17411403900798', null, '王肖南', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17411403900810', null, '信振杰', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17411403900824', null, '刘益明', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES ('412726200011105980', '17411403900833', '', '赵园园', '女', '16', '河南', '河南省郸城县', '河南省郸城县石槽镇陈桥行政村', '信阳-信阳', '2', '汉族', '15539434582', '2979246918@qq.com', '7#609', '专科', '3', '30', '5', '4', '');
INSERT INTO `student` VALUES (null, '17411403900861', null, '钱素真', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES (null, '17411403900862', null, '王玉婷', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES ('412726200004115945', '17411403900873', '', '曹平平', '女', '17', '河南', '河南省郸城县', '河南省郸城县石槽镇余庄行政村姬庄055号', '信阳-周口市郸城县', '2', '汉族', '15936056468', '2837029062@qq.com', '7#609', '专科', '3', '30', '5', '1', '');
INSERT INTO `student` VALUES (null, '17411403900875', null, '王梅会', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17411403900877', null, '张娜', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES ('', '17411403900907', '', '孟盼盼', '女', '26', '河南', '河南信阳', '河南信阳', '信阳-汉口', '1', '汉族', '15517618618', '4153921782@qq.com', '0', '专科', '3', '27', '3', '4', '');
INSERT INTO `student` VALUES (null, '17411403900911', null, '石沙沙', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES (null, '17411403900961', null, '王蓓蓓', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17411403900967', null, '郭梦霞', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES ('412723200003025965', '17411403900968', '', '李孟娴', '女', '17', '河南', '河南省周口市商水县', '河南省周口市商水县固强镇刘坡村二组', '信阳-周口', '2', '汉族', '15294768126', '1540063123@qq.com', '7#609', '专科', '3', '30', '6', '1', '');
INSERT INTO `student` VALUES (null, '17411403901031', null, '谭冷珂', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES (null, '17411403901471', null, '刘娟', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES (null, '17411403901498', null, '张苗苗', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES (null, '17411403901502', null, '侯园坤', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES (null, '17411403901509', null, '段艳梅', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17411403902107', null, '刘萧静', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17411404300015', null, '马李静', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '31', null, '4', null);
INSERT INTO `student` VALUES (null, '17411404300088', null, '张锐', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '31', null, '4', null);
INSERT INTO `student` VALUES (null, '17411404300098', null, '朱康伦', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '31', null, '4', null);
INSERT INTO `student` VALUES (null, '17411411151220', null, '智浩东', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES (null, '17411411151835', null, '吕常周', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES ('412723199712160857', '17411411154024', '', '顾浩浩', '男', '19', '河南', '河南省商水县', '周口市商水县汤庄乡位坡村二组', '信阳-周口', '2', '汉族', '15294964732', '2907326147@qq.com', '13#113', '本科', '4', '23', '7', '1', '');
INSERT INTO `student` VALUES (null, '17411411154362', null, '曹兵兵', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17411411155352', null, '皂辉杰', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '25', null, '4', null);
INSERT INTO `student` VALUES (null, '17411412110550', null, '蔡昆鹏', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES (null, '17411412150338', null, '丁亚茹', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '26', null, '4', null);
INSERT INTO `student` VALUES (null, '17411412151471', null, '邵盼盼', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES (null, '17411413152900', null, '郭欣麟', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '26', null, '4', null);
INSERT INTO `student` VALUES (null, '17411413154094', null, '韩敏杰', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '23', null, '4', null);
INSERT INTO `student` VALUES ('41272419980510691X', '17411414151446', '', '李消飞', '男', '19', '河南', '河南省周口市太康县朱口镇芦李村', '河南省周口市太康县朱口镇芦李村', '信阳-周口', '2', '汉族', '15738626640', '1449425407@qq.com', '13#205', '本科', '4', '25', '4', '1', '');
INSERT INTO `student` VALUES (null, '17411414152377', null, '王梦晨', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES (null, '17411414152857', null, '李全伟', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES ('411627199804086913', '17411414154889', '', '陈世松', '男', '19', '河南', '河南省周口市太康县朱口镇', '河南省周口市太康县朱口镇洼陈村', '信阳-周口', '2', '汉族', '17638073476', '2431869555@qq.com', '13#107', '本科', '4', '22', '6', '1', '');
INSERT INTO `student` VALUES ('412724199605044021', '17411414155302', '', '杨瑞华', '女', '21', '河南', '河南省周口市太康县板桥镇兵马张行政村', '河南省太康县板桥镇兵马张行政村', '信阳-周口', '1', '汉族', '17163809406', '2538746471@qq.com', '12#319', '本科', '4', '25', '4', '1', '');
INSERT INTO `student` VALUES (null, '17411416150110', null, '薛能能', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES ('412726199709196217', '17411416151552', '', '孟华林', '男', '19', '河南', '河南省郸城县', '河南省郸城县钱店镇孔庙行政村孟店村001号', '信阳-郸城', '2', '汉族', '15639489980', '2316603497@qq.com', '13#102', '本科', '4', '21', '4', '1', '');
INSERT INTO `student` VALUES (null, '17411416154692', null, '李永祥', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '26', null, '4', null);
INSERT INTO `student` VALUES (null, '17411417112201', null, '郑方方', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES (null, '17411417153119', null, '鲁文畅', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '23', null, '4', null);
INSERT INTO `student` VALUES (null, '17411417153368', null, '申添友', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES (null, '17411417154044', null, '胡梦雨', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17411417154045', null, '李梦莹', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES ('412702199707228130', '17411418151394', '', '张宇', '男', '20', '河南', '河南省周口市', '河南省项城市西大街西路2号附233号', '信阳-项城', '2', '汉族', '15703814358', '2958432163@qq.com', '13#102', '本科', '4', '21', '3', '1', '');
INSERT INTO `student` VALUES (null, '17411418154734', null, '刘泽钜', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '25', null, '4', null);
INSERT INTO `student` VALUES (null, '17411419150742', null, '范萍', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES (null, '17411419151429', null, '尹柯柯', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES (null, '17411419154362', null, '杨文博', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17411501151977', null, '陆好', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES (null, '17411501158193', null, '张志炯', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES ('412829199604095617', '17411503900289', '', '单凯凯', '男', '21', '河南', '河南省正阳县', '河南省正阳县袁寨乡闵庄村单桥头', '信阳-正阳', '2', '汉族', '18838509908', '2283242923@qq.com', '11#508', '专科', '3', '27', '5', '1', '');
INSERT INTO `student` VALUES (null, '17411512118085', null, '李祥飞', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES (null, '17411512151150', null, '陈宏伟', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '26', null, '4', null);
INSERT INTO `student` VALUES (null, '17411512151312', null, '黄赞', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17411512151316', null, '贾辉', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES (null, '17411513110912', null, '冯治方', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES (null, '17411513151115', null, '魏来', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '26', null, '4', null);
INSERT INTO `student` VALUES (null, '17411514150840', null, '张妍妍', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '25', null, '4', null);
INSERT INTO `student` VALUES ('412824199910145510', '17411514151502', '', '黄任翔', '男', '17', '河南', '河南省驻马店市', '河南省驻马店市西平县盆尧乡张老庄村委15组', '信阳-西平', '1', '汉族', '15236325327', '2295701930@qq.com', '13#102', '本科', '4', '21', '6', '1', '');
INSERT INTO `student` VALUES (null, '17411514151939', null, '翟丽娜', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES (null, '17411514900030', null, '王子文', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES (null, '17411515150602', null, '刘长恩', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '25', null, '4', null);
INSERT INTO `student` VALUES (null, '17411515151025', null, '张会纳', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '26', null, '4', null);
INSERT INTO `student` VALUES ('412825199802063370', '17411515151898', '', '马梦续', '男', '19', '河南', '河南省驻马店市上蔡县', '河南省驻马店市上蔡县蔡沟乡西马村中马村15', '信阳-驻马店', '2', '汉族', '18348184322', '321852154@qq.com', '13#114', '本科', '4', '23', '4', '1', '');
INSERT INTO `student` VALUES (null, '17411515152358', null, '尼东猛', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES (null, '17411515152389', null, '常浩', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17411515152810', null, '张鹏祥', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES ('412825199708213715', '17411515154115', '', '赵凯章', '男', '20', '河南', '河南省驻马店', '河南省上蔡县党店镇代庄村关赵85', '信阳-驻马店', '1', '汉族', '15738958213', '1378913497@qq.com', '11#508', '专科', '3', '27', '5', '1', '');
INSERT INTO `student` VALUES ('412825199811261010', '17411515154302', '', '赵江浩', '男', '18', '河南', '河南省上蔡县', '河南省驻马店市上蔡县塔桥乡孟赵村', '信阳-驻马店', '2', '汉族', '15346343141', '1938239876@qq.com', '13#201', '本科', '4', '26', '6', '1', '');
INSERT INTO `student` VALUES (null, '17411516151603', null, '罗俊卿', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES (null, '17411517152341', null, '宋振方', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES (null, '17411517153450', null, '魏冀生', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES (null, '17411519150663', null, '张攀辉', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17411519151977', null, '王鑫', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17411601110100', null, '陈炜文', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES ('', '17411601110748', '', '邱春琳', '女', '20', '河南', '河南省新县', '河南省新县千斤乡北杨湾村李畈组', '信阳-信阳香江帝景', '1', '汉族', '13939793821', '570932608@qq.com', '0', '专科', '3', '27', '4', '4', '');
INSERT INTO `student` VALUES ('411521199911255723', '17411601110757', '', '余萌慧', '女', '17', '河南', '河南省罗山县', '河南省罗山县山店乡畔店村黄洼组', '信阳-羊山', '1', '汉族', '13598576720', '1911646471@qq.com', '7#604', '专科', '3', '28', '4', '1', '');
INSERT INTO `student` VALUES (null, '17411601110908', null, '王晨阳', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES ('413026199804017216', '17411601110973', '', '张鹏程', '男', '19', '河南', '河南省固始县', '河南省固始县蒋集镇栗园村楼前组', '信阳-固始', '2', '汉族', '15290266562', '1397998438@qq.com', '11#520', '专科', '3', '30', '5', '1', '');
INSERT INTO `student` VALUES (null, '17411601111225', null, '张锦', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES (null, '17411601111235', null, '沈锦宇', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES (null, '17411601111538', null, '黄鑫萌', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES (null, '17411601119084', null, '邹秋怡', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES ('411502200002180011', '17411601150275', '', '夏子昂', '男', '17', '河南', '河南省信阳市', '河南省信阳市解放路137号1号楼2单元2号', '信阳-信阳', '2', '汉族', '15738297172', '1553228002@qq.com', '11#508', '专科', '3', '27', '3', '1', '');
INSERT INTO `student` VALUES (null, '17411601150284', null, '李昊翔', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES (null, '17411601151589', null, '李镕岩', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '25', null, '4', null);
INSERT INTO `student` VALUES (null, '17411601152030', null, '刘昕宇', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES (null, '17411601152320', null, '丁文琪', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES ('413026199911057520', '17411601159150', '', '胡燕', '女', '17', '河南', '河南省固始县陈集乡鲍店村胡庄组', '河南省固始县陈集乡鲍店村胡庄组', '信阳-固始县', '2', '汉族', '18348464292', '1422230592@qq.com', '7#609', '专科', '3', '30', '4', '1', '');
INSERT INTO `student` VALUES ('', '17411603900019', '', '朱春晓', '女', '26', '河南', '河南周口', '河南周口', '信阳-周口', '1', '汉族', '15517618618', '415391782@qq.com', '0', '专科', '3', '27', '3', '4', '');
INSERT INTO `student` VALUES (null, '17411603900458', null, '李天文', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES (null, '17411603900531', null, '高海洋', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES (null, '17411603900555', null, '刘哲源', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES (null, '17411604300008', null, '李华鸿', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '31', null, '4', null);
INSERT INTO `student` VALUES ('', '17411604300013', '', '李欢', '男', '21', '河南', '信阳市罗山', '信阳罗山', '信阳-罗山', '5', '汉族', '13533332222', '777777@qq.com', '0', '本科', '4', '31', '5', '4', '');
INSERT INTO `student` VALUES (null, '17411604300022', null, '宋天宇', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '31', null, '4', null);
INSERT INTO `student` VALUES (null, '17411604300023', null, '贾璐', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '31', null, '4', null);
INSERT INTO `student` VALUES (null, '17411604300083', null, '何鹏坤', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '31', null, '4', null);
INSERT INTO `student` VALUES (null, '17411605900134', null, '潘新杨', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES (null, '17411611110329', null, '张传政', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES (null, '17411611111171', null, '曾宪章', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES (null, '17411611111576', null, '周峻森', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES (null, '17411611152657', null, '姚官鑫', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '26', null, '4', null);
INSERT INTO `student` VALUES (null, '17411612150373', null, '杜鑫宇', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES ('41152119990314832X', '17411612150542', '', '张婷', '女', '18', '河南', '河南省罗山县', '河南省信阳市罗山县子路镇罗寨村张竹林组', '信阳-子路', '1', '汉族', '15938225703', '3451220179@qq.com', '7#601', '专科', '3', '28', '4', '1', '');
INSERT INTO `student` VALUES (null, '17411612151004', null, '陈关奇', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '25', null, '4', null);
INSERT INTO `student` VALUES (null, '17411612151473', null, '厉敏', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES (null, '17411612152394', null, '甘家赢', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17411612152485', null, '黄涛', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES ('411502199905230010', '17411612152566', '', '阮俊杰', '男', '18', '河南', '河南省信阳市', '河南省信阳市浉河区广场东路21号2号楼1单元5号', '信阳-信阳', '2', '汉族', '18348486076', '844571322@qq.com', '11#520', '专科', '3', '30', '3', '1', '');
INSERT INTO `student` VALUES (null, '17411612153228', null, '张春雨', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '26', null, '4', null);
INSERT INTO `student` VALUES (null, '17411612153253', null, '吴梦凡', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES (null, '17411613110174', null, '范梦圆', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES (null, '17411613150950', null, '黄鑫', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES (null, '17411613151077', null, '王燃燃', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '23', null, '4', null);
INSERT INTO `student` VALUES (null, '17411613151900', null, '王银东', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES (null, '17411613153608', null, '袁刚', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '23', null, '4', null);
INSERT INTO `student` VALUES (null, '17411613154367', null, '李海涛', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES ('', '17411614150958', '', '张传虎', '男', '19', '河南', '河南新县', '河南新县', '信阳-新县', '1', '汉族', '15517618618', '415391782@qq.com', '0', '专科', '3', '28', '3', '4', '');
INSERT INTO `student` VALUES (null, '17411614151272', null, '张金刚', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES ('411524199809012732', '17411615111327', '', '李昱明', '男', '19', '河南', '河南省信阳市商城县', '河南省信阳市商城县河风桥乡河风桥村东楼组', '信阳-商城县', '2', '汉族', '17630934830', '1423526851@qq.com', '11#517', '专科', '3', '29', '4', '1', '');
INSERT INTO `student` VALUES (null, '17411615151123', null, '汪文威', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES ('411524199807260513', '17411615152468', '', '沈志宏', '男', '19', '河南', '河南省商城县', '河南省商城县上石桥镇太平村太子岗组', '信阳-商城', '2', '汉族', '17603761592', '1961094449@qq.com', '13#205', '本科', '4', '25', '4', '1', '');
INSERT INTO `student` VALUES (null, '17411615152814', null, '何雪莲', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17411615153173', null, '梅克成', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '26', null, '4', null);
INSERT INTO `student` VALUES ('411524199603280512', '17411615153419', '', '王广强', '男', '21', '河南', '河南商城', '河南省商城县上石桥镇太平村东河套组', '信阳-商城', '2', '汉族', '18337646163', '2013663813@QQ.com', '13#107', '本科', '4', '22', '5', '1', '');
INSERT INTO `student` VALUES ('411524199906102019', '17411615159074', '', '施鹏鹏', '男', '18', '河南', '河南省信阳市商城县', '河南省信阳市商城县双铺镇官庄村官庄组', '信阳-商城', '2', '汉族', '15839747338', '1791612498@qq.com', '11#517', '专科', '3', '29', '5', '1', '');
INSERT INTO `student` VALUES (null, '17411616111179', null, '马金玉', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES (null, '17411616151517', null, '田东东', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES (null, '17411616151628', null, '余杰', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '23', null, '4', null);
INSERT INTO `student` VALUES (null, '17411618151779', null, '赵金红', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '23', null, '4', null);
INSERT INTO `student` VALUES ('411528199903122925', '17411619111732', '', '陈松叶', '女', '18', '河南', '河南省信阳市息县包信镇朱围孜陈坊', '河南省信阳市息县包信镇朱围孜陈坊', '信阳-息县', '1', '汉族', '13839727409', '2742195680@qq.com', '7#601', '专科', '3', '27', '2', '1', '');
INSERT INTO `student` VALUES ('411528199908200013', '17411619118046', '', '徐炎', '男', '18', '河南', '河南省息县', '河南省息县城关镇北街谯楼街6—6', '信阳-郑州', '2', '汉族', '13937687673', 'abc_xy@qq.com', '11#521', '专科', '3', '29', '3', '1', '');
INSERT INTO `student` VALUES ('411528199810290719', '17411619150129', '', '齐文举', '男', '18', '河南', '河南省信阳市息县路口乡', '河南省信阳市息县路口乡路口村', '信阳-息县', '2', '汉族', '13193883110', '1872533093@qq.com', '11#520', '专科', '3', '30', '6', '1', '');
INSERT INTO `student` VALUES (null, '17411619150235', null, '鲁林恩', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '25', null, '4', null);
INSERT INTO `student` VALUES (null, '17411701150968', null, '马超', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '26', null, '4', null);
INSERT INTO `student` VALUES ('411303199901140013', '17411701152827', '', '闫新宇', '男', '18', '河南', '河南省南阳市', '河南省南阳市工业南路66号', '信阳-南阳', '2', '汉族', '15660670610', '704435922@qq.com', '11#517', '专科', '3', '29', '3', '1', '');
INSERT INTO `student` VALUES (null, '17411701152879', null, '曹培炎', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17411701900152', null, '刘良豪', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES (null, '17411703900003', null, '何汶君', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES (null, '17411712150286', null, '孙巧艳', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES (null, '17411712150962', null, '吴冬春', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17411713151460', null, '冯滨滨', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES (null, '17411713151603', null, '高旭', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17411714151090', null, '王健', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES ('411323199811292115', '17411715150292', '', '张小虎', '男', '18', '河南', '河南省南阳市淅川县', '河南省南阳市淅川县荆紫关镇张村村四组167号', '信阳-西峡', '1', '汉族', '15188210533', '2834965268@qq.com', '13#113', '本科', '4', '23', '5', '1', '');
INSERT INTO `student` VALUES ('411323199804234419', '17411715152137', '', '杨帆', '男', '19', '河南', '河南省淅川县', '河南省淅川县盛湾镇土地岭村四组100号', '信阳-西峡', '2', '汉族', '13733132672', '990695316@qq.com', '13#119', '本科', '4', '24', '4', '1', '');
INSERT INTO `student` VALUES ('411323199707204453', '17411715153024', '', '王占', '男', '20', '河南', '河南省淅川县', '河南省淅川县盛湾镇衡营村三组98号', '信阳-西峡', '2', '汉族', '18338319093', '2649505992@qq.com', '13#107', '本科', '4', '22', '4', '1', '');
INSERT INTO `student` VALUES ('', '17411718151179', '', '赵莹莹', '女', '18', '河南', '河南周口', '河南周口', '信阳-周边', '1', '汉族', '15517618618', '415391782@qq.com', '0', '本科', '4', '23', '2', '4', '');
INSERT INTO `student` VALUES (null, '17411718152353', null, '曲艺', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17411720151563', null, '刘栋梁', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES (null, '17411722151497', null, '匡杰', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '23', null, '4', null);
INSERT INTO `student` VALUES (null, '17411801150256', null, '陈佳欣', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES ('410881199902277017', '17411801150364', '', '蒋志帆', '男', '18', '河南', '河南省济源市', '河南省济源市坡头镇坡头村', '信阳-济源', '2', '汉族', '15239713137', '1807759305@qq.com', '13#205', '本科', '4', '25', '4', '1', '');
INSERT INTO `student` VALUES (null, '17411801150435', null, '卫星卓', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '26', null, '4', null);
INSERT INTO `student` VALUES (null, '17411801150821', null, '杨剑', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES ('410881199902205013', '17411801151891', '', '周永波', '男', '18', '河南', '河南省济源市王屋镇', '河南省济源市王屋镇谭庄村葛兰庄', '信阳-济源', '2', '汉族', '18625871078', '1834326921@qq.com', '13#113', '本科', '4', '23', '3', '1', '');
INSERT INTO `student` VALUES (null, '17411801151936', null, '李芳勋', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17411801159044', null, '张顺通', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '23', null, '4', null);
INSERT INTO `student` VALUES (null, '17412101150088', null, '刘书杰', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES (null, '17412101150892', null, '张东旭', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES (null, '17412101151205', null, '姚春萌', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '23', null, '4', null);
INSERT INTO `student` VALUES (null, '17412101151897', null, '楚明鑫', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17412301152385', null, '陈文康', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES ('41148119970210062X', '17412301153945', '', '李莉', '女', '20', '河南', '河南省永城市', '河南省永城市芒山镇周桥村李庄组', '信阳-商丘', '2', '汉族', '18639050330', '1623807525@qq.com', '12#309', '本科', '4', '22', '5', '1', '');
INSERT INTO `student` VALUES (null, '17412301154460', null, '郭飞宏', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES (null, '17412303900070', null, '曹向丽', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES (null, '17412401114486', null, '查思源', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES (null, '17412401150627', null, '盛华清', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES ('413026199805106616', '17412401151659', '', '冯鑫', '男', '19', '河南', '河南省固始县', '河南省固始县分水亭乡', '信阳-固始', '2', '汉族', '13937659506', '1415788162@qq.com', '13#205', '本科', '4', '25', '6', '1', '');
INSERT INTO `student` VALUES (null, '17412401154129', null, '张超', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '23', null, '4', null);
INSERT INTO `student` VALUES (null, '17412401154148', null, '叶阳钢', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES (null, '17412401154819', null, '王瑞青', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES ('413026199905042445', '17412401155003', '', '杨玉香', '女', '18', '河南', '河南省固始县', '河南省固始县草庙乡账房村', '信阳-湖南', '2', '汉族', '13849747837', '1206173646@qq.com', '12#309', '本科', '4', '21', '4', '4', '');
INSERT INTO `student` VALUES ('411525199512010919', '17412401155044', '', '何福临', '男', '21', '河南', '河南省固始县', '河南省固始县洪埠乡何圩村', '信阳-北京', '2', '汉族', '13937649828', '1174367186@qq.com', '13#105', '本科', '4', '22', '4', '4', '');
INSERT INTO `student` VALUES (null, '17412401155086', null, '王浩', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES (null, '17412401155904', null, '刘劲松', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '24', null, '4', null);
INSERT INTO `student` VALUES (null, '17412401159162', null, '陈佳雯', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES (null, '17412501152171', null, '王飞', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '27', null, '4', null);
INSERT INTO `student` VALUES (null, '17412701152969', null, '张帅磊', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '23', null, '4', null);
INSERT INTO `student` VALUES (null, '17412901152742', null, '马利娜', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES ('', '17413001150322', '', '孙韦玲', '女', '25', '河南', '河南信阳', '动不动就开门', '信阳-北京', '1', '汉族', '15917762009', '31746996@163.com', '0', '本科', '4', '21', '5', '4', '');
INSERT INTO `student` VALUES ('412725199801116535', '17413001151600', '', '任满意', '男', '19', '河南', '河南省周口市鹿邑县', '河南省鹿邑县邱集乡大王行政村', '信阳-周口鹿邑', '2', '汉族', '18439428265', '1409089493@qq.com', '13#201', '本科', '4', '26', '4', '1', '');
INSERT INTO `student` VALUES (null, '17413001151888', null, '李珍珍', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '25', null, '4', null);
INSERT INTO `student` VALUES ('412725199707284612', '17413001152397', '', '王振州', '男', '20', '河南', '河南+鹿邑', '河南省鹿邑县任集乡王寨行政村王寨', '信阳-鹿邑', '2', '汉族', '15083157387', '958879757@qq.com', '13#119', '本科', '4', '24', '4', '1', '');
INSERT INTO `student` VALUES (null, '17413001153519', null, '赵雪飞', '男', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES (null, '17413101111883', null, '刘文玲', '女', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17413101150353', null, '赵翠翠', '女', null, '河南', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES (null, '17413103900014', null, '王小营', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES (null, '17413103900045', null, '王垚', '男', null, '河南', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES (null, '17421023154523', null, '刘超', '男', null, '湖北', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES (null, '17510703120443', null, '仇超', '男', null, '四川', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17511105122692', null, '徐娜', '女', null, '四川', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17511505120281', null, '刘芬', '女', null, '四川', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES (null, '17620103151084', null, '拓进', '男', null, '甘肃', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);
INSERT INTO `student` VALUES (null, '17622421153219', null, '赵航', '男', null, '甘肃', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES (null, '17622725150039', null, '王雪芬', '女', null, '甘肃', null, null, null, null, null, null, null, '0', '本科', '4', '21', null, '4', null);
INSERT INTO `student` VALUES ('650103199811225112', '17650102150645', '', '白旭东', '男', '18', '新疆', '新疆乌鲁木齐市', '新疆乌鲁木齐市沙依巴克区环卫南路588号三期2号楼1单元502号', '信阳-新疆乌鲁木齐', '2', '回族', '15719949839', '864991659@qq.com', '13#102', '本科', '4', '21', '4', '1', '');
INSERT INTO `student` VALUES ('650103199904090616', '17650103152733', '', '陈昊', '男', '18', '新疆', '甘肃省武威市', '新疆乌鲁木齐沙区阿勒泰路20号嘉和园悦园12号楼3单元301', '信阳-乌鲁木齐', '2', '汉族', '13325616276', '1009881655@qq.com', '13#107', '本科', '4', '22', '3', '1', '');
INSERT INTO `student` VALUES ('654221199810231619', '17650201150689', '', '李鹏旭', '男', '18', '新疆', '新疆塔城地区额敏县种羊场察哈尔库热村045', '新疆塔城地区额敏县种羊场察哈尔库热村045', '信阳-新疆额敏县塔城地区察哈尔', '2', '汉族', '13689973872', '2645183363@qq.com', '11#508', '专科', '3', '27', '3', '1', '');
INSERT INTO `student` VALUES ('652222199806101218', '17652204151754', '', '郭栋凯', '男', '19', '新疆', '新疆省哈密市巴里坤哈萨克自治县', '新疆巴里坤哈萨克自治县石仁子乡三十里馆子村五组133号', '信阳-新疆哈密', '2', '汉族', '15637621220', '503840178@qq.com', '11#509', '专科', '3', '27', '3', '1', '');
INSERT INTO `student` VALUES (null, '17652301110469', null, '吴敏凯', '女', null, '新疆', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES (null, '17652501110229', null, '赵珊珊', '女', null, '新疆', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17652801110608', null, '刘瑞', '男', null, '新疆', null, null, null, null, null, null, null, '0', '专科', '3', '30', null, '4', null);
INSERT INTO `student` VALUES (null, '17652801111668', null, '陈肖', '男', null, '新疆', null, null, null, null, null, null, null, '0', '专科', '3', '29', null, '4', null);
INSERT INTO `student` VALUES (null, '17652901150242', null, '罗俊', '男', null, '新疆', null, null, null, null, null, null, null, '0', '专科', '3', '28', null, '4', null);
INSERT INTO `student` VALUES ('410482199605211016', '17653301150372', '', '李松', '男', '21', '新疆', '13461169354', '13461169354', '信阳-13461169354', '1', '汉族', '13461169354', '13461169354@qq.com', '5#2', '专科', '3', '28', '5', '4', '');
INSERT INTO `student` VALUES ('511321199812012083', '17653301151093', '', '李思诺', '女', '18', '新疆', '四川省', '新疆奎屯市131团丰登园7栋152室', '信阳-新疆', '2', '汉族', '18699219883', '985403678@qq.com', '12#309', '本科', '4', '22', '4', '1', '');
INSERT INTO `student` VALUES (null, '1881101476', null, '王嘉俊', '男', null, '广东', null, null, null, null, null, null, null, '0', '本科', '4', '22', null, '4', null);

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
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '最高权限老师', '男', '20', '12345678910', '1123456789@qq.com');
INSERT INTO `teacher` VALUES ('6', '朱猛', '男', null, '13837619710', '80993109@qq.com');
INSERT INTO `teacher` VALUES ('15', '罗丹', '女', null, '15517618618', '415391782@qq.com');
INSERT INTO `teacher` VALUES ('16', '吴锋', '男', null, '18237653206', '33814249@qq.com');
INSERT INTO `teacher` VALUES ('17', '冯玉涵', '女', null, '18240531465', '273786421@qq.com');
INSERT INTO `teacher` VALUES ('18', '刘旋', '男', null, '15738252776', '31749325@qq.com');

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
-- Records of t_c_connection
-- ----------------------------
INSERT INTO `t_c_connection` VALUES ('106', '1', '21');
INSERT INTO `t_c_connection` VALUES ('107', '1', '22');
INSERT INTO `t_c_connection` VALUES ('108', '1', '23');
INSERT INTO `t_c_connection` VALUES ('109', '1', '24');
INSERT INTO `t_c_connection` VALUES ('110', '1', '25');
INSERT INTO `t_c_connection` VALUES ('111', '1', '26');
INSERT INTO `t_c_connection` VALUES ('112', '1', '27');
INSERT INTO `t_c_connection` VALUES ('113', '1', '28');
INSERT INTO `t_c_connection` VALUES ('114', '1', '29');
INSERT INTO `t_c_connection` VALUES ('115', '1', '30');
INSERT INTO `t_c_connection` VALUES ('148', '15', '23');
INSERT INTO `t_c_connection` VALUES ('149', '15', '24');
INSERT INTO `t_c_connection` VALUES ('150', '15', '27');
INSERT INTO `t_c_connection` VALUES ('151', '15', '28');
INSERT INTO `t_c_connection` VALUES ('152', '16', '31');
INSERT INTO `t_c_connection` VALUES ('153', '17', '25');
INSERT INTO `t_c_connection` VALUES ('154', '17', '26');
INSERT INTO `t_c_connection` VALUES ('159', '6', '21');
INSERT INTO `t_c_connection` VALUES ('160', '6', '22');
INSERT INTO `t_c_connection` VALUES ('161', '6', '23');
INSERT INTO `t_c_connection` VALUES ('162', '6', '24');
INSERT INTO `t_c_connection` VALUES ('163', '6', '25');
INSERT INTO `t_c_connection` VALUES ('164', '6', '26');
INSERT INTO `t_c_connection` VALUES ('165', '6', '27');
INSERT INTO `t_c_connection` VALUES ('166', '6', '28');
INSERT INTO `t_c_connection` VALUES ('167', '6', '29');
INSERT INTO `t_c_connection` VALUES ('168', '6', '30');
INSERT INTO `t_c_connection` VALUES ('169', '6', '31');
INSERT INTO `t_c_connection` VALUES ('170', '18', '21');
INSERT INTO `t_c_connection` VALUES ('171', '18', '22');
INSERT INTO `t_c_connection` VALUES ('172', '18', '29');
INSERT INTO `t_c_connection` VALUES ('173', '18', '30');

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
