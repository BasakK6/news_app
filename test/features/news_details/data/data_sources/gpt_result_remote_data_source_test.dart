import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/core/error/exceptions.dart';
import 'package:news_app/features/news_details/data/data_soruces/gpt_result_remote_data_source.dart';
import 'package:news_app/features/news_details/data/models/gpt_result_model.dart';

import '../../../../core/fixtures/fixture_file_reader.dart'
    as fixture_file_reader;
import '../../../../core/fixtures/gpt_api_test_data.dart';
import 'gpt_result_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
void main() {
  late MockDio mockDio;
  late GptResultRemoteDataSourceImpl dataSourceImpl;

  setUp(() {
    mockDio = MockDio();
    dataSourceImpl = GptResultRemoteDataSourceImpl(mockDio);
  });

  Future<void> setUpMockDioSuccess200() async {
    when(mockDio.post(
      any,
      data: anyNamed('data'),
      options: anyNamed("options"),
    )).thenAnswer((realInvocation) async => Response(
          data: jsonDecode(fixture_file_reader.fixture("gpt_result.json")),
          statusCode: 200,
          requestOptions: RequestOptions(),
        ));
  }

  Future<void> setUpMockDioFailure400() async {
    when(mockDio.post(
      any,
      data: anyNamed('data'),
      options: anyNamed("options"),
    )).thenAnswer((realInvocation) async => Response(
          statusCode: 404,
          requestOptions: RequestOptions(),
        ));
  }

  const testArticleContent = kTestArticleContent;
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

  group("getNewsFeedForCategory tests", () {
    /*
    // TODO: test fails because of the options parameter, check http_mock_adapter package and DioAdapter class
    test(
        "should perform a POST request to a URL with application/json, Bearer token header and body (data)",
            () async {
          //arrange
          await setUpMockDioSuccess200();

          const baseUrl = kGptAPIBaseURL;
          final body = GptRequestBodyModel(
            model: kGptAPIModel,
            maxTokens: kGptAPIMaxTokens,
            prompt: testArticleContent,
          ).toJson();
          final header = {
            "Content-Type": "application/json",
            "Authorization": "Bearer $kOpenAIKey",
          };
          //act
          await dataSourceImpl.getGptResultForArticleContent(testArticleContent);

          //assert
          verify(mockDio.post(baseUrl, data: body, options: Options(
            headers: header,
          )));
        });*/

    test("should return GptResultModel when the response code is 200 (success)",
        () async {
      //arrange
      await setUpMockDioSuccess200();
      //act
      final result = await dataSourceImpl
          .getGptResultForArticleContent(testArticleContent);
      //assert
      expect(result, equals(testGptResultModel));
    });

    test(
        "should throw a server exception when the response code is other than 200 (eg: 404)",
        () async {
      //arrange
      await setUpMockDioFailure400();
      //act
      final calledFunction = dataSourceImpl.getGptResultForArticleContent;
      //assert
      expect(() => calledFunction(testArticleContent),
          throwsA(const TypeMatcher<ServerException>()));
    });
  });
}
