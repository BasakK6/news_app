import 'package:flutter/material.dart';
import 'package:news_app/core/presentation/widgets/category_chip.dart';
import 'package:news_app/core/presentation/widgets/project_text_widgets.dart';
import 'package:news_app/core/presentation/widgets/publish_time_widget.dart';
import 'package:news_app/core/presentation/widgets/source_info_widget.dart';
import 'package:news_app/features/news_feed/domain/entities/news_feed_entity.dart';

class NewsSummarySmallWidget extends StatelessWidget {
  const NewsSummarySmallWidget({
    super.key,
    required this.articlesEntity,
    required this.isCategoryIncluded,
    this.titleFontSize,
  });

  final ArticlesEntity articlesEntity;
  final bool isCategoryIncluded;
  final double? titleFontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: buildTitle(),
          ),
        ),
        const Spacer(),
        Expanded(child: buildSubtitle()),
        const Spacer()
      ],
    );
  }

  Wrap buildTitle() {
    return Wrap(
      children: [
        PlayFairDisplayText(
          fontSize: titleFontSize ?? 18,
          text: articlesEntity.title ?? "",
          maxLines: 2,
        )
      ],
    );
  }

  Widget buildSubtitle() {
    return Wrap(
      children: [
        Row(
          children: [
            Expanded(
              flex: 4,
              child: SourceInfoWidget(
                source: articlesEntity.source?.name,
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 4,
              child: PublishTimeWidget(
                timeAgo: articlesEntity.timeAgo,
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            if (isCategoryIncluded)
              const Expanded(
                flex: 4,
                child: CategoryChip(),
              )
            else
              const SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}
