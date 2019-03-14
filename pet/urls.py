from django.conf.urls import url

from pet import views

urlpatterns=[
    url(r'^index/$',views.index,name='index'),
    url(r'^homepage/$',views.homepage,name='homepage'),
    url(r'^register/$',views.register,name='register'),
    url(r'^login/$',views.login,name='login'),
]