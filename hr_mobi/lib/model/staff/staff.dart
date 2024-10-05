import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'staff.g.dart';

@JsonSerializable()
class Staff {
  final int? id;
  final String surname;
  @JsonKey(name: 'other_names')
  final String otherNames;
  @JsonKey(name: 'dob')
  final DateTime dateOfBirth;
  @JsonKey(name: 'id_photo')
  final String? idPhoto;

  String get fullName => '$surname, $otherNames';

  String get actualDateOfBirth => DateFormat('dd MMM yyyy').format(dateOfBirth);

  const Staff({
    this.id,
    required this.surname,
    required this.otherNames,
    required this.dateOfBirth,
    this.idPhoto,
  });

  factory Staff.fromJson(Map<String, dynamic> json) => _$StaffFromJson(json);

  Map<String, dynamic> toJson() => _$StaffToJson(this);
}
