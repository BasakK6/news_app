import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/core/error/exceptions.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/core/platform/network_info.dart';
import 'package:news_app/features/news_feed/data/data_sources/news_feed_remote_data_source.dart';
import 'package:news_app/features/news_feed/data/models/news_feed_model.dart';
import 'package:news_app/features/news_feed/data/repositories/news_feed_repository_impl.dart';
import 'package:news_app/features/news_feed/domain/entities/news_feed_entity.dart';

import '../../../../core/fixtures/api_configs.dart';
import 'news_feed_repository_impl_test.mocks.dart';

//mock the abstract network info (core/platform)
@GenerateNiceMocks([MockSpec<NetworkInfo>()])
//mock the abstract remote data source
@GenerateNiceMocks([MockSpec<NewsFeedRemoteDataSource>()])
void main() {
  late MockNetworkInfo mockNetworkInfo;
  late MockNewsFeedRemoteDataSource mockNewsFeedRemoteDataSource;
  late NewsFeedRepositoryImpl repositoryImpl;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockNewsFeedRemoteDataSource = MockNewsFeedRemoteDataSource();
    repositoryImpl = NewsFeedRepositoryImpl(
      remoteDataSource: mockNewsFeedRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

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
  const NewsFeedEntity testNewsFeedEntity = testNewsFeedModel;

  group("getNewsFeed tests", () {
    test('should check if the device is online', () async {
      //arrange
      when(mockNetworkInfo.checkConnection()).thenAnswer((_) async => true);
      // act
      await repositoryImpl.getNewsFeed(testCategory);
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
          when(mockNewsFeedRemoteDataSource
                  .getNewsFeedForCategory(testCategory))
              .thenAnswer((_) async => testNewsFeedModel);
          // act
          final result = await repositoryImpl.getNewsFeed(testCategory);
          // assert
          verify(mockNewsFeedRemoteDataSource
              .getNewsFeedForCategory(testCategory));
          expect(result, equals(const Right(testNewsFeedEntity)));
        },
      );

      test(
        'should return ServerFailure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockNewsFeedRemoteDataSource
                  .getNewsFeedForCategory(testCategory))
              .thenThrow(ServerException());
          // act
          final result = await repositoryImpl.getNewsFeed(testCategory);
          // assert
          verify(mockNewsFeedRemoteDataSource
              .getNewsFeedForCategory(testCategory));
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
        final result = await repositoryImpl.getNewsFeed(testCategory);
        //assert
        verifyZeroInteractions(mockNewsFeedRemoteDataSource);
        expect(result, Left(ConnectivityFailure()));
      });
    });
  });
}
