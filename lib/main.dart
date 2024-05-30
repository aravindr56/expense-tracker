import 'package:expence_tracker/firebase_options.dart';
import 'package:expence_tracker/provider/bottom_navigation_provider.dart';
import 'package:expence_tracker/screens/splash_screen.dart';
import 'package:expence_tracker/screens/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:expence_tracker/provider/transaction_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
  DeviceOrientation.portraitUp,
  DeviceOrientation.portraitDown,
     ]) .then((value) =>  runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>TransactionProvider()),
        ChangeNotifierProvider(create: (context)=>NavigationProvider()),
      ],
    child: MaterialApp(
    home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    ),
    );
  }
}
