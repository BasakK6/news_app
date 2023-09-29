import 'package:flutter/material.dart';
import 'package:news_app/core/presentation/resources/values_manager.dart';
import 'package:news_app/core/presentation/widgets/gradient_shadow_container.dart';
import 'package:news_app/core/presentation/widgets/news_summary_small_widget.dart';
import 'package:news_app/core/presentation/widgets/project_fade_in_image.dart';
import 'package:news_app/features/news_feed/domain/entities/news_feed_entity.dart';

class StretchedNewsLayout extends StatelessWidget {
  const StretchedNewsLayout(
      {Key? key, required this.articlesEntity, this.height})
      : super(key: key);

  final ArticlesEntity articlesEntity;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProjectFadeInImage(
          height: height,
          networkImageURL: articlesEntity.urlToImage,
        ),
        GradientShadowContainer(
          height: height,
          child: buildNewsInfoLayout(context),
        ),
      ],
    );
  }

  Padding buildNewsInfoLayout(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * kLeftRightPaddingFactor,
      ),
      child: Column(
        children: [
          const Spacer(), //half empty
          Expanded(
            child: NewsSummarySmallWidget(
              articlesEntity: articlesEntity,
              isCategoryIncluded: true,
            ),
          )
        ],
      ),
    );
  }
}
