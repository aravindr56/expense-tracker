import 'package:expence_tracker/screens/authentication/sign_in.dart';
import 'package:flutter/material.dart';

import '../../components/my-elevated_button.dart';
import '../../components/my_text_field.dart';
import '../main_page.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
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
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: 480,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35))),
                  child: Column(children: [
                    Text(
                      "SIGN UP",
                      style: TextStyle(
                          color: Colors.teal.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MyTextField(text: 'Name', decoration: InputDecoration()),
                    SizedBox(
                      height: 15,
                    ),
                    MyTextField(text: 'Email', decoration: InputDecoration()),
                    SizedBox(
                      height: 15,
                    ),
                    MyTextField(
                        text: 'Password', decoration: InputDecoration()),
                    SizedBox(
                      height: 20,
                    ),
                    MyElevatedButton(
                        text: 'Sign Up',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainPage()));
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignIn()));
                        },
                        child: Text('I am already a user. Sign In')),
                    Text('or'),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 60,
                        ),
                        Container(
                          child: IconButton(
                            icon: Icon(
                              Icons.g_translate_sharp,
                              color: Colors.teal,
                              size: 30,
                            ),
                            onPressed: () {},
                          ),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          child: IconButton(
                            icon: Icon(
                              Icons.facebook,
                              color: Colors.blue,
                              size: 30,
                            ),
                            onPressed: () {},
                          ),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          child: IconButton(
                            icon: Icon(
                              Icons.apple,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () {},
                          ),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ],
                    )
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
