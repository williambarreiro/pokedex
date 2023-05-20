import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/core/ui/extensions/screen_size_extension.dart';
import 'package:pokedex/app/core/ui/extensions/theme_extension.dart';
import 'package:pokedex/app/modules/pokemon/list/controller/pokemon_list_controller.dart';

import 'widgets/pokemon_card.dart';

class PokemonListPage extends StatefulWidget {
  final PokemonListController controller;

  const PokemonListPage({super.key, required this.controller});

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels != 0) {
        widget.controller.loadPokemons();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      appBar: AppBar(
        title: const Text('Pokédex'),
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Image.asset(
            'assets/images/pokeball.png',
            fit: BoxFit.contain,
          ),
        ),
        backgroundColor: context.primaryColor,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: BlocConsumer<PokemonListController, PokemonListState>(
          bloc: widget.controller,
          listener: (context, state) {
            if (state.status == PokemonListStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Falha ao carregar Pokémons')),
              );
            }
          },
          builder: (context, state) {
            if (state.status == PokemonListStatus.failure &&
                widget.controller.pokemons.isEmpty) {
              return Center(
                child: ElevatedButton(
                  onPressed: () => widget.controller.loadPokemons(),
                  child: const Text('Recarregar'),
                ),
              );
            }

            return Stack(
              children: [
                GridView.count(
                  controller: _scrollController,
                  crossAxisCount: 3,
                  children: List.generate(state.pokemons.length, (index) {
                    final pokemon = state.pokemons[index];
                    return PokemonCard(
                      pokemon: pokemon,
                      onTap: () => Modular.to.pushNamed(
                        '/pokemon/details',
                        arguments: pokemon.id,
                      ),
                    );
                  }),
                ),
                Visibility(
                  visible: state.status == PokemonListStatus.loading,
                  child: _loadingWidget(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _loadingWidget() {
    if (widget.controller.pokemons.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Positioned(
        left: MediaQuery.of(context).size.width / 2 - 20.w,
        bottom: 30.h,
        child: const CircularProgressIndicator(),
      );
    }
  }
}
