-- User 테이블
-- 
-- 사용 가능 !!!

from myapp.models import User

# 사용자 정보 리스트 생성
user_info_list = [
    {'username': 'user1@exam.com','email': 'user1@exam.com', 'first_name': '김','last_name': '민재', 'is_superuser': 1, 'is_staff': 1},
    {'username': 'user2@exam.com','email': 'user2@exam.com', 'first_name': '임','last_name': '수민', 'is_superuser': 0, 'is_staff': 1},
    {'username': 'user3@exam.com','email': 'user3@exam.com', 'first_name': '조','last_name': '정민', 'is_superuser': 0, 'is_staff': 1},
    {'username': 'user4@exam.com','email': 'user4@exam.com', 'first_name': '김','last_name': '아현', 'is_superuser': 0, 'is_staff': 1},
    {'username': 'user5@exam.com','email': 'user5@exam.com', 'first_name': '문','last_name': '성호', 'is_superuser': 0, 'is_staff': 1},
    {'username': 'user6@exam.com','email': 'user6@exam.com', 'first_name': '정','last_name': '석진', 'is_superuser': 0, 'is_staff': 0},
    {'username': 'user7@exam.com','email': 'user7@exam.com', 'first_name': '오','last_name': '범석', 'is_superuser': 0, 'is_staff': 0},
    {'username': 'user8@exam.com','email': 'user8@exam.com', 'first_name': '정','last_name': '승민', 'is_superuser': 0, 'is_staff': 0},
    {'username': 'user9@exam.com','email': 'user9@exam.com', 'first_name': '조','last_name': '아라', 'is_superuser': 0, 'is_staff': 0},
    {'username': 'user10@exam.com','email': 'user10@exam.com', 'first_name': '조','last_name': '윤민', 'is_superuser': 0, 'is_staff': 0},
    {'username': 'user11@exam.com','email': 'user11@exam.com', 'first_name': '정','last_name': '세현', 'is_superuser': 0, 'is_staff': 0},
    {'username': 'user12@exam.com','email': 'user12@exam.com', 'first_name': '최','last_name': '준형', 'is_superuser': 0, 'is_staff': 0},
    {'username': 'user13@exam.com','email': 'user13@exam.com', 'first_name': '문','last_name': '민혁', 'is_superuser': 0, 'is_staff': 0},
    {'username': 'user14@exam.com','email': 'user14@exam.com', 'first_name': '김','last_name': '민설', 'is_superuser': 0, 'is_staff': 0},
    {'username': 'user15@exam.com','email': 'user15@exam.com', 'first_name': '김','last_name': '하연', 'is_superuser': 0, 'is_staff': 0},
    {'username': 'user16@exam.com','email': 'user16@exam.com', 'first_name': '정','last_name': '현재', 'is_superuser': 0, 'is_staff': 0},
    {'username': 'user17@exam.com','email': 'user17@exam.com', 'first_name': '황','last_name': '준우', 'is_superuser': 0, 'is_staff': 0},
    {'username': 'user18@exam.com','email': 'user18@exam.com', 'first_name': '신','last_name': '진섭', 'is_superuser': 0, 'is_staff': 0},
]

# 반복문을 사용하여 사용자 생성
for idx, user_info in enumerate(user_info_list, start=1):
    # 사용자 생성
    u = User(username=user_info['username'], email=user_info['email'], first_name=user_info['first_name'], last_name=user_info['last_name'], is_superuser=user_info['is_superuser'], is_active=1, is_staff=user_info['is_staff'])
    # 비밀번호 설정
    u.set_password('qwer1234')
    # 데이터베이스에 저장
    u.save()
    # 생성된 사용자의 ID 출력
    print(f"User {idx}의 ID: {u.id}")




-- Board 테이블
--  
-- 사용 가능 !!!

from myapp.models import Board, User
from django.utils import timezone

