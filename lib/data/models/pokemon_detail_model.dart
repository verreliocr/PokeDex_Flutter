class PokemonDetail {
  final int id;
  final String name;

  PokemonDetail({
    required this.id,
    required this.name
  });

  factory PokemonDetail.fromJson(Map<String, dynamic> json) {
    return PokemonDetail(
        id: json['id'],
        name: json['name']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name
    };
  }
}