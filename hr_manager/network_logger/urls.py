from django.urls import path
from .views import NetworkRequestLogStatsView

urlpatterns = [
    path('requests', NetworkRequestLogStatsView.as_view(), name='request_statistics'),
]