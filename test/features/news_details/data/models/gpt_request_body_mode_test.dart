import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/features/news_details/data/models/gpt_request_body_model.dart';

import '../../../../core/fixtures/gpt_api_test_data.dart';

void main() {
  setUp(() {});

  const testGptRequestBodyModel = GptRequestBodyModel(
    model: "gpt-3.5-turbo-instruct",
    prompt: kTestArticleContent,
    maxTokens: 20,
  );

  group("toJson test", () {
    test("should return a JSON map containing the proper data", () {
      //arrange
      final expectedJsonMap = {
        "model": "gpt-3.5-turbo-instruct",
        "prompt":
            "Generate a summary for this paragraph: There are several different promotional sales currently live on the PlayStation Store, discounting over 2,000 PS4 and PS5 games in the process. Most of these deals are either inconsequential discount",
        "max_tokens": 20
      };

      //act
      final result = testGptRequestBodyModel.toJson();

      //assert
      expect(result, expectedJsonMap);
    });
  });
}
