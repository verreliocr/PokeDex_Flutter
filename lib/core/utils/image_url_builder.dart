class ImageUrlBuilder {
  final String baseUrl;

  ImageUrlBuilder(this.baseUrl);

  String pokemonArtwork(int id) => '$baseUrl/pokemon/other/official-artwork/$id.png';
  String pokemonGif(int id) => '$baseUrl/pokemon/other/showdown/$id.gif';
  String pokemonSprites(int id) => '$baseUrl/$id.png';
  String items(int id) => '$baseUrl/item/$id.png';
}