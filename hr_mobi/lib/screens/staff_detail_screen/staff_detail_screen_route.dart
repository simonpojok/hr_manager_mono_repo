import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_mobi/screens/staff_detail_screen/staff_detail_screen.dart';
import 'package:hr_mobi/screens/staff_detail_screen/staff_detail_screen_cubit.dart';
import 'package:hr_mobi/screens/staff_detail_screen/staff_detail_update_cubit.dart';

final staffDetailScreenRoute = GoRoute(
  path: StaffDetailScreen.path,
  builder: (BuildContext context, GoRouterState state) {
    final staffId =
        int.tryParse(state.uri.queryParameters['staff_id'].toString());

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StaffDetailUpdateCubit(
            staffRepository: context.read(),
          ),
        ),
        BlocProvider(
          create: (context) => StaffDetailScreenCubit(
            staffRepository: context.read(),
          ),
        )
      ],
      child: StaffDetailScreen(
        staffId: staffId,
      ),
    );
  },
);
