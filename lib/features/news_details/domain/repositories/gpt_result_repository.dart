import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/features/news_details/domain/entities/gpt_result_entity.dart';

abstract class GptResultRepository {
  Future<Either<Failure, GptResultEntity>> getGptResult(String articleContent);
}
