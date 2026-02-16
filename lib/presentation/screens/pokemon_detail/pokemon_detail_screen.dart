import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/network/api_client.dart';
import 'package:pokedex_flutter/data/repositories/pokemon_repository.dart';
import 'package:pokedex_flutter/domain/use_cases/get_pokemon_detail_uc.dart';
import 'package:pokedex_flutter/presentation/view_models/pokemon_detail_view_model.dart';
import 'package:provider/provider.dart';

class PokemonDetailScreen extends StatelessWidget {

  final String name;

  const PokemonDetailScreen({
    super.key,
    required this.name
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PokemonDetailViewModel(
          GetPokemonDetailUC(PokemonRepository(apiClient: ApiClient())),
          name
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(name),
        ),
        body: const Center(
          child: Text("Detail Screen"),
        ),
      ),
    );
  }
}