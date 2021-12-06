import 'package:flutterbloc2021/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutterbloc2021/core/usecase/usecase.dart';
import 'package:flutterbloc2021/features/trivia/domain/entities/number_trivia.dart';
import 'package:flutterbloc2021/features/trivia/domain/repositories/number_trivia_repository.dart';

class GetRandomNumberTrivia extends UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository repository;
  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async {
    return await repository.getRandomNumberTrivia()!;
  }
}
