import 'package:flutter/material.dart';
import 'package:my_reqres_login/domain/presenter/login/widgets/email_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [EmailTextField()],
        ),
      ),
    );
  }
}
