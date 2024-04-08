from django.contrib.auth.models import AbstractUser, User
from django.db import models
from django.contrib.auth import get_user_model




        
class Board(models.Model):
    title = models.CharField(max_length=100)
    content = models.TextField()
    author = models.ForeignKey(User, on_delete=models.CASCADE, related_name='board_author')
    created_at = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return self.title

class Comment(models.Model):
    comment_num = models.AutoField(primary_key=True)
    board = models.ForeignKey('Board', on_delete=models.CASCADE, related_name='comments')
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='comment_author')
    text = models.TextField()

    def __str__(self):
        return f'Comment {self.comment_num} by {self.user}'