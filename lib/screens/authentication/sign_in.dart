import 'package:flutter/material.dart';

import '../../components/my-elevated_button.dart';
import '../../components/my_text_field.dart';
import '../main_page.dart';
class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child:  Scaffold(
        body: Stack(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "assets/img3.jpeg",
                  height: 350,
                  fit: BoxFit.fitHeight,
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(20),
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: Column(children: [
                  Text(
                    "SIGN IN",
                    style: TextStyle(
                        color: Colors.teal.shade900,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MyTextField(text: 'Email', decoration: InputDecoration()),
                  SizedBox(
                    height: 20,
                  ),
                  MyTextField(text: 'Password', decoration: InputDecoration()),
                  SizedBox(
                    height: 45,
                  ),
                  MyElevatedButton(
                      text: "Sign In",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainPage()));
                      })
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
