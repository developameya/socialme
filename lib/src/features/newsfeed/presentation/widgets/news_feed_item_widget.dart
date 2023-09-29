import 'package:flutter/material.dart';
import 'package:socialme/src/features/newsfeed/data/datamodel/sample_item.dart';
import 'package:socialme/src/features/newsfeed/presentation/pages/sample_item_details_view.dart';

class NewsFeedItemWidget extends StatelessWidget {
  const NewsFeedItemWidget({
    super.key,
    required this.item,
  });

  final SampleItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text('SampleItem ${item.id}'),
        leading: const CircleAvatar(
          foregroundImage: AssetImage('assets/images/flutter_logo.png'),
        ),
        onTap: () {
          Navigator.restorablePushNamed(
            context,
            SampleItemDetailsView.routeName,
          );
        });
  }
}
