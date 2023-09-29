import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/core/error/exceptions.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/core/platform/network_info.dart';
import 'package:news_app/features/news_details/data/data_soruces/gpt_result_remote_data_source.dart';
import 'package:news_app/features/news_details/data/models/gpt_result_model.dart';
import 'package:news_app/features/news_details/data/repositories/gpt_result_repository_impl.dart';
import 'package:news_app/features/news_details/domain/entities/gpt_result_entity.dart';

import '../../../../core/fixtures/gpt_api_test_data.dart';
import 'gpt_result_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NetworkInfo>()])
//mock the abstract remote data source
@GenerateNiceMocks([MockSpec<GptResultRemoteDataSource>()])
void main() {
  late MockNetworkInfo mockNetworkInfo;
  late MockGptResultRemoteDataSource mockGptResultRemoteDataSource;
  late GptResultRepositoryImpl repositoryImpl;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockGptResultRemoteDataSource = MockGptResultRemoteDataSource();
    repositoryImpl = GptResultRepositoryImpl(
      remoteDataSource: mockGptResultRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

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
  const GptResultEntity testGptResultEntity = testGptResultModel;

  test('should check if the device is online', () async {
    //arrange
    when(mockNetworkInfo.checkConnection()).thenAnswer((_) async => true);
    // act
    await repositoryImpl.getGptResult(testArticleContent);
    // assert
    verify(mockNetworkInfo.checkConnection());
  });

  group("device is online", () {
    setUp(() async {
      //always return true for this group
      when(mockNetworkInfo.checkConnection()).thenAnswer((_) async => true);
    });

    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        // arrange
        when(mockGptResultRemoteDataSource
                .getGptResultForArticleContent(testArticleContent))
            .thenAnswer((_) async => testGptResultModel);
        // act
        final result = await repositoryImpl.getGptResult(testArticleContent);
        // assert
        verify(mockGptResultRemoteDataSource
            .getGptResultForArticleContent(testArticleContent));
        expect(result, equals(const Right(testGptResultEntity)));
      },
    );

    test(
      'should return ServerFailure when the call to remote data source is unsuccessful',
      () async {
        // arrange
        when(mockGptResultRemoteDataSource
                .getGptResultForArticleContent(testArticleContent))
            .thenThrow(ServerException());
        // act
        final result = await repositoryImpl.getGptResult(testArticleContent);
        // assert
        verify(mockGptResultRemoteDataSource
            .getGptResultForArticleContent(testArticleContent));
        expect(result, equals(Left(ServerFailure())));
      },
    );
  });

  group("device is offline", () {
    setUp(() async {
      //always return false for this group
      when(mockNetworkInfo.checkConnection())
          .thenThrow(ConnectivityException());
    });

    test(
        "should return Connectivity Failure when there is no internet connection",
        () async {
      //arrange

      //act
      final result = await repositoryImpl.getGptResult(testArticleContent);
      //assert
      verifyZeroInteractions(mockGptResultRemoteDataSource);
      expect(result, Left(ConnectivityFailure()));
    });
  });
}
