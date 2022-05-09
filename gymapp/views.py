import os
from django.shortcuts import render,redirect
from django.contrib import messages
from django.contrib.auth.models import User,auth
from gymapp.models import Contact, Equipment, Plan, UserMember
from django.contrib.auth import authenticate, logout, login
from datetime import date
from django.contrib.auth.decorators import login_required

# Create your views here.
def load_index_page(request):
    return render(request,'home.html')

# -------------- login up----------------
def load_login_page(request):
    return render(request,'login.html')

def userlogin(request):
    if request.method == 'POST':
        try:
            username = request.POST['uname']
            password = request.POST['passw']
            user = auth.authenticate(username=username,password=password)
            request.session["uid"] = user.id
            if user is not None:
                if user.is_staff:
                    login(request, user)
                    return redirect('load_admin_home')
                else:
                    login(request,user)
                    auth.login(request,user)
                    messages.info(request, f'Welcome {username}')
                    return redirect('load_welcome_page')
                    
            else:
                messages.info(request,'Invalid Username or password.Try again!')
                return redirect('userlogin')
        except:
            messages.info(request,'Invalid username or password')
            return render(request,'login.html')
    else:
        return render(request,'login.html')    

# -------------- sign up----------------
def load_signup_page(request):
    return render(request,'signup.html')

def sign_up(request):
    if request.method == 'POST':
        fname = request.POST.get('fname')
        lname = request.POST.get('lname')
        address = request.POST.get('address')
        email = request.POST.get('email')
        uname = request.POST.get('uname')
        passw = request.POST.get('passw')
        cpassw = request.POST.get('cpassw')
        gender = request.POST.get('gender')
        mobile = request.POST.get('mobile')
        #photo = request.FILES.get('photo')
        if request.FILES.get('photo') is not None:
            photo = request.FILES['photo']
        else:
            photo = "/static/image/default.png"
        if cpassw == passw:
            if User.objects.filter(username=uname).exists():
                messages.info(request, 'Username not available...')
                return redirect('sign_up')
            elif User.objects.filter(email=email).exists():
                messages.info(request, 'Email not available...')
                return redirect('sign_up')
            else:
                user = User.objects.create_user(first_name=fname,last_name=lname,email=email,username=uname,password=passw)
                user.save()
                u = User.objects.get(id=user.id)
                member = UserMember(user_address=address,user_gender=gender,user_mobile=mobile,user=u,user_photo=photo)
                member.save()
                return redirect('load_login_page')
    return render(request,'signup.html')

# ----------Logout-------------
def user_logout(request):
    request.session["uid"] = ""
    auth.logout(request)
    return redirect('load_index_page')

def load_equip_page(request):
    equip = Equipment.objects.all()
    return render(request,'equip.html',{'equip':equip})

# -------------USER welcome page ---------

def load_welcome_page(request):
    if 'uid' in request.session:
        return render(request,'user/welcome.html') 
    return redirect('load_login_page') 

# ------------  profile --------------
@login_required(login_url='load_login_page')
def profile(request):
    user = UserMember.objects.filter(user=request.user)
    context = {'user':user}
    return render(request,'user/profile.html',context)


# ------------ edit profile --------------
@login_required(login_url='load_login_page')
def edit_profile(request):
    if request.method == 'POST':
        umember = UserMember.objects.get(user=request.user)
        umember.user.first_name = request.POST.get('fname')
        umember.user.last_name = request.POST.get('lname')
        umember.user.username = request.POST.get('uname')
        umember.user.email = request.POST.get('email')
        umember.user_address = request.POST.get('address')
        umember.user_mobile = request.POST.get('mobile')
        #umember.user_photo = request.FILES.get('photo')
        if request.FILES.get('photo') is not None:
            if not umember.user_photo == "/static/image/default.png":
                os.remove(umember.user_photo.path)
                umember.user_photo = request.FILES['photo']
            else:
                umember.user_photo = request.FILES['photo']
        else:
            os.remove(umember.user_photo.path)
            umember.user_photo = "/static/image/default.png" 
        umember.user.save()
        umember.save()
        return redirect('profile')
    umember = UserMember.objects.get(user=request.user)
    context = {'umember':umember}
    return render(request,'user/editprofile.html',context)

# -------view my plan ----------
def my_plan(request,pid):
    if 'uid' in request.session:
        try:
            viewplan = Contact.objects.get(user=pid)
            return render(request,'user/myplan.html',{'p':viewplan})
        except:
            return redirect('profile')
    return redirect('load_login_page') 

#  ---- view all plan-------
def user_view_plan(request):
    if 'uid' in request.session:
        viewplan = Plan.objects.all()
        return render(request,'user/userview_plan.html',{'plan':viewplan})
    return redirect('load_login_page') 

# ----view equipments for users -----
def equipments(request):
    if 'uid' in request.session:
        viewequip = Equipment.objects.all()
        return render(request,'user/equipments.html',{'equip':viewequip})
    return redirect('load_login_page')


