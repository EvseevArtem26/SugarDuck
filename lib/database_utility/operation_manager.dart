import 'package:sugar_duck/database/databaseManager.dart';
import 'package:sugar_duck/database_entities/operation.dart';


newOperation(Operation newClient) async {
  final db = await DatabaseManager.db.database;
  var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Operation");
  int id = int.parse(table.first["id"].toString());
  newClient.id = id;

  var res = await db.insert("Client", newClient.toJson());
  return res;
}

getOperation(int id) async {
  final db = await DatabaseManager.db.database;
  var res = await db.query("Operation", where: "id = ?", whereArgs: [id]);
  return res.isNotEmpty ? Operation.fromJson(res.first) : null;
}

getAllOperations() async {
  final db = await DatabaseManager.db.database;
  var res = await db.query("Client");
  List<Operation> operations =
  res.isNotEmpty ? res.map((json) => Operation.fromJson(json)).toList() : [];
  return operations;
}

updateOperation(Operation operationForUpdate) async {
  final db = await DatabaseManager.db.database;
  var res = await db.update("Operation", operationForUpdate.toJson(),
      where: "id == ?", whereArgs: [operationForUpdate.id]);
  return res;
}

deleteClient(int id) async {
  final db = await DatabaseManager.db.database;
  db.delete("Client", where: "id = ?", whereArgs: [id]);
}
