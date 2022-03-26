import 'package:duuit/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField2 extends StatelessWidget {
  const CustomTextFormField2({
    Key? key,
    required this.controller,
    required this.maxLines,
    required this.hintText,
    required this.labelText,
    required this.validator,
    required this.keyboardType,
    required this.inputFormatters,
    required this.obscureText,
  }) : super(key: key);
  final TextEditingController controller;
  final int maxLines;
  final String? Function(String?)? validator;
  final String hintText, labelText;

  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.width10 * 3),
      child: TextFormField(
        keyboardType: keyboardType,
        textAlign: TextAlign.start,
        controller: controller,
        inputFormatters: inputFormatters,
        textCapitalization: TextCapitalization.sentences,
        obscureText: obscureText,
        maxLines: maxLines,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          alignLabelWithHint: true,
          contentPadding: const EdgeInsets.all(12),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
