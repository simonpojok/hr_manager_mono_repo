// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_staff_errors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateStaffError _$CreateStaffErrorFromJson(Map<String, dynamic> json) =>
    CreateStaffError(
      uniqueCode: (json['unique_code'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      surname:
          (json['surname'] as List<dynamic>?)?.map((e) => e as String).toList(),
      otherNames: (json['other_names'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      dateOfBirth:
          (json['dob'] as List<dynamic>?)?.map((e) => e as String).toList(),
      idPhoto: (json['id_photo'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CreateStaffErrorToJson(CreateStaffError instance) =>
    <String, dynamic>{
      'unique_code': instance.uniqueCode,
      'surname': instance.surname,
      'other_names': instance.otherNames,
      'dob': instance.dateOfBirth,
      'id_photo': instance.idPhoto,
    };

CreateStaffErrorResponse _$CreateStaffErrorResponseFromJson(
        Map<String, dynamic> json) =>
    CreateStaffErrorResponse(
      error: CreateStaffError.fromJson(json['error'] as Map<String, dynamic>),
      status: json['status'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$CreateStaffErrorResponseToJson(
        CreateStaffErrorResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'error': instance.error.toJson(),
    };
