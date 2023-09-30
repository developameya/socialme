import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:socialme/src/features/posts/presentation/edit_post_page.dart';

class PostsLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
          key: ValueKey(EditPostPage.routeName),
          title: "edit_post_page",
          child: EditPostPage()),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [EditPostPage.routeName];
}
