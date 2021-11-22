import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterbloc2021/core/error/failure.dart';
import 'package:flutterbloc2021/features/coin/domain/entittes/rate.dart';
import 'package:flutterbloc2021/features/coin/domain/repositories/rate_repository.dart';
import 'package:flutterbloc2021/features/coin/domain/usecases/get_rate.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_rate_test.mocks.dart';

@GenerateMocks([RateRepository])
void main() {
  GetRate? usecase;
  MockRateRepository? mockRateRepository;

  setUp(() {
    mockRateRepository = MockRateRepository();
    usecase = GetRate(rateRepository: mockRateRepository!);
  });

  test('get rate', () async {
    when(mockRateRepository!.getRate())
        .thenAnswer((_) async => const Right(Rate()));

    await usecase!.execute();

    verify(mockRateRepository!.getRate());

    verifyNoMoreInteractions(mockRateRepository);
  });
  test('error', () async {
    when(mockRateRepository!.getRate())
        .thenAnswer((_) async => const Left(Failure()));

    await usecase!.execute();

    verify(mockRateRepository!.getRate());

    verifyNoMoreInteractions(mockRateRepository);
  });
}
