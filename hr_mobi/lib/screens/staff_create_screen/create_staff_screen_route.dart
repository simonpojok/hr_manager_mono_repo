import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'create_staff_screen.dart';
import 'create_staff_screen_cubit.dart';

final createStaffScreenRoute = GoRoute(
  path: CreateStaffScreen.path,
  builder: (context, state) {
    return BlocProvider(
      create: (context) => CreateStaffScreenCubit(
        staffRepository: context.read(),
      ),
      child: const CreateStaffScreen(),
    );
  },
);
