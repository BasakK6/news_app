import 'package:flutter/material.dart';
import 'package:news_app/core/presentation/resources/strings_manager.dart';
import 'package:news_app/core/presentation/widgets/app_icon.dart';
import 'package:news_app/core/presentation/widgets/project_text_widgets.dart';

class SourceInfoWidget extends StatelessWidget {
  const SourceInfoWidget({
    super.key,
    this.source,
  });

  final String? source;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: AppIcon(),
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 4,
          child: Align(
            alignment: Alignment.centerLeft,
            child: RobotoText(
              text: source ?? kUnknownString,
              fontSize: 10,
              textAlign: TextAlign.start,
              maxLines: 2,
            ),
          ),
        ),
      ],
    );
  }
}
