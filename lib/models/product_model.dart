// To parse this JSON data, do
//
//     final carProduct = carProductFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CarProduct carProductFromJson(String str) =>
    CarProduct.fromJson(json.decode(str));

String carProductToJson(CarProduct data) => json.encode(data.toJson());

class CarProduct {
  CarProduct({
    required this.error,
    required this.data,
    required this.message,
  });

  bool error;
  List<Datum> data;
  String message;

  factory CarProduct.fromJson(Map<String, dynamic> json) => CarProduct(
        error: json["error"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.detail,
    required this.price,
    required this.status,
    required this.productImg,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String detail;
  int price;
  int status;
  String productImg;
  DateTime createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        detail: json["detail"],
        price: json["price"],
        status: json["status"],
        productImg: json["product_img"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "detail": detail,
        "price": price,
        "status": status,
        "product_img": productImg,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
