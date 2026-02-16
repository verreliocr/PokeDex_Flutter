class PokemonDetail {
  final int id;
  final String name;
  final List<PokemonType> types;

  PokemonDetail({
    required this.id,
    required this.name,
    required this.types
  });

  factory PokemonDetail.fromJson(Map<String, dynamic> json) {
    return PokemonDetail(
      id: json['id'],
      name: json['name'],
      types: (json['types'] as List<dynamic>)
          .map((e) => PokemonType.fromJson(e))
          .toList()
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'types': types
    };
  }
}

class PokemonType {
  final int slot;
  final PokemonTypeItem type;

  PokemonType({
    required this.slot,
    required this.type
  });

  factory PokemonType.fromJson(Map<String, dynamic> json) {
    return PokemonType(
      slot: json['slot'],
      type: PokemonTypeItem.fromJson(json['type']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'slot': slot,
      'type': type
    };
  }
}

class PokemonTypeItem {
  final String name;

  PokemonTypeItem({required this.name});

  factory PokemonTypeItem.fromJson(Map<String, dynamic> json) {
    return PokemonTypeItem(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name
    };
  }
}