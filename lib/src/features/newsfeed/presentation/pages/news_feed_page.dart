import 'package:flutter/material.dart';
import 'package:socialme/src/core/common/settings/settings_view.dart';
import 'package:socialme/src/features/newsfeed/presentation/pages/post_page.dart';
import 'package:socialme/src/features/newsfeed/presentation/widgets/news_feed_item_widget.dart';
import 'package:socialme/src/features/newsfeed/service/entity/news_feed_item_entity.dart';

/// Displays a list of SampleItems.
class NewsFeedPage extends StatelessWidget {
  NewsFeedPage({
    super.key,
  });

  static const routeName = '/';

  final List<NewsFeedItemEntity> items = List.generate(
      100,
      (index) => NewsFeedItemEntity(
            id: "$index",
            author: "User $index",
            createdAt: "1/12/13",
            title: "No.$index Post",
            description:
                "This is the $index post. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. In mollis nunc sed id semper risus in hendrerit gravida. Vitae congue eu consequat ac felis donec. Etiam non quam lacus suspendisse faucibus interdum posuere. ",
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Feed'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: ListView.builder(
        restorationId: 'NewsFeedPage',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(PostPage.routeName),
            child: NewsFeedItemWidget(item: item),
          );
        },
      ),
    );
  }
}
