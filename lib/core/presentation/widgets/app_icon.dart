import 'package:flutter/material.dart';
import 'package:news_app/core/presentation/resources/color_manager.dart';
import 'package:news_app/core/presentation/widgets/project_text_widgets.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(
          Icons.circle,
          color: ColorExtension.fromHex(kPurpleHexCode),
        ),
        PlayFairDisplayText(
          text: "N",
          fontSize: 10,
        ),
      ],
    );
  }
}
