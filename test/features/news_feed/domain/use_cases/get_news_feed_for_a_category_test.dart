import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/core/configs/api/api_configs.dart';
import 'package:news_app/features/news_feed/domain/entities/news_feed_entity.dart';
import 'package:news_app/features/news_feed/domain/repositories/news_feed_repository.dart';
import 'package:news_app/features/news_feed/domain/use_cases/get_news_feed_for_a_category.dart';

import 'get_news_feed_for_a_category_test.mocks.dart';

//mock the abstract repository in the domain layer
@GenerateNiceMocks([MockSpec<NewsFeedRepository>()])
void main() {
  late MockNewsFeedRepository mockNewsFeedRepository;
  late GetNewsFeedForACategory useCase;

  setUp(() {
    mockNewsFeedRepository = MockNewsFeedRepository();
    useCase = GetNewsFeedForACategory(mockNewsFeedRepository);
  });

  const testCategory = kNewsAPICategoryTechnology;
  const testNewsFeedEntity = NewsFeedEntity(
    status: "ok",
    totalResults: 1,
    articles: [
      ArticlesEntity(
        source: SourceEntity(
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

  test("should get the news feed for a category", () async {
    //arrange
    when(mockNewsFeedRepository.getNewsFeed(any))
        .thenAnswer((_) async => const Right(testNewsFeedEntity));
    //act
    final result = await useCase.call(
      const Params(category: testCategory),
    );

    //assert

    // UseCase should simply return whatever was returned from the Repository
    expect(result, const Right(testNewsFeedEntity));
    // Verify that the method has been called on the Repository with the given parameter
    verify(mockNewsFeedRepository.getNewsFeed(testCategory));
    // Only the above method should be called and nothing more.
    verifyNoMoreInteractions(mockNewsFeedRepository);
  });
}

/*
  test("should", () {
    //arrange

    //act

    //assert
  });
*/
