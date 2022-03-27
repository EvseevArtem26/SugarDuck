import 'dart:convert';

import 'package:sugar_duck/database_entities/category.dart';
import 'package:sugar_duck/database_entities/client.dart';

Operation categoryFromJson(String str) {
  final jsonData = json.decode(str);
  return Operation.fromJson(jsonData);
}

String categoryToJson(Operation operation) {
  final data = operation.toJson();
  return json.encode(data);
}

class Operation {
  Operation(
      {required this.id,
      required this.name,
      required this.sum,
      required this.date,
      required this.category,
      required this.client});

  int id;
  String name;
  int sum;
  DateTime date;
  Category category;
  Client client;

  factory Operation.fromJson(Map<String, dynamic> json) => Operation(
        id: json["id"],
        name: json["name"],
        sum: json["sum"],
        date: json["date"],
        category: json["category"],
        client: json["client"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sum": sum,
        "date": date,
        "category": category,
        "client": client,
      };
}
