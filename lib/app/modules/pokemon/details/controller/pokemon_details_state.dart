part of 'pokemon_details_controller.dart';

enum PokemonDetailsStatus {
  initial,
  loading,
  complete,
  failure;
}

class PokemonDetailsState extends Equatable {
  final PokemonModel? pokemon;
  final PokemonDetailsStatus status;

  const PokemonDetailsState._({
    this.pokemon,
    required this.status,
  });

  const PokemonDetailsState.initial()
      : this._(status: PokemonDetailsStatus.initial);

  @override
  List<Object?> get props => [pokemon, status];

  PokemonDetailsState copyWith({
    PokemonModel? pokemon,
    PokemonDetailsStatus? status,
  }) {
    return PokemonDetailsState._(
      pokemon: pokemon ?? this.pokemon,
      status: status ?? this.status,
    );
  }
}
