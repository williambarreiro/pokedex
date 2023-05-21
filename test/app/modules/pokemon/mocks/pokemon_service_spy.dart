import 'package:mocktail/mocktail.dart';
import 'package:pokedex/app/models/pokemon_model.dart';
import 'package:pokedex/app/services/pokemon/pokemon_service.dart';

class PokemonServiceSpy extends Mock implements PokemonService {
  PokemonServiceSpy();

  mockGetPokemonCall() => when(() => getPokemon(any()));
  mockGetPokemonsCall() => when(
        () => getPokemons(offset: any(named: 'offset')),
      );

  void mockGetPokemon() => mockGetPokemonCall().thenAnswer(
        (_) async => PokemonModel(
          id: 1,
          name: 'any()',
          sprite: 'any()',
          height: 1,
          weight: 1,
          abilities: [],
          types: [],
          stats: {},
        ),
      );

  void mockGetPokemons() => mockGetPokemonsCall().thenAnswer((_) async => []);
  void mockGetPokemonError() => mockGetPokemonCall().thenThrow(Exception());
  void mockGetPokemonsError() => mockGetPokemonsCall().thenThrow(Exception());
}
