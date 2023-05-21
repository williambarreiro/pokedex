import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/modules/pokemon/list/controller/pokemon_list_controller.dart';

import '../../mocks/pokemon_service_spy.dart';

void main() {
  late PokemonListController sut;
  late PokemonServiceSpy service;

  setUp(() {
    service = PokemonServiceSpy();
    sut = PokemonListController(service);
  });

  blocTest<PokemonListController, PokemonListState>(
    'Should emit complete state if the service returns a list of pokemons',
    build: () => sut,
    act: (cubit) => cubit.loadPokemons(),
    setUp: () => service.mockGetPokemons(),
    expect: () => [
      isA<PokemonListState>()
          .having((e) => e.status, 'status', PokemonListStatus.loading),
      isA<PokemonListState>()
          .having((e) => e.status, 'status', PokemonListStatus.complete),
    ],
  );

  blocTest<PokemonListController, PokemonListState>(
    'Should emit failure state if the service throws an exception',
    build: () => sut,
    act: (cubit) => cubit.loadPokemons(),
    setUp: () => service.mockGetPokemonsError(),
    expect: () => [
      isA<PokemonListState>()
          .having((e) => e.status, 'status', PokemonListStatus.loading),
      isA<PokemonListState>()
          .having((e) => e.status, 'status', PokemonListStatus.failure),
    ],
  );
}
