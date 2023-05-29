import 'package:flutter/material.dart';

class LabelMedium extends StatelessWidget {
  final String label;

  const LabelMedium({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(label, style: Theme.of(context).textTheme.labelMedium);
  }
}
