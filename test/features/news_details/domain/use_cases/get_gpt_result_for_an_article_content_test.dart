import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/features/news_details/domain/entities/gpt_result_entity.dart';
import 'package:news_app/features/news_details/domain/repositories/gpt_result_repository.dart';
import 'package:news_app/features/news_details/domain/use_cases/get_gpt_result_for_an_article_content.dart';

import '../../../../core/fixtures/gpt_api_test_data.dart';
import 'get_gpt_result_for_an_article_content_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GptResultRepository>()])
void main() {
  late MockGptResultRepository mockGptResultRepository;
  late GetGptResultForAnArticleContent useCase;

  setUp(() {
    mockGptResultRepository = MockGptResultRepository();
    useCase = GetGptResultForAnArticleContent(mockGptResultRepository);
  });

  const testArticleContent = kTestArticleContent;
  const testGptResultEntity = GptResultEntity(
    id: "cmpl-844MC2OPs6EFL5kI1FVWcUITzyCJn",
    object: "text_completion",
    created: 1695980752,
    model: "gpt-3.5-turbo-instruct",
    choices: [
      ChoicesEntity(
        text:
            "\n\nThe PlayStation Store currently has multiple promotional sales offering discounts on over 2,000 PS4",
        index: 0,
        finishReason: "length",
      ),
    ],
    usage: UsageEntity(
      promptTokens: 46,
      completionTokens: 20,
      totalTokens: 66,
    ),
  );

  test("should get the gpt result for an article content", () async {
    //arrange
    when(mockGptResultRepository.getGptResult(any))
        .thenAnswer((_) async => const Right(testGptResultEntity));
    //act
    final result = await useCase.call(
      const Params(articleContent: testArticleContent),
    );

    //assert

    // UseCase should simply return whatever was returned from the Repository
    expect(result, const Right(testGptResultEntity));
    // Verify that the method has been called on the Repository with the given parameter
    verify(mockGptResultRepository.getGptResult(testArticleContent));
    // Only the above method should be called and nothing more.
    verifyNoMoreInteractions(mockGptResultRepository);
  });
}

/*
  test("should", () {
    //arrange

    //act

    //assert
  });
*/
