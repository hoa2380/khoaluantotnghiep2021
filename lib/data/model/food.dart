import 'dart:convert';

class Food {
  Food({
    this.success,
    this.data,
  });

  bool success;
  Data data;

  factory Food.fromRawJson(String str) => Food.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Food.fromJson(Map<String, dynamic> json) => Food(
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
  List<FoodDatum> data;
  int totalPage;
  int count;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        page: json["page"],
        data: List<FoodDatum>.from(
            json["data"].map((x) => FoodDatum.fromJson(x))),
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

class FoodDatum {
  FoodDatum({
    this.id,
    this.name,
    this.englishName,
    this.description,
    this.imagePath,
    this.categoryId,
    this.pricing,
    this.currency,
    this.foodUnit,
    this.isActive,
    this.priority,
    this.sku,
    this.prefixCode,
  });

  int id;
  String name;
  String englishName;
  String description;
  String imagePath;
  int categoryId;
  int pricing;
  int currency;
  int foodUnit;
  int isActive;
  int priority;
  dynamic sku;
  dynamic prefixCode;

  factory FoodDatum.fromRawJson(String str) =>
      FoodDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FoodDatum.fromJson(Map<String, dynamic> json) => FoodDatum(
        id: json["id"],
        name: json["name"],
        englishName: json["englishName"],
        description: json["description"],
        imagePath: json["imagePath"],
        categoryId: json["categoryId"],
        pricing: json["pricing"],
        currency: json["currency"],
        foodUnit: json["foodUnit"],
        isActive: json["isActive"],
        priority: json["priority"],
        sku: json["SKU"],
        prefixCode: json["prefixCode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "englishName": englishName,
        "description": description,
        "imagePath": imagePath,
        "categoryId": categoryId,
        "pricing": pricing,
        "currency": currency,
        "foodUnit": foodUnit,
        "isActive": isActive,
        "priority": priority,
        "SKU": sku,
        "prefixCode": prefixCode,
      };

  @override
  String toString() {
    return 'Food: {id: $id, name: $name, englishName: $englishName, description: $description, imagePath: $imagePath, categoryId: $categoryId, pricing: $pricing, currency: $currency, foodUnit: $foodUnit, isActive: $isActive, priority: $priority, sku: $sku, prefixCode: $prefixCode}';
  }
}
