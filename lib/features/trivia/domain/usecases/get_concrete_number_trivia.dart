import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterbloc2021/core/error/failure.dart';
import 'package:flutterbloc2021/core/usecase/usecase.dart';
import 'package:flutterbloc2021/features/trivia/domain/entities/number_trivia.dart';
import 'package:flutterbloc2021/features/trivia/domain/repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia extends UseCase<NumberTrivia, Params> {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) async {
    return await repository.getConcreteNumberTrivia(params.number)!;
  }
}

class Params extends Equatable {
  final int number;

  const Params({required this.number});

  @override
  List<Object?> get props => [number];
}
