import 'package:flutter/material.dart';

import '../../../Constant/MyColors.dart';


class PasswordField extends StatefulWidget {
   const PasswordField({
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.controller,
  });

  final Key? fieldKey;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextEditingController? controller;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      controller: widget.controller,
      maxLength: 8,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: widget.hintText,
        labelText: widget.labelText,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: MyColors.myDarkBlue),
        ),
        labelStyle: const TextStyle(color: MyColors.myDarkBlue),
        helperText: widget.helperText,
        prefixIcon: const Icon(
          Icons.lock,
          color: MyColors.myDarkBlue,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: MyColors.myDarkBlue,
          ),
        ),
      ),
    );
  }
}