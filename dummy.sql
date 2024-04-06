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
-- 아직 수정 안됌... 

from myapp.models import Board

# 게시글 정보 리스트 생성
board_info_list = [
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
for idx, board_info in enumerate(board_info_list, start=1):
    # 사용자 생성
    u = CustomUser(email=board_info['email'], name=board_info['name'], role=board_info['role'], is_active=1, is_admin=board_info['is_admin'])
    # 데이터베이스에 저장
    u.save()
    # 생성된 사용자의 ID 출력
    print(f"User {idx}의 ID: {u.id}")


