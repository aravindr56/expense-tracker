import 'package:expence_tracker/screens/profile_page.dart';
import 'package:expence_tracker/screens/report_page.dart';
import 'package:expence_tracker/screens/transaction/add_transaction.dart';
import 'package:expence_tracker/screens/transaction/view_transaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/bottom_navigation_provider.dart';
import 'home_page.dart';
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // int myIndex = 0;
  List<Widget> pages = [
    HomePage(),
    ViewTransaction(),
    AddTransaction(),
    MonthlyReport(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    NavigationProvider navigationProvider=Provider.of(context);
    return Scaffold(
      body: pages[navigationProvider.myIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white70,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          navigationProvider.changeIndex(index);
        },
        currentIndex: navigationProvider.myIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.black,), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.enhance_photo_translate_sharp,color: Colors.black,),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add,color: Colors.black,), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.report,color: Colors.black,), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded,color: Colors.black,), label: ''),
        ],
      ),
    );
  }
}
