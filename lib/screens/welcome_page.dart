import 'package:flutter/material.dart';
import '../components/my_elevated_button.dart';
import 'authentication/sign_up.dart';
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  Widget build(BuildContext context) {
   double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             SizedBox(
              height: h * 0.040,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  width:w,
                  height:  h * 0.500,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/image.jpeg',
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
             SizedBox(
              height:h*  0.035,
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
             SizedBox(
              height:h * 0.020,
            ),
            const Text(
              'counter and distribute the income correctly',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
             SizedBox(
              height: h* 0.050,
            ),
            MyElevatedButton(
                text: 'Continue',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                }, backgroundColor: Colors.blue.shade400, textColor: Colors.white, fixedSize:Size(300,50),),
          ],
        ),
      ),
    );
  }
}
