// To parse this JSON data, do
//
//     final rate = rateFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

Rate rateFromJson(String str) => Rate.fromJson(json.decode(str));

String rateToJson(Rate data) => json.encode(data.toJson());

class Rate extends Equatable {
  const Rate({
    this.data,
    this.timestamp,
  });

  final Data? data;
  final int? timestamp;

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data!.toJson(),
        "timestamp": timestamp,
      };

  @override
  List<Object?> get props => [data, timestamp];
}

class Data {
  Data({
    this.id,
    this.symbol,
    this.currencySymbol,
    this.type,
    this.rateUsd,
  });

  String? id;
  String? symbol;
  String? currencySymbol;
  String? type;
  String? rateUsd;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        symbol: json["symbol"],
        currencySymbol: json["currencySymbol"],
        type: json["type"],
        rateUsd: json["rateUsd"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "currencySymbol": currencySymbol,
        "type": type,
        "rateUsd": rateUsd,
      };
}
