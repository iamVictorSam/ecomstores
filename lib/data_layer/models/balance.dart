// To parse this JSON data, do
//
//     final balance = balanceFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Balance balanceFromJson(String str) => Balance.fromJson(json.decode(str));

String balanceToJson(Balance data) => json.encode(data.toJson());

class Balance {
  Balance({
    required this.status,
    required this.message,
    required this.balance,
  });

  String status;
  String message;
  String balance;

  factory Balance.fromJson(Map<String, dynamic> json) => Balance(
        status: json["status"],
        message: json["message"],
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "balance": balance,
      };
}
