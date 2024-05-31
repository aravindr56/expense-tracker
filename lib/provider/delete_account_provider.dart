import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../screens/authentication/sign_in.dart';

class DeleteProvider extends ChangeNotifier {
  Future<void> deleteUserAccount(BuildContext context) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String uid = user.uid;

        // Delete user data from Firestore (or Realtime Database)
        await FirebaseFirestore.instance.collection('transaction').where('userId', isEqualTo: uid).get().then((snapshot) {
          for (DocumentSnapshot ds in snapshot.docs){
            ds.reference.delete();
          }
        });

        // Delete user account
        await user.delete();

        // Show a success message
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Account deleted successfully.'),
        ));

        // Navigate to Sign In page
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignIn()));
      }
    } catch (e) {
      // Handle error
      print("Error deleting account: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error deleting account: $e'),
      ));
    }
  }
}