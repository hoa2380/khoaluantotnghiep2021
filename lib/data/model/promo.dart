import 'dart:convert';

class Promo {
  Promo({
    this.success,
    this.data,
  });

  bool success;
  Data data;

  factory Promo.fromRawJson(String str) => Promo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Promo.fromJson(Map<String, dynamic> json) => Promo(
    success: json["success"] == null ? null : json["success"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "data": data == null ? null : data.toJson(),
  };
}

class Data {
  Data({
    this.listPromo,
    this.listPromoFood,
    this.listPromoCategory,
  });

  ListPromo listPromo;
  ListPromoFood listPromoFood;
  ListPromoCategory listPromoCategory;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    listPromo: json["listPromo"] == null
        ? null
        : ListPromo.fromJson(json["listPromo"]),
    listPromoFood: json["listPromoFood"] == null
        ? null
        : ListPromoFood.fromJson(json["listPromoFood"]),
    listPromoCategory: json["listPromoCategory"] == null
        ? null
        : ListPromoCategory.fromJson(json["listPromoCategory"]),
  );

  Map<String, dynamic> toJson() => {
    "listPromo": listPromo == null ? null : listPromo.toJson(),
    "listPromoFood": listPromoFood == null ? null : listPromoFood.toJson(),
    "listPromoCategory":
    listPromoCategory == null ? null : listPromoCategory.toJson(),
  };
}

class ListPromo {
  ListPromo({
    this.page,
    this.data,
    this.totalPage,
    this.count,
  });

  int page;
  List<ListPromoDatum> data;
  int totalPage;
  int count;

  factory ListPromo.fromRawJson(String str) =>
      ListPromo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListPromo.fromJson(Map<String, dynamic> json) => ListPromo(
    page: json["page"] == null ? null : json["page"],
    data: json["data"] == null
        ? null
        : List<ListPromoDatum>.from(
        json["data"].map((x) => ListPromoDatum.fromJson(x))),
    totalPage: json["totalPage"] == null ? null : json["totalPage"],
    count: json["count"] == null ? null : json["count"],
  );

  Map<String, dynamic> toJson() => {
    "page": page == null ? null : page,
    "data": data == null
        ? null
        : List<dynamic>.from(data.map((x) => x.toJson())),
    "totalPage": totalPage == null ? null : totalPage,
    "count": count == null ? null : count,
  };

  @override
  String toString() {
    return 'ListPromo: {page: $page, data: $data, totalPage: $totalPage, count: $count}';
  }
}

class ListPromoDatum {
  ListPromoDatum({
    this.id,
    this.label,
    this.discount,
    this.currency,
    this.dateStart,
    this.dateEnd,
    this.isActive,
    this.type,
    this.applyTargetType,
    this.applyTargetRooms,
  });

  int id;
  String label;
  int discount;
  int currency;
  DateTime dateStart;
  DateTime dateEnd;
  int isActive;
  int type;
  int applyTargetType;
  String applyTargetRooms;

  factory ListPromoDatum.fromRawJson(String str) =>
      ListPromoDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListPromoDatum.fromJson(Map<String, dynamic> json) => ListPromoDatum(
    id: json["id"] == null ? null : json["id"],
    label: json["label"] == null ? null : json["label"],
    discount: json["discount"] == null ? null : json["discount"],
    currency: json["currency"] == null ? null : json["currency"],
    dateStart: json["dateStart"] == null
        ? null
        : DateTime.parse(json["dateStart"]),
    dateEnd:
    json["dateEnd"] == null ? null : DateTime.parse(json["dateEnd"]),
    isActive: json["isActive"] == null ? null : json["isActive"],
    type: json["type"] == null ? null : json["type"],
    applyTargetType:
    json["applyTargetType"] == null ? null : json["applyTargetType"],
    applyTargetRooms:
    json["applyTargetRooms"] == null ? null : json["applyTargetRooms"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "label": label == null ? null : label,
    "discount": discount == null ? null : discount,
    "currency": currency == null ? null : currency,
    "dateStart": dateStart == null ? null : dateStart.toIso8601String(),
    "dateEnd": dateEnd == null ? null : dateEnd.toIso8601String(),
    "isActive": isActive == null ? null : isActive,
    "type": type == null ? null : type,
    "applyTargetType": applyTargetType == null ? null : applyTargetType,
    "applyTargetRooms": applyTargetRooms == null ? null : applyTargetRooms,
  };

  @override
  String toString() {
    return 'ListPromoDatum: {id: $id, label: $label, discount: $discount, currency: $currency, dateStart: $dateStart, dateEnd: $dateEnd, isActive: $isActive, type: $type, applyTargetType: $applyTargetType, applyTargetRooms: $applyTargetRooms}';
  }
}

class ListPromoCategory {
  ListPromoCategory({
    this.page,
    this.data,
    this.totalPage,
    this.count,
  });

