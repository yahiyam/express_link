import 'package:express_link/constants/colors.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    super.key,
    this.label,
    this.controller,
  });

  final String? label;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    const double borderRadius = 16;
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: KColors.textField,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Enter $label';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: KColors.hintText),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
        ),
      ),
    );
  }
}
