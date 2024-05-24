import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionProvider extends ChangeNotifier{
  List transaction=[];
  num totalIncome=0;
  num totalExpense=0;
  num balance=0;

    TransactionProvider(){
      getData();
    }

    Future<void> getData() async{
      FirebaseAuth auth=FirebaseAuth.instance;
      QuerySnapshot snapshot= await FirebaseFirestore.instance.
      collection('transaction').
      where('userId',isEqualTo: auth.currentUser!.uid).
      orderBy('time',descending: true).get();

       List<Map<String,dynamic>> listOfTransaction=[];
       for(var i in snapshot.docs){
         Map<String,dynamic> docs= i.data() as Map<String,dynamic>;
         print(i.data());
         listOfTransaction.add(docs);
         if(docs['type']=='income'){
           totalIncome +=int.parse(docs["amount"]);
         }else if(docs['type']=='expense'){
           totalExpense +=int.parse (docs['amount']);
         }
         }

      transaction = listOfTransaction;
       balance=totalIncome-totalExpense;
      notifyListeners();
    }
}


