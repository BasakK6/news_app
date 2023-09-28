import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/core/platform/network_info.dart';
import 'package:news_app/features/news_feed/data/data_sources/news_feed_remote_data_source.dart';
import 'package:news_app/features/news_feed/data/repositories/news_feed_repository_impl.dart';
import 'package:news_app/features/news_feed/domain/entities/news_feed_entity.dart';
import 'package:news_app/features/news_feed/domain/repositories/news_feed_repository.dart';
import 'package:news_app/features/news_feed/domain/use_cases/get_news_feed_for_a_category.dart';
import 'package:news_app/features/news_feed/presentation/providers/chosen_category_provider.dart';

// CORE - PLATFORM
final connectivityProvider = Provider<Connectivity>((ref) {
  return Connectivity();
});

final networkInfoProvider = Provider<NetworkInfo>((ref) {
  final connectivity = ref.read(connectivityProvider);
  return NetworkInfoImplementation(connectivity);
});

// DATA - DATA SOURCES
final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final remoteDataSourceProvider = Provider<NewsFeedRemoteDataSource>((ref) {
  final dio = ref.read(dioProvider);
  return NewsFeedRemoteDataSourceImpl(dio);
});

// DATA x DOMAIN - REPOSITORIES
final repositoryProvider = Provider<NewsFeedRepository>((ref) {
  final remoteDataSource = ref.read(remoteDataSourceProvider);
  final networkInfo = ref.read(networkInfoProvider);
  return NewsFeedRepositoryImpl(
    networkInfo: networkInfo,
    remoteDataSource: remoteDataSource,
  );
});

// DOMAIN - USE CASES
final useCaseProvider = Provider<GetNewsFeedForACategory>((ref) {
  final repository = ref.read(repositoryProvider);
  return GetNewsFeedForACategory(repository);
});

// PRESENTATION

final newsFeedProvider = FutureProvider<Either<Failure, NewsFeedEntity>>((ref) {
  final category = ref.read(chosenCategoryProvider);
  final params = Params(
    category: category,
  );
  return ref.read(useCaseProvider).call(params);
});
