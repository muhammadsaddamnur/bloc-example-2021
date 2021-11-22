import 'package:flutter_test/flutter_test.dart';
import 'package:flutterbloc2021/features/coin/data/models/coin_model.dart';
import 'package:flutterbloc2021/features/coin/domain/entittes/coin.dart';

void main() {
  final coinModel = CoinModel(data: Data(), timestamp: 1);

  test('should be a subclass of Coin Entity', () async {
    expect(coinModel, isA<Coin>());
  });
}
