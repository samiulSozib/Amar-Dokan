// To parse this JSON data, do
//
//     final doaknStaff = doaknStaffFromJson(jsonString);

import 'dart:convert';

class DoaknStaff {
  DoaknStaff({
    this.allStaff,
  });

  final List<AllStaff>? allStaff;

  DoaknStaff copyWith({
    List<AllStaff>? allStaff,
  }) =>
      DoaknStaff(
        allStaff: allStaff ?? this.allStaff,
      );

  factory DoaknStaff.fromRawJson(String str) =>
      DoaknStaff.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DoaknStaff.fromJson(Map<String, dynamic> json) => DoaknStaff(
        allStaff: json["allStaff"] == null
            ? []
            : List<AllStaff>.from(
                json["allStaff"]!.map((x) => AllStaff.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "allStaff": allStaff == null
            ? []
            : List<dynamic>.from(allStaff!.map((x) => x.toJson())),
      };
}

class AllStaff {
  AllStaff({
    this.id,
    this.dokanId,
    this.staffName,
    this.phone,
    this.password,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final int? dokanId;
  final String? staffName;
  final String? phone;
  final String? password;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  AllStaff copyWith({
    int? id,
    int? dokanId,
    String? staffName,
    String? phone,
    String? password,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      AllStaff(
        id: id ?? this.id,
        dokanId: dokanId ?? this.dokanId,
        staffName: staffName ?? this.staffName,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory AllStaff.fromRawJson(String str) =>
      AllStaff.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllStaff.fromJson(Map<String, dynamic> json) => AllStaff(
        id: json["id"],
        dokanId: json["dokanId"],
        staffName: json["staffName"],
        phone: json["phone"],
        password: json["password"],
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dokanId": dokanId,
        "staffName": staffName,
        "phone": phone,
        "password": password,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
