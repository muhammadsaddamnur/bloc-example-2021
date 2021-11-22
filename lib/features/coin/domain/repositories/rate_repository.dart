import 'package:dartz/dartz.dart';
import 'package:flutterbloc2021/core/error/failure.dart';
import 'package:flutterbloc2021/features/coin/domain/entittes/rate.dart';

abstract class RateRepository {
  Future<Either<Failure, Rate>> getRate();
}
