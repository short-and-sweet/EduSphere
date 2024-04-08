-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        11.3.2-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- myapp 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `myapp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `myapp`;

-- 테이블 myapp.auth_group 구조 내보내기
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 myapp.auth_group:~0 rows (대략적) 내보내기

-- 테이블 myapp.auth_group_permissions 구조 내보내기
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 myapp.auth_group_permissions:~0 rows (대략적) 내보내기

-- 테이블 myapp.auth_permission 구조 내보내기
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 myapp.auth_permission:~36 rows (대략적) 내보내기
INSERT IGNORE INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add user', 7, 'add_customuser'),
	(26, 'Can change user', 7, 'change_customuser'),
	(27, 'Can delete user', 7, 'delete_customuser'),
	(28, 'Can view user', 7, 'view_customuser'),
	(29, 'Can add board', 8, 'add_board'),
	(30, 'Can change board', 8, 'change_board'),
	(31, 'Can delete board', 8, 'delete_board'),
	(32, 'Can view board', 8, 'view_board'),
	(33, 'Can add comment', 9, 'add_comment'),
	(34, 'Can change comment', 9, 'change_comment'),
	(35, 'Can delete comment', 9, 'delete_comment'),
	(36, 'Can view comment', 9, 'view_comment');

-- 테이블 myapp.auth_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 myapp.auth_user:~18 rows (대략적) 내보내기
INSERT IGNORE INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$600000$Xo9rW90f9wSEzHSvfJwsrE$a9GMGYrVmKO8oNQwG+G1uv2fHbzUN2/yjByzzbxXdH0=', NULL, 1, '김민재', '', '', 'user1@exam.com', 1, 1, '2024-04-07 11:06:44.969536'),
	(2, 'pbkdf2_sha256$600000$WExcCAwLqRXoWVRCwm0uS0$vuNOnFsTYESQlhnE6L3P+MJcZmROfIASAbFhlVg3Pb8=', NULL, 0, '임수민', '', '', 'user2@exam.com', 1, 1, '2024-04-07 11:06:45.249906'),
	(3, 'pbkdf2_sha256$600000$yWq7YsBwpMKCtVnc6ILH60$1fSaReNXM+Y/yRjJK1R8dD27T9imt5R+ext9fz1Zawk=', NULL, 0, '조정민', '', '', 'user3@exam.com', 1, 1, '2024-04-07 11:06:45.519161'),
	(4, 'pbkdf2_sha256$600000$GAFN24iNsV46BUANWv433T$DlDjRSEMS0pCf4Oo+PP3bGQgnP+v2wztSLZNgtvFczs=', NULL, 0, '김아현', '', '', 'user4@exam.com', 1, 1, '2024-04-07 11:06:45.784169'),
	(5, 'pbkdf2_sha256$600000$lEkeZixb97BV2biJWCIR9G$Zpg6N1nbcmyzFrt0k+hAphKxDY/N9GlAMLvxMQGKsfI=', NULL, 0, '문성호', '', '', 'user5@exam.com', 1, 1, '2024-04-07 11:06:46.052091'),
	(6, 'pbkdf2_sha256$600000$stLultcqSBR6AajYZ8q7Ay$LLJaSPmI8PIZEdE4QfbaBkXyA9WhAkqIM6oYsBJ0QsQ=', NULL, 0, '정현재', '', '', 'user6@exam.com', 0, 1, '2024-04-07 11:06:46.322226'),
	(7, 'pbkdf2_sha256$600000$bksRWRqPAoIpuSb0IWO7sZ$tfn3UKvDU014A4V++/hGK+KlS88TqLTy7AVSVJSd8DA=', NULL, 0, '오범석', '', '', 'user7@exam.com', 0, 1, '2024-04-07 11:06:46.603368'),
	(8, 'pbkdf2_sha256$600000$1q81iXC2ILZxuzfAugVrlH$QDF0JwhS3+lkvI1IDFd1Cz8eblzaoTffB2ML81995XI=', NULL, 0, '정석진', '', '', 'user8@exam.com', 0, 1, '2024-04-07 11:06:46.875401'),
	(9, 'pbkdf2_sha256$600000$MSqB5jvsIGhqeKgUCUqy6u$mx7ClI7eriATCAz6eTiAut4nlXQtf4O01Q2z58ibz3g=', NULL, 0, '조윤민', '', '', 'user9@exam.com', 0, 1, '2024-04-07 11:06:47.147963'),
	(10, 'pbkdf2_sha256$600000$zAg4qih4D7gQWXM0ipZ22Q$tyBa4l9oCrWlpdbNcNepXKVSKZXlRA7Kjv4QpCiWR8o=', NULL, 0, '조아라', '', '', 'user10@exam.com', 0, 1, '2024-04-07 11:06:47.430017'),
	(11, 'pbkdf2_sha256$600000$zySW38aWxELsDzCvasVLM2$8eJv2CYVpJxc+7/KwlIyQzZQM83vOODP8U33POcyCyE=', NULL, 0, '정승민', '', '', 'user11@exam.com', 0, 1, '2024-04-07 11:06:47.697646'),
	(12, 'pbkdf2_sha256$600000$t8EsYkqwJfoE5jHLzZLNGi$80hL7BV+L+RvnThKstxXQTKPUwt/5UosVLH72zZpIQU=', NULL, 0, '최준형', '', '', 'user12@exam.com', 0, 1, '2024-04-07 11:06:47.952323'),
	(13, 'pbkdf2_sha256$600000$PxS6oPsC1LMUTmclnNdVWG$zaiCPZSVRu2mivtUwml7TB3U9v0EJJZJ3qYMzHMoVo4=', NULL, 0, '문민혁', '', '', 'user13@exam.com', 0, 1, '2024-04-07 11:06:48.222882'),
	(14, 'pbkdf2_sha256$600000$9EjdFg1xIhX3anoiHWFleo$z7ZJoFxzIRJaajAmKeORbEiu6NwMrcwhMoNyVJqaPbg=', NULL, 0, '김민설', '', '', 'user14@exam.com', 0, 1, '2024-04-07 11:06:48.489652'),
	(15, 'pbkdf2_sha256$600000$1eaIqE38drgYQW3iHC5HkM$XsywIh7Wag7MbMDFaNHLemhjmraRfmrY8YjiuWsvI8Q=', NULL, 0, '김하연', '', '', 'user15@exam.com', 0, 1, '2024-04-07 11:06:48.759046'),
	(16, 'pbkdf2_sha256$600000$4sfZbBRqKNi2xd19wQg9sz$cDOCWmefByC79IH9olBHOixKvR4Me5PkXeaIJV2skug=', NULL, 0, '정세현', '', '', 'user16@exam.com', 0, 1, '2024-04-07 11:06:49.037197'),
	(17, 'pbkdf2_sha256$600000$IpY6jpJFmVhMuxNeqGRsbd$iKsovTC2NiLgjd/84bPavkgeLfetDSK7zwaVgq2CEIk=', NULL, 0, '황준우', '', '', 'user17@exam.com', 0, 1, '2024-04-07 11:06:49.303735'),
	(18, 'pbkdf2_sha256$600000$JQOoO8X9BHxrKa2TNa0ZtU$8Jph8P6AQJWctaT0vpfZZfiKAmtFKhca8SekaJGWBYI=', NULL, 0, '신진섭', '', '', 'user18@exam.com', 0, 1, '2024-04-07 11:06:49.574153');

-- 테이블 myapp.auth_user_groups 구조 내보내기
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 myapp.auth_user_groups:~0 rows (대략적) 내보내기

-- 테이블 myapp.auth_user_user_permissions 구조 내보내기
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 myapp.auth_user_user_permissions:~0 rows (대략적) 내보내기

-- 테이블 myapp.django_admin_log 구조 내보내기
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 myapp.django_admin_log:~0 rows (대략적) 내보내기

-- 테이블 myapp.django_content_type 구조 내보내기
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 myapp.django_content_type:~9 rows (대략적) 내보내기
INSERT IGNORE INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(8, 'myapp', 'board'),
	(9, 'myapp', 'comment'),
	(7, 'myapp', 'customuser'),
	(6, 'sessions', 'session');

-- 테이블 myapp.django_migrations 구조 내보내기
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 myapp.django_migrations:~24 rows (대략적) 내보내기
INSERT IGNORE INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2024-04-05 06:18:07.227694'),
	(2, 'auth', '0001_initial', '2024-04-05 06:18:07.500818'),
	(3, 'admin', '0001_initial', '2024-04-05 06:18:07.543941'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2024-04-05 06:18:07.562479'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-04-05 06:18:07.562479'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2024-04-05 06:18:07.610623'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2024-04-05 06:18:07.627232'),
	(8, 'auth', '0003_alter_user_email_max_length', '2024-04-05 06:18:07.644314'),
	(9, 'auth', '0004_alter_user_username_opts', '2024-04-05 06:18:07.644314'),
	(10, 'auth', '0005_alter_user_last_login_null', '2024-04-05 06:18:07.692837'),
	(11, 'auth', '0006_require_contenttypes_0002', '2024-04-05 06:18:07.694832'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2024-04-05 06:18:07.696222'),
	(13, 'auth', '0008_alter_user_username_max_length', '2024-04-05 06:18:07.712974'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2024-04-05 06:18:07.729573'),
	(15, 'auth', '0010_alter_group_name_max_length', '2024-04-05 06:18:07.746333'),
	(16, 'auth', '0011_update_proxy_permissions', '2024-04-05 06:18:07.746333'),
	(17, 'auth', '0012_alter_user_first_name_max_length', '2024-04-05 06:18:07.762945'),
	(18, 'myapp', '0001_initial', '2024-04-05 06:18:07.877963'),
	(19, 'sessions', '0001_initial', '2024-04-05 06:18:07.910463'),
	(20, 'myapp', '0002_customuser_alter_board_author_alter_comment_user_and_more', '2024-04-05 06:20:46.093696'),
	(21, 'myapp', '0003_alter_board_author', '2024-04-06 08:55:09.206176'),
	(22, 'myapp', '0004_alter_comment_user', '2024-04-06 09:53:35.873215'),
	(23, 'myapp', '0005_alter_board_author_alter_comment_user', '2024-04-07 11:00:48.541784'),
	(24, 'myapp', '0006_delete_customuser', '2024-04-08 00:59:39.162040');

-- 테이블 myapp.django_session 구조 내보내기
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 myapp.django_session:~0 rows (대략적) 내보내기

-- 테이블 myapp.myapp_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `myapp_board` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_board_author_id_b9710249_fk_auth_user_id` (`author_id`),
  CONSTRAINT `myapp_board_author_id_b9710249_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 myapp.myapp_board:~20 rows (대략적) 내보내기
INSERT IGNORE INTO `myapp_board` (`id`, `title`, `content`, `created_at`, `author_id`) VALUES
	(1, '오늘 아침식단은 뭔가요', '아침 먹지말고 그냥 자고 싶은데', '2024-04-07 11:06:52.323209', 1),
	(2, '오늘의 일정은 어떻게 되나요?', '오늘은 무엇을 해야할까요?', '2024-04-07 11:06:52.337379', 2),
	(3, '오늘의 날씨는 어떻게 되나요?', '오늘은 맑은가요 흐린가요?', '2024-04-07 11:06:52.342794', 3),
	(4, '게시글 제목 4', '게시글 내용 4', '2024-04-07 11:06:52.347475', 4),
	(5, '게시글 제목 5', '게시글 내용 5', '2024-04-07 11:06:52.348769', 5),
	(6, '게시글 제목 6', '게시글 내용 6', '2024-04-07 11:06:52.350598', 6),
	(7, '게시글 제목 7', '게시글 내용 7', '2024-04-07 11:06:52.353530', 7),
	(8, '게시글 제목 8', '게시글 내용 8', '2024-04-07 11:06:52.353530', 8),
	(9, '게시글 제목 9', '게시글 내용 9', '2024-04-07 11:06:52.353530', 9),
	(10, '게시글 제목 10', '게시글 내용 10', '2024-04-07 11:06:52.359104', 10),
	(11, '게시글 제목 11', '게시글 내용 11', '2024-04-07 11:06:52.360459', 11),
	(12, '게시글 제목 12', '게시글 내용 12', '2024-04-07 11:06:52.362135', 12),
	(13, '게시글 제목 13', '게시글 내용 13', '2024-04-07 11:06:52.363653', 13),
	(14, '게시글 제목 14', '게시글 내용 14', '2024-04-07 11:06:52.363653', 14),
	(15, '게시글 제목 15', '게시글 내용 15', '2024-04-07 11:06:52.363653', 15),
	(16, '게시글 제목 16', '게시글 내용 16', '2024-04-07 11:06:52.368999', 16),
	(17, '게시글 제목 17', '게시글 내용 17', '2024-04-07 11:06:52.370145', 17),
	(18, '게시글 제목 18', '게시글 내용 18', '2024-04-07 11:06:52.372601', 18),
	(19, '게시글 제목 19', '게시글 내용 19', '2024-04-07 11:06:52.374205', 1),
	(20, '게시글 제목 20', '게시글 내용 20', '2024-04-07 11:06:52.374205', 2);

-- 테이블 myapp.myapp_comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `myapp_comment` (
  `comment_num` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `board_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_num`),
  KEY `myapp_comment_board_id_ee96f80b_fk_myapp_board_id` (`board_id`),
  KEY `myapp_comment_user_id_792769d9_fk_auth_user_id` (`user_id`),
  CONSTRAINT `myapp_comment_board_id_ee96f80b_fk_myapp_board_id` FOREIGN KEY (`board_id`) REFERENCES `myapp_board` (`id`),
  CONSTRAINT `myapp_comment_user_id_792769d9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 myapp.myapp_comment:~40 rows (대략적) 내보내기
