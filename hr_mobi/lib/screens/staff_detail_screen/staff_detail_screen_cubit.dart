import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hr_mobi/model/staff/staff.dart';

import '../../repository/staff/staff_repository.dart';

part 'staff_detail_screen_state.dart';

class StaffDetailScreenCubit extends Cubit<StaffDetailScreenState> {
  StaffDetailScreenCubit({
    required this.staffRepository,
  }) : super(StaffDetailScreenInitialState());

  final StaffRepository staffRepository;

  void getStaffMemberDetail(int id) {
    staffRepository.getStaffMemberWithId(id).then((staff) {
      emit(StaffDetailScreenSuccessState(staffMember: staff));
    }).catchError((error, stackTrace) {
      emit(
        const StaffDetailScreenErrorState(message: 'Faild'),
      );

      debugPrint(error.toString());
      debugPrintStack(stackTrace: stackTrace);
    });
  }
}
