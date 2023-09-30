import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:socialme/src/core/common/routing/route_delegates.dart';
import 'package:socialme/src/core/common/services/service_locator.dart';
import 'package:socialme/src/core/common/settings/settings_controller.dart';
import 'package:socialme/src/dummy_auth_provider.dart';

class SocialMeApp extends ConsumerWidget {
  const SocialMeApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(dummyAuthProvider);

    return BeamerProvider(
      routerDelegate: routeDelegate,
      child: AnimatedBuilder(
        animation: sl.get<SettingsController>(),
        builder: (BuildContext context, Widget? child) {
          return MaterialApp.router(
            restorationScopeId: 'app',
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''), // English, no country code
            ],
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context)!.appTitle,
            theme: ThemeData(),
            darkTheme: ThemeData.dark(),
            themeMode: sl.get<SettingsController>().themeMode,
            routeInformationParser: BeamerParser(),
            routerDelegate: routeDelegate,
          );
        },
      ),
    );
  }
}
