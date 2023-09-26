import 'package:news_app/features/news_feed/domain/entities/news_feed_entity.dart';

class NewsFeedModel extends NewsFeedEntity {
  const NewsFeedModel({
    super.status,
    super.totalResults,
    super.articles,
  });

  factory NewsFeedModel.fromJson(Map<String, dynamic> json) {
    List<ArticlesEntity>? fromJsonArticles;
    if (json['articles'] != null) {
      fromJsonArticles = <ArticlesEntity>[];
      json['articles'].forEach((v) {
        fromJsonArticles!.add(ArticlesModel.fromJson(v));
      });
    }

    return NewsFeedModel(
        status : json['status'],
        totalResults : json['totalResults'],
        articles: fromJsonArticles,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (articles != null) {
      data['articles'] =
          articles!.map((v) => (v as ArticlesModel).toJson()).toList();
    }
    return data;
  }
}

class ArticlesModel extends ArticlesEntity {
  const ArticlesModel(
      {super.source,
      super.author,
      super.title,
      super.description,
      super.url,
      super.urlToImage,
      super.publishedAt,
      super.content});

  factory ArticlesModel.fromJson(Map<String, dynamic> json) {
    return ArticlesModel(
      source:
          json['source'] != null ? SourceModel.fromJson(json['source']) : null,
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (source != null) {
      data['source'] = (source! as SourceModel).toJson();
    }
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}

class SourceModel extends SourceEntity {
  const SourceModel({super.id, super.name});

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
