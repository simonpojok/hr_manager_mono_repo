import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'staff.g.dart';

@JsonSerializable()
class Staff {
  @JsonKey(name: 'unique_code')
  final int? uniqueCode;
  final int? id;
  final String surname;
  @JsonKey(name: 'other_names')
  final String otherNames;
  @JsonKey(name: 'dob')
  final String dateOfBirth;
  @JsonKey(name: 'id_photo')
  final String? idPhoto;

  String get fullName => '$surname, $otherNames';

  String get actualDateOfBirth => DateFormat('dd MMM yyyy').format(
        DateTime.tryParse(dateOfBirth) ?? DateTime.now(),
      );

  const Staff({
    this.uniqueCode,
    this.id,
    required this.surname,
    required this.otherNames,
    required this.dateOfBirth,
    this.idPhoto,
  });

  factory Staff.fromJson(Map<String, dynamic> json) => _$StaffFromJson(json);

  Map<String, dynamic> toJson() => _$StaffToJson(this);
}
