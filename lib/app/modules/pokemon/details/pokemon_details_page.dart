import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/app/core/ui/extensions/theme_extension.dart';
import 'package:pokedex/app/core/ui/pokedex_colors.dart';
import 'package:pokedex/app/modules/pokemon/details/controller/pokemon_details_controller.dart';
import 'package:pokedex/app/modules/pokemon/details/widgets/pokemon_details_background.dart';
import 'package:pokedex/app/modules/pokemon/details/widgets/pokemon_details_foreground.dart';

class PokemonDetailsPage extends StatelessWidget {
  final PokemonDetailsController controller;

  const PokemonDetailsPage({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PokemonDetailsController, PokemonDetailsState>(
      bloc: controller,
      listener: (context, state) {
        if (state.status == PokemonDetailsStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Falha ao carregar Pokémon')),
          );
        }
      },
      builder: (context, state) {
        if (state.status == PokemonDetailsStatus.complete) {
          return Scaffold(
            body: Stack(
              children: [
                PokemonDetailsBackground(
                  color: PokedexColors.getColorByPokemonType(
                    state.pokemon!.types.first,
                  ),
                ),
                PokemonDetailsForeground(
                  pokemon: state.pokemon!,
                  onPreviousPressed: () =>
                      controller.loadPokemon(state.pokemon!.id - 1),
                  onNextPressed: () =>
                      controller.loadPokemon(state.pokemon!.id + 1),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            appBar: state.status != PokemonDetailsStatus.loading
                ? AppBar(backgroundColor: context.primaryColor)
                : null,
            body: Center(
              child: Visibility(
                visible: state.status == PokemonDetailsStatus.loading,
                child: const CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}
