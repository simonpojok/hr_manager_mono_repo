import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hr_mobi/model/staff/staff.dart';

import '../../model/staff/create_staff_errors.dart';
import '../../repository/staff/staff_repository.dart';

part 'create_staff_screen_state.dart';

class CreateStaffScreenCubit extends Cubit<CreateStaffScreenState> {
  CreateStaffScreenCubit({
    required this.staffRepository,
  }) : super(CreateStaffScreenInitialState());

  final StaffRepository staffRepository;

  void createStaffMember({required Staff staff}) {
    emit(CreateStaffScreenLoadingState());
    staffRepository.createStaffMember(staff: staff).then((staff) {
      emit(CreateStaffScreenSuccessState(staff: staff));
    }).catchError((error, stackTrace) {
      if (error is DioException) {
        if (error.response?.statusCode == 403) {
          emit(
            const CreateStaffScreenErrorState(
              message:
                  'Many attempts made, please try again in next 10 minutes',
            ),
          );
        } else {
          emit(
            CreateStaffScreenErrorState(
              createStaffError: CreateStaffErrorResponse.fromJson(
                error.response?.data,
              ).error,
            ),
          );
        }
      }

      debugPrint(error.toString());
      debugPrintStack(stackTrace: stackTrace);
    });
  }
}
