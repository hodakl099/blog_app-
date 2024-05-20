import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
        appBarTheme: const AppBarTheme(
      backgroundColor: AppPallete.backgroundColor,
    iconTheme:  IconThemeData(color: Colors.white),
    ),
  
      colorScheme: ColorScheme.fromSwatch()
          // ignore: deprecated_member_use
          .copyWith(background: AppPallete.whiteColor),
    
       inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      border: _border(),
      enabledBorder: _border(),
      focusedBorder: _border(AppPallete.gradient2),
      errorBorder: _border(AppPallete.errorColor),
    ),
          );
            static _border([Color color = AppPallete.borderColor]) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      );
}
