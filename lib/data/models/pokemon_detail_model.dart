class PokemonDetail {
  final int id;
  final String name;

  PokemonDetail({
    this.id,
    this.name
  });

  factory PokemonDetail.fromJson(Map<String, dynamic> json) {
    return PokemonDetail(
        id: json['id'],
        results: json['name']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name
    }
  }
}