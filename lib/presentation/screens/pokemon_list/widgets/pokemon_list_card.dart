import 'package:flutter/material.dart';
import 'package:pokedex_flutter/data/models/pokemon_list_model.dart';

class PokemonListCard extends StatelessWidget {
  final PokemonListItem pokemon;

  const PokemonListCard({
    super.key,
    required this.pokemon
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(pokemon.name),
      ),
    );
  }
}