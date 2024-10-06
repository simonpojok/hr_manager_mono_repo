from django.db import models

class NetworkRequestLog(models.Model):
    method = models.CharField(max_length=10)
    path = models.CharField(max_length=255)
    body = models.TextField(null=True, blank=True)
    response_status = models.IntegerField()
    response_body = models.TextField(null=True, blank=True)
    timestamp = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.method} {self.path} at {self.timestamp}"