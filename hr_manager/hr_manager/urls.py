
from django.urls import path, include
from staff.views import unique_code_view

handler404 = 'staff.views.custom_404_view'

urlpatterns = [
    path('api/staff/', include('staff.urls')),
    path('api/auth/', include('user_auth.urls')),
    path('api/statistics/', include('network_logger.urls')),
    path('', unique_code_view, name='unique_code'),
]