import 'dart:convert';

class GetPokemonResponseModel {
  final int height;
  final int weight;
  final List<Abilities> abilities;
  final List<Types> types;
  final List<Stats> stats;

  GetPokemonResponseModel({
    required this.height,
    required this.weight,
    required this.abilities,
    required this.types,
    required this.stats,
  });

  Map<String, dynamic> toMap() {
    return {
      'height': height,
      'weight': weight,
      'abilities': abilities.map((x) => x.toMap()).toList(),
      'types': types.map((x) => x.toMap()).toList(),
      'stats': stats.map((x) => x.toMap()).toList(),
    };
  }

  factory GetPokemonResponseModel.fromMap(Map<String, dynamic> map) {
    return GetPokemonResponseModel(
      height: map['height']?.toInt() ?? 0,
      weight: map['weight']?.toInt() ?? 0,
      abilities: List<Abilities>.from(
          map['abilities']?.map((x) => Abilities.fromMap(x))),
      types: List<Types>.from(map['types']?.map((x) => Types.fromMap(x))),
      stats: List<Stats>.from(map['stats']?.map((x) => Stats.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory GetPokemonResponseModel.fromJson(String source) =>
      GetPokemonResponseModel.fromMap(json.decode(source));
}

class Abilities {
  final Ability ability;
  final bool isHidden;
  final int slot;

  Abilities({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  Map<String, dynamic> toMap() {
    return {
      'ability': ability.toMap(),
      'isHidden': isHidden,
      'slot': slot,
    };
  }

  factory Abilities.fromMap(Map<String, dynamic> map) {
    return Abilities(
      ability: Ability.fromMap(map['ability']),
      isHidden: map['isHidden'] ?? false,
      slot: map['slot']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Abilities.fromJson(String source) =>
      Abilities.fromMap(json.decode(source));
}

class Ability {
  final String name;

  Ability({
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory Ability.fromMap(Map<String, dynamic> map) {
    return Ability(
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Ability.fromJson(String source) =>
      Ability.fromMap(json.decode(source));
}

class Stats {
  final int baseStat;
  final int effort;
  final Ability stat;

  Stats({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  Map<String, dynamic> toMap() {
    return {
      'baseStat': baseStat,
      'effort': effort,
      'stat': stat.toMap(),
    };
  }

  factory Stats.fromMap(Map<String, dynamic> map) {
    return Stats(
      baseStat: map['baseStat']?.toInt() ?? 0,
      effort: map['effort']?.toInt() ?? 0,
      stat: Ability.fromMap(map['stat']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Stats.fromJson(String source) => Stats.fromMap(json.decode(source));
}

class Types {
  final int slot;
  final Ability type;

  Types({
    required this.slot,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'slot': slot,
      'type': type.toMap(),
    };
  }

  factory Types.fromMap(Map<String, dynamic> map) {
    return Types(
      slot: map['slot']?.toInt() ?? 0,
      type: Ability.fromMap(map['type']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Types.fromJson(String source) => Types.fromMap(json.decode(source));
}
