import 'package:flutter/material.dart';

import '../theme/light_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  ThemeData _themeData = getLightTheme();

  ThemeProvider(this._themeData);

  ThemeData get theme => _themeData;
  bool get isDarkMode => themeMode == ThemeMode.dark;
  set theme(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (themeMode == ThemeMode.dark) {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
    notifyListeners();
  }
}
