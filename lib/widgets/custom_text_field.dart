import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
late final TextEditingController ? controller;
late final String labText;
late final TextInputType keyboardType;
CustomTextField({required this.controller,required this.labText,required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        labelText:labText,
      ),

    );
  }
}
