from django.contrib import admin
from staff.models import Staff, AuthenticationCode


class StaffAdmin(admin.ModelAdmin):
    list_display = ('id', 'surname', 'other_names')
    search_fields = ('surname', 'other_names')


class AuthenticationCodeAdmin(admin.ModelAdmin):
    list_display = ('id', 'unique_code', 'created_at')
    search_fields = ('unique_code', 'created_at')


admin.site.register(Staff, StaffAdmin)
admin.site.register(AuthenticationCode, AuthenticationCodeAdmin)
