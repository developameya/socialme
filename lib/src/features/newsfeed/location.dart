import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:socialme/src/features/newsfeed/presentation/pages/news_feed_page.dart';
import 'package:socialme/src/features/newsfeed/presentation/pages/post_page.dart';
import 'package:socialme/src/features/newsfeed/service/entity/news_feed_item_entity.dart';

class NewsFeedLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: const ValueKey(NewsFeedPage.routeName),
        title: "news feed",
        child: NewsFeedPage(),
      ),
      if (state.uri.toString() == PostPage.routeName)
        const BeamPage(
            key: ValueKey(PostPage.routeName),
            title: "post_page",
            child: PostPage(
                post: NewsFeedItemEntity(
              id: "1",
              author: "author",
              createdAt: "11/11/11",
              title: null,
              description: null,
            ))),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
        NewsFeedPage.routeName,
        PostPage.routeName,
      ];
}
