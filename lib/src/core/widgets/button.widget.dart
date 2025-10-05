import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:aes_barcode_scanner/src/config/themes/color.theme.dart';
import 'package:aes_barcode_scanner/src/config/themes/typography.theme.dart';

enum ButtonSize {
  large,
  medium,
  small,
  xSmall,
}

enum ButtonState {
  normal,
  disable,
}

class BsButtonWidget extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? contentColor;
  final double? width;
  final MainAxisAlignment? contentAlignment;
  final HeroIcons? prefixIcon;
  final HeroIcons? suffixIcon;
  final ButtonSize? buttonSize;
  final ButtonState? buttonState;

  const BsButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
    this.backgroundColor,
    this.borderColor,
    this.contentColor,
    this.width,
    this.contentAlignment,
    this.prefixIcon,
    this.suffixIcon,
    this.buttonSize,
    this.buttonState,
  });

  double _setMinHeight(ButtonSize buttonSize) {
    double minHeigt = 52.0;
    switch (buttonSize) {
      case ButtonSize.medium:
        minHeigt = 48.0;
        break;
      case ButtonSize.small:
        minHeigt = 40.0;
        break;
      case ButtonSize.xSmall:
        minHeigt = 32.0;
        break;
      default:
        minHeigt = 52.0;
        break;
    }

    return minHeigt;
  }

  double _setBorderRadius(ButtonSize buttonSize) {
    double buttonRadius = 12.0;
    switch (buttonSize) {
      case ButtonSize.medium:
        buttonRadius = 10.0;
        break;
      case ButtonSize.small:
        buttonRadius = 8.0;
        break;
      case ButtonSize.xSmall:
        buttonRadius = 6.0;
        break;
      default:
        buttonRadius = 12.0;
        break;
    }

    return buttonRadius;
  }

  double _setIconSize(ButtonSize buttonSize) {
    double iconSize = 20.0;
    switch (buttonSize) {
      case ButtonSize.medium:
        iconSize = 20.0;
        break;
      case ButtonSize.small:
        iconSize = 16.0;
        break;
      case ButtonSize.xSmall:
        iconSize = 16.0;
        break;
      default:
        iconSize = 20.0;
        break;
    }

    return iconSize;
  }

  TextStyle _setTextStyle(
    BuildContext context,
    ButtonSize buttonSize, {
    Color? contentColor,
  }) {
    TextStyle textStyle = BsTypographyTheme.bodyMedium(
      context,
      color: BsColorTheme.neutral.shade50,
    );
    switch (buttonSize) {
      case ButtonSize.medium:
        textStyle = BsTypographyTheme.bodyMedium(
          context,
          fontWeight: FontWeight.w600,
          color: contentColor ?? BsColorTheme.neutral.shade50,
        );
        break;
      case ButtonSize.small:
        textStyle = BsTypographyTheme.bodySmall(
          context,
          fontWeight: FontWeight.w600,
          color: contentColor ?? BsColorTheme.neutral.shade50,
        );
        break;
      case ButtonSize.xSmall:
        textStyle = BsTypographyTheme.bodyXSmall(
          context,
          fontWeight: FontWeight.w600,
          color: contentColor ?? BsColorTheme.neutral.shade50,
        );
        break;
      default:
        textStyle = BsTypographyTheme.bodyMedium(
          context,
          fontWeight: FontWeight.w600,
          color: contentColor ?? BsColorTheme.neutral.shade50,
        );
        break;
    }

    return textStyle;
  }

  Color _setBackgroundColor(ButtonState buttonState) {
    Color backgroundColor =
        this.backgroundColor ?? BsColorTheme.primary.shade500;
    switch (buttonState) {
      case ButtonState.disable:
        backgroundColor = BsColorTheme.neutral.shade200;
        break;
      default:
        backgroundColor = backgroundColor;
        break;
    }

    return backgroundColor;
  }

  Color _setContentColor(ButtonState buttonState) {
    Color contentColor = this.contentColor ?? BsColorTheme.neutral.shade50;
    switch (buttonState) {
      case ButtonState.disable:
        contentColor = BsColorTheme.neutral.shade400;
        break;
      default:
        contentColor = contentColor;
        break;
    }

    return contentColor;
  }

  Color _setBorderColor(ButtonState buttonState) {
    if (borderColor != null) {
      Color borderColor = this.borderColor ?? Colors.transparent;
      switch (buttonState) {
        case ButtonState.disable:
          borderColor = BsColorTheme.neutral.shade400;
          break;
        default:
          borderColor = borderColor;
          break;
      }

      return borderColor;
    }

    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      constraints: BoxConstraints(
        minHeight: _setMinHeight(buttonSize ?? ButtonSize.large),
      ),
      child: IgnorePointer(
        ignoring: buttonState == ButtonState.disable ? true : false,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            backgroundColor: _setBackgroundColor(
              buttonState ?? ButtonState.normal,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                _setBorderRadius(buttonSize ?? ButtonSize.large),
              ),
              side: BorderSide(
                color: _setBorderColor(buttonState ?? ButtonState.normal),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: contentAlignment ?? MainAxisAlignment.center,
            children: [
              if (prefixIcon != null) ...[
                HeroIcon(
                  prefixIcon ?? HeroIcons.arrowLeftCircle,
                  size: _setIconSize(buttonSize ?? ButtonSize.large),
                  color: _setContentColor(buttonState ?? ButtonState.normal),
                ),
                const SizedBox(width: 16),
              ],
              Text(
                title,
                style: _setTextStyle(context, buttonSize ?? ButtonSize.large,
                    contentColor: _setContentColor(
                      buttonState ?? ButtonState.normal,
                    )),
              ),
              if (suffixIcon != null) ...[
                const SizedBox(width: 16),
                HeroIcon(
                  suffixIcon ?? HeroIcons.arrowRightCircle,
                  size: _setIconSize(buttonSize ?? ButtonSize.large),
                  color: _setContentColor(buttonState ?? ButtonState.normal),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
