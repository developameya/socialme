import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:socialme/src/core/common/widgets/progress_indicator_widget.dart';
import 'package:socialme/src/features/newsfeed/presentation/widgets/author_card_widget.dart';
import 'package:socialme/src/features/newsfeed/presentation/widgets/post_page_app_bar_widget.dart';
import 'package:socialme/src/features/newsfeed/service/entity/news_feed_item_entity.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Displays detailed information about a Post from the news feed.
///
/// Note: [edit] button is only displayed if the current user is the author
/// of the post.
///
class PostPage extends HookWidget {
  ///The post to be displayed on the page.
  final NewsFeedItemEntity post;

  ///Creates a page to display post.
  ///
  ///Note: [post] should not be null.
  ///
  const PostPage({
    super.key,
    required this.post,
  });

  static const routeName = '/post_page';

  @override
  Widget build(BuildContext context) {
    //TODO: evaluate this bool if the current user is the author of the post.
    final isAuthor = useState(false);
    return Scaffold(
        appBar: buildPostPageAppBar(
          title: post.title,
          context: context,
          isAuthor: isAuthor.value,
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          if (post.imageUrl != null)
            CachedNetworkImage(
              placeholder: (context, url) =>
                  const Center(child: ProgressIndicatorWidget()),
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.contain,
              imageUrl: post.imageUrl!,
            ),
          AuthorCardWidget(post: post),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                post.description ??
                    AppLocalizations.of(context)!.emptyPostMessage,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 18),
              ))
        ])));
  }
}
