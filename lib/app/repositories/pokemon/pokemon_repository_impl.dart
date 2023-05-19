import 'package:pokedex/app/core/rest_client/rest_client.dart';
import 'package:pokedex/app/models/get_pokemons_response_model.dart';
import 'package:pokedex/app/repositories/pokemon/pokemon_repository.dart';

import '../../models/get_pokemon_response_model.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final RestClient _restClient;

  PokemonRepositoryImpl(this._restClient);

  @override
  Future<GetPokemonsResponseModel> getPokemons({
    required int limit,
    required int offset,
  }) async {
    final result = await _restClient.get(
      '/pokemon',
      queryParameters: {'limit': limit, 'offset': offset},
    );
    return GetPokemonsResponseModel.fromMap(result);
  }

  @override
  Future<GetPokemonResponseModel> getPokemon(int id) async {
    final result = await _restClient.get('/pokemon/$id');
    return GetPokemonResponseModel.fromMap(result);
  }

  @override
  Future<String> getPokemonSprite(int id) async {
    final result = await _restClient.get('/pokemon-form/$id');
    return result['sprites']?['front_default'] ?? '';
  }
}
