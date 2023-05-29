import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_reqres_login/domain/presenter/login/bloc/login_bloc.dart';
import 'package:my_reqres_login/domain/presenter/login/bloc/login_state.dart';
import 'package:my_reqres_login/domain/presenter/login/widgets/email_text_field.dart';
import 'package:my_reqres_login/domain/presenter/login/widgets/login_button.dart';
import 'package:my_reqres_login/domain/presenter/login/widgets/password_text_field.dart';
import 'package:my_reqres_login/domain/presenter/widgets/alert.dart';
import 'package:my_reqres_login/domain/presenter/widgets/space_vertical.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();

    return Scaffold(
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocConsumer<LoginBloc, LoginState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      EmailTextField(controller: _emailController),
                      const SpaceVertical(),
                      PasswordTextField(controller: _passwordController),
                      const SpaceVertical(),
                      if (state is LoginErrorState)
                        Alert.danger(text: state.message),
                      const SpaceVertical(),
                      LoginButton(
                          onPressed: state is LoginLoadingState
                              ? null
                              : () {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    bloc.add(LoginEvent.onLogin(
                                        _emailController.value.text,
                                        _passwordController.value.text));
                                  }
                                }),
                    ],
                  );
                },
                listener: (context, state) {},
              )),
        ),
      ),
    );
  }
}
