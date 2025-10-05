import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:aes_barcode_scanner/src/config/themes/color.theme.dart';
import 'package:aes_barcode_scanner/src/config/themes/typography.theme.dart';

enum BadgeSize { large, medium, small }

enum BadgeStyle { filled, outline }

enum BadgeType { info, warning, danger, success }

enum BadgeState { dot, iconTrailing }

class BsBadgeWidget {
  static Widget show(
    BuildContext context, {
    String? label,
    BadgeSize badgeSize = BadgeSize.medium,
    BadgeStyle badgeStyle = BadgeStyle.filled,
    BadgeType? badgeType,
    BadgeState? badgeState,
    bool isExpanded = false,
    Color? backgroundColor,
  }) {
    bool isShowBorder = false;
    EdgeInsets? badgePadding;
    TextStyle? badgeLabelStyle;
    Color? badgeBackgroundColor;
    Color? badgeContentColor;
    double? iconSize;

    switch (badgeSize) {
      case BadgeSize.small:
        badgePadding = const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 2,
        );
        badgeLabelStyle = BsTypographyTheme.bodyXSmall(
          context,
          fontWeight: FontWeight.w500,
        );
        iconSize = 14.0;
        break;
      case BadgeSize.large:
        badgePadding = const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 4,
        );
        badgeLabelStyle = BsTypographyTheme.bodySmall(
          context,
          fontWeight: FontWeight.w500,
        );
        iconSize = 12.0;
        break;
      default:
        badgePadding = const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 2,
        );
        badgeLabelStyle = BsTypographyTheme.bodySmall(
          context,
          fontWeight: FontWeight.w500,
        );
        iconSize = 14.0;
        break;
    }

    if (badgeStyle == BadgeStyle.filled) {
      switch (badgeType) {
        case BadgeType.info:
          badgeBackgroundColor = BsColorTheme.information.shade100;
          badgeContentColor = BsColorTheme.information.shade700;
          break;
        case BadgeType.warning:
          badgeBackgroundColor = BsColorTheme.warning.shade100;
          badgeContentColor = BsColorTheme.warning.shade700;
          break;
        case BadgeType.danger:
          badgeBackgroundColor = BsColorTheme.error.shade100;
          badgeContentColor = BsColorTheme.error.shade700;
          break;
        case BadgeType.success:
          badgeBackgroundColor = BsColorTheme.success.shade100;
          badgeContentColor = BsColorTheme.success.shade700;
          break;
        default:
          badgeBackgroundColor = BsColorTheme.neutral.shade50;
          badgeContentColor = BsColorTheme.neutral[950];
          break;
      }
    }

    if (badgeStyle == BadgeStyle.outline) {
      isShowBorder = true;

      switch (badgeType) {
        case BadgeType.info:
          badgeBackgroundColor = BsColorTheme.information.shade50;
          badgeContentColor = BsColorTheme.information.shade700;
          break;
        case BadgeType.warning:
          badgeBackgroundColor = BsColorTheme.warning.shade50;
          badgeContentColor = BsColorTheme.warning.shade700;
          break;
        case BadgeType.danger:
          badgeBackgroundColor = BsColorTheme.error.shade50;
          badgeContentColor = BsColorTheme.error.shade700;
          break;
        case BadgeType.success:
          badgeBackgroundColor = BsColorTheme.success.shade50;
          badgeContentColor = BsColorTheme.success.shade700;
          break;
        default:
          badgeBackgroundColor = BsColorTheme.neutral.shade50;
          badgeContentColor = BsColorTheme.neutral[950];
          break;
      }
    }

    return Container(
      padding: badgePadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isShowBorder ? badgeContentColor! : Colors.transparent,
        ),
        color: backgroundColor ?? badgeBackgroundColor,
      ),
      child: Row(
        children: [
          if (badgeState == BadgeState.dot) ...[
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: badgeContentColor,
              ),
            ),
            const SizedBox(width: 4),
          ],
          if (isExpanded)
            Expanded(
              child: Text(
                label ?? 'Label',
                style: badgeLabelStyle.copyWith(color: badgeContentColor),
              ),
            ),
          if (!isExpanded)
            Text(
              label ?? 'Label',
              style: badgeLabelStyle.copyWith(color: badgeContentColor),
            ),
          if (badgeState == BadgeState.iconTrailing) ...[
            const SizedBox(width: 4),
            HeroIcon(
              HeroIcons.xMark,
              color: badgeContentColor,
              size: iconSize,
            )
          ],
        ],
      ),
    );
  }
}
