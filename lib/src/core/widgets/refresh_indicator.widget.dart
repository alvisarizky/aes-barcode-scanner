import 'package:flutter/material.dart';
import 'package:aes_barcode_scanner/src/config/themes/color.theme.dart';
import 'package:aes_barcode_scanner/src/core/widgets/scaffold.widget.dart';

class BsRefreshIndicatorWidget extends StatelessWidget {
  final Widget? child;
  final Future<void> Function()? onRefresh;
  final RefreshIndicatorTriggerMode? triggerMode;

  const BsRefreshIndicatorWidget({
    super.key,
    this.child,
    this.onRefresh,
    this.triggerMode,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: BsColorTheme.primary,
      triggerMode: triggerMode ?? RefreshIndicatorTriggerMode.onEdge,
      onRefresh: onRefresh ?? () async {},
      child: child ?? const BsScaffoldWidget(),
    );
  }
}
