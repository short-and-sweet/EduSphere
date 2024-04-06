-- User 테이블
-- 
-- 사용 가능 !!!

from myapp.models import CustomUser

# 사용자 정보 리스트 생성
user_info_list = [
    {'email': 'user1@exam.com', 'name': '김민재', 'role': 'super_admin', 'is_admin': 1},
    {'email': 'user2@exam.com', 'name': '임수민', 'role': 'admin', 'is_admin': 1},
    {'email': 'user3@exam.com', 'name': '조정민', 'role': 'admin', 'is_admin': 1},
    {'email': 'user4@exam.com', 'name': '김아현', 'role': 'admin', 'is_admin': 1},
    {'email': 'user5@exam.com', 'name': '문성호', 'role': 'admin', 'is_admin': 1},
    {'email': 'user6@exam.com', 'name': '정현재', 'role': 'user', 'is_admin': 0},
    {'email': 'user7@exam.com', 'name': '오범석', 'role': 'user', 'is_admin': 0},
    {'email': 'user8@exam.com', 'name': '정석진', 'role': 'user', 'is_admin': 0},
    {'email': 'user9@exam.com', 'name': '조윤민', 'role': 'user', 'is_admin': 0},
    {'email': 'user10@exam.com', 'name': '조아라', 'role': 'user', 'is_admin': 0},
    {'email': 'user11@exam.com', 'name': '정승민', 'role': 'user', 'is_admin': 0},
    {'email': 'user12@exam.com', 'name': '최준형', 'role': 'user', 'is_admin': 0},
    {'email': 'user13@exam.com', 'name': '문민혁', 'role': 'user', 'is_admin': 0},
    {'email': 'user14@exam.com', 'name': '김민설', 'role': 'user', 'is_admin': 0},
    {'email': 'user15@exam.com', 'name': '김하연', 'role': 'user', 'is_admin': 0},
    {'email': 'user16@exam.com', 'name': '정세현', 'role': 'user', 'is_admin': 0},
    {'email': 'user17@exam.com', 'name': '황준우', 'role': 'user', 'is_admin': 0},
    {'email': 'user18@exam.com', 'name': '신진섭', 'role': 'user', 'is_admin': 0},
]

# 반복문을 사용하여 사용자 생성
for idx, user_info in enumerate(user_info_list, start=1):
    # 사용자 생성
    u = CustomUser(email=user_info['email'], name=user_info['name'], role=user_info['role'], is_active=1, is_admin=user_info['is_admin'])
    # 비밀번호 설정
    u.set_password('qwer1234')
    # 데이터베이스에 저장
    u.save()
    # 생성된 사용자의 ID 출력
    print(f"User {idx}의 ID: {u.id}")


-- Board 테이블
--  
-- 사용 가능 !!!

from myapp.models import Board, CustomUser
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
    user = CustomUser.objects.get(email=board_info['author_email'])
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
from myapp.models import Comment, CustomUser, Board

# 게시글 번호 범위
board_ids = list(range(1, 21))

# 댓글 생성
for idx in range(1, 41):
    # 임의의 게시글 선택
    board_id = random.choice(board_ids)
    # 해당 게시글에 대한 사용자 정보 가져오기
    user_email = f'user{random.randint(1, 18)}@exam.com'
    user = CustomUser.objects.get(email=user_email)
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