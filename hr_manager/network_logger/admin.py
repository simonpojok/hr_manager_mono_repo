from django.contrib import admin
from .models import NetworkRequestLog


class NetworkRequestLogAdmin(admin.ModelAdmin):
    list_display = ('method', 'path', 'response_status', 'timestamp')
    search_fields = ('path', 'method', 'response_status')


admin.site.register(NetworkRequestLog, NetworkRequestLogAdmin)
