import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterbloc2021/core/error/exception.dart';
import 'package:flutterbloc2021/core/error/failure.dart';
import 'package:flutterbloc2021/core/platform/network_info.dart';
import 'package:flutterbloc2021/features/trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:flutterbloc2021/features/trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:flutterbloc2021/features/trivia/data/models/number_trivia_model.dart';
import 'package:flutterbloc2021/features/trivia/data/repository/number_trivia_repository_impl.dart';
import 'package:flutterbloc2021/features/trivia/domain/entities/number_trivia.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataSource extends Mock
    implements NumberTriviaRemoteDataSource {}

class MockLocalDataSource extends Mock implements NumberTriviaLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  NumberTriviaRepositoryImpl? repository;
  MockRemoteDataSource? mockRemoteDataSource;
  MockLocalDataSource? mockLocalDataSource;
  MockNetworkInfo? mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = NumberTriviaRepositoryImpl(
      remoteDataSource: mockRemoteDataSource!,
      localDataSource: mockLocalDataSource!,
      networkInfo: mockNetworkInfo!,
    );
  });

  void runTestsOnline(Function body) {
    group('device is Online', () {
      setUp(() {
        when(mockNetworkInfo!.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is Offline', () {
      setUp(() {
        when(mockNetworkInfo!.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group('getConcreteNumberTrivia', () {
    const tNumber = 1;
    const tNumberTriviaModel =
        NumberTriviaModel(number: tNumber, text: 'test trivia');
    const NumberTrivia tNumberTrivia = tNumberTriviaModel;

    test('should check if the device is online', () {
      when(mockNetworkInfo!.isConnected).thenAnswer((_) async => true);

      repository!.getConcreteNumberTrivia(tNumber)!;
      verify(mockNetworkInfo!.isConnected);
    });

    runTestsOnline(() {
      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        when(mockRemoteDataSource!.getConcreteNummberTrivia(tNumber))
            .thenAnswer((_) async => tNumberTriviaModel);

        final result = await repository!.getConcreteNumberTrivia(tNumber)!;

        verify(mockRemoteDataSource!.getConcreteNummberTrivia(tNumber));
        expect(result, equals(const Right(tNumberTrivia)));
      });

      test(
          'should cache the data locally when the call to remote data source is successful',
          () async {
        when(mockRemoteDataSource!.getConcreteNummberTrivia(tNumber))
            .thenAnswer((_) async => tNumberTriviaModel);

        await repository!.getConcreteNumberTrivia(tNumber)!;

        verify(mockRemoteDataSource!.getConcreteNummberTrivia(tNumber));
        verify(mockLocalDataSource!.cacheNumberTrivia(tNumberTriviaModel));
      });

      test(
          'shold return server failure when the call to remote data source is unsuccessful',
          () async {
        when(mockRemoteDataSource!.getConcreteNummberTrivia(tNumber))
            .thenThrow(ServerException());

        final result = await repository!.getConcreteNumberTrivia(tNumber)!;

        verify(mockRemoteDataSource!.getConcreteNummberTrivia(tNumber));
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });

    runTestsOffline(() {
      test(
          'should return last locally cached data when the cached data is present',
          () async {
        when(mockLocalDataSource!.getLastNumberTrivia())
            .thenAnswer((_) async => tNumberTriviaModel);

        final result = await repository!.getConcreteNumberTrivia(tNumber);

        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource!.getLastNumberTrivia());
        expect(result, equals(const Right(tNumberTrivia)));
      });

      test(
          'should return return CacheFailure when ther is no cached data present',
          () async {
        when(mockLocalDataSource!.getLastNumberTrivia())
            .thenThrow(CacheException());

        final result = await repository!.getConcreteNumberTrivia(tNumber);

        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource!.getLastNumberTrivia());
        expect(result, equals(Left(CacheFailure())));
      });
    });
  });

  group('getRandomNumberTrivia', () {
    const tNumberTriviaModel =
        NumberTriviaModel(number: 123, text: 'test trivia');
    const NumberTrivia tNumberTrivia = tNumberTriviaModel;

    test('should check if the device is online', () {
      when(mockNetworkInfo!.isConnected).thenAnswer((_) async => true);

      repository!.getRandomNumberTrivia()!;
      verify(mockNetworkInfo!.isConnected);
    });

    runTestsOnline(() {
      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        when(mockRemoteDataSource!.getRandomNumberTrivia())
            .thenAnswer((_) async => tNumberTriviaModel);

        final result = await repository!.getRandomNumberTrivia()!;

        verify(mockRemoteDataSource!.getRandomNumberTrivia());
        expect(result, equals(const Right(tNumberTrivia)));
      });

      test(
          'should cache the data locally when the call to remote data source is successful',
          () async {
        when(mockRemoteDataSource!.getRandomNumberTrivia())
            .thenAnswer((_) async => tNumberTriviaModel);

        await repository!.getRandomNumberTrivia()!;

        verify(mockRemoteDataSource!.getRandomNumberTrivia());
        verify(mockLocalDataSource!.cacheNumberTrivia(tNumberTriviaModel));
      });

      test(
          'shold return server failure when the call to remote data source is unsuccessful',
          () async {
        when(mockRemoteDataSource!.getRandomNumberTrivia())
            .thenThrow(ServerException());

        final result = await repository!.getRandomNumberTrivia()!;

        verify(mockRemoteDataSource!.getRandomNumberTrivia());
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });

    runTestsOffline(() {
      test(
          'should return last locally cached data when the cached data is present',
          () async {
        when(mockLocalDataSource!.getLastNumberTrivia())
            .thenAnswer((_) async => tNumberTriviaModel);

        final result = await repository!.getRandomNumberTrivia();

        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource!.getLastNumberTrivia());
        expect(result, equals(const Right(tNumberTrivia)));
      });

      test(
          'should return return CacheFailure when ther is no cached data present',
          () async {
        when(mockLocalDataSource!.getLastNumberTrivia())
            .thenThrow(CacheException());

        final result = await repository!.getRandomNumberTrivia();

        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource!.getLastNumberTrivia());
        expect(result, equals(Left(CacheFailure())));
      });
    });
  });
}
