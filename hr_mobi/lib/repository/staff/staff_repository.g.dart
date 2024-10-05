// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStaffListResponse _$GetStaffListResponseFromJson(
        Map<String, dynamic> json) =>
    GetStaffListResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => Staff.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetStaffListResponseToJson(
        GetStaffListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

GetStaffMemberResponse _$GetStaffMemberResponseFromJson(
        Map<String, dynamic> json) =>
    GetStaffMemberResponse(
      data: Staff.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetStaffMemberResponseToJson(
        GetStaffMemberResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
