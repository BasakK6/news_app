import 'package:flutter/material.dart';
import 'package:news_app/core/presentation/resources/color_manager.dart';
import 'package:news_app/core/presentation/resources/values_manager.dart';
import 'package:news_app/core/presentation/widgets/back_arrow.dart';
import 'package:news_app/core/presentation/widgets/stretched_news_layout.dart';
import 'package:news_app/features/news_feed/domain/entities/news_feed_entity.dart';

class DetailsSliverAppBar extends StatelessWidget {
  const DetailsSliverAppBar({Key? key, required this.entity}) : super(key: key);

  final ArticlesEntity entity;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight:
          MediaQuery.sizeOf(context).height * kSliverAppBarHeightFactor,
      floating: true,
      backgroundColor: ColorExtension.fromHex(kDarkPurpleLighterHexCode),
      automaticallyImplyLeading: false,
      leading: const BackArrow(),
      flexibleSpace: FlexibleSpaceBar(
        background: StretchedNewsLayout(
          articlesEntity: entity,
          height:
              MediaQuery.sizeOf(context).height * kSliverBackgroundHeightFactor,
        ),
      ),
    );
  }
}
