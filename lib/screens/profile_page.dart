import 'package:flutter/material.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_outlined),
          title: Text(
            'Profile',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              width: 190,
              height: 100,
              color: Colors.white12,
              child: Column(
                children: [
                  Text(
                    'Username',
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  Text(
                    'Aravind R',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'aravindr330@gmail.com',
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 70,
              color: Colors.grey.shade100,
              child: Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.purpleAccent.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete_forever_sharp,
                        color: Colors.purpleAccent.shade700,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 22,
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
              width: MediaQuery.sizeOf(context).width,
              height: 70,
              color: Colors.grey.shade100,
              child: Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.redAccent.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.logout,
                        color: Colors.redAccent.shade700,
                        size: 22,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 22,
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
