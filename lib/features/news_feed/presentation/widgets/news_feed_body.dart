import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/core/presentation/resources/strings_manager.dart';
import 'package:news_app/core/presentation/widgets/news_item_layout.dart';
import 'package:news_app/core/presentation/widgets/project_error_text.dart';
import 'package:news_app/core/presentation/widgets/project_progress_indicator.dart';
import 'package:news_app/core/presentation/widgets/stretched_news_layout.dart';
import 'package:news_app/features/news_feed/domain/entities/news_feed_entity.dart';
import 'package:news_app/features/news_feed/presentation/providers/news_feed_providers.dart';

class NewsFeedBody extends ConsumerWidget {
  const NewsFeedBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsFeed = ref.watch(newsFeedProvider);

    return newsFeed.when(
      loading: () => const ProjectProgressIndicator(),
      error: (error, stack) => ProjectErrorText(text: error.toString()),
      data: (result) => result.fold(
        buildErrorText,
        (NewsFeedEntity right) {
          return buildListView(right, ref);
        },
      ),
    );
  }

  Widget buildErrorText(Failure left) {
    return ProjectErrorText(
      text: left is ServerFailure
          ? kServerFailureString
          : kConnectivityFailureString,
    );
  }

  Widget buildListView(NewsFeedEntity right, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(newsFeedProvider);
      },
      child: ListView.builder(
        itemCount: right.articles?.length,
        itemBuilder: (context, index) {
          final ArticlesEntity? entity = right.articles?[index];
          return entity == null
              ? const SizedBox.shrink()
              : InkWell(
                  onTap: () async {
                    /*
                    await navigateToEntityDetails(context,entity: entity);
                     */
                  },
                  child: buildListViewItem(index, entity),
                );
        },
      ),
    );
  }

  StatelessWidget buildListViewItem(int index, ArticlesEntity entity) {
    return index == 0 // if first item
        ? StretchedNewsLayout(articlesEntity: entity) // first item's layout
        : NewsItemLayout(articlesEntity: entity);
  }

/*Future<void> navigateToEntityDetails(BuildContext context,
      {required ArticlesEntity entity}) async {
    await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return NewsDetailPage(articlesEntity: entity);
    }));
  }*/
}
