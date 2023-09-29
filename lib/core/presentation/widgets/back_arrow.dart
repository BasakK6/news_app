import 'package:flutter/material.dart';
import 'package:news_app/core/presentation/resources/color_manager.dart';
import 'package:news_app/core/presentation/resources/values_manager.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Navigator.of(context).maybePop();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.circle,
            color: ColorExtension.fromHex(
              kPurpleHexCode,
            ),
            size: kBackArrowSize,
          ),
          const Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
