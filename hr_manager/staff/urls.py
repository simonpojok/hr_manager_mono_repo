from django.urls import path
from staff import views

urlpatterns = [
    path('register/', views.register_staff, name='register_staff'),
    path('retrieve/', views.retrieve_staff, name='retrieve_staff'),
    path('retrieve/<int:staff_id>/', views.retrieve_staff, name='retrieve_staff_by_id'),
    path('update/<int:staff_id>/', views.update_staff, name='update_staff'),
]