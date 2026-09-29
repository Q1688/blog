/*
 Navicat Premium Data Transfer

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 80402 (8.4.2)
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 80402 (8.4.2)
 File Encoding         : 65001

 Date: 28/09/2026 17:29:56
 数据库名：blog
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add 邮箱验证码', 7, 'add_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (26, 'Can change 邮箱验证码', 7, 'change_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 邮箱验证码', 7, 'delete_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (28, 'Can view 邮箱验证码', 7, 'view_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (29, 'Can add 用户数据', 8, 'add_userprofile');
INSERT INTO `auth_permission` VALUES (30, 'Can change 用户数据', 8, 'change_userprofile');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 用户数据', 8, 'delete_userprofile');
INSERT INTO `auth_permission` VALUES (32, 'Can view 用户数据', 8, 'view_userprofile');
INSERT INTO `auth_permission` VALUES (33, 'Can add 文章分类', 9, 'add_category');
INSERT INTO `auth_permission` VALUES (34, 'Can change 文章分类', 9, 'change_category');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 文章分类', 9, 'delete_category');
INSERT INTO `auth_permission` VALUES (36, 'Can view 文章分类', 9, 'view_category');
INSERT INTO `auth_permission` VALUES (37, 'Can add 文章标签', 10, 'add_tag');
INSERT INTO `auth_permission` VALUES (38, 'Can change 文章标签', 10, 'change_tag');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 文章标签', 10, 'delete_tag');
INSERT INTO `auth_permission` VALUES (40, 'Can view 文章标签', 10, 'view_tag');
INSERT INTO `auth_permission` VALUES (41, 'Can add 文章内容', 11, 'add_article');
INSERT INTO `auth_permission` VALUES (42, 'Can change 文章内容', 11, 'change_article');
INSERT INTO `auth_permission` VALUES (43, 'Can delete 文章内容', 11, 'delete_article');
INSERT INTO `auth_permission` VALUES (44, 'Can view 文章内容', 11, 'view_article');
INSERT INTO `auth_permission` VALUES (45, 'Can add 侧边栏', 12, 'add_sidebar');
INSERT INTO `auth_permission` VALUES (46, 'Can change 侧边栏', 12, 'change_sidebar');
INSERT INTO `auth_permission` VALUES (47, 'Can delete 侧边栏', 12, 'delete_sidebar');
INSERT INTO `auth_permission` VALUES (48, 'Can view 侧边栏', 12, 'view_sidebar');
INSERT INTO `auth_permission` VALUES (49, 'Can add 留言', 13, 'add_comment');
INSERT INTO `auth_permission` VALUES (50, 'Can change 留言', 13, 'change_comment');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 留言', 13, 'delete_comment');
INSERT INTO `auth_permission` VALUES (52, 'Can view 留言', 13, 'view_comment');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户注册表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$600000$O9ckexxHARxdifbzeYywWZ$PqxttSXdv30mK1BiCgdXhDhnaDmEQANluY4eRnbJZo8=', '2026-05-15 07:05:41.136205', 1, 'admin', '', '', '1063075593@qq.com', 1, 1, '2026-05-06 08:29:39.170945');
INSERT INTO `auth_user` VALUES (3, 'pbkdf2_sha256$600000$9KifL88fBNNlCaZV0vPwpC$ANO9Y9TMMENLjhoMh5Et+aJ1TTutrc4MVl2774XKCF0=', '2026-05-07 02:08:48.765582', 0, '17835589085@163.com', '', '', '17835589085@163.com', 1, 1, '2026-05-06 08:39:13.705392');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for blogmessage_article
-- ----------------------------
DROP TABLE IF EXISTS `blogmessage_article`;
CREATE TABLE `blogmessage_article`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_hot` tinyint(1) NOT NULL,
  `pv` int NOT NULL,
  `add_date` datetime(6) NOT NULL,
  `pub_date` datetime(6) NOT NULL,
  `category_id` bigint NOT NULL,
  `owner_id` int NOT NULL,
  `tags_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `blogmessage_article_category_id_4a8e9224_fk_blogmessa`(`category_id` ASC) USING BTREE,
  INDEX `blogmessage_article_owner_id_4d2712ee_fk_auth_user_id`(`owner_id` ASC) USING BTREE,
  INDEX `blogmessage_article_tags_id_704fc8c4_fk_blogmessage_tag_id`(`tags_id` ASC) USING BTREE,
  CONSTRAINT `blogmessage_article_category_id_4a8e9224_fk_blogmessa` FOREIGN KEY (`category_id`) REFERENCES `blogmessage_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blogmessage_article_owner_id_4d2712ee_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blogmessage_article_tags_id_704fc8c4_fk_blogmessage_tag_id` FOREIGN KEY (`tags_id`) REFERENCES `blogmessage_tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '文章内容表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blogmessage_article
-- ----------------------------
INSERT INTO `blogmessage_article` VALUES (1, '外婆情长', '思念外婆', '<p>&nbsp; &nbsp; &nbsp; &nbsp; 二零二六年正月十三的雨夹雪，是我这辈子都忘不掉的天气。那不是一场普通的寒潮，而是一场浸透了命运重量的告别。天空低垂，灰白的云层像压在心头的石头，雨丝斜织，夹着未及成形便已融化的雪粒，纷纷扬扬地砸在人间，仿佛天地也在为某个灵魂的离去而垂泪。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 那天清晨，我接到父亲电话时，窗外的雨正砸在玻璃上，混着雪粒子，发出细碎又急促的声响。电话那头父亲的低沉声音只说了一句话：“你外婆……走了。”那一刻，时间仿佛凝固了，我眼中的泪水瞬间夺眶而出，都说男儿有泪不轻弹，只是未到伤心处。爱人匆忙收拾衣物带着小孩陪我往回赶，我脑海里一片空白，只有那句话在不断回响，我的心像被一只无形的手攥紧，连呼吸都带着疼。每一步都像踩在棉花上，又像被铁链拖拽着向前，快不起来，却又不敢慢下来。以往回老家的路程感觉挺快，可偏偏那天油门被踩到底都感觉路程特别遥远。</p><p><span style=\"color:black;\">&nbsp; &nbsp; &nbsp; &nbsp; 大学毕业后，我留在了城里成家工作，回家的次数越来越少。每次打电话回家，外婆和外公总是说：“我们都挺好的。”可我知道，她心里是盼着我回去。每一次通话，她的声音都透着掩饰不住的疲惫，可她从不曾抱怨。我曾许诺她“下次回来陪您住”，可下个次又成了下下次，直到那个电话突然响起……，我都没有兑现我的承诺</span></p><p>&nbsp; &nbsp; &nbsp; &nbsp; 当赶到那个熟悉的外婆家时，她已经躺在了老屋里的门板上，脸色苍白得像窗外的雪。我扑到床边，那双手曾经那么温暖有力，为我洗衣做饭、牵我走过无数个泥泞的清晨与黄昏，如今却冰凉僵硬。我用力呼唤却再也得不到任何回应了，始终不敢相信这件事来的如此之快。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 屋外雨雪下得更大了，我跪在她的灵前，看着那盏忽明忽暗的长明灯，火苗在风中摇曳，仿佛她身前微弱的呼吸。凝望着曾经和外婆一起走过无数遍的小巷子再也看不到那个快乐的少年郎------因为那个在外婆怀里笑闹的孩子，在她离去的那一刻，永远地长大了。与外婆在一起的过往画面像电影一样在脑海里回放，一幕幕清晰得如同昨日。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 小时候，我是外婆带大的。那时候父母都忙于工作，无时间照顾我。外婆把我拉扯大，她用瘦弱的肩膀扛起了整个家。她是我的母亲，也是我的父亲，是我的整个童年。夏天的夜晚，她陪我躺在老炕上，摇着蒲扇给我讲故事，时不时地给我扇风。我躺在她的怀里，闻着她身上淡淡的皂角香，听着她讲那些古老的传说——牛郎织女、孟姜女哭长城、白蛇传……她的声音低沉而温柔，像夏夜的风，轻轻拂过我的梦境，我总能很快进入梦乡。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 冬天的早上，她总是早早起床，把我的棉袄放在炕头焐热，然后才叫我起床。我穿上暖乎乎的棉袄，心里也跟着暖乎乎的。她自己却穿着单薄的旧衣，手指冻得通红，还在灶台前忙碌。我曾问她：“外婆，你不冷吗？”她只是笑笑：“外婆不怕冷，外婆是铁打的。”可我知道，她不是铁打的，她只是把所有的暖意都给了我。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 外婆的手很巧，她会用棉线织毛衣，用棉花做棉衣。我身上穿的每一件毛衣，都是她亲手织的，针脚细密，样式好看。有一年冬天，她为了给我织一件新毛衣，熬了好几个通宵，眼睛都熬红了。我半夜醒来，看见她就着昏黄的灯，一针一线地织着，嘴里还轻轻哼着不知名的戏曲调子。当她把毛衣递到我手里时，我摸着那柔软的毛线，心里充满了感动。后来我才明白，那不是一件简单的毛衣，那是她用时间与爱一针一线缝进我生命的温度。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 外婆还很疼我。从来都不让父母打骂，即便我犯错都有外婆帮我撑腰，不停地安慰我：“别怕，外婆在呢。”事后外婆总是耐心且温柔的和我交流，让我明白了是非对错。外婆在村里是一个热心正值、刚正不阿的人，亲戚及村里人都对外婆非常尊重，别人有事找来帮忙都是鼎力相助，从来没有推诿过。从小受到外婆的熏陶，让长大后的我成了一个敢作敢当的人。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 下葬那天，敲击钉子的声音像针锥扎我的心一样，即便我哭的撕心裂肺，嗓子沙哑都等不到那个期待的人给我擦眼泪了。外婆身前总是怕黑，如今却一个人手持夜灯独自走在了漫长黑色的道路上。她走得太安静，却在我心里掀起了一场永远无法平息的风暴。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 如今，外婆已经离开我快四个月了。每当我看到窗外的雨雪，我脑海里时常想起外婆，她还是那样慈祥地笑着，摇着蒲扇给我讲故事。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 外婆，我想您了。这句话我在心里说了无数遍，却从来不敢对别人说。因为我知道，言一出，必流泪。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 可今天，我坐在电脑前，敲下这些文字，泪水还是忍不住流了下来。外婆，您在那边还好吗？如果您能听到我的声音，就请您托个梦给我，让我再看看您，再听听您的声音，让我再叫您一声“外婆”。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 我知道，这份思念，会伴随我一生，直到我也走到生命的尽头。到那时，我还要牵着外婆的手，听她再给我讲故事。</p>', 1, 60, '2026-05-06 08:50:58.212447', '2026-05-15 07:07:39.073964', 1, 1, 1);
INSERT INTO `blogmessage_article` VALUES (2, '人性的反思', '对人性的分析', '<p>&nbsp; &nbsp; &nbsp; &nbsp;在人类社会的漫漫长河中，人性始终是一个复杂而深邃的命题。它如同多棱镜，在不同的光照下折射出截然不同的色彩，既有温暖璀璨的善，也有幽暗冰冷的恶。从古希腊哲人对“德性是否可教”的追问，到中国先秦儒家“性善论”与法家“性恶论”的激烈交锋，再到现代心理学对道德判断机制的实证研究，人类从未停止对自身本质的探索。当我们驻足回望历史的足迹，审视当下的社会百态，便会发现，对人性的反思，是人类走向成熟与进步的永恒课题。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;人性中的善，是照亮世间的明灯。古往今来，无数仁人志士用行动诠释着善良的力量。春秋时期，孔子周游列国，宣扬“仁爱”思想，主张“己所不欲，勿施于人”，他的学说如春雨般滋润着人们的心灵，让善良的种子在华夏大地上生根发芽。孟子进一步提出“人皆有恻隐之心”，认为善是人与生俱来的潜能，只需加以引导与培育，便能推己及人，达致“老吾老以及人之老，幼吾幼以及人之幼”的理想境界。这种对人性本善的信念，在后世不断被现实中的善举所印证。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;在现代社会，我们也能看到无数平凡人的善举：疫情期间，白衣天使们不顾个人安危，逆行而上，用血肉之躯筑起守护生命的长城；路边的志愿者，为流浪者送去热腾腾的饭菜，让寒冷的冬日多了几分温暖；偏远山区的支教老师，放弃城市的繁华，用知识的火种点亮孩子们的希望之光。这些善举，如同夜空中的繁星，汇聚成照亮世界的璀璨星河，让我们相信人性本善的力量。更令人动容的是，在灾难面前，陌生人之间的互助常常超越血缘与地域的界限——汶川地震中，无数素不相识的民众自发奔赴灾区救援；河南暴雨期间，普通市民手拉手组成“人链”救出被困者——这些瞬间闪耀着人性最纯粹的光辉。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;然而，人性并非只有善的一面，恶的阴影同样如影随形。翻开历史的画卷，我们会看到战争的残酷与血腥。第二次世界大战期间，纳粹德国对犹太人进行了惨无人道的大屠杀，无数无辜的生命在毒气室中消逝，人性的丑恶在这一刻暴露无遗。心理学家汉娜·阿伦特在《艾希曼在耶路撒冷》中提出的“平庸的恶”概念，揭示了一个令人不安的事实：许多作恶者并非天生的恶魔，而是普通人，在体制的裹挟与命令的服从中，逐渐丧失了独立思考的能力，最终成为系统暴力的执行工具。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;而在和平年代，我们也能看到一些人被贪婪、嫉妒、仇恨等负面情绪所驱使，做出违背道德和法律的事情。为了追求利益，商家不惜生产假冒伪劣产品，损害消费者的健康；为了满足一己私欲，官员滥用职权，贪污受贿，破坏社会的公平正义；甚至在日常生活中，也有人因为一点小事就恶语相向，拳脚相加，将人性中的恶无限放大。心理学中的“旁观者效应”也提醒我们：在群体中，个体责任感可能被稀释，导致面对不公时选择沉默。这些恶行，如同毒瘤，侵蚀着社会的肌体，让我们不得不对人性中的恶进行深刻的反思。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;那么，人性中的善与恶究竟是如何产生的呢？这与后天的环境和教育有着密切的关系。一个人所处的家庭环境、社会氛围以及所接受的教育，都会对其人性的形成产生深远的影响。在一个充满爱与温暖的家庭中长大的孩子，更容易养成善良、正直的品质；而在一个充满暴力与冷漠的环境中成长的孩子，往往更容易滋生恶的念头。心理学家阿尔伯特·班杜拉的社会学习理论指出，人类的行为很大程度上是通过观察与模仿习得的，儿童会从父母、教师、媒体中学习如何对待他人。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;同时，教育也是塑造人性的重要手段。良好的教育能够引导人们树立正确的价值观和道德观，让人们明辨是非，懂得善恶；而缺失的教育则可能导致人们迷失自我，陷入恶的深渊。法国思想家卢梭在《爱弥儿》中强调“自然教育”的重要性，主张教育应顺应儿童的天性，培养其独立判断与同理心；而中国传统文化则强调“修身齐家治国平天下”，将个人品德修养视为社会和谐的基石。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;对人性的反思，不仅是为了揭示人性的复杂，更是为了引导人们走向善的彼岸。我们应该正视人性中的恶，但不能因此而否定人性中的善。相反，我们要通过不断地反思和自我提升，努力唤醒人性中的善，抑制人性中的恶。政府和社会应该加强道德建设，营造良好的社会氛围，让善良成为一种社会风尚；家庭和学校应该注重对孩子的品德教育，从小培养他们的善良之心；而作为个体，我们更要时刻反思自己的行为，坚守道德底线，用善良的行动去影响身边的人。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;“人之初，性本善。性相近，习相远。”这句古老的名言，至今仍有着深刻的现实意义。人性如同一张白纸，后天的环境和教育在上面描绘出不同的图案。对人性的反思，是我们每个人的必修课。只有不断地反思，我们才能更好地认识自己，理解他人，让人性的光辉在世间闪耀，让我们的社会变得更加美好。</p>', 1, 14, '2026-05-06 08:54:15.149297', '2026-05-15 07:42:56.108279', 1, 1, 1);

-- ----------------------------
-- Table structure for blogmessage_category
-- ----------------------------
DROP TABLE IF EXISTS `blogmessage_category`;
CREATE TABLE `blogmessage_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_date` datetime(6) NOT NULL,
  `pub_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '文章类别表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blogmessage_category
-- ----------------------------
INSERT INTO `blogmessage_category` VALUES (1, '情感', '', '2026-05-06 08:48:30.737136', '2026-05-06 08:48:30.737136');
INSERT INTO `blogmessage_category` VALUES (2, '技术', '', '2026-05-06 08:48:36.393788', '2026-05-06 08:48:36.393788');

-- ----------------------------
-- Table structure for blogmessage_comment
-- ----------------------------
DROP TABLE IF EXISTS `blogmessage_comment`;
CREATE TABLE `blogmessage_comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(240) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `article_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `blogmessage_comment_article_id_75237a50_fk_blogmessa`(`article_id` ASC) USING BTREE,
  CONSTRAINT `blogmessage_comment_article_id_75237a50_fk_blogmessa` FOREIGN KEY (`article_id`) REFERENCES `blogmessage_article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '留言评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blogmessage_comment
-- ----------------------------
INSERT INTO `blogmessage_comment` VALUES (1, '逆骨不逆谷', '1063075593@qq.com', '早知长大是一场场的离别，就不会盼着自己快点长大了。', '2026-05-07 01:42:36.811418', 1);

-- ----------------------------
-- Table structure for blogmessage_sidebar
-- ----------------------------
DROP TABLE IF EXISTS `blogmessage_sidebar`;
CREATE TABLE `blogmessage_sidebar`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_type` int UNSIGNED NOT NULL,
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int UNSIGNED NOT NULL,
  `status` int UNSIGNED NOT NULL,
  `add_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `blogmessage_sidebar_chk_1` CHECK (`display_type` >= 0),
  CONSTRAINT `blogmessage_sidebar_chk_2` CHECK (`sort` >= 0),
  CONSTRAINT `blogmessage_sidebar_chk_3` CHECK (`status` >= 0)
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '布局右侧标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blogmessage_sidebar
-- ----------------------------
INSERT INTO `blogmessage_sidebar` VALUES (1, '搜索', 1, '', 1, 2, '2026-05-06 08:47:22.375433');
INSERT INTO `blogmessage_sidebar` VALUES (2, '最新文章', 2, '', 1, 2, '2026-05-06 08:47:34.918413');
INSERT INTO `blogmessage_sidebar` VALUES (3, '最热文章', 3, '', 1, 2, '2026-05-06 08:47:44.727513');
INSERT INTO `blogmessage_sidebar` VALUES (4, '最近评论', 4, '', 1, 2, '2026-05-06 08:47:53.750511');

-- ----------------------------
-- Table structure for blogmessage_tag
-- ----------------------------
DROP TABLE IF EXISTS `blogmessage_tag`;
CREATE TABLE `blogmessage_tag`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_date` datetime(6) NOT NULL,
  `pub_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '文章标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blogmessage_tag
-- ----------------------------
INSERT INTO `blogmessage_tag` VALUES (1, '情感', '2026-05-06 08:48:43.111006', '2026-05-06 08:48:43.111006');
INSERT INTO `blogmessage_tag` VALUES (2, '技术', '2026-05-06 08:48:48.526949', '2026-05-06 08:48:48.526949');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id` ASC) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_chk_1` CHECK (`action_flag` >= 0)
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2026-05-06 08:47:22.376403', '1', '搜索', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (2, '2026-05-06 08:47:34.919409', '2', '最新文章', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (3, '2026-05-06 08:47:44.728512', '3', '最热文章', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (4, '2026-05-06 08:47:53.751487', '4', '最近评论', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (5, '2026-05-06 08:48:30.739092', '1', '情感', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (6, '2026-05-06 08:48:36.394840', '2', '技术', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (7, '2026-05-06 08:48:43.111978', '1', '情感', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (8, '2026-05-06 08:48:48.527921', '2', '技术', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (9, '2026-05-06 08:50:58.213444', '1', '再也看不到那个快乐的少年郎', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (10, '2026-05-06 08:54:15.150257', '2', '人性的反思', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (11, '2026-05-07 01:50:38.654338', '1', '逆骨不逆谷 - 2026-05-07 01:42', 2, '[]', 13, 1);
INSERT INTO `django_admin_log` VALUES (12, '2026-05-14 09:25:42.594024', '1', '外婆桥', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u6807\\u9898\", \"\\u6587\\u7ae0\\u63cf\\u8ff0\", \"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (13, '2026-05-15 07:04:54.104950', '1', '外婆情长', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u6807\\u9898\", \"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (14, '2026-05-15 07:07:39.074715', '1', '外婆情长', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (15, '2026-05-15 07:42:56.109314', '2', '人性的反思', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u63cf\\u8ff0\", \"\\u6587\\u7ae0\\u5185\\u5bb9\", \"\\u662f\\u5426\\u70ed\\u95e8\"]}}]', 11, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (11, 'blogmessage', 'article');
INSERT INTO `django_content_type` VALUES (9, 'blogmessage', 'category');
INSERT INTO `django_content_type` VALUES (13, 'blogmessage', 'comment');
INSERT INTO `django_content_type` VALUES (12, 'blogmessage', 'sidebar');
INSERT INTO `django_content_type` VALUES (10, 'blogmessage', 'tag');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (7, 'user', 'emailverifyrecord');
INSERT INTO `django_content_type` VALUES (8, 'user', 'userprofile');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2026-05-06 08:29:04.627548');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2026-05-06 08:29:05.181019');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2026-05-06 08:29:05.319694');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2026-05-06 08:29:05.330416');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2026-05-06 08:29:05.352860');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2026-05-06 08:29:05.450782');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2026-05-06 08:29:05.527000');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2026-05-06 08:29:05.556118');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2026-05-06 08:29:05.566219');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2026-05-06 08:29:05.626027');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2026-05-06 08:29:05.632160');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2026-05-06 08:29:05.642100');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2026-05-06 08:29:05.724190');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2026-05-06 08:29:05.799227');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2026-05-06 08:29:05.822992');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2026-05-06 08:29:05.838741');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2026-05-06 08:29:05.909408');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2026-05-06 08:29:05.949401');
INSERT INTO `django_migrations` VALUES (19, 'user', '0001_initial', '2026-05-06 08:29:06.055596');
INSERT INTO `django_migrations` VALUES (20, 'blogmessage', '0001_initial', '2026-05-06 08:29:58.114850');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('0fav1izf66sdxmsatsqg0s9ehn3a0odg', '.eJxVjDsOwjAQBe_iGln2Ov5R0nMGy59dHEC2FCcV4u4QKQW0b2bei4W4rTVsA5cwF3Zmkp1-txTzA9sOyj22W-e5t3WZE98VftDBr73g83K4fwc1jvqtAQxm0uQwKy28lGnKRZEFRR4pOWMnLSNaSNo7IbVRwoIDJOPIg7Ds_QHfSTcq:1wKvCE:bKwZ971qF3ltmYcQDih51RdpoKda9HL9g5cQYAMIgo0', '2026-05-21 09:39:06.870798');
INSERT INTO `django_session` VALUES ('27w8aksu466oa3zig1qlhfdmt6n3njij', '.eJxVjDsOwjAQBe_iGln2Ov5R0nMGy59dHEC2FCcV4u4QKQW0b2bei4W4rTVsA5cwF3Zmkp1-txTzA9sOyj22W-e5t3WZE98VftDBr73g83K4fwc1jvqtAQxm0uQwKy28lGnKRZEFRR4pOWMnLSNaSNo7IbVRwoIDJOPIg7Ds_QHfSTcq:1wKYjD:S9jcYcdy-RV2NI3ERby1RAb-H8CQWWYFukY6G72cCsg', '2026-05-20 09:39:39.155361');
INSERT INTO `django_session` VALUES ('4a3hpoy2woqgpu4x88md5zshvfkrqf5f', '.eJxVjDsOwjAQBe_iGln2Ov5R0nMGy59dHEC2FCcV4u4QKQW0b2bei4W4rTVsA5cwF3Zmkp1-txTzA9sOyj22W-e5t3WZE98VftDBr73g83K4fwc1jvqtAQxm0uQwKy28lGnKRZEFRR4pOWMnLSNaSNo7IbVRwoIDJOPIg7Ds_QHfSTcq:1wNmZ0:290makRGEF7kLqi4HniDSCiX9A7aHvjUUMvFWnKKWTQ', '2026-05-29 07:02:26.154977');
INSERT INTO `django_session` VALUES ('88ezawbjm6arp9i264eac31rgyym7hww', '.eJxVjDsOwjAQBe_iGln2Ov5R0nMGy59dHEC2FCcV4u4QKQW0b2bei4W4rTVsA5cwF3Zmkp1-txTzA9sOyj22W-e5t3WZE98VftDBr73g83K4fwc1jvqtAQxm0uQwKy28lGnKRZEFRR4pOWMnLSNaSNo7IbVRwoIDJOPIg7Ds_QHfSTcq:1wNSIU:v65sD6CSpl4XN_jmz1PdA-uEChv4URiXIiq5HNiyZlA', '2026-05-28 09:24:02.257179');
INSERT INTO `django_session` VALUES ('dmihvyqnwwgm3jzwm19260yzfhdkxqt1', '.eJxVjDsOwjAQBe_iGln2Ov5R0nMGy59dHEC2FCcV4u4QKQW0b2bei4W4rTVsA5cwF3Zmkp1-txTzA9sOyj22W-e5t3WZE98VftDBr73g83K4fwc1jvqtAQxm0uQwKy28lGnKRZEFRR4pOWMnLSNaSNo7IbVRwoIDJOPIg7Ds_QHfSTcq:1wMLc4:hjIUtBgnHEgZT-IaM3k_YIA2zG-69TMyUWmwjxtRdjg', '2026-05-25 08:03:40.635952');
INSERT INTO `django_session` VALUES ('ege59knwh2gawgexeybc1mf8gyd5erze', '.eJxVjDsOwjAQBe_iGln2Ov5R0nMGy59dHEC2FCcV4u4QKQW0b2bei4W4rTVsA5cwF3Zmkp1-txTzA9sOyj22W-e5t3WZE98VftDBr73g83K4fwc1jvqtAQxm0uQwKy28lGnKRZEFRR4pOWMnLSNaSNo7IbVRwoIDJOPIg7Ds_QHfSTcq:1wKXtZ:sUijtkOyq-VX8hBKHeUwUyHedRj2pENhXy6cXMn66wM', '2026-05-20 08:46:17.001427');
INSERT INTO `django_session` VALUES ('el89q4qeottblfdn84wstdap4zwxkwbh', '.eJxVjDsOwjAQBe_iGln2Ov5R0nMGy59dHEC2FCcV4u4QKQW0b2bei4W4rTVsA5cwF3Zmkp1-txTzA9sOyj22W-e5t3WZE98VftDBr73g83K4fwc1jvqtAQxm0uQwKy28lGnKRZEFRR4pOWMnLSNaSNo7IbVRwoIDJOPIg7Ds_QHfSTcq:1wKXeM:Im1kVb7fW5spSyZbfPKlPnFoyCofaaIqVM8IQp3zAQM', '2026-05-20 08:30:34.032858');
INSERT INTO `django_session` VALUES ('euov6xvsf2lmmhervcwwtcb4jrnk3j9l', '.eJxVjDsOwjAQBe_iGln2Ov5R0nMGy59dHEC2FCcV4u4QKQW0b2bei4W4rTVsA5cwF3Zmkp1-txTzA9sOyj22W-e5t3WZE98VftDBr73g83K4fwc1jvqtAQxm0uQwKy28lGnKRZEFRR4pOWMnLSNaSNo7IbVRwoIDJOPIg7Ds_QHfSTcq:1wNSMM:Vu8b2_KnO3hO8ZrX7uFf4hvrZZS2HTM_SkSfUWkYfcI', '2026-05-28 09:28:02.351103');
INSERT INTO `django_session` VALUES ('jjg8ctarkxopicg99d2car9y2n16lhjn', '.eJxVjDsOwjAQBe_iGln2Ov5R0nMGy59dHEC2FCcV4u4QKQW0b2bei4W4rTVsA5cwF3Zmkp1-txTzA9sOyj22W-e5t3WZE98VftDBr73g83K4fwc1jvqtAQxm0uQwKy28lGnKRZEFRR4pOWMnLSNaSNo7IbVRwoIDJOPIg7Ds_QHfSTcq:1wLbmQ:ul-YrDEtzxMweooEHxJ3TOaqIZ6CyRNM_cvUffh-st8', '2026-05-23 07:07:18.815441');
INSERT INTO `django_session` VALUES ('lk6ul80h3uw2n27vu86pc4h9gdtfe79b', '.eJxVjDsOwjAQBe_iGln2Ov5R0nMGy59dHEC2FCcV4u4QKQW0b2bei4W4rTVsA5cwF3Zmkp1-txTzA9sOyj22W-e5t3WZE98VftDBr73g83K4fwc1jvqtAQxm0uQwKy28lGnKRZEFRR4pOWMnLSNaSNo7IbVRwoIDJOPIg7Ds_QHfSTcq:1wLHhf:ytXieNy5QJkgkZt3Xh53qKcKO2cnKSln50jWHsQnZKM', '2026-05-22 09:41:03.165393');
INSERT INTO `django_session` VALUES ('pwcvhuf8140vaeqsxzsv3n8y9uz9dw98', '.eJxVjDsOwjAQBe_iGln2Ov5R0nMGy59dHEC2FCcV4u4QKQW0b2bei4W4rTVsA5cwF3Zmkp1-txTzA9sOyj22W-e5t3WZE98VftDBr73g83K4fwc1jvqtAQxm0uQwKy28lGnKRZEFRR4pOWMnLSNaSNo7IbVRwoIDJOPIg7Ds_QHfSTcq:1wKndM:b2r6PxTz7foCPFvOHhVLtKvUikpfnvpdDObwTQK2FRg', '2026-05-21 01:34:36.098223');

-- ----------------------------
-- Table structure for user_emailverifyrecord
-- ----------------------------
DROP TABLE IF EXISTS `user_emailverifyrecord`;
CREATE TABLE `user_emailverifyrecord`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '邮箱验证码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_emailverifyrecord
-- ----------------------------
INSERT INTO `user_emailverifyrecord` VALUES (1, 'm87ZhwU0', '17835589085@163.com', 'register');
INSERT INTO `user_emailverifyrecord` VALUES (2, 'R0ifGY4B', '17835589085@163.com', 'register');

-- ----------------------------
-- Table structure for user_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `user_userprofile`;
CREATE TABLE `user_userprofile`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nike_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NULL DEFAULT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `owner_id`(`owner_id` ASC) USING BTREE,
  CONSTRAINT `user_userprofile_owner_id_cff07820_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户属性表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_userprofile
-- ----------------------------
INSERT INTO `user_userprofile` VALUES (1, '逆骨不逆谷', '1994-11-17', '', 'male', '太原', 'images/default.png', 1);
INSERT INTO `user_userprofile` VALUES (2, '顺天意', '1995-09-29', '', 'female', '太原', 'images/default.png', 3);

SET FOREIGN_KEY_CHECKS = 1;
