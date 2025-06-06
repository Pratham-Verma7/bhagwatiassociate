import 'package:flutter/material.dart';
import 'package:bhagwatiassociate/utils/constants/colors.dart';
import 'package:bhagwatiassociate/utils/theme/custon_themes/AppElevatedButtonTheme.dart';
import 'package:bhagwatiassociate/utils/theme/custon_themes/appbar_theme.dart';
import 'package:bhagwatiassociate/utils/theme/custon_themes/appbottem_sheet_theme.dart';
import 'package:bhagwatiassociate/utils/theme/custon_themes/appcheckbox_theme.dart';
import 'package:bhagwatiassociate/utils/theme/custon_themes/appchip_theme.dart';
import 'package:bhagwatiassociate/utils/theme/custon_themes/appoutlined_button_theme.dart';
import 'package:bhagwatiassociate/utils/theme/custon_themes/apptext_button_theme.dart';
import 'package:bhagwatiassociate/utils/theme/custon_themes/apptext_form_field_theme.dart';
import 'package:bhagwatiassociate/utils/theme/custon_themes/text_theme.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'OpenSans',
    brightness: Brightness.light,
    primaryColor: SColors.primary,
    textTheme: AppTextTheme.lightTextTheme,
    chipTheme: AppChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppAppBarTheme.lightAppBarTheme,
    checkboxTheme: AppCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: AppBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: AppOutlinedTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: AppFormFieldTheme.lightFormFieldTheme,
    textButtonTheme: AppTextButtonTheme.lightTextButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'OpenSans',
    brightness: Brightness.dark,
    primaryColor: SColors.primary,
    textTheme: AppTextTheme.darkTextTheme,
    chipTheme: AppChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppAppBarTheme.darkAppBarTheme,
    checkboxTheme: AppCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: AppBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: AppOutlinedTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: AppFormFieldTheme.darkFormFieldTheme,
    textButtonTheme: AppTextButtonTheme.darkTextButtonTheme,
  );
}
