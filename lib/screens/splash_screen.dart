
import 'package:expence_tracker/screens/main_page.dart';
import 'package:expence_tracker/screens/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    checkUserLogin();
  }

  Future<void> checkUserLogin() async{
    SharedPreferences data= await SharedPreferences.getInstance();
    bool ? isSignedIn=data.getBool('isSignedIn');

    if(isSignedIn != null && isSignedIn){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));
    }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WelcomePage(),));
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: CircularProgressIndicator()),
    );
  }
}
