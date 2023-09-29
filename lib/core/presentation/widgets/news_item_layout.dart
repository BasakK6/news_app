import 'package:flutter/material.dart';
import 'package:news_app/core/presentation/resources/color_manager.dart';
import 'package:news_app/core/presentation/resources/values_manager.dart';
import 'package:news_app/core/presentation/widgets/news_summary_big_widget.dart';
import 'package:news_app/features/news_feed/domain/entities/news_feed_entity.dart';

class NewsItemLayout extends StatelessWidget {
  const NewsItemLayout({Key? key, required this.articlesEntity})
      : super(key: key);

  final ArticlesEntity articlesEntity;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kRadius),
      ),
      color: ColorExtension.fromHex(kDarkPurpleLighterHexCode),
      margin: buildMargin(context),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * kNewsItemWidthFactor,
        height: MediaQuery.sizeOf(context).height * kNewsItemHeightFactor,
        child: NewsSummaryBigWidget(
          articlesEntity: articlesEntity,
        ),
      ),
    );
  }

  EdgeInsets buildMargin(BuildContext context) {
    return EdgeInsets.only(
      top: MediaQuery.sizeOf(context).height * kNewsItemTopMarginFactor,
      left: MediaQuery.sizeOf(context).width * kLeftRightPaddingFactor,
      right: MediaQuery.sizeOf(context).width * kLeftRightPaddingFactor,
      bottom: MediaQuery.sizeOf(context).height * kNewsItemBottomMarginFactor,
    );
  }
}