# 게시글 정보 리스트 생성
board_info_list = [
    {'title': '오늘 아침식단은 뭔가요', 'content': '아침 먹지말고 그냥 자고 싶은데', 'author_email': 'user1@exam.com'},
    {'title': '오늘의 일정은 어떻게 되나요?', 'content': '오늘은 무엇을 해야할까요?', 'author_email': 'user2@exam.com'},
    {'title': '오늘의 날씨는 어떻게 되나요?', 'content': '오늘은 맑은가요 흐린가요?', 'author_email': 'user3@exam.com'},
    {'title': '게시글 제목 4', 'content': '게시글 내용 4', 'author_email': 'user4@exam.com'},
    {'title': '게시글 제목 5', 'content': '게시글 내용 5', 'author_email': 'user5@exam.com'},
    {'title': '게시글 제목 6', 'content': '게시글 내용 6', 'author_email': 'user6@exam.com'},
    {'title': '게시글 제목 7', 'content': '게시글 내용 7', 'author_email': 'user7@exam.com'},
    {'title': '게시글 제목 8', 'content': '게시글 내용 8', 'author_email': 'user8@exam.com'},
    {'title': '게시글 제목 9', 'content': '게시글 내용 9', 'author_email': 'user9@exam.com'},
    {'title': '게시글 제목 10', 'content': '게시글 내용 10', 'author_email': 'user10@exam.com'},
    {'title': '게시글 제목 11', 'content': '게시글 내용 11', 'author_email': 'user11@exam.com'},
    {'title': '게시글 제목 12', 'content': '게시글 내용 12', 'author_email': 'user12@exam.com'},
    {'title': '게시글 제목 13', 'content': '게시글 내용 13', 'author_email': 'user13@exam.com'},
    {'title': '게시글 제목 14', 'content': '게시글 내용 14', 'author_email': 'user14@exam.com'},
    {'title': '게시글 제목 15', 'content': '게시글 내용 15', 'author_email': 'user15@exam.com'},
    {'title': '게시글 제목 16', 'content': '게시글 내용 16', 'author_email': 'user16@exam.com'},
    {'title': '게시글 제목 17', 'content': '게시글 내용 17', 'author_email': 'user17@exam.com'},
    {'title': '게시글 제목 18', 'content': '게시글 내용 18', 'author_email': 'user18@exam.com'},
    {'title': '게시글 제목 19', 'content': '게시글 내용 19', 'author_email': 'user1@exam.com'},
    {'title': '게시글 제목 20', 'content': '게시글 내용 20', 'author_email': 'user2@exam.com'},
]

# 반복문을 사용하여 게시글 생성
for idx, board_info in enumerate(board_info_list, start=1):
    # 해당 이메일에 해당하는 사용자 정보 가져오기
    user = User.objects.get(email=board_info['author_email'])
    # 게시글 생성
    board = Board.objects.create(
        title=board_info['title'],
        content=board_info['content'],
        author=user,
        created_at=timezone.now()
    )
    # 생성된 게시글의 ID 출력
    print(f"Board {idx}의 ID: {board.id}")

-- Comment 테이블
-- 
-- 사용 가능 !!!

import random
from myapp.models import Comment, User, Board

# 게시글 번호 범위
board_ids = list(range(1, 20))

# 댓글 생성
for idx in range(1, 41):
    # 임의의 게시글 선택
    board_id = random.choice(board_ids)
    # 해당 게시글에 대한 사용자 정보 가져오기
    user_email = f'user{random.randint(1, 18)}@exam.com'
    user = User.objects.get(email=user_email)
    # 임의의 댓글 내용 생성
    comment_text = f'이 댓글은 더미 데이터입니다. {idx}'
    # 댓글 생성
    comment = Comment.objects.create(
        board_id=board_id,
        user=user,
        text=comment_text
    )
    # 생성된 댓글의 ID 출력
    print(f"Comment {idx}의 ID: {comment.comment_num}")