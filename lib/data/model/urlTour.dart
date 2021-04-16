import 'dart:convert';

UrlTour urlTourFromJson(String str) => UrlTour.fromJson(json.decode(str));

String urlTourToJson(UrlTour data) => json.encode(data.toJson());

class UrlTour {
  UrlTour({
    this.success,
    this.urlTourData,
  });

  bool success;
  UrlTourData urlTourData;

  factory UrlTour.fromRawJson(String str) => UrlTour.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UrlTour.fromJson(Map<String, dynamic> json) => UrlTour(
    success: json["success"],
    urlTourData: UrlTourData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": urlTourData.toJson(),
  };
}

class UrlTourData {
  UrlTourData({
    this.url,
  });

  String url;

  factory UrlTourData.fromRawJson(String str) =>
      UrlTourData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UrlTourData.fromJson(Map<String, dynamic> json) => UrlTourData(
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
  };

  @override
  String toString() {
    return 'UrlTourData{url: $url}';
  }
}
