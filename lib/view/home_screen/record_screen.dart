import 'package:expense_tracker/view/expense_screen/expense.dart';
import 'package:expense_tracker/view/income_screen/income.dart';
import 'package:flutter/material.dart';

class AddRecord extends StatefulWidget {
  AddRecord({super.key});

  @override
  State<AddRecord> createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  var tabcontrollerIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Records",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            padding: EdgeInsets.symmetric(horizontal: 30),
            onTap: (value) {
              setState(() {});
            },
            labelColor: Colors.white,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle,
                color: Colors.black),
            tabs: [
              Tab(
                text: "Expense",
              ),
              Tab(
                text: "Income",
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [tabcontrollerIndex == 0 ? ExpenseTab() : IncomeTab()],
            ),
          ),
        ),
        //
      ),
    );
  }
}
