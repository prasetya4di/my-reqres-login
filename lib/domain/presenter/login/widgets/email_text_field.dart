import 'package:flutter/material.dart';
import 'package:my_reqres_login/domain/presenter/widgets/bordered_text_field.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;

  const EmailTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BorderedTextField(
      label: "E-mail",
      validator: _validateEmail,
      controller: controller,
    );
  }

  String? _validateEmail(String? value) {
    const emailRegex =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    if (value != null && value.isEmpty) {
      return "Please fill your email";
    } else if (!RegExp(emailRegex).hasMatch(value!)) {
      return "Please enter a valid email";
    } else {
      return null;
    }
  }
}
