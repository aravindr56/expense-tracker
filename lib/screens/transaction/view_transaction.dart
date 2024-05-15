import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class ViewTransaction extends StatefulWidget {
  const ViewTransaction({super.key});

  @override
  State<ViewTransaction> createState() => _ViewTransactionState();
}

class _ViewTransactionState extends State<ViewTransaction> {
  List<Map<String, dynamic>> viewTransition = [
    {
      "category": "Shopping",
      "amount": "-200",
      "description": "Buy Some Product",
      "date": "12/01/2001",
    },
    {
      "category": "Income",
      "amount": "15000",
      "description": "Eat Paastha",
      "date": "12/06/2024",
    },
    {
      "category": "Food",
      "amount": "-500",
      "description": "Eat Paastha",
      "date": "12/06/2024",
    },
    {
      "category": "Food",
      "amount": "-500",
      "description": "Eat Paastha",
      "date": "12/06/2024",
    },
    {
      "category": "Food",
      "amount": "-500",
      "description": "Eat Paastha",
      "date": "12/06/2024",
    },
    {
      "category": "Food",
      "amount": "-500",
      "description": "Eat Paastha",
      "date": "12/06/2024",
    },
    {
      "category": "Food",
      "amount": "-500",
      "description": "Eat burger",
      "date": "12/06/2024",
    },
    {
      "category": "Food",
      "amount": "-500",
      "description": "Eat Paastha",
      "date": "12/06/2024",
    },
    {
      "category": "Food",
      "amount": "-500",
      "description": "Eat Paastha",
      "date": "12/06/2024",
    },
    {
      "category": "Salary",
      "amount": "50000",
      "description": "August Month",
      "date": "01/08/2024",
    }
  ];

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
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.blue.shade100,
          appBar: AppBar(
            leading: Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            ),
            title: Text(
              'Transactions',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Colors.blue.shade100,
          ),
          // backgroundColor: Colors.grey.shade200,
          body: Column(
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
                width: MediaQuery.of(context).size.width * 0.9,
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
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: viewTransition.length,
                  // Number of items in the list
                  itemBuilder: (BuildContext context, int index) {
                    String amount = viewTransition[index]["amount"].toString();
                    bool isNegative = amount.contains("-");
                    Color textColor = isNegative ? Colors.red : Colors.green;

                    return Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Container(
                        height: 70,
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
                                    viewTransition[index]["category"],
                                  ),
                                  Text(viewTransition[index]["amount"],
                                      style: TextStyle(color: textColor))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    viewTransition[index]["description"],
                                  ),
                                  Text(
                                    viewTransition[index]["date"].toString(),
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
          ),
      ),
    );
  }
}
