import 'package:flutter/material.dart';

class AppRememberMe extends StatefulWidget {
  const AppRememberMe({super.key});

  @override
  State<AppRememberMe> createState() => _AppRememberMeState();
}

class _AppRememberMeState extends State<AppRememberMe> {
  bool _isChecked = false;

  void _toggleCheckbox(bool? newValue) {
    setState(() {
      _isChecked = newValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(value: _isChecked, onChanged: _toggleCheckbox),
            Text(
              'Remember me',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
        Text(
          'Forgot Password',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
