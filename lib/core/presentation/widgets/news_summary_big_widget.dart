import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/presentation/resources/color_manager.dart';
import 'package:news_app/core/presentation/resources/values_manager.dart';
import 'package:news_app/core/presentation/widgets/news_summary_small_widget.dart';
import 'package:news_app/core/presentation/widgets/project_fade_in_image.dart';
import 'package:news_app/core/presentation/widgets/project_text_widgets.dart';
import 'package:news_app/core/utilities/string_extension.dart';
import 'package:news_app/features/news_feed/domain/entities/news_feed_entity.dart';
import 'package:news_app/features/news_feed/presentation/providers/chosen_category_provider.dart';

class NewsSummaryBigWidget extends StatelessWidget {
  const NewsSummaryBigWidget({Key? key, required this.articlesEntity})
      : super(key: key);

  final ArticlesEntity articlesEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: buildNewsImage(context),
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: buildCategoryTitle(),
                ),
              ),
              Expanded(
                flex: 3,
                child: buildSmallNewsSummary(),
              ),
            ],
          ),
        ),
        buildEmptySpace(context),
      ],
    );
  }

  Container buildNewsImage(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(
        MediaQuery.sizeOf(context).width * kNewsItemLayoutMarginFactor,
      ),
      decoration: BoxDecoration(
        color: ColorExtension.fromHex(lightGreyHexCode),
        borderRadius: BorderRadius.circular(kRadius),
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(kRadius),
          child: ProjectFadeInImage(
            networkImageURL: articlesEntity.urlToImage,
          ),
        ),
      ),
    );
  }

  Consumer buildCategoryTitle() {
    return Consumer(builder: (context, ref, child) {
      return RobotoBoldText(
        text: ref.watch(chosenCategoryProvider).capitalize(),
        fontSize: 12,
        color: ColorExtension.fromHex(kTurquoiseHexCode),
      );
    });
  }

  NewsSummarySmallWidget buildSmallNewsSummary() {
    return NewsSummarySmallWidget(
      articlesEntity: articlesEntity,
      isCategoryIncluded: false,
      titleFontSize: 14,
    );
  }

  SizedBox buildEmptySpace(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * kNewsItemLayoutMarginFactor * 2,
    );
  }
}
