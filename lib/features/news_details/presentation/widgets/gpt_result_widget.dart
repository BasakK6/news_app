import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/core/presentation/resources/strings_manager.dart';
import 'package:news_app/core/presentation/widgets/project_error_text.dart';
import 'package:news_app/core/presentation/widgets/project_progress_indicator.dart';
import 'package:news_app/core/presentation/widgets/project_text_widgets.dart';
import 'package:news_app/features/news_details/domain/entities/gpt_result_entity.dart';
import 'package:news_app/features/news_details/presentation/providers/gpt_result_providers.dart';

const String kTitleOfTheGptResult = "ChatGPT Summary of the Article:";

class GptResultWidget extends ConsumerWidget {
  const GptResultWidget(this.articleContent, {Key? key}) : super(key: key);

  final String articleContent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gptResult = ref.watch(gptResultProvider(articleContent));
    return gptResult.when(
      loading: () => const ProjectProgressIndicator(),
      error: (error, stack) => ProjectErrorText(text: error.toString()),
      data: (result) => result.fold(
        buildErrorText,
        buildChatGptResult,
      ),
    );
  }

  Widget buildErrorText(Failure left) {
    return ProjectErrorText(
      text: left is ServerFailure
          ? kServerFailureString
          : kConnectivityFailureString,
    );
  }

  Widget buildChatGptResult(GptResultEntity right) => Wrap(
        children: [
          OpenSansText(
              fontSize: 14,
              text: "$kTitleOfTheGptResult ${right.choices?[0].text}"),
        ],
      );
}
