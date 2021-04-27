import 'dart:convert';

class CartResult {
  CartResult({
    this.success,
    this.data,
  });

  bool success;
  int data;

  factory CartResult.fromRawJson(String str) =>
      CartResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CartResult.fromJson(Map<String, dynamic> json) => CartResult(
    success: json["success"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data,
  };

  @override
  String toString() {
    return 'CartResult: {success: $success, data: $data}';
  }
}