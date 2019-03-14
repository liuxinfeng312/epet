from django.db import models

# Create your models here.
class User(models.Model):
    u_tel=models.CharField(max_length=11)
    u_name=models.CharField(max_length=40,unique=True)
    u_password=models.CharField(max_length=256)
    token=models.CharField(max_length=256)
