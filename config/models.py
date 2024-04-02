from django.contrib.auth.models import AbstractUser
from django.db import models
from django.contrib.auth import get_user_model

class CustomUser(AbstractUser):
    email = models.EmailField(unique=True)          # 이메일
    name = models.CharField(max_length=100)         # 이름
    role = models.CharField(max_length=50)          # 역할
    is_active = models.BooleanField(default=True)   # 활성화 상태
    is_admin = models.BooleanField(default=False)   # 관리자 여부

    def __str__(self):
        return self.email
    
User = get_user_model()
class Board(models.Model):
    title = models.CharField(max_length=100)                    # 제목
    content = models.TextField()                                # 내용
    author = models.ForeignKey(User, on_delete=models.CASCADE)  # 작성자
    created_at = models.DateTimeField(auto_now_add=True)        # 작성일시
    
    def __str__(self):
        return self.title