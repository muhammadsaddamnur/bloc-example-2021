import 'package:flutter/cupertino.dart';

@immutable
abstract class ExchangeEvent {}

class GetNama extends ExchangeEvent {
  /// as parameter
  ///
  final String nama;
  GetNama({required this.nama});
}
