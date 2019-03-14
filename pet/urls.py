from django.conf.urls import url

from pet import views

urlpatterns=[
    url(r'^index/$',views.index,name='index'),
    url(r'^homepage/$',views.homepage,name='homepage'),
]