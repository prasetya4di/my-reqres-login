import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_reqres_login/domain/presenter/util/assets.dart';
import 'package:my_reqres_login/domain/presenter/widgets/bordered_text_field.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordTextField({super.key, required this.controller});

  @override
  State<PasswordTextField> createState() => _PasswordTextField();
}

class _PasswordTextField extends State<PasswordTextField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BorderedTextField(
        suffix: _eyeIcon(isPasswordVisible, (value) {
          setState(() {
            isPasswordVisible = value;
          });
        }),
        obscureText: !isPasswordVisible,
        label: "Password",
        controller: widget.controller,
        validator: _validatePassword);
  }

  Widget _eyeIcon(bool isVisible, Function(bool) onPressed) {
    return IconButton(
      onPressed: () {
        onPressed(!isVisible);
      },
      icon: SvgPicture.asset(
          isVisible ? Assets.imagesIcEye : Assets.imagesIcEyeSlash),
    );
  }

  String? _validatePassword(String? value) {
    if (value != null && value.isEmpty) {
      return "Please fill your password";
    } else {
      return null;
    }
  }
}
