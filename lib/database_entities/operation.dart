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
      required this.type,
      required this.client});

  int id;
  String name;
  double sum;
  DateTime date;
  Category category;
  String type;
  Client client;

  factory Operation.fromJson(Map<String, dynamic> json) => Operation(
        id: json["id"],
        name: json["name"],
        sum: json["sum"],
        date: json["date"],
        category: json["category"],
        type: json["type"],
        client: json["client"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sum": sum,
        "date": date,
        "type": type,
        "client": client,
      };
}
