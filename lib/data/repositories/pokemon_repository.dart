import 'package:pokedex_flutter/core/network/api_client.dart';
import 'package:pokedex_flutter/core/network/api_constant.dart';
import 'package:pokedex_flutter/data/models/pokemon_detail_model.dart';
import 'package:pokedex_flutter/data/models/pokemon_list_model.dart';

class PokemonRepository {
  final ApiClient apiClient;

  PokemonRepository({
    required this.apiClient
  });

  //Get Pokemon List
  Future<List<PokemonListItem>> getPokemonList(int limit, int offset) async {
    try {
      final response = await apiClient.get(
        ApiConstant.pokemonList,
        queryParams: {
          'limit': limit,
          'offset': offset
        }
      );

      final pokeList = PokemonList.fromJson(response.data);

      return pokeList.results;
    } catch {
      throw Exception('Failed to get pokemons data: $e');
    }
  }

  //Get Pokemon Detail
  Future<PokemonDetail> getPokemonDetail(String name) async {
    try {
      final response  = await apiClient.get(
        ApiConstant.pokemonDetail.replaceFirst('{name}', name)
      );

      return PokemonDetail.fromJson(response.data);
    } catch {
      throw Exception('Failed to get pokemon data: $e');
    }
  }
}