import 'package:flutter/material.dart';

import '../components/my-elevated_button.dart';
import 'authentication/sign_up.dart';
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 350,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/img3.jpeg',
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 35),
                  child: Text(
                    'Simple Solution for your budget.',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'counter and distribute the income correctly',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            MyElevatedButton(
                text: 'Continue',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                })
          ],
        ),
      ),
    );
  }
}
