import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final bool isObscureText;
  final TextEditingController controller;
  const AuthField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.isObscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "$value is missing";
        } else {
          return null;
        }
      },
      obscureText: isObscureText,
    );
  }
}
