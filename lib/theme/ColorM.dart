import 'package:flutter/material.dart';

class ColorM {
  static Color primary = const Color(0xff324D84);
  static Color textColor = const Color(0xff707070);
  static _MedicinetsPaleta colorMed = _MedicinetsPaleta(
    0xffED6D7E,
    primary: const Color(0xffED6D7E),
    secondary: const Color(0xff324D84),
  );
}

class ColorsM {
  static const MaterialColor primary = MaterialColor(
    _redPrimaryValue,
    <int, Color>{
      50: Color(0xFFFA7385),
      100: Color(0xFFD46171),
      200: Color(0xFFEF9A9A),
      300: Color(0xFFE57373),
      400: Color(0xFFEF5350),
      500: Color(_redPrimaryValue),
      600: Color(0xffAD505C),
      700: Color(0xFFD32F2F),
      800: Color(0xFFC62828),
      900: Color(0xFF6E323A),
    },
  );
  static const int _redPrimaryValue = 0xFFED6D7E;

  static const MaterialColor secondary = MaterialColor(
    _blueSecondaryValue,
    <int, Color>{
      50: Color(0xFF17969C),
      100: Color(0xFF197BA6),
      200: Color(0xFF1931A6),
      300: Color(0xFF1931A6),
      400: Color(0xFF24179C),
      500: Color(_blueSecondaryValue),
      600: Color(0xFF24179C),
      700: Color(0xFF24179C),
      800: Color(0xFF1931A6),
      900: Color(0xFF24179C),
    },
  );
  static const int _blueSecondaryValue = 0xFF1D4F90;

  static const MaterialColor textColor = MaterialColor(
    _textColor,
    <int, Color>{
      50: Color(0xFF7D7470),
      100: Color(0xFF877C7A),
      200: Color(0xFF877A80),
      300: Color(0xFF7D707D),
      400: Color(0xFF24179C),
      500: Color(_textColor),
      600: Color(0xFF24179C),
      700: Color(0xFF24179C),
      800: Color(0xFF1931A6),
      900: Color(0xFF24179C),
    },
  );
  static const int _textColor = 0xFF707070;
}

class _MedicinetsPaleta extends Color {
  _MedicinetsPaleta(
    int value, {
    required this.primary,
    required this.secondary,
  }) : super(value);

  Color primary;
  Color secondary;
}
