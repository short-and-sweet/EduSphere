from django.contrib.auth.models import AbstractUser, User
from django.db import models
from django.contrib.auth import get_user_model

class CustomUser(AbstractUser):
    username = models.CharField(max_length=150, unique=False, blank=True, null=True)
    email = models.EmailField(unique=True)
    name = models.CharField(max_length=100)
    role = models.CharField(max_length=50)
    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []
    
    def __str__(self):
        return self.email

    class Meta(AbstractUser.Meta):
        pass

    @property
    def groups(self):
        raise AttributeError("User has no attribute 'groups'. Use 'user_group' instead.")

    @property
    def user_permissions(self):
        raise AttributeError("User has no attribute 'user_permissions'. Use 'user_permission' instead.")

class Board(models.Model):
    title = models.CharField(max_length=100)
    content = models.TextField()
    author = models.ForeignKey(CustomUser, on_delete=models.CASCADE, related_name='board_author')
    created_at = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return self.title

class Comment(models.Model):
    comment_num = models.AutoField(primary_key=True)
    board = models.ForeignKey('Board', on_delete=models.CASCADE, related_name='comments')
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE, related_name='comment_author')
    text = models.TextField()

    def __str__(self):
        return f'Comment {self.comment_num} by {self.user}'