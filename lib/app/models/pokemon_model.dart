class PokemonModel {
  final int id;
  final double height;
  final double weight;
  final List<String> abilities;
  final List<String> types;
  final Map<String, int> stats;

  PokemonModel({
    required this.id,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.types,
    required this.stats,
  });
}
