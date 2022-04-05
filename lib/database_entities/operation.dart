import 'dart:convert';

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
  String date;
  String category;
  String type;
  int client;

  factory Operation.fromJson(Map<String, dynamic> json) => Operation(
        id: json["id"],
        name: json["name"],
        sum: json["sum"],
        date: json["date"],
        category: json["category"],
        type: json["type"],
        client: json["client_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sum": sum,
        "date": date,
        "category": category,
        "type": type,
        "client_id": client,
      };

  static Operation empty() {
    return Operation(id: -1, name: "undefined", sum: 0.0, date: "undefined", category: "undefined", type: "undefined", client: -1);
  }
}