INSERT IGNORE INTO `myapp_comment` (`comment_num`, `text`, `board_id`, `user_id`) VALUES
	(1, '이 댓글은 더미 데이터입니다. 1', 13, 9),
	(2, '이 댓글은 더미 데이터입니다. 2', 10, 10),
	(3, '이 댓글은 더미 데이터입니다. 3', 9, 13),
	(4, '이 댓글은 더미 데이터입니다. 4', 3, 15),
	(5, '이 댓글은 더미 데이터입니다. 5', 5, 12),
	(6, '이 댓글은 더미 데이터입니다. 6', 19, 13),
	(7, '이 댓글은 더미 데이터입니다. 7', 15, 13),
	(8, '이 댓글은 더미 데이터입니다. 8', 9, 3),
	(9, '이 댓글은 더미 데이터입니다. 9', 7, 2),
	(10, '이 댓글은 더미 데이터입니다. 10', 9, 4),
	(11, '이 댓글은 더미 데이터입니다. 11', 5, 8),
	(12, '이 댓글은 더미 데이터입니다. 12', 18, 5),
	(13, '이 댓글은 더미 데이터입니다. 13', 15, 4),
	(14, '이 댓글은 더미 데이터입니다. 14', 13, 2),
	(15, '이 댓글은 더미 데이터입니다. 15', 9, 12),
	(16, '이 댓글은 더미 데이터입니다. 16', 14, 2),
	(17, '이 댓글은 더미 데이터입니다. 17', 2, 1),
	(18, '이 댓글은 더미 데이터입니다. 18', 5, 6),
	(19, '이 댓글은 더미 데이터입니다. 19', 11, 11),
	(20, '이 댓글은 더미 데이터입니다. 20', 11, 5),
	(21, '이 댓글은 더미 데이터입니다. 21', 1, 7),
	(22, '이 댓글은 더미 데이터입니다. 22', 15, 4),
	(23, '이 댓글은 더미 데이터입니다. 23', 13, 9),
	(24, '이 댓글은 더미 데이터입니다. 24', 10, 8),
	(25, '이 댓글은 더미 데이터입니다. 25', 17, 14),
	(26, '이 댓글은 더미 데이터입니다. 26', 13, 1),
	(27, '이 댓글은 더미 데이터입니다. 27', 11, 16),
	(28, '이 댓글은 더미 데이터입니다. 28', 12, 18),
	(29, '이 댓글은 더미 데이터입니다. 29', 2, 14),
	(30, '이 댓글은 더미 데이터입니다. 30', 13, 11),
	(31, '이 댓글은 더미 데이터입니다. 31', 3, 8),
	(32, '이 댓글은 더미 데이터입니다. 32', 16, 6),
	(33, '이 댓글은 더미 데이터입니다. 33', 14, 16),
	(34, '이 댓글은 더미 데이터입니다. 34', 9, 15),
	(35, '이 댓글은 더미 데이터입니다. 35', 10, 8),
	(36, '이 댓글은 더미 데이터입니다. 36', 11, 17),
	(37, '이 댓글은 더미 데이터입니다. 37', 12, 7),
	(38, '이 댓글은 더미 데이터입니다. 38', 4, 11),
	(39, '이 댓글은 더미 데이터입니다. 39', 15, 6),
	(40, '이 댓글은 더미 데이터입니다. 40', 14, 13);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
