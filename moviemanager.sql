/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50549
Source Host           : localhost:3306
Source Database       : moviemanager

Target Server Type    : MYSQL
Target Server Version : 50549
File Encoding         : 65001

Date: 2019-01-24 13:58:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cinema`
-- ----------------------------
DROP TABLE IF EXISTS `cinema`;
CREATE TABLE `cinema` (
  `cinema_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '影院ID',
  `name` varchar(50) NOT NULL COMMENT '影院名称',
  `address` varchar(120) NOT NULL COMMENT '影院地址',
  PRIMARY KEY (`cinema_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cinema
-- ----------------------------
INSERT INTO `cinema` VALUES ('1', '金逸国际影城(碣阳大街店)', '地址：昌黎县碣阳大街北侧民生路东(民生广场商业楼二楼)');
INSERT INTO `cinema` VALUES ('2', '金逸影城(海港店)', '地址：海港区太阳城正阳街5号乐都汇购物广场四楼');
INSERT INTO `cinema` VALUES ('3', '中影国际影城(秦皇新天地店)', '地址：海港区秦皇岛开发区秦皇西大街88号（秦皇新天地商业街2号楼3层）');
INSERT INTO `cinema` VALUES ('4', '金棕榈国际电影城', '地址：海港区秦皇东大街80号文化广场剧场（近秦皇岛市图书馆、聚贤人才市场）');
INSERT INTO `cinema` VALUES ('5', '大地影院(世纪港湾店)', '地址：海港区秦皇东大街世纪港湾广场B栋3层（世纪港湾商业广场）');
INSERT INTO `cinema` VALUES ('6', '蓝图影城', '地址：海港区杜庄镇蓝图国际影城');
INSERT INTO `cinema` VALUES ('7', '北戴河影谷影院', '地址：北戴河区联峰北路80号（北戴河舌尖美食城）');
INSERT INTO `cinema` VALUES ('8', '中影星美银之谷店', '地址：海港区康乐街25号人民广场（人民公园正门对面）');
INSERT INTO `cinema` VALUES ('9', '东购影城', '地址：抚宁区东购商场5楼');
INSERT INTO `cinema` VALUES ('10', '昌黎广缘电影城(碣阳大街店)', '地址：昌黎县碣阳大街与五峰山路交叉口广缘超市5楼（广缘超市5楼）');
INSERT INTO `cinema` VALUES ('11', '龙城国际影院', '地址：青龙满族自治县龙城购物广场三楼');

-- ----------------------------
-- Table structure for `comments`
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `comments_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '评价ID',
  `user_id` int(10) NOT NULL COMMENT '用户ID',
  `comments` varchar(300) NOT NULL COMMENT '评价内容',
  `movie_id` int(10) unsigned zerofill NOT NULL COMMENT '评论对应的电影',
  PRIMARY KEY (`comments_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('1', '6', '电影很好看，但是开场验票才告诉我自带3D眼镜？？？搞得我裸眼看3D看了一个多小时，真的是弟弟行为！', '0000000001');
INSERT INTO `comments` VALUES ('2', '9', '真的太震撼了，漫威从来没有让我失望，虽然好多地方我感觉像是被删减过许多吓人的画面，但是真的还是太好看，好多地方从头到尾一直在笑，最后还有一点小感人。一直都是震撼幽默的画面。真希望可以能有第二部的上映。这个毒液系列希望像蜘蛛侠钢铁侠一样出一个系列有续集，真的没有看过瘾啊。（人生第一次评价话有点多）总之，大家可以去观看，我是电影迷这一部我给11分，强烈大家去观看！', '0000000001');
INSERT INTO `comments` VALUES ('3', '7', '毫无疑问，《毒液》是索尼出品年度最炫酷的(漫威）超级英雄电影之一，还是原来搞笑的配方、无敌的撩妹技能，可爱的汤老师，萌萌的毒液，简直绝配！！！', '0000000001');
INSERT INTO `comments` VALUES ('4', '10', '很好看，不错，可惜了买了两张票，自己一个人看完', '0000000001');
INSERT INTO `comments` VALUES ('5', '11', '是真的好看 完全看不过瘾啊 我感觉删减了 真的烦 后面结局真的有点看不懂 说再见了 怎么莫名其妙毒液又回来了 完全看不过瘾啊啊啊啊啊 我不知道最后有没有彩蛋 时间比较急 看完就走了 不知道后面有没有彩蛋 求哪位大神告诉一下谢谢 跳吗? 怂包', '0000000001');
INSERT INTO `comments` VALUES ('6', '8', '感觉毒液总是微笑的，有个性，很喜欢。埃迪+毒液，两个loser蜕变成一个winner，特别刺激，尤其是肚子饿那会儿。 画面后半部分感官性强，也搞笑，前半部分没有立刻揭秘，节奏有点慢，片尾曲(英文)好听，开始期待第二部了，也期待埃迪与屠杀的打斗。', '0000000001');
INSERT INTO `comments` VALUES ('7', '12', '大眼睛的生物都自带萌的属性，奶凶奶凶的', '0000000001');
INSERT INTO `comments` VALUES ('12', '1', '我是管理员, 请大家积极评论!', '0000000004');
INSERT INTO `comments` VALUES ('14', '4', '我是刘阳, 我需要大量零食来减肥, 请大家帮帮我!', '0000000004');
INSERT INTO `comments` VALUES ('19', '1', '请大家积极帮助刘阳同学, 谢谢配合!', '0000000004');
INSERT INTO `comments` VALUES ('20', '2', '举手!!! 我捐出一包薯片! ', '0000000004');
INSERT INTO `comments` VALUES ('22', '3', '看完以后顿时觉得好high哦, 感觉人生已经到达了高潮!', '0000000002');
INSERT INTO `comments` VALUES ('23', '5', '其实我还有一个名字, 叫做王多鱼, 我最爱吃波波鱼!', '0000000002');
INSERT INTO `comments` VALUES ('24', '13', '艾欧尼亚一块排位的有没有? 我盖伦打野,带飞', '0000000002');
INSERT INTO `comments` VALUES ('30', '2', '455', '0000000004');
INSERT INTO `comments` VALUES ('32', '2', '123sas', '0000000004');
INSERT INTO `comments` VALUES ('34', '2', '231', '0000000004');

-- ----------------------------
-- Table structure for `hall`
-- ----------------------------
DROP TABLE IF EXISTS `hall`;
CREATE TABLE `hall` (
  `hall_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '放映厅ID',
  `name` varchar(20) NOT NULL COMMENT '放映厅名字',
  `cinema_id` int(10) NOT NULL COMMENT '影院ID',
  `capacity` int(50) NOT NULL COMMENT '放映厅容量',
  PRIMARY KEY (`hall_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hall
-- ----------------------------
INSERT INTO `hall` VALUES ('1', '1号激光放映厅', '1', '30');
INSERT INTO `hall` VALUES ('2', '2号厅', '1', '30');
INSERT INTO `hall` VALUES ('3', '3号厅', '1', '30');
INSERT INTO `hall` VALUES ('4', '1号激光放映厅', '2', '30');
INSERT INTO `hall` VALUES ('5', '2号激光放映厅', '2', '30');
INSERT INTO `hall` VALUES ('6', '1号厅', '3', '30');
INSERT INTO `hall` VALUES ('7', '2号厅', '3', '30');
INSERT INTO `hall` VALUES ('8', '1号厅', '4', '30');
INSERT INTO `hall` VALUES ('9', '1号厅', '5', '30');
INSERT INTO `hall` VALUES ('10', '1号厅', '6', '30');

-- ----------------------------
-- Table structure for `movie`
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `movie_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '电影ID',
  `name` varchar(30) NOT NULL COMMENT '电影名称',
  `staring` varchar(30) DEFAULT NULL COMMENT '电影主演',
  `detail` varchar(350) NOT NULL COMMENT '电影详情',
  `duration` varchar(20) DEFAULT NULL COMMENT '电影时长',
  `type` varchar(20) NOT NULL COMMENT '电影类型',
  `score` varchar(20) DEFAULT NULL COMMENT '评分',
  `picture` varchar(35) NOT NULL COMMENT '海报',
  `boxOffice` double(30,2) DEFAULT NULL COMMENT '累计票房',
  `commentsCount` varchar(30) DEFAULT NULL COMMENT '参评人数',
  `releaseDate` date DEFAULT NULL COMMENT '上映时间',
  `boxOfficeUnit` int(20) DEFAULT NULL COMMENT '票房单位',
  `foreignName` varchar(50) DEFAULT NULL COMMENT '电影的外国名',
  `releasePoint` varchar(30) DEFAULT NULL COMMENT '上映地点',
  `commentsUnit` int(20) DEFAULT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES ('1', '毒液：致命守护者', '鲁本·弗雷斯彻', '记者埃迪·布洛克（汤姆·哈迪 饰）在调查生命基金会的最新科学实验过程中，受到不明外星物质共生体的入侵与控制，历经挣扎成为亦正亦邪的超级英雄——毒液。他将以毒攻毒，破解生命基金会的惊天阴谋，拯救世界。', '107分钟', '动作,惊悚,科幻', '9.3', 'img/movies/movie1.jpg', '14.86', '66.8', '2018-11-09', '100000000', 'Venom', '美国', '10000');
INSERT INTO `movie` VALUES ('2', '神奇动物：格林德沃之罪', '大卫·叶茨', '在《神奇动物在那里》第一部的结尾，纽特·斯卡曼德（埃迪·雷德梅恩 饰）协助美国魔法国会，将强大的黑巫师盖勒特·格林德沃（约翰尼·德普 饰）抓捕归案。但格林德沃不久便兑现狂言成功越狱，并开始纠集信徒，着手实现他们的邪恶目的：让纯血统的巫师成为统治阶层，镇压一切非魔法生物。为挫败格林德沃的阴谋，阿不思·邓布利多（裘德·洛 饰）向昔日的学生纽特·斯卡曼德寻求帮助。纽特欣然允诺，却没有意识到，他将踏上的会是一段充满艰险的未来征途。此时的魔法世界面临空前的分裂乱局，阶层鸿沟日益加深，爱与忠诚备受考验，至亲好友也可能反目成仇……', '134分钟', '冒险,奇幻,家庭', '7.7', 'img/movies/movie2.jpg', '2.92', '90291', '2018-11-16', '100000000', 'Fantastic Beasts: The Crimes of Grindelwald', '大陆', '1');
INSERT INTO `movie` VALUES ('3', '无名之辈', '饶晓志', '在一座山间小城中，一对低配劫匪、一个落魄的泼皮保安、一个身体残疾却性格彪悍的残毒舌女以及一系列生活在社会不同轨迹上的小人物，在一个貌似平常的日子里，因为一把丢失的老枪和一桩当天发生在城中的乌龙劫案，从而被阴差阳错地拧到一起，发生的一幕幕令人啼笑皆非的荒诞喜剧。', '108分钟', '剧情,喜剧,犯罪', '9.2', 'img/movies/movie3.jpg', '1.07', '55858', '2018-11-16', '100000000', 'A Cool Fish', '大陆', '1');
INSERT INTO `movie` VALUES ('4', '名侦探柯南：零的执行人', '立川让', '5月1日，东京湾边的新建筑“海洋边缘”将举办首脑云集的东京峰会。然而，峰会开办前一周，会场发生超大规模的爆炸事件，并出现了安室透的身影。疑似恐怖袭击的事件引起了警察部门的严肃调查。在警察局大型搜查会议上，公安部门提交证物，却发现疑犯指纹与毛利小五郎（小山力也 配音）指纹吻合。作为律师的妃英理努力收集证据证明丈夫的无辜，却无力阻止毛利小五郎被收监。看到毛利兰（山崎和佳奈 配音）绝望哭泣的样子，柯南（高山南 配音）决定调查事件真相，还毛利小五郎清白。另一方面，少年侦探团的孩子们正紧密关注着无人探测器“天鹅”的回航任务。行踪诡异的安室透、惨遭陷害的毛利小五郎、错综复杂的警察部门、即将着陆的无人探测器；随着“机密任务”进入倒计时，关乎整个东京的可怕计划拉开帷幕…', '111分钟', '动画,动作,悬疑', '8.5', 'img/movies/movie4.jpg', '1.22', '95339', '2018-11-09', '100000000', '名探偵コナン ゼロの執行人', '大陆', '1');
INSERT INTO `movie` VALUES ('5', '你好，之华', '岩井俊二', '有人慌张得见面，有人简单地告别。姐姐袁之南离世的那个清晨，只匆匆留下一封信和一张同学会邀请函。妹妹之华(周迅 饰)代替姐姐参加，却意外遇见年少时的倾慕对象尹川（秦昊 饰）。往日的记忆在苏醒，但再次相见，已物是人非。', '114分钟', '剧情,爱情', '7.9', 'img/movies/movie5.jpg', '7628.00', '33224', '2018-11-09', '10000', 'Last Letter', '大陆', '1');
INSERT INTO `movie` VALUES ('6', '恐龙王', '施雅雅', '陆地霸主特暴龙“斑大师”和自己的小儿子“小疙瘩”生活在一起。“小疙瘩”自幼失去了母亲，生性懦弱，严厉的“斑大师”虽然心底十分疼爱自己的孩子，但是急于让“小疙瘩”成长为新的陆地霸主，常常忍不住责骂“小疙瘩”，父子俩虽然相依为命，却始终有一些隔阂。 一天“小疙瘩”被几只邪恶的恐爪龙抓走，“斑大师”踏上漫漫的寻子之路，路途中他结识了有高度近视眼的美甲龙“八百度”，两人穿过“巨蝎峡”、走出“长颈龙绿洲”、踏上火山峡谷，经历了重重难关。而身处险境的“小疙瘩”也结识了一些新的朋友，并且开始和邪恶的恐爪龙斗智斗勇。最终父子两人终于相见，但是却不得不一起面对一个更加凶恶的史前怪物……', '95分钟', '喜剧,动画,冒险', '8.9', 'img/movies/movie6.jpg', '2215.00', '9641', '2018-11-10', '10000', 'DINO KING', '大陆', '1');
INSERT INTO `movie` VALUES ('7', '冰封侠:时空行者', '叶伟民', '明朝大将军贺英（甄子丹 饰）利用时空金球终于重返明朝，与锦衣卫兄弟萨獒（王宝强 饰）获悉了倭寇和朝廷奸党之间足以倾覆皇权的密谋，绵延400年的惊天危机一触即发。贺英也在红颜知己小美（黄圣依 饰）的帮助下开始了抗倭锄奸和保护族人的战斗。', '87分钟', '剧情,动作', '4.1', 'img/movies/movie7.jpg', '3442.00', '46447', '2018-11-02', '10000', 'The Iceman Cometh 3D 2', '大陆', '1');
INSERT INTO `movie` VALUES ('8', '梦境之源', '柳珂', '货车司机李昂由于童年时代内向懦弱，颓废度日，频频做噩梦，严重影响了正常的生活，并因此不得不接受心理医生曹井润的催眠治疗，却在梦境中意外卷入一场凶杀案。睿智破案的警探成为凶手，而真正的幕后黑手仍在逍遥法外……', '90分钟', '爱情,惊悚,悬疑', '', 'img/movies/movie8.jpg', '24.00', null, '2018-11-16', '10000', 'Source of dreams', '大陆', '1');
INSERT INTO `movie` VALUES ('10', '摘金奇缘', null, '感觉人生到达了巅峰,好兴奋,好刺激!', null, '动作,惊悚,科幻', null, 'img/movies/demo.jpg', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `session`
-- ----------------------------
DROP TABLE IF EXISTS `session`;
CREATE TABLE `session` (
  `session_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '场次ID',
  `hall_id` int(10) NOT NULL COMMENT '场厅ID',
  `cinema_id` int(10) NOT NULL COMMENT '电影院ID',
  `movie_id` int(10) NOT NULL COMMENT '电影ID',
  `date` date NOT NULL COMMENT '放映日期',
  `startTime` time DEFAULT NULL COMMENT '开场时间',
  `price` double(50,0) NOT NULL,
  `remain` int(50) NOT NULL COMMENT '剩余座位数',
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of session
-- ----------------------------
INSERT INTO `session` VALUES ('1', '1', '1', '3', '2018-11-28', '20:30:00', '43', '30');
INSERT INTO `session` VALUES ('2', '2', '1', '1', '2018-11-30', '20:50:00', '43', '30');
INSERT INTO `session` VALUES ('3', '1', '1', '3', '2018-11-30', '10:30:00', '38', '30');
INSERT INTO `session` VALUES ('4', '4', '2', '1', '2018-11-30', '19:45:00', '39', '30');
INSERT INTO `session` VALUES ('5', '5', '2', '1', '2018-11-30', '22:20:00', '30', '30');
INSERT INTO `session` VALUES ('6', '2', '1', '1', '2018-11-28', '19:30:00', '48', '30');

-- ----------------------------
-- Table structure for `ticket`
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket` (
  `ticket_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '电影票ID',
  `user_id` int(10) NOT NULL COMMENT '所属用户',
  `session_id` int(10) NOT NULL COMMENT '场次ID',
  `hall_id` int(10) NOT NULL COMMENT '场厅ID',
  `seat` varchar(50) NOT NULL COMMENT '座位号',
  PRIMARY KEY (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ticket
-- ----------------------------
INSERT INTO `ticket` VALUES ('1', '1', '2', '2', 'R1');
INSERT INTO `ticket` VALUES ('2', '1', '2', '2', 'P2');
INSERT INTO `ticket` VALUES ('3', '1', '2', '2', 'I1');
INSERT INTO `ticket` VALUES ('4', '1', '2', '2', 'R13');
INSERT INTO `ticket` VALUES ('5', '1', '2', '2', 'J10');
INSERT INTO `ticket` VALUES ('6', '1', '2', '2', 'P17');
INSERT INTO `ticket` VALUES ('7', '1', '2', '2', 'I10');
INSERT INTO `ticket` VALUES ('8', '1', '2', '2', 'H10');
INSERT INTO `ticket` VALUES ('9', '1', '2', '2', 'E6');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Key',
  `name` varchar(30) NOT NULL COMMENT '用户名',
  `password` varchar(30) NOT NULL COMMENT '密码',
  `email` varchar(30) NOT NULL COMMENT '邮箱',
  `role` int(10) NOT NULL COMMENT '角色(1表示管理员, 0 表示用户)',
  `headImg` varchar(30) DEFAULT NULL COMMENT '头像路径',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123', '365166709@qq.com', '1', 'img/head/admin.jpg');
INSERT INTO `user` VALUES ('2', 'fyf', '123', '2569548856@qq.com', '0', 'img/head/fyf.jpg');
INSERT INTO `user` VALUES ('3', '张茂森', '123', 'zms@qq.com', '0', 'img/head/zms.jpg');
INSERT INTO `user` VALUES ('4', '刘阳', '123', 'liuyang@163.com', '0', 'img/head/ly.jpg');
INSERT INTO `user` VALUES ('5', '王可可', '123', 'wangkeke@qq.com', '0', 'img/head/wkk.jpg');
INSERT INTO `user` VALUES ('6', 'Monster6697', '123', 'Monster6697@163.com', '0', 'img/head/user_id6.jpg');
INSERT INTO `user` VALUES ('7', '草木灰011', '123', 'cmh123@sina.com', '0', 'img/head/user_id7.jpg');
INSERT INTO `user` VALUES ('8', 'JuliaFanl', '123', 'JuliaFanl@163.com', '0', 'img/head/user_id8.jpg');
INSERT INTO `user` VALUES ('9', 'A名犬乐园 （定金选狗）款到发货', '666', 'ams5864@qq.com', '0', 'img/head/user_id9.jpg');
INSERT INTO `user` VALUES ('10', '宝贝', '520', 'baobei520@163.com', '0', 'img/head/user_id10.jpg');
INSERT INTO `user` VALUES ('11', '洋洋', '789xxx', 'yangyangxinglang@sina.com', '0', 'img/head/user_id11.jpg');
INSERT INTO `user` VALUES ('12', 'Misterlonely', 'mister233', 'Misterlonely233@163.com', '0', 'img/head/user_id12.jpg');
INSERT INTO `user` VALUES ('13', '96年的康师傅', '123', 'kshfu96@qq.com', '0', 'img/head/kjg.jpg');
