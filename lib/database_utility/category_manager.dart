import 'package:sugar_duck/database/databaseManager.dart';
import 'package:sugar_duck/database_entities/category.dart';

newCategory(Category newCategory) async {
  final db = await DatabaseManager.db.database;
  var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Category");
  int id = int.parse(table.first["id"].toString());
  newCategory.id = id;

  var res = await db.insert("Category", newCategory.toJson());
  return res;
}

getCategory(int id) async {
  final db = await DatabaseManager.db.database;
  var res = await db.query("Category", where: "id = ?", whereArgs: [id]);
  return res.isNotEmpty ? Category.fromJson(res.first) : null;
}

getAllCategories() async {
  final db = await DatabaseManager.db.database;
  var res = await db.query("Category");
  List<Category> categories =
  res.isNotEmpty ? res.map((json) => Category.fromJson(json)).toList() : [];
  return categories;
}

updateCategory(Category categoryForUpdate) async {
  final db = await DatabaseManager.db.database;
  var res = await db.update("Category", categoryForUpdate.toJson(),
      where: "id == ?", whereArgs: [categoryForUpdate.id]);
  return res;
}

deleteCategory(int id) async {
  final db = await DatabaseManager.db.database;
  db.delete("Category", where: "id = ?", whereArgs: [id]);
}
