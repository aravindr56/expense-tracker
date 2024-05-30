import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionProvider extends ChangeNotifier {
  List transaction = [];
  num totalIncome = 0;
  num totalExpense = 0;
  num balance = 0;

  // num savings = 0;
  // num salary = 0;
  // num food = 0;
  // num shopping = 0;
  // num rental = 0;
  // num groceries = 0;
  // num others = 0;
  // num investment = 0;
  // num entertainment = 0;
  // num petrol = 0;

  TransactionProvider() {
    // load current month transaction initially
    getDataForMonth(DateTime.now().month.toString().padLeft(2,'0'));
  }

  Future<void> getDataForMonth(String month) async {

    FirebaseAuth auth = FirebaseAuth.instance;

    String year= DateTime.now().year.toString();
    String startDate = '$year-$month-01';
    String endDate = '$year-$month-${DateUtils.getDaysInMonth(int.parse(year), int.parse(month))}';
    try {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.
    collection('transaction').
    where('userId', isEqualTo: auth.currentUser!.uid).
    where('date', isGreaterThanOrEqualTo:DateTime(2024,5,1)).
    where('date',isLessThanOrEqualTo:DateTime(2024,5,31)).
    orderBy('time', descending: true).
    orderBy('date',descending: true)
    .get();

    snapshot.docs.forEach((doc) {
      print(doc.data());
    });

    List<Map<String, dynamic>> listOfTransaction = [];
    for (var i in snapshot.docs) {
      Map<String, dynamic> docs = i.data() as Map<String, dynamic>;
      print(i.data());
      listOfTransaction.add(docs);
      if (docs['type'] == 'income') {
        totalIncome += int.parse(docs["amount"]);
      } else if (docs['type'] == 'expense') {
        totalExpense += int.parse(docs['amount']);
      }
    }
      // } else if (docs['category'] == 'salary') {
      //   salary += int.parse(docs['amount']);
      // } else if (docs['category'] == 'Food') {
      //   food += int.parse(docs['amount']);
      // } else if (docs['category'] == 'Shopping') {
      //   shopping += int.parse(docs['amount']);
      // } else if (docs['category'] == 'Rental') {
      //   rental += int.parse(docs['amount']);
      // } else if (docs['category'] == 'groceries') {
      //   groceries += int.parse(docs['amount']);
      // } else if (docs['category'] == 'Investment') {
      //   investment += int.parse(docs['amount']);
      // } else if (docs['category'] == 'Petrol') {
      //   petrol += int.parse(docs['amount']);
      // } else if (docs['category'] == 'Others') {
      //   others += int.parse(docs['amount']);
      // }

      transaction = listOfTransaction;
      balance = totalIncome - totalExpense;
      // savings = totalIncome - totalExpense;
      notifyListeners();
    }catch (e) {
      print('Error fetching transaction : $e');
    }
    }

  }


