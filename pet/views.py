import hashlib
import random
import time

from django.shortcuts import render, redirect

# Create your views here.
from pet.models import User


def index(request):
    return render(request,'index.html')


def homepage(request):
    token=request.session.get('token')
    user=None
    if token:
        user=User.objects.get(token=token)

    return render(request,'homepage.html' ,context={'user':user})


def genrate_token():
    token = str(time.time()) + str(random.random())
    md5 = hashlib.md5()
    md5.update(token.encode('utf-8'))

    return md5.hexdigest()


def genrate_password(password):
    md5 = hashlib.md5()
    md5.update(password.encode('utf-8'))
    return md5.hexdigest()


def register(request):
    if request.method=='GET':

        return render(request,'register.html')
    elif request.method=='POST':
        tel=request.POST.get('tel')
        name=request.POST.get('name')
        password=request.POST.get('password')
        try:
            user=User()
            user.u_tel=tel
            user.u_name=name
            user.u_password=genrate_password(password)
            user.token=genrate_token()
            user.save()
            response=redirect("pet:homepage")
            request.session['token']=user.token
            return response
        except:
            return render(request,'register.html')


def login(request):
    if request.method=='GET':
        return render(request,'login.html')
    elif request.method=='POST':

        pass