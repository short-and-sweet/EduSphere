from django.shortcuts import render

# 메인 페이지 뷰
def main_page(request):                         
    return render(request, 'main_page.html')

# 로그인 페이지 뷰
def login_page(request):
    return render(request, 'login_page.html')

# 회원가입 페이지 뷰    
def signup_page(request):
    
    return render(request, 'signup_page.html')

# 게시판 목록 페이지 뷰
def board_list(request):
    return render(request, 'board_list.html')

# 게시판 등록 페이지 뷰
def board_create(request):
    return render(request, 'board_create.html')

# 게시판 수정 페이지 뷰 
def board_update(request, board_id):
    return render(request, 'board_update.html', {'board_id': board_id})

# 상세 게시판 페이지 뷰
def board_detail(request, board_id):
    return render(request, 'board_detail.html', {'board_id': board_id})