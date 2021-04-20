import 'dart:convert';

class Category {
  Category({
    this.success,
    this.data,
  });

  bool success;
  Data data;

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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
  List<CategoryDatum> data;
  int totalPage;
  int count;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    page: json["page"],
    data: List<CategoryDatum>.from(json["data"].map((x) => CategoryDatum.fromJson(x))),
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

class CategoryDatum {
  CategoryDatum({
    this.id,
    this.name,
    this.image,
    this.description,
    this.tags,
    this.isActive,
  });

  int id;
  String name;
  dynamic image;
  String description;
  String tags;
  int isActive;

  factory CategoryDatum.fromRawJson(String str) => CategoryDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryDatum.fromJson(Map<String, dynamic> json) => CategoryDatum(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    description: json["description"],
    tags: json["tags"],
    isActive: json["isActive"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "description": description,
    "tags": tags,
    "isActive": isActive,
  };

  @override
  String toString() {
    return 'Categories: {id: $id, name: $name, image: $image, description: $description, tags: $tags, isActive: $isActive}';
  }
}
