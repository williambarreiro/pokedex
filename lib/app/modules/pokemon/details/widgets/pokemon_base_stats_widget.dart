import 'package:flutter/material.dart';
import 'package:pokedex/app/core/helpers/string_utils.dart';
import 'package:pokedex/app/core/ui/extensions/screen_size_extension.dart';
import 'package:pokedex/app/models/pokemon_model.dart';

import '../../../../core/ui/pokedex_colors.dart';

class PokemonBaseStatsWidget extends StatelessWidget {
  final PokemonModel pokemon;
  final Color pokemonColor;

  PokemonBaseStatsWidget({
    super.key,
    required this.pokemon,
  }) : pokemonColor = PokedexColors.getColorByPokemonType(pokemon.types.first);

  @override
  Widget build(BuildContext context) {
    final pokemonColor =
        PokedexColors.getColorByPokemonType(pokemon.types.first);

    return Column(
      children: [
        Text(
          'Base Stats',
          style: TextStyle(
            color: pokemonColor,
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 96.h,
          child: Row(
            children: [
              SizedBox(width: 20.w),
              _labels(),
              SizedBox(width: 12.w),
              _divider(),
              SizedBox(width: 12.w),
              _stats(),
              SizedBox(width: 20.w),
            ],
          ),
        ),
      ],
    );
  }

  Widget _labels() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _label('HP'),
        _label('ATK'),
        _label('DEF'),
        _label('SATK'),
        _label('SDEF'),
        _label('SPD'),
      ],
    );
  }

  Text _label(String label) {
    return Text(
      label,
      style: TextStyle(
        color: pokemonColor,
        fontSize: 10.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _stats() {
    final stats = pokemon.stats;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _statsBar(stats['hp'] ?? 0),
        _statsBar(stats['attack'] ?? 0),
        _statsBar(stats['defense'] ?? 0),
        _statsBar(stats['special-attack'] ?? 0),
        _statsBar(stats['special-defense'] ?? 0),
        _statsBar(stats['speed'] ?? 0),
      ],
    );
  }

  Widget _statsBar(int value) {
    const maxValue = 255;
    const barWidth = 233;
    final coloredBarSize = (value / maxValue) * barWidth;

    return Row(
      children: [
        Text(
          StringUtils.padThreeLeft(value),
          style: TextStyle(fontSize: 10.sp),
        ),
        SizedBox(width: 8.w),
        Container(
          color: pokemonColor,
          width: coloredBarSize.w,
          height: 4.h,
        ),
        Container(
          color: PokedexColors.defaultLightGray,
          width: (barWidth - coloredBarSize).w,
          height: 4.h,
        ),
      ],
    );
  }

  Widget _divider() {
    return Container(
      color: PokedexColors.defaultLightGray,
      height: double.infinity,
      width: 1,
    );
  }
}
