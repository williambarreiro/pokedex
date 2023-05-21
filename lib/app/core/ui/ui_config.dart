import 'package:flutter/material.dart';
import 'package:pokedex/app/core/ui/pokedex_colors.dart';

class UiConfig {
  UiConfig._();

  static ThemeData get theme => ThemeData(
        fontFamily: 'Poppins',
        primaryColor: PokedexColors.pokedexRed,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: PokedexColors.defaultTextBlack),
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: PokedexColors.pokedexRed,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(PokedexColors.pokedexRed),
          ),
        ),
      );
}
