from django.db import models

# Create your models here.
class User(models.Model):
    u_tel=models.CharField(max_length=11)
    u_name=models.CharField(max_length=40,unique=True)
    u_password=models.CharField(max_length=256)
    token=models.CharField(max_length=256)

class Goods(models.Model):
    g_name=models.CharField(max_length=40)
    g_img=models.CharField(max_length=255)
    g_price=models.CharField(max_length=40)
    g_txt=models.CharField(max_length=255)


class Cart(models.Model):
    user=models.ForeignKey(User)
    goods=models.ForeignKey(Goods)
    number=models.CharField(max_length=40,default=1)
    isselect=models.BooleanField(default=True)

class Order(models.Model):
    user=models.ForeignKey(User)
    number=models.CharField(max_length=256)
    status=models.IntegerField(default=1)
    createtime=models.DateTimeField(auto_now=True)

class OrderGoods(models.Model):
    order=models.ForeignKey(Order)
    goods=models.ForeignKey(Goods)
    number=models.IntegerField(default=1)
