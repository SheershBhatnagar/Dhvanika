import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;

  TextInputType inputType;

  bool obscureText;

  Icon? prefixIcon;
  Icon? suffixIcon;

  final FormFieldValidator<String>? validator;

  TextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: true,
      obscureText: obscureText,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 2,
            color: Colors.black,
          ),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      validator: validator,
    );
  }
}
