import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/features/news_feed/domain/entities/news_feed_entity.dart';

void main() {
  group("timeAgo tests", () {
    test("should return null when publishedAt is null", () {
      //arrange
      const testNewsFeedEntity = NewsFeedEntity(
        articles: [
          ArticlesEntity(
              //publishedAt: "2023-09-24T05:35:00Z",
              )
        ],
      );
      //act
      final result = testNewsFeedEntity.articles?[0].timeAgo;
      //assert
      expect(result, "Unknown");
    });

    test("should return Just now for very recent time", () {
      //arrange
      final testNewsFeedEntity = NewsFeedEntity(
        articles: [
          ArticlesEntity(
            publishedAt: DateTime.now()
                .subtract(const Duration(seconds: 5))
                .toIso8601String(),
          )
        ],
      );
      //act
      final result = testNewsFeedEntity.articles?[0].timeAgo;
      //assert
      expect(result, equals('Just now'));
    });

    test("should return time difference in minutes", () {
      //arrange
      final testNewsFeedEntity = NewsFeedEntity(
        articles: [
          ArticlesEntity(
            publishedAt: DateTime.now()
                .subtract(const Duration(minutes: 30))
                .toIso8601String(),
          )
        ],
      );
      //act
      final result = testNewsFeedEntity.articles?[0].timeAgo;
      //assert
      expect(result, equals('30 Minutes ago'));
    });

    test("returns time difference in hours", () {
      //arrange
      final testNewsFeedEntity = NewsFeedEntity(
        articles: [
          ArticlesEntity(
            publishedAt: DateTime.now()
                .subtract(const Duration(hours: 3))
                .toIso8601String(),
          )
        ],
      );
      //act
      final result = testNewsFeedEntity.articles?[0].timeAgo;
      //assert
      expect(result, equals('3 Hours ago'));
    });

    test("should return time difference in days", () {
      //arrange
      final testNewsFeedEntity = NewsFeedEntity(
        articles: [
          ArticlesEntity(
            publishedAt: DateTime.now()
                .subtract(const Duration(days: 3))
                .toIso8601String(),
          )
        ],
      );
      //act
      final result = testNewsFeedEntity.articles?[0].timeAgo;
      //assert
      expect(result, equals('3 Days ago'));
    });
  });
}

/*
  test("should", () {
    //arrange

    //act

    //assert
  });
*/
