import 'package:flutter/material.dart';

class TextEmail extends StatelessWidget {
  final String email;

  const TextEmail({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Text(email);
  }
}
