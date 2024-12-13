import 'package:flutter/material.dart';

class OutlinedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const OutlinedButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      label: label,
    );
  }
}