import 'package:flutter/material.dart';
import 'package:news_app/core/presentation/resources/color_manager.dart';
import 'package:news_app/core/presentation/resources/strings_manager.dart';
import 'package:news_app/core/presentation/widgets/project_app_bar.dart';
import 'package:news_app/core/presentation/widgets/project_drawer.dart';
import 'package:news_app/features/news_feed/presentation/widgets/news_feed_body.dart';

class NewsFeedPage extends StatelessWidget {
  const NewsFeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorExtension.fromHex(kDarkPurpleHexCode),
      appBar: const ProjectAppBar(title: kNewsFeedString),
      drawer: const ProjectDrawer(),
      body: const NewsFeedBody(),
    );
  }
}
