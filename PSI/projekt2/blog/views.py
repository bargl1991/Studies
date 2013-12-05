from django.shortcuts import render_to_response
from django.template import RequestContext
from django.http import HttpResponse
from blog.models import *
from django.http import Http404
from django.core.paginator import Paginator, InvalidPage, EmptyPage
from django.core.urlresolvers import reverse


#def index(request):
    #return HttpResponse("Hello, world. You're at the polls index.")

def main(request):
    posts = Post.objects.all()
    paginator = Paginator(posts, 2)
    try: 
        page = int(request.GET.get("page", '1'))
    except : 
        page = 1
    try:
        posts = paginator.page(page)
    except (InvalidPage, EmptyPage):
        posts = paginator.page(paginator.num_pages)
    return render_to_response("list.html", dict(posts=posts, user=request.user))
    