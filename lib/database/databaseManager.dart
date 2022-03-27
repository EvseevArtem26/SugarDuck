import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseManager {
  DatabaseManager._();

  static final DatabaseManager db = DatabaseManager._();

  static Database? _database;

  Future<Database> get database async {
      return _database ?? await initDatabase();
  }

  initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "sugarDuck.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''CREATE TABLE IF NOT EXISTS "Category" (
        "id"	INTEGER NOT NULL UNIQUE,
        "type-category"	TEXT NOT NULL CHECK("type-category" IN ("salary", "gifts", "benefits", "other income", "food and nutrition", "clothes", "entertainment", "other expenses")),
        "type"	TEXT CHECK("type" in ("income", "expense")),
        PRIMARY KEY("id" AUTOINCREMENT)
      )''');
      await db.execute('''CREATE TABLE IF NOT EXISTS "Client" (
        "id"	INTEGER NOT NULL UNIQUE,
        "email"	TEXT NOT NULL,
        "password"	TEXT NOT NULL,
        "currency"	TEXT NOT NULL DEFAULT 'RUB',
        PRIMARY KEY("id" AUTOINCREMENT)
      )''');
      await db.execute('''CREATE TABLE IF NOT EXISTS "Operation" (
        "id"	INTEGER NOT NULL UNIQUE,
        "name"	TEXT NOT NULL,
        "sum"	REAL NOT NULL,
        "date"	TEXT NOT NULL,
        "category_id"	INTEGER NOT NULL,
        "client_id"	INTEGER NOT NULL,
        PRIMARY KEY("name"),
        FOREIGN KEY("client_id") REFERENCES "Client"("id"),
        FOREIGN KEY("category_id") REFERENCES "Category"("id")
      )''');
    });
  }
}
