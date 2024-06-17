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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 myapp.auth_permission:~44 rows (대략적) 내보내기
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
	(25, 'Can add board', 7, 'add_board'),
	(26, 'Can change board', 7, 'change_board'),
	(27, 'Can delete board', 7, 'delete_board'),
	(28, 'Can view board', 7, 'view_board'),
	(29, 'Can add comment', 8, 'add_comment'),
	(30, 'Can change comment', 8, 'change_comment'),
	(31, 'Can delete comment', 8, 'delete_comment'),
	(32, 'Can view comment', 8, 'view_comment'),
	(33, 'Can add distribution', 9, 'add_distribution'),
	(34, 'Can change distribution', 9, 'change_distribution'),
	(35, 'Can delete distribution', 9, 'delete_distribution'),
	(36, 'Can view distribution', 9, 'view_distribution'),
	(37, 'Can add volunteer recruitment', 10, 'add_volunteerrecruitment'),
	(38, 'Can change volunteer recruitment', 10, 'change_volunteerrecruitment'),
	(39, 'Can delete volunteer recruitment', 10, 'delete_volunteerrecruitment'),
	(40, 'Can view volunteer recruitment', 10, 'view_volunteerrecruitment'),
	(41, 'Can add volunteer list', 11, 'add_volunteerlist'),
	(42, 'Can change volunteer list', 11, 'change_volunteerlist'),
	(43, 'Can delete volunteer list', 11, 'delete_volunteerlist'),
	(44, 'Can view volunteer list', 11, 'view_volunteerlist');

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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 myapp.auth_user:~63 rows (대략적) 내보내기
INSERT IGNORE INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$600000$IqLxlQ1MeS6Ulyy5bA4Qd5$oYfrq8Yum/nBMeDMIvUq/5LxIGCrk0ZsJ9wG7Dr5s1w=', NULL, 1, 'user1@exam.com', '김', '민재', 'user1@exam.com', 1, 1, '2024-04-24 07:12:57.490411'),
	(2, 'pbkdf2_sha256$600000$qBzj6PrvsiY5Q6VbCJt5B4$wLmUzTGL/MeEZ+0oSXI786Oxmewh7PSkoGcG5CJJ6fA=', NULL, 0, 'user2@exam.com', '임', '수민', 'user2@exam.com', 1, 1, '2024-04-24 07:12:57.765189'),
	(3, 'pbkdf2_sha256$600000$sPUSJUV2n6mDbsQLV8BzcO$LIe+jKsQvBVRh+QaVjuJ6t7XOEhxqRKzB7rNVzFlBPU=', NULL, 0, 'user3@exam.com', '조', '정민', 'user3@exam.com', 1, 1, '2024-04-24 07:12:58.035496'),
	(4, 'pbkdf2_sha256$600000$9I0Mxwk4jLCpsiNr7j3Zr1$JMyU3O5UItJ8G2HzbyGsZYZkbm0LCxKNFXls0VOqUME=', '2024-04-24 08:16:44.074908', 0, 'user4@exam.com', '김', '아현', 'user4@exam.com', 1, 1, '2024-04-24 07:12:58.299946'),
	(5, 'pbkdf2_sha256$600000$bSDSgGev1N8kZ9HU1YIcAR$1HgqvWWeE1MMM4lSRneKkWnLPj8fnN5x5ESqcryiABU=', NULL, 0, 'user5@exam.com', '문', '성호', 'user5@exam.com', 1, 1, '2024-04-24 07:12:58.564274'),
	(6, 'pbkdf2_sha256$600000$7w9hmjh1Vyy3739vzSOMur$aOXvY9m/m3Ke3papREz8At5IWfWMxJJJa9GxeVsJThc=', NULL, 0, 'user6@exam.com', '정', '석진', 'user6@exam.com', 0, 1, '2024-04-24 07:12:58.829567'),
	(7, 'pbkdf2_sha256$600000$Vc01OZccJBx2oX0Pxcctzd$C6g/JiRVoy08NKGW0u1OL4JNqE/SmFCnm1yX2e0Zuvg=', NULL, 0, 'user7@exam.com', '오', '범석', 'user7@exam.com', 0, 1, '2024-04-24 07:12:59.094437'),
	(8, 'pbkdf2_sha256$600000$nQMPlHTfTQFm5D3wnEoqxI$yU6mrMwzri/62i6bMoZI9hX8DHApQwqdOe72+Cp+2m4=', NULL, 0, 'user8@exam.com', '정', '승민', 'user8@exam.com', 0, 1, '2024-04-24 07:12:59.358807'),
	(9, 'pbkdf2_sha256$600000$nEes2vZoWrzby10H1x76ja$1Ggh3pVyPf2QXnY8MTOPdhCfQjUaDsrTsII/KqxLRK0=', NULL, 0, 'user9@exam.com', '조', '아라', 'user9@exam.com', 0, 1, '2024-04-24 07:12:59.606973'),
	(10, 'pbkdf2_sha256$600000$vtIuSheoLDQJ9vmaOO3ADs$apiet7lC4knFSznf8YAMS9hCiJjddn1W0WkylxaCXSo=', NULL, 0, 'user10@exam.com', '조', '윤민', 'user10@exam.com', 0, 1, '2024-04-24 07:12:59.891013'),
	(11, 'pbkdf2_sha256$600000$f7T5ymGdPlRYc8uRIdmo4z$O+J2zehAomuK5RhetfEE8IuiN8kudruE1PPTNOUD0tc=', NULL, 0, 'user11@exam.com', '정', '세현', 'user11@exam.com', 0, 1, '2024-04-24 07:13:00.167461'),
	(12, 'pbkdf2_sha256$600000$OT36lvCNYROBNc6SgxchHB$MWD3zlZnbhGA1rFsSErLAdWk405ERpnywopApkl2s9A=', NULL, 0, 'user12@exam.com', '최', '준형', 'user12@exam.com', 0, 1, '2024-04-24 07:13:00.440274'),
	(13, 'pbkdf2_sha256$600000$axdgjJa0sYSNXrfnhD1ce6$qM4hZOxoFuDzV+QUJWWpxXY7r9Vr/0XbPGDrxhhgTFw=', NULL, 0, 'user13@exam.com', '문', '민혁', 'user13@exam.com', 0, 1, '2024-04-24 07:13:00.709683'),
	(14, 'pbkdf2_sha256$600000$ACJaC1UJtQ8dR7HkYhwFoN$NKYwKUUY5/hz1fetmUPOT0gNxw1hS5o14+/b4PqRYsc=', NULL, 0, 'user14@exam.com', '김', '민설', 'user14@exam.com', 0, 1, '2024-04-24 07:13:00.980713'),
	(15, 'pbkdf2_sha256$600000$ogVuqEEm4T5EyvMVSLRb5G$wTq4spLK6jg+r7JnTLPkdYED12jr3MYU2LioeqJ9Duc=', NULL, 0, 'user15@exam.com', '김', '하연', 'user15@exam.com', 0, 1, '2024-04-24 07:13:01.246719'),
	(16, 'pbkdf2_sha256$600000$qxNWAHWDU4chkxcSzfh4io$JC4Kb6iJ9jONPM/LOzsya+K9dAbLQsyipgWL/Af1L3E=', NULL, 0, 'user16@exam.com', '정', '현재', 'user16@exam.com', 0, 1, '2024-04-24 07:13:01.512728'),
	(17, 'pbkdf2_sha256$600000$VeuOVfZ5LX6b0G7qRAkGwJ$bj/hXz8dqZsh80ALQVDobeOyrCOHEOHH5HvCy+ecvAs=', NULL, 0, 'user17@exam.com', '황', '준우', 'user17@exam.com', 0, 1, '2024-04-24 07:13:01.780953'),
	(18, 'pbkdf2_sha256$600000$JJUSbeOybUXewvAZGLIIGa$t4XsX8ac6+a14yk0O7PNJRj8E3dQ2XqGqzxbRS50ltw=', NULL, 0, 'user18@exam.com', '신', '진섭', 'user18@exam.com', 0, 1, '2024-04-24 07:13:02.058784'),
	(19, 'pbkdf2_sha256$600000$2eJzgIFesfzAwKgI8L0iqz$whiKPR+ORYhwjVdfqfnj869fm7nYHNoIhA+F42nvCU4=', NULL, 0, 'user19@exam.com', '김', '효선', 'user19@exam.com', 0, 1, '2024-04-24 07:13:02.326232'),
	(20, 'pbkdf2_sha256$600000$R5RlK1Au29GqoyirB0NZmZ$AyvN3ky+qUojB/fVHfRZOH6nQV6teXkWZtsdTVIeJMU=', NULL, 0, 'user20@exam.com', '박', '건우', 'user20@exam.com', 0, 1, '2024-04-24 07:13:02.571201'),
	(21, 'pbkdf2_sha256$600000$HHPBNKW2vts5iviKksBP5K$c7hQuOiKJb3vlRzSQ43fJBJZEsW32mwWMCIn7tMB7XE=', NULL, 0, 'user21@exam.com', '강', '유라', 'user21@exam.com', 0, 1, '2024-04-24 07:13:02.852956'),
	(22, 'pbkdf2_sha256$600000$kqXwifATvyePcPQ9htoZyx$MlXKE/22243SJg45vRuZ/IsTulfBgpkmy8iaCQk1muY=', NULL, 0, 'user22@exam.com', '최', '현호', 'user22@exam.com', 0, 1, '2024-04-24 07:13:03.128746'),
	(23, 'pbkdf2_sha256$600000$EP6VnaTwZIsrAa9hplpjyd$BT6A0AZDcxTGpvn8fHf6FY9NxuyWuJ1E536tkn7TdXY=', NULL, 0, 'user23@exam.com', '최', '수빈', 'user23@exam.com', 0, 1, '2024-04-24 07:13:03.398055'),
	(24, 'pbkdf2_sha256$600000$8wYerFLzA5v8tI1QgXDPBC$OzS9QfWlT+/fbSDdvkhnEE/N6DMscBTdCkwVsvJ24V0=', NULL, 0, 'user24@exam.com', '정', '경록', 'user24@exam.com', 0, 1, '2024-04-24 07:13:03.667827'),
	(25, 'pbkdf2_sha256$600000$hiY5m2lpTttbuUI4rd6u6X$SGhXOPYAWsfI0+nOjvdud1JU9YK5zpfBeov62B1rr7M=', NULL, 0, 'user25@exam.com', '배', '규진', 'user25@exam.com', 0, 1, '2024-04-24 07:13:03.921995'),
	(26, 'pbkdf2_sha256$600000$8at41mONBK0ERhh1JHIUpJ$VPoG47i692MXmf1Z5D6mqpV2MzmlM0rgQhPVP9V7IZY=', NULL, 0, 'user26@exam.com', '김', '성훈', 'user26@exam.com', 0, 1, '2024-04-24 07:13:04.206785'),
	(27, 'pbkdf2_sha256$600000$ExBcBvY2Nqn6SnPIHiUaCs$Ma0Oq83XR8JPfoH4xdCJpW7z0tCJ2L8A+sUlkN/212k=', NULL, 0, 'user27@exam.com', '한', '가희', 'user27@exam.com', 0, 1, '2024-04-24 07:13:04.482432'),
	(28, 'pbkdf2_sha256$600000$FP7gycE8TNstcrYihlOkqC$UFN7IMawb2WQ0k5hsyHZGQUGU+XrXRTRLbOFZK7fFzA=', NULL, 0, 'user28@exam.com', '장', '혁진', 'user28@exam.com', 0, 1, '2024-04-24 07:13:04.736720'),
	(29, 'pbkdf2_sha256$600000$ALRQxDR1XQcUiqzQCGaR44$FLmqpo0OZChNnMD/5wd+Areu3PQWMMPWLsJZ7+YqoYQ=', NULL, 0, 'user29@exam.com', '박', '예진', 'user29@exam.com', 0, 1, '2024-04-24 07:13:05.018433'),
	(30, 'pbkdf2_sha256$600000$PvqBCeTwzn2gmZiWVMO5v4$uUZtaXjUHoDevZUrwkswNNV9w/pTPzvImKhgMDz0mpM=', NULL, 0, 'user30@exam.com', '정', '병운', 'user30@exam.com', 0, 1, '2024-04-24 07:13:05.287530'),
	(31, 'pbkdf2_sha256$600000$VhpUdjlgkvN8u2Bk1lXKu9$GmNnVTMrZiBp6PFWcgUu4b83WIhMx/1iafPLSizF5aI=', NULL, 0, 'user31@exam.com', '김', '나연', 'user31@exam.com', 0, 1, '2024-04-24 07:13:05.554002'),
	(32, 'pbkdf2_sha256$600000$xmIa1PyQDk7LXETuSAF7yh$RU3BJCDti357G1rkfg3mAi+ET8UnZSpvVI+FlkTLaEQ=', NULL, 0, 'user32@exam.com', '안', '정호', 'user32@exam.com', 0, 1, '2024-04-24 07:13:05.801986'),
	(33, 'pbkdf2_sha256$600000$2fyImOwU7vaPSVYeiiAWVZ$6dVIe+5rQlEc7wd2tBUHAfia6qkS1s21N6owWIJ2nxk=', NULL, 0, 'user33@exam.com', '이', '다은', 'user33@exam.com', 0, 1, '2024-04-24 07:13:06.078048'),
	(34, 'pbkdf2_sha256$600000$tCnBhmpPYT9DPl3cNlE3as$Ug0k8L2e5YHC1BrZqFp1hc6a0CmcI6upFoFI3CCFUTs=', NULL, 0, 'user34@exam.com', '민', '경빈', 'user34@exam.com', 0, 1, '2024-04-24 07:13:06.346579'),
	(35, 'pbkdf2_sha256$600000$RPJKndy4svxKKtE3ivp4sn$e6L0/By7cEILuKkQ9fF6yFWcNC8vcXV4oGZ9s7UN+4I=', NULL, 0, 'user35@exam.com', '최', '은지', 'user35@exam.com', 0, 1, '2024-04-24 07:13:06.619606'),
	(36, 'pbkdf2_sha256$600000$BLoOEMxhTQvhg6sYn511BW$gJoEskeORugF0Clzwe3+EYuSWftCfI5pPOEqYcoHdBA=', NULL, 0, 'user36@exam.com', '전', '지호', 'user36@exam.com', 0, 1, '2024-04-24 07:13:06.887415'),
	(37, 'pbkdf2_sha256$600000$7GjjELdDnwqYp0JazcqiCc$5dScjaUvT39sVmbokj9/8cMnZ04iHb/wS5VzXK4QBQA=', NULL, 0, 'user37@exam.com', '정', '은혜', 'user37@exam.com', 0, 1, '2024-04-24 07:13:07.160158'),
	(38, 'pbkdf2_sha256$600000$UfTvXmRF3Njvlye91PJGnH$RPQcp5LEEvY0xm25OCtIlnExHa87B3713nNCYGgSris=', NULL, 0, 'user38@exam.com', '김', '수현', 'user38@exam.com', 0, 1, '2024-04-24 07:13:07.427741'),
	(39, 'pbkdf2_sha256$600000$WlPuqEUiOBUa6eKegdv7n4$1aGatpBcglmaZivGCMC+vp8+zoo2g2TstUVccp+P7O0=', NULL, 0, 'user39@exam.com', '김', '지원', 'user39@exam.com', 0, 1, '2024-04-24 07:13:07.705000'),
	(40, 'pbkdf2_sha256$600000$wOLx1pYuQJLBjTbxmwXSJD$bH+V1pWw0vYd5/M98fcHNG/5BhkH4HYsF8ewPNsbcgk=', NULL, 0, 'user40@exam.com', '정', '영철', 'user40@exam.com', 0, 1, '2024-04-24 07:13:07.975614'),
	(41, 'pbkdf2_sha256$600000$nxZib2cyDOMBkGaOAHdlns$JFrGGOU9SCExyUt+YmBhzo0BaziM4f3OVl50jN5Ia5A=', NULL, 0, 'user41@exam.com', '김', '용현', 'user41@exam.com', 0, 1, '2024-04-24 07:13:08.245871'),
	(42, 'pbkdf2_sha256$600000$hiRipVvkDdH58SjIYeRR5X$gGhtpvntCzIX5wz2o2b2uJk9ucG2CmktljR5/PJa34Q=', NULL, 0, 'user42@exam.com', '이', '재일', 'user42@exam.com', 0, 1, '2024-04-24 07:13:08.511446'),
	(43, 'pbkdf2_sha256$600000$AJmEPQY6LGTE0R7SJXVQWQ$wKKWaZtSqIVp5nkLjnxMIhhWlOBcODN+pnfboT3FHg0=', NULL, 0, 'user43@exam.com', '이', '효빈', 'user43@exam.com', 0, 1, '2024-04-24 07:13:08.765597'),
	(44, 'pbkdf2_sha256$600000$igSjnHUfBtUMupEH9jvg4K$RF+tSq2PiL0rGMnzd3V9nDl//QNxEU1qpsorkJCDDd8=', NULL, 0, 'user44@exam.com', '하', '현진', 'user44@exam.com', 0, 1, '2024-04-24 07:13:09.036009'),
	(45, 'pbkdf2_sha256$600000$skRo7Nuv6FAEr4HdCuqcX5$qD2BUt5zDEbUm8IjVL4E1WQg64DH/7gY/xHwcUBg5ow=', NULL, 0, 'user45@exam.com', '안', '영진', 'user45@exam.com', 0, 1, '2024-04-24 07:13:09.301225'),
	(46, 'pbkdf2_sha256$600000$laiYBzHy6oA5iMHbc9jbdc$72crJlogOUrth8Zm9MYnnhj4gMRQXahoUa/zseFr8us=', NULL, 0, 'user46@exam.com', '이', '주현', 'user46@exam.com', 0, 1, '2024-04-24 07:13:09.560693'),
	(47, 'pbkdf2_sha256$600000$9YNP6zERKjT5eo8VhHt8r0$sZy5klG3ewJtMHpYOZhA0bocR1KXM2p7YrdI0NxUscU=', NULL, 0, 'user47@exam.com', '김', '유민', 'user47@exam.com', 0, 1, '2024-04-24 07:13:09.825086'),
	(48, 'pbkdf2_sha256$600000$araCYd4ZjUReyN5eCsEnBs$pNbJe3DVKdntu3dmuA8Jrf38BCLPJfgt05IGuopw/rY=', NULL, 0, 'user48@exam.com', '박', '정민', 'user48@exam.com', 0, 1, '2024-04-24 07:13:10.076613'),
	(49, 'pbkdf2_sha256$600000$mASvLgacUsVYbUEKrbooGv$kafNvO+hxE9NKfMZ1AlGnTNid+iVW7B1cpGj/CrkgVU=', NULL, 0, 'user49@exam.com', '권', '지훈', 'user49@exam.com', 0, 1, '2024-04-24 07:13:10.360032'),
	(50, 'pbkdf2_sha256$600000$xVtvt6S79TloWXK73Sop1Z$0Jnzibhjoime19mII5105DhkObDahhEAPtDVCacIv8Q=', NULL, 0, 'user50@exam.com', '유', '대한', 'user50@exam.com', 0, 1, '2024-04-24 07:13:10.642306'),
	(51, 'pbkdf2_sha256$600000$NUDLj8tbEvQV2N0wwXGFAZ$hUIm6NaeteILQyJJL1iYr79NqujCWk5/QcLzJUBWzIw=', NULL, 0, 'user51@exam.com', '심', '성환', 'user51@exam.com', 0, 1, '2024-04-24 07:13:10.904627'),
	(52, 'pbkdf2_sha256$600000$Tka5EMUL9c1k8ZmjostcWC$LmDvVohS8F5fAWXs9BJtMfi8/l91JWqxmUVi20Loiew=', NULL, 0, 'user52@exam.com', '김', '건우', 'user52@exam.com', 0, 1, '2024-04-24 07:13:11.187930'),
	(53, 'pbkdf2_sha256$600000$7gaAbsAIvPVda4xC1R65k5$ISkQ5EuwUuxiONtstE4WgtTWOXybjZdpC6ra5GsLAlw=', NULL, 0, 'user53@exam.com', '이', '민혁', 'user53@exam.com', 0, 1, '2024-04-24 07:13:11.454717'),
	(54, 'pbkdf2_sha256$600000$9vx3ZubKSnkx7JhPNjJzLS$XZNcgUT1FpE6nxwDFfcyoUQNfoNpKWNTSnE80zOo2SQ=', NULL, 0, 'user54@exam.com', '김', '현', 'user54@exam.com', 0, 1, '2024-04-24 07:13:11.709557'),
	(55, 'pbkdf2_sha256$600000$LrJxnepUtJh2pck1GT8m5x$YGO9yjyurpOGF6RgGWLC4iWOZ/lNs5bZHiptiiFAr5E=', NULL, 0, 'user55@exam.com', '김', '지훈', 'user55@exam.com', 0, 1, '2024-04-24 07:13:11.975151'),
	(56, 'pbkdf2_sha256$600000$mhltIVBg2XICqGBx5EAWKo$t4qcCYBMJTwH0W4WsyCxjP7kr8wJavTIiJQRStnr+7E=', NULL, 0, 'user56@exam.com', '김', '범창', 'user56@exam.com', 0, 1, '2024-04-24 07:13:12.239515'),
	(57, 'pbkdf2_sha256$600000$bxiYlqUpOP0Sj0ZjtyN5Fu$c3s3bG5LTRHJTpK8vhvG8AmCIhefzN8wePol8IKSD1k=', NULL, 0, 'user57@exam.com', '석', '진석', 'user57@exam.com', 0, 1, '2024-04-24 07:13:12.502555'),
	(58, 'pbkdf2_sha256$600000$doHAr4Mz2dldmkCBwkwTmK$Rcqtb1qy1ljvpoLqw8t4fzn4U7dJxGt7huKmQvvmmPQ=', NULL, 0, 'user58@exam.com', '강', '주원', 'user58@exam.com', 0, 1, '2024-04-24 07:13:12.765965'),
	(59, 'pbkdf2_sha256$600000$IZNoE3W3hQpUhQXaVXXfZd$gOJYG7vd6DAG1yqPWGhanUXbQ6MY1ggJ/iknfYBrGQU=', NULL, 0, 'user59@exam.com', '배', '석민', 'user59@exam.com', 0, 1, '2024-04-24 07:13:13.015942'),
	(60, 'pbkdf2_sha256$600000$9JTbHJbLVTobb1bT9gdaMN$e+IT3gt/CyeCfRhVL2sk4la3yRgx0yk4g14WUhhn0Qk=', NULL, 0, 'user60@exam.com', '유', '재경', 'user60@exam.com', 0, 1, '2024-04-24 07:13:13.289455'),
	(61, 'pbkdf2_sha256$600000$cDQaRu9vHKGCknjqW7tn1l$Kg5c/fYPlaj7WjhzpHAEH3ok4u2FRzgtFWFp7FFDK0Q=', NULL, 0, 'user61@exam.com', '조', '현준', 'user61@exam.com', 0, 1, '2024-04-24 07:13:13.552944'),
	(62, 'pbkdf2_sha256$600000$Br8obVhPY36m0LnGE9Jtoi$J3csa87htiS5/j107vS+uTdVIlaXbenOlFyr/pe2VYw=', NULL, 0, 'user62@exam.com', '김', '정원', 'user62@exam.com', 0, 1, '2024-04-24 07:13:13.802916'),
	(63, 'pbkdf2_sha256$600000$Ej6oyG152wpCJQ88vnGXju$Vd7F+r56m6mAPvfz/ZjcmtlN4u3YAwIza19m5BpGrpQ=', NULL, 0, 'user63@exam.com', '권', '민재', 'user63@exam.com', 0, 1, '2024-04-24 07:13:14.072545');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 myapp.django_content_type:~11 rows (대략적) 내보내기
