import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> recentTransition = [
    {'amount': '1500', 'category': 'Income'},
    {
      "amount": "2500",
      "category": "Food",
    },
    {'amount': '1500', 'category': 'Income'},
  ];

  String formattedDate = DateFormat('EEEE, MMMM d').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
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
                            width: 90,
                          ),
                          Text(
                            'Vishnu',
                            style:
                            TextStyle(color: Colors.black, fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      height: 7,
                    ),
                    SizedBox(
                      height: 45,
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
                              '4500.0',
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
                      height: 30,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 150,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.green.shade500,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 45,
                                height: 40,
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
                                width: 15,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text('Income',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                  Text('2500',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 150,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.red.shade500,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 45,
                                height: 40,
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
                                width: 15,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text('Expense',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                  Text('2780',
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
                      borderRadius: BorderRadius.circular(20.0),
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue.shade200,
                          Colors.blue.shade200,
                          Colors.blue.shade200,
                          Colors.blue.shade200,
                        ]
                      )
                    // color: Colors.blue.shade300,
                  ),
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey.shade200),
                                child: Text(
                                  'Recent Transaction',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                )),
                            ElevatedButton(
                                onPressed: () {},
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
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: MediaQuery.sizeOf(context).height,
                        child: ListView.builder(
                          itemCount: recentTransition.length,
                          itemBuilder: (BuildContext context, int index) {
                            String amount =
                            recentTransition[index]['amount'].toString();

                            return Padding(
                              padding: EdgeInsets.only(
                                  right: 18, left: 18, top: 8, bottom: 8),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white70,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      recentTransition[index]['amount'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      recentTransition[index]['category'],
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
                      )
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
