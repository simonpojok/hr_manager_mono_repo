import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_mobi/screens/staffs_screen/staffs_screen_cubit.dart';
import 'package:hr_mobi/widgets/context_extension_path.dart';

import '../../widgets/ball_scale_loading_indicator.dart';
import '../../widgets/empty_list_view.dart';
import '../staff_create_screen/create_staff_screen.dart';
import '../staff_detail_screen/staff_detail_screen.dart';

class StaffsScreen extends StatefulWidget {
  static const path = '/';

  const StaffsScreen({super.key});

  @override
  State<StaffsScreen> createState() => _StaffsScreenState();
}

class _StaffsScreenState extends State<StaffsScreen> {
  @override
  void initState() {
    context.read<StaffsScreenCubit>().getCompanyStaffs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Staffs'),
        elevation: 2,
        actions: [
          IconButton(
            onPressed: () {
              context.go('${context.currentPath}/${CreateStaffScreen.path}');
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<StaffsScreenCubit>().getCompanyStaffs();
          },
          child: BlocBuilder<StaffsScreenCubit, StaffsScreenState>(
            builder: (context, state) {
              return switch (state) {
                StaffsScreenInitialState() => const LoadingIndicator(),
                StaffsScreenLoadingState() => const LoadingIndicator(),
                StaffsScreenSuccessState() =>
                  ListViewUtils.separatedWithEmptyView(
                    separatorBuilder: (_, i) => const Divider(),
                    itemBuilder: (context, item) => ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person),
                      ),
                      onTap: () {
                        context.go(
                          '${context.currentPath}/${StaffDetailScreen.buildPath(item)}',
                        );
                      },
                      title: Text(item.fullName),
                      subtitle: Row(
                        children: [
                          const Icon(Icons.calendar_month, size: 18),
                          const SizedBox(width: 10),
                          Text(item.actualDateOfBirth),
                        ],
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                    items: state.staffs,
                  ),
                StaffsScreenErrorState() => const LoadingIndicator(),
              };
            },
          ),
        ),
      ),
    );
  }
}
