import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstant {
  static String baseUrl = dotenv.env['BASE_URL'] ?? '';
  static String baseImageUrl = dotenv.env['BASE_IMAGE_URL'] ?? '';

  //Data
  static const String pokemonList = 'pokemon';
  static const String pokemonDetail = 'pokemon/{name}';

  //Images
  static const String pokemonSprites = 'pokemon/{id}.png'
  static const String pokemonArtwork = 'pokemon/other/official-artwork/{id}.png'
  static const String pokemonGif = 'pokemon/other/showdown/{id}.gif'
  static const String items = 'item/{id}.png'
}