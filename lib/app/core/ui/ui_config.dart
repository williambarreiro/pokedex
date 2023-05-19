import 'package:flutter/material.dart';

class UiConfig {
  UiConfig._();

  static ThemeData get theme => ThemeData(
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color(0xFF1D1D1D)),
        ),
      );
}
