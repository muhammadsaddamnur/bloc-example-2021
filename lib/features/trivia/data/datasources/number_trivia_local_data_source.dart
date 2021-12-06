import 'package:flutterbloc2021/features/trivia/data/models/number_trivia_model.dart';

abstract class NumberTriviaLocalDataSource {
  Future<NumberTriviaModel>? getLastNumberTrivia();

  Future<void>? cacheNumberTrivia(NumberTriviaModel triviaToCache);
}
