// To parse this JSON data, do
//
//     final unpaidTransaction = unpaidTransactionFromJson(jsonString);

import 'dart:convert';

class UnpaidTransaction {
  UnpaidTransaction({
    this.unpaid,
    this.months,
  });

  final List<Unpaid>? unpaid;
  final List<Month>? months;

  UnpaidTransaction copyWith({
    List<Unpaid>? unpaid,
    List<Month>? months,
  }) =>
      UnpaidTransaction(
        unpaid: unpaid ?? this.unpaid,
        months: months ?? this.months,
      );

  factory UnpaidTransaction.fromRawJson(String str) =>
      UnpaidTransaction.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UnpaidTransaction.fromJson(Map<String, dynamic> json) =>
      UnpaidTransaction(
        unpaid: json["unpaid"] == null
            ? []
            : List<Unpaid>.from(json["unpaid"]!.map((x) => Unpaid.fromJson(x))),
        months: json["months"] == null
            ? []
            : List<Month>.from(json["months"]!.map((x) => Month.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "unpaid": unpaid == null
            ? []
            : List<dynamic>.from(unpaid!.map((x) => x.toJson())),
        "months": months == null
            ? []
            : List<dynamic>.from(months!.map((x) => x.toJson())),
      };
}

class Month {
  Month({
    this.year,
    this.month,
    this.totalAmount,
  });

  final int? year;
  final int? month;
  final double? totalAmount;

  Month copyWith({
    int? year,
    int? month,
    double? totalAmount,
  }) =>
      Month(
        year: year ?? this.year,
        month: month ?? this.month,
        totalAmount: totalAmount ?? this.totalAmount,
      );

  factory Month.fromRawJson(String str) => Month.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Month.fromJson(Map<String, dynamic> json) => Month(
        year: json["Year"],
        month: json["month"],
        totalAmount: json["totalAmount"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "Year": year,
        "month": month,
        "totalAmount": totalAmount,
      };
}

class Unpaid {
  Unpaid({
    this.totalAmount,
    this.count,
  });

  final double? totalAmount;
  final int? count;

  Unpaid copyWith({
    double? totalAmount,
    int? count,
  }) =>
      Unpaid(
        totalAmount: totalAmount ?? this.totalAmount,
        count: count ?? this.count,
      );

  factory Unpaid.fromRawJson(String str) => Unpaid.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Unpaid.fromJson(Map<String, dynamic> json) => Unpaid(
        totalAmount: json["totalAmount"]?.toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "totalAmount": totalAmount,
        "count": count,
      };
}
