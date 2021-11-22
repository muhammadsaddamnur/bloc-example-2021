import 'package:dartz/dartz.dart';
import 'package:flutterbloc2021/core/error/failure.dart';
import 'package:flutterbloc2021/features/trivia/domain/entities/number_trivia.dart';
import 'package:flutterbloc2021/features/trivia/domain/repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  Future<Either<Failure, NumberTrivia>?> execute({required int number}) async {
    return await repository.getConcreteNumberTrivia(number);
  }
}
