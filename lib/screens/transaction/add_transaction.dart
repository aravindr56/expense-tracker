import 'package:flutter/material.dart';
import '../../components/my_elevated_button.dart';
import '../../components/my_text_field.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  TextEditingController amount = TextEditingController();
  String? categoryValue;
  TextEditingController description = TextEditingController();
  TextEditingController pickyourdate = TextEditingController();

  bool ? isSelected;
  String ? selectedDate;
  String ? type;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    List<String> categories = ['Salary', 'Food', 'Shopping', 'Others', 'Groceries',"Rental",'Investment',"Entertainment","Petrol",];

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_outlined),
            color: Colors.black,
          ),
          title: const Text(
            'Add Transactions',
            style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white38,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: h * 0.02,
              ),
              const Text(
                'How much?',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 15, bottom: 15),
                child: MyTextField(
                  text: "Enter Amount",
                  decoration: const InputDecoration(),
                  controller: amount,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 15, bottom: 15),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: 'Category',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  value: categoryValue,
                  onChanged: (newValue) {
                    setState(() {
                      categoryValue = newValue;
                    });
                  },
                  items: categories.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style: const TextStyle(color: Colors.purple),),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 15, bottom: 15),
                child: MyTextField(
                  decoration: const InputDecoration(),
                  text: 'Description',
                  controller: description,
                ),
              ),
          GestureDetector(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
            );
            if (pickedDate != null) {
              setState(() {
                selectedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
              });
            }
          },
            child: Container(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
            margin: const EdgeInsets.only(top: 15,bottom: 15,left: 20,right: 20),
            decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(15),
             ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedDate ?? 'Pick Your Date',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 16,
                    ),
                  ),
                  const Icon(Icons.calendar_today, color: Colors.grey),
                ],
              ),
            ),
          ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                     Padding(
                       padding: const EdgeInsets.all(12.0),
                       child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isSelected=true;
                            type="income";
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: isSelected == true ? Colors.green.shade400 :Colors.white60 ),
                        child: const Text(
                          'Income',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                                           ),
                     ),

                  SizedBox(
                    width: w * 0.08,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isSelected=false;
                        type="expense";
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: isSelected ==false ? Colors.red.shade400:Colors.white70 ),
                    child: const Text(
                      'Expense',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.03,
              ),
              MyElevatedButton(
                text: "Continue",
                onPressed: () async{
                   if(amount.text.isNotEmpty && categoryValue != null && description.text.isNotEmpty && selectedDate != null && type != null){
                   FirebaseAuth auth=FirebaseAuth.instance;
                  FirebaseFirestore fireStore=FirebaseFirestore.instance;
                  fireStore.collection('transaction').doc().set({
                    'type':type,
                    'amount':amount.text.trim(),
                    'category':categoryValue,
                    'description':description.text.trim(),
                    'date':selectedDate,
                    'userId':auth.currentUser!.uid,
                    'time':Timestamp.now(),
                  }).then((value) {
                   setState(() {
                     amount.clear();
                     categoryValue= null;
                     description.clear();
                     selectedDate= null;
                     isSelected= null;
                     type= null;
                   });

                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: const Text('Transaction Added Successfully'),
                          backgroundColor: Colors.green.shade400,
                        ));
                  }).catchError((error){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content:Text("Failed to add transaction :$error"),backgroundColor: Colors.red.shade400,));
                   });
                  }else{
                     ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(content:const Text("Please fill all the fields"),backgroundColor: Colors.grey.shade400,));
                   }
                },
                backgroundColor: Colors.blue.shade400,
                textColor: Colors.white,
                fixedSize: const Size(300, 50),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
