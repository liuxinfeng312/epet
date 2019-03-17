from django.conf.urls import url

from pet import views

urlpatterns = [
    url(r'^index/$', views.index, name='index'),
    url(r'^$', views.homepage, name='homepage'),
    url(r'^register/$', views.register, name='register'),
    url(r'^login/$', views.login, name='login'),
    url(r'^logout/$', views.logout, name='logout'),
    url(r'^goods/(\d+)$', views.goods, name='goods'),
    url(r'addcart/$', views.addcart, name='addcart')

]
