import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/exceptions.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/core/platform/network_info.dart';
import 'package:news_app/features/news_details/data/data_soruces/gpt_result_remote_data_source.dart';
import 'package:news_app/features/news_details/domain/entities/gpt_result_entity.dart';
import 'package:news_app/features/news_details/domain/repositories/gpt_result_repository.dart';

class GptResultRepositoryImpl extends GptResultRepository {
  final NetworkInfo networkInfo;
  final GptResultRemoteDataSource remoteDataSource;

  GptResultRepositoryImpl(
      {required this.networkInfo, required this.remoteDataSource});

  @override
  Future<Either<Failure, GptResultEntity>> getGptResult(
      String articleContent) async {
    try {
      await networkInfo.checkConnection();
      final GptResultEntity remoteGptResult =
          await remoteDataSource.getGptResultForArticleContent(articleContent);
      return Right(remoteGptResult);
    } on ConnectivityException {
      return Left(ConnectivityFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
