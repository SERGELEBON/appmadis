import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeService with ChangeNotifier {
  final String _boxName = 'settings';
  final String _key = 'isDarkMode';

  bool _isDarkMode = false;

  ThemeService() {
    _isDarkMode = _loadThemeFromBox();
  }

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _saveThemeToBox(_isDarkMode);
    notifyListeners();
  }

  bool _loadThemeFromBox() {
    final box = Hive.box(_boxName);
    return box.get(_key, defaultValue: false);
  }

  void _saveThemeToBox(bool isDarkMode) {
    final box = Hive.box(_boxName);
    box.put(_key, isDarkMode);
  }
}
