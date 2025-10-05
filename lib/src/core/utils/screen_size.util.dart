import 'package:flutter/material.dart';

class ScreenSizeUtil {
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double pageWidth(BuildContext context, {double padding = 20}) =>
      MediaQuery.of(context).size.width - (2 * padding);

  static double cardWidth(
    BuildContext context, {
    double padding = 32,
    double cardPadding = 0,
    double itemSpacing = 8,
    int itemLength = 1,
  }) =>
      ((MediaQuery.of(context).size.width - (padding + cardPadding)) -
          (itemSpacing * (itemLength - 1))) /
      itemLength;
}
