import 'package:flutter/material.dart';
import '../../components/my-elevated_button.dart';
import '../../components/my_text_field.dart';
class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop:false ,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            icon: Icon(Icons.arrow_back_outlined),
            color: Colors.black,
          ),
          title: Text(
            ' Add Transactions',
            style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'How much?',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 15, bottom: 15),
                child: MyTextField(
                  text: '',
                  decoration: InputDecoration(),
                )),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 15, bottom: 15),
              child: MyTextField(
                decoration: InputDecoration(), text: 'Category',
                // hintText: 'Category',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 25),
              child: MyTextField(
                decoration: InputDecoration(), text: 'Description',
                // hintText: 'Description',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade400),
                    child: Text(
                      'Income',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    )),
                SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade400),
                    child: Text(
                      'Expense',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 25, bottom: 10),
              child: MyTextField(
                decoration: InputDecoration(),
                text: 'Pick Your Date',
              ),
            ),
            SizedBox(
              height: 50,
            ),
            MyElevatedButton(text: "Continue", onPressed: () {}),
          ]),
        ),
      ),
    );
  }
}
