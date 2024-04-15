import 'package:expense_tracker/controller/home_screen_controller.dart';
import 'package:expense_tracker/view/home_screen/list_view.dart';
import 'package:expense_tracker/view/home_screen/record_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Future<void> getdatas() async {
  await HomeScreenController.getData();
}

class _HomeScreenState extends State<HomeScreen> {
  late var income;
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    await HomeScreenController.getData();
  }

  @override
  Widget build(BuildContext context) {
    void TotalAmt() {
      income = HomeScreenController.calculateTotal();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CircleAvatar(radius: 10, child: Icon(Icons.person)),
        ),
        title: Column(
          children: [
            Text(
              "Hello Shobin",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "welcome back!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 10),
              ),
            ),
          ],
        ),
        actions: [
          Icon(
            Icons.reorder,
            color: Colors.white,
          )
        ],
      ),
      body: Column(
        children: [
          Column(
            children: [
              Container(
                height: 270,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Text(
                        "Balance",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "\$14.00",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 80,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                        ),
                        Container(
                          height: 80,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Recent Transactions",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => listtile(
                            amount: HomeScreenController.datas[index].amount,
                            category:
                                HomeScreenController.datas[index].category,
                            date: HomeScreenController.datas[index].date,
                            note: HomeScreenController.datas[index].title,
                            isIncome:
                                HomeScreenController.datas[index].isIncome),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                        itemCount: HomeScreenController.datas.length),
                  )
                ],
              )
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddRecord(),
              ));
        },
        child: Icon(
          Icons.add,
          size: 50,
          color: Colors.red,
        ),
      ),
    );
  }
}
