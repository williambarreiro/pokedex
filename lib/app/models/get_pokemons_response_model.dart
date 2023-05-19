import 'dart:convert';

import 'package:pokedex/app/models/pokemon_basic_model.dart';

class GetPokemonsResponseModel {
  final int count;
  final String? next;
  final String? previous;
  final List<PokemonBasicModel> results;

  GetPokemonsResponseModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory GetPokemonsResponseModel.fromMap(Map<String, dynamic> map) {
    return GetPokemonsResponseModel(
      count: map['count']?.toInt() ?? 0,
      next: map['next'],
      previous: map['previous'],
      results: List<PokemonBasicModel>.from(
          map['results']?.map((x) => PokemonBasicModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory GetPokemonsResponseModel.fromJson(String source) =>
      GetPokemonsResponseModel.fromMap(json.decode(source));
}
