import 'package:flutter/material.dart';
import 'package:pokedex_flutter/data/models/pokemon_list_model.dart';

class PokemonListCard extends StatelessWidget {
  final PokemonListItem pokemon;
  final VoidCallback onTap;

  const PokemonListCard({
    super.key,
    required this.pokemon,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(pokemon.name),
        onTap: onTap,
      ),
    );
  }
}