import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/features/news_feed/domain/entities/news_feed_entity.dart';

abstract class NewsFeedRepository {
  Future<Either<Failure, NewsFeedEntity>> getNewsFeed(String category);

//there could be another method without the category (in the repository class)
//we can have a new use-case that uses the method below (in the use_cases folder)
//Future<Either<Failure,NewsFeedEntity>> getNewsFeed();
}
