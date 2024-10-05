part of 'staffs_screen_cubit.dart';

sealed class StaffsScreenState extends Equatable {
  const StaffsScreenState();
}

final class StaffsScreenInitialState extends StaffsScreenState {
  @override
  List<Object> get props => [];
}

final class StaffsScreenLoadingState extends StaffsScreenState {
  @override
  List<Object> get props => [];
}

final class StaffsScreenSuccessState extends StaffsScreenState {
  const StaffsScreenSuccessState({required this.staffs});

  final List<Staff> staffs;

  @override
  List<Object> get props => [];
}

final class StaffsScreenErrorState extends StaffsScreenState {
  const StaffsScreenErrorState({required this.message});

  final String message;

  @override
  List<Object> get props => [];
}
