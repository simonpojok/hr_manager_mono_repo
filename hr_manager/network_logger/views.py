from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView
from rest_framework.pagination import PageNumberPagination
from django.db.models import Count, Q
from .models import NetworkRequestLog
from .serializers import NetworkRequestLogSerializer

class NetworkRequestLogStatsView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request, *args, **kwargs):
        # 1. Total number of failed requests (status code >= 400)
        failed_requests_count = NetworkRequestLog.objects.filter(response_status__gte=400).count()

        # 2. Total number of successful requests (status code between 200 and 299)
        successful_requests_count = NetworkRequestLog.objects.filter(response_status__range=(200, 299)).count()

        # 3. Total number of all requests made so far
        total_requests_count = NetworkRequestLog.objects.count()

        # 4. Requests per HTTP method (GET, POST, etc.)
        requests_by_method = NetworkRequestLog.objects.values('method').annotate(count=Count('id')).order_by('method')

        # 5. Paginate the first 20 requests and provide an option to paginate in a range of 30 requests
        paginator = PageNumberPagination()
        paginator.page_size = 20  # First 20 requests on first page
        requests_queryset = NetworkRequestLog.objects.order_by('-timestamp')  # Order by timestamp, most recent first
        paginated_requests = paginator.paginate_queryset(requests_queryset, request)

        # Serialize the paginated requests
        serializer = NetworkRequestLogSerializer(paginated_requests, many=True)

        # Response data
        response_data = {
            'failed_requests_count': failed_requests_count,
            'successful_requests_count': successful_requests_count,
            'total_requests_count': total_requests_count,
            'requests_by_method': list(requests_by_method),
            'requests': serializer.data  # Paginated list of requests
        }

        return paginator.get_paginated_response(response_data)