import 'package:aes_barcode_scanner/src/config/themes/color.theme.dart';
import 'package:aes_barcode_scanner/src/config/themes/typography.theme.dart';
import 'package:aes_barcode_scanner/src/core/const/constants.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class BsAppHeaderWidget {
  final int? unreadNotification;
  final bool? isHomePage;
  final bool? isSuffixIconShow;
  final String? title;
  final String? subtitle;
  final String? imageUrl;
  final Color? backgroundColor;
  final Function()? prefixIconAction;

  BsAppHeaderWidget({
    this.isHomePage = false,
    this.isSuffixIconShow = true,
    this.title,
    this.subtitle,
    this.imageUrl,
    this.backgroundColor,
    this.prefixIconAction,
    this.unreadNotification,
  });

  PreferredSize show(BuildContext context) => PreferredSize(
    preferredSize: const Size(double.infinity, 80),
    child: Container(
      padding: const EdgeInsets.only(
        top:  36,
        bottom: 12,
        left: 20,
        right: 20,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? BsColorTheme.neutral.shade50,
      ),
      child: Row(
        children: [
          isHomePage ?? false
              ? Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AssetImages.logoBone),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: prefixIconAction ?? () => Navigator.pop(context),
                  child: Container(
                    width: 48,
                    height: 48,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: BsColorTheme.primary.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: HeroIcon(
                      HeroIcons.chevronLeft,
                      size: 32,
                      color: BsColorTheme.primary[950],
                    ),
                  ),
                ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? "App Bar Title",
                  style: BsTypographyTheme.bodyMedium(
                    context,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle ?? '',
                    style: BsTypographyTheme.bodySmall(
                      context,
                      color: BsColorTheme.neutral.shade600,
                    ),
                  ),
              ],
            ),
          ),
          if (isSuffixIconShow ?? true) ...[
            const SizedBox(width: 12),
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetImages.logoSulsel),
                ),
              ),
            ),
          ],
        ],
      ),
    ),
  );
}
