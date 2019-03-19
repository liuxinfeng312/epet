import hashlib
import random
import time
import uuid

from django.http import JsonResponse
from django.shortcuts import render, redirect

# Create your views here.
from pet.models import User, Goods, Cart, Order, OrderGoods


def index(request):
    return render(request,'index.html')


def homepage(request):
    token=request.session.get('token')
    user=None
    if token:
        user=User.objects.get(token=token)
    goods=Goods.objects.all()


    return render(request,'homepage.html' ,context={'user':user,
                                                    'goods':goods})


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

        name=request.POST.get('name')
        password=request.POST.get('password')
        users=User.objects.filter(u_name=name).filter(u_password=genrate_password(password))
        if users.exists():
            user=users.first()
            user.token=genrate_token()
            user.save()
            response=redirect('pet:homepage')
            request.session['token']=user.token
            return response
        else:
            return render(request,'login.html')


def goods(request,index=1):

    token=request.session.get('token')
    users=User.objects.filter(token=token)
    good=Goods.objects.get(id=index)
    if users.exists():
        user=users.first()
        return render(request,'goods.html',context={'good':good,
                                                    'user':user})
    else:

        return render(request,'login.html')


def logout(request):
    request.session.flush()
    response=redirect('pet:homepage')


    return response




def addcart(request):
    response_data={}

    token=request.session.get('token','')

    if token:
        users=User.objects.filter(token=token)

        if users.exists():
            user=users.first()
            goodsid = request.GET.get('goodid')
            num=request.GET.get('num')
            good = Goods.objects.get(pk=goodsid)
            carts=Cart.objects.filter(user=user).filter(goods=good)
            if carts.exists():
                cart=carts.first()
                cart.number=cart.number+int(num)
                cart.save()
            else:
                cart=Cart()
                cart.goods=good
                cart.user=user
                cart.number=1
                cart.save()
            response_data['status']=1
            response_data['number']=cart.number
            response_data['msg']='添加{}购物车成功：{}'.format(cart.goods.g_name,cart.number)


            return JsonResponse(response_data)
    response_data['status'] = -1
    response_data['msg'] = '请登录后操作'
    return JsonResponse(response_data)


def shopcar(request):
    token=request.session.get('token')
    user=User.objects.get(token=token)
    carts=Cart.objects.filter(user=user)
    price=0

    for cart in carts:
        price+=float(cart.goods.g_price)*float(cart.number)


    return render(request,'shopcar.html',context={'carts':carts,'price':price, })


def subcart(request):
    return None


def changecart(request):
    return None


def changeselect(request):
    return None


def generateorder(request):
    token=request.session.get('token')
    if token :
        user=User.objects.get(token=token)
        order=Order()
        order.user=user
        order.number=str(uuid.uuid5(uuid.uuid4(), 'order'))
        order.save()


        carts=Cart.objects.filter(user=user).filter(isselect=True)
        for cart in carts:
            orderGoods=OrderGoods()
            orderGoods.order=order
            orderGoods.goods=cart.goods
            orderGoods.number=cart.number
            orderGoods.save()
            cart.delete()

        orders=Order.objects.filter(user=user)

        return render(request,'orderinfo.html',context={'orders':orders})


def orderinfo(request):
    orderGoods = OrderGoods.objects.all()

    return render(request,'ordertext.html',context={'orderGoods':orderGoods})


def changeorder(request):
    return None