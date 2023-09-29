import 'package:flutter/material.dart';
import 'package:news_app/core/presentation/widgets/project_text_widgets.dart';

class ProjectErrorText extends StatelessWidget {
  const ProjectErrorText({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OpenSansText(
        text: text,
        color: Colors.white,
        fontSize: 14,
      ),
    );
  }
}
