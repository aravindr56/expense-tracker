import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier{
  int myIndex=0;
  @override
  notifyListeners();

  changeIndex(int index)
  {
    myIndex=index;
    notifyListeners();
  }

}