INSERT IGNORE INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(7, 'myapp', 'board'),
	(8, 'myapp', 'comment'),
	(9, 'myapp', 'distribution'),
	(11, 'myapp', 'volunteerlist'),
	(10, 'myapp', 'volunteerrecruitment'),
	(6, 'sessions', 'session');

-- 테이블 myapp.django_migrations 구조 내보내기
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 myapp.django_migrations:~26 rows (대략적) 내보내기
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
	(24, 'myapp', '0006_delete_customuser', '2024-04-08 00:59:39.162040'),
	(25, 'myapp', '0007_volunteerrecruitment_volunteerlist_distribution', '2024-04-22 06:52:46.154503'),
	(26, 'myapp', '0008_volunteerrecruitment_participant_count', '2024-04-23 10:11:14.494171');

-- 테이블 myapp.django_session 구조 내보내기
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 myapp.django_session:~1 rows (대략적) 내보내기
INSERT IGNORE INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('68f0nhzy3w6ds7220etbzcaf8nenn2hq', '.eJxVjEsOwiAUAO_C2hDKo0Bduu8ZyOPzpGogKe3KeHdL0oVuZybzZg73Lbu9pdUtkV2ZYpdf5jE8U-kiPrDcKw-1bOvieU_4aRufa0yv29n-DTK23LdaJwpexkmAAIkwWEuQgoqeVDSjPIJAEpU_0GgNDUCT1pKAyBph2ecL6U035w:1rzXo4:mAx3OUqNxzpCpCV6n6-MDVQrjLr2SxotRLY6k-EJuzk', '2024-05-08 08:16:44.074908');

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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 myapp.myapp_board:~70 rows (대략적) 내보내기
INSERT IGNORE INTO `myapp_board` (`id`, `title`, `content`, `created_at`, `author_id`) VALUES
	(1, '오늘 아침식단은 뭔가요', '아침 먹지말고 그냥 자고 싶은데', '2024-04-24 07:29:44.142393', 1),
	(2, '내일의 계획', '오늘보다 나은 내일을 위해 계획을 세워봅시다.', '2024-04-24 07:29:44.153462', 2),
	(3, '즐거운 주말', '주말은 어떻게 보내실 건가요?', '2024-04-24 07:29:44.166742', 3),
	(4, '오늘의 일기', '오늘은 기분이 좋네요.', '2024-04-24 07:29:44.167852', 4),
	(5, '점심은 뭐 드셨나요?', '점심 메뉴 추천 좀 해주세요.', '2024-04-24 07:29:44.169362', 5),
	(6, '오늘의 책 추천', '오늘 읽은 책을 추천해요.', '2024-04-24 07:29:44.170471', 6),
	(7, '내일의 날씨', '내일은 비가 올 예정입니다.', '2024-04-24 07:29:44.172148', 7),
	(8, '최근 본 영화 후기', '최근에 본 영화에 대한 후기를 남겨주세요.', '2024-04-24 07:29:44.173261', 8),
	(9, '오늘의 운동 계획', '오늘은 어떤 운동을 할까요?', '2024-04-24 07:29:44.174702', 9),
	(10, '오늘의 일정', '오늘은 바쁘게 일정을 소화해야 할 것 같아요.', '2024-04-24 07:29:44.176337', 10),
	(11, '음악 추천', '최근에 들은 좋은 음악이 있나요?', '2024-04-24 07:29:44.177401', 11),
	(12, '오늘의 감정', '오늘은 기분이 안 좋아요.', '2024-04-24 07:29:44.179446', 12),
	(13, '취미 공유', '같은 취미를 가진 사람들과 이야기 나누고 싶어요.', '2024-04-24 07:29:44.180795', 13),
	(14, '요즘 관심사', '최근에 새로운 취미를 발견했어요.', '2024-04-24 07:29:44.182212', 14),
	(15, '공부 팁 공유', '공부하는 데 효과적인 방법이 있을까요?', '2024-04-24 07:29:44.183265', 15),
	(16, '오늘의 일정', '오늘은 무엇을 할까요?', '2024-04-24 07:29:44.185207', 16),
	(17, '좋은 책 추천', '요즘 읽고 있는 책을 소개해요.', '2024-04-24 07:29:44.186230', 17),
	(18, '최근 본 영화 후기', '최근에 본 영화에 대해 이야기 나눠요.', '2024-04-24 07:29:44.187547', 18),
	(19, '요리 레시피 공유', '최근에 만들어 본 요리를 소개해주세요.', '2024-04-24 07:29:44.189301', 19),
	(20, '취미생활', '취미 생활을 통해 스트레스를 풀어요.', '2024-04-24 07:29:44.190566', 20),
	(21, '여행 계획', '다음 여행지를 계획 중입니다.', '2024-04-24 07:29:44.192592', 21),
	(22, '스포츠 이야기', '최근 스포츠 대회에 대해 이야기해요.', '2024-04-24 07:29:44.193942', 22),
	(23, '집 꾸미기 아이디어', '집 꾸미기에 대한 아이디어를 공유해주세요.', '2024-04-24 07:29:44.194836', 23),
	(24, '건강 관리 이야기', '건강 관리에 대해 이야기 나눠요.', '2024-04-24 07:29:44.196853', 24),
	(25, '하루 일과', '하루 일과를 공유해요.', '2024-04-24 07:29:44.197866', 25),
	(26, '취미 생활', '취미 생활을 즐기며 행복해요.', '2024-04-24 07:29:44.199272', 26),
	(27, '문화 이야기', '최근에 본 전시회에 대해 이야기해요.', '2024-04-24 07:29:44.201271', 27),
	(28, '오늘의 기분', '오늘은 기분이 좋아요.', '2024-04-24 07:29:44.202267', 28),
	(29, '요즘 관심사', '요즘 관심 있는 것들이 많아요.', '2024-04-24 07:29:44.204261', 29),
	(30, '좋은 음악 추천', '최근에 들은 좋은 음악을 소개해주세요.', '2024-04-24 07:29:44.205476', 30),
	(31, '휴가 계획', '다음 휴가 계획 중입니다.', '2024-04-24 07:29:44.206557', 31),
	(32, '맛집 탐방', '최근에 가본 맛집에 대해 이야기 나눠요.', '2024-04-24 07:29:44.208267', 32),
	(33, '오늘의 일기', '오늘은 특별한 일이 없었어요.', '2024-04-24 07:29:44.209380', 33),
	(34, '책 읽기 도전', '올해 목표로 책 100권 읽기를 선언합니다!', '2024-04-24 07:29:44.210770', 34),
	(35, '운동 일지', '매일 조깅을 했습니다. 건강한 생활을 위해 노력중입니다.', '2024-04-24 07:29:44.212006', 35),
	(36, '오늘의 뉴스', '오늘의 핫한 뉴스를 소개합니다.', '2024-04-24 07:29:44.213013', 36),
	(37, '요즘 관심사', '요즘 새로운 관심사를 발견했습니다. 함께 이야기 나눠요.', '2024-04-24 07:29:44.214617', 37),
	(38, '휴식의 시간', '하루에 조금씩 휴식하는 시간을 갖고 있습니다.', '2024-04-24 07:29:44.216471', 38),
	(39, '공부 일기', '공부한 내용을 정리하는 공부 일기입니다.', '2024-04-24 07:29:44.217513', 39),
	(40, '요리 도전', '오늘은 새로운 요리를 도전해봤습니다.', '2024-04-24 07:29:44.219364', 40),
	(41, '하루 일과', '하루의 일과를 공유합니다.', '2024-04-24 07:29:44.220673', 41),
	(42, '취미 생활', '취미 생활을 통해 스트레스를 해소합니다.', '2024-04-24 07:29:44.221647', 42),
	(43, '인생 명언 공유', '인생을 생각하게 하는 명언을 소개합니다.', '2024-04-24 07:29:44.222752', 43),
	(44, '새로운 도전', '새로운 도전을 시작했습니다. 응원해주세요!', '2024-04-24 07:29:44.224765', 44),
	(45, '맛집 탐방', '오늘은 맛있는 음식을 먹었습니다.', '2024-04-24 07:29:44.225952', 45),
	(46, '여행 일기', '여행을 다녀와서 느낀 점을 공유합니다.', '2024-04-24 07:29:44.227575', 46),
	(47, '오늘의 일기', '하루 일과를 기록하는 오늘의 일기입니다.', '2024-04-24 07:29:44.228932', 47),
	(48, '운동 일지', '매일 조깅을 했습니다. 건강한 생활을 위해 노력중입니다.', '2024-04-24 07:29:44.230022', 48),
	(49, '취미 생활', '취미 생활을 즐기며 삶의 활력을 얻습니다.', '2024-04-24 07:29:44.231424', 49),
	(50, '오늘의 기분', '오늘은 기분이 좋습니다. 함께 기뻐해요!', '2024-04-24 07:29:44.232651', 50),
	(51, '요가 일지', '매일 요가를 하여 몸과 마음을 편안하게 합니다.', '2024-04-24 07:29:44.234488', 51),
	(52, '감사 일기', '오늘은 감사한 마음으로 일기를 쓰고 있습니다.', '2024-04-24 07:29:44.235595', 52),
	(53, '책 읽기 도전', '오늘은 새로운 책을 읽는 도전을 시작했습니다.', '2024-04-24 07:29:44.236985', 53),
	(54, '코딩 공부 일지', '하루에 조금씩 코딩을 공부하는 일지입니다.', '2024-04-24 07:29:44.238408', 54),
	(55, '영화 감상 후기', '최근 본 영화에 대한 감상 후기를 공유합니다.', '2024-04-24 07:29:44.239519', 55),
	(56, '주식 투자 일지', '주식 투자를 시작한 후기를 기록하는 일지입니다.', '2024-04-24 07:29:44.241070', 56),
	(57, '일상 이야기', '일상에서 생긴 재미있는 이야기를 나눕니다.', '2024-04-24 07:29:44.242337', 57),
	(58, '건강한 식단 공유', '건강한 식단에 대한 정보를 공유합니다.', '2024-04-24 07:29:44.243339', 58),
	(59, '일기 일상', '일상에서 느낀 감정을 솔직하게 털어놓습니다.', '2024-04-24 07:29:44.245291', 59),
	(60, '여행 추억', '여행 다녀온 추억을 회상하는 글입니다.', '2024-04-24 07:29:44.246397', 60),
	(61, '휴가 일정', '다가오는 휴가 일정을 기대하는 마음으로 기록합니다.', '2024-04-24 07:29:44.248381', 61),
	(62, '독서 일기', '최근 읽은 책에 대한 독서 일기를 작성합니다.', '2024-04-24 07:29:44.249502', 62),
	(63, '운동 계획', '오늘의 운동 계획을 세우고 실행해봅니다.', '2024-04-24 07:29:44.251064', 63),
	(64, '음악 감상 일기', '좋아하는 음악을 들으며 느낀 감정을 정리하는 일기입니다.', '2024-04-24 07:29:44.252351', 26),
	(65, '기분 전환', '기분이 우울할 때 기분 전환을 위해 하는 일들을 기록합니다.', '2024-04-24 07:29:44.254352', 45),
	(66, '토론 주제', '다양한 주제에 대해 토론하는 글입니다.', '2024-04-24 07:29:44.255561', 61),
	(67, '친구와의 시간', '친구와 함께 보낸 소중한 시간을 회고하는 글입니다.', '2024-04-24 07:29:44.256637', 37),
	(68, '좋아하는 음식', '좋아하는 음식에 대해 이야기 나누는 글입니다.', '2024-04-24 07:29:44.258628', 28),
	(69, '연애 이야기', '연애를 시작한 후기를 공유하는 글입니다.', '2024-04-24 07:29:44.259707', 19),
	(70, '하루 정리', '하루를 정리하며 느낀 감정을 표현합니다.', '2024-04-24 07:29:44.261038', 20);

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
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 myapp.myapp_comment:~89 rows (대략적) 내보내기
INSERT IGNORE INTO `myapp_comment` (`comment_num`, `text`, `board_id`, `user_id`) VALUES
	(1, '오늘 아침식단은 뭔가요?', 1, 1),
	(2, '나도 궁금해요.', 1, 2),
	(3, '오늘 날씨가 좋네요.', 2, 3),
	(4, '네, 날씨가 좋아요.', 2, 4),
	(5, '점심은 뭘 먹을까요?', 3, 5),
	(6, '나는 떡볶이 먹을래요.', 3, 6),
	(7, '이 책을 추천해요.', 4, 7),
	(8, '정말 좋은 책이에요.', 4, 8),
	(9, '오늘 일정이 너무 바쁘네요.', 5, 9),
	(10, '힘내세요!', 5, 10),
	(11, '저도 궁금합니다.', 1, 11),
	(12, '저도요!', 1, 12),
	(13, '저는 비가 오는 날을 좋아해요.', 2, 13),
	(14, '저도 비가 오는 날을 좋아해요.', 2, 14),
	(15, '떡볶이는 맛있어요.', 3, 15),
	(16, '저도 떡볶이 좋아합니다.', 3, 16),
	(17, '책을 읽는 것은 좋은 습관입니다.', 4, 17),
	(18, '책을 읽는 것은 좋은 습관이에요.', 4, 18),
	(19, '일정이 바쁘면 조금씩 분산시켜서 해보세요.', 5, 19),
	(20, '일정이 바빠도 힘내세요!', 5, 20),
	(21, '오늘도 화이팅!', 6, 21),
	(22, '잘되길 바라요!', 6, 22),
	(23, '저는 김밥을 좋아해요.', 7, 23),
	(24, '김밥은 너무 맛있어요.', 7, 24),
	(25, '산책하는 것이 좋은 습관입니다.', 8, 25),
	(26, '산책은 정말 기분이 좋아져요.', 8, 26),
	(27, '행복한 하루 되세요!', 9, 27),
	(28, '행복한 날이 되길 바라요!', 9, 28),
	(29, '오늘도 열심히 해보아요!', 10, 29),
	(30, '잘해낼 거예요!', 10, 30),
	(31, '이런 정보 감사해요!', 11, 31),
	(32, '정말 유용한 정보예요.', 11, 32),
	(33, '날씨가 추워지고 있어요.', 12, 33),
	(34, '따뜻한 차 한 잔 하면 좋아요.', 12, 34),
	(35, '식사는 건강하게 챙겨주세요.', 13, 35),
	(36, '건강이 최고에요!', 13, 36),
	(37, '운동은 건강에 좋아요.', 14, 37),
	(38, '운동은 습관이 되면 좋아요.', 14, 38),
	(39, '잘 자는 것도 중요해요.', 15, 39),
	(40, '푹 쉬는 것이 좋아요.', 15, 40),
	(41, '휴식도 필요한 시간이에요.', 16, 41),
	(42, '스트레스 푸는 법을 찾아보세요.', 16, 42),
	(43, '맛있는 음식은 행복을 줘요.', 17, 43),
	(44, '음식은 즐거움의 시작이죠.', 17, 44),
	(45, '행복한 일만 가득하길 바라요!', 18, 45),
	(46, '행복한 일이 가득할 거예요.', 18, 46),
	(47, '좋은 하루 되세요!', 19, 47),
	(48, '행복한 날이 되길 바라요!', 19, 48),
	(49, '잘 먹고, 잘 쉬세요!', 20, 49),
	(50, '건강이 최고에요!', 20, 50),
	(51, '추운 날씨에 감기 조심하세요.', 21, 51),
	(52, '감기 조심하세요!', 21, 52),
	(53, '힘든 날이었다면, 오늘은 행복한 일이 있을 거예요.', 22, 53),
	(54, '행복한 일이 생기길 기대해보세요!', 22, 54),
	(55, '가족과 함께하는 시간이 소중해요.', 23, 55),
	(56, '가족과 함께하는 것이 행복해요.', 23, 56),
	(57, '친구와 함께하는 시간도 소중해요.', 24, 57),
	(58, '친구와 함께하는 것이 힘이 돼요.', 24, 58),
	(59, '정말 할게 없네요.', 25, 59),
	(60, '힘내세요!', 26, 60),
	(61, '잘될 거예요!', 26, 61),
	(62, '건강이 최고입니다.', 27, 62),
	(63, '건강이 가장 중요해요.', 27, 3),
	(64, '꿈을 이루세요!', 28, 4),
	(65, '모두 힘을 내요!', 28, 5),
	(66, '오늘도 파이팅!', 29, 6),
	(67, '화이팅입니다!', 29, 7),
	(68, '모두 좋은 하루 보내세요!', 30, 8),
	(69, '오늘도 힘찬 하루 되길 바라요!', 30, 9),
	(70, '건강이 최고에요!', 31, 30),
	(71, '건강이 중요해요!', 31, 31),
	(72, '행복한 시간 보내세요!', 32, 32),
	(73, '행복한 일이 생기길 바라요!', 62, 36),
	(74, '항상 행복하세요!', 66, 34),
	(75, '행복한 일이 가득하길 바라요!', 66, 35),
	(76, '힘내세요!', 64, 36),
	(77, '모두 화이팅입니다!', 64, 33),
	(78, '오늘도 행복한 하루 되세요!', 65, 38),
	(79, '행복한 날이 되길 바라요!', 65, 39),
	(80, '잘 되길 바랄게요!', 66, 30),
	(81, '모두 잘 될 거예요!', 66, 31),
	(82, '건강하세요!', 67, 32),
	(83, '모두 건강하세요!', 67, 33),
	(84, '힘을 내요!', 68, 24),
	(85, '모두 힘내요!', 68, 35),
	(86, '화이팅입니다!', 69, 26),
	(87, '오늘도 화이팅!', 69, 57),
	(88, '오늘도 파이팅하세요!', 70, 38),
	(89, '모두 파이팅입니다!', 70, 49);

