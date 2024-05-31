import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../provider/delete_account_provider.dart';
import 'authentication/sign_in.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? name;
  String? email;

  Future<void> userData() async {
    SharedPreferences data = await SharedPreferences.getInstance();
    name = data.getString('name') ?? "";
    email = data.getString('email') ?? '';
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    userData();
  }

  Future<void> showConfirmationDialog(
      BuildContext context, String title, String content, VoidCallback onConfirm) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap button
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(content),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
                onConfirm();
              },
            ),
          ],
        );
      },
    );
  }

  void logOut(BuildContext context) {
    showConfirmationDialog(
      context,
      'Log Out',
      'Are you sure you want to log out?',
          () async {
        SharedPreferences data = await SharedPreferences.getInstance();
        data.setBool('isSignedIn', false);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const SignIn()));
      },
    );
  }

  void deleteAccount(BuildContext context) {
    showConfirmationDialog(
      context,
      'Delete Account',
      'Are you sure you want to delete your account?',
          () {
        Provider.of<DeleteProvider>(context, listen: false)
            .deleteUserAccount(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: Colors.lightBlue.shade50,
          appBar: AppBar(
            leading: const Icon(Icons.arrow_back_outlined),
            title: const Text(
              'Profile',
              style: TextStyle(
                  color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Colors.white38,
          ),
          body: Column(
            children: [
              SizedBox(
                height: h * 0.1,
              ),
              Text(
                'Username',
                style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                name ?? "",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                email ?? "",
                style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: h * 0.08,
              ),
              Container(
                width: w,
                height: h * 0.1,
                color: Colors.blue.shade50,
                child: Row(
                  children: [
                    SizedBox(
                      width: w * 0.08,
                    ),
                    Container(
                      width: w * 0.13,
                      height: h * 0.06,
                      decoration: BoxDecoration(
                        color: Colors.purpleAccent.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        onPressed: () {
                          deleteAccount(context);
                        },
                        icon: Icon(
                          Icons.delete_forever_sharp,
                          color: Colors.purpleAccent.shade700,
                          size: 25,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: w * 0.07,
                    ),
                    const Text(
                      'Delete Account',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                width: w,
                height: h * 0.1,
                color: Colors.blue.shade50,
                child: Row(
                  children: [
                    SizedBox(
                      width: w * 0.08,
                    ),
                    Container(
                      width: w * 0.13,
                      height: h * 0.06,
                      decoration: BoxDecoration(
                        color: Colors.redAccent.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        onPressed: () {
                          logOut(context);
                        },
                        icon: Icon(
                          Icons.logout,
                          color: Colors.redAccent.shade700,
                          size: 25,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: w * 0.07,
                    ),
                    const Text(
                      'Log Out',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        );
  }
}
