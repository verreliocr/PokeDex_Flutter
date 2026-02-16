import 'package:flutter/cupertino.dart';
import 'package:pokedex_flutter/data/models/pokemon_detail_model.dart';
import 'package:pokedex_flutter/domain/use_cases/get_pokemon_detail_uc.dart';

class PokemonDetailViewModel extends ChangeNotifier {

  final GetPokemonDetailUC getPokeDetail;
  final String name;

  PokemonDetailViewModel(
      this.getPokeDetail,
      this.name
      );

  PokemonDetail? selectedPokeDetail;

  String? error;

  //Get Pokemon Detail Data
  Future<void> fetchPokeDetailData() async {
    notifyListeners();

    error = null;

    try {
      selectedPokeDetail = await getPokeDetail.call(name);
    } catch (e) {
      error = e.toString();
    } finally {
      notifyListeners();
    }
  }
}