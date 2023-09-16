import 'package:flutter/material.dart';

TextStyle headerStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

TextStyle normalStyle = TextStyle(
  fontSize: 16,
);

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  AppButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
