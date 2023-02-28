// To parse this JSON data, do
//
//     final dokanAdmin = dokanAdminFromJson(jsonString);

import 'dart:convert';

class DokanAdmin {
  DokanAdmin({
    required this.createdDokan,
  });

  final CreatedDokan createdDokan;

  DokanAdmin copyWith({
    CreatedDokan? createdDokan,
  }) =>
      DokanAdmin(
        createdDokan: createdDokan ?? this.createdDokan,
      );

  factory DokanAdmin.fromRawJson(String str) =>
      DokanAdmin.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DokanAdmin.fromJson(Map<String, dynamic> json) => DokanAdmin(
        createdDokan: CreatedDokan.fromJson(json["createdDokan"]),
      );

  Map<String, dynamic> toJson() => {
        "createdDokan": createdDokan.toJson(),
      };
}

class CreatedDokan {
  CreatedDokan({
    required this.id,
    required this.dokanName,
    required this.phone,
    required this.password,
    required this.address,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
  });

  final int id;
  final String dokanName;
  final String phone;
  final String password;
  final String address;
  final String status;
  final DateTime updatedAt;
  final DateTime createdAt;

  CreatedDokan copyWith({
    int? id,
    String? dokanName,
    String? phone,
    String? password,
    String? address,
    String? status,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) =>
      CreatedDokan(
        id: id ?? this.id,
        dokanName: dokanName ?? this.dokanName,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        address: address ?? this.address,
        status: status ?? this.status,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
      );

  factory CreatedDokan.fromRawJson(String str) =>
      CreatedDokan.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreatedDokan.fromJson(Map<String, dynamic> json) => CreatedDokan(
        id: json["id"],
        dokanName: json["dokanName"],
        phone: json["phone"],
        password: json["password"],
        address: json["address"],
        status: json["status"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dokanName": dokanName,
        "phone": phone,
        "password": password,
        "address": address,
        "status": status,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };
}
