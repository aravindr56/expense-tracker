import 'package:expence_tracker/screens/authentication/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

    String ? name;
    String ? email;
  Future<void> userData()async{
    SharedPreferences data= await SharedPreferences.getInstance();
     name = data.getString('name') ?? "";
     email = data.getString('email');
    setState(() {});
  }
  @override
  void initState() {
    // TODO: implement initState
    userData();
    super.initState();
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
          leading: Icon(Icons.arrow_back_outlined),
          title: Text(
            'Profile',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white70,
        ),
        body: Column(
          children: [
            SizedBox(
              height: h * 0.1,
            ),
                  Text(
                    'Username',
                    style: TextStyle(color: Colors.grey.shade800, fontSize: 15),
                  ),
                  Text(
                    name ?? "",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    email ?? "" ,
                    style: TextStyle(color: Colors.grey.shade800, fontSize: 15),
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
                      onPressed: () {},
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
                  Text(
                    'Delete Account',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
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
                      onPressed: () async {
                        SharedPreferences data= await SharedPreferences.getInstance();
                        data.setBool('isSignedIn', false);
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn()));

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
                  Text(
                    'Log Out',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
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
