import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/features/news_details/data/data_soruces/gpt_result_remote_data_source.dart';
import 'package:news_app/features/news_details/data/repositories/gpt_result_repository_impl.dart';
import 'package:news_app/features/news_details/domain/entities/gpt_result_entity.dart';
import 'package:news_app/features/news_details/domain/repositories/gpt_result_repository.dart';
import 'package:news_app/features/news_details/domain/use_cases/get_gpt_result_for_an_article_content.dart';
import 'package:news_app/features/news_feed/presentation/providers/news_feed_providers.dart';

// DATA - DATA SOURCES
final gptRemoteDataSourceProvider = Provider<GptResultRemoteDataSource>((ref) {
  final dio = ref.read(dioProvider);
  return GptResultRemoteDataSourceImpl(dio);
});

// DATA x DOMAIN - REPOSITORIES
final gptRepositoryProvider = Provider<GptResultRepository>((ref) {
  final remoteDataSource = ref.read(gptRemoteDataSourceProvider);
  final networkInfo = ref.read(networkInfoProvider);
  return GptResultRepositoryImpl(
    networkInfo: networkInfo,
    remoteDataSource: remoteDataSource,
  );
});

// DOMAIN - USE CASES
final gptUseCaseProvider = Provider<GetGptResultForAnArticleContent>((ref) {
  final repository = ref.read(gptRepositoryProvider);
  return GetGptResultForAnArticleContent(repository);
});

// PRESENTATION
final gptResultProvider = FutureProvider.autoDispose
    .family<Either<Failure, GptResultEntity>, String>((ref, articleContent) {
  final params = Params(
    articleContent: articleContent,
  );
  return ref.read(gptUseCaseProvider).call(params);
});
