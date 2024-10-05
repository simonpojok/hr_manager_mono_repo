import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'staff_detail_update_state.dart';

class StaffDetailUpdateCubit extends Cubit<StaffDetailUpdateState> {
  StaffDetailUpdateCubit() : super(StaffDetailUpdateInitialState());
}
