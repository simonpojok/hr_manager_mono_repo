import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:forme/forme.dart';
import 'package:intl/intl.dart';

class DateTextInputFormField extends StatefulWidget {
  const DateTextInputFormField({
    super.key,
    required this.label,
    required this.name,
    this.placeholder = 'Select Date',
    this.validator,
  });

  final String label;
  final String placeholder;
  final String name;
  final FormeValidator? validator;

  @override
  State<DateTextInputFormField> createState() => _DateTextInputFormFieldState();
}

class _DateTextInputFormFieldState extends State<DateTextInputFormField> {
  TextEditingController textEditingController = TextEditingController();
  String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
        ),
        const SizedBox(height: 10),
        FormeField<String?>(
          validator: widget.validator ?? FormeValidates.notEmpty(),
          name: widget.name,
          builder: (FormeFieldState<String?> state) {
            return TextField(
              controller: textEditingController,
              readOnly: true,
              onTap: () async {
                final date = await showDatePickerDialog(
                  context: context,
                  minDate: DateTime(2000, 1, 1),
                  maxDate: DateTime.now(),
                );
                final updatedDate =
                    DateFormat('yyyy-MM-dd').format(date ?? DateTime.now());
                state.didChange(updatedDate);
                textEditingController.text = updatedDate;
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                suffixIcon: IconButton(
                  onPressed: () async {
                    final date = await showDatePickerDialog(
                      context: context,
                      minDate: DateTime(2000, 1, 1),
                      maxDate: DateTime.now(),
                    );
                    final updatedDate =
                        DateFormat('yyyy-MM-dd').format(date ?? DateTime.now());
                    state.didChange(updatedDate);
                    textEditingController.text = updatedDate;
                  },
                  icon: const Icon(Icons.date_range_outlined),
                ),
                hintText: widget.placeholder,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
              ),
              onChanged: (text) {
                state.didChange(text);
              },
            );
          },
          initialValue: textEditingController.text,
          onInitialized: (state) {
            textEditingController.text = DateFormat('dd-MM-yyyy').format(
              DateTime.tryParse(state.value!) ?? DateTime.now(),
            );
          },
          decorator: FormeInputDecorationDecorator(
            decorationBuilder: (context) => const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ],
    );
  }
}
