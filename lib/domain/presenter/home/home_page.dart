import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int userId;

  const HomePage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Column(
        children: [],
      )),
    );
  }
}
