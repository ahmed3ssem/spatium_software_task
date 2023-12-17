// To parse this JSON data, do
//
//     final ordersModel = ordersModelFromJson(jsonString);

import 'dart:convert';

List<OrdersModel> ordersModelFromJson(String str) => List<OrdersModel>.from(json.decode(str).map((x) => OrdersModel.fromJson(x)));

String ordersModelToJson(List<OrdersModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrdersModel {
  String id;
  bool isActive;
  String price;
  String company;
  String picture;
  String buyer;
  List<String> tags;
  String status;
  String registered;

  OrdersModel({
    required this.id,
    required this.isActive,
    required this.price,
    required this.company,
    required this.picture,
    required this.buyer,
    required this.tags,
    required this.status,
    required this.registered,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
    id: json["id"],
    isActive: json["isActive"],
    price: json["price"],
    company: json["company"],
    picture: json["picture"],
    buyer: json["buyer"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    status: json["status"],
    registered: json["registered"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "isActive": isActive,
    "price": price,
    "company": company,
    "picture": picture,
    "buyer": buyer,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "status": status,
    "registered": registered,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
