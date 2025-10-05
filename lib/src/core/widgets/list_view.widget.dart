import 'package:flutter/material.dart';

class BsListViewWidget extends StatelessWidget {
  final Widget Function(int index) itemBuilder;
  final double verticalSpacing;
  final double horizontalSpacing;
  final int itemLength;
  final bool isScrollable;
  final bool isVertical;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;

  const BsListViewWidget({
    super.key,
    required this.itemBuilder,
    this.verticalSpacing = 8,
    this.horizontalSpacing = 8,
    required this.itemLength,
    this.isScrollable = false,
    this.isVertical = true,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      scrollDirection: isVertical ? Axis.vertical : Axis.horizontal,
      physics: isScrollable
          ? const AlwaysScrollableScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      child: isVertical
          ? Column(
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
              crossAxisAlignment:
                  crossAxisAlignment ?? CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: List.generate(itemLength, itemBuilder))
          : Row(
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
              crossAxisAlignment:
                  crossAxisAlignment ?? CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: List.generate(itemLength, itemBuilder)),
    );
  }
}
