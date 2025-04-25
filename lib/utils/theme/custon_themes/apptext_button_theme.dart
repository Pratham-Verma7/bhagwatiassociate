import 'package:flutter/material.dart';
import 'package:bhagwatiassociate/utils/constants/colors.dart';

class AppTextButtonTheme {
  AppTextButtonTheme._();

  static TextButtonThemeData lightTextButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(SColors.primary),
      padding: WidgetStateProperty.all(EdgeInsets.zero), // No padding
      minimumSize: WidgetStateProperty.all(const Size(0, 0)), // No minimum size
      tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Shrink wrap tap target
      textStyle: WidgetStateProperty.all(
        const TextStyle(
          color: SColors.lightGrey,

          fontWeight: FontWeight.bold,
          // decoration: TextDecoration.underline, // Add underline if needed
        ),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
  );
  static TextButtonThemeData darkTextButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStateProperty.all(EdgeInsets.zero), // No padding
      minimumSize: WidgetStateProperty.all(const Size(0, 0)), // No minimum size
      tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Shrink wrap tap target
      textStyle: WidgetStateProperty.all(
        const TextStyle(
          color: SColors.lightGrey,
          fontWeight: FontWeight.bold,
          // decoration: TextDecoration.underline, // Add underline if needed
        ),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
  );
}
