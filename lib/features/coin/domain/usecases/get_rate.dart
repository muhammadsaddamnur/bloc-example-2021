import 'package:dartz/dartz.dart';
import 'package:flutterbloc2021/core/error/failure.dart';
import 'package:flutterbloc2021/features/coin/domain/entittes/rate.dart';
import 'package:flutterbloc2021/features/coin/domain/repositories/rate_repository.dart';

class GetRate {
  final RateRepository rateRepository;
  GetRate({required this.rateRepository});

  Future<Either<Failure, Rate>> execute() async {
    return await rateRepository.getRate();
  }
}
