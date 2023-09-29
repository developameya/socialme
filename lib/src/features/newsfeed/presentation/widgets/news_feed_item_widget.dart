import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:socialme/src/core/common/widgets/user_avatar_widget.dart';
import 'package:socialme/src/features/newsfeed/service/entity/news_feed_item_entity.dart';

class NewsFeedItemWidget extends StatelessWidget {
  const NewsFeedItemWidget({
    super.key,
    required this.item,
  });

  final NewsFeedItemEntity item;

  @override
  Widget build(BuildContext context) {
    return GFCard(
        image: item.imageUrl != null
            ? Image.network(
                item.imageUrl!,
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              )
            : null,
        showImage: item.imageUrl != null,
        boxFit: BoxFit.cover,
        titlePosition: GFPosition.start,
        title: GFListTile(
            avatar: UserAvatarWidget(userImageUrl: item.authorImageUrl),
            title: Text(
              item.title ?? "",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subTitle: Text(
              item.description ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )));
  }
}
