import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/presentation/resources/color_manager.dart';
import 'package:news_app/core/presentation/resources/values_manager.dart';
import 'package:news_app/core/presentation/widgets/project_text_widgets.dart';
import 'package:news_app/core/utilities/string_extension.dart';
import 'package:news_app/features/news_feed/presentation/providers/chosen_category_provider.dart';

class CategoryChip extends ConsumerWidget {
  const CategoryChip({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kRadius),
        color: ColorExtension.fromHex(kPinkAccent30OpacityHexCode),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(kPaddingSmall),
          child: RobotoBoldText(
            text: ref.watch(chosenCategoryProvider).capitalize(),
            fontSize: 12,
            color: ColorExtension.fromHex(kPinkAccentHexCode),
          ),
        ),
      ),
    );
  }
}
