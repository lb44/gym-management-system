from distutils.command.upload import upload
from django.db import models
from django.contrib.auth.models import User


# Create your models here.
class UserMember(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    user_address = models.CharField(max_length=255)
    user_gender = models.CharField(max_length=150)
    user_mobile = models.CharField(max_length=255)
    user_photo = models.ImageField(upload_to='image/user')

    def __str__(self):
        return self.user.username

class Plan(models.Model):
    name = models.CharField(max_length=150, null=True)
    amount = models.CharField(max_length=15, null=True)
    duration = models.CharField(max_length=15, null=True)
    description = models.CharField(max_length=225, null=True)

    def __str__(self):
        return self.name


class Contact(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    name = models.CharField(max_length=100, null=True)
    emailid = models.CharField(max_length=50, null=True)
    contact = models.CharField(max_length=15, null=True)
    subject = models.CharField(max_length=100, null=True)
    message = models.CharField(max_length=300, null=True)
    msgdate = models.DateField(null=True,auto_created=True)
    isread = models.CharField(max_length=10,null=True)
    plan = models.ForeignKey(Plan,on_delete=models.CASCADE,blank=True,null=True)

    def __str__(self):
        return self.name


class Enquiry(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    name = models.CharField(max_length=150, null=True)
    mobile = models.CharField(max_length=15, null=True)
    email = models.CharField(max_length=50, null=True)
    age = models.CharField(max_length=15, null=True)
    gender = models.CharField(max_length=10, null=True)

    def __str__(self):
        return self.name
    


class Equipment(models.Model):
    
    name = models.CharField(max_length=150, null=True)
    price = models.CharField(max_length=100, null=True)
    unit = models.CharField(max_length=50, null=True)
    purchasedate = models.DateField(null=True)
    description = models.CharField(max_length=200, null=True)
    image= models.ImageField(upload_to='image/user',null=True)

    def __str__(self):
        return self.name