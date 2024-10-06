from django.contrib import admin
from django.contrib.messages import api
from django.urls import path, include
from staff.views import unique_code_view

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/staff/', include('staff.urls')),
    path('api/auth/', include('user_auth.urls')),
    path('api/statistics/', include('network_logger.urls')),
    path('', unique_code_view, name='unique_code'),
]
