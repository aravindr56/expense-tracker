
import 'package:expence_tracker/screens/authentication/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../components/my_elevated_button.dart';
import '../../components/my_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main_page.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String errorMessage = '';

  Future<void> signUp() async {
    try {
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      SharedPreferences data = await SharedPreferences.getInstance();
      await data.setBool('isSignedIn', true);
      await data.setString('userEmail', email.text);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MainPage()));

    } on FirebaseAuthException catch (e) {
      setState(() {
        print(e.code);
        switch (e.code) {
          case 'user-not-found':
            errorMessage = 'No user found for the email.';
            break;
          case 'wrong-password':
            errorMessage = 'Wrong password provided.';
            break;
          case 'invalid-email':
            errorMessage = 'The email address is not valid.';
            break;
          case 'user-disabled':
            errorMessage = 'The user account has been disabled.';
            break;
          case 'too-many-requests':
            errorMessage = 'Too many requests. Try again later.';
            break;
          default:
            errorMessage = 'An error occurred. Please try again.';
            break;
        };
      });
    } catch (e) {
      setState(() {
        errorMessage = 'An unknown error occurred. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery
        .of(context)
        .size
        .width;
    double h = MediaQuery
        .of(context)
        .size
        .height;
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "assets/image.jpeg",
                  height: h * 0.510,
                  fit: BoxFit.fitHeight,
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: h * 0.660,
                  // width:w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                      )),
                  child: Column(children: [
                    Text(
                      "SIGN UP",
                      style: TextStyle(
                          color: Colors.teal.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    SizedBox(
                      height: h *0.020,
                    ),
                    MyTextField(
                        controller: name,
                        text: 'Name', decoration: InputDecoration()),
                    SizedBox(
                      height:h*  0.020,
                    ),
                    MyTextField(
                        controller: email,
                        text: 'Email', decoration: InputDecoration()),
                    SizedBox(
                      height: h *0.020,
                    ),
                    MyTextField(
                        controller: password,
                        text: 'Password', decoration: InputDecoration()),
                    SizedBox(
                      height: h * 0.030,
                    ),
                    MyElevatedButton(
                      text: 'Sign Up',
                      onPressed: () {
                       signUp();
                      },
                      backgroundColor: Colors.blue.shade400,
                      textColor: Colors.white,
                      fixedSize: Size(310, 50),),
                    SizedBox(height: h*0.005,),

                    Text(errorMessage,style: TextStyle(color: Colors.red.shade800),),

                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignIn()));
                        },
                        child: Text(
                          'I am already a user. Sign In', style: TextStyle(
                            color: Colors.black,fontSize: 15),)),
                    Text('or',style: TextStyle(color: Colors.black,fontSize: 15),),
                    // SizedBox(
                    //   height:h *  0.010,
                    // ),
                    Row(
                      children: [
                        SizedBox(
                           width: w * 0.070,
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
                          width:w*0.060,
                          height: h *0.060,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        SizedBox(
                           width: w*0.090,
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
                          width:w* 0.060,
                          height: 0.060,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        SizedBox(
                           width:w * 0.130,
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
                          width: 0.060,
                          height: 0.060,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ],
                    ),

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
