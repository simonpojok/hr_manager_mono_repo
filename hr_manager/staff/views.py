from django.shortcuts import render, redirect
from .models import AuthenticationCode
import random
import string
from django_ratelimit.decorators import ratelimit
from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Staff
from .serializers import CreateStaffSerializer, GeneralResponseSerializer, UpdateStaffSerializer
import random


@ratelimit(key='ip', rate='5/m', method='POST', block=True)
@api_view(['POST'])
def register_staff(request):
    serializer = CreateStaffSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        general_response = GeneralResponseSerializer({
            'status': 'success',
            'message': 'Staff registered successfully',
            'data': serializer.data,
            'error': None,
        })
        return Response(general_response.data, status=status.HTTP_201_CREATED)

    general_response = GeneralResponseSerializer({
        'status': 'error',
        'message': 'Request Failed',
        'error': serializer.errors,
        'data': None,
    })
    return Response(general_response.data, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET'])
def retrieve_staff(request, staff_id=None):
    if staff_id:
        try:
            staff = Staff.objects.get(id=staff_id)
            serializer = CreateStaffSerializer(staff)
            general_response = GeneralResponseSerializer({
                'status': 'success',
                'message': 'Staff retrieved successfully',
                'data': serializer.data,
                'error': None,
            })
            return Response(general_response.data, status=status.HTTP_200_OK)
        except Staff.DoesNotExist:
            general_response = GeneralResponseSerializer({
                'status': 'error',
                'message': 'Staff Not Found',
                'data': None,
                'error': None,
            })

            return Response(general_response.data, status=status.HTTP_404_NOT_FOUND)
    else:
        staff = Staff.objects.all()
        serializer = CreateStaffSerializer(staff, many=True)
        general_response = GeneralResponseSerializer({
            'status': 'success',
            'message': 'Staffs retrieved successfully',
            'data': serializer.data,
            'error': None,
        })
        return Response(general_response.data, status=status.HTTP_200_OK)


@api_view(['PUT', 'PATCH'])
def update_staff(request, staff_id=None):
    try:
        staff = Staff.objects.get(id=staff_id)
    except Staff.DoesNotExist:
        general_response = GeneralResponseSerializer({
            'status': 'error',
            'message': 'Staff Not Found',
            'data': None,
            'error': None,
        })

        return Response(general_response.data, status=status.HTTP_404_NOT_FOUND)

    serializer = UpdateStaffSerializer(staff, data=request.data, partial=True)

    if serializer.is_valid():
        serializer.save()
        general_response = GeneralResponseSerializer({
            'status': 'success',
            'message': 'Staff updated successfully',
            'data': serializer.data,
            'error': None,
        })
        return Response(general_response.data, status=status.HTTP_200_OK)

    general_response = GeneralResponseSerializer({
        'status': 'error',
        'message': 'Request Failed',
        'error': serializer.errors,
        'data': None,
    })
    return Response(general_response.data, status=status.HTTP_400_BAD_REQUEST)


def generate_unique_code():
    return ''.join(random.choices('0123456789', k=10))

def unique_code_view(request):
    code_obj = AuthenticationCode.objects.order_by('-created_at').first()
    current_code = code_obj.unique_code if code_obj else "No code generated yet."

    if request.method == "POST":
        new_code = generate_unique_code()
        AuthenticationCode.objects.create(unique_code=new_code)
        return redirect('unique_code')

    return render(request, 'unique_code_template.html', {'current_code': current_code})

def custom_404_view(request, exception):
    return render(request, '404.html', status=404)