import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme/forme.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_mobi/main.dart';
import 'package:hr_mobi/model/staff/staff.dart';
import 'package:hr_mobi/screens/staff_detail_screen/staff_detail_screen_cubit.dart';
import 'package:hr_mobi/screens/staff_detail_screen/staff_detail_update_cubit.dart';
import 'package:intl/intl.dart';

import '../../widgets/ball_scale_loading_indicator.dart';
import '../../widgets/date_text_input_form_field.dart';
import '../../widgets/file_input_form_field.dart';
import '../../widgets/global_error_state_indicator.dart';
import '../../widgets/loading_state_elevated_button.dart';
import '../../widgets/text_input_form_field.dart';
import 'create_staff_screen_cubit.dart';

class CreateStaffScreen extends StatefulWidget {
  static const path = 'create-staff';

  const CreateStaffScreen({super.key});

  @override
  State<CreateStaffScreen> createState() => _CreateStaffScreenState();
}

class _CreateStaffScreenState extends State<CreateStaffScreen> {
  final _formKey = FormeKey();
  String? base64ImageFile;

  void handleUpdateStaffDetail() {
    final createStaffScreenCubit = context.read<CreateStaffScreenCubit>();
    _formKey.validate().then((formState) {
      if (formState.isValid) {
        createStaffScreenCubit.createStaffMember(
          staff: Staff.fromJson({
            ...formState.value,
            'id_photo': base64ImageFile,
            'unique_code':
                int.tryParse(formState.value['unique_code'].toString()) ?? 0,
          }),
        );
      }
    }).catchError((error, stackTrace) {
      debugPrint(error.toString());
      debugPrintStack(stackTrace: stackTrace);
    });
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
          child: Forme(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(height: 20),
                TextInputFormField(
                  label: 'Unique Invitation',
                  hint: 'Enter Invitation Code',
                  name: 'unique_code',
                  textInputType: TextInputType.text,
                  validator: FormeValidates.notEmpty(errorText: 'Required'),
                ),
                const SizedBox(height: 20),
                TextInputFormField(
                  label: 'Surname',
                  hint: 'Enter first name',
                  name: 'surname',
                  textInputType: TextInputType.text,
                  validator: FormeValidates.notEmpty(errorText: 'Required'),
                ),
                const SizedBox(height: 20),
                TextInputFormField(
                  label: 'Other Names',
                  hint: 'Enter other names',
                  name: 'other_names',
                  textInputType: TextInputType.text,
                  validator: FormeValidates.notEmpty(errorText: 'Required'),
                ),
                const SizedBox(height: 20),
                const DateTextInputFormField(
                  label: 'Date Of Birth',
                  name: 'dob',
                ),
                const SizedBox(height: 20),
                FileInputFormField(
                  label: 'ID Photo',
                  name: 'id_photo',
                  onFileContentChanged: (base64Image) {
                    base64ImageFile = base64Image;
                  },
                ),
                const SizedBox(height: 40),
                BlocConsumer<CreateStaffScreenCubit, CreateStaffScreenState>(
                  builder: (context, staffUpdateState) {
                    return LoadingStateElevatedButton(
                      onTapped: handleUpdateStaffDetail,
                      isLoading:
                          staffUpdateState is StaffDetailUpdateLoadingState,
                      label: 'Create Staff',
                    );
                  },
                  listener: (_, state) {
                    if (state is CreateStaffScreenSuccessState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('Staff Created Successfully'),
                        ),
                      );
                      context.pop();
                    }

                    if (state is CreateStaffScreenErrorState) {
                      if (state.message != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(state.message ?? ''),
                          ),
                        );
                      }
                      if (state.createStaffError != null) {
                        for (String key
                            in state.createStaffError!.toJson().keys) {
                          _formKey.field(key).errorText =
                              (state.createStaffError!.toJson()[key]
                                      as List<String>?)
                                  ?.join(', ');
                          debugPrint(_formKey.field(key).errorText);
                        }
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