-- 테이블 myapp.myapp_distribution 구조 내보내기
CREATE TABLE IF NOT EXISTS `myapp_distribution` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  `content` longtext NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_distribution_user_id_43b6c8ac_fk_auth_user_id` (`user_id`),
  CONSTRAINT `myapp_distribution_user_id_43b6c8ac_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 myapp.myapp_distribution:~20 rows (대략적) 내보내기
INSERT IGNORE INTO `myapp_distribution` (`id`, `title`, `latitude`, `longitude`, `content`, `start_date`, `end_date`, `user_id`) VALUES
	(1, '식량 배급', 35.923604, 128.477679, '오늘 식량을 배급합니다.', '2024-04-24', '2024-04-25', 4),
	(2, '의류 나눔', 37.541000, 126.986000, '불우이웃을 위한 의류 나눔합니다.', '2024-04-24', '2024-04-24', 12),
	(3, '장난감 나눔 행사', 37.567000, 127.027000, '어린이들을 위한 장난감 나눔 행사입니다.', '2024-04-24', '2024-04-25', 28),
	(4, '가구 재사용 배급', 35.155000, 129.056000, '가구를 재사용하는 활동을 진행합니다.', '2024-04-24', '2024-04-24', 8),
	(5, '음식 나눔', 36.332000, 127.389000, '식량을 나누어주는 행사입니다.', '2024-04-24', '2024-04-25', 41),
	(6, '온실가스 배급', 35.689500, 139.691700, '환경보호를 위한 온실가스 배급을 합니다.', '2024-04-24', '2024-04-24', 19),
	(7, '의료 물품 나눔', 40.712800, -74.006000, '의료 물품을 나누어 필요한 사람들에게 제공합니다.', '2024-04-24', '2024-04-24', 33),
	(8, '책 자원봉사', 41.878100, -87.629800, '책을 나누어 도서관에 기증하는 자원봉사활동입니다.', '2024-04-24', '2024-04-25', 52),
	(9, '전자기기 배급', 51.507400, -0.127800, '필요한 사람들에게 전자기기를 배급합니다.', '2024-04-24', '2024-04-24', 22),
	(10, '화장품 나눔', 48.856600, 2.352200, '화장품을 나누어 필요한 사람들에게 제공합니다.', '2024-04-24', '2024-04-25', 16),
	(11, '의료 서비스 배급', 35.689500, 139.691700, '의료 서비스를 무료로 제공합니다.', '2024-04-24', '2024-04-24', 38),
	(12, '음악 CD 나눔', 37.774900, -122.419400, '음악 CD를 나누어 즐길 수 있는 기회를 제공합니다.', '2024-04-24', '2024-04-24', 5),
	(13, '음식 서비스 배급', 51.507400, -0.127800, '음식 서비스를 무료로 제공합니다.', '2024-04-24', '2024-04-25', 47),
	(14, '의류 재활용', 40.712800, -74.006000, '의류를 재활용하여 필요한 사람들에게 제공합니다.', '2024-04-24', '2024-04-24', 26),
	(15, '수도 서비스 나눔', 37.774900, -122.419400, '수도 서비스를 무료로 제공합니다.', '2024-04-24', '2024-04-25', 31),
	(16, '음식 서비스 배급', 36.778300, -119.417900, '음식 서비스를 무료로 제공합니다.', '2024-04-24', '2024-04-24', 7),
	(17, '도서 서비스 나눔', 40.712800, -74.006000, '도서 서비스를 무료로 제공합니다.', '2024-04-24', '2024-04-24', 43),
	(18, '음악 CD 배급', 48.856600, 2.352200, '음악 CD를 무료로 제공합니다.', '2024-04-24', '2024-04-25', 14),
	(19, '의료 서비스 나눔', 37.774900, -122.419400, '의료 서비스를 무료로 제공합니다.', '2024-04-24', '2024-04-24', 24),
	(20, '음식 나눔', 37.566500, 126.978000, '식량을 나누어주는 행사입니다.', '2024-04-24', '2024-04-24', 11);

