import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  DatabaseManager._();

  static final DatabaseManager db = DatabaseManager._();

  static Database? _database;

  Future<Database> get database async {
      //await deleteDatabase(join(await getDatabasesPath(), "sugarDuck.db"));
      return _database ?? await initDatabase();
  }

  initDatabase() async {
    String path = join(await getDatabasesPath(), "sugarDuck.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''CREATE TABLE IF NOT EXISTS "Client" (
        "id"	INTEGER NOT NULL,
        "email"	TEXT NOT NULL,
        "password"	TEXT NOT NULL,
        "currency"	TEXT NOT NULL DEFAULT 'RUB',
        PRIMARY KEY("id" AUTOINCREMENT)
      )''');
      await db.execute('''CREATE TABLE IF NOT EXISTS "Operation" (
        "id"	INTEGER NOT NULL,
        "name"	TEXT NOT NULL,
        "sum"	REAL NOT NULL,
        "date"	TEXT NOT NULL,
        "category"	TEXT NOT NULL,
        "type"	TEXT CHECK("type" in ("income", "expense")),
        "client_id"	INTEGER NOT NULL,
        PRIMARY KEY("name"),
        FOREIGN KEY("client_id") REFERENCES "Client"("id")
      )''');
    });
  }
}
