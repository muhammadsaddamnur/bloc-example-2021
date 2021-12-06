import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterbloc2021/core/usecase/usecase.dart';
import 'package:flutterbloc2021/features/trivia/domain/entities/number_trivia.dart';
import 'package:flutterbloc2021/features/trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutterbloc2021/features/trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetRandomNumberTrivia? usecase;
  MockNumberTriviaRepository? mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository!);
  });

  const tNumberTrivia = NumberTrivia(text: 'test', number: 1);

  test('should get trivia from the repository', () async {
    when(mockNumberTriviaRepository!.getRandomNumberTrivia())
        .thenAnswer((_) async => const Right(tNumberTrivia));

    final result = await usecase!(NoParams());

    expect(result, const Right(tNumberTrivia));
    verify(mockNumberTriviaRepository!.getRandomNumberTrivia());
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
