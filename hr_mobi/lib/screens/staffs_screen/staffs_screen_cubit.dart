import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hr_mobi/model/staff/staff.dart';

import '../../repository/staff/staff_repository.dart';

part 'staffs_screen_state.dart';

class StaffsScreenCubit extends Cubit<StaffsScreenState> {
  StaffsScreenCubit({
    required this.staffRepository,
  }) : super(StaffsScreenInitialState());

  final StaffRepository staffRepository;

  void getCompanyStaffs() {
    emit(StaffsScreenLoadingState());
    staffRepository.getStaffLists().then((staffs) {
      emit(StaffsScreenSuccessState(staffs: staffs));
    }).catchError((error, stackTrace) {
      emit(const StaffsScreenErrorState(message: 'Error Occurred'));
      debugPrint(error.toString());
      debugPrintStack(stackTrace: stackTrace);
    });
  }
}
