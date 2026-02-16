import 'package:flutter/cupertino.dart';
import 'package:pokedex_flutter/data/models/pokemon_list_model.dart';
import 'package:pokedex_flutter/core/utils/string_ext.dart';
import 'package:pokedex_flutter/domain/use_cases/get_pokemon_list_uc.dart';

class PokemonViewModel extends ChangeNotifier {

  final GetPokemonListUC getPokeList;

  PokemonViewModel(
      this.getPokeList
      );

  int currentOffset = 0;
  final int limit = 20;

  final List<PokemonListItem> pokeList = [];

  String? error;

  bool isLoading = false;
  bool hasMore = true;

  //Get Pokemon List Data
  Future<void> fetchPokeListData() async {
    if (isLoading || !hasMore) return;

    isLoading = true;
    error = null;

    notifyListeners();

    try {
      final newList = await getPokeList.call(limit, currentOffset);

      if (newList.isEmpty) {
        hasMore = false;
      } else {
        pokeList.addAll(newList);
        currentOffset += limit;
      }

    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  List<String> get pokemonNames {
    return pokeList.map((pokemon) => pokemon.name.formatPokemonName()).toList();
  }
}