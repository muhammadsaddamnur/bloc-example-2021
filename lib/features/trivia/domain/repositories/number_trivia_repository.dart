import 'package:dartz/dartz.dart';
import 'package:flutterbloc2021/core/error/failure.dart';
import 'package:flutterbloc2021/features/trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>>? getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>>? getRandomNumberTrivia();
}
