import 'package:basic_loyalty/components/text_form_field_container.dart';
import 'package:flutter/material.dart';

class RoundedInputTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? icon;
  final FormFieldValidator validator;
  final FormFieldSetter onSaved;

  const RoundedInputTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.icon,
    required this.validator,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormFieldContainer(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.black,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
        obscureText: hintText.toLowerCase() == "password" ? true : false,
        textCapitalization: TextCapitalization.none,
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}