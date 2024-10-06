from rest_framework import serializers
from .models import  NetworkRequestLog


class NetworkRequestLogSerializer(serializers.ModelSerializer):
    class Meta:
        model = NetworkRequestLog
        fields = ['id', 'method', 'path', 'response_status', 'timestamp']