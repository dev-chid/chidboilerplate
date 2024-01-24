import 'package:chidboilerplate/bloc/example_bloc.dart';
import 'package:chidboilerplate/data/data_provider/example_data_provider.dart';
import 'package:chidboilerplate/data/repository/example_repository.dart';
import 'package:chidboilerplate/presentation/screens/category/category_list.dart';
import 'package:chidboilerplate/presentation/screens/example/example.dart';
import 'package:chidboilerplate/presentation/screens/example/example_two.dart';
import 'package:chidboilerplate/presentation/screens/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        return RepositoryProvider(
          create: (context) => ExampleRepository(
            ExampleDataProvider(),
          ),
          child: BlocProvider(
            create: (context) => ExampleBloc(
              context.read<ExampleRepository>(),
            ),
            child: MaterialApp.router(
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
                    builder: (context, state) => CategoryList(),
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
            ),
          ),
        );
      },
    );
  }
}
