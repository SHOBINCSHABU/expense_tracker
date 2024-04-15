
import 'package:flutter/material.dart';

class listtile extends StatelessWidget {
  const listtile(
      {super.key,
      required this.amount,
      required this.category,
      required this.date,
      required this.note,
      required this.isIncome});
  final String category;
  final int amount;
  final String date;
  final String note;
  final bool isIncome;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            isIncome == true
                ? CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.arrow_upward,
                      size: 11,
                    ))
                : CircleAvatar(
                    radius: 12,
                    child: Icon(
                      Icons.arrow_downward,
                      size: 11,
                    )),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  note,
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  isIncome == true ? "+\$$amount" : "-\$$amount",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  date,
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.normal),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
