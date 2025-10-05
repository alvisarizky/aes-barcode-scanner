import 'package:aes_barcode_scanner/src/config/themes/typography.theme.dart';
import 'package:aes_barcode_scanner/src/core/const/constants.dart';
import 'package:aes_barcode_scanner/src/core/utils/screen_size.util.dart';
import 'package:aes_barcode_scanner/src/core/widgets/image.widget.dart';
import 'package:aes_barcode_scanner/src/core/widgets/list_view.widget.dart';
import 'package:aes_barcode_scanner/src/features/scanner/presentation/pages/scanner.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';
import 'package:aes_barcode_scanner/src/config/themes/color.theme.dart';
import 'package:aes_barcode_scanner/src/core/widgets/app_header.widget.dart';
import 'package:aes_barcode_scanner/src/core/widgets/scaffold.widget.dart';

class HomePage extends ConsumerStatefulWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BsScaffoldWidget(
      onRefresh: () async {},
      appBar: BsAppHeaderWidget(
        isHomePage: true,
        title: 'Barcode Scanner',
      ).show(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, ScannerPage.routeName),
        backgroundColor: BsColorTheme.primary,
        child: HeroIcon(
          HeroIcons.qrCode,
          color: BsColorTheme.neutral.shade50,
          size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: BsImageWidget(
              imageSize: Size(
                ScreenSizeUtil.screenWidth(context),
                ScreenSizeUtil.screenHeight(context),
              ),
              localImagePath: AssetImages.backgroundImage,
              imageBoxFit: BoxFit.cover,
            ),
          ),
          Container(
            width: ScreenSizeUtil.screenWidth(context),
            height: ScreenSizeUtil.screenHeight(context),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  BsColorTheme.neutral.shade50,
                  BsColorTheme.neutral.shade50.withValues(alpha: .75),
                  BsColorTheme.neutral.shade50.withValues(alpha: .15),
                ],
              ),
            ),
          ),
          BsListViewWidget(
            isScrollable: true,
            itemBuilder: (index) => AutofillGroup(
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  BsImageWidget(
                    imageSize: Size(
                      ScreenSizeUtil.pageWidth(context) * .5,
                      ScreenSizeUtil.pageWidth(context) * .5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      spacing: 8,
                      children: [
                        Text(
                          'Barcode Scanner Bureang',
                          style: BsTypographyTheme.heading6(context),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Validasi keaslian tanda tangan digital pada dokumen Anda dengan cepat dan aman.',
                          style: BsTypographyTheme.bodyMedium(
                            context,
                            color: BsColorTheme.neutral.shade600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            itemLength: 1,
          ),
        ],
      ),
    );
  }
}
