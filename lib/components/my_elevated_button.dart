import 'package:flutter/material.dart';

class MyElevatedButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Size fixedSize;


  const MyElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    required this.fixedSize,
  });

  @override
  State<MyElevatedButton> createState() => _MyElevatedButtonState();
}


class _MyElevatedButtonState extends State<MyElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.backgroundColor,
          fixedSize: widget.fixedSize,
        ),
        child: Text(
          widget.text,
          style: TextStyle(
              color: widget.textColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
