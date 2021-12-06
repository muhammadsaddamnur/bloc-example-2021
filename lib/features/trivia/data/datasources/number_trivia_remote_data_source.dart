import 'package:flutterbloc2021/features/trivia/data/models/number_trivia_model.dart';

abstract class NumberTriviaRemoteDataSource {
  Future<NumberTriviaModel>? getConcreteNummberTrivia(int number);

  Future<NumberTriviaModel>? getRandomNumberTrivia();
}
