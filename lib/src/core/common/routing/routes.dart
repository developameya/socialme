import 'package:flutter/material.dart';
import 'package:socialme/src/core/common/settings/settings_view.dart';
import 'package:socialme/src/features/authentication/presentation/pages/sign_in_page.dart';
import 'package:socialme/src/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:socialme/src/features/posts/presentation/edit_post_page.dart';
import 'package:socialme/src/features/newsfeed/presentation/pages/news_feed_page.dart';
import 'package:socialme/src/features/newsfeed/presentation/pages/post_page.dart';
import 'package:socialme/src/features/newsfeed/service/entity/news_feed_item_entity.dart';

Route<dynamic>? routes(RouteSettings routeSettings) => MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) {
        switch (routeSettings.name) {
          case SignInPage.routeName:
            return const SignInPage();
          case SignUpPage.routeName:
            return const SignUpPage();
          case SettingsView.routeName:
            return SettingsView();
          case NewsFeedPage.routeName:
            return NewsFeedPage();
          case EditPostPage.routeName:
            return const EditPostPage();
          case PostPage.routeName:
            //TODO: temp
            return const PostPage(
              post: NewsFeedItemEntity(
                id: "1",
                author: "author",
                createdAt: "11/11/11",
                title: null,
                description: null,
              ),
            );

          default:
            return const SignInPage();
        }
      },
    );
