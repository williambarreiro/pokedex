import 'package:flutter/material.dart';
import 'package:pokedex/app/core/ui/pokedex_colors.dart';
import 'package:pokedex/app/core/ui/screen_size_extension.dart';

class UiConfig {
  UiConfig._();

  static ThemeData get theme => ThemeData(
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: PokedexColors.defaultTextBlack),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.sp,
          ),
        ),
      );
}
