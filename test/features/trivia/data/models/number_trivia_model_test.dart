import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutterbloc2021/features/trivia/data/models/number_trivia_model.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tNumbertriviaModel = NumberTriviaModel(number: 1, text: 'Test Text');

  test('should be a subclass of NumberTrivia entity', () async {
    expect(tNumbertriviaModel, isA<NumberTriviaModel>());
  });

  group('fromJson', () {
    test('should return a valid model when the JSON number is an integer',
        () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture('trivia.json'));

      final result = NumberTriviaModel.fromJson(jsonMap);

      expect(result, tNumbertriviaModel);
    });

    test('should return a valid model when the JSON number is an double',
        () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('trivia_double.json'));

      final result = NumberTriviaModel.fromJson(jsonMap);

      expect(result, tNumbertriviaModel);
    });

    test('shold return a JSON map containing the proper data', () async {
      final result = tNumbertriviaModel.toJson();

      final expectedJsonMap = {
        "text": "Test Text",
        "number": 1,
      };

      expect(result, expectedJsonMap);
    });
  });
}
