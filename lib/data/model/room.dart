import 'dart:convert';

class Room {
  Room({
    this.success,
    this.data,
  });

  bool success;
  Data data;

  factory Room.fromRawJson(String str) => Room.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Room.fromJson(Map<String, dynamic> json) => Room(
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
    this.id,
    this.roomName,
    this.label,
    this.isActive,
    this.isOpenning,
    this.customerName,
    this.distrupTime,
    this.disturbDate,
    this.disturbSession,
  });

  int id;
  String roomName;
  String label;
  int isActive;
  int isOpenning;
  String customerName;
  int distrupTime;
  dynamic disturbDate;
  dynamic disturbSession;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        roomName: json["roomName"],
        label: json["label"],
        isActive: json["isActive"],
        isOpenning: json["isOpenning"],
        customerName: json["customerName"],
        distrupTime: json["distrupTime"],
        disturbDate: json["disturbDate"],
        disturbSession: json["disturbSession"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "roomName": roomName,
        "label": label,
        "isActive": isActive,
        "isOpenning": isOpenning,
        "customerName": customerName,
        "distrupTime": distrupTime,
        "disturbDate": disturbDate,
        "disturbSession": disturbSession,
      };

  @override
  String toString() {
    return 'Data{id: $id, roomName: $roomName, label: $label, isActive: $isActive, isOpenning: $isOpenning, customerName: $customerName, distrupTime: $distrupTime, disturbDate: $disturbDate, disturbSession: $disturbSession}';
  }
}
