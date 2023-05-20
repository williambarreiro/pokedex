import 'package:flutter/material.dart';
import 'package:pokedex/app/core/ui/extensions/screen_size_extension.dart';
import 'package:pokedex/app/modules/pokemon/details/widgets/custom_app_bar.dart';
import 'package:pokedex/app/modules/pokemon/details/widgets/pokemon_types_widget.dart';

import '../../../../models/pokemon_model.dart';

class PokemonDetailsForeground extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonDetailsForeground({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: pokemon.name, id: pokemon.id),
        Image.network(
          pokemon.sprite,
          height: 200.h,
          width: 200.w,
        ),
        PokemonTypesWidget(types: pokemon.types),
      ],
    );
  }
}
