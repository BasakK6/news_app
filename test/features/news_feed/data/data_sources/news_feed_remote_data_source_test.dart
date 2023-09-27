import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/core/configs/api/api_configs.dart';
import 'package:news_app/core/configs/api/api_keys.dart';
import 'package:news_app/core/error/exceptions.dart';
import 'package:news_app/features/news_feed/data/data_sources/news_feed_remote_data_source.dart';
import 'package:news_app/features/news_feed/data/models/news_feed_model.dart';

import '../../../../core/fixtures/fixture_file_reader.dart'
    as fixture_file_reader;
import 'news_feed_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
void main() {
  late MockDio mockDio;
  late NewsFeedRemoteDataSourceImpl dataSourceImpl;

  setUp(() {
    mockDio = MockDio();
    dataSourceImpl = NewsFeedRemoteDataSourceImpl(mockDio);
  });

  Future<void> setUpMockDioSuccess200() async {
    when(mockDio.get(any, queryParameters: anyNamed('queryParameters')))
        .thenAnswer((realInvocation) async => Response(
              data: jsonDecode(fixture_file_reader.fixture("news_feed.json")),
              statusCode: 200,
              requestOptions: RequestOptions(),
            ));
  }

  Future<void> setUpMockDioFailure400() async {
    when(mockDio.get(any, queryParameters: anyNamed('queryParameters')))
        .thenAnswer((realInvocation) async => Response(
              statusCode: 404,
              requestOptions: RequestOptions(),
            ));
  }

  const testCategory = kNewsAPICategoryTechnology;
  const testNewsFeedModel = NewsFeedModel(
    status: "ok",
    totalResults: 1,
    articles: [
      ArticlesModel(
        source: SourceModel(
          name: "Nintendo Life",
        ),
        author: "Liam Doolan",
        title:
            "Metal Gear Solid: Master Collection Vol. 1 Resolution & Frame Rate Chart Released - Nintendo Life",
        description: "Here's how the Switch version compares",
        url:
            "https://www.nintendolife.com/news/2023/09/metal-gear-solid-master-collection-vol-1-resolution-and-frame-rate-chart-released",
        urlToImage:
            "https://images.nintendolife.com/9ae5106942e8a/1280x720.jpg",
        publishedAt: "2023-09-24T05:35:00Z",
        content:
            "Image: Konami\r\nHideo Kojima's legendary series Metal Gear Solid returns as a collection release this October on all platforms including the Nintendo Switch, and as part of this Konami has now shared … [+1295 chars]",
      )
    ],
  );

  group("getNewsFeedForCategory tests", () {
    test(
        "should perform a GET request to a URL with specified category, country and apiKey",
        () async {
      //arrange
      //await setUpMockDioSuccess200();
      when(mockDio.get(any, queryParameters: anyNamed('queryParameters')))
          .thenAnswer((realInvocation) async => Response(
                data: jsonDecode(fixture_file_reader.fixture("news_feed.json")),
                statusCode: 200,
                requestOptions: RequestOptions(),
              ));

      const baseUrl = "https://newsapi.org/v2/top-headlines";
      final queryParams = {
        "country": kNewsAPICountry,
        "apiKey": kNewsAPIKey,
        "category": testCategory,
      };
      //act
      await dataSourceImpl.getNewsFeedForCategory(testCategory);

      //assert
      verify(mockDio.get(baseUrl, queryParameters: queryParams));
    });

    test("should return NewsFeedModel when the response code is 200 (success)",
        () async {
      //arrange
      await setUpMockDioSuccess200();
      //act
      final result = await dataSourceImpl.getNewsFeedForCategory(testCategory);
      //assert
      expect(result, equals(testNewsFeedModel));
    });

    test(
        "should throw a server exception when the response code is other than 200 (eg: 404)",
        () async {
      //arrange
      await setUpMockDioFailure400();
      //act
      final calledFunction = dataSourceImpl.getNewsFeedForCategory;
      //assert
      expect(() => calledFunction(testCategory),
          throwsA(const TypeMatcher<ServerException>()));
    });
  });
}

/*
  test("should",(){
    //arrange

    //act

    //assert
  });
*/
