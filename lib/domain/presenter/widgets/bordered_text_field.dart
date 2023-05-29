import 'package:flutter/material.dart';
import 'package:my_reqres_login/domain/presenter/util/asset_colors.dart';
import 'package:my_reqres_login/domain/presenter/widgets/label_medium.dart';
import 'package:my_reqres_login/domain/presenter/widgets/space_vertical.dart';

class BorderedTextField extends StatefulWidget {
  final String label;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final Function(String?)? onSave;
  final String? Function(String?) validator;
  final void Function()? onTap;
  final TextInputType inputType;
  final Widget? suffix;
  final TextEditingController? controller;

  const BorderedTextField(
      {super.key,
      required this.label,
      required this.validator,
      this.readOnly = false,
      this.inputType = TextInputType.text,
      this.suffix,
      this.obscureText = false,
      this.controller,
      this.enabled = true,
      this.onTap,
      this.onSave});

  @override
  State<BorderedTextField> createState() => _BorderedTextField();
}

class _BorderedTextField extends State<BorderedTextField> {
  final _defaultInputBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: AssetColors.gray200));

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelMedium(label: widget.label),
        const SpaceVertical(),
        TextFormField(
          onSaved: widget.onSave,
          onTap: widget.onTap,
          controller: widget.controller,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          obscureText: widget.obscureText,
          keyboardType: widget.inputType,
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
              border: _defaultInputBorder,
              enabledBorder: _defaultInputBorder,
              disabledBorder: _defaultInputBorder,
              suffixIcon: widget.suffix),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: widget.validator,
        )
      ],
    );
  }
}
