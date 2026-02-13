import 'package:pokedex_flutter/data/models/pokemon_list_model.dart';
import 'package:pokedex_flutter/data/repositories/pokemon_repository.dart';

class GetPokemonListUC {
  final PokemonRepository pokeRepo;

  GetPokemonListUC(this.pokeRepo);

  Future<List<PokemonListItem>> call(int limit, int offset) {
    return pokeRepo.getPokemonList(limit, offset);
  }
}