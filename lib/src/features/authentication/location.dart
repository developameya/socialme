import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';
import 'package:socialme/src/features/authentication/presentation/pages/sign_in_page.dart';
import 'package:socialme/src/features/authentication/presentation/pages/sign_up_page.dart';

///A location which provides routes for all the pages within authentication.
///
class AuthLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      if (state.uri.toString() == SignInPage.routeName)
        const BeamPage(
            key: ValueKey(SignInPage.routeName),
            title: "socialme! - signin",
            child: SignInPage()),
      if (state.uri.toString() == SignUpPage.routeName)
        const BeamPage(
            key: ValueKey(SignUpPage.routeName),
            title: "socialme! - signup",
            child: SignInPage()),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
        SignInPage.routeName,
        SignUpPage.routeName,
      ];
}
