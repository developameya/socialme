import 'package:beamer/beamer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:socialme/src/core/common/widgets/error_page.dart';
import 'package:socialme/src/dummy_auth_provider.dart';
import 'package:socialme/src/features/authentication/location.dart';
import 'package:socialme/src/features/authentication/presentation/pages/sign_in_page.dart';
import 'package:socialme/src/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:socialme/src/features/newsfeed/location.dart';
import 'package:socialme/src/features/newsfeed/presentation/pages/news_feed_page.dart';
import 'package:socialme/src/features/newsfeed/presentation/pages/post_page.dart';
import 'package:socialme/src/features/posts/presentation/edit_post_page.dart';

///Provides logic for navigation and
///prevents any app data from display without authenticaton.
///
BeamerDelegate routeDelegate = BeamerDelegate(
  initialPath: SignInPage.routeName,
  notFoundPage: const BeamPage(
    child: ErrorPage(message: 'Page Not found!!'),
  ),
  locationBuilder: BeamerLocationBuilder(
    beamLocations: [
      AuthLocation(),
      NewsFeedLocation(),
    ],
  ),
  guards: [
    BeamGuard(
      pathPatterns: [
        NewsFeedPage.routeName,
        PostPage.routeName,
        EditPostPage.routeName,
      ],
      //only display this route if the user is authenticated.
      check: (context, location) {
        final container = ProviderScope.containerOf(context, listen: false);

        return container.read(dummyAuthProvider);
      },
      beamTo: (context, origin, target) => AuthLocation(),
    ),
    BeamGuard(
      pathPatterns: [
        SignInPage.routeName,
        SignUpPage.routeName,
      ],
      //only display this route if the user is not authenticated.
      check: (context, location) {
        final container = ProviderScope.containerOf(context, listen: false);

        return !container.read(dummyAuthProvider);
      },
      beamTo: (context, origin, target) => NewsFeedLocation(),
    )
  ],
);
