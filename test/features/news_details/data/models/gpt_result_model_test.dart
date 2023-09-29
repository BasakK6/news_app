import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/features/news_details/data/models/gpt_result_model.dart';
import 'package:news_app/features/news_details/domain/entities/gpt_result_entity.dart';

import '../../../../core/fixtures/fixture_file_reader.dart'
as fixture_file_reader;

void main() {
  setUp(() {});

  const testGptResultModel = GptResultModel(
    id: "cmpl-844MC2OPs6EFL5kI1FVWcUITzyCJn",
    object: "text_completion",
    created: 1695980752,
    model: "gpt-3.5-turbo-instruct",
    choices: [
      ChoicesModel(
        text:
        "\n\nThe PlayStation Store currently has multiple promotional sales offering discounts on over 2,000 PS4",
        index: 0,
        finishReason: "length",
      ),
    ],
    usage: UsageModel(
      promptTokens: 46,
      completionTokens: 20,
      totalTokens: 66,
    ),
  );

  test("should be a subclass of GptResultEntity", () {
    //arrange

    //act

    //assert
    expect(testGptResultModel, isA<GptResultEntity>());
  });

  group("fromJson test", () {
    test("should return a valid model from a valid gpt result json", () {
      //arrange
      final jsonString = fixture_file_reader.fixture('gpt_result.json');
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);

      //act
      final result = GptResultModel.fromJson(jsonMap);

      //assert
      expect(result, testGptResultModel);
    });
  });

  group("toJson test", () {
    test("should return a JSON map containing the proper data", () {
      //arrange
      final expectedJsonMap = {
        "id": "cmpl-844MC2OPs6EFL5kI1FVWcUITzyCJn",
        "object": "text_completion",
        "created": 1695980752,
        "model": "gpt-3.5-turbo-instruct",
        "choices": [
          {
            "text": "\n\nThe PlayStation Store currently has multiple promotional sales offering discounts on over 2,000 PS4",
            "index": 0,
            "finish_reason": "length"
          }
        ],
        "usage": {
          "prompt_tokens": 46,
          "completion_tokens": 20,
          "total_tokens": 66
        }
      };

      //act
      final result = testGptResultModel.toJson();

      //assert
      expect(result, expectedJsonMap);
    });
  });
}
