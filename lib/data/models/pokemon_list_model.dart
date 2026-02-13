
class PokemonList {
  final int count;
  final List<PokemonListItem> results;

  PokemonList({
    required this.count,
    required this.results
  });

  factory PokemonList.fromJson(Map<String, dynamic> json) {
    return PokemonList(
      count: json['count'],
      results: (json['results'] as List<dynamic>)
          .map((e) => PokemonListItem.fromJson(e))
          .toList()
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'results': results
    };
  }
}

class PokemonListItem {
  final String name;
  final String url;

  PokemonListItem({
    required this.name,
    required this.url
  });

  factory PokemonListItem.fromJson(Map<String, dynamic> json) {
    return PokemonListItem(
      name: json['name'],
      url: json['url']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url
    };
  }
}