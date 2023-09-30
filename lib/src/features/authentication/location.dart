import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';
import 'package:socialme/src/features/authentication/presentation/pages/sign_in_page.dart';
import 'package:socialme/src/features/authentication/presentation/pages/sign_up_page.dart';

///Build a stack of pages related to authentication.
///
///
class AuthLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
          key: ValueKey(SignInPage.routeName),
          title: "socialme! - signin",
          child: SignInPage()),
      if (state.uri.toString() == SignUpPage.routeName)
        const BeamPage(
            key: ValueKey(SignUpPage.routeName),
            title: "socialme! - signup",
            child: SignUpPage()),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
        SignInPage.routeName,
        SignUpPage.routeName,
      ];
}
