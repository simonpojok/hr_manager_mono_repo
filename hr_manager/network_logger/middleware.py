import json
from django.utils.deprecation import MiddlewareMixin

from network_logger.models import NetworkRequestLog


# noinspection PyMethodMayBeStatic
class RequestResponseLoggingMiddleware(MiddlewareMixin):

    def process_request(self, request):
        if request.method in ['POST', 'PUT', 'PATCH', 'DELETE']:
            body = request.body.decode('utf-8') if request.body else ''
        else:
            body = ''

        request.log_data = {
            'method': request.method,
            'path': request.get_full_path(),
            'body': body,
        }

    def process_response(self, request, response):
        if '/api/staff/' in request.get_full_path() :
            NetworkRequestLog.objects.create(
                method=request.log_data['method'],
                path=request.log_data['path'],
                body=request.log_data['body'],
                response_status=response.status_code,
                response_body=response.content.decode('utf-8') if response.content else ''
            )

        return response
