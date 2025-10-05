import 'package:flutter/material.dart';
import 'package:aes_barcode_scanner/src/config/themes/color.theme.dart';
import 'package:aes_barcode_scanner/src/config/themes/typography.theme.dart';

class AppModalWidget {
  static showModal(
    BuildContext context, {
    bool barrierDismissible = false,
    bool scrollable = true,
    String? title,
    Color? backgroundColor,
    List<Widget>? contents,
    Widget? content,
    List<Widget>? actionsWidgets,
  }) =>
      showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) => AlertDialog(
          title: Text(
            title ?? 'Modal Title',
            style: BsTypographyTheme.bodyMedium(context,
                fontWeight: FontWeight.w600),
          ),
          scrollable: scrollable,
          backgroundColor: backgroundColor ?? BsColorTheme.neutral.shade50,
          content: content ??
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: contents ?? [],
              ),
          actions: actionsWidgets,
        ),
      );
}
