import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:forme/forme.dart';
import 'package:image_picker/image_picker.dart';

class FileInputFormField extends StatefulWidget {
  const FileInputFormField({
    super.key,
    required this.label,
    required this.name,
    this.validator,
    this.onFileContentChanged,
  });

  final String label;
  final String name;
  final FormeValidator? validator;
  final Function(String?)? onFileContentChanged;

  @override
  State<FileInputFormField> createState() => _FileInputFormFieldState();
}

class _FileInputFormFieldState extends State<FileInputFormField> {
  TextEditingController textEditingController = TextEditingController();
  final ImagePicker picker = ImagePicker();

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
          validator: widget.validator,
          name: widget.name,
          builder: (FormeFieldState<String?> state) {
            textEditingController.text =
                state.value == null ? 'No File Attached' : 'File Attached';

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: textEditingController,
                  readOnly: true,
                  onTap: () async {
                    final tempFile = await picker.pickImage(
                      source: ImageSource.gallery,
                    );

                    if (tempFile != null) {
                      final file = File(tempFile.path);
                      final bytes = await file.readAsBytes();
                      final base64String = base64Encode(bytes);
                      if (widget.onFileContentChanged != null) {
                        widget.onFileContentChanged!(base64String);
                      }
                      state.didChange(base64String);
                    }
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () async {
                        final tempFile = await picker.pickImage(
                          source: ImageSource.gallery,
                        );

                        if (tempFile != null) {
                          final file = File(tempFile.path);
                          final bytes = await file.readAsBytes();
                          final base64String = base64Encode(bytes);
                          if (widget.onFileContentChanged != null) {
                            widget.onFileContentChanged!(base64String);
                          }
                          state.didChange(base64String);
                        }
                      },
                      icon: const Icon(Icons.file_present_sharp),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                  ),
                  style: Theme.of(context)
                      .inputDecorationTheme
                      .labelStyle
                      ?.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                ),
                const SizedBox(height: 20),
                if (state.value != null && state.value!.isNotEmpty) ...[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: MemoryImage(
                          base64Decode(state.value!),
                        ),
                        fit: BoxFit.contain,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 120,
                    width: 180,
                  ),
                ],
              ],
            );
          },
          initialValue: null,
        ),
      ],
    );
  }
}
