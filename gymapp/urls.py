from django.urls import path
from .import views
urlpatterns = [
    path('',views.load_index_page,name='load_index_page'),
    path('load_login_page',views.load_login_page,name='load_login_page'),
    path('load_signup_page',views.load_signup_page,name='load_signup_page'),
    path('sign_up',views.sign_up,name='sign_up'),
    path('user_logout',views.user_logout,name='user_logout'),
    path('userlogin',views.userlogin,name='userlogin'),

    # ------User ---------
    path('load_welcome_page',views.load_welcome_page,name='load_welcome_page'),
    path('user_view_plan',views.user_view_plan,name='user_view_plan'),
    path('contact/<int:pk>',views.contact,name='contact'),
    path('profile',views.profile,name='profile'),
    path('edit_profile',views.edit_profile,name='edit_profile'),
    path('my_plan/<int:pid>',views.my_plan,name='my_plan'),
    path('equipments',views.equipments,name='equipments'),

    # ---Admin------
    path('load_admin_home',views.load_admin_home,name='load_admin_home'),
    path('add_Plan',views.add_Plan,name='add_Plan'),
    path('view_plan',views.view_plan,name='view_plan'),
    path('edit_Plan/<int:pid>',views.edit_Plan, name='edit_Plan'),
    path('delete_Plan/<int:pid>',views.delete_Plan, name='delete_Plan'),
    path('addEquipment',views.addEquipment,name='addEquipment'),
    path('view_equip',views.view_equip,name='view_equip'),
    path('edit_Equipment/<int:pid>',views.edit_Equipment, name='edit_Equipment'),
    path('delete_Equipment/<int:pid>',views.delete_Equipment, name='delete_Equipment'),
    path('unread_queries',views.unread_queries, name='unread_queries'),
    path('read_queries',views.read_queries, name='read_queries'),
    path('view_queries/<int:pid>',views.view_queries, name='view_queries'),
    path('delete_contact/<int:pid>',views.delete_contact, name='delete_contact'),
    path('members',views.members,name='members'),
    path('delete_member/<int:pk>',views.delete_members,name='delete_member'),
    path('gym_goers',views.gym_goers,name='gym_goers'),
    path('delete_gym_goers/<int:pk>',views.delete_gym_goers,name='delete_gym_goers'),
    path('a_member/<int:pk>',views.a_member,name='a_member'),
]