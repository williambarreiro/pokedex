import 'package:flutter/material.dart';
import 'package:pokedex/app/core/helpers/string_utils.dart';
import 'package:pokedex/app/core/ui/extensions/screen_size_extension.dart';
import 'package:pokedex/app/core/ui/pokedex_colors.dart';
import 'package:pokedex/app/models/pokemon_model.dart';

class PokemonAboutWidget extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonAboutWidget({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'About',
          style: TextStyle(
            color: PokedexColors.getColorByPokemonType(pokemon.types.first),
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildWeightComponent(),
                _divider(),
                _buildHeightComponent(),
                _divider(),
                _buildMovesComponent(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWeightComponent() {
    return Padding(
      padding: EdgeInsets.only(top: 6.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/weight.png',
                height: 14.h,
              ),
              SizedBox(width: 10.w),
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: Text(
                  '${pokemon.weight.toString()} kg',
                  style: TextStyle(fontSize: 10.sp),
                ),
              ),
            ],
          ),
          _labelText('Weight'),
        ],
      ),
    );
  }

  Widget _buildHeightComponent() {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/height.png',
                height: 14.h,
              ),
              SizedBox(width: 10.w),
              Text(
                '${pokemon.height.toString()} m',
                style: TextStyle(fontSize: 10.sp),
              ),
            ],
          ),
          _labelText('Height'),
        ],
      ),
    );
  }

  Widget _buildMovesComponent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: pokemon.abilities
              .map((ability) => Text(
                    StringUtils.capitalizeFirstLetter(ability),
                    style: TextStyle(fontSize: 10.sp),
                  ))
              .toList(),
        ),
        _labelText('Moves'),
      ],
    );
  }

  Text _labelText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: PokedexColors.defaultGray,
        fontSize: 8.sp,
      ),
    );
  }

  Widget _divider() {
    return Container(
      color: PokedexColors.defaultLightGray,
      height: 48.h,
      width: 1,
    );
  }
}
