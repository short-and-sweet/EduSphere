from django.shortcuts import render, redirect, get_object_or_404
from .models import Board, Comment          # 데이터 바인딩용
from django.core.paginator import Paginator             # 페이지 네이션

from django.contrib import auth  # auth 모듈 import 추가
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, logout

from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponseRedirect, HttpResponse
from django.urls import reverse



# 메인 페이지 뷰
def main_page(request):      
    latest_boards = Board.objects.all().order_by('-created_at')[:5][::-1]  # 최신 게시글 5개만 가져오기
    return render(request, 'main_page.html', {'latest_boards': latest_boards})

# 로그인 페이지 뷰
def show_login_page(request):
    return render(request, 'login_page.html')

# 회원가입 페이지 뷰    
def show_signup_page(request):
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
    board = get_object_or_404(Board, id=board_id)
    return render(request, 'board_update.html', {'board': board})

# 게시판 삭제
def board_delete(request, board_id):
    board = Board.objects.get(id = board_id)
    print(board)
    print(board.id)
    board.delete()
    return redirect('board_list')  # 삭제 후 목록 페이지로 이동하도록 설정
    # return render(request, 'board_delete_confirm.html', {'board': board})

# 상세 게시판 페이지 뷰
def board_detail(request, board_id):
    board = Board.objects.get(pk=board_id)  # 해당 board_id에 해당하는 게시글 정보를 가져옵니다.
    comments = Comment.objects.filter(board=board)  # 해당 게시글에 달린 댓글들을 가져옵니다.
    return render(request, 'board_detail.html', {'board': board, 'comments': comments})


#####################################################################################
def board_c(request):

    board = Board() # 데이터 저장을 위한 객체 생성
    board.title = request.POST['title']
    board.author_id = request.user.id
    board.content = request.POST['content']
    board.save() # 객체 저장

    return redirect('board_list')  # 삭제 후 목록 페이지로 이동하도록 설정

def board_u(request):

    board = Board() # 데이터 저장을 위한 객체 생성
    board.title = request.POST['title']
    board.author_id = request.user.id
    board.content = request.POST['content']
    board.save() # 객체 저장

    return redirect('board_list')  # 수정 후 목록 페이지로 이동하도록 설정



@csrf_exempt
# 회원가입 테스트 코드
def signup(request):
    if request.method == 'POST':
        if request.POST['password'] == request.POST['re_password']:
            User.objects.create_user(
                username=request.POST['email'],                
                email=request.POST['email'],
                first_name = request.POST['first_name'],
                last_name = request.POST['last_name'],
                password=request.POST['password'],
                is_superuser=0,
                is_active=1,
                is_staff=0,
                )
            request.session['signup_success'] = True
            return HttpResponseRedirect(reverse('login_page'))  # 리디렉션
        else:
            return render(request, 'signup.html')  # 비밀번호 불일치 시 회원가입 페이지로 이동
    return render(request, 'signup_html.html')
    

# 로그인 테스트 코드

@csrf_exempt
def login_user(request):
    if request.method == 'POST':
        email = request.POST.get('email','')
        password = request.POST.get('password','')
        user = authenticate(username=email, password=password)
        if user is not None:
            auth.login(request, user)
            return redirect('main_page')  # 로그인 성공 시 메인 페이지로 이동
        else:
            return render(request, 'login_page.html', {'error': 'Invalid email or password'})  # 로그인 실패 시 에러 메시지 표시
    else:
        return render(request, 'login_page.html')
    
def logout_view(request):
    logout(request)
    return redirect('main_page')