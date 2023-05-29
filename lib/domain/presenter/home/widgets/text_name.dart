import 'package:flutter/material.dart';

class TextName extends StatelessWidget {
  final String firstName;
  final String lastName;

  const TextName({super.key, required this.firstName, required this.lastName});

  @override
  Widget build(BuildContext context) {
    return Text("$firstName $lastName");
  }
}
