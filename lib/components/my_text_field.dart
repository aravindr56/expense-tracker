import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String text;
  final TextEditingController controller;

  const MyTextField(
      {super.key, required this.text, required InputDecoration decoration,required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
      onTap: (){},
    );
  }
}
