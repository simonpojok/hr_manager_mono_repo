import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hr_mobi/model/staff/staff.dart';
import 'package:hr_mobi/repository/staff/staff_repository.dart';

part 'staff_detail_update_state.dart';

class StaffDetailUpdateCubit extends Cubit<StaffDetailUpdateState> {
  StaffDetailUpdateCubit({
    required this.staffRepository,
  }) : super(StaffDetailUpdateInitialState());

  final StaffRepository staffRepository;

  void updateStaffInformation({
    required int id,
    required Staff staff,
  }) {
    emit(StaffDetailUpdateLoadingState());
    staffRepository.updateStaffMemberWithId(id: id, staff: staff).then((staff) {
      emit(StaffDetailUpdateSuccessState());
    }).catchError((error, stackTrace) {
      emit(StaffDetailUpdateErrorState());
      debugPrint(error.toString());
      debugPrintStack(stackTrace: stackTrace);
    });
  }
}
