import 'dart:convert';

import 'package:get/get.dart';

class Laundry {
  Laundry({
    this.success,
    this.data,
  });

  bool success;
  Data data;

  factory Laundry.fromRawJson(String str) => Laundry.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Laundry.fromJson(Map<String, dynamic> json) => Laundry(
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.page,
    this.data,
    this.totalPage,
    this.count,
  });

  int page;
  List<LaundryDatum> data;
  int totalPage;
  int count;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    page: json["page"],
    data: List<LaundryDatum>.from(json["data"].map((x) => LaundryDatum.fromJson(x))),
    totalPage: json["totalPage"],
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "totalPage": totalPage,
    "count": count,
  };
}

class LaundryDatum extends GetxController{
  LaundryDatum({
    this.id,
    this.name,
    this.englishName,
    this.description,
    this.imagePath,
    this.pricing,
    this.currency,
    this.isActive,
  });

  int id;
  String name;
  String englishName;
  String description;
  String imagePath;
  int pricing;
  int currency;
  int isActive;
  var qty = 0.obs;

  factory LaundryDatum.fromRawJson(String str) => LaundryDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LaundryDatum.fromJson(Map<String, dynamic> json) => LaundryDatum(
    id: json["id"],
    name: json["name"],
    englishName: json["englishName"],
    description: json["description"],
    imagePath: json["imagePath"],
    pricing: json["pricing"],
    currency: json["currency"],
    isActive: json["isActive"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "englishName": englishName,
    "description": description,
    "imagePath": imagePath,
    "pricing": pricing,
    "currency": currency,
    "isActive": isActive,
  };

  @override
  String toString() {
    return 'Laundry: {id: $id, name: $name, englishName: $englishName, description: $description, imagePath: $imagePath, pricing: $pricing, currency: $currency, isActive: $isActive}';
  }
}