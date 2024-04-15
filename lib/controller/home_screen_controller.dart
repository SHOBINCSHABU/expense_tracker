import 'package:expense_tracker/model/model.dart';
import 'package:sqflite/sqflite.dart';

class HomeScreenController {
  static List<Map<String, Object?>> items = [];
  static List<ExpenseModel> datas = [];
  static late Database database;
  static String? income;
  static Future<void> initDb() async {
    database = await openDatabase("Expensedb", version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Records (id INTEGER PRIMARY KEY, title TEXTcategory TEXT, amount INTEGER, date TEXT,isIncome BIT)');
    });
  }

  static Future<void> insertData(ExpenseModel expensemodel) async {
    await database.rawInsert(
        'INSERT INTO files(title, category, amount, date,isIncome) VALUES(?, ?, ?, ?,?)',
        [
          expensemodel.title,
          expensemodel.category,
          expensemodel.amount,
          expensemodel.date,
          expensemodel.isIncome
        ]);
  }

  static Future<void> getData() async {
    items = await database.rawQuery('SELECT * FROM files');
    datas = items
        .map((e) => ExpenseModel(
            title: e['title'].toString(),
            category: e['category'].toString(),
            amount: int.parse(e['amount'].toString()),
            date: e['date'].toString(),
            isIncome: e['isIncome'].toString() == true))
        .toList();
  }

  static deleteData(int id) async {
    await database.rawDelete('DELETE FROM files WHERE id = ?', [id]);
    await getData();
  }

  static Future calculateTotal() async {
    var data = await database.rawQuery(
        "SELECT SUM(amount) as Total FROM Records WHERE isIncome = 1");
  }
}
