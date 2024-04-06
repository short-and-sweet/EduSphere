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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 myapp.auth_user:~0 rows (대략적) 내보내기

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 myapp.django_migrations:~22 rows (대략적) 내보내기
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
	(22, 'myapp', '0004_alter_comment_user', '2024-04-06 09:53:35.873215');

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
  `author_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_board_author_id_b9710249_fk_myapp_customuser_id` (`author_id`),
  CONSTRAINT `myapp_board_author_id_b9710249_fk_myapp_customuser_id` FOREIGN KEY (`author_id`) REFERENCES `myapp_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 myapp.myapp_board:~21 rows (대략적) 내보내기
INSERT IGNORE INTO `myapp_board` (`id`, `title`, `content`, `created_at`, `author_id`) VALUES
	(1, '오늘 아침식단은 뭔가요', '아침 먹지말고 그냥 자고 싶은데', '2024-04-06 08:55:39.826809', 1),
	(2, '오늘 아침식단은 뭔가요', '아침 먹지말고 그냥 자고 싶은데', '2024-04-06 09:43:11.400896', 1),
	(3, '오늘의 일정은 어떻게 되나요?', '오늘은 무엇을 해야할까요?', '2024-04-06 09:43:11.422109', 2),
	(4, '오늘의 날씨는 어떻게 되나요?', '오늘은 맑은가요 흐린가요?', '2024-04-06 09:43:11.423749', 3),
	(5, '게시글 제목 4', '게시글 내용 4', '2024-04-06 09:43:11.425100', 4),
	(6, '게시글 제목 5', '게시글 내용 5', '2024-04-06 09:43:11.425100', 5),
	(7, '게시글 제목 6', '게시글 내용 6', '2024-04-06 09:43:11.425100', 6),
	(8, '게시글 제목 7', '게시글 내용 7', '2024-04-06 09:43:11.425100', 7),
	(9, '게시글 제목 8', '게시글 내용 8', '2024-04-06 09:43:11.425100', 8),
	(10, '게시글 제목 9', '게시글 내용 9', '2024-04-06 09:43:11.425100', 9),
	(11, '게시글 제목 10', '게시글 내용 10', '2024-04-06 09:43:11.425100', 10),
	(12, '게시글 제목 11', '게시글 내용 11', '2024-04-06 09:43:11.425100', 11),
	(13, '게시글 제목 12', '게시글 내용 12', '2024-04-06 09:43:11.425100', 12),
	(14, '게시글 제목 13', '게시글 내용 13', '2024-04-06 09:43:11.425100', 13),
	(15, '게시글 제목 14', '게시글 내용 14', '2024-04-06 09:43:11.441167', 14),
	(16, '게시글 제목 15', '게시글 내용 15', '2024-04-06 09:43:11.443201', 15),
	(17, '게시글 제목 16', '게시글 내용 16', '2024-04-06 09:43:11.444245', 16),
	(18, '게시글 제목 17', '게시글 내용 17', '2024-04-06 09:43:11.444245', 17),
	(19, '게시글 제목 18', '게시글 내용 18', '2024-04-06 09:43:11.444245', 18),
	(20, '게시글 제목 19', '게시글 내용 19', '2024-04-06 09:43:11.444245', 1),
	(21, '게시글 제목 20', '게시글 내용 20', '2024-04-06 09:43:11.444245', 2);

-- 테이블 myapp.myapp_comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `myapp_comment` (
  `comment_num` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `board_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`comment_num`),
  KEY `myapp_comment_board_id_ee96f80b_fk_myapp_board_id` (`board_id`),
  KEY `myapp_comment_user_id_792769d9_fk_myapp_customuser_id` (`user_id`),
  CONSTRAINT `myapp_comment_board_id_ee96f80b_fk_myapp_board_id` FOREIGN KEY (`board_id`) REFERENCES `myapp_board` (`id`),
  CONSTRAINT `myapp_comment_user_id_792769d9_fk_myapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `myapp_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 myapp.myapp_comment:~40 rows (대략적) 내보내기
