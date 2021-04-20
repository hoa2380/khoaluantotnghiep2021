class Infor {
  Infor({
    this.success,
    this.data,
  });

  bool success;
  Data data;

  factory Infor.fromJson(Map<String, dynamic> json) => Infor(
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
  List<InforDatum> data;
  int totalPage;
  int count;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    page: json["page"],
    data: List<InforDatum>.from(json["data"].map((x) => InforDatum.fromJson(x))),
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

class InforDatum {
  InforDatum({
    this.id,
    this.title,
    this.content,
    this.imagePaths,
    this.dateCreated,
    this.status,
    this.avatar,
  });

  int id;
  String title;
  String content;
  String imagePaths;
  DateTime dateCreated;
  int status;
  String avatar;

  factory InforDatum.fromJson(Map<String, dynamic> json) => InforDatum(
    id: json["id"],
    title: json["title"],
    content: json["content"],
    imagePaths: json["imagePaths"],
    dateCreated: DateTime.parse(json["dateCreated"]),
    status: json["status"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "content": content,
    "imagePaths": imagePaths,
    "dateCreated": dateCreated.toIso8601String(),
    "status": status,
    "avatar": avatar,
  };
}
