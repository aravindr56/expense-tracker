import 'package:expence_tracker/provider/transaction_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
class MonthlyReport extends StatefulWidget {
  const MonthlyReport({super.key});

  @override
  State<MonthlyReport> createState() => _MonthlyReportState();
}

class _MonthlyReportState extends State<MonthlyReport> {
  String formattedDate = DateFormat('MMMM yyyy').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    TransactionProvider transactionProvider=Provider.of(context);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.lightBlue.shade50,
              ),
              child: Column(
                children: [
                  SizedBox(height: h * 0.05,),
                  const Center(child: Text('Monthly Report',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),
                  Center(child: Text(formattedDate,style: const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),)),
                  SizedBox(height: h * 0.025,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Total Income',style: TextStyle(color: Colors.
                          blueAccent,fontSize: 18,fontWeight: FontWeight.bold),),
                      Text('Total Expense',style: TextStyle(color: Colors.blueAccent,fontSize: 18,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: h * 0.020,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: h * 0.08,
                        width:  w * 0.30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green.shade400,
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: w *0.02,),
                            Container(
                              width: w * 0.09,
                              height: h * 0.05,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white,
                              ),
                              child: Icon(Icons.arrow_upward_sharp,size: 20,color: Colors.green.shade400,),
                            ),
                            SizedBox(width: w * 0.03,),
                            Text(transactionProvider.totalIncome.toString(),style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                      Container(
                        height: h * 0.08,
                        width:  w * 0.30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red.shade400,
                        ),
                        child: Row(
                          children: [
                            SizedBox(width:w * 0.02,),
                            Container(
                              width: w * 0.10,
                              height: h * 0.05,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(80),
                                color: Colors.white,
                              ),
                              child: const Icon(Icons.arrow_downward_sharp,size: 20,color: Colors.red,),
                            ),
                            SizedBox(width: w * 0.03,),
                            Text(transactionProvider.totalExpense.toString(),style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: h * 0.05,),
                  Center(
                    child: Container(
                      height:  h * 0.09,
                      width:  w * 0.35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade400,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // SizedBox(height:  h * 0.01,),
                          Text('Net Savings',style: TextStyle(color: Colors.purple.shade600,fontSize: 17,fontWeight: FontWeight.bold),),
                          Text(transactionProvider.balance.toString(),style: const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),

                        ],
                      ),
                    ),
                  ),
                  // Divider(height: h * 0.05,color: Colors.black,),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // SizedBox(height: h * 0.07,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                       Container(
                         width:  w *0.38,
                         height: h * 0.07,
                         decoration: BoxDecoration(color: Colors.white30),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             const Text('Salary :',style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 17,fontWeight: FontWeight.bold),),
                             Text(transactionProvider.salary.toString(),style: const TextStyle(color: Colors.indigo,fontSize: 16,fontWeight: FontWeight.bold),),
                           ],
                         ),
                       ),
                        Container(
                          width:  w *0.38,
                          height: h * 0.07,
                          decoration: const BoxDecoration(color: Colors.white30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text('Rental :',style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 17,fontWeight: FontWeight.bold),),
                              Text(transactionProvider.rental.toString(),style: const TextStyle(color: Colors.indigo,fontSize: 16,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(height: h * 0.08,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width:  w *0.38,
                          height: h * 0.07,
                          decoration: const BoxDecoration(color: Colors.white30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text('Food :',style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 17,fontWeight: FontWeight.bold),),
                              Text(transactionProvider.food.toString(),style: const TextStyle(color: Colors.indigo,fontSize: 16,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                        Container(
                          width:  w *0.37,
                          height: h * 0.07,
                          decoration: const BoxDecoration(color: Colors.white30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text('Shopping :',style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 17,fontWeight: FontWeight.bold),),
                              Text(transactionProvider.shopping.toString(),style: const TextStyle(color: Colors.indigo,fontSize: 16,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(height: h * 0.08,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width:  w *0.38,
                          height: h * 0.07,
                          decoration: const BoxDecoration(color: Colors.white30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text('Investment :',style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 17,fontWeight: FontWeight.bold),),
                              Text(transactionProvider.investment.toString(),style: const TextStyle(color: Colors.indigo,fontSize: 16,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                        Container(
                          width:  w *0.38,
                          height: h * 0.07,
                          decoration: const BoxDecoration(color: Colors.white30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text('Groceries :',style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 17,fontWeight: FontWeight.bold),),
                              Text(transactionProvider.groceries.toString(),style: const TextStyle(color: Colors.indigo,fontSize: 16,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(height: h * 0.07,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width:  w *0.38,
                          height: h * 0.07,
                          decoration: const BoxDecoration(color: Colors.white30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text('Petrol :',style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 17,fontWeight: FontWeight.bold),),
                              Text(transactionProvider.petrol.toString(),style: const TextStyle(color: Colors.indigo,fontSize: 16,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                        Container(
                          width:  w *0.38,
                          height: h * 0.07,
                          decoration: const BoxDecoration(color: Colors.white30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text('others :',style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 17,fontWeight: FontWeight.bold),),
                              Text(transactionProvider.others.toString(),style: const TextStyle(color: Colors.indigo,fontSize: 16,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          )
        ],
      ),
              );
     }
}

