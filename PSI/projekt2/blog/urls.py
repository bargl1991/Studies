from django.conf.urls import patterns, url

from blog import views

urlpatterns = patterns('blog.views',
   (r"", "main"),
)
