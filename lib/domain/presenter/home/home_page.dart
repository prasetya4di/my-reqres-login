import 'package:flutter/material.dart';
import 'package:my_reqres_login/domain/presenter/home/model/home_page_argument.dart';

class HomePage extends StatelessWidget {
  final HomePageArgument argument;

  const HomePage({super.key, required this.argument});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [Text("email@email.com"), Text("First name Last name")],
          ),
        ),
      ),
    );
  }
}
