
import 'package:expence_tracker/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:expence_tracker/screens/authentication/sign_up.dart';
import 'package:flutter/material.dart';
import '../../components/my_elevated_button.dart';
import '../../components/my_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main_page.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  String errorMessage = '';


  Future<void> signIn() async {
    try {
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      SharedPreferences data = await SharedPreferences.getInstance();
      await data.setBool('isSignedIn', true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
      await data.setString('userEmail', email.text);
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
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return PopScope(
      canPop: false,
      child:  Scaffold(
        body: Stack(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "assets/image.jpeg",
                  height:h* 0.510,
                  fit: BoxFit.fitHeight,
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(20),
                height:h* 0.550,
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
                    height: h*0.030,
                  ),
                  MyTextField(text: 'Email', decoration: InputDecoration(), controller: email,),
                  SizedBox(
                    height:h* 0.030,
                  ),
                  MyTextField(text: 'Password', decoration: InputDecoration(),controller: password,),
                  SizedBox(
                    height: h*0.040,
                  ),
                  MyElevatedButton(
                      text: "Sign In",
                      onPressed: () {
                    signIn();
                      }, backgroundColor: Colors.blue.shade400, textColor:Colors.white, fixedSize: Size(310,50),),
                   SizedBox(height:h* 0.010,),
                  Text(errorMessage,style: TextStyle(color: Colors.red.shade700),
                  ),
                  TextButton(
                      onPressed: (){
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                        });
                      },
                      child: Text('New User. Sign Up',style: TextStyle(color: Colors.black,fontSize: 15),))
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
