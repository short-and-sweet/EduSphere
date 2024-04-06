from django.shortcuts import render
from .models import Board, Comment              # 데이터 바인딩용
from django.core.paginator import Paginator     # 페이지 네이션


# 메인 페이지 뷰
def main_page(request):      
    latest_boards = Board.objects.all().order_by('-created_at')[:5][::-1]  # 최신 게시글 5개만 가져오기
    return render(request, 'main_page.html', {'latest_boards': latest_boards})
    # return render(request, 'main_page.html')

# 로그인 페이지 뷰
def login_page(request):
    return render(request, 'login_page.html')

# 회원가입 페이지 뷰    
def signup_page(request):
    return render(request, 'signup_page.html')






# 게시판 목록 페이지 뷰
def board_list(request):

    all_boards = Board.objects.all().order_by('-created_at')
    paginator = Paginator(all_boards, 10)  # 한 페이지에 10개의 게시글을 표시합니다.

    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    return render(request, 'board_list.html', {'page_obj': page_obj})


# 게시판 등록 페이지 뷰
def board_create(request):
    return render(request, 'board_create.html')

# 게시판 수정 페이지 뷰 
def board_update(request, board_id):
    return render(request, 'board_update.html', {'board_id': board_id})

# 상세 게시판 페이지 뷰
def board_detail(request, board_id):
    board = Board.objects.get(pk=board_id)  # 해당 board_id에 해당하는 게시글 정보를 가져옵니다.
    comments = Comment.objects.filter(board=board)  # 해당 게시글에 달린 댓글들을 가져옵니다.
    return render(request, 'board_detail.html', {'board': board, 'comments': comments})