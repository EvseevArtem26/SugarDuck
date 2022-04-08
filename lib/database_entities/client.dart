import 'dart:convert';

Client clientFromJson(String str) {
  final jsonData = json.decode(str);
  return Client.fromJson(jsonData);
}

String clientToJson(Client client) {
  final data = client.toJson();
  return json.encode(data);
}

class Client {
  Client(
      {required this.id,
      required this.email,
      required this.password,
      required this.currency});

  int id;
  String email;
  String password;
  String currency;

  factory Client.fromJson(Map<String, dynamic> json) => Client(
      id: json["id"],
      email: json["email"],
      password: json["password"],
      currency: json["currency"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "email": email, "password": password, "currency": currency};

  static Client empty() => Client(id: -1, email: "", password: "", currency: "");
}
