import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionProvider extends ChangeNotifier {
  List transaction = [];
  num totalIncome = 0;
  num totalExpense = 0;
  num balance = 0;

  // Category-specific amounts
  num salary = 0;
  num rental = 0;
  num food = 0;
  num shopping = 0;
  num investment = 0;
  num groceries = 0;
  num petrol = 0;
  num others = 0;

  TransactionProvider() {
    // Load current month transactions initially
    getDataForMonth(DateTime.now().month.toString().padLeft(2, '0'));
  }

  Future<void> getDataForMonth(String month) async {
     totalIncome = 0;
     totalExpense = 0;
     balance = 0;

    // Category-specific amounts
     salary = 0;
     rental = 0;
     food = 0;
     shopping = 0;
     investment = 0;
     groceries = 0;
     petrol = 0;
     others = 0;
    FirebaseAuth auth = FirebaseAuth.instance;
    String year = DateTime.now().year.toString();
    String startDate = '$year-$month-01';
    String endDate = '$year-$month-${DateUtils.getDaysInMonth(int.parse(year), int.parse(month))}';
    print("Started...........................");
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('transaction')
          .where('userId', isEqualTo: auth.currentUser!.uid)
          .where('time', isGreaterThanOrEqualTo: Timestamp.fromDate(DateTime.parse(startDate)))
          .where('time', isLessThanOrEqualTo:Timestamp.fromDate(DateTime.parse(endDate)))
          .orderBy('time', descending: true)
          .get();
      print("got data_________________${snapshot.docs}");
      List<Map<String, dynamic>> listOfTransaction = [];

      for (var doc in snapshot.docs) {
        Map<String, dynamic> docs = doc.data() as Map<String, dynamic>;
        listOfTransaction.add(docs);

        if (docs['type'] == 'income') {
          totalIncome += int.parse(docs['amount']);
        } else if (docs['type'] == 'expense') {
          totalExpense += int.parse(docs['amount']);
        }

        // Update category-specific amounts
        switch (docs['category']) {
          case 'Salary':
            salary += int.parse(docs['amount']);
            break;
          case 'Rental':
            rental += int.parse(docs['amount']);
            break;
          case 'Food':
            food += int.parse(docs['amount']);
            break;
          case 'Shopping':
            shopping += int.parse(docs['amount']);
            break;
          case 'Investment':
            investment += int.parse(docs['amount']);
            break;
          case 'groceries':
            groceries += int.parse(docs['amount']);
            break;
          case 'Petrol':
            petrol += int.parse(docs['amount']);
            break;
          case 'Others':
            others += int.parse(docs['amount']);
            break;
        }
        notifyListeners();
      }

      transaction = listOfTransaction;
      balance = totalIncome - totalExpense;
      notifyListeners();
    } catch (e) {
      print('Error fetching transaction: $e');
    }
  }
}


