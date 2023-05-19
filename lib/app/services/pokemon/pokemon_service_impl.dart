import 'package:pokedex/app/core/helpers/constants.dart';
import 'package:pokedex/app/models/pokemon_basic_model.dart';
import 'package:pokedex/app/models/pokemon_model.dart';
import 'package:pokedex/app/repositories/pokemon/pokemon_repository.dart';

import '../../models/get_pokemons_response_model.dart';
import 'pokemon_service.dart';

class PokemonServiceImpl implements PokemonService {
  final PokemonRepository _repository;

  PokemonServiceImpl(this._repository);

  @override
  Future<List<PokemonBasicModel>> getPokemons({required int offset}) async {
    final response = await _repository.getPokemons(
      limit: Constants.appPaginationLimit,
      offset: offset,
    );

    final pokemons = response.results;
    final pokemonBasicList = <PokemonBasicModel>[];
    final sprites = await _getPokemonsSprites(pokemons);

    for (int i = 0; i < pokemons.length; i++) {
      final pokemon = pokemons[i];
      pokemonBasicList.add(
        PokemonBasicModel(
          id: _getIdFromUrl(pokemon.url),
          name: pokemon.name,
          sprite: sprites[i],
        ),
      );
    }
    return pokemonBasicList;
  }

  @override
  Future<PokemonModel> getPokemon(int id) async {
    final response = await _repository.getPokemon(id);

    final abilities = response.abilities.map((e) => e.ability.name).toList();
    final types = response.types.map((e) => e.type.name).toList();
    final stats = {for (final e in response.stats) e.stat.name: e.baseStat};

    return PokemonModel(
      id: id,
      height: response.height / 10,
      weight: response.weight / 10,
      abilities: abilities,
      types: types,
      stats: stats,
    );
  }

  Future<List<String>> _getPokemonsSprites(List<Result> pokemons) async {
    final futureCalls = <Future<String>>[];

    for (final pokemon in pokemons) {
      final id = _getIdFromUrl(pokemon.url);
      /* 
        Rota '/pokemon-form' usada apenas para pegar a sprite.
        Como o conteúdo retornado pela rota '/pokemon' é muito extenso, usá-la
        apenas para pegar a sprite seria muito custoso.
      */
      futureCalls.add(_repository.getPokemonSprite(id));
    }

    return await Future.wait(futureCalls);
  }

  int _getIdFromUrl(String url) {
    final urlLastSlashRemoved = url.substring(0, url.length - 1);
    final idString = urlLastSlashRemoved.split("/").last;
    return int.parse(idString);
  }
}
