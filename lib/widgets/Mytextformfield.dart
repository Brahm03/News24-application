import 'package:flutter/material.dart';

class MyTextformField extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final TextInputType type;
  final String hint;
  const MyTextformField({required this.type,required this.validator,required this.controller,required this.hint,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textInputAction: TextInputAction.next,
        validator: validator,
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(hintText: hint));
  }
}
