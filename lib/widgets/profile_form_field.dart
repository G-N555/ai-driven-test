import 'package:flutter/material.dart';

class ProfileFormField extends StatelessWidget {
  final String initialValue;
  final String labelText;
  final int maxLines;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  const ProfileFormField({
    super.key,
    required this.initialValue,
    required this.labelText,
    this.maxLines = 1,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      maxLines: maxLines,
      validator: validator,
      onSaved: onSaved,
    );
  }
}
