part of 'create_staff_screen_cubit.dart';

sealed class CreateStaffScreenState extends Equatable {
  const CreateStaffScreenState();
}

final class CreateStaffScreenInitialState extends CreateStaffScreenState {
  @override
  List<Object> get props => [];
}

final class CreateStaffScreenLoadingState extends CreateStaffScreenState {
  @override
  List<Object> get props => [];
}

final class CreateStaffScreenSuccessState extends CreateStaffScreenState {
  const CreateStaffScreenSuccessState({
    required this.staff,
  });

  final Staff staff;

  @override
  List<Object> get props => [];
}

final class CreateStaffScreenErrorState extends CreateStaffScreenState {
  const CreateStaffScreenErrorState({
    required this.createStaffError,
  });

  final CreateStaffError createStaffError;

  @override
  List<Object> get props => [];
}
