import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:aes_barcode_scanner/src/core/const/constants.dart';

class BsImageWidget extends StatefulWidget {
  final String? localImagePath;
  final String? imageUrl;
  final String? imageBase64;
  final Size imageSize;
  final BoxShape? imageBoxShape;
  final BoxFit? imageBoxFit;
  final double imageBorderWidth;
  final Color? imageBorderColor;
  final Color? imageBackgroundColor;
  final BorderRadiusGeometry? imageBorderRadius;
  final Widget? onErrorChild;

  const BsImageWidget({
    super.key,
    required this.imageSize,
    this.imageUrl,
    this.imageBorderWidth = 1.0,
    this.onErrorChild,
    this.imageBorderColor,
    this.imageBorderRadius,
    this.imageBoxShape,
    this.imageBoxFit,
    this.imageBase64,
    this.imageBackgroundColor,
    this.localImagePath,
  });

  @override
  State<BsImageWidget> createState() => _NetworkBsImageWidgetState();
}

class _NetworkBsImageWidgetState extends State<BsImageWidget> {
  bool isNetworkImageError = false;

  @override
  Widget build(BuildContext context) {
    if (widget.imageBase64 != null && !isNetworkImageError) {
      return Container(
        width: widget.imageSize.width,
        height: widget.imageSize.height,
        decoration: BoxDecoration(
          color: widget.imageBackgroundColor ?? Colors.transparent,
          shape: widget.imageBoxShape ?? BoxShape.rectangle,
          border: Border.all(
            color: widget.imageBorderColor ?? Colors.transparent,
            width: widget.imageBorderWidth,
          ),
          borderRadius: widget.imageBorderRadius,
          image: DecorationImage(
            fit: widget.imageBoxFit ?? BoxFit.scaleDown,
            image: MemoryImage(base64Decode(widget.imageBase64 ?? '')),
            onError: (exception, stackTrace) {
              setState(() {
                isNetworkImageError = true;
              });
            },
          ),
        ),
      );
    }

    if (widget.imageUrl != null && !isNetworkImageError) {
      return Container(
        width: widget.imageSize.width,
        height: widget.imageSize.height,
        decoration: BoxDecoration(
          color: widget.imageBackgroundColor ?? Colors.transparent,
          shape: widget.imageBoxShape ?? BoxShape.rectangle,
          border: Border.all(
            color: widget.imageBorderColor ?? Colors.transparent,
            width: widget.imageBorderWidth,
          ),
          borderRadius: widget.imageBorderRadius,
          image: DecorationImage(
            fit: widget.imageBoxFit ?? BoxFit.scaleDown,
            image: NetworkImage(widget.imageUrl ?? ''),
            onError: (exception, stackTrace) {
              setState(() {
                isNetworkImageError = true;
              });
            },
          ),
        ),
      );
    }

    return (widget.onErrorChild ??
        Container(
          width: widget.imageSize.width,
          height: widget.imageSize.height,
          decoration: BoxDecoration(
            color: widget.imageBackgroundColor ?? Colors.transparent,
            shape: widget.imageBoxShape ?? BoxShape.rectangle,
            border: Border.all(
              color: widget.imageBorderColor ?? Colors.transparent,
              width: widget.imageBorderWidth,
            ),
            borderRadius: widget.imageBorderRadius,
            image: DecorationImage(
              fit: widget.imageBoxFit ?? BoxFit.scaleDown,
              image: AssetImage(widget.localImagePath ?? AssetImages.logoBone),
            ),
          ),
        ));
  }
}