def contact(request,pk):
    if 'uid' in request.session:
        user = request.user
        if request.POST:
            a =request.POST['name']
            b =request.POST['contact']
            c =request.POST['emailid']
            d =request.POST['subject']
            e =request.POST['message']
            g = Plan.objects.get(id=pk)
            u = User.objects.get(id=user.id)
            contct =Contact(user = u,name=a, msgdate=date.today(),
                            emailid=c,contact=b,isread="no",
                            subject=d,message=e,
                            plan=g)
            contct.save()
            print('ssss')
            return redirect('load_welcome_page')
        return render(request,'user/contact.html',{'user':user})
    return redirect('load_login_page') 
    
 

# ============  ADMIN home page  ==========

def load_admin_home(request):
    if not request.user.is_staff:
        return redirect('load_login_page')
    return render(request,'admin/admin_home.html')

# ----------add plan ------
def add_Plan(request):
    if not request.user.is_staff:
        return redirect('load_login_page')
    if request.method == "POST":
        p = request.POST['name']
        a = request.POST['amount']
        d = request.POST['duration']
        e = request.POST['description']
        plan = Plan(name=p, amount=a, duration=d, description=e)
        plan.save()
        return redirect('load_admin_home')
    return render(request,'admin/add_plan.html')

def view_plan(request):
    if not request.user.is_staff:
        return redirect('load_login_page')
    viewplan = Plan.objects.all()
    return render(request,'admin/view_plan.html',{'plan':viewplan})

def edit_Plan(request,pid):
    if not request.user.is_staff:
        return redirect('load_login_page')
    plan = Plan.objects.get(id=pid)
    if request.method == "POST":
        plan = Plan.objects.get(id=pid)
        plan.name = request.POST['name']
        plan.amount = request.POST['amount']
        plan.duration = request.POST['duration']
        plan.save()
        print('hii')
        return redirect('view_plan')
    return render(request,'admin/edit_plan.html',{'plan':plan})

def delete_Plan(request,pid):
    plan = Plan.objects.get(id=pid)
    plan.delete()
    return redirect('view_plan')

def addEquipment(request):
    if not request.user.is_staff:
        return redirect('load_login_page')
    if request.method == "POST":
        n = request.POST['name']
        m = request.FILES['image']
        p = request.POST['price']
        u = request.POST['unit']
        pd = request.POST['purchasedate']
        d = request.POST['description']
        eq = Equipment(name=n,image=m,price=p, unit=u, purchasedate=pd, description=d)
        eq.save()
        return redirect('load_admin_home')
    return render(request,'admin/add_equipments.html')

def view_equip(request):
    if not request.user.is_staff:
        return redirect('load_login_page')
    viewequip = Equipment.objects.all()
    return render(request,'admin/view_equip.html',{'equip':viewequip})

def edit_Equipment(request,pid):
    if not request.user.is_staff:
        return redirect('load_login_page')
    equipment = Equipment.objects.get(id=pid)
    if request.method == "POST":
        equipment = Equipment.objects.get(id=pid)
        equipment.name = request.POST['name']
        equipment.image = request.FILES['image']
        equipment.price = request.POST['price']
        equipment.unit = request.POST['unit']
        equipment.description = request.POST['description']
        equipment.save()
        return redirect('view_equip')  
    return render(request,'admin/edit_equip.html',{'equipment':equipment})

def delete_Equipment(request,pid):
    equipment = Equipment.objects.get(id=pid)
    equipment.delete()
    return redirect('view_equip')

def view_contact(request):
    if not request.user.is_staff:
        return redirect('load_login_page')
    cntc = Contact.objects.all()
    return render(request,'admin/view_contact.html')

def unread_queries(request):
    if not request.user.is_staff:
        return redirect('load_login_page')
    contact = Contact.objects.filter(isread="no")
    return render(request,'admin/unread_queries.html',{'contact':contact})

def read_queries(request):
    if not request.user.is_staff:
        return redirect('load_login_page')
    contact = Contact.objects.filter(isread="yes")
    return render(request,'admin/read_queries.html',{'contact':contact})

def view_queries(request,pid):
    if not request.user.is_staff:
        return redirect('load_login_page')
    contact = Contact.objects.get(id=pid)
    contact.isread = "yes"
    contact.save()
    return render(request,'admin/view_queries.html',{'contact':contact})

def delete_contact(request,pid):
    contact = Contact.objects.get(id=pid)
    contact.delete()
    return redirect('read_queries')


def members(request):
    if not request.user.is_staff:
        return redirect('load_login_page')
    user = UserMember.objects.all()
    return render(request,'admin/members.html',{'user':user})

def delete_members(request,pk):
    if not request.user.is_staff:
        return redirect('load_login_page')
    user = User.objects.get(id=pk)
    user.delete()
    return redirect('members')

def gym_goers(request):
    if not request.user.is_staff:
        return redirect('load_login_page')
    user = Contact.objects.all()
    return render(request,'admin/goers.html',{'user':user})

def delete_gym_goers(request,pk):
    if not request.user.is_staff:
        return redirect('load_login_page')
    user = Contact.objects.get(id=pk)
    user.delete()
    return redirect('gym_goers')

def a_member(request,pk):
    if not request.user.is_staff:
        return redirect('load_login_page')
    user = UserMember.objects.get(user=pk)
    cntct = Contact.objects.get(user=pk)
    return render(request,'admin/A_member.html',{'user':user,'cntct':cntct})