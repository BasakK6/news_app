import 'package:flutter/material.dart';
import 'package:news_app/core/presentation/resources/values_manager.dart';
import 'package:news_app/core/presentation/widgets/publish_time_widget.dart';

import 'package:news_app/features/news_details/presentation/widgets/news_detail_actions_widget.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key, required this.timeAgo}) : super(key: key);

  final String timeAgo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * kFooterHeightFactor,
      child: Column(
        children: [
          const Spacer(),
          Expanded(
            child: buildDivider(),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: PublishTimeWidget(
                      timeAgo: timeAgo,
                    ),
                  ),
                ),
                const Spacer(),
                const Expanded(
                  child: NewsDetailActionsWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Divider buildDivider() {
    return const Divider(
      color: Colors.white,
      thickness: 1.5,
    );
  }
}
