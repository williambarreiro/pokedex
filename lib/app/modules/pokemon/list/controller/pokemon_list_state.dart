part of 'pokemon_list_controller.dart';

enum PokemonListStatus {
  initial,
  loading,
  complete,
  failure;
}

class PokemonListState extends Equatable {
  final List<PokemonBasicModel> pokemons;
  final PokemonListStatus status;

  const PokemonListState._({
    required this.pokemons,
    required this.status,
  });

  PokemonListState.initial()
      : this._(
          pokemons: [],
          status: PokemonListStatus.initial,
        );

  @override
  List<Object> get props => [pokemons, status];

  PokemonListState copyWith({
    List<PokemonBasicModel>? pokemons,
    PokemonListStatus? status,
  }) {
    return PokemonListState._(
      pokemons: pokemons ?? this.pokemons,
      status: status ?? this.status,
    );
  }
}
