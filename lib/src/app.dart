import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:socialme/src/core/common/routing/routes.dart';
import 'package:socialme/src/core/common/services/service_locator.dart';
import 'package:socialme/src/core/common/settings/settings_controller.dart';

class SocialMeApp extends StatelessWidget {
  const SocialMeApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: sl.get<SettingsController>(),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
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
          onGenerateRoute: routes,
        );
      },
    );
  }
}
