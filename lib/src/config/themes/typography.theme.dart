import 'package:aes_barcode_scanner/src/config/themes/color.theme.dart';
import 'package:flutter/material.dart';

class BsTypographyTheme {
  static TextStyle heading1(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
  }) =>
      Theme.of(context).textTheme.headlineLarge!.copyWith(
            fontSize: 48,
            fontWeight: fontWeight,
            color: color,
            fontStyle: fontStyle,
          );

  static TextStyle heading2(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
  }) =>
      Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontSize: 40,
            fontWeight: fontWeight,
            color: color,
            fontStyle: fontStyle,
          );

  static TextStyle heading3(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
  }) =>
      Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontSize: 32,
            fontWeight: fontWeight,
            color: color,
            fontStyle: fontStyle,
          );

  static TextStyle heading4(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
  }) =>
      Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 24,
            fontWeight: fontWeight,
            color: color,
            fontStyle: fontStyle,
          );

  static TextStyle heading5(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
  }) =>
      Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 20,
            fontWeight: fontWeight,
            color: color,
            fontStyle: fontStyle,
          );

  static TextStyle heading6(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
  }) =>
      Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize: 18,
            fontWeight: fontWeight,
            color: color,
            fontStyle: fontStyle,
          );

  static TextStyle bodyLarge(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
  }) =>
      Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: 18,
            fontWeight: fontWeight,
            color: color,
            fontStyle: fontStyle,
          );

  static TextStyle bodyMedium(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
  }) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 16,
            fontWeight: fontWeight,
            color: color,
            fontStyle: fontStyle,
          );

  static TextStyle bodySmall(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
  }) =>
      Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 14,
            fontWeight: fontWeight,
            color: color,
            fontStyle: fontStyle,
          );

  static TextStyle bodyXSmall(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
  }) =>
      Theme.of(context).textTheme.labelLarge!.copyWith(
            fontSize: 12,
            fontWeight: fontWeight,
            color: color,
            fontStyle: fontStyle,
          );

  static TextTheme light() => TextTheme(
        headlineLarge: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          color: BsColorTheme.neutral[950],
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          color: BsColorTheme.neutral[950],
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          color: BsColorTheme.neutral[950],
        ),
        titleLarge: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          color: BsColorTheme.neutral[950],
        ),
        titleMedium: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          color: BsColorTheme.neutral[950],
        ),
        titleSmall: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          color: BsColorTheme.neutral[950],
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          color: BsColorTheme.neutral[950],
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          color: BsColorTheme.neutral[950],
        ),
        bodySmall: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          color: BsColorTheme.neutral[950],
        ),
        labelLarge: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          color: BsColorTheme.neutral[950],
        ),
      );

  static TextTheme dark() => TextTheme(
        headlineLarge: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          color: BsColorTheme.neutral.shade50,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          color: BsColorTheme.neutral.shade50,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          color: BsColorTheme.neutral.shade50,
        ),
        titleLarge: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          color: BsColorTheme.neutral.shade50,
        ),
        titleMedium: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          color: BsColorTheme.neutral.shade50,
        ),
        titleSmall: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          color: BsColorTheme.neutral.shade50,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          color: BsColorTheme.neutral.shade50,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          color: BsColorTheme.neutral.shade50,
        ),
        bodySmall: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          color: BsColorTheme.neutral.shade50,
        ),
        labelLarge: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          color: BsColorTheme.neutral.shade50,
        ),
      );
}
