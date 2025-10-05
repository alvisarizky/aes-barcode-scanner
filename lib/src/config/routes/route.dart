import 'package:aes_barcode_scanner/src/features/home/presentation/pages/home.page.dart';
import 'package:aes_barcode_scanner/src/features/scanner/presentation/pages/scanner.page.dart';
import 'package:aes_barcode_scanner/src/features/scanner/presentation/pages/scanner_result.page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return _materialRoute(const HomePage());
      case ScannerPage.routeName:
        return _materialRoute(const ScannerPage());
      case ScannerResultPage.routeName:
        final data = settings.arguments as String;
        return _materialRoute(ScannerResultPage(barcodeData: data));
      default:
        return _materialRoute(const HomePage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
