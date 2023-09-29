import 'package:flutter/material.dart';
import 'package:news_app/core/presentation/resources/color_manager.dart';
import 'package:news_app/core/presentation/resources/values_manager.dart';
import 'package:news_app/core/presentation/widgets/project_text_widgets.dart';
import 'package:news_app/features/news_details/presentation/widgets/details_sliver_app_bar.dart';
import 'package:news_app/features/news_details/presentation/widgets/footer_widget.dart';
import 'package:news_app/features/news_details/presentation/widgets/gpt_result_widget.dart';
import 'package:news_app/features/news_feed/domain/entities/news_feed_entity.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({Key? key, required this.articlesEntity})
      : super(key: key);

  final ArticlesEntity articlesEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorExtension.fromHex(kDarkPurpleHexCode),
      bottomNavigationBar: Padding(
        padding: buildMargin(context),
        child: FooterWidget(
          timeAgo: articlesEntity.timeAgo,
        ),
      ),
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          DetailsSliverAppBar(entity: articlesEntity),
          SliverToBoxAdapter(
            child: Padding(
              padding: buildMargin(context),
              child: Column(
                children: [
                  buildSpace(context),
                  buildArticlesEntityText(articlesEntity.title),
                  buildSpace(context),
                  buildArticlesEntityText(articlesEntity.description),
                  buildSpace(context),
                  buildArticlesEntityText(articlesEntity.content),
                  buildSpace(context),
                  GptResultWidget(articlesEntity.gptArticleContent),
                  buildSpace(context),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  EdgeInsets buildMargin(BuildContext context) {
    return EdgeInsets.only(
      left: MediaQuery.sizeOf(context).width * kLeftRightPaddingFactor,
      right: MediaQuery.sizeOf(context).width * kLeftRightPaddingFactor,
    );
  }

  Widget buildSpace(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).width * kLeftRightPaddingFactor * 1.5,
    );
  }

  Widget buildArticlesEntityText(String? field) {
    if (field != null) {
      return Wrap(children: [
        OpenSansText(
          fontSize: 14,
          text: field,
        ),
      ]);
    } else {
      return const SizedBox.shrink();
    }
  }
}
