import 'package:flutter/material.dart';
import 'package:pokedex/app/core/ui/extensions/screen_size_extension.dart';
import 'package:pokedex/app/modules/pokemon/details/widgets/custom_app_bar.dart';
import 'package:pokedex/app/modules/pokemon/details/widgets/pokemon_about_widget.dart';
import 'package:pokedex/app/modules/pokemon/details/widgets/pokemon_base_stats_widget.dart';
import 'package:pokedex/app/modules/pokemon/details/widgets/pokemon_types_widget.dart';

import '../../../../models/pokemon_model.dart';

class PokemonDetailsForeground extends StatelessWidget {
  final PokemonModel pokemon;
  final void Function() onPreviousPressed;
  final void Function() onNextPressed;
  final numberOfPokemons = 1010;

  const PokemonDetailsForeground({
    super.key,
    required this.pokemon,
    required this.onPreviousPressed,
    required this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: pokemon.name, id: pokemon.id),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: pokemon.id != 1,
              child: IconButton(
                onPressed: onPreviousPressed,
                icon: const Icon(
                  Icons.keyboard_arrow_left_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            Image.network(
              pokemon.sprite,
              height: 200.h,
              width: 200.w,
            ),
            Visibility(
              visible: pokemon.id != numberOfPokemons,
              child: IconButton(
                onPressed: onNextPressed,
                icon: const Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        PokemonTypesWidget(types: pokemon.types),
        SizedBox(height: 20.h),
        PokemonAboutWidget(pokemon: pokemon),
        SizedBox(height: 20.h),
        PokemonBaseStatsWidget(pokemon: pokemon),
      ],
    );
  }
}
