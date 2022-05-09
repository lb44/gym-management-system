from logging import PlaceHolder
from django.contrib import admin
from gymapp.models import UserMember,Contact,Enquiry,Plan,Equipment

# Register your models here.
admin.site.register(UserMember)
admin.site.register(Contact)
admin.site.register(Enquiry)
admin.site.register(Plan)
admin.site.register(Equipment)

