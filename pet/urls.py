from django.conf.urls import url

from pet import views

urlpatterns = [
    url(r'^index/$', views.index, name='index'),
    url(r'^$', views.homepage, name='homepage'),
    url(r'^register/$', views.register, name='register'),
    url(r'^login/$', views.login, name='login'),
    url(r'^logout/$', views.logout, name='logout'),
    url(r'^goods/(\d+)$', views.goods, name='goods'),
    url(r'addcart/$', views.addcart, name='addcart'),
    url(r'subcart/$',views.subcart,name='subcart'),
    url(r'shopcar/$',views.shopcar,name='shopcar'),
    url(r'changecart/$',views.changecart,name='changecart'),
    url(r'^changeselect/$',views.changeselect,name='changeselect'),
    url(r'generateorder/$',views.generateorder,name='generateorder'),
    url(r'^orderinfo/$',views.orderinfo,name='orderinfo'),
    url(r'^changeorder/$',views.changeorder,name='changeorder')



]
