import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterbloc2021/features/trivia/domain/entities/number_trivia.dart';
import 'package:flutterbloc2021/features/trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutterbloc2021/features/trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetConcreteNumberTrivia? usecase;
  MockNumberTriviaRepository? mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository!);
  });

  const tNumber = 1;
  const tNumberTrivia = NumberTrivia(text: 'test', number: 1);

  test('should get trivia for the nmber from the repository', () async {
    when(mockNumberTriviaRepository!.getConcreteNumberTrivia(1))
        .thenAnswer((_) async => const Right(tNumberTrivia));

    final result = await usecase!.execute(number: tNumber);

    expect(result, const Right(tNumberTrivia));

    verify(mockNumberTriviaRepository!.getConcreteNumberTrivia(tNumber));

    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