INSERT IGNORE INTO `myapp_comment` (`comment_num`, `text`, `board_id`, `user_id`) VALUES
	(1, '이 댓글은 더미 데이터입니다. 1', 5, 10),
	(2, '이 댓글은 더미 데이터입니다. 2', 11, 2),
	(3, '이 댓글은 더미 데이터입니다. 3', 19, 1),
	(4, '이 댓글은 더미 데이터입니다. 4', 16, 10),
	(5, '이 댓글은 더미 데이터입니다. 5', 2, 3),
	(6, '이 댓글은 더미 데이터입니다. 6', 3, 14),
	(7, '이 댓글은 더미 데이터입니다. 7', 13, 9),
	(8, '이 댓글은 더미 데이터입니다. 8', 2, 15),
	(9, '이 댓글은 더미 데이터입니다. 9', 15, 13),
	(10, '이 댓글은 더미 데이터입니다. 10', 3, 2),
	(11, '이 댓글은 더미 데이터입니다. 11', 16, 9),
	(12, '이 댓글은 더미 데이터입니다. 12', 17, 10),
	(13, '이 댓글은 더미 데이터입니다. 13', 17, 2),
	(14, '이 댓글은 더미 데이터입니다. 14', 18, 9),
	(15, '이 댓글은 더미 데이터입니다. 15', 20, 13),
	(16, '이 댓글은 더미 데이터입니다. 16', 6, 18),
	(17, '이 댓글은 더미 데이터입니다. 17', 14, 1),
	(18, '이 댓글은 더미 데이터입니다. 18', 19, 14),
	(19, '이 댓글은 더미 데이터입니다. 19', 14, 13),
	(20, '이 댓글은 더미 데이터입니다. 20', 5, 13),
	(21, '이 댓글은 더미 데이터입니다. 21', 12, 11),
	(22, '이 댓글은 더미 데이터입니다. 22', 3, 15),
	(23, '이 댓글은 더미 데이터입니다. 23', 14, 1),
	(24, '이 댓글은 더미 데이터입니다. 24', 17, 8),
	(25, '이 댓글은 더미 데이터입니다. 25', 19, 8),
	(26, '이 댓글은 더미 데이터입니다. 26', 13, 1),
	(27, '이 댓글은 더미 데이터입니다. 27', 20, 3),
	(28, '이 댓글은 더미 데이터입니다. 28', 11, 18),
	(29, '이 댓글은 더미 데이터입니다. 29', 5, 16),
	(30, '이 댓글은 더미 데이터입니다. 30', 6, 9),
	(31, '이 댓글은 더미 데이터입니다. 31', 10, 6),
	(32, '이 댓글은 더미 데이터입니다. 32', 18, 7),
	(33, '이 댓글은 더미 데이터입니다. 33', 19, 5),
	(34, '이 댓글은 더미 데이터입니다. 34', 9, 11),
	(35, '이 댓글은 더미 데이터입니다. 35', 8, 6),
	(36, '이 댓글은 더미 데이터입니다. 36', 5, 3),
	(37, '이 댓글은 더미 데이터입니다. 37', 1, 2),
	(38, '이 댓글은 더미 데이터입니다. 38', 11, 16),
	(39, '이 댓글은 더미 데이터입니다. 39', 9, 6),
	(40, '이 댓글은 더미 데이터입니다. 40', 14, 4);

