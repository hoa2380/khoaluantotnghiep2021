import 'dart:convert';

class Cart {
  Cart({
    this.success,
    this.data,
  });

  bool success;
  Data data;

  factory Cart.fromRawJson(String str) => Cart.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
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
    this.cartId,
    this.roomId,
    this.type,
    this.currency,
    this.promo,
    this.discount,
    this.totalMoney,
    this.userCreateBill,
    this.roomSessionId,
    this.signatureImagePath,
    this.note,
  });

  int cartId;
  int roomId;
  String type;
  int currency;
  String promo;
  int discount;
  int totalMoney;
  int userCreateBill;
  int roomSessionId;
  String signatureImagePath;
  String note;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    cartId: json["cartId"],
    roomId: json["roomId"],
    type: json["type"],
    currency: json["currency"],
    promo: json["promo"],
    discount: json["discount"],
    totalMoney: json["totalMoney"],
    userCreateBill: json["userCreateBill"],
    roomSessionId: json["roomSessionId"],
    signatureImagePath: json["signatureImagePath"],
    note: json["note"],
  );

  Map<String, dynamic> toJson() => {
    "cartId": cartId,
    "roomId": roomId,
    "type": type,
    "currency": currency,
    "promo": promo,
    "discount": discount,
    "totalMoney": totalMoney,
    "userCreateBill": userCreateBill,
    "roomSessionId": roomSessionId,
    "signatureImagePath": signatureImagePath,
    "note": note,
  };

  @override
  String toString() {
    return 'Cart: {cartId: $cartId, roomId: $roomId, type: $type, currency: $currency, promo: $promo, discount: $discount, totalMoney: $totalMoney, userCreateBill: $userCreateBill, roomSessionId: $roomSessionId, signatureImagePath: $signatureImagePath, note: $note}';
  }
}