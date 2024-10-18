import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/presentation/theme/app_colors.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkTheme = true;
  ThemeData theme = ThemeData(
      scaffoldBackgroundColor: AppColors.darkBgColor,
      appBarTheme: const AppBarTheme(backgroundColor: AppColors.darkBgColor));

  void changeTheme() {
    isDarkTheme = !isDarkTheme;
    theme = ThemeData(
        scaffoldBackgroundColor:
            isDarkTheme ? AppColors.darkBgColor : AppColors.white,
        appBarTheme: AppBarTheme(
          backgroundColor:
              isDarkTheme ? AppColors.darkBgColor : AppColors.white,
        ));
    notifyListeners();
  }
}
