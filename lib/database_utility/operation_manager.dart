import 'package:intl/intl.dart';
import 'package:sugar_duck/database/databaseManager.dart';
import 'package:sugar_duck/database_entities/operation.dart';
import 'package:sugar_duck/database_utility/client_manager.dart';

class OperationManager {
  static Map<String, String> nameInDataBase = {
    "Зарплата": "salary",
    "Подарки": "gifts",
    "Пособия": "benefits",
    "Прочие доходы": "other income",
    "Одежда": "clothes",
    "Еда и напитки": "food and drinks",
    "Развлечения": "entertainments",
    "Прочие расходы": "other expenses",
  };

  static late List<Operation> operations = List<Operation>.empty();

  static int compareOperations(Operation op1, Operation op2) {
    if (DateTime.parse(op1.date).isAfter(DateTime.parse(op2.date))) {
      return 0;
    } else {
      return 1;
    }
  }

  static update() async {
    final db = await DatabaseManager.db.database;
    var now = DateTime.now();
    var res = await db.query("Operation", where: "client_id == ?", whereArgs: [ClientManager.currentClient.id,
      /*DateFormat('yyyy-MM').format(now).toString() + "-1 00:00:00", DateFormat('yyyy-MM').format(DateTime(now.year, now.month+1)).toString() + "-1 00:00:00"*/]);
    print (res);
    List<Operation> _operations =
    res.isNotEmpty ? res.map((json) => Operation.fromJson(json)).toList() : [];
    operations = _operations;
    operations.sort(compareOperations);
    print(operations);
  }

  static newOperation(Operation newOperation) async {
    final db = await DatabaseManager.db.database;
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Operation");
    var t = table.first["id"];
    newOperation.id = table.first["id"] == null ? 0 : int.parse(t.toString());
    print (newOperation.id);

    var res = await db.insert("Operation", newOperation.toJson());
    return res;
  }

  static getOperation(int id) async {
    final db = await DatabaseManager.db.database;
    var res = await db.query("Operation", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Operation.fromJson(res.first) : null;
  }
  
  static int getIncomeOperationsCount() {
    int incomeCount = 0;
    for (var element in operations) {if(element.type == "income") incomeCount++;}
    return incomeCount;
  }
  static double getIncomeOperationsSum() {
    double incomeSum = 0;
    for (var element in operations) {if(element.type == "income") incomeSum += element.sum;}
    return incomeSum;
  }

  static int getExpenseOperationsCount() {
    int incomeCount = 0;
    for (var element in operations) {if(element.type == "expense") incomeCount++;}
    return incomeCount;
  }

  static double getExpenseOperationsSum() {
    double expenseSum = 0;
    for (var element in operations) {if(element.type == "expense") expenseSum += element.sum;}
    return expenseSum;
  }
  static double getOperationsSumWithCategory(String category) {
    double expenseSum = 0;
    for (var element in operations) {if(element.category == category) expenseSum += element.sum;}
    return expenseSum;
  }

  static List<Operation> getOperationsWithCategory(String category) {
    var tempOperations = List<Operation>.empty(growable: true);
    operations.forEach((element) {if(element.category == category) tempOperations.add(element);});
    return tempOperations;
  }

  static int getOperationsCountWithCategory(String category) {
    int incomeCount = 0;
    for (var element in operations) {if(element.category == category) incomeCount++;}
    return incomeCount;
  }

  static double getSumOfOperations() {
    double sum = 0;
    for (var element in operations) {sum += element.sum;}
    return sum;
  }

  static updateOperation(Operation operationForUpdate) async {
    final db = await DatabaseManager.db.database;
    var res = await db.update("Operation", operationForUpdate.toJson(),
        where: "id == ?", whereArgs: [operationForUpdate.id]);
    await update();
    return res;
  }

  static deleteOperation(String name, String date) async {
    final db = await DatabaseManager.db.database;
    db.delete("Operation", where: "name = ? AND date = ?", whereArgs: [name, date]);
    await update();
  }
}