import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final Color? color;
  final Function()? onTap;
  const AppButton(
    this.label, {
    this.color,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
        height: 63,
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(label),
        ),
      ),
    );
  }
}
