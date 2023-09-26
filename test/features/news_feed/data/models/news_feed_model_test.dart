import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/features/news_feed/data/models/news_feed_model.dart';
import 'package:news_app/features/news_feed/domain/entities/news_feed_entity.dart';

import '../../../../core/fixtures/fixture_file_reader.dart'
    as fixture_file_reader;

void main() {
  setUp(() {});

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

  test("should be a subclass of NewsFeedEntity", () {
    //arrange

    //act

    //assert
    expect(testNewsFeedModel, isA<NewsFeedEntity>());
  });

  group("fromJson test", () {
    test("should return a valid model from a valid news feed json", () {
      //arrange
      final jsonString = fixture_file_reader.fixture('news_feed.json');
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);

      //act
      final result = NewsFeedModel.fromJson(jsonMap);

      //assert
      expect(result, testNewsFeedModel);
    });
  });

  group("toJson test", () {
    test("should return a JSON map containing the proper data", () {
      //arrange
      final expectedJsonMap = {
        "status": "ok",
        "totalResults": 1,
        "articles": [
          {
            "source": {"id": null, "name": "Nintendo Life"},
            "author": "Liam Doolan",
            "title":
                "Metal Gear Solid: Master Collection Vol. 1 Resolution & Frame Rate Chart Released - Nintendo Life",
            "description": "Here's how the Switch version compares",
            "url":
                "https://www.nintendolife.com/news/2023/09/metal-gear-solid-master-collection-vol-1-resolution-and-frame-rate-chart-released",
            "urlToImage":
                "https://images.nintendolife.com/9ae5106942e8a/1280x720.jpg",
            "publishedAt": "2023-09-24T05:35:00Z",
            "content":
                "Image: Konami\r\nHideo Kojima's legendary series Metal Gear Solid returns as a collection release this October on all platforms including the Nintendo Switch, and as part of this Konami has now shared … [+1295 chars]"
          },
        ],
      };

      //act
      final result = testNewsFeedModel.toJson();

      //assert
      expect(result, expectedJsonMap);
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
