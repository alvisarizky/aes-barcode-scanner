import 'package:aes_barcode_scanner/src/features/home/presentation/pages/home.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aes_barcode_scanner/src/config/themes/color.theme.dart';
import 'package:aes_barcode_scanner/src/config/themes/typography.theme.dart';
import 'package:aes_barcode_scanner/src/core/helpers/validate_qr_code_data.helper.dart';
import 'package:aes_barcode_scanner/src/core/utils/date_time.util.dart';
import 'package:aes_barcode_scanner/src/core/widgets/app_header.widget.dart';
import 'package:aes_barcode_scanner/src/core/widgets/app_modal.widget.dart';
import 'package:aes_barcode_scanner/src/core/widgets/badge.widget.dart';
import 'package:aes_barcode_scanner/src/core/widgets/button.widget.dart';
import 'package:aes_barcode_scanner/src/core/widgets/list_view.widget.dart';
import 'package:aes_barcode_scanner/src/core/widgets/scaffold.widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ScannerResultPage extends ConsumerStatefulWidget {
  static const routeName = '/scanner-result';
  final String? barcodeData;

  const ScannerResultPage({super.key, this.barcodeData});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ScannerResultPageState();
}

class _ScannerResultPageState extends ConsumerState<ScannerResultPage> {
  bool isValid = true;

  @override
  void initState() {
    _validateBarcodeData();
    super.initState();
  }

  Future<void> _validateBarcodeData() async {
    if (ValidateQrCodeDataHelper.extractQrCodeId(widget.barcodeData) == null ||
        ValidateQrCodeDataHelper.extractQrCodeId(widget.barcodeData) == '') {
      setState(() => isValid = !isValid);
      Future.delayed(
        const Duration(seconds: 2),
        () => AppModalWidget.showModal(
          context,
          title: 'QR Code Alert',
          contents: [
            const Text('Format QR Code Tidak Valid'),
            const SizedBox(height: 24),
            BsButtonWidget(
              title: 'Kembali',
              buttonSize: ButtonSize.medium,
              backgroundColor: BsColorTheme.error.shade700,
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context,
                HomePage.routeName,
                (route) => false,
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomePage.routeName,
            (route) => false,
          );
          // return;
        }
      },
      child: BsScaffoldWidget(
        appBar: BsAppHeaderWidget(
          title: 'Qr Code Surat Cuti',
          prefixIconAction: () => Navigator.pushNamedAndRemoveUntil(
            context,
            HomePage.routeName,
            (route) => false,
          ),
        ).show(context),
        child: BsListViewWidget(
          isScrollable: true,
          itemBuilder: (index) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: BsColorTheme.neutral.shade100,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        spreadRadius: 2,
                        offset: const Offset(2, 4),
                        color: BsColorTheme.neutral.shade400.withValues(
                          alpha: .1,
                        ),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Detail Cuti',
                              style: BsTypographyTheme.bodyMedium(
                                context,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          BsBadgeWidget.show(
                            context,
                            label: isValid ? 'Valid' : 'Tidak Valid',
                            badgeType: isValid
                                ? BadgeType.success
                                : BadgeType.danger,
                            badgeStyle: BadgeStyle.outline,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'NRPP : -',
                        style: BsTypographyTheme.bodySmall(
                          context,
                          color: BsColorTheme.neutral.shade600,
                        ),
                      ),
                      Text(
                        'Nama : -',
                        style: BsTypographyTheme.bodySmall(
                          context,
                          color: BsColorTheme.neutral.shade600,
                        ),
                      ),
                      Text(
                        'Jabatan : -',
                        style: BsTypographyTheme.bodySmall(
                          context,
                          color: BsColorTheme.neutral.shade600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Nomor Surat : -',
                        style: BsTypographyTheme.bodySmall(
                          context,
                          color: BsColorTheme.neutral.shade600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Tanggal Permohonan : ${DateTimeUtil.convertDate()}',
                        style: BsTypographyTheme.bodySmall(
                          context,
                          color: BsColorTheme.neutral.shade600,
                        ),
                      ),
                      Text(
                        'Tanggal Persetujuan : ${DateTimeUtil.convertDate()}',
                        style: BsTypographyTheme.bodySmall(
                          context,
                          color: BsColorTheme.neutral.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          itemLength: 1,
        ),
      ),
    );
  }
}
