import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/app/core/ui/pokedex_colors.dart';
import 'package:pokedex/app/core/ui/screen_size_extension.dart';
import 'package:pokedex/app/modules/pokemon/list/controller/pokemon_list_controller.dart';

import 'widgets/pokemon_card.dart';

class PokemonListPage extends StatelessWidget {
  final PokemonListController controller;

  const PokemonListPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PokedexColors.pokedexRed,
      appBar: AppBar(
        title: const Text('Pokédex'),
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Image.asset(
            'assets/images/pokeball.png',
            fit: BoxFit.contain,
          ),
        ),
        backgroundColor: PokedexColors.pokedexRed,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: BlocBuilder<PokemonListController, PokemonListState>(
          bloc: controller,
          builder: (context, state) {
            if (state.status == PokemonListStatus.complete) {
              return GridView.count(
                crossAxisCount: 3,
                children: List.generate(state.pokemons.length, (index) {
                  final pokemon = state.pokemons[index];
                  return PokemonCard(pokemon: pokemon);
                }),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
