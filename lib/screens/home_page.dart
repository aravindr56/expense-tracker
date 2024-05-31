import 'package:expence_tracker/provider/bottom_navigation_provider.dart';
import 'package:expence_tracker/provider/transaction_provider.dart';
import 'package:expence_tracker/screens/transaction/view_transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String ? name;


  String formattedDate = DateFormat('EEEE, MMMM d').format(DateTime.now());

    Future<void> userData()async{
      SharedPreferences data= await SharedPreferences.getInstance();
      name = data.getString('name');
      setState(() {});
    }
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userData();
  }
  @override
  Widget build(BuildContext context) {
      NavigationProvider navigationProvider=Provider.of(context);
    TransactionProvider transactionProvider=Provider.of<TransactionProvider>(context);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return PopScope(
      canPop: true,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: Colors.lightBlue.shade100,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 45,bottom: 5,left: 20,right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(formattedDate,style: const TextStyle(color: Colors.indigo,fontSize: 18.0,fontWeight: FontWeight.bold),),
                          SizedBox(
                            width: w * 0.090,
                          ),
                          Text(
                            name ?? "",
                            style:
                            const TextStyle(color: Colors.indigoAccent, fontSize: 18.0,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 1.2,
                      height:h * 0.010,
                    ),
                    SizedBox(
                      height: h * 0.065,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Account Balance',
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 18.0,fontWeight: FontWeight.bold),
                          ),
                          Text(
                            transactionProvider.balance.toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h * 0.040,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width:w * 0.055,
                        ),
                        Container(
                          width: w * 0.40,
                          height: h * 0.10,
                          decoration: BoxDecoration(
                            color: Colors.green.shade500,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: h * 0.020,
                              ),
                              Container(
                                width: w * 0.13,
                                height: h * 0.06,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.wallet,
                                    color: Colors.green.shade400,
                                    size: 25,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: w * 0.030,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: h * 0.020,
                                  ),
                                  const Text('Income',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17,fontWeight: FontWeight.bold)),
                                  Text(transactionProvider.totalIncome.toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: h * 0.040,
                        ),
                        Container(
                          width:  w * 0.40,
                          height: h * 0.10,
                          decoration: BoxDecoration(
                            color: Colors.red.shade500,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: h*0.020,
                              ),
                              Container(
                                width: w * 0.13,
                                height: h * 0.06,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.wallet,
                                    color: Colors.red.shade400,
                                    size: 25,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width:w * 0.030,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: h * 0.020 ,
                                  ),
                                  const Text('Expense',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17,fontWeight: FontWeight.bold)),
                                  Text(transactionProvider.totalExpense.toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                     color: Colors.blue.shade100,
                  ),
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           const Text('Recent Transaction',style: TextStyle(color: Colors.deepPurple,fontSize: 18,fontWeight: FontWeight.bold),),
                           TextButton(
                               onPressed: (){
                                 navigationProvider.changeIndex(1);
                               },
                               child: const Text('View All..',style: TextStyle(color: Colors.purple,fontSize: 18,fontWeight: FontWeight.bold),))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h,
                        child: ListView.builder(
                          itemCount: transactionProvider.transaction.length > 4 ? 4 : transactionProvider.transaction.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  right: 18, left: 18, top: 8, bottom: 8),
                              child: Container(
                                height: h * 0.065,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(0),

                                  ),
                                  color: Colors.white70,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      transactionProvider.transaction[index]['amount'].toString(),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      transactionProvider.transaction[index]['category'],
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
