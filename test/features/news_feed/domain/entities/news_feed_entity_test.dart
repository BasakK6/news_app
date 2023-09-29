import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/features/news_feed/domain/entities/news_feed_entity.dart';

void main() {
  group("timeAgo tests", () {
    test("should return null when publishedAt is null", () {
      //arrange
      const testArticlesEntity = ArticlesEntity(
        //publishedAt: "2023-09-24T05:35:00Z",
      );
      //act
      final result = testArticlesEntity.timeAgo;
      //assert
      expect(result, "Unknown");
    });

    test("should return Just now for very recent time", () {
      //arrange
      final testArticlesEntity = ArticlesEntity(
        publishedAt: DateTime.now()
            .subtract(const Duration(seconds: 5))
            .toIso8601String(),
      );
      //act
      final result = testArticlesEntity.timeAgo;
      //assert
      expect(result, equals('Just now'));
    });

    test("should return time difference in minutes", () {
      //arrange
      final testArticlesEntity = ArticlesEntity(
        publishedAt: DateTime.now()
            .subtract(const Duration(minutes: 30))
            .toIso8601String(),
      );
      //act
      final result = testArticlesEntity.timeAgo;
      //assert
      expect(result, equals('30 Minutes ago'));
    });

    test("returns time difference in hours", () {
      //arrange
      final testArticlesEntity = ArticlesEntity(
        publishedAt: DateTime.now()
            .subtract(const Duration(hours: 3))
            .toIso8601String(),
      );
      //act
      final result = testArticlesEntity.timeAgo;
      //assert
      expect(result, equals('3 Hours ago'));
    });

    test("should return time difference in days", () {
      //arrange
      final testArticlesEntity = ArticlesEntity(
        publishedAt: DateTime.now()
            .subtract(const Duration(days: 3))
            .toIso8601String(),
      );
      //act
      final result = testArticlesEntity.timeAgo;
      //assert
      expect(result, equals('3 Days ago'));
    });
  });

  group("gptArticleContent tests",(){
    test("should return content when content is not null", () {
      const testArticlesEntity = ArticlesEntity(
        title:"Title",
        description: "Description",
        content: "Content",
      );
      expect(testArticlesEntity.gptArticleContent, equals("Content"));
    });

    test("should return combination this string: title + space character + description when content is null", () {
      const testArticlesEntity = ArticlesEntity(
        title:"Title",
        description: "Description",
      );
      expect(testArticlesEntity.gptArticleContent, equals("Title Description"));
    });

    test("should return empty string when both title, description and content are null", () {
      const testArticlesEntity = ArticlesEntity();
      expect(testArticlesEntity.gptArticleContent, equals(""));
    });

    test("should return title when description is null", () {
      const testArticlesEntity = ArticlesEntity(
        title:"Title",
      );
      expect(testArticlesEntity.gptArticleContent, equals('Title'));
    });

    test("should return description when title is null", () {
      const testArticlesEntity = ArticlesEntity(
        description: "Description",
      );
      expect(testArticlesEntity.gptArticleContent, equals('Description'));
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
