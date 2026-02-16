import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/network/api_client.dart';
import 'package:pokedex_flutter/data/repositories/pokemon_repository.dart';
import 'package:pokedex_flutter/domain/use_cases/get_pokemon_list_uc.dart';
import 'package:pokedex_flutter/presentation/screens/pokemon_detail/pokemon_detail_screen.dart';
import 'package:pokedex_flutter/presentation/screens/pokemon_list/pokemon_list_body.dart';
import 'package:pokedex_flutter/presentation/view_models/pokemon_view_model.dart';
import 'package:provider/provider.dart';

class PokemonListScreen extends StatelessWidget {
  const PokemonListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PokemonViewModel(
        GetPokemonListUC(
          PokemonRepository(apiClient: ApiClient()),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text("PokeDex")),
        body: PokemonListBody(
          onItemTap: (name) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => PokemonDetailScreen(name: name),
              ),
            );
          },
        ),
      ),
    );
  }
}