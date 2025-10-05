import 'package:aes_barcode_scanner/src/features/home/presentation/pages/home.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aes_barcode_scanner/src/config/routes/route.dart';
import 'package:aes_barcode_scanner/src/config/themes/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

// MAIN APP
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MSDM Bank Sultra',
      theme: BsTheme.lightTheme(),
      darkTheme: BsTheme.darkTheme(),
      themeMode: ThemeMode.light,
      initialRoute: HomePage.routeName,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
    );
  }
}
