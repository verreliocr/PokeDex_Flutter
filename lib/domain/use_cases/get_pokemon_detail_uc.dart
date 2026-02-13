import 'package:pokedex_flutter/data/models/pokemon_detail_model.dart';
import 'package:pokedex_flutter/data/repositories/pokemon_repository.dart';

class GetPokemonDetailUC {
  final PokemonRepository pokeRepo;

  GetPokemonDetailUC(this.pokeRepo);
  
  Future<PokemonDetail> call(String name) {
    return pokeRepo.getPokemonDetail(name);
  }
}