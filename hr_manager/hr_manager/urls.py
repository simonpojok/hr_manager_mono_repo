from django.contrib import admin
from django.contrib.messages import api
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/staff/', include('staff.urls')),
    path('api/auth/', include('user_auth.urls')),
    path('api/statistics/', include('network_logger.urls')),
]
