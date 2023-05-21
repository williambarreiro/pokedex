import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/modules/pokemon/details/controller/pokemon_details_controller.dart';

import '../../mocks/pokemon_service_spy.dart';

void main() {
  late PokemonDetailsController sut;
  late PokemonServiceSpy service;
  late int id;

  setUp(() {
    service = PokemonServiceSpy();
    sut = PokemonDetailsController(service);
    id = Random().nextInt(1000);
  });

  blocTest<PokemonDetailsController, PokemonDetailsState>(
    'Should emit complete state if the service returns a pokemon',
    build: () => sut,
    act: (cubit) => cubit.loadPokemon(1),
    setUp: () => service.mockGetPokemon(),
    expect: () => [
      isA<PokemonDetailsState>()
          .having((e) => e.status, 'status', PokemonDetailsStatus.loading),
      isA<PokemonDetailsState>()
          .having((e) => e.status, 'status', PokemonDetailsStatus.complete),
    ],
  );

  blocTest<PokemonDetailsController, PokemonDetailsState>(
    'Should emit failure state if the service throws an exception',
    build: () => sut,
    act: (cubit) => cubit.loadPokemon(id),
    setUp: () => service.mockGetPokemonError(),
    expect: () => [
      isA<PokemonDetailsState>()
          .having((e) => e.status, 'status', PokemonDetailsStatus.loading),
      isA<PokemonDetailsState>()
          .having((e) => e.status, 'status', PokemonDetailsStatus.failure),
    ],
  );
}
