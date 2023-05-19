import 'package:pokedex/app/models/pokemon_basic_model.dart';
import 'package:pokedex/app/models/pokemon_model.dart';

abstract class PokemonService {
  Future<List<PokemonBasicModel>> getPokemons({required int offset});
  Future<PokemonModel> getPokemon(int id);
}
