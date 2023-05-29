import 'package:flutter/material.dart';
import 'package:my_reqres_login/domain/presenter/login/widgets/email_text_field.dart';
import 'package:my_reqres_login/domain/presenter/login/widgets/login_button.dart';
import 'package:my_reqres_login/domain/presenter/login/widgets/password_text_field.dart';
import 'package:my_reqres_login/domain/presenter/widgets/alert.dart';
import 'package:my_reqres_login/domain/presenter/widgets/space_vertical.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                EmailTextField(controller: _emailController),
                const SpaceVertical(),
                PasswordTextField(controller: _passwordController),
                const SpaceVertical(),
                const Alert.danger(text: "Wrong password"),
                const SpaceVertical(),
                LoginButton(onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
