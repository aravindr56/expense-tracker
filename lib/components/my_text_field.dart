import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String text;

  const MyTextField(
      {super.key, required this.text, required InputDecoration decoration});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: '${text}',
        contentPadding: EdgeInsets.all(8.0),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
