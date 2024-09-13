import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_dark_mode/constants/palette.dart';
import 'package:settings_dark_mode/view_models/setting_view_model.dart';
import 'package:settings_dark_mode/views/home_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingViewModel(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomThemeData.lightTheme,
      darkTheme: CustomThemeData.darkTheme,
      themeMode: Provider.of<SettingViewModel>(context).themeMode,
      home: const Scaffold(
        body: Center(
          child: HomeView(),
        ),
      ),
    );
  }
}

// flutter pub add provider
// flutter pub add shared_preferences