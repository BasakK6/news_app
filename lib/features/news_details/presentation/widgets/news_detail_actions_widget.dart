import 'package:flutter/material.dart';

class NewsDetailActionsWidget extends StatelessWidget {
  const NewsDetailActionsWidget({
    super.key,
    this.messageFunctionality,
    this.shareFunctionality,
    this.bookmarkFunctionality,
  });

  final VoidCallback? messageFunctionality;
  final VoidCallback? shareFunctionality;
  final VoidCallback? bookmarkFunctionality;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: IconButton(
            onPressed: messageFunctionality ?? () {},
            icon: const Icon(Icons.message_outlined, color: Colors.white),
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: shareFunctionality ?? () {},
            icon: const Icon(Icons.share, color: Colors.white),
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: bookmarkFunctionality ?? () {},
            icon: const Icon(
              Icons.bookmark_border_outlined,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
