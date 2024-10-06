from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView
from rest_framework.pagination import PageNumberPagination
from django.db.models import Count, Q
from .models import NetworkRequestLog
from .serializers import NetworkRequestLogSerializer

class NetworkRequestLogStatsView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request, *args, **kwargs):
        failed_requests_count = NetworkRequestLog.objects.filter(response_status__gte=400).count()

        successful_requests_count = NetworkRequestLog.objects.filter(response_status__range=(200, 299)).count()

        total_requests_count = NetworkRequestLog.objects.count()

        requests_by_method = NetworkRequestLog.objects.values('method').annotate(count=Count('id')).order_by('method')

        paginator = PageNumberPagination()
        paginator.page_size = 20
        requests_queryset = NetworkRequestLog.objects.order_by('-timestamp')
        paginated_requests = paginator.paginate_queryset(requests_queryset, request)

        serializer = NetworkRequestLogSerializer(paginated_requests, many=True)

        response_data = {
            'failed_requests_count': failed_requests_count,
            'successful_requests_count': successful_requests_count,
            'total_requests_count': total_requests_count,
            'requests_by_method': list(requests_by_method),
            'requests': serializer.data
        }

        return paginator.get_paginated_response(response_data)