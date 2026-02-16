import 'package:flutter/cupertino.dart';
import 'package:pokedex_flutter/core/config/env_config.dart';
import 'package:pokedex_flutter/core/utils/image_url_builder.dart';
import 'package:pokedex_flutter/core/utils/string_ext.dart';
import 'package:pokedex_flutter/data/models/pokemon_detail_model.dart';
import 'package:pokedex_flutter/domain/use_cases/get_pokemon_detail_uc.dart';

class PokemonDetailViewModel extends ChangeNotifier {

  final GetPokemonDetailUC getPokeDetail;
  final String name;

  PokemonDetailViewModel(
      this.getPokeDetail,
      this.name
      );

  PokemonDetail? pokeDetail;
  bool isLoading = false;
  String? error;

  //Get Pokemon Detail Data
  Future<void> fetchPokeDetailData() async {
    isLoading = true;
    error = null;

    notifyListeners();

    try {
      pokeDetail = await getPokeDetail.call(name);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  String get pokemonName {
    if (pokeDetail == null) return '';

    return pokeDetail!.name.formatPokemonName();
  }

  String get imageUrl {
    if (pokeDetail == null) return '';
    
    return ImageUrlBuilder(EnvConfig.baseImageUrl).pokemonArtwork(pokeDetail!.id);
  }
  
  List<String> get types {
    if (pokeDetail == null) return [];
    
    return pokeDetail!.types.map((e) => e.type.name.capitalized()).toList();
  }
}