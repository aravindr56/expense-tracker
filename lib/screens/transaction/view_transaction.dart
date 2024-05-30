import 'package:expence_tracker/provider/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewTransaction extends StatefulWidget {
  const ViewTransaction({super.key});

  @override
  State<ViewTransaction> createState() => _ViewTransactionState();
}

class _ViewTransactionState extends State<ViewTransaction> {
 String selectedMonth = DateTime.now().month.toString().padLeft(2, '0');

  @override
  void initState() {
    super.initState();
    // load current month transaction initially
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TransactionProvider>(context, listen: false).getDataForMonth(selectedMonth);
    });
  }

  @override
  Widget build(BuildContext context) {
    TransactionProvider transactionProvider = Provider.of<TransactionProvider>(context);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;


    return PopScope(
        canPop: false,
      child: Scaffold(
        backgroundColor: Colors.lightBlue.shade50,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_outlined, color: Colors.black, size: 20),
          ),
          title: Text(
            'Transactions',
            style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white70,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: selectedMonth,
              onChanged: (String? newValue) {
                if(newValue != null) {
                  setState(() {
                    selectedMonth = newValue;
                  });
                  Provider.of<TransactionProvider>(context,listen: false).getDataForMonth(newValue);
                }
              },
              items: [
                DropdownMenuItem(value: "01", child: Text("January")),
                DropdownMenuItem(value: "02", child: Text("February")),
                DropdownMenuItem(value: "03", child: Text("March")),
                DropdownMenuItem(value: "04", child: Text("April")),
                DropdownMenuItem(value: "05", child: Text("May")),
                DropdownMenuItem(value: "06", child: Text("June")),
                DropdownMenuItem(value: "07", child: Text("July")),
                DropdownMenuItem(value: "08", child: Text("August")),
                DropdownMenuItem(value: "09", child: Text("September")),
                DropdownMenuItem(value: "10", child: Text("October")),
                DropdownMenuItem(value: "11", child: Text("November")),
                DropdownMenuItem(value: "12", child: Text("December")),
              ],
            ),
            SizedBox(height: h * 0.02),
            Expanded(
              child: ListView.builder(
                itemCount: transactionProvider.transaction.length,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(transactionProvider.transaction[index]["category"]),
                                Text(transactionProvider.transaction[index]["amount"].toString(),
                                    style: TextStyle(color: textColor)),
                              ],
                            ),
                            SizedBox(height: h * 0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(transactionProvider.transaction[index]["description"]),
                                Text(transactionProvider.transaction[index]["date"]),
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
