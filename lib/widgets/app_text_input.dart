import 'package:flutter/material.dart';

import '../config/pallete.dart';

class AppTextInput extends StatelessWidget {
  final String hintText;
  final Widget? icon;
  final Color? fillColor;
  final Function()? onTap;
  final TextEditingController? controller;

  const AppTextInput(
      {this.hintText = 'Enter text',
      this.controller,
      super.key,
      this.icon,
      this.fillColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TextField(
        enabled: onTap == null,
        controller: controller,
        style: const TextStyle(
          fontSize: 14,
        ),
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: Pallete.grey2,
            fontSize: 14,
          ),
          prefixIcon: icon,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 60, // Atur lebar minimum
            minHeight: 25, // Atur tinggi minimum
          ),
          filled: true,
          fillColor: fillColor ?? Pallete.black2,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Pallete.black2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Pallete.black2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Pallete.black2),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Pallete.black2),
          ),
        ),
      ),
    );
  }
}
