import 'package:news_app/features/news_feed/data/models/news_feed_model.dart';

abstract class NewsFeedRemoteDataSource {
  Future<NewsFeedModel> getNewsFeedForCategory(String category);
}
