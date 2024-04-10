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
# app_name = 'myapp'

urlpatterns = [
    path('', views.main_page, name='main_page'),                                    # 메인 페이지

    path('board/', views.board_list, name='board_list'),                            # 게시판 목록 페이지
    path('board/create/', views.board_create, name='board_create'),                 # 게시판 등록 페이지
    path('board/<int:board_id>/update/', views.board_update, name='board_update'),  # 게시판 수정 페이지

    path('board/<int:board_id>/', views.board_detail, name='board_detail'),         # 상세 게시판 페이지
    
    path('board/create/process', views.board_c, name='board_create_process'),       # 게시글 등록
    path('board/update/process', views.board_u, name='board_update_process'),       # 게시글 수정
    path('board/<int:board_id>/delete/', views.board_delete, name='board_delete'),  # 게시글 삭제 

    path('signup/', views.show_signup_page, name='signup_page'),                    # 회원가입 페이지
    path('signup/process/', views.signup, name='signup_process'),                   # 'signup'은 회원가입을 처리하는 뷰 함수의 이름

    path('login/', views.show_login_page, name='login_page'),    
    path('login/process', views.login_user, name='login_process'),  # 로그인 URL

    path('logout/', views.logout_view, name='logout'),
]