  int page;
  List<ListPromoCategoryDatum> data;
  int totalPage;
  int count;

  factory ListPromoCategory.fromRawJson(String str) =>
      ListPromoCategory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListPromoCategory.fromJson(Map<String, dynamic> json) =>
      ListPromoCategory(
        page: json["page"] == null ? null : json["page"],
        data: json["data"] == null
            ? null
            : List<ListPromoCategoryDatum>.from(
            json["data"].map((x) => ListPromoCategoryDatum.fromJson(x))),
        totalPage: json["totalPage"] == null ? null : json["totalPage"],
        count: json["count"] == null ? null : json["count"],
      );

  Map<String, dynamic> toJson() => {
    "page": page == null ? null : page,
    "data": data == null
        ? null
        : List<dynamic>.from(data.map((x) => x.toJson())),
    "totalPage": totalPage == null ? null : totalPage,
    "count": count == null ? null : count,
  };
}

class ListPromoCategoryDatum {
  ListPromoCategoryDatum({
    this.id,
    this.promoId,
    this.categoryId,
  });

  int id;
  int promoId;
  int categoryId;

  factory ListPromoCategoryDatum.fromRawJson(String str) =>
      ListPromoCategoryDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListPromoCategoryDatum.fromJson(Map<String, dynamic> json) =>
      ListPromoCategoryDatum(
        id: json["id"] == null ? null : json["id"],
        promoId: json["promoId"] == null ? null : json["promoId"],
        categoryId: json["categoryId"] == null ? null : json["categoryId"],
      );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "promoId": promoId == null ? null : promoId,
    "categoryId": categoryId == null ? null : categoryId,
  };
}

class ListPromoFood {
  ListPromoFood({
    this.page,
    this.data,
    this.totalPage,
    this.count,
  });

  int page;
  List<ListPromoFoodDatum> data;
  int totalPage;
  int count;

  factory ListPromoFood.fromRawJson(String str) =>
      ListPromoFood.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListPromoFood.fromJson(Map<String, dynamic> json) => ListPromoFood(
    page: json["page"] == null ? null : json["page"],
    data: json["data"] == null
        ? null
        : List<ListPromoFoodDatum>.from(
        json["data"].map((x) => ListPromoFoodDatum.fromJson(x))),
    totalPage: json["totalPage"] == null ? null : json["totalPage"],
    count: json["count"] == null ? null : json["count"],
  );

  Map<String, dynamic> toJson() => {
    "page": page == null ? null : page,
    "data": data == null
        ? null
        : List<dynamic>.from(data.map((x) => x.toJson())),
    "totalPage": totalPage == null ? null : totalPage,
    "count": count == null ? null : count,
  };
}

class ListPromoFoodDatum {
  ListPromoFoodDatum({
    this.id,
    this.promoId,
    this.foodId,
  });

  int id;
  int promoId;
  int foodId;

  factory ListPromoFoodDatum.fromRawJson(String str) =>
      ListPromoFoodDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListPromoFoodDatum.fromJson(Map<String, dynamic> json) =>
      ListPromoFoodDatum(
        id: json["id"] == null ? null : json["id"],
        promoId: json["promoId"] == null ? null : json["promoId"],
        foodId: json["foodId"] == null ? null : json["foodId"],
      );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "promoId": promoId == null ? null : promoId,
    "foodId": foodId == null ? null : foodId,
  };
}