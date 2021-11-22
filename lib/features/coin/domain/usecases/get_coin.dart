import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterbloc2021/core/error/failure.dart';
import 'package:flutterbloc2021/core/usecase/usecase.dart';
import 'package:flutterbloc2021/features/coin/domain/entittes/coin.dart';
import 'package:flutterbloc2021/features/coin/domain/repositories/coin_repository.dart';

class GetCoin extends UseCase<Coin, Params> {
  final CoinRepository coinRepository;
  GetCoin({required this.coinRepository});

  // Future<Either<Failure, Coin>> execute() async {
  //   return await coinRepository.getCoin();
  // }

  ///di dart call adalah kata kerja, jadi bisa dipanggil dari class langsung tanpa manggil methodnya
  ///contoh : GetCoin(Params(nama: 'saddam')), sama aja kaya GetCoin().call(Params(nama: 'saddam'))
  ///
  @override
  Future<Either<Failure, Coin>> call(Params params) async {
    return await coinRepository.getCoin();
  }
}

class Params extends Equatable {
  final String nama;
  const Params({required this.nama});
  @override
  List<Object?> get props => [];
}
