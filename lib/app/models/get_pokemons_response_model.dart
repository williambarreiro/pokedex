import 'dart:convert';

class GetPokemonsResponseModel {
  final int count;
  final String? next;
  final String? previous;
  final List<Result> results;

  GetPokemonsResponseModel({
    required this.count,
    this.next,
    this.previous,
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
      results: List<Result>.from(map['results']?.map((x) => Result.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory GetPokemonsResponseModel.fromJson(String source) =>
      GetPokemonsResponseModel.fromMap(json.decode(source));
}

class Result {
  final String name;
  final String url;

  Result({
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Result.fromJson(String source) => Result.fromMap(json.decode(source));
}
