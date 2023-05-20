import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/app/models/pokemon_model.dart';
import 'package:pokedex/app/services/pokemon/pokemon_service.dart';

part 'pokemon_details_state.dart';

class PokemonDetailsController extends Cubit<PokemonDetailsState> {
  final PokemonService _pokemonService;

  PokemonDetailsController(
    this._pokemonService,
  ) : super(const PokemonDetailsState.initial());

  Future<void> loadPokemon(int id) async {
    emit(state.copyWith(status: PokemonDetailsStatus.loading));
    try {
      final pokemon = await _pokemonService.getPokemon(id);
      emit(
        state.copyWith(
          status: PokemonDetailsStatus.complete,
          pokemon: pokemon,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: PokemonDetailsStatus.failure));
    }
  }
}
