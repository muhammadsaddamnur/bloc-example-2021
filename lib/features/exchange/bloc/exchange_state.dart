import 'package:flutter/cupertino.dart';

@immutable
abstract class ExchangeState {}

class UnInitialize extends ExchangeState {}

class AwalMula extends ExchangeState {
  final String value;
  AwalMula({required this.value});
}
