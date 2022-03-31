import 'package:sugar_duck/database/databaseManager.dart';
import 'package:sugar_duck/database_entities/operation.dart';

class OperationManager {

  static newOperation(Operation newOperation) async {
    final db = await DatabaseManager.db.database;
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Operation");
    int id = int.parse(table.first["id"].toString());
    newOperation.id = id;

    var res = await db.insert("Operation", newOperation.toJson());
    return res;
  }

  static getOperation(int id) async {
    final db = await DatabaseManager.db.database;
    var res = await db.query("Operation", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Operation.fromJson(res.first) : null;
  }

  static getAllOperations() async {
    final db = await DatabaseManager.db.database;
    var res = await db.query("Operation");
    List<Operation> operations =
    res.isNotEmpty ? res.map((json) => Operation.fromJson(json)).toList() : [];
    return operations;
  }

  static getSumOfOperations() async {
    final db = await DatabaseManager.db.database;
    var res = await db.rawQuery("select sum(sum) from Operations");
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