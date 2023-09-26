import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/core/use_cases/use_case.dart';
import 'package:news_app/features/news_feed/domain/entities/news_feed_entity.dart';
import 'package:news_app/features/news_feed/domain/repositories/news_feed_repository.dart';

class GetNewsFeedForACategory implements UseCase<NewsFeedEntity, Params> {
  final NewsFeedRepository repository;

  GetNewsFeedForACategory(this.repository);

  @override
  Future<Either<Failure, NewsFeedEntity>> call(Params params) {
    return repository.getNewsFeed(params.category);
  }
}

class Params {
  final String category;

  const Params({required this.category});
}
