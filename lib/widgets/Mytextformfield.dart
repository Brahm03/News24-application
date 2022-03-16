import 'package:flutter/material.dart';

class MyTextformField extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final String hint;
  const MyTextformField({required this.validator,required this.controller,required this.hint,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(hintText: hint));
  }
}
