import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/exceptions.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/core/platform/network_info.dart';
import 'package:news_app/features/news_feed/data/data_sources/news_feed_remote_data_source.dart';
import 'package:news_app/features/news_feed/domain/entities/news_feed_entity.dart';
import 'package:news_app/features/news_feed/domain/repositories/news_feed_repository.dart';

class NewsFeedRepositoryImpl extends NewsFeedRepository {
  final NetworkInfo networkInfo;
  final NewsFeedRemoteDataSource remoteDataSource;

  NewsFeedRepositoryImpl(
      {required this.networkInfo, required this.remoteDataSource});

  @override
  Future<Either<Failure, NewsFeedEntity>> getNewsFeed(String category) async {
    try {
      await networkInfo.checkConnection();
      final NewsFeedEntity remoteTrivia =
          await remoteDataSource.getNewsFeedForCategory(category);
      // can also cache the data when the remote fetch is successful
      // and return the cached value if there is no network connection
      return Right(remoteTrivia);
    } on ConnectivityException {
      return Left(ConnectivityFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
