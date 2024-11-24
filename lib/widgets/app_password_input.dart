import 'package:flutter/material.dart';

import '../config/pallete.dart';

class AppPasswordInput extends StatefulWidget {
  final String hintText;
  final Widget? icon;
  const AppPasswordInput(
      {super.key, this.hintText = 'Enter password', this.icon});

  @override
  State<AppPasswordInput> createState() => _AppPasswordInputState();
}

class _AppPasswordInputState extends State<AppPasswordInput> {
  bool _isObscured = true;

  void _toggleObscureText() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _isObscured,
      style: const TextStyle(
        fontSize: 14,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: IconButton(
          icon: Icon(
            _isObscured ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: _toggleObscureText,
        ),
        hintStyle: TextStyle(
          color: Pallete.grey2,
          fontSize: 14,
        ),
        prefixIcon: widget.icon,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 60, // Atur lebar minimum
          minHeight: 25, // Atur tinggi minimum
        ),
        filled: true,
        fillColor: Pallete.black2,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Pallete.black2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Pallete.black2),
        ),
      ),
    );
  }
}
