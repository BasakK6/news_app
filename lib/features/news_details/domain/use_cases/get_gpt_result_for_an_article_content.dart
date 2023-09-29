import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/core/use_cases/use_case.dart';
import 'package:news_app/features/news_details/domain/entities/gpt_result_entity.dart';
import 'package:news_app/features/news_details/domain/repositories/gpt_result_repository.dart';

class GetGptResultForAnArticleContent
    implements UseCase<GptResultEntity, Params> {
  final GptResultRepository repository;

  GetGptResultForAnArticleContent(this.repository);

  @override
  Future<Either<Failure, GptResultEntity>> call(Params params) {
    return repository.getGptResult(params.articleContent);
  }
}

class Params {
  final String articleContent;

  const Params({required this.articleContent});
}
