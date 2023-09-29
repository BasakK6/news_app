import 'package:dio/dio.dart';
import 'package:news_app/core/configs/api/api_configs.dart';
import 'package:news_app/core/configs/api/api_keys.dart';
import 'package:news_app/core/error/exceptions.dart';
import 'package:news_app/features/news_details/data/models/gpt_request_body_model.dart';
import 'package:news_app/features/news_details/data/models/gpt_result_model.dart';

abstract class GptResultRemoteDataSource {
  Future<GptResultModel> getGptResultForArticleContent(String articleContent);
}

class GptResultRemoteDataSourceImpl extends GptResultRemoteDataSource {
  final Dio dio;

  GptResultRemoteDataSourceImpl(this.dio);

  @override
  Future<GptResultModel> getGptResultForArticleContent(
      String articleContent) async {
    final body = GptRequestBodyModel(
      model: kGptAPIModel,
      maxTokens: kGptAPIMaxTokens,
      prompt: articleContent,
    ).toJson();

    final header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $kOpenAIKey",
    };

    final response = await dio.post(
      kGptAPIBaseURL,
      data: body,
      options: Options(
        headers: header,
      ),
    );
    if (response.statusCode == 200) {
      return GptResultModel.fromJson(response.data);
    }
    throw ServerException();
  }
}
