import 'package:flutter/material.dart';
import 'package:pokedex_flutter/presentation/view_models/pokemon_detail_view_model.dart';
import 'package:provider/provider.dart';

class PokemonDetailBody extends StatelessWidget {
  const PokemonDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PokemonDetailViewModel>();

    if (viewModel.isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (viewModel.error != null) {
      return Center(child: Text('Error ${viewModel.error}'));
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              viewModel.imageUrl,
              height: 200,
              width: 200,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return const CircularProgressIndicator();
              },
              errorBuilder: (_, _, _) => const Icon(Icons.error),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: viewModel.types.map((type) {
                return Chip(
                  label: Text(type),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );

  }
}