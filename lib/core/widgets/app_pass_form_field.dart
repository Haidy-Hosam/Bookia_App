import 'package:flutter/material.dart';

class AppPassFormField extends StatefulWidget {
  const AppPassFormField({
    super.key,
    required this.title,
    this.keyboardType = TextInputType.text,
    this.suffix,
    this.controller,
    this.validator,
  });
  final String title;
  final Icon? suffix;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  State<AppPassFormField> createState() => _AppPassFormFieldState();
}

class _AppPassFormFieldState extends State<AppPassFormField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        suffixIcon:
            widget.suffix ??
            IconButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              icon: obscureText
                  ? const Icon(Icons.visibility_off_outlined)
                  : const Icon(Icons.remove_red_eye_rounded),
            ),
        hintText: widget.title,
      ),
      controller: widget.controller,
      // onTapUpOutside: (event){
      //   FocusManager.instance.primaryFocus?.un();
      // },
      onTapUpOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
