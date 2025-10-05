import 'package:flutter/material.dart';
import 'package:aes_barcode_scanner/src/config/themes/color.theme.dart';

class BsLoadingWidget extends ModalRoute {
  @override
  Color? get barrierColor => BsColorTheme.neutral.shade50.withValues(alpha: .75);

  @override
  bool get barrierDismissible => false;

  @override
  String? get barrierLabel => '';

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22.0),
      child: Center(
        child: CircularProgressIndicator(
          color: BsColorTheme.primary.shade700,
        ),
      ),
    );
  }

  @override
  bool get maintainState => true;

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);
}
