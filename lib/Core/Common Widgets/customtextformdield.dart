import 'package:flutter/material.dart';

class customtextformdield extends StatelessWidget {
  const customtextformdield({
    super.key,
    required this.controller,
    this.hintText,
    this.label,
    this.maxLines = 4,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? label;
  final int maxLines;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(hintText: hintText, labelText: label),
      onTapUpOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
