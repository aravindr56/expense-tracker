// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB78Z1tEKlmHSzeiF4v2DjnBG2CDVMgeKs',
    appId: '1:277557061703:web:08c58f0d39d8f5890f6962',
    messagingSenderId: '277557061703',
    projectId: 'expense-tracker-25d7f',
    authDomain: 'expense-tracker-25d7f.firebaseapp.com',
    storageBucket: 'expense-tracker-25d7f.appspot.com',
    measurementId: 'G-5NT36YXVGN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBeoHghV1HrjHLGG7ZeVojH2TJaho8tvwU',
    appId: '1:277557061703:android:4d038d66cef928f00f6962',
    messagingSenderId: '277557061703',
    projectId: 'expense-tracker-25d7f',
    storageBucket: 'expense-tracker-25d7f.appspot.com',
  );
}