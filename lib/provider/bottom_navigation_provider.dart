import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier{
  int myIndex=0;
  notifyListeners();

  changeIndex(int index)
  {
    myIndex=index;
    notifyListeners();
  }

}