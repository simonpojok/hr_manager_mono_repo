import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hr_mobi/model/staff/staff.dart';
import 'package:hr_mobi/repository/staff/staff_repository.dart';
import 'package:hr_mobi/screens/staff_detail_screen/staff_detail_screen_cubit.dart';

import '../../model/staff/create_staff_errors.dart';

part 'staff_detail_update_state.dart';

class StaffDetailUpdateCubit extends Cubit<StaffDetailUpdateState> {
  StaffDetailUpdateCubit({
    required this.staffRepository,
    required this.staffDetailScreenCubit,
  }) : super(StaffDetailUpdateInitialState());

  final StaffRepository staffRepository;
  final StaffDetailScreenCubit staffDetailScreenCubit;

  void updateStaffInformation({
    required int id,
    required Staff staff,
  }) {
    emit(StaffDetailUpdateLoadingState());
    staffRepository.updateStaffMemberWithId(id: id, staff: staff).then((staff) {
      staffDetailScreenCubit.updateStaffDetail(staff);
      emit(StaffDetailUpdateSuccessState());
    }).catchError((error, stackTrace) {
      if (error is DioException) {
        emit(
          StaffDetailUpdateErrorState(
            createStaffError: CreateStaffErrorResponse.fromJson(
              error.response?.data,
            ).error,
          ),
        );
      }

      debugPrint(error.toString());
      debugPrintStack(stackTrace: stackTrace);
    });
  }
}
