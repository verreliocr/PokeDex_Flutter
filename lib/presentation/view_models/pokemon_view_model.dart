import 'package:flutter/cupertino.dart';
import 'package:pokedex_flutter/data/models/pokemon_list_model.dart';
import 'package:pokedex_flutter/domain/use_cases/get_pokemon_list_uc.dart';

class PokemonViewModel extends ChangeNotifier {
  final GetPokemonListUC getPokeList;

  PokemonViewModel(
      this.getPokeList
      );

  List<PokemonListItem> pokeList = [];
  int currentOffset = 0;
  int limit = 10;
  String? error;

  //Get Pokemon List Data
  Future<void> fetchPokeListData() async {
    notifyListeners();

    try {
      final newList = await getPokeList.call(limit, currentOffset);

      pokeList.addAll(newList);

      if (newList.length == 10) {
        currentOffset += 10;
      }
    } catch (e) {
      error = e.toString();
    } finally {
      notifyListeners();
    }
  }
}