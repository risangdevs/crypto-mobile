import 'package:flutter/material.dart';

class FlatButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const FlatButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}