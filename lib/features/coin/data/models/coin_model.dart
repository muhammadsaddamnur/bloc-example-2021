import 'package:flutterbloc2021/features/coin/domain/entittes/coin.dart';

class CoinModel extends Coin {
  const CoinModel({required Data data, required int timestamp})
      : super(data: data, timestamp: timestamp);
}
