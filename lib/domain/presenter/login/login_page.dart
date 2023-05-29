import 'package:flutter/material.dart';
import 'package:my_reqres_login/domain/presenter/login/widgets/email_text_field.dart';
import 'package:my_reqres_login/domain/presenter/login/widgets/password_text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            EmailTextField(controller: _emailController),
            PasswordTextField(controller: _passwordController),
          ],
        ),
      ),
    );
  }
}
