import 'package:flutter/material.dart';
import 'package:socialme/src/core/common/settings/settings_view.dart';
import 'package:socialme/src/features/authentication/presentation/pages/sign_in_page.dart';
import 'package:socialme/src/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:socialme/src/features/newsfeed/presentation/pages/news_feed_page.dart';
import 'package:socialme/src/features/newsfeed/presentation/pages/sample_item_details_view.dart';

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
          case SampleItemDetailsView.routeName:
            return const SampleItemDetailsView();
          case NewsFeedPage.routeName:
            return const NewsFeedPage();
          default:
            return const NewsFeedPage();
        }
      },
    );
