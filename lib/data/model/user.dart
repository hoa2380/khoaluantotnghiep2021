import 'dart:convert';

class User {
  User({
    this.success,
    this.data,
  });

  bool success;
  Data data;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
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
    this.token,
    this.id,
    this.user,
  });

  String token;
  int id;
  UserClass user;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        id: json["id"],
        user: UserClass.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "id": id,
        "user": user.toJson(),
      };
}

class UserClass {
  UserClass({
    this.id,
    this.username,
    this.email,
    this.role,
    this.isActive,
    this.name,
    this.phoneNumber,
    this.registerDate,
  });

  int id;
  String username;
  String email;
  int role;
  int isActive;
  dynamic name;
  dynamic phoneNumber;
  DateTime registerDate;

  factory UserClass.fromRawJson(String str) =>
      UserClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        role: json["role"],
        isActive: json["isActive"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        registerDate: DateTime.parse(json["registerDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "role": role,
        "isActive": isActive,
        "name": name,
        "phoneNumber": phoneNumber,
        "registerDate": registerDate.toIso8601String(),
      };

  @override
  String toString() {
    return 'User Info: {id: $id, username: $username, email: $email, role: $role, isActive: $isActive, name: $name, phoneNumber: $phoneNumber, registerDate: $registerDate}';
  }
}
