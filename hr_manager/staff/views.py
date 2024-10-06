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
