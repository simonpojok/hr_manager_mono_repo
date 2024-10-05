part of 'staff_detail_screen_cubit.dart';

sealed class StaffDetailScreenState extends Equatable {
  const StaffDetailScreenState();
}

final class StaffDetailScreenInitialState extends StaffDetailScreenState {
  @override
  List<Object> get props => [];
}

final class StaffDetailScreenLoadingState extends StaffDetailScreenState {
  @override
  List<Object> get props => [];
}

final class StaffDetailScreenSuccessState extends StaffDetailScreenState {
  const StaffDetailScreenSuccessState({
    required this.staffMember,
  });

  final Staff staffMember;

  @override
  List<Object> get props => [staffMember];
}

final class StaffDetailScreenErrorState extends StaffDetailScreenState {
  const StaffDetailScreenErrorState({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [];
}
