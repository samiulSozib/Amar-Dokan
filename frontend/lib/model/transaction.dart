// To parse this JSON data, do
//
//     final transaction = transactionFromJson(jsonString);

import 'dart:convert';

class Transaction {
  Transaction({
    this.id,
    this.dokanId,
    this.customerName,
    this.customerPhone,
    this.customerAddress,
    this.totalAmount,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.transactions,
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
  final List<TransactionElement>? transactions;

  Transaction copyWith({
    int? id,
    int? dokanId,
    String? customerName,
    String? customerPhone,
    String? customerAddress,
    double? totalAmount,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<TransactionElement>? transactions,
  }) =>
      Transaction(
        id: id ?? this.id,
        dokanId: dokanId ?? this.dokanId,
        customerName: customerName ?? this.customerName,
        customerPhone: customerPhone ?? this.customerPhone,
        customerAddress: customerAddress ?? this.customerAddress,
        totalAmount: totalAmount ?? this.totalAmount,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        transactions: transactions ?? this.transactions,
      );

  factory Transaction.fromRawJson(String str) =>
      Transaction.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
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
        transactions: json["transactions"] == null
            ? []
            : List<TransactionElement>.from(json["transactions"]!
                .map((x) => TransactionElement.fromJson(x))),
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
        "transactions": transactions == null
            ? []
            : List<dynamic>.from(transactions!.map((x) => x.toJson())),
      };
}

class TransactionElement {
  TransactionElement({
    this.id,
    this.dokanId,
    this.customerId,
    this.dokanStaffId,
    this.transactionAmount,
    this.notes,
    this.createdAt,
    this.updatedAt,
    this.dokanstaffId,
    this.dokanstaff,
  });

  final int? id;
  final int? dokanId;
  final int? customerId;
  final int? dokanStaffId;
  final double? transactionAmount;
  final String? notes;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? dokanstaffId;
  final Dokanstaff? dokanstaff;

  TransactionElement copyWith({
    int? id,
    int? dokanId,
    int? customerId,
    int? dokanStaffId,
    double? transactionAmount,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? dokanstaffId,
    Dokanstaff? dokanstaff,
  }) =>
      TransactionElement(
        id: id ?? this.id,
        dokanId: dokanId ?? this.dokanId,
        customerId: customerId ?? this.customerId,
        dokanStaffId: dokanStaffId ?? this.dokanStaffId,
        transactionAmount: transactionAmount ?? this.transactionAmount,
        notes: notes ?? this.notes,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        dokanstaffId: dokanstaffId ?? this.dokanstaffId,
        dokanstaff: dokanstaff ?? this.dokanstaff,
      );

  factory TransactionElement.fromRawJson(String str) =>
      TransactionElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TransactionElement.fromJson(Map<String, dynamic> json) =>
      TransactionElement(
        id: json["id"],
        dokanId: json["dokanId"],
        customerId: json["customerId"],
        dokanStaffId: json["dokanStaffId"],
        transactionAmount: json["transactionAmount"].toDouble(),
        notes: json["notes"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        dokanstaffId: json["dokanstaffId"],
        dokanstaff: json["dokanstaff"] == null
            ? null
            : Dokanstaff.fromJson(json["dokanstaff"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dokanId": dokanId,
        "customerId": customerId,
        "dokanStaffId": dokanStaffId,
        "transactionAmount": transactionAmount,
        "notes": notes,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "dokanstaffId": dokanstaffId,
        "dokanstaff": dokanstaff?.toJson(),
      };
}

class Dokanstaff {
  Dokanstaff({
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
  final dynamic staffName;
  final String? phone;
  final String? password;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Dokanstaff copyWith({
    int? id,
    int? dokanId,
    dynamic staffName,
    String? phone,
    String? password,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Dokanstaff(
        id: id ?? this.id,
        dokanId: dokanId ?? this.dokanId,
        staffName: staffName ?? this.staffName,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Dokanstaff.fromRawJson(String str) =>
      Dokanstaff.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Dokanstaff.fromJson(Map<String, dynamic> json) => Dokanstaff(
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
