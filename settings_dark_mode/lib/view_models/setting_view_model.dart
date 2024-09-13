import 'package:flutter/material.dart';

class SettingViewModel with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  /// 테마 변경
  void changeTheme(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
  }

  /// 설정 화면에 표시할 테마 이름 값 return
  String getThemeName() {
    switch (themeMode) {
      case ThemeMode.light:
        return '라이트 모드';
      case ThemeMode.dark:
        return '다크 모드';
      case ThemeMode.system:
      default:
        return '시스템 설정';
    }
  }
}
