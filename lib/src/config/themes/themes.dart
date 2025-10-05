import 'package:aes_barcode_scanner/src/config/themes/color.theme.dart';
import 'package:aes_barcode_scanner/src/config/themes/typography.theme.dart';
import 'package:flutter/material.dart';

class BsTheme {
  static ThemeData lightTheme() => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: BsColorTheme.neutral.shade50,
        dialogBackgroundColor: BsColorTheme.neutral.shade50,
        textTheme: BsTypographyTheme.light(),
      );

  static ThemeData darkTheme() => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: BsColorTheme.neutral[950],
        dialogBackgroundColor: BsColorTheme.neutral.shade50,
        textTheme: BsTypographyTheme.dark(),
      );
}
