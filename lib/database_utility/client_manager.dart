import 'package:sugar_duck/database/databaseManager.dart';
import 'package:sugar_duck/database_entities/client.dart';

class ClientManager {
  static int currentClientID = -1;
  static bool isConfirmed = false;

  static newClient(Client newClient) async {
    final db = await DatabaseManager.db.database;
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Client");
    print(table);
    var t = table.first["id"];
    int id = 0;
    if (t != null)
    {
      int id = int.parse(t.toString());
    }

    newClient.id = id;

    var res = await db.insert("Client", newClient.toJson());
    return res;
  }

  static findEmail(String email) async {
    final db = await DatabaseManager.db.database;
    var res = await db.query("Client", where: "email = ?", whereArgs: [email]);
    return res.isNotEmpty;
  }

  static getClient(int id) async {
    final db = await DatabaseManager.db.database;
    var res = await db.query("Client", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Client.fromJson(res.first) : null;
  }

  static confirm(String email, String password) async {
    final db = await DatabaseManager.db.database;
    getAllClients();
    var res = await db.query("Client",
        where: "email = ? AND password = ?", whereArgs: [email, password]);
    isConfirmed = res.isNotEmpty;
    currentClientID = int.parse(res.first["id"].toString());
    print("Client id $currentClientID");
  }

  static getAllClients() async {
    final db = await DatabaseManager.db.database;
    var res = await db.query("Client");
    List<Client> clients =
        res.isNotEmpty ? res.map((json) => Client.fromJson(json)).toList() : [];
    return clients;
  }

  static updateClient(Client clientForUpdate) async {
    final db = await DatabaseManager.db.database;
    var res = await db.update("Client", clientForUpdate.toJson(),
        where: "id == ?", whereArgs: [clientForUpdate.id]);
    return res;
  }

  static deleteClient(int id) async {
    final db = await DatabaseManager.db.database;
    db.delete("Client", where: "id = ?", whereArgs: [id]);
  }
}
