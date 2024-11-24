import 'package:flutter/material.dart';

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
          hintStyle: const TextStyle(
            color: Color(0xFF65656B),
            fontSize: 14,
          ),
          prefixIcon: icon,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 60, // Atur lebar minimum
            minHeight: 25, // Atur tinggi minimum
          ),
          filled: true,
          fillColor: fillColor ?? const Color(0xFF181829),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFF181829)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFF181829)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFF181829)),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFF181829)),
          ),
        ),
      ),
    );
  }
}
