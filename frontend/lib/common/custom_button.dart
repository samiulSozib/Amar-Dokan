import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;

  const CustomButton(
      {required this.text, required this.onTap, this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50), primary: color),
      child: Text(
        text,
        style: TextStyle(
            color: color == null ? Colors.white : Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
