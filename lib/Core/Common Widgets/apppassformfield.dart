import 'package:flutter/material.dart';

class AppPassFormField extends StatefulWidget {
  const AppPassFormField({
    super.key,
    required this.title,
    this.keyboardType = TextInputType.text,
    this.suffix
  });
  final String title;
  final Icon? suffix;
  final TextInputType keyboardType;

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
                  ? Icon(Icons.visibility_off_outlined)
                  : Icon(Icons.remove_red_eye_rounded),
            ),
        hintText: widget.title,
      ),
      onTapUpOutside: (event){
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
