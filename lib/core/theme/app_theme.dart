import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final appTheme = ThemeData.dark().copyWith(
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(background: AppPallete.backgroundColor));
}
