part of 'staff_detail_update_cubit.dart';

sealed class StaffDetailUpdateState extends Equatable {
  const StaffDetailUpdateState();
}

final class StaffDetailUpdateInitialState extends StaffDetailUpdateState {
  @override
  List<Object> get props => [];
}

final class StaffDetailUpdateLoadingState extends StaffDetailUpdateState {
  @override
  List<Object> get props => [];
}

final class StaffDetailUpdateSuccessState extends StaffDetailUpdateState {
  @override
  List<Object> get props => [];
}

final class StaffDetailUpdateErrorState extends StaffDetailUpdateState {
  const StaffDetailUpdateErrorState({
    required this.createStaffError,
  });

  final CreateStaffError createStaffError;

  @override
  List<Object> get props => [];
}
