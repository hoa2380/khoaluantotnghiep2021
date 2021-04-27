import 'dart:convert';

class Photo {
  Photo({
    this.success,
    this.data,
  });

  bool success;
  Data data;

  factory Photo.fromRawJson(String str) => Photo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
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
    this.filePath,
  });

  String filePath;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    filePath: json["filePath"],
  );

  Map<String, dynamic> toJson() => {
    "filePath": filePath,
  };

  @override
  String toString() {
    return 'Photo: {filePath: $filePath}';
  }
}