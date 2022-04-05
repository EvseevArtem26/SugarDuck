import 'package:sugar_duck/database/databaseManager.dart';
import 'package:sugar_duck/database_entities/operation.dart';

class OperationManager {
  static late List<Operation> operations = List<Operation>.empty();

  static update() async {
    final db = await DatabaseManager.db.database;
    var res = await db.query("Operation");
    print (res);
    List<Operation> _operations =
    res.isNotEmpty ? res.map((json) => Operation.fromJson(json)).toList() : [];
    operations = _operations;
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


  static double getSumOfOperations() {
    double sum = 0;
    for (var element in operations) {sum += element.sum;}
    return sum;
  }

  static updateOperation(Operation operationForUpdate) async {
    final db = await DatabaseManager.db.database;
    var res = await db.update("Operation", operationForUpdate.toJson(),
        where: "id == ?", whereArgs: [operationForUpdate.id]);
    return res;
  }

  static deleteOperation(int id) async {
    final db = await DatabaseManager.db.database;
    db.delete("Operation", where: "id = ?", whereArgs: [id]);
  }
}