"""untitled URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from matchfilm.views import matchfilm, getallfilms, filmpage, actorpage, getpagefilm, filminfo, filmactor, addfilm,\
    addreview, addnoteactor, filmfilter, genrefilter, listfilm, notefilter, listactor, getpageactor, getconnexion,\
    deconnexion, getconnexionactive, addtofavorite, getallfilmsuser, adduser, userpage, getcountuserreview

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$', matchfilm, name='matchfilm'),
    url(r'^film$', filmpage, name='filmpage'),
    url(r'^actor$', actorpage, name='actorpage'),
    url(r'^user$', userpage, name='userpage'),
    url(r'^getallfilms$', getallfilms, name='getallfilms'),
    url(r'^getinfofilm$', getpagefilm, name='getpagefilm'),
    url(r'^getinfoactor$', getpageactor, name='getinfoactor'),
    url(r'^filminfo$', filminfo, name='filminfo'),
    url(r'^filmactor$', filmactor, name='filmactor'),
    url(r'^addfilm$', addfilm, name='addfilm'),
    url(r'^addreview$', addreview, name='addreview'),
    url(r'^addnoteactor$', addnoteactor, name='addnoteactor'),
    url(r'^filmfilter$', filmfilter, name='filmfilter'),
    url(r'^genrefilter$', genrefilter, name='filmfilter'),
    url(r'^listfilm$', listfilm, name='listfilm'),
    url(r'^listactor$', listactor, name='listactor'),
    url(r'^notefilter$', notefilter, name='notefilter'),
    url(r'^getconnexion$', getconnexion, name='getconnexion'),
    url(r'^deconnexion$', deconnexion, name='deconnexion'),
    url(r'^getconnexionactive$', getconnexionactive, name='getconnexionactive'),
    url(r'^addtofavorite$', addtofavorite, name='=addtofavorite'),
    url(r'^getallfilmsuser$', getallfilmsuser, name='=getallfilmsuser'),
    url(r'^adduser$', adduser, name='=adduser'),
    url(r'^getcountuserreview$', getcountuserreview, name='=getcountuserreview'),


]
