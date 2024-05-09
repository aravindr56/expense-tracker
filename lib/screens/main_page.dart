import 'package:expence_tracker/screens/profile_page.dart';
import 'package:expence_tracker/screens/report_page.dart';
import 'package:expence_tracker/screens/transaction/add_transaction.dart';
import 'package:expence_tracker/screens/transaction/view_transaction.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int myIndex = 0;
  List<Widget> pages = [
    HomePage(),
    ViewTransaction(),
    AddTransaction(),
    MonthlyReport(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[myIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue.shade100,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.enhance_photo_translate_sharp),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add), label: 'add Transaction'),
          BottomNavigationBarItem(icon: Icon(Icons.report), label: 'Report'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded), label: 'Profile'),
        ],
      ),
    );
  }
}
