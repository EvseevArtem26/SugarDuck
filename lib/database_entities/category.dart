import 'dart:convert';

enum CategoryType
{
  salary,
  gifts,
  allowances,
  otherIncome,
  foodAndNutrition,
  clothing,
  entertainment,
  otherExpenses,
}

enum Type
{
  income,
  expense,
}

Category categoryFromJson(String str)
{
  final jsonData = json.decode(str);
  return Category.fromJson(jsonData);
}

String categoryToJson(Category category)
{
  final data = category.toJson();
  return json.encode(data);
}

class Category
{
  Category({required this.id, required this.categoryType, required this.type});

  int id;
  CategoryType categoryType;
  Type type;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
      id: json["id"],
      categoryType: json["categoryType"],
      type: json["type"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categoryType": categoryType,
    "type": type
  };

}