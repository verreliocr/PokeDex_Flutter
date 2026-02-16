import 'package:flutter/material.dart';

class PokemonListCard extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  const PokemonListCard({
    super.key,
    required this.name,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(name),
        onTap: onTap,
      ),
    );
  }
}