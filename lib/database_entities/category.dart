import 'dart:convert';

enum CategoryType {
  salary,
  gifts,
  allowances,
  otherIncome,
  foodAndNutrition,
  clothing,
  entertainment,
  otherExpenses,
}

Category categoryFromJson(String str) {
  final jsonData = json.decode(str);
  return Category.fromJson(jsonData);
}

String categoryToJson(Category category) {
  final data = category.toJson();
  return json.encode(data);
}

class Category {
  Category({required this.id, required this.categoryType});

  int id;
  CategoryType categoryType;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
      id: json["id"], categoryType: json["categoryType"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "categoryType": categoryType};
}
