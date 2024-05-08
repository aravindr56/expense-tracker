import 'package:flutter/material.dart';

class MyElevatedButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const MyElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<MyElevatedButton> createState() => _MyElevatedButtonState();
}

class _MyElevatedButtonState extends State<MyElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // gradient: LinearGradient(
        //   colors: [
        //     Colors.blue.shade600,
        //     Colors.blue.shade600,
        //     Colors.blue.shade600,
        //     Colors.blue.shade600,
        //   ],
        // ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue.shade500,
          fixedSize: Size(300, 50),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
