import 'package:dartz/dartz.dart';
import 'package:flutterbloc2021/core/error/failure.dart';
import 'package:flutterbloc2021/features/coin/domain/entittes/coin.dart';

abstract class CoinRepository {
  Future<Either<Failure, Coin>> getCoin();
}
