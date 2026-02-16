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
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PokemonViewModel>().fetchPokeListData();
    });

    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 200) {
        context.read<PokemonViewModel>().fetchPokeListData();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PokemonViewModel>();

    if (viewModel.error != null) {
      return Center(child: Text('Error ${viewModel.error}'));
    }

    return ListView.builder(
        controller: scrollController,
        itemCount: viewModel.pokeList.length + (viewModel.hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < viewModel.pokeList.length) {
            final pokemonId = viewModel.pokeList[index].name;
            final displayName = viewModel.pokemonNames[index];

            return PokemonListCard(
                name: displayName,
                onTap: () => widget.onItemTap(pokemonId)
            );
          } else {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator())
            );
          }

        });
  }
}