-- 테이블 myapp.myapp_volunteerlist 구조 내보내기
CREATE TABLE IF NOT EXISTS `myapp_volunteerlist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `recruitment_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_volunteerlist_recruitment_id_19a6d0ed_fk_myapp_vol` (`recruitment_id`),
  KEY `myapp_volunteerlist_user_id_914bf1b4_fk_auth_user_id` (`user_id`),
  CONSTRAINT `myapp_volunteerlist_recruitment_id_19a6d0ed_fk_myapp_vol` FOREIGN KEY (`recruitment_id`) REFERENCES `myapp_volunteerrecruitment` (`id`),
  CONSTRAINT `myapp_volunteerlist_user_id_914bf1b4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 myapp.myapp_volunteerlist:~63 rows (대략적) 내보내기
INSERT IGNORE INTO `myapp_volunteerlist` (`id`, `recruitment_id`, `user_id`) VALUES
	(1, 5, 7),
	(2, 6, 9),
	(3, 6, 10),
	(4, 7, 4),
	(5, 1, 5),
	(6, 2, 6),
	(7, 3, 7),
	(8, 4, 8),
	(9, 5, 9),
	(10, 6, 10),
	(11, 7, 11),
	(12, 8, 12),
	(13, 9, 13),
	(14, 10, 14),
	(15, 11, 15),
	(16, 12, 16),
	(17, 13, 17),
	(18, 14, 18),
	(19, 15, 19),
	(20, 16, 20),
	(21, 17, 21),
	(22, 18, 22),
	(23, 19, 23),
	(24, 20, 24),
	(25, 21, 25),
	(26, 22, 26),
	(27, 23, 27),
	(28, 24, 28),
	(29, 25, 29),
	(30, 26, 30),
	(31, 27, 31),
	(32, 28, 32),
	(33, 29, 33),
	(34, 30, 34),
	(35, 31, 35),
	(36, 32, 36),
	(37, 33, 37),
	(38, 34, 38),
	(39, 35, 39),
	(40, 36, 40),
	(41, 37, 41),
	(42, 38, 42),
	(43, 39, 43),
	(44, 10, 44),
	(45, 11, 45),
	(46, 12, 46),
	(47, 13, 47),
	(48, 14, 48),
	(49, 15, 49),
	(50, 16, 50),
	(51, 17, 51),
	(52, 18, 52),
	(53, 19, 53),
	(54, 20, 54),
	(55, 21, 55),
	(56, 22, 56),
	(57, 23, 57),
	(58, 24, 58),
	(59, 25, 59),
	(60, 26, 60),
	(61, 27, 61),
	(62, 28, 62),
	(63, 29, 63);

