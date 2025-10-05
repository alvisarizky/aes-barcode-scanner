import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:aes_barcode_scanner/src/config/themes/color.theme.dart';
import 'package:aes_barcode_scanner/src/config/themes/typography.theme.dart';

enum SnackBarMessageType {
  information,
  error,
  warning,
  success,
}

class BsSnackBarMessage {
  String _title = 'Notification';
  HeroIcons? _icon;
  Color _backgroundColor = Colors.transparent;
  Color _iconColor = Colors.transparent;

  showMessage(
    BuildContext context, {
    String? message,
    String? title,
    SnackBarMessageType? type,
  }) {
    switch (type) {
      case SnackBarMessageType.information:
        _icon = HeroIcons.exclamationCircle;
        _backgroundColor = BsColorTheme.information.shade50;
        _iconColor = BsColorTheme.information.shade700;
        _title = 'Information';
        break;
      case SnackBarMessageType.error:
        _icon = HeroIcons.exclamationCircle;
        _backgroundColor = BsColorTheme.error.shade50;
        _iconColor = BsColorTheme.error.shade700;
        _title = 'Error';
        break;
      case SnackBarMessageType.warning:
        _icon = HeroIcons.exclamationTriangle;
        _backgroundColor = BsColorTheme.warning.shade50;
        _iconColor = BsColorTheme.warning.shade700;
        _title = 'Warning';
        break;
      case SnackBarMessageType.success:
        _icon = HeroIcons.checkCircle;
        _backgroundColor = BsColorTheme.success.shade50;
        _iconColor = BsColorTheme.success.shade700;
        _title = 'Success';
        break;
      default:
        _backgroundColor = BsColorTheme.neutral.shade100;
    }

    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: _backgroundColor,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.horizontal,
        closeIconColor: BsColorTheme.neutral.shade600,
        showCloseIcon: true,
        margin: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 24,
        ),
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_icon != null) ...[
              HeroIcon(
                _icon ?? HeroIcons.exclamationCircle,
                size: 20,
                color: _iconColor,
              ),
              const SizedBox(width: 8),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? _title,
                    style: BsTypographyTheme.bodySmall(
                      context,
                      fontWeight: FontWeight.w500,
                      color: BsColorTheme.neutral[950],
                    ),
                  ),
                  if (message != null)
                    Text(
                      message,
                      style: BsTypographyTheme.bodySmall(
                        context,
                        color: BsColorTheme.neutral.shade600,
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
