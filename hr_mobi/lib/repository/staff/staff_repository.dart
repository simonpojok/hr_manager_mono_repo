import 'package:dio/dio.dart';
import 'package:hr_mobi/model/staff/staff.dart';
import 'package:json_annotation/json_annotation.dart';

part 'staff_repository.g.dart';

class StaffRepository {
  const StaffRepository({required this.dio});

  final Dio dio;

  Future<List<Staff>> getStaffLists() async {
    final response = await dio.get('/api/staff/retrieve');
    return GetStaffListResponse.fromJson(response.data).data;
  }

  Future<Staff> getStaffMemberWithId(int id) async {
    final response = await dio.get('/api/staff/retrieve/$id');
    return GetStaffMemberResponse.fromJson(response.data).data;
  }
}

@JsonSerializable()
class GetStaffListResponse {
  final String status;
  final String message;
  final List<Staff> data;

  const GetStaffListResponse({
    required this.data,
    required this.status,
    required this.message,
  });

  factory GetStaffListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetStaffListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetStaffListResponseToJson(this);
}

@JsonSerializable()
class GetStaffMemberResponse {
  final String status;
  final String message;
  final Staff data;

  const GetStaffMemberResponse({
    required this.data,
    required this.status,
    required this.message,
  });

  factory GetStaffMemberResponse.fromJson(Map<String, dynamic> json) =>
      _$GetStaffMemberResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetStaffMemberResponseToJson(this);
}
