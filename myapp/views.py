from django.shortcuts import render, redirect, get_object_or_404
from .models import Board, Comment, Distribution, VolunteerList, VolunteerRecruitment          # 데이터 바인딩용
from django.core.paginator import Paginator             # 페이지 네이션

from django.contrib import auth, messages  # auth 모듈 import 추가
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, logout, get_user_model

from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponseRedirect, HttpResponse, JsonResponse
from django.urls import reverse

import socket
from django.conf import settings

def get_server_ip():
    hostname = socket.gethostname()
    server_ip = socket.gethostbyname(hostname)
    return server_ip

def get_mariadb_ip():
    db_host = settings.DATABASES['default']['HOST']
    return db_host

# IP 호출
def get_client_ip(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip


# 메인 페이지 뷰
def main_page(request):      
    latest_boards = Board.objects.all().order_by('-created_at')[:5][::-1]  # 최신 게시글 5개만 가져오기
    latest_volunteers = VolunteerRecruitment.objects.all().order_by('id')[:5][::-1]  # 최신 게시글 5개만 가져오기
    print(latest_volunteers)
    client_ip = get_client_ip(request)
    server_ip = get_server_ip()
    mariadb_ip = get_mariadb_ip()

    return render(request, 'main_page.html', {
        'latest_boards': latest_boards,
        'latest_volunteers': latest_volunteers,
        'client_ip': client_ip,
        'server_ip': server_ip,
        'mariadb_ip': mariadb_ip
        })

# 로그인 페이지 뷰
def show_login_page(request):
    return render(request, 'auth/login_page.html')

# 회원가입 페이지 뷰    
def show_signup_page(request):
    return render(request, 'auth/signup_page.html')

# 피난소 시설 페이지 뷰
def shelter_page(request):
    client_ip = get_client_ip(request)
    server_ip = get_server_ip()
    mariadb_ip = get_mariadb_ip()

    return render(request, 'shelter_page.html',{
        'client_ip': client_ip,
        'server_ip': server_ip,
        'mariadb_ip': mariadb_ip
    })


# 게시판 목록 페이지 뷰
def board_list(request):

    all_boards = Board.objects.all().order_by('-created_at')
    paginator = Paginator(all_boards, 20)  # 한 페이지에 10개의 게시글을 표시합니다.

    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    client_ip = get_client_ip(request)
    server_ip = get_server_ip()
    mariadb_ip = get_mariadb_ip()


    return render(request, 'boards/board_list.html', {
        'page_obj': page_obj,
        'client_ip': client_ip,
        'server_ip': server_ip,
        'mariadb_ip': mariadb_ip    
        })


# 게시판 등록 페이지 뷰
def board_create(request):
    client_ip = get_client_ip(request)
    server_ip = get_server_ip()
    mariadb_ip = get_mariadb_ip()

    return render(request, 'boards/board_create.html',{
        'client_ip': client_ip,
        'server_ip': server_ip,
        'mariadb_ip': mariadb_ip
    })

# 게시판 수정 페이지 뷰 
def board_update(request, board_id):
    board = get_object_or_404(Board, id=board_id)
    client_ip = get_client_ip(request)
    server_ip = get_server_ip()
    mariadb_ip = get_mariadb_ip()

    return render(request, 'boards/board_update.html', {
        'board': board,
        'client_ip': client_ip,
        'server_ip': server_ip,
        'mariadb_ip': mariadb_ip        
    })

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
    client_ip = get_client_ip(request)
    server_ip = get_server_ip()
    mariadb_ip = get_mariadb_ip()
    return render(request, 'boards/board_detail.html', {
        'board': board, 'comments': comments,
        'client_ip': client_ip,
        'server_ip': server_ip,
        'mariadb_ip': mariadb_ip 
    
    })


#####################################################################################
def board_c(request):
    board = Board()
    board.title = request.POST['title']
    board.author_id = request.user.id
    board.content = request.POST['content']
    board.save()

    return redirect('board_list')  # 삭제 후 목록 페이지로 이동하도록 설정

def board_u(request, board_id):
    # print(board_id)
    # return HttpResponse(200)
    board = Board.objects.get(pk=board_id) # 데이터 저장을 위한 객체 생성
    board.title = request.POST['title']
    board.author_id = request.user.id
    board.content = request.POST['content']
    board.save() # 객체 저장

    return redirect('board_list')  # 수정 후 목록 페이지로 이동하도록 설정

def comment_create(request, board_id):
    comment = Comment()
    comment.board = Board.objects.get(pk=board_id)
    comment.user = request.user
    comment.text = request.POST['comment']
    print(comment.board)
    print(comment.user)
    print(comment.text)
    comment.save()
    return redirect(reverse('board_detail', kwargs={'board_id': board_id}))

# 게시판 삭제
def comment_delete(request, board_id, comment_id):
    comment = Comment.objects.get(comment_num = comment_id)
    comment.delete()
    return redirect(reverse('board_detail', kwargs={'board_id': board_id}))

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
            messages.success(request, '정상적으로 회원가입 되었습니다!')
            return HttpResponseRedirect(reverse('login_page'))  # 리디렉션
        else:
            messages.success(request, '입력란을 바르게 적어!')
            return render(request, 'auth/signup_page.html')  # 비밀번호 불일치 시 회원가입 페이지로 이동
    return render(request, 'auth/signup_page.html')
    

# 로그인 테스트 코드

@csrf_exempt
def login_user(request):
    if request.method == 'POST':
        email = request.POST.get('email','')
        password = request.POST.get('password','')
        user = authenticate(username=email, password=password)
        if user is not None:
            auth.login(request, user)
            messages.success(request, '정상적으로 로그인 되셨습니다!')
            return redirect('main_page')  # 로그인 성공 시 메인 페이지로 이동
        else:
            return render(request, 'auth/login_page.html', {'error': 'Invalid email or password'})  # 로그인 실패 시 에러 메시지 표시
    else:
        return render(request, 'auth/login_page.html')
    
def logout_view(request):
    logout(request)
    messages.success(request, '로그아웃 되셨습니다!')
    return redirect('main_page')



# 지도 템플릿 변경 함수
def map_template_click(request):
    button_id = request.GET.get('button_id')
    template_name = f'maps/map_template{button_id}.html'  # 클릭된 버튼에 따라 템플릿 파일 선택
    client_ip = get_client_ip(request)
    server_ip = get_server_ip()
    mariadb_ip = get_mariadb_ip()
    context = {
        'client_ip': client_ip,
        'server_ip': server_ip,
        'mariadb_ip': mariadb_ip  
    }  # 필요한 경우 템플릿에 전달할 변수를 포함한 컨텍스트 생성
    return render(request, template_name, context)




def distribution_map(request):
    client_ip = get_client_ip(request)
    server_ip = get_server_ip()
    mariadb_ip = get_mariadb_ip()

    return render(request, 'Distribution/distribution_map.html', {
        'client_ip': client_ip,
        'server_ip': server_ip,
        'mariadb_ip': mariadb_ip        
    }) 

def distribution_create(request):
    client_ip = get_client_ip(request)
    server_ip = get_server_ip()
    mariadb_ip = get_mariadb_ip()

    return render(request, 'Distribution/distribution_create.html', {
        'client_ip': client_ip,
        'server_ip': server_ip,
        'mariadb_ip': mariadb_ip        
    }) 

# 배급등록
def distribution_create_process(request):
    
        distribution = Distribution()
        # POST 요청에서 폼 데이터를 가져옵니다.
        distribution.title = request.POST.get('title')
        distribution.start_date = request.POST.get('start_date')
        distribution.end_date = request.POST.get('end_date')
        distribution.content = request.POST.get('content')
        distribution.latitude = request.POST.get('latitude')
        distribution.longitude = request.POST.get('longitude')
        distribution.user = request.user
        distribution.save()

        messages.success(request, '등록 되었습니다!')
        # 여기서 데이터베이스에 저장하거나 다른 작업을 수행할 수 있습니다.
        return redirect('distribution_map')
    
# 배급 데이터 바인딩
def get_distribution_data(request):
    # Distribution 모델에서 필요한 데이터를 쿼리합니다.
    distributions = Distribution.objects.all()

    # 데이터를 JSON 형식으로 가공합니다.
    data = []
    for distribution in distributions:
        data.append({
            'title': distribution.title,
            'user_first_name': distribution.user.first_name,
            'user_last_name': distribution.user.last_name,
            'latitude': float(distribution.latitude),  # DecimalField를 float로 변환
            'longitude': float(distribution.longitude),  # DecimalField를 float로 변환
            'content': distribution.content,
            'start_date': distribution.start_date.strftime('%Y-%m-%d'),  # DateField를 문자열로 변환
            'end_date': distribution.end_date.strftime('%Y-%m-%d'),  # DateField를 문자열로 변환
        })

    # JSON 데이터를 반환합니다.
    return JsonResponse(data, safe=False)




def volunteer_list(request):
    all_volunteers = VolunteerRecruitment.objects.all().order_by('-id')
    paginator = Paginator(all_volunteers, 10)  # 한 페이지에 10개의 게시글을 표시합니다.
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    client_ip = get_client_ip(request)
    server_ip = get_server_ip()
    mariadb_ip = get_mariadb_ip()

    return render(request, 'volunteer/volunteer_list.html', {'page_obj': page_obj,
                                                             'client_ip': client_ip,
        'server_ip': server_ip,
        'mariadb_ip': mariadb_ip                                                               
                                                             }) 


def volunteer_create(request):
    client_ip = get_client_ip(request)
    server_ip = get_server_ip()
    mariadb_ip = get_mariadb_ip()

    return render(request, 'volunteer/volunteer_create.html', {
        'client_ip': client_ip,
        'server_ip': server_ip,
        'mariadb_ip': mariadb_ip        
    }) 

# 상세 게시판 페이지 뷰
def volunteer_detail(request, id):
    volunteer = get_object_or_404(VolunteerRecruitment, pk=id)
    volunteer_participants = VolunteerList.objects.filter(recruitment=volunteer)
    is_participant = volunteer_participants.filter(user=request.user).exists() if request.user.is_authenticated else False
    client_ip = get_client_ip(request)
    server_ip = get_server_ip()
    mariadb_ip = get_mariadb_ip()
    
    print(volunteer_participants)
    context = {
        'volunteer': volunteer,
        'volunteer_participants': volunteer_participants,
        'is_participant': is_participant,
        'client_ip': client_ip,
        'server_ip': server_ip,
        'mariadb_ip': mariadb_ip 
    }
    return render(request, 'volunteer/volunteer_detail.html', context)

def volunteer_create_process(request):

    Volunteer = VolunteerRecruitment()
        # POST 요청에서 폼 데이터를 가져옵니다.
    Volunteer.title = request.POST.get('title')
    Volunteer.participant_count = request.POST.get('participant_count')
    Volunteer.start_date = request.POST.get('start_date')
    Volunteer.end_date = request.POST.get('end_date')
    Volunteer.content = request.POST.get('content')
    Volunteer.latitude = request.POST.get('latitude')
    Volunteer.longitude = request.POST.get('longitude')
    Volunteer.user = request.user
    Volunteer.save()
    messages.success(request, '모집글이 등록 되었습니다!')
    return redirect('volunteer_list')

    
# 배급 데이터 바인딩
def get_volunteer_data(request):
    # 모델에서 필요한 데이터를 쿼리합니다.
    volunteers = VolunteerRecruitment.objects.all()

    # 데이터를 JSON 형식으로 가공합니다.
    data = list(volunteers.values('latitude', 'longitude'))
    # JSON 데이터를 반환합니다.
    return JsonResponse(data, safe=False)

def volunteer_join(request, volunteer_id):
    # volunteer_id에 해당하는 VolunteerRecruitment 인스턴스 가져오기
    volunteer_recruitment = get_object_or_404(VolunteerRecruitment, pk=volunteer_id)
    
    # 현재 로그인한 사용자의 ID 가져오기
    user_id = request.user.id
    
    # 사용자 인스턴스 가져오기
    user = get_user_model().objects.get(pk=user_id)
    
    # VolunteerList 객체 생성 및 저장
    VolunteerList.objects.create(recruitment=volunteer_recruitment, user=user)

    # 현재 참여한 인원 수 가져오기
    participant_count = VolunteerList.objects.filter(recruitment=volunteer_recruitment).count()
    if participant_count == volunteer_recruitment.participant_count or participant_count >= volunteer_recruitment.participant_count :
        volunteer_recruitment.recruitment_completed = True
        print()
        volunteer_recruitment.save()

    messages.success(request, '봉사에 참가하셨습니다!')
    return redirect('volunteer_list')
             








# 테스트 페이지
def test(request):
    return render(request, 'api_test.html')

# 테스트 페이지
def openApi(request):
    return render(request, 'openApi_test.html')

