import 'package:expence_tracker/provider/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
class ViewTransaction extends StatefulWidget {
  const ViewTransaction({super.key});

  @override
  State<ViewTransaction> createState() => _ViewTransactionState();
}

class _ViewTransactionState extends State<ViewTransaction> {


  List<Widget> dropDownList() {
    List<Widget> dropDownWidget = [];
    for (int i = 1; i < 12; i++) {
      String num = i.toString();
      var dropDown = DropdownMenu(
        dropdownMenuEntries: [
          DropdownMenuEntry(value: "1", label: num),
        ],
      );
      dropDownWidget.add(dropDown);
    }
    return dropDownWidget;
  }
  @override
  Widget build(BuildContext context) {
    TransactionProvider transactionProvider= Provider.of<TransactionProvider>(context);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.lightBlue.shade50,
          appBar: AppBar(
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_outlined,color: Colors.black,size: 20,),
            ),
            title: Text(
              'Transactions',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Colors.white70,
          ),
          // backgroundColor: Colors.grey.shade200,
          body: Consumer<TransactionProvider>(
            builder: ( context, transactionProvider,_){
    return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    DropdownMenu(
    label: Text(
    "Month",
    style: TextStyle(color: Colors.black, fontSize: 15),
    ),
    onSelected: (value) {
    print(value);
    },
    width: w * 0.9,
    dropdownMenuEntries: [
    DropdownMenuEntry(value: "1", label: "January"),
    DropdownMenuEntry(value: "2", label: "Febraury"),
    DropdownMenuEntry(value: "3", label: "march"),
    DropdownMenuEntry(value: "4", label: "April"),
    DropdownMenuEntry(value: "5", label: "May"),
    DropdownMenuEntry(value: "6", label: "June"),
    DropdownMenuEntry(value: "7", label: "july"),
    DropdownMenuEntry(value: "8", label: "August"),
    DropdownMenuEntry(value: "9", label: "September"),
    DropdownMenuEntry(value: "10", label: "October"),
    DropdownMenuEntry(value: "11", label: "November"),
    DropdownMenuEntry(value: "12", label: "December"),
    ],
    ),
    SizedBox(
    height: h *0.02,
    ),
    Expanded(
    child: ListView.builder(
    itemCount: transactionProvider.transaction.length,
    // Number of items in the list
    itemBuilder: (BuildContext context, int index) {
    String type = transactionProvider.transaction[index]["type"];
    bool isExpense = type.contains("expense");
    Color textColor = isExpense ? Colors.red : Colors.green;

    return Padding(
    padding: const EdgeInsets.all(14.0),
    child: Container(
    height: h * 0.10,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white70,
    ),
    child: Padding(
    padding: EdgeInsets.all(10),
    child: Column(
    children: [
    Row(
    mainAxisAlignment:
    MainAxisAlignment.spaceBetween,
    children: [
    Text(
    transactionProvider.transaction[index]["category"],
    ),
    Text(transactionProvider.transaction[index]["amount"].toString(),
    style: TextStyle(color: textColor))
    ],
    ),
    SizedBox(height: h *0.01,),
    Row(
    mainAxisAlignment:
    MainAxisAlignment.spaceBetween,
    children: [
    Text(
    transactionProvider.transaction[index]["description"],
    ),
    Text(
    transactionProvider.transaction[index]["date"],
    )
    ],
    ),
    ],
    ),
    ),
    ),
    );
    },
    ),
    ),
    ],
    );
    }
      ),
      )
    );
  }
}