-- 테이블 myapp.myapp_volunteerrecruitment 구조 내보내기
CREATE TABLE IF NOT EXISTS `myapp_volunteerrecruitment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  `recruitment_completed` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `participant_count` int(10) unsigned NOT NULL CHECK (`participant_count` >= 0),
  PRIMARY KEY (`id`),
  KEY `myapp_volunteerrecruitment_user_id_542e97d4_fk_auth_user_id` (`user_id`),
  CONSTRAINT `myapp_volunteerrecruitment_user_id_542e97d4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 myapp.myapp_volunteerrecruitment:~39 rows (대략적) 내보내기
INSERT IGNORE INTO `myapp_volunteerrecruitment` (`id`, `title`, `content`, `start_date`, `end_date`, `latitude`, `longitude`, `recruitment_completed`, `user_id`, `participant_count`) VALUES
	(1, '수해 복구 작업', '- 집에 샤워기를 틀어놓고 나갔어요', '2024-04-24', '2024-04-26', 35.901306, 128.545902, 0, 4, 3),
	(2, '동물 보호 활동', '- 야생 동물 구조를 위한 자원봉사 활동입니다.', '2024-04-28', '2024-04-30', 37.532600, 127.024612, 0, 5, 5),
	(3, '환경 정화 캠페인', '- 도시 곳곳에서 환경 정화 활동을 진행합니다.', '2024-05-01', '2024-05-03', 37.566536, 126.977966, 0, 6, 8),
	(4, '노인 복지봉사', '- 노인들을 위한 정기 방문 및 도움을 주는 활동입니다.', '2024-05-05', '2024-05-07', 35.179554, 129.075642, 0, 7, 4),
	(5, 'LGBT 복지봉사', '- LGBT인들을 위한 정기 방문 및 도움을 주는 활동입니다.', '2024-05-05', '2024-05-07', 35.149554, 129.275642, 0, 25, 4),
	(6, '장애인 지원 활동', '- 장애인들을 위한 문화체험 및 도움을 주는 자원봉사입니다.', '2024-05-10', '2024-05-12', 37.566759, 126.978413, 0, 8, 6),
	(7, '교육 지원 봉사', '- 어린이들을 위한 학교 방문 및 학업 지원 활동입니다.', '2024-05-15', '2024-05-17', 35.180681, 129.072905, 0, 9, 7),
	(8, '식품 나눔 봉사', '- 식료품을 필요로 하는 가정에 식품을 나눠주는 활동입니다.', '2024-05-20', '2024-05-22', 37.566619, 126.978417, 0, 10, 5),
	(9, '커뮤니티 정리 활동', '- 지역 커뮤니티를 위한 정리 및 개선 활동을 합니다.', '2024-05-25', '2024-05-27', 35.907757, 127.766922, 0, 11, 9),
	(10, '가난층 지원 봉사', '- 경제적으로 어려운 이웃들을 위한 자원봉사 활동입니다.', '2024-05-30', '2024-06-01', 37.566534, 126.977966, 0, 12, 4),
	(11, '동물 보호 활동', '- 유기동물을 위한 보호소 청소 및 도움을 주는 활동입니다.', '2024-06-05', '2024-06-07', 35.907757, 127.766922, 0, 13, 6),
	(12, '환경 보호 캠페인', '- 환경 보호를 위한 캠페인 활동을 합니다.', '2024-06-10', '2024-06-12', 37.566619, 126.978417, 0, 14, 8),
	(13, '음식물 쓰레기 수거', '- 음식물 쓰레기를 수거하고 재활용하는 활동을 합니다.', '2024-06-15', '2024-06-17', 35.907757, 127.766922, 0, 15, 7),
	(14, '어린이집 방문 봉사', '- 어린이집을 방문하여 어린이들을 위한 활동을 합니다.', '2024-06-20', '2024-06-22', 37.566534, 126.977966, 0, 16, 5),
	(15, '숲길 청소 봉사', '- 도시 근교의 숲길을 청소하는 활동입니다.', '2024-06-25', '2024-06-27', 37.566619, 126.978417, 0, 17, 4),
	(16, '노인 친구 만들기', '- 노인들을 위한 정기적인 방문 및 대화를 나누는 활동입니다.', '2024-06-30', '2024-07-02', 35.907757, 127.766922, 0, 18, 6),
	(17, '보호동물 관리 활동', '- 동물 보호소에서 보호동물들을 관리하고 도와주는 활동입니다.', '2024-07-05', '2024-07-07', 37.566534, 126.977966, 0, 19, 8),
	(18, '배식소 나눔 봉사', '- 배식소에서 음식을 나눠주는 활동입니다.', '2024-07-10', '2024-07-12', 37.566619, 126.978417, 0, 20, 5),
	(19, '환경 보호 캠페인', '- 지역의 환경 보호를 위한 캠페인 활동을 합니다.', '2024-07-15', '2024-07-17', 35.907757, 127.766922, 0, 21, 7),
	(20, '가정 양립 지원', '- 이중소득 가정을 위한 자원봉사 및 가정 양립 지원 활동입니다.', '2024-07-20', '2024-07-22', 37.566534, 126.977966, 0, 22, 6),
	(21, '희망나눔 자원봉사', '- 어려운 이웃들을 위한 희망나눔 자원봉사 활동입니다.', '2024-07-25', '2024-07-27', 37.566619, 126.978417, 0, 23, 4),
	(22, '동물 병원 돕기', '- 동물 병원에서 환자 동물들을 돕는 활동입니다.', '2024-07-30', '2024-08-01', 35.907757, 127.766922, 0, 24, 8),
	(23, '어린이집 활동 지원', '- 어린이집에서 어린이들을 위한 활동을 지원하는 자원봉사입니다.', '2024-08-05', '2024-08-07', 37.566534, 126.977966, 0, 25, 5),
	(24, '무료 급식소 봉사', '- 무료 급식소에서 음식을 나눠주는 자원봉사입니다.', '2024-08-10', '2024-08-12', 37.566619, 126.978417, 0, 26, 7),
	(25, '학교 돕기 봉사', '- 학교에서의 각종 활동을 도와주는 자원봉사입니다.', '2024-08-15', '2024-08-17', 35.907757, 127.766922, 0, 27, 6),
	(26, '환경 보호 캠페인', '- 도시 곳곳에서 환경 보호 활동을 진행합니다.', '2024-08-20', '2024-08-22', 37.566534, 126.977966, 0, 28, 4),
	(27, '장애인 도움 봉사', '- 장애인들을 위한 도움이 필요한 활동을 합니다.', '2024-08-25', '2024-08-27', 37.566619, 126.978417, 0, 29, 6),
	(28, '노인 산책 도우미', '- 노인들과 함께 산책을 나가는 활동을 합니다.', '2024-08-30', '2024-09-01', 35.907757, 127.766922, 0, 30, 5),
	(29, '어린이집 방문 봉사', '- 어린이집에서 어린이들을 돕는 활동을 합니다.', '2024-09-05', '2024-09-07', 37.566534, 126.977966, 0, 31, 7),
	(30, '쓰레기 수거 봉사', '- 도시의 쓰레기를 수거하는 활동을 합니다.', '2024-09-10', '2024-09-12', 37.566619, 126.978417, 0, 32, 8),
	(31, '보호소 도우미', '- 동물 보호소에서 보호 동물들을 돕는 활동입니다.', '2024-09-15', '2024-09-17', 35.907757, 127.766922, 0, 33, 6),
	(32, '길거리 나눔 봉사', '- 길거리에서 홈리스들에게 식사를 나눠주는 활동입니다.', '2024-09-20', '2024-09-22', 37.566534, 126.977966, 0, 34, 7),
	(33, '커뮤니티 정화 캠페인', '- 지역 커뮤니티를 정화하는 활동을 합니다.', '2024-09-25', '2024-09-27', 37.566619, 126.978417, 0, 35, 5),
	(34, '어린이날 축제 봉사', '- 어린이들을 위한 축제에서 활동합니다.', '2024-10-01', '2024-10-03', 35.907757, 127.766922, 0, 36, 8),
	(35, '가난층 돕기', '- 경제적으로 어려운 이웃을 돕는 봉사활동입니다.', '2024-10-05', '2024-10-07', 37.566534, 126.977966, 0, 37, 6);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
