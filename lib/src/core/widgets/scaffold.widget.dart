import 'package:flutter/material.dart';
import 'package:aes_barcode_scanner/src/config/themes/color.theme.dart';
import 'package:aes_barcode_scanner/src/config/themes/typography.theme.dart';
import 'package:aes_barcode_scanner/src/core/widgets/refresh_indicator.widget.dart';

class BsScaffoldWidget extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final bool? isResizeChild;
  final Widget? child;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final Future<void> Function()? onRefresh;

  const BsScaffoldWidget({
    super.key,
    this.appBar,
    this.child,
    this.isResizeChild,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.backgroundColor,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? BsColorTheme.neutral.shade50,
      appBar: appBar,
      body: onRefresh != null
          ? BsRefreshIndicatorWidget(
              onRefresh: onRefresh ?? () async {},
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              child: child ??
                  Center(
                    child: Text(
                      'Welcome Guest',
                      style: BsTypographyTheme.bodyMedium(context),
                    ),
                  ),
            )
          : child ??
              Center(
                child: Text(
                  'Welcome Guest',
                  style: BsTypographyTheme.bodyMedium(context),
                ),
              ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      resizeToAvoidBottomInset: isResizeChild ?? false,
    );
  }
}
