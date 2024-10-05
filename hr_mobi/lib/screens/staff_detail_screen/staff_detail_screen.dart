import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme/forme.dart';
import 'package:hr_mobi/model/staff/staff.dart';
import 'package:hr_mobi/screens/staff_detail_screen/staff_detail_screen_cubit.dart';
import 'package:hr_mobi/screens/staff_detail_screen/staff_detail_update_cubit.dart';

import '../../widgets/ball_scale_loading_indicator.dart';
import '../../widgets/date_text_input_form_field.dart';
import '../../widgets/file_input_form_field.dart';
import '../../widgets/global_error_state_indicator.dart';
import '../../widgets/loading_state_elevated_button.dart';
import '../../widgets/text_input_form_field.dart';

class StaffDetailScreen extends StatefulWidget {
  static const path = 'staff-detail';

  static String buildPath(Staff staff) => 'staff-detail?staff_id=${staff.id}';

  const StaffDetailScreen({
    super.key,
    this.staffId,
  });

  final int? staffId;

  @override
  State<StaffDetailScreen> createState() => _StaffDetailScreenState();
}

class _StaffDetailScreenState extends State<StaffDetailScreen> {
  final _formKey = FormeKey();

  @override
  void initState() {
    if (widget.staffId != null) {
      context
          .read<StaffDetailScreenCubit>()
          .getStaffMemberDetail(widget.staffId!);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Stuff'),
        elevation: 2,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocBuilder<StaffDetailScreenCubit, StaffDetailScreenState>(
            builder: (context, state) {
              return switch (state) {
                StaffDetailScreenInitialState() => const LoadingIndicator(),
                StaffDetailScreenLoadingState() => const LoadingIndicator(),
                StaffDetailScreenErrorState() => GlobalErrorStateIndicator(
                    message: state.message,
                  ),
                StaffDetailScreenSuccessState() => Forme(
                    key: _formKey,
                    initialValue: state.staffMember.toJson(),
                    child: ListView(
                      children: [
                        const SizedBox(height: 20),
                        TextInputFormField(
                          label: 'Surname',
                          hint: 'Enter first name',
                          name: 'surname',
                          textInputType: TextInputType.text,
                          validator:
                              FormeValidates.notEmpty(errorText: 'Required'),
                        ),
                        const SizedBox(height: 20),
                        TextInputFormField(
                          label: 'Other Names',
                          hint: 'Enter other names',
                          name: 'other_names',
                          textInputType: TextInputType.text,
                          validator:
                              FormeValidates.notEmpty(errorText: 'Required'),
                        ),
                        const SizedBox(height: 20),
                        const DateTextInputFormField(
                          label: 'Date Of Birth',
                          name: 'dob',
                        ),
                        const SizedBox(height: 20),
                        const FileInputFormField(
                          label: 'ID Photo',
                          name: 'photo_file',
                        ),
                        const SizedBox(height: 40),
                        BlocBuilder<StaffDetailUpdateCubit,
                            StaffDetailUpdateState>(
                          builder: (context, state) {
                            return LoadingStateElevatedButton(
                              onTapped: () {},
                              isLoading: state is StaffDetailUpdateSuccessState,
                              label: 'UPDATE ROLE',
                            );
                          },
                        )
                      ],
                    ),
                  )
              };
            },
          ),
        ),
      ),
    );
  }
}
