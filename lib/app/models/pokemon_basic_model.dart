import 'dart:convert';

class PokemonBasicModel {
  final String name;
  final String url;

  PokemonBasicModel({
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory PokemonBasicModel.fromMap(Map<String, dynamic> map) {
    return PokemonBasicModel(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonBasicModel.fromJson(String source) =>
      PokemonBasicModel.fromMap(json.decode(source));
}
