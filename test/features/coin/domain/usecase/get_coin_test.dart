import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterbloc2021/core/error/failure.dart';
import 'package:flutterbloc2021/features/coin/domain/entittes/coin.dart';
import 'package:flutterbloc2021/features/coin/domain/repositories/coin_repository.dart';
import 'package:flutterbloc2021/features/coin/domain/usecases/get_coin.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_coin_test.mocks.dart';

@GenerateMocks([CoinRepository])
void main() {
  GetCoin? usecase;
  MockCoinRepository? mockCoinRepository;
  setUp(() {
    mockCoinRepository = MockCoinRepository();
    usecase = GetCoin(coinRepository: mockCoinRepository!);
  });

  test('balikin data dari repo', () async {
    when(mockCoinRepository!.getCoin())
        .thenAnswer((_) async => const Right(Coin(data: null, timestamp: 1)));

    // await usecase!.execute();

    final result = await usecase!(const Params(nama: 'saddam'));
    expect(result, const Right(Coin(data: null, timestamp: 1)));

    verify(mockCoinRepository!.getCoin());

    verifyNoMoreInteractions(mockCoinRepository);
  });

  test('error ', () async {
    when(mockCoinRepository!.getCoin())
        .thenAnswer((_) async => const Left(Failure()));

    // await usecase!.execute();
    final result = await usecase!(const Params(nama: 'nama'));
    expect(result, const Left(Failure()));

    verify(mockCoinRepository!.getCoin());

    verifyNoMoreInteractions(mockCoinRepository);
  });
}
