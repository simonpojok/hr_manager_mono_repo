// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Staff _$StaffFromJson(Map<String, dynamic> json) => Staff(
      id: (json['id'] as num?)?.toInt(),
      surname: json['surname'] as String,
      otherNames: json['other_names'] as String,
      dateOfBirth: DateTime.parse(json['dob'] as String),
      idPhoto: json['id_photo'] as String?,
    );

Map<String, dynamic> _$StaffToJson(Staff instance) => <String, dynamic>{
      'id': instance.id,
      'surname': instance.surname,
      'other_names': instance.otherNames,
      'dob': instance.dateOfBirth.toIso8601String(),
      'id_photo': instance.idPhoto,
    };
