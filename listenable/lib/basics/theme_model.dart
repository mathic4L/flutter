import 'package:flutter/cupertino.dart';

class ThemeModel extends ValueNotifier<bool> {
  ThemeModel(super.value);

  void changeTheme(bool isDark) {
    value = isDark;
    notifyListeners();
  }
}
