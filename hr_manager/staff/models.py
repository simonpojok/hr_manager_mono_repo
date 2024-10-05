from django.db import models
from django.core.validators import MinLengthValidator


class Staff(models.Model):
    surname = models.CharField(max_length=100)
    other_names = models.CharField(max_length=100)
    dob = models.DateField()
    id_photo = models.TextField(null=True, blank=True)

    def __str__(self):
        return f'{self.surname}, {self.other_names}'


class AuthenticationCode(models.Model):
    unique_code = models.CharField(max_length=10, unique=True, validators=[MinLengthValidator(10)])
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.unique_code
