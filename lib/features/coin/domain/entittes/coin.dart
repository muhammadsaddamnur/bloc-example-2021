import 'dart:convert';

import 'package:equatable/equatable.dart';

Coin coinFromJson(String str) => Coin.fromJson(json.decode(str));
String coinToJson(Coin data) => json.encode(data.toJson());

class Coin extends Equatable {
  const Coin({
    this.data,
    this.timestamp,
  });

  final Data? data;
  final int? timestamp;

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
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
    this.exchangeId,
    this.name,
    this.rank,
    this.percentTotalVolume,
    this.volumeUsd,
    this.tradingPairs,
    this.socket,
    this.exchangeUrl,
    this.updated,
  });

  String? exchangeId;
  String? name;
  String? rank;
  dynamic percentTotalVolume;
  dynamic volumeUsd;
  String? tradingPairs;
  dynamic socket;
  String? exchangeUrl;
  int? updated;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        exchangeId: json["exchangeId"],
        name: json["name"],
        rank: json["rank"],
        percentTotalVolume: json["percentTotalVolume"],
        volumeUsd: json["volumeUsd"],
        tradingPairs: json["tradingPairs"],
        socket: json["socket"],
        exchangeUrl: json["exchangeUrl"],
        updated: json["updated"],
      );

  Map<String, dynamic> toJson() => {
        "exchangeId": exchangeId,
        "name": name,
        "rank": rank,
        "percentTotalVolume": percentTotalVolume,
        "volumeUsd": volumeUsd,
        "tradingPairs": tradingPairs,
        "socket": socket,
        "exchangeUrl": exchangeUrl,
        "updated": updated,
      };
}
