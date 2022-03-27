import 'package:sugar_duck/database/databaseManager.dart';
import 'package:sugar_duck/database_entities/client.dart';

newClient(Client newClient) async {
  final db = await DatabaseManager.db.database;
  var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Client");
  int id = int.parse(table.first["id"].toString());
  newClient.id = id;

  var res = await db.insert("Client", newClient.toJson());
  return res;
}

getClient(int id) async {
  final db = await DatabaseManager.db.database;
  var res = await db.query("Client", where: "id = ?", whereArgs: [id]);
  return res.isNotEmpty ? Client.fromJson(res.first) : null;
}

getAllClients() async {
  final db = await DatabaseManager.db.database;
  var res = await db.query("Client");
  List<Client> clients =
      res.isNotEmpty ? res.map((json) => Client.fromJson(json)).toList() : [];
  return clients;
}

updateClient(Client clientForUpdate) async {
  final db = await DatabaseManager.db.database;
  var res = await db.update("Client", clientForUpdate.toJson(),
      where: "id == ?", whereArgs: [clientForUpdate.id]);
  return res;
}

deleteClient(int id) async {
  final db = await DatabaseManager.db.database;
  db.delete("Client", where: "id = ?", whereArgs: [id]);
}
