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
	(20, '게시글 제목 20', '게시글 내용 20', '2024-04-07 11:06:52.374205', 2)

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
