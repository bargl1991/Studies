from django.shortcuts import render
from diango.template import loader,Context
from django.http import HttpResponse
from blog.models import BlogPost

def archive(request):
    posts = BlogPost.objects.all()
    t = loader.get_template("my_template.html")
    c = Context({'posts':posts})
    return HttpResponse(t.render(c))

# Create your views here.
