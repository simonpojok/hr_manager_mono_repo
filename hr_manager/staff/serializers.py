from rest_framework import serializers
from .models import Staff, AuthenticationCode


class GeneralResponseSerializer(serializers.Serializer):
    status = serializers.CharField(max_length=10)
    message = serializers.CharField(max_length=255)
    data = serializers.JSONField(required=False, allow_null=True)
    error = serializers.JSONField(required=False, allow_null=True)


# noinspection PyMethodMayBeStatic
class CreateStaffSerializer(serializers.ModelSerializer):
    unique_code = serializers.CharField(max_length=10, min_length=10, write_only=True)

    def validate_unique_code(self, value):
        try:
            AuthenticationCode.objects.get(unique_code=value)
            return value

        except AuthenticationCode.DoesNotExist:
            raise serializers.ValidationError("Invalid code")

    def create(self, validated_data):
        actual_validated_data = validated_data.copy()
        del actual_validated_data['unique_code']

        staff = Staff.objects.create(**actual_validated_data)
        user_code = AuthenticationCode.objects.get(unique_code=validated_data['unique_code'])
        user_code.delete()
        return staff

    class Meta:
        model = Staff
        fields = '__all__'


class UpdateStaffSerializer(serializers.ModelSerializer):
    class Meta:
        model = Staff
        fields = '__all__'
