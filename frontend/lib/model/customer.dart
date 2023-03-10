import 'dart:convert';

class Customer {
  Customer({
    this.id,
    this.dokanId,
    this.customerName,
    this.customerPhone,
    this.customerAddress,
    this.totalAmount,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final int? dokanId;
  final String? customerName;
  final String? customerPhone;
  final String? customerAddress;
  final double? totalAmount;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Customer copyWith({
    int? id,
    int? dokanId,
    String? customerName,
    String? customerPhone,
    String? customerAddress,
    double? totalAmount,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Customer(
        id: id ?? this.id,
        dokanId: dokanId ?? this.dokanId,
        customerName: customerName ?? this.customerName,
        customerPhone: customerPhone ?? this.customerPhone,
        customerAddress: customerAddress ?? this.customerAddress,
        totalAmount: totalAmount ?? this.totalAmount,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Customer.fromRawJson(String str) =>
      Customer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        dokanId: json["dokanId"],
        customerName: json["customerName"],
        customerPhone: json["customerPhone"],
        customerAddress: json["customerAddress"],
        totalAmount: json["totalAmount"].toDouble(),
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
        "customerName": customerName,
        "customerPhone": customerPhone,
        "customerAddress": customerAddress,
        "totalAmount": totalAmount,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
