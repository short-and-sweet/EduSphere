"""
URL configuration for config project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from . import views
from django.contrib.auth import views as auth_views
from .views import map_template_click

# app_name = 'myapp'

urlpatterns = [
    path('', views.main_page, name='main_page'),                                    # 메인 페이지

    path('board/', views.board_list, name='board_list'),                            # 게시판 목록 페이지
    path('board/create/', views.board_create, name='board_create'),                 # 게시판 등록 페이지
    path('board/<int:board_id>/update/', views.board_update, name='board_update'),  # 게시판 수정 페이지

    path('board/<int:board_id>/', views.board_detail, name='board_detail'),         # 상세 게시판 페이지
    
    path('board/create/process', views.board_c, name='board_create_process'),       # 게시글 등록
    path('board/<int:board_id>/process', views.board_u, name='board_process'),      # 게시글 수정
    path('board/<int:board_id>/delete/', views.board_delete, name='board_delete'),  # 게시글 삭제 

    path('comment/create/<int:board_id>/', views.comment_create, name='comment_create'),        # 댓글 등록
    path('comment/delete/<int:board_id>/<int:comment_id>/', views.comment_delete, name='comment_delete'),              # 댓글 삭제 
    
    path('signup/', views.show_signup_page, name='signup_page'),                    # 회원가입 페이지
    path('signup/process/', views.signup, name='signup_process'),                   # 'signup'은 회원가입을 처리하는 뷰 함수의 이름

    path('login/', views.show_login_page, name='login_page'),    
    path('login/process', views.login_user, name='login_process'),                          # 로그인 URL

    path('logout/', views.logout_view, name='logout'),

    path('shelter/', views.shelter_page, name='shelter_page'),                              # 피난소 지도 페이지
    path('map_template_click/', map_template_click, name='map_template_click'),
    
    path('distribution_map/', views.distribution_map, name='distribution_map'),             # 배급 지도 페이지
    path('distribution/create/', views.distribution_create, name='distribution_create'),    # 배급 생성 페이지
    path('distribution/create/process', views.distribution_create_process, name='distribution_create_process'),    # 배급 등록
    path('get-distribution-data/', views.get_distribution_data, name='get_distribution_data'),    # 배급 데이터 바인딩 (에이잭스 요청)

    # 봉사자
    path('volunteer/list/', views.volunteer_list, name='volunteer_list'),           # 페이지 이동
    path('volunteer/create/', views.volunteer_create, name='volunteer_create'),     # 페이지 이동
    path('volunteer/detail/<int:id>', views.volunteer_detail, name='volunteer_detail'),     # 페이지 이동
    
    path('volunteer/create/process/', views.volunteer_create_process, name='volunteer_create_process'), # 봉사모집 등록
    path('volunteer/<int:volunteer_id>/join/', views.volunteer_join, name='volunteer_join'),                               # 봉사 참가 


    path('test/', views.test, name='test'),                            # 테스트
]
