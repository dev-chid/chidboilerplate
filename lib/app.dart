import 'package:chidboilerplate/presentation/screens/example/example.dart';
import 'package:chidboilerplate/presentation/screens/example/example_two.dart';
import 'package:chidboilerplate/presentation/screens/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'presentation/screens/settings/settings_controller.dart';
import 'package:go_router/go_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settingsController,
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
          themeMode: settingsController.themeMode,
          routerConfig: GoRouter(
            initialLocation: '/',
            routes: [
              GoRoute(
                name: 'home',
                path: '/',
                builder: (context, state) => const Example(),
              ),
              GoRoute(
                name: 'page2',
                path: '/page2',
                builder: (context, state) => const ExampleTwo(),
              ),
              GoRoute(
                name: 'settings',
                path: '/settings',
                builder: (context, state) =>
                    SettingsView(controller: settingsController),
              ),
            ],
          ),
        );
      },
    );
  }
}
