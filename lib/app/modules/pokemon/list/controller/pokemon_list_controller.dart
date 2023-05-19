import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/app/services/pokemon/pokemon_service.dart';

import '../../../../models/pokemon_basic_model.dart';

part 'pokemon_list_state.dart';

class PokemonListController extends Cubit<PokemonListState> {
  final PokemonService _pokemonService;
  final _pokemons = <PokemonBasicModel>[];

  PokemonListController(
    this._pokemonService,
  ) : super(PokemonListState.initial());

  Future<void> loadPokemons() async {
    emit(state.copyWith(status: PokemonListStatus.loading));
    try {
      final newPokemons =
          await _pokemonService.getPokemons(offset: _pokemons.length);
      _pokemons.addAll(newPokemons);
      emit(
        state.copyWith(
          status: PokemonListStatus.complete,
          pokemons: _pokemons,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: PokemonListStatus.failure));
    }
  }
}
