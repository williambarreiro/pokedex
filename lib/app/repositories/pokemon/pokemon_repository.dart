import 'package:pokedex/app/models/get_pokemons_response_model.dart';

import '../../models/get_pokemon_response_model.dart';

abstract class PokemonRepository {
  Future<GetPokemonsResponseModel> getPokemons({
    required int limit,
    required int offset,
  });
  Future<GetPokemonResponseModel> getPokemon(int id);
  Future<String> getPokemonSprite(int id);
}
