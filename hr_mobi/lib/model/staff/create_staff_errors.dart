import 'package:json_annotation/json_annotation.dart';

part 'create_staff_errors.g.dart';

@JsonSerializable()
class CreateStaffError {
  @JsonKey(name: 'unique_code')
  final List<String>? uniqueCode;
  final List<String>? surname;
  @JsonKey(name: 'other_names')
  final List<String>? otherNames;
  @JsonKey(name: 'dob')
  final List<String>? dateOfBirth;
  @JsonKey(name: 'id_photo')
  final List<String>? idPhoto;

  const CreateStaffError({
    this.uniqueCode,
    this.surname,
    this.otherNames,
    this.dateOfBirth,
    this.idPhoto,
  });

  factory CreateStaffError.fromJson(Map<String, dynamic> json) =>
      _$CreateStaffErrorFromJson(json);

  Map<String, dynamic> toJson() => _$CreateStaffErrorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateStaffErrorResponse {
  final String status;
  final String message;
  final CreateStaffError error;

  const CreateStaffErrorResponse({
    required this.error,
    required this.status,
    required this.message,
  });

  factory CreateStaffErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateStaffErrorResponseFromJson(json);
}
