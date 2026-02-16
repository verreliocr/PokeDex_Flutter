import 'package:flutter/material.dart';
import 'package:pokedex_flutter/presentation/screens/pokemon_list/widgets/pokemon_list_card.dart';
import 'package:pokedex_flutter/presentation/view_models/pokemon_view_model.dart';
import 'package:provider/provider.dart';

class PokemonListBody extends StatefulWidget {
  final Function(String) onItemTap;

  const PokemonListBody({
    super.key,
    required this.onItemTap
  });

  @override
  State<PokemonListBody> createState() => _PokemonListBodyState();
}

class _PokemonListBodyState extends State<PokemonListBody> {
  
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PokemonViewModel>().fetchPokeListData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PokemonViewModel>();

    if (viewModel.error != null) {
      return Center(child: Text('Error ${viewModel.error}'));
    }

    return ListView.builder(
        itemCount: viewModel.pokeList.length,
        itemBuilder: (context, index) {
          final pokemon = viewModel.pokeList[index];

          return PokemonListCard(
              pokemon: pokemon,
              onTap: () => widget.onItemTap(pokemon.name)
          );
        });
  }
}