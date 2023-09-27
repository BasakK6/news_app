import 'package:dio/dio.dart';
import 'package:news_app/core/configs/api/api_configs.dart';
import 'package:news_app/core/configs/api/api_keys.dart';
import 'package:news_app/core/error/exceptions.dart';
import 'package:news_app/features/news_feed/data/models/news_feed_model.dart';

abstract class NewsFeedRemoteDataSource {
  Future<NewsFeedModel> getNewsFeedForCategory(String category);
}

class NewsFeedRemoteDataSourceImpl extends NewsFeedRemoteDataSource {
  final Dio dio;

  NewsFeedRemoteDataSourceImpl(this.dio);

  @override
  Future<NewsFeedModel> getNewsFeedForCategory(String category) async {
    final queryParams = {
      "country": kNewsAPICountry,
      "apiKey": kNewsAPIKey,
      "category": category,
    };
    final response = await dio.get(kNewsAPIBaseURL, queryParameters: queryParams);
    if (response.statusCode == 200) {
      return NewsFeedModel.fromJson(response.data);
    }
    throw ServerException();
  }
}
