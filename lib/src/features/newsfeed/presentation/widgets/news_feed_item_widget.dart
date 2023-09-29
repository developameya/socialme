import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
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
            avatar: GFAvatar(
              backgroundImage: item.authorImageUrl != null
                  ? NetworkImage(item.authorImageUrl!)
                  : null,
              child:
                  item.authorImageUrl == null ? const Icon(Icons.person) : null,
            ),
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
