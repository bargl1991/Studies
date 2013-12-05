from django.contrib import admin
from blog.models import Choice, Question, Post,Comment
import datetime
from django.utils import timezone

class CommentInLine(admin.TabularInline):
    model = Comment
    extra = 3

class PostAdmin(admin.ModelAdmin):
    fieldsets = [
                 (None, {'fields':['post_text']}),
                 ('Author:', {'fields':['author']}),
                 
                 ]
    inlines = [CommentInLine]

class ChoiceInline(admin.TabularInline):
    model = Choice
    extra = 3




class QuestionAdmin(admin.ModelAdmin):
    fieldsets = [
        (None,               {'fields': ['question_text']}),
        ('Date information', {'fields': ['pub_date'],
                              'classes': ['collapse']}),
    ]
    inlines = [ChoiceInline]
    list_filter = ['pub_date']
    def was_published_recently(self):
        return self.pub_date >= timezone.now() - datetime.timedelta(days=1)
    was_published_recently.admin_order_field = 'pub_date'
    was_published_recently.boolean = True
    was_published_recently.short_description = 'Published recently?'
    search_fields = ['question_text']



admin.site.register(Question, QuestionAdmin)
admin.site.register(Post,PostAdmin)