-- 테이블 myapp.myapp_customuser 구조 내보내기
CREATE TABLE IF NOT EXISTS `myapp_customuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `username` varchar(150) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `name` varchar(100) NOT NULL,
  `role` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 myapp.myapp_customuser:~18 rows (대략적) 내보내기
INSERT IGNORE INTO `myapp_customuser` (`id`, `password`, `last_login`, `is_superuser`, `first_name`, `last_name`, `is_staff`, `date_joined`, `username`, `email`, `name`, `role`, `is_active`, `is_admin`) VALUES
	(1, 'pbkdf2_sha256$600000$4CWLC6x2xLLtwk1UgLzQ3P$OssXeqU2UVDDnTcusbOhB9DdXTDhv4dFcwP9iSjAtk4=', NULL, 0, '', '', 0, '2024-04-05 06:42:00.796523', NULL, 'user1@exam.com', '김민재', 'super_admin', 1, 1),
	(2, 'pbkdf2_sha256$600000$RCEX5R2gCHh4QGGclOM2wc$8EDFIU31Ea4GVFMXLUxDspeBtc9gDyafo1oiULSmw/Y=', NULL, 0, '', '', 0, '2024-04-05 06:42:01.080687', NULL, 'user2@exam.com', '임수민', 'admin', 1, 1),
	(3, 'pbkdf2_sha256$600000$G62I3LEIuPgxGGtxSLZZqo$QoHGbj+SZ+rg9VbWvny3acHRWT4w8e5VTMBW3b9TVsY=', NULL, 0, '', '', 0, '2024-04-05 06:42:01.351072', NULL, 'user3@exam.com', '조정민', 'admin', 1, 1),
	(4, 'pbkdf2_sha256$600000$najlzjMJcegfZbheHAOoRF$+9y8dCf80hS6njfNTK8+ciOYWER6yLrrzoAF/B+g3dE=', NULL, 0, '', '', 0, '2024-04-05 06:42:01.606029', NULL, 'user4@exam.com', '김아현', 'admin', 1, 1),
	(5, 'pbkdf2_sha256$600000$PbAcyQ6ppmUcdyH3zO2cEg$quvrLfOFMxCayVWoRkzvvQnIwtX4DgYcWtYWFf6dMuk=', NULL, 0, '', '', 0, '2024-04-05 06:42:01.872257', NULL, 'user5@exam.com', '문성호', 'admin', 1, 1),
	(6, 'pbkdf2_sha256$600000$VEgRGZ2gauqn5zMSxjq7MB$UqO0SxYb0Oy0AN+Apyoo9IkH/G+rgB3ZH/bOokMLIiE=', NULL, 0, '', '', 0, '2024-04-05 06:42:02.136374', NULL, 'user6@exam.com', '정현재', 'user', 1, 0),
	(7, 'pbkdf2_sha256$600000$j2Whl9MvkHhSD3voEXL6Bk$s16craSfdCoALg6ryO7HeEpxmROlmn2NCVqi89ZYO+g=', NULL, 0, '', '', 0, '2024-04-05 06:42:02.400834', NULL, 'user7@exam.com', '오범석', 'user', 1, 0),
	(8, 'pbkdf2_sha256$600000$u0OxDluAT8iIlgKrbFbRSy$4mdzaOGDvfUPCtz2jDXvyKEmqJvJkrDd7+Nwo9OR7Bg=', NULL, 0, '', '', 0, '2024-04-05 06:42:02.665277', NULL, 'user8@exam.com', '정석진', 'user', 1, 0),
	(9, 'pbkdf2_sha256$600000$BmKuiFN2ekKIJx7HCtGxUW$xQPexyHzwOBLShvn8bHOU1tL4lLahG6WXU4QUyc2EIk=', NULL, 0, '', '', 0, '2024-04-05 06:42:02.929304', NULL, 'user9@exam.com', '조윤민', 'user', 1, 0),
	(10, 'pbkdf2_sha256$600000$OqkfeUuICUowbS8UG3zAPs$GE0WoGINOq04LQ2P66mZxAfhhOYENglc1qARspdHl+Y=', NULL, 0, '', '', 0, '2024-04-05 06:42:03.174825', NULL, 'user10@exam.com', '조아라', 'user', 1, 0),
	(11, 'pbkdf2_sha256$600000$E0dtSyi8vn6l4d9si2nAKl$esfUk+aeyK8bc4+VvhqSQhEAkMgYrsfB8h2h2aiCNLU=', NULL, 0, '', '', 0, '2024-04-05 06:42:03.451487', NULL, 'user11@exam.com', '정승민', 'user', 1, 0),
	(12, 'pbkdf2_sha256$600000$J2zi3HepxWj2V6yCbsdQOn$ecxnKqcUwIeQDG3RJZpWOE/8mTW4vpu7AcrXihYKy2A=', NULL, 0, '', '', 0, '2024-04-05 06:42:03.715575', NULL, 'user12@exam.com', '최준형', 'user', 1, 0),
	(13, 'pbkdf2_sha256$600000$HxNdGj7hJQ7yuct0Gl54bG$DaVni/A5SrI1mHhlbMnyhsh1G5RLCg3+cWUeAfSvbBc=', NULL, 0, '', '', 0, '2024-04-05 06:42:03.979648', NULL, 'user13@exam.com', '문민혁', 'user', 1, 0),
	(14, 'pbkdf2_sha256$600000$AffL4tFz6tlykURBRBFvuP$lrKRjjiEcakZ3lRyQ65EGcy0n1GbzohK22Hml4R9UC8=', NULL, 0, '', '', 0, '2024-04-05 06:42:04.244201', NULL, 'user14@exam.com', '김민설', 'user', 1, 0),
	(15, 'pbkdf2_sha256$600000$96c3ySLHZSJ6HmbbUtJJOE$z0rxo5AmdyQLL3eJJfshXguMO0WbtVnSzg5XgwykkPQ=', NULL, 0, '', '', 0, '2024-04-05 06:42:04.507990', NULL, 'user15@exam.com', '김하연', 'user', 1, 0),
	(16, 'pbkdf2_sha256$600000$a5Zog6umE0QmHK9gs28Vnk$MOxp0igLrZsA7kKYm1Zhbm1eiIosZ4s8E27mMHuPZ6Y=', NULL, 0, '', '', 0, '2024-04-05 06:42:04.771581', NULL, 'user16@exam.com', '정세현', 'user', 1, 0),
	(17, 'pbkdf2_sha256$600000$YMP2eSJf7jrsrXgFyd33oe$gpXeAUH578HV7oOFyHkZMFIlrf+vDe1xanjLJwbo3f4=', NULL, 0, '', '', 0, '2024-04-05 06:42:05.035260', NULL, 'user17@exam.com', '황준우', 'user', 1, 0),
	(18, 'pbkdf2_sha256$600000$amfbEM4TXd4OUUdRUUAgi9$skgzzgEkumZ/x5LD7zRtOUOALzXCJa7ibI3GIGCn+Yw=', NULL, 0, '', '', 0, '2024-04-05 06:42:05.299322', NULL, 'user18@exam.com', '신진섭', 'user', 1, 0);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
