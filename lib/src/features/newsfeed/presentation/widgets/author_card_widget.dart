import 'package:flutter/material.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:socialme/src/core/common/widgets/user_avatar_widget.dart';
import 'package:socialme/src/features/newsfeed/service/entity/news_feed_item_entity.dart';

///Information of the author of the post.
///
class AuthorCardWidget extends StatelessWidget {
  final NewsFeedItemEntity post;

  ///Create the card with author's information.
  ///
  const AuthorCardWidget({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return GFCard(
      title: GFListTile(
        padding: const EdgeInsets.all(0.0),
        avatar: UserAvatarWidget(userImageUrl: post.authorImageUrl),
        title: Text(
          post.author,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subTitle: Text(
          "Posted on: ${post.createdAt}",
        ),
      ),
    );
  }
}
