import 'package:flutter/material.dart';
import 'package:bhagwatiassociate/utils/constants/colors.dart';

class AppFormFieldTheme {
  AppFormFieldTheme._();

  static InputDecorationTheme lightFormFieldTheme = InputDecorationTheme(
    errorMaxLines: 3,
    alignLabelWithHint: false,

    floatingLabelAlignment: FloatingLabelAlignment.start,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    // contentPadding: const EdgeInsets.symmetric(vertical: 5),
    // floatingLabelBehavior: FloatingLabelBehavior.auto,
    suffixIconColor: SColors.grey,

    labelStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: SColors.darkerGrey,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: SColors.lightGrey,
    ),
    errorStyle:
        const TextStyle().copyWith(fontStyle: FontStyle.normal, fontSize: 12
            // color: Colors.red,
            ),
    floatingLabelStyle: const TextStyle().copyWith(
      color: SColors.darkerGrey.withOpacity(0.8),
    ),
    border: const UnderlineInputBorder().copyWith(
      borderSide: const BorderSide(
        width: 1,
        color: SColors.lightGrey,
      ),
    ),

    // OutlineInputBorder().copyWith(
    //   borderRadius: BorderRadius.circular(14),
    //   borderSide: const BorderSide(
    //     width: 1,
    //     color: Colors.grey,
    //   ),
    // ),
    enabledBorder: const UnderlineInputBorder().copyWith(
      borderSide: const BorderSide(
        width: 1,
        color: SColors.lightGrey,
      ),
    ),
    // const OutlineInputBorder().copyWith(
    //   borderRadius: BorderRadius.circular(14),
    //   borderSide: const BorderSide(
    //     width: 1,
    //     color: Colors.grey,
    //   ),
    // ),
    focusedBorder: const UnderlineInputBorder().copyWith(
      borderSide: const BorderSide(
        width: 1,
        color: SColors.lightGrey,
      ),
    ),

    //  OutlineInputBorder().copyWith(
    //   borderRadius: BorderRadius.circular(14),
    //   borderSide: const BorderSide(
    //     width: 1,
    //     color: Colors.black12,
    //   ),
    // ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.red,
      ),
    ),
    focusedErrorBorder: const UnderlineInputBorder().copyWith(
      borderSide: const BorderSide(
        width: 1,
        color: Colors.orange,
      ),
    ),
  );

  static InputDecorationTheme darkFormFieldTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    floatingLabelAlignment: FloatingLabelAlignment.start,
    labelStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: Colors.white,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: Colors.white,
    ),
    errorStyle: const TextStyle().copyWith(
      fontStyle: FontStyle.normal,
      // color: Colors.red,
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      color: Colors.white.withOpacity(0.8),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.grey,
      ),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.grey,
      ),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.white,
      ),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.red,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(
        width: 2,
        color: Colors.orange,
      ),
    ),
  );
}
