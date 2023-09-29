import 'package:flutter/material.dart';
import 'package:news_app/core/presentation/resources/color_manager.dart';
import 'package:news_app/core/presentation/widgets/project_text_widgets.dart';

class ProjectAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProjectAppBar(
      {Key? key,
      required this.title,
      this.backgroundColor,
      this.bookmarkFunctionality,
      this.searchFunctionality})
      : super(key: key);
  final String title;
  final Color? backgroundColor;
  final VoidCallback? bookmarkFunctionality;
  final VoidCallback? searchFunctionality;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: buildTitle(),
      iconTheme: const IconThemeData(color: Colors.white),
      centerTitle: true,
      backgroundColor:
          backgroundColor ?? ColorExtension.fromHex(kDarkPurpleHexCode),
      actions: buildActions(),
    );
  }

  PlayFairDisplayText buildTitle() {
    return PlayFairDisplayText(
      fontSize: 20,
      text: title,
    );
  }

  List<Widget> buildActions() {
    return [
      IconButton(
        onPressed: bookmarkFunctionality ?? () {},
        icon: const Icon(Icons.bookmark_border_outlined),
      ),
      IconButton(
        onPressed: searchFunctionality ?? () {},
        icon: const Icon(Icons.search),
      ),
    ];
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
