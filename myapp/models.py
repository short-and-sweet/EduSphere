from django.contrib.auth.models import User
from django.db import models
from django.contrib.auth import get_user_model

# 게시판 테이블
class Board(models.Model):
    title = models.CharField(max_length=100)
    content = models.TextField()
    author = models.ForeignKey(User, on_delete=models.CASCADE, related_name='board_author')
    created_at = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return self.title
    
# 댓글 테이블
class Comment(models.Model):
    comment_num = models.AutoField(primary_key=True)
    board = models.ForeignKey('Board', on_delete=models.CASCADE, related_name='comments')
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='comment_author')
    text = models.TextField()

    def __str__(self):
        return f'Comment {self.comment_num} by {self.user}'

# 배급 게시판
class Distribution(models.Model):
    title = models.CharField(max_length=100)
    user = models.ForeignKey(get_user_model(), on_delete=models.CASCADE)  # 유저 테이블의 username을 외래키로 받아옴
    latitude = models.DecimalField(max_digits=9, decimal_places=6)  # 위도
    longitude = models.DecimalField(max_digits=9, decimal_places=6)  # 경도
    content = models.TextField()
    start_date = models.DateField()
    end_date = models.DateField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title

# 봉사자 모집 게시판
class VolunteerRecruitment(models.Model):
    user = models.ForeignKey(get_user_model(), on_delete=models.CASCADE)  # 유저 테이블의 username을 외래키로 받아옴
    title = models.CharField(max_length=100)
    content = models.TextField()
    start_date = models.DateField()
    end_date = models.DateField()
    latitude = models.DecimalField(max_digits=9, decimal_places=6)  # 위도
    longitude = models.DecimalField(max_digits=9, decimal_places=6)  # 경도
    recruitment_completed = models.BooleanField(default=False)  # 모집 완료 여부
    participant_count = models.PositiveIntegerField(default=0)  # 참가자 인원수

    def __str__(self):
        return self.title

# 봉사자 명단 게시판
class VolunteerList(models.Model):
    recruitment = models.ForeignKey(VolunteerRecruitment, on_delete=models.CASCADE)  # 봉사자 모집 테이블의 기본키를 외래키로 받아옴
    user = models.ForeignKey(get_user_model(), on_delete=models.CASCADE)  # 유저 테이블의 username을 외래키로 받아옴
    
    def __str__(self):
        return f"{self.user} - {self.recruitment}"