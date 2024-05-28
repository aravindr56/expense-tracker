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
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: Colors.lightBlue.shade100,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40,bottom: 5,left: 20,right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(formattedDate,style: TextStyle(color: Colors.black,fontSize: 18.0),),
                          SizedBox(
                            width: w * 0.090,
                          ),
                          Text(
                            name ?? "",
                            style:
                            TextStyle(color: Colors.black, fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      height:h * 0.010,
                    ),
                    SizedBox(
                      height: h * 0.065,
                    ),
                    Center(
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              'Account Balance',
                              style: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 18.0),
                            ),
                            Text(
                              transactionProvider.balance.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
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
                                  Text('Income',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                  Text(transactionProvider.totalIncome.toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
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
                                  Text('Expense',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                  Text(transactionProvider.totalExpense.toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
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
                           Text('Recent Transaction',style: TextStyle(color: Colors.black,fontSize: 18),),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ViewTransaction()));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey.shade200),
                                child: Text(
                                  'view All',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        height: h,
                        child: ListView.builder(
                          itemCount: transactionProvider.transaction.length > 4 ? 4 : transactionProvider.transaction.length,
                          itemBuilder: (BuildContext context, int index) {
                            // String amount= recentTransition[index]['amount'].toString();
                            return Padding(
                              padding: EdgeInsets.only(
                                  right: 18, left: 18, top: 8, bottom: 8),
                              child: Container(
                                height: h * 0.065,
                                decoration: BoxDecoration(
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
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      transactionProvider.transaction[index]['category'],
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 17,
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
