import 'package:flutter/material.dart';

class BsColorTheme {
  static const int _primaryColorValue = 0xff1366ff;
  static const MaterialColor primary = MaterialColor(
    _primaryColorValue,
    <int, Color>{
      // 50: Color(0xffe4f6ff),
      50: Color(0xffF2FAFA),
      100: Color(0xffcfedff),
      200: Color(0xffa8dbff),
      300: Color(0xff74c1ff),
      // 300: Color(0xff65D6FF),
      400: Color(0xff3e94ff),
      500: Color(_primaryColorValue),
      600: Color(0xff0053ff),
      700: Color(0xff0053ff),
      800: Color(0xff004be4),
      900: Color(0xff0034b0),
      950: Color(0xff001244),
    },
  );

  static const int _neutralColorValue = 0xff7c7c7c;
  static const MaterialColor neutral = MaterialColor(
    _neutralColorValue,
    <int, Color>{
      50: Color(0xfffbfbfb),
      100: Color(0xffefefef),
      200: Color(0xffdcdcdc),
      300: Color(0xffbdbdbd),
      400: Color(0xff989898),
      500: Color(_neutralColorValue),
      600: Color(0xff656565),
      700: Color(0xff525252),
      800: Color(0xff464646),
      900: Color(0xff3d3d3d),
      950: Color(0xff292929),
    },
  );

  static const int _informationColorValue = 0xff2869ff;
  static const MaterialColor information = MaterialColor(
    _informationColorValue,
    <int, Color>{
      50: Color(0xffe7f5ff),
      100: Color(0xffd3ecff),
      200: Color(0xffb0daff),
      300: Color(0xff81bfff),
      400: Color(0xff4f94ff),
      500: Color(_informationColorValue),
      600: Color(0xff043aff),
      700: Color(0xff0038ff),
      800: Color(0xff002ed3),
      900: Color(0xff0b2f9f),
      950: Color(0xff071b5f),
    },
  );

  static const int _warningColorValue = 0xffe4b70e;
  static const MaterialColor warning = MaterialColor(
    _warningColorValue,
    <int, Color>{
      50: Color(0xfffdfde9),
      100: Color(0xfffdfac4),
      200: Color(0xfffbf18d),
      300: Color(0xfff8e24c),
      400: Color(0xfff4ce14),
      500: Color(_warningColorValue),
      600: Color(0xffc58e09),
      700: Color(0xff9d660b),
      800: Color(0xff825111),
      900: Color(0xff6f4214),
      950: Color(0xff412207),
    },
  );

  static const int _errorColorValue = 0xffff1f45;
  static const MaterialColor error = MaterialColor(
    _errorColorValue,
    <int, Color>{
      50: Color(0xffffeff2),
      100: Color(0xffffdce2),
      200: Color(0xffffbfca),
      300: Color(0xffff92a4),
      400: Color(0xffff5471),
      500: Color(_errorColorValue),
      600: Color(0xffff002b),
      700: Color(0xffdb0025),
      800: Color(0xffb8001f),
      900: Color(0xff940820),
      950: Color(0xff52000e),
    },
  );

  static const int _successColorValue = 0xff4cad3a;
  static const MaterialColor success = MaterialColor(
    _successColorValue,
    <int, Color>{
      50: Color(0xfff4fbf2),
      100: Color(0xffe5f7e1),
      200: Color(0xffcbeec4),
      300: Color(0xffa2df96),
      400: Color(0xff70c860),
      500: Color(0xff4cad3a),
      600: Color(0xff3a8e2b),
      700: Color(0xff347928),
      800: Color(0xff2a5922),
      900: Color(0xff224a1d),
      950: Color(0xff0e280b),
    },
  );
}
