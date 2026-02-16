extension StringExt on String {
  String capitalized() {
    if (isEmpty) return this;

    return this[0].toUpperCase() + substring(1);
  }

  String formatPokemonName() {
    if (isEmpty) return this;

    if (endsWith('-m')) {
      final base = replaceAll('-m', '');

      return '${base.capitalized()} ♂';
    }

    if (endsWith('-f')) {
      final base = replaceAll('-f', '');

      return '${base.capitalized()} ♀';
    }

    return capitalized();
  }
}