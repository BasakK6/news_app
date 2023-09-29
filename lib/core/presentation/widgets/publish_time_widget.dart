import 'package:flutter/material.dart';
import 'package:news_app/core/presentation/resources/strings_manager.dart';
import 'package:news_app/core/presentation/widgets/project_text_widgets.dart';

class PublishTimeWidget extends StatelessWidget {
  const PublishTimeWidget({
    super.key,
    required this.timeAgo,
  });

  final String? timeAgo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: buildClockIcon(),
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 4,
          child: RobotoText(
            text: timeAgo ?? kUnknownString,
            fontSize: 10,
            textAlign: TextAlign.start,
            maxLines: 2,
          ),
        ),
      ],
    );
  }

  Icon buildClockIcon() {
    return const Icon(
      Icons.access_time,
      color: Colors.white,
    );
  }
}
