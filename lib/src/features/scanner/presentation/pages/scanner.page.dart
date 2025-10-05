import 'dart:io';
import 'dart:ui';

import 'package:aes_barcode_scanner/src/features/home/presentation/pages/home.page.dart';
import 'package:aes_barcode_scanner/src/features/scanner/presentation/pages/scanner_result.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:aes_barcode_scanner/src/config/themes/color.theme.dart';
import 'package:aes_barcode_scanner/src/config/themes/typography.theme.dart';
import 'package:aes_barcode_scanner/src/core/helpers/validate_qr_code_data.helper.dart';
import 'package:aes_barcode_scanner/src/core/utils/image.util.dart';
import 'package:aes_barcode_scanner/src/core/utils/screen_size.util.dart';
import 'package:aes_barcode_scanner/src/core/widgets/app_header.widget.dart';
import 'package:aes_barcode_scanner/src/core/widgets/app_modal.widget.dart';
import 'package:aes_barcode_scanner/src/core/widgets/button.widget.dart';
import 'package:aes_barcode_scanner/src/core/widgets/scaffold.widget.dart';
import 'package:aes_barcode_scanner/src/core/widgets/snackbar_message.widget.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class ScannerPage extends ConsumerStatefulWidget {
  static const routeName = '/scanner';

  const ScannerPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScannerPageState();
}

class _ScannerPageState extends ConsumerState<ScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isFlashOn = false;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      final isValid = ValidateQrCodeDataHelper.validateQrCodeData(
        scanData.code,
      );

      if (isValid != null) {
        controller.pauseCamera();
        AppModalWidget.showModal(
          context,
          title: 'QR Code Alert',
          content: const Text('Format QR Code Tidak Valid'),
          actionsWidgets: [
            BsButtonWidget(
              title: 'Kembali',
              buttonSize: ButtonSize.small,
              backgroundColor: BsColorTheme.error.shade700,
              contentColor: BsColorTheme.neutral.shade50,
              onPressed: () => controller.resumeCamera().whenComplete(
                () => Navigator.pop(context),
              ),
            ),
          ],
        );
      } else {
        controller.pauseCamera();
        Navigator.pushNamed(
          context,
          ScannerResultPage.routeName,
          arguments: scanData.code,
        );
      }
    });
  }

  Future<void> _onPickedBarcode(XFile image) async {
    final data = await MobileScannerController().analyzeImage(image.path);
    final isValid = ValidateQrCodeDataHelper.validateQrCodeData(
      data?.barcodes.first.displayValue,
    );

    if (isValid != null) {
      AppModalWidget.showModal(
        context,
        title: 'QR Code Alert',
        content: Text('Format QR Code Tidak Valid. $isValid'),
        actionsWidgets: [
          BsButtonWidget(
            title: 'Kembali',
            buttonSize: ButtonSize.small,
            backgroundColor: BsColorTheme.error.shade700,
            contentColor: BsColorTheme.neutral.shade50,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );
    } else {
      Navigator.pushNamed(
        context,
        ScannerResultPage.routeName,
        arguments: data?.barcodes.first.displayValue,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BsScaffoldWidget(
      appBar: BsAppHeaderWidget(
        title: 'Scan Qr Code',
        prefixIconAction: () => Navigator.pushNamedAndRemoveUntil(
          context,
          HomePage.routeName,
          (route) => false,
        ),
      ).show(context),
      child: Stack(
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: BsColorTheme.primary,
              borderRadius: 10,
              borderLength: 60,
              borderWidth: 10,
              cutOutSize: ScreenSizeUtil.pageWidth(context, padding: 64),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.1, sigmaY: 0.1),
            child: Container(
              color: BsColorTheme.neutral.shade900.withValues(alpha: 0.15),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 60),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: HeroIcon(
                          isFlashOn ? HeroIcons.boltSlash : HeroIcons.bolt,
                          style: HeroIconStyle.solid,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          await controller?.toggleFlash();
                          setState(() => isFlashOn = !isFlashOn);
                        },
                      ),
                      const SizedBox(width: 24),
                      IconButton(
                        icon: const HeroIcon(
                          HeroIcons.photo,
                          style: HeroIconStyle.solid,
                          color: Colors.white,
                        ),
                        onPressed: () => ImageUtil()
                            .pickImage(ImageSource.gallery)
                            .then((image) async {
                              if (image != null) {
                                await ImageUtil().getLostImage().then(
                                  (lostImage) async => await _onPickedBarcode(
                                    lostImage ?? image,
                                  ),
                                );
                              } else {
                                BsSnackBarMessage().showMessage(
                                  context,
                                  message: 'Gagal mengambil gambar dari galeri',
                                  type: SnackBarMessageType.error,
                                );
                              }
                            }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Letakan code QR tepat di dalam kotak",
                    style: BsTypographyTheme.bodyMedium(
                      context,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
