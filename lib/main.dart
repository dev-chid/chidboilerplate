import 'package:flutter/material.dart';

import 'app.dart';
import 'presentation/screens/settings/settings_controller.dart';
import 'presentation/screens/settings/settings_service.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  runApp(
    MyApp(
      settingsController: settingsController,
    ),
  );
}
