
class ExpenseModel {
  String title;
  String category;
  var amount;
  String date;
  bool isIncome;

  ExpenseModel({
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
    required this.isIncome,
  });
}
