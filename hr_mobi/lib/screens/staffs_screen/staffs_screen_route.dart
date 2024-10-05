import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_mobi/screens/staffs_screen/staffs_screen.dart';
import 'package:hr_mobi/screens/staffs_screen/staffs_screen_cubit.dart';

import '../staff_create_screen/create_staff_screen_route.dart';
import '../staff_detail_screen/staff_detail_screen_route.dart';

final staffsScreenRoute = GoRoute(
  path: StaffsScreen.path,
  builder: (BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => StaffsScreenCubit(
        staffRepository: context.read(),
      ),
      child: const StaffsScreen(),
    );
  },
  routes: [
    staffDetailScreenRoute,
    createStaffScreenRoute,
  ],
);
