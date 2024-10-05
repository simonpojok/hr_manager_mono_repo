import 'package:flutter/material.dart';
import 'package:forme/forme.dart';
import 'package:forme_base_fields/field/material/forme_text_field.dart';

class TextInputFormField extends StatelessWidget {
  const TextInputFormField({
    super.key,
    this.lineNumber = 1,
    required this.label,
    this.hint,
    required this.name,
    this.errorMessage = 'Invalid input(Required)',
    this.textInputType,
    this.validator,
    this.enabled = true,
    this.initialValue,
    this.readOnly,
  });

  final int lineNumber;
  final String label;
  final String? hint;
  final String name;
  final String errorMessage;
  final TextInputType? textInputType;
  final String? Function(FormeFieldState<String>, String)? validator;
  final bool enabled;
  final String? initialValue;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 10), // Adjusted to match MoneyInputFormField
        FormeTextField(
          readOnly: readOnly ?? false,
          validator: validator,
          enabled: enabled,
          name: name,
          initialValue: initialValue ?? '',
          // Use default empty string if initialValue is null
          maxLines: lineNumber,
          keyboardType: textInputType,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            enabled: enabled,
            border: const OutlineInputBorder(),
            hintText: hint ?? '',
            hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontSize: 14,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
          ),
        ),
      ],
    );
  }
}
