import 'package:pokedex/app/core/helpers/constants.dart';
import 'package:pokedex/app/models/pokemon_basic_model.dart';
import 'package:pokedex/app/models/pokemon_model.dart';
import 'package:pokedex/app/repositories/pokemon/pokemon_repository.dart';

import '../../core/helpers/environments.dart';
import '../../core/helpers/string_utils.dart';
import 'pokemon_service.dart';

class PokemonServiceImpl implements PokemonService {
  final PokemonRepository _repository;

  PokemonServiceImpl(this._repository);

  @override
  Future<List<PokemonBasicModel>> getPokemons({required int offset}) async {
    final spritesUrl = Environments.param(Constants.envSpritesUrlKey) ?? '';
    final pokemonBasicList = <PokemonBasicModel>[];

    final response = await _repository.getPokemons(
      limit: Constants.appPaginationLimit,
      offset: offset,
    );

    final pokemons = response.results;

    for (final pokemon in pokemons) {
      final id = _getIdFromUrl(pokemon.url);
      pokemonBasicList.add(
        PokemonBasicModel(
          id: _getIdFromUrl(pokemon.url),
          name: StringUtils.capitalizeFirstLetter(pokemon.name),
          sprite: '$spritesUrl/$id.png',
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

  int _getIdFromUrl(String url) {
    final urlLastSlashRemoved = url.substring(0, url.length - 1);
    final idString = urlLastSlashRemoved.split("/").last;
    return int.parse(idString);
  }
}
