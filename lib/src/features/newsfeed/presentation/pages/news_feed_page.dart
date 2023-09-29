import 'package:flutter/material.dart';
import 'package:socialme/src/core/common/settings/settings_view.dart';
import 'package:socialme/src/features/newsfeed/data/datamodel/sample_item.dart';
import 'package:socialme/src/features/newsfeed/presentation/widgets/news_feed_item_widget.dart';

/// Displays a list of SampleItems.
class NewsFeedPage extends StatelessWidget {
  const NewsFeedPage({
    super.key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  });

  static const routeName = '/';

  final List<SampleItem> items;

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
        restorationId: 'sampleItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return NewsFeedItemWidget(item: item);
        },
      ),
    );
  }